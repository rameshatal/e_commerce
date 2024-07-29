import 'package:flutter/material.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color(0XFF000000),
          child: Column(
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(150)),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://images.playground.com/2d476fe320354de8a85633bfed7a763e.jpeg'),
                        fit: BoxFit.cover),
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 15)]),
              ),
              SizedBox(height: 11),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Signup',
                    style: TextStyle(
                        fontSize: 31,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  SizedBox(height: 11),
                  Text(
                    'Email',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                        color: Color(0xff4F4F4F)),
                  ),
                  Form(
                      child: Container(
                        width: 300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              controller: emailController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(31),
                                  ),
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(10)),
                            ),
                            SizedBox(height: 11),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Password',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w200,
                                    color: Color(0xff4F4F4F)),
                              ),
                            ),
                            SizedBox(height: 11),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              controller: passwordController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(31),
                                  ),
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(10)),
                            ),
                            SizedBox(height: 11),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Confirm Password',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w200,
                                    color: Color(0xff4F4F4F)),
                              ),
                            ),
                            SizedBox(
                              height: 11,
                            ),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              controller: confPasswordController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(31),
                                  ),
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(10)),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(height: 11),
                ],
              ),
              SizedBox(height: 11),
              AppRoundedButton(
                  onTap: () {},
                  buttonColor: Colors.orange,
                  textColor: Color(0XFF000000),
                  title: 'Sign in'),
              SizedBox(height: 11),
              SizedBox(height: 11),
              Text(
                "Already Have an Account?",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                    color: Colors.white),
              ),
              SizedBox(height: 11),
              InkWell(
                  onTap: () {},
                  child: Text(
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

class AppRoundedButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color buttonColor;
  final Color textColor;
  String title;
  AppRoundedButton({
    super.key,
    required this.onTap,
    required this.buttonColor,
    required this.textColor,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: buttonColor,
          // shape: BoxShape.circle
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w300, color: textColor),
          ),
        ),
      ),
    );
  }
}
