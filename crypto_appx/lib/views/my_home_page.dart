import 'package:crypto_appx/views/crypto_price_list.dart';
import 'package:flutter/material.dart';
import '../controllers/my_home_page_controller.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.black.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, MyHomePageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 54,
          child: BottomNavigationBar(
            backgroundColor: Colors.lightBlue,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: MyHomePageController.changeTabIndex,
            currentIndex: MyHomePageController.tabIndex.value,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.black,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.stacked_bar_chart_outlined,
                  size: 25.0,
                ),
                label: '',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.language_outlined,
                  size: 25.0,
                ),
                label: '',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications_outlined,
                  size: 25.0,
                ),
                label: '',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outlined,
                  size: 25.0,
                ),
                label: '',
                backgroundColor: Colors.white,
              ),
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    final MyHomePageController myHomePageController =
        Get.put(MyHomePageController(), permanent: false);
    return SafeArea(
      child: Scaffold(
        
        bottomNavigationBar:
            buildBottomNavigationMenu(context, myHomePageController),
        body: Obx(
          () => IndexedStack(
              index: myHomePageController.tabIndex.value,
              children: [
                CryptoPriceList(),
                CryptoPriceList(),
                CryptoPriceList(),
                CryptoPriceList(),
              ]),
        ),
      ),
    );
  }
}
