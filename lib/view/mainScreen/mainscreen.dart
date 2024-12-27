import 'package:flutter/material.dart';
import 'package:my_leo/utils/constants/color_constants.dart';
import 'package:my_leo/utils/data/buildDatas.dart';
import 'package:my_leo/view/mainScreen/mainScreen_viewmodel.dart';
import 'package:stacked/stacked.dart';

class Mainscreen extends StatelessWidget {
  const Mainscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => MainscreenViewmodel(),
      builder: (context, viewModel, child) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            currentIndex: viewModel.currentIndex,
            onTap: (value) {
              viewModel.onBottomNavTap(value);
            },
            selectedItemColor: ColorConstants.primaryColor,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_work_rounded), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.attach_money_outlined), label: 'Expense'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.app_registration), label: 'Notes'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ]),
        body: screenList[viewModel.currentIndex],
      ),
    );
  }
}
