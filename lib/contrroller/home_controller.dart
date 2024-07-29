import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';

class HomeController extends GetxController {
  RxList favoriteStatus = List<bool>.generate(5, (index) => false).obs;



  void toggleFavorite(int index) {
    favoriteStatus[index] = !favoriteStatus[index];
  }

  RxInt selectedIndex = (-1).obs;
  RxList favoriteStatus2 = List<bool>.generate(5, (index) => false).obs;

  void selectItem(int index) {
    selectedIndex.value = index;
  }
  RxList favoriteStatus3 = <int>[].obs;

  void toggleFavoriteStatus(int index) {
    if (favoriteStatus3.contains(index)) {
      favoriteStatus3.remove(index);
    } else {
      favoriteStatus3.add(index);
    }
  }

  bool isFavorite(int index) {
    return favoriteStatus3.contains(index);
  }

  @override
  void onInit() {
    for(int i=0;i<5;i++){

    }
    super.onInit();
  }
}

