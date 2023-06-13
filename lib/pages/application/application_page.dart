import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/pages/application/widgets/application_widgets.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: buildPage(_index),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _index,
            onTap: (value) {
              setState(() {
                _index = value;
              });
            },
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: AppColors.primaryElement,
            unselectedItemColor: AppColors.primaryFourthElementText,
            backgroundColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset("assets/icons/home.png"),
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset("assets/icons/home.png"),
                ),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset("assets/icons/home.png"),
                ),
                label: "Course",
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset("assets/icons/home.png"),
                ),
                label: "Chat",
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset("assets/icons/home.png"),
                ),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
