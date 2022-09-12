import 'package:bazarapp/core/components/my_styles.dart';
import 'package:bazarapp/core/extensions/buildcontext_extension.dart';
import 'package:bazarapp/core/components/size_config.dart';
import 'package:bazarapp/providers/hide_unhide_password_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _parolController = TextEditingController();

  final _loginFormKey = GlobalKey<FormState>();
  final _parolFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: context.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                //Gif
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
                //Login<headline>
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: context.width * 0.1,
                    ),
                    Text(
                      "Login",
                      style: LoginPageStyles.instance.pageHeadlineStyle,
                    ),
                  ],
                ),
                SizedBox(
                  width: context.width,
                  height: context.height * 0.35,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.account_circle_outlined,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            SizedBox(
                              width: context.width * 0.7,
                              height: context.height * 0.1,
                              child: Form(
                                key: _loginFormKey,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.length < 5) {
                                      return "Login kiritilmagan yoki qisqa";
                                    }
                                    return null;
                                  },
                                  controller: _loginController,
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
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                              return SizedBox(
                                width: context.width * 0.7,
                                height: context.height * 0.1,
                                child: Form(
                                  key: _parolFormKey,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.length < 5) {
                                        return "Parol qisqa";
                                      }
                                    },
                                    controller: _parolController,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
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
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: hidePasswordProvider.isVisible,
                                    onChanged: (val) {},
                                  ),
                                ),
                              );
                            })
                          ],
                        ),
                      ]),
                ),
                loginButton(context, onTap: () {
                  if (_loginFormKey.currentState!.validate() &&
                      _parolFormKey.currentState!.validate()) {
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Sike thats the wrong number'),
                      ),
                    );
                  }
                  if (3 == 2) {
                    _loginController.dispose();
                    _parolController.dispose();
                  }
                }),
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
