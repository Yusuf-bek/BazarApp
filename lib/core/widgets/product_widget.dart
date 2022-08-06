import 'package:bazarapp/core/components/size_config.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      width: getConfigWidth(196),
      height: getConfigHeight(242),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.blue,
                height: getConfigHeight(79),
                width: getConfigWidth(100),
              ),
              SizedBox(
                width: double.infinity,
                height: getConfigHeight(20),
              ),
              const Text(
                "Paprika",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              const Text(
                "Vegshop",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff696974)),
              ),
              SizedBox(
                width: double.infinity,
                height: getConfigHeight(20),
              ),
              SizedBox(
                height: getConfigHeight(36),
                width: getConfigWidth(156),
                child: Row(
                  children: const [
                    Text(
                      "\$6.4/Kg",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
