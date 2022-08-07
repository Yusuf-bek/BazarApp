import 'package:flutter/material.dart';

import '../core/components/gradient_text.dart';
import '../core/components/size_config.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double _mainHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    _mainHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewPadding.top;
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
                textStyle:
                const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: _mainHeight * 0.7,
              decoration: const BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40)),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: _mainHeight * 0.3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _Grid_View(150, const Color(0xFFC7B6F9),
                            "assets/report.png", "Hisobotlar"),
                        _Grid_View(150, const Color(0xFFFFDAEB),
                            "assets/pay.png", "To'lovlar"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _mainHeight * 0.3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _Grid_View(150, const Color(0xFFFDF1A9),
                            "assets/shop.png", "Mahsulotlar"),
                        _Grid_View(150, const Color(0xFFDAF7FF),
                            "assets/report.png", "Sozlamalar"),
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

  Widget _Grid_View(double h, Color color, String imgUrl, String title) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      height: h,
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
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                imgUrl,
                fit: BoxFit.fitHeight,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
