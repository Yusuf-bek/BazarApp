import 'package:bazarapp/core/components/gradient_text.dart';
import 'package:bazarapp/core/components/my_styles.dart';
import 'package:bazarapp/core/extensions/buildcontext_extension.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double _mainHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    _mainHeight = context.height - MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top,
            ),
            SizedBox(
              height: _mainHeight * 0.3,
              child: GradientText(
                text: "BazarApp",
                textStyle: MainPageStyles.instance.appNameStyle,
              ),
            ),
            Container(
              height: _mainHeight * 0.7,
              decoration: const BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: _mainHeight * 0.3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _Grid_View(
                          url: "report-page",
                          color: const Color(0xFFC7B6F9),
                          imgUrl: "assets/report.png",
                          title: "Hisobotlar",
                        ),
                        _Grid_View(
                          url: "",
                          color: const Color(0xFFFFDAEB),
                          imgUrl: "assets/pay.png",
                          title: "To'lovlar",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _mainHeight * 0.3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _Grid_View(
                          url: "",
                          color: const Color(0xFFFDF1A9),
                          imgUrl: "assets/shop.png",
                          title: "Mahsulotlar",
                        ),
                        _Grid_View(
                          url: "",
                          color: const Color(0xFFDAF7FF),
                          imgUrl: "assets/report.png",
                          title: "Sozlamalar",
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  InkWell _Grid_View({
    required String url,
    required Color color,
    required String imgUrl,
    required String title,
  }) {
    return InkWell(
      onTap: () {
        if (url != "") {
          Navigator.of(context).pushNamed(url);
        }
      },
      child: Container(
        width: context.width * 0.38,
        height: context.height * 0.22,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: context.width,
                child: Image.asset(
                  imgUrl,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Text(
                title,
                style: MainPageStyles.instance.categoryTitleStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
