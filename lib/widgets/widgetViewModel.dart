import 'package:stacked/stacked.dart';

class Widgetcontroller extends BaseViewModel {
  
  bool textIsobscure=true;

  void isObscure(){
    textIsobscure=!textIsobscure;
    notifyListeners();

  }
}