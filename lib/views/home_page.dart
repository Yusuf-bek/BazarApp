import 'package:bazarapp/core/components/gradient_text.dart';
import 'package:bazarapp/core/components/size_config.dart';
import 'package:bazarapp/core/widgets/product_widget.dart';
import 'package:bazarapp/core/widgets/row_see_all.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              appNameSearchContainer(context),
              SizedBox(
                height: getConfigHeight(30),
              ),
              chooseCategoryContainer(context),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getConfigWidth(20),
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: getConfigHeight(371),
                  child: Column(
                    children: [
                      RowSeeAllWidget(title: "Best selling"),
                      SizedBox(
                        height: getConfigHeight(16),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: getConfigHeight(242),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  right: getConfigWidth(12),
                                ),
                                child: const ProductWidget(),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container chooseCategoryContainer(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      height: getConfigHeight(215),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RowSeeAllWidget(title: "Choose category"),
          SizedBox(
            height: getConfigHeight(134),
            width: double.infinity,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Container(
                    width: getConfigWidth(123),
                    height: getConfigHeight(134),
                    decoration: BoxDecoration(
                      color: Colors.redAccent.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: getConfigWidth(90),
                            height: getConfigHeight(70),
                            color: Colors.green,
                          ),
                          const Text(
                            "name",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Container appNameSearchContainer(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: getConfigHeight(166),
      child: Stack(
        children: [
          Positioned(
            top: getConfigHeight(15),
            left: getConfigWidth(30),
            child: GradientText(
              text: "BazarApp",
              textStyle:
                  const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: MediaQuery.of(context).size.width - 30,
              height: getConfigHeight(48),
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  topLeft: Radius.circular(25),
                ),
              ),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(Icons.search),
                    ),
                    Text("Search"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
