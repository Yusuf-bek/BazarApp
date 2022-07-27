import 'package:bazarapp/core/components/size_config.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.amber,
              width: MediaQuery.of(context).size.width,
              height: getConfigHeight(414),
            ),
            Container(
              color: Colors.red,
              width: MediaQuery.of(context).size.width,
              height: getConfigHeight(414),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
