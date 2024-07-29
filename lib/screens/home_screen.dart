import 'package:e_commerce/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../contrroller/bottombar_controller/bottom_navigation_controller.dart';
import '../contrroller/home_controller.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    final BottomNavigationController bottomNavigationController =
        Get.put(BottomNavigationController());
    final screen = [
      const HomeScreen(),
      const ProductDetailScreen(),
      const CartScreen(),
    ];
    RxInt selectedIndex = 0.obs;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 10, left: 15),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFF6F6F6),
            ),
            child: Icon(Icons.menu_outlined),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Shopink',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 15),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF6F6F6),
              ),
              child: Icon(Icons.notifications),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.4), blurRadius: 10)
                  ],
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSePtLIPd2D4oPWU98LYhJW37GaVIi5CYByBCUyTwY-2sjQNRR1yfn4zEaAm6dvts7D-Xw&usqp=CAU'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed('/b');
                    },
                    child: Text(
                      'New Arrival',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 200,
                      width: 150,
                      margin: EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 80,
                            width: 130,
                            decoration: BoxDecoration(
                              color: Color(0xFFF6F6F6),
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://eabbntop.shop/wp-content/uploads/1712/58/zoomblazerlowprogtnikesbmakeafashionstatement2.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Nike Blazer Low'77 Jumbo",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Women's Shoes",
                              style: TextStyle(
                                color: Color(0xFFCECFD3),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\$120.11",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Obx(() {
                                  return InkWell(
                                    onTap: () {
                                      homeController.toggleFavorite(
                                          index); // Toggle favorite status for the item at the current index
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            homeController.favoriteStatus[index]
                                                ? Colors.white
                                                : Color(0xFFF6F6F6),
                                      ),
                                      child: Icon(
                                        homeController.favoriteStatus[index]
                                            ? Icons.favorite
                                            : Icons.favorite_border_outlined,
                                        size: 20,
                                        color: Colors.red,
                                      ),
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Best Seller',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Obx(() {
                      return InkWell(
                        onTap: () {
                          homeController.selectItem(
                              index); // Update selected index on tap
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: homeController.selectedIndex.value == index
                                ? Colors
                                    .orangeAccent // Change color if item is selected
                                : Color(0xFFF6F6F6),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'All Beat Products',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: homeController.selectedIndex.value ==
                                          index
                                      ? Colors
                                          .white // Change text color if item is selected
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 5,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
                itemBuilder: (context, index) {
                  return Obx(() => Container(
                        height: 110,
                        decoration: BoxDecoration(
                          color: Color(0xFFF6F6F6),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 10),
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFFF6F6F6),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      homeController
                                          .toggleFavoriteStatus(index);
                                    },
                                    child: Center(
                                      child: Icon(
                                        homeController.isFavorite(index)
                                            ? Icons.favorite
                                            : Icons.favorite_border_outlined,
                                        size: 20,
                                        color: homeController.isFavorite(index)
                                            ? Colors.red
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Image.network(
                              'https://parspng.com/wp-content/uploads/2023/02/shoespng.parspng.com-12.png',
                              height:
                                  100, // Set a specific height for the image
                              width: double
                                  .infinity, // Set a specific width for the image
                              fit: BoxFit.cover, // Optionally adjust the fit
                            ),
                          ],
                        ),
                      ));
                },
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            selectedLabelStyle: TextStyle(fontSize: 10),
            unselectedLabelStyle: TextStyle(fontSize: 10),
            showSelectedLabels: true,
            type: BottomNavigationBarType.fixed,
            elevation: 5,
            currentIndex: bottomNavigationController.selectedIndex.value,
            onTap: (index) {
              bottomNavigationController.changeIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: 20), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_shopping_cart, size: 20), label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border_outlined, size: 20),
                  label: 'Favorite'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person, size: 20), label: 'Person'),
            ],
          )),
    );
  }
}
