import 'dart:convert';
import 'dart:io';
import 'package:bazarapp/core/components/my_styles.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bazarapp/core/components/size_config.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isNotVisible = true;
  bool _isLoading = false;
  String _username = "";
  String _password = "";

  void _login() async {
    setState(() {
      _isLoading = true;
    });
    final _prefs = await SharedPreferences.getInstance();
    const url = 'http://cashapp.kamtar.uz/api/token/';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: {"username": _username, "password": _password},
      );
      print(response.body);
      var resBody = json.decode(response.body);
      if (response.statusCode != 200) {
        throw HttpException;
      } else {
        _prefs.setString("access", resBody["access"]);
        _prefs.setString("refresh", resBody["refresh"]);
        Navigator.of(context).pushReplacementNamed("main-page");
      }
    } catch (error) {
      print(error);
      rethrow;
    }

    // int status = await Provider.of<Auth>(ctn, listen: false)
    //     .login(_username, _password);
    // if (status == 0) {
    //   Navigator.of(context).pushReplacementNamed("main-page");
    // } else {}

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "assets/login_page.gif",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: getConfigWidth(30),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Login",
                                style: LoginPageStyles.instance.pageHeadlineStyle,
                              ),
                            ],
                          ),
                          Container(
                            color: Colors.white,
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.16,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.account_circle_outlined,
                                        color: Colors.grey),
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
                                          ),
                                          keyboardType: TextInputType.name,
                                          onChanged: (val) {
                                            _username = val;
                                          },
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
                                    Expanded(
                                      child: SizedBox(
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            hintText: "parol",
                                            hintStyle: LoginPageStyles
                                                .instance.myHintTextStyle,
                                          ),
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          obscureText: _isNotVisible,
                                          onChanged: (val) {
                                            _password = val;
                                          },
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _isNotVisible = !_isNotVisible;
                                        });
                                      },
                                      icon: Icon(
                                        _isNotVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          _isLoading
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : loginButton(context, onTap: () {
                                  _login();
                                }),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
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
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.07,
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
