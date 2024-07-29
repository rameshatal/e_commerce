import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../contrroller/product_controller.dart';



class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});


  @override
  Widget build(BuildContext context) {
    // final ImageController imageController = Get.put(ImageController());
    final ProductController productController  = Get.put(ProductController());


    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFE1E1E1),
        appBar: AppBar(
          backgroundColor: Color(0xFFE1E1E1),
          leading: Padding(
            padding: const EdgeInsets.only(top: 10, left: 15),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
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
            'Details Products',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 15),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(Icons.more_horiz_outlined),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            /*Container(
              height: MediaQuery.of(context).size.height * .3,
              child: Column(
                children: [
                  Expanded(
                    child: Obx(() {
                      if (imageController.images.isEmpty) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return Image.network(
                          imageController
                              .images[imageController.selectedIndex.value],
                          fit: BoxFit.contain,
                        );
                      }
                    }),
                  ),
                  SizedBox(
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Obx(() {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: imageController.images.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                imageController.setSelectedIndex(index);
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: imageController.selectedIndex.value ==
                                          index
                                      ? Colors
                                          .orangeAccent // Change color for the selected item
                                      : Color(0xFFEFEFEF),
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        imageController.images[index]),
                                    fit: BoxFit.contain,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            );
                          },
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),*/
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Nike Blazer Mid'77",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Women's Shoes"),
                          Obx(
                                () => GestureDetector(
                              onTap: () {
                                productController.toggleFavorite();
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Icon(productController.isFavorite.value ? Icons.favorite : Icons.favorite_border_rounded,
                                  color: productController.isFavorite.value
                                      ? Colors.red
                                      : Colors.black,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "\$100  ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: "\$100",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                            6,
                                (index) => GestureDetector(
                              onTap: () {productController.selectItem(index);
                              },
                              child: Obx(() {
                                return Container(
                                  margin: EdgeInsets.only(right: 10),
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: productController.selectedIndex.value == index ? Colors.orangeAccent : Colors.white,
                                    border: Border.all(color: Color(0xFFF5F5F6)),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(child: Text('30')),
                                );
                              }),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Nike Air cushioning is a lightweight, durable and industry-leading innovation that absorbs impact and shifts energy back into performance, all in Nike Air cushioning is a lightweight, durable and industry-leading innovation that absorbs impact and shifts energy back into performance, all in Nike Air cushioning is a lightweight, durable and industry-leading innovation that absorbs impact and shifts energy back into performance, all in Nike Air cushioning is a lightweight, durable and industry-leading innovation that absorbs impact and shifts energy back into performance, all in...",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(height: 5, color: Color(0xFFF5F5F6)),
                      SizedBox(
                        height: 60,
                        child: Row(
                          children: [
                            Flexible(
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: List.generate(
                                  4,
                                      (index) => Obx(
                                        () => GestureDetector(
                                      onTap: () => productController.selectItem(index),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: productController.selectedIndex.value == index ? Colors.blue : Colors.red,
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSU0fRRMAU1mafBUkTglwj7n9XeLm7hfFgzR7wJxjf458HeeNCdTYRbOuLBDQ&s'),
                                            fit: BoxFit.cover,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Text(
                              "10.000+ people favorite this",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          children: [
                            Container(
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
                                  Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: InkWell(
                                      onTap: productController.decrement,
                                      child: Center(
                                        child: Icon(Icons.minimize_rounded),
                                      ),
                                    ),
                                  ),
                                  Obx(
                                        () => Text(
                                      '${productController.counter}',
                                      style: TextStyle(fontSize: 25),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.circle,
                                    ),
                                    child: InkWell(
                                      onTap: productController.increment,
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  // Add button action
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                ),
                                child: Text(
                                  'Add to cart',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
