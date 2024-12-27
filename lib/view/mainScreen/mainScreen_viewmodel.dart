import 'package:stacked/stacked.dart';

class MainscreenViewmodel extends BaseViewModel{
  int currentIndex=0;
  void onBottomNavTap(int value){
    currentIndex=value;
    notifyListeners();
  }
}