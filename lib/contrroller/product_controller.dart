import 'package:get/get.dart';

class ProductController extends GetxController {
  var selectedIndex = 0.obs;

  void setSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  var counter = 0.obs;

  void increment() {
    counter.value++;
  }

  void decrement() {
    if (counter.value > 0) {
      counter.value--;
    }
  }

  var isFavorite = false.obs;

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  void selectItem(int index) {
    selectedIndex.value = index;
  }
  var selectedItemIndex = (-1).obs;

  void selectItemNumber(int index) {
    selectedIndex.value = index;
  }
  var selectedImageIndex = 0.obs;

  void selectImageItem(int index) {
    selectedImageIndex.value = index;
  }
}

