import 'package:get/get.dart';

enum PageName { HOME, SEARCH, SAVE, MYPAGE }

class BottmNavController extends GetxController {
  RxInt pageIndex = 0.obs;

  void changeBottomNav(int value) {
    var page = PageName.values[value];

    switch (page) {
      case PageName.HOME:
        break;
      case PageName.SEARCH:
        break;
      case PageName.SAVE:
        break;
      case PageName.MYPAGE:
        break;
    }

    pageIndex(value);
  }
}
