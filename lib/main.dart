import 'package:e_commerce/screens/cart_screen.dart';
import 'package:e_commerce/screens/home_screen.dart';
import 'package:e_commerce/screens/product_detail_screen.dart';
import 'package:e_commerce/view/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/LoginPage',
      getPages: [
        GetPage(name: "/HomeScreen", page: () =>  const HomeScreen(),),
        GetPage(name: "/ProductDetailScreen", page: () => const ProductDetailScreen(),),
        GetPage(name: "/CartScreen", page: () => const CartScreen(),),
        GetPage(name: "/LoginPage", page: () => const LoginScreen(),),
      ],

      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: LoginScreen(),
    );
  }
}
