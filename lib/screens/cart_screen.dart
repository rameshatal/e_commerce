import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../contrroller/cart_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartCountController cartCountController = Get.put(CartCountController());
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 10, left: 15),
          child: Container(
            decoration:
            BoxDecoration(shape: BoxShape.circle, color: Color(0xFFE1E1E1)),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'My Cart',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              // Your action here
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 10, right: 15),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFE1E1E1)),
                child: Icon(Icons.more_horiz_outlined),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          ...List.generate(5, (index) {
            RxInt itemCount = 0.obs;
            return Column(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 15),
                        child: Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsZxvxElalURyULalxPvSJyhBldPg44I-1mQ&usqp=CAU'),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      SizedBox(width: 10), // Add spacing between image and text
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Nike Blazer Mid'77",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Text("Women's Shoes"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\$100.99",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Container(
                                    height: 40,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF4F4F4),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            --itemCount.value;
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                                child: Icon(Icons.remove,
                                                    color: Colors.black)),
                                          ),
                                        ),
                                        Obx(
                                              () => Text(
                                            '${itemCount.value}',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            ++itemCount.value;
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                                child: Icon(Icons.add,
                                                    color: Colors.white)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 2,
                  color: Color(0xFFF1F2F4),
                ),
              ],
            );
          }),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Subtotal:",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "\800.00",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Delivery Free:",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "\10.00",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Discount:",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "10%",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.red),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(100, (index) => Container(height: 1,width: 10,color: Colors.grey,margin: EdgeInsets.only(right: 5),)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
