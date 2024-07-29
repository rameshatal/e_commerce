import 'dart:convert';
import 'dart:io';

import 'package:e_commerce/view/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextController = TextEditingController(text: "admin-deorwine_dev@gmail.com".toString());
  TextEditingController passwordTextController = TextEditingController(text: "Admin@123".toString());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String emailError = '';
  String passwordError = '';

  void loginTap() async {
    try {
      http.Response response = await http.post(
          Uri.parse(
              'http://172.105.41.132/buildithome/public/api/v1/admin/login'),
          body: jsonEncode({
            'email': emailTextController.text,
            'password': passwordTextController.text
          }),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          });
      Map<String, dynamic> apiData = jsonDecode(response.body);
      print(apiData);
      print(response.statusCode);
      if (response.statusCode == 200 && apiData['status'] == true) {
        Get.to(HomeScreen());
      } else if (response.statusCode == 404) {
        showSnackBar("Url not found");
      } else if (response.statusCode == 500) {
        showSnackBar("Server not working");
      } else if (response.statusCode == 401 || response.statusCode == 407) {
        showSnackBar("Token not found");
      } else if (response.statusCode == 422) {
        setState(() {
          emailError = apiData.containsKey('errors') ? apiData['errors'].containsKey('email') ? apiData['errors']['email'][0] : "": "";
          passwordError = apiData.containsKey('errors') ? apiData['errors'].containsKey('password') ? apiData['errors']['password'][0] : "": "";
        });
        showSnackBar("Validation error");
      } else {
        showSnackBar(apiData['message']);
      }
    } on http.ClientException {
      showSnackBar("NO internet connection");
    } on SocketException {
      showSnackBar("NO internet connection");
    } catch (e, a) {
      showSnackBar(e.toString());
      print(a);
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  @override
  void initState() {
    // ApiHelper.getProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0XFF000000),
          child: Column(
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(150)),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://img.freepik.com/premium-photo/bright-neon-portrait-girl-glasses-psychedelic-style-young-woman-model-created-by-ai_550060-4872.jpg?w=360'),
                        fit: BoxFit.cover),
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 15)]),
              ),
              const SizedBox(height: 11),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 31,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 11),
                  const Text(
                    'Email',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                        color: Color(0xff4F4F4F)),
                  ),
                  Form(
                    key: formKey,
                    child: Container(
                      width: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextFormField(
                            style: const TextStyle(color: Colors.white),
                            controller: emailTextController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(31),
                              ),
                              isDense: true,
                              contentPadding: const EdgeInsets.all(10),
                              hintText: 'Email',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!RegExp(
                                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
                                  .hasMatch(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 11),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Password',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w200,
                                color: Color(0xff4F4F4F),
                              ),
                            ),
                          ),
                          const SizedBox(height: 11),
                          TextFormField(
                            style: const TextStyle(color: Colors.white),
                            controller: passwordTextController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(31),
                              ),
                              isDense: true,
                              contentPadding: const EdgeInsets.all(10),
                              hintText: 'Password',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (!RegExp(
                                  r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$')
                                  .hasMatch(value)) {
                                return 'Password must be at least 8 characters long, including one letter and one number';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 11),
                          const Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w200,
                                color: Color(0xff4F4F4F),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 11),
                ],
              ),
              const SizedBox(height: 11),
              AppRoundedButton(
                  onTap: () {
                    loginTap();
                  },
                  buttonColor: Colors.orange,
                  textColor: const Color(0XFF000000),
                  title: 'Sign in'),
              const SizedBox(height: 11),
              const Text(
                'or',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Container(
                height: 50,
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.g_mobiledata_outlined,
                        size: 35, color: Colors.orange),
                    Text(
                      'Login with Google',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(31),
                    color: const Color(0XFF0F1011)),
              ),
              const SizedBox(height: 11),
              const Text(
                "Don't Have an Account?",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                    color: Colors.white),
              ),
              const SizedBox(height: 11),
              InkWell(
                  onTap: () {},
                  child: const Text(
                    'Signup',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color(0XFFFC9502)),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
