import 'package:bazarapp/core/components/my_styles.dart';
import 'package:bazarapp/core/extensions/buildcontext_extension.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: context.width,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top,
            ),
            Container(
              height: context.height * 0.1,
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Hisobot turlari",
                      style: ReportPageStyles.instance.hisobotTurlariStyle,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: context.height * 0.9,
              width: context.width * 0.85,
              child: 2 == 2
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : [].isEmpty
                      ? const Center(
                          child: Text("Hich qanday hisobot yo'q"),
                        )
                      : ListView.builder(
                          itemCount: [].length,
                          shrinkWrap: true,
                          itemBuilder: (ctn, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 15.0, bottom: 15.0),
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: index % 4 == 0
                                        ? const Color(0xFFC7B6F9)
                                        : index % 3 == 0
                                            ? const Color(0xFFFFDAEB)
                                            : index % 2 == 0
                                                ? const Color(0xFFFDF1A9)
                                                : const Color(0xFFDAF7FF),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Text([][index].title),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
