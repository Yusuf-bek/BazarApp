import 'package:bazarapp/core/components/gradient_text.dart';
import 'package:bazarapp/core/components/size_config.dart';
import 'package:bazarapp/core/widgets/category_widget.dart';
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
      height: getConfigHeight(550),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RowSeeAllWidget(title: "Choose category"),
          SizedBox(
            height: getConfigHeight(500),
            width: double.infinity,
            child: GridView.builder(
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                mainAxisExtent: 250,
              ),
              itemBuilder: (context, index) {
                return const CategoryWidget();
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
