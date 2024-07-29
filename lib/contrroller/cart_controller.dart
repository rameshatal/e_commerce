import 'package:get/get.dart';

class CartCountController extends GetxController {
  RxList<int> itemsCount = <int>[].obs;

  void increment(int index) {
    itemsCount[index]++;
  }

  void decrement(int index) {
    if (itemsCount[index] > 0) {
      itemsCount[index]--;
    }
  }
  @override
  void onInit() {
    for(int i=0;i<=5;i++){
      itemsCount.add(0);
    }
    super.onInit();
  }
}

/*Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5,left: 15),
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
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Text("Women's Shoes"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("\$100.99",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
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
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        GestureDetector(
                                          onTap: ()=>cartCountController.decrement(index),
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(child: Icon(Icons.remove, color: Colors.black)),
                                          ),
                                        ),
                                        Obx(
                                              () => Text(
                                            '${cartCountController.itemsCount[index]}',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: ()=>cartCountController.increment(index),
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(child: Icon(Icons.add, color: Colors.white)),
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
                ),*/


