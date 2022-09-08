import 'package:bazarapp/core/components/my_styles.dart';
import 'package:bazarapp/core/extensions/buildcontext_extension.dart';
import 'package:bazarapp/core/components/size_config.dart';
import 'package:bazarapp/providers/hide_unhide_password_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("re-drawed");
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: context.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: context.height * 0.4,
                  child: SizedBox(
                    width: context.width,
                    child: Image.asset(
                      "assets/login_page.gif",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(
                  height: context.height * 0.4,
                  child: SizedBox(
                    width: context.width,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: getConfigWidth(30),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Login",
                                style:
                                    LoginPageStyles.instance.pageHeadlineStyle,
                              ),
                            ],
                          ),
                          Container(
                            color: Colors.white,
                            width: double.infinity,
                            height: context.height * 0.15,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.account_circle_outlined,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            hintText: "login",
                                            hintStyle: LoginPageStyles
                                                .instance.myHintTextStyle,
                                            border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(14),
                                              ),
                                            ),
                                          ),
                                          keyboardType: TextInputType.name,
                                          onChanged: (val) {},
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.lock_outline_rounded,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Consumer<HidePasswordProvider>(builder:
                                        (context, hidePasswordProvider, child) {
                                      return Expanded(
                                        child: SizedBox(
                                          child: TextField(
                                            decoration: InputDecoration(
                                              suffixIcon: IconButton(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onPressed: () {
                                                  hidePasswordProvider
                                                      .changeVisibility();
                                                },
                                                icon: Icon(
                                                  hidePasswordProvider.isVisible
                                                      ? Icons.visibility
                                                      : Icons.visibility_off,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              hintText: "parol",
                                              hintStyle: LoginPageStyles
                                                  .instance.myHintTextStyle,
                                              border: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(14),
                                                ),
                                              ),
                                            ),
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            obscureText:
                                                hidePasswordProvider.isVisible,
                                            onChanged: (val) {},
                                          ),
                                        ),
                                      );
                                    })
                                  ],
                                ),
                              ],
                            ),
                          ),
                          loginButton(context, onTap: () {}),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: context.height * 0.1,
                  child: SizedBox(
                    width: context.width,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell loginButton(BuildContext context, {required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: context.width * 0.8,
        height: context.height * 0.07,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.blue,
        ),
        child: const Center(
          child: Text(
            "Kirish",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
