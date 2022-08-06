import 'package:bazarapp/core/components/size_config.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      width: getConfigWidth(123),
      height: getConfigHeight(300),
      decoration: BoxDecoration(
        color: Colors.redAccent.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: getConfigWidth(160),
              height: getConfigHeight(170),
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
    );
  }
}
