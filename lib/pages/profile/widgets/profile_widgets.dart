import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 18.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          Text(
            "Profile",
            style: TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(
            width: 24.w,
            height: 24.h,
            child: Image.asset("assets/icons/more-vertical.png"),
          ),
        ],
      ),
    ),
  );
}

/// Profile icon and edit button
Widget profileIconAndEditButton() {
  return Container(
    alignment: Alignment.bottomRight,
    padding: EdgeInsets.only(right: 6.w),
    width: 80.w,
    height: 80.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.w),
      image: const DecorationImage(
        image: AssetImage("assets/icons/headpic.png"),
      ),
    ),
    child: Image(
      width: 25.w,
      height: 25.h,
      image: const AssetImage("assets/icons/edit_3.png"),
    ),
  );
}

/// Setting sections buttons
Widget buildListView() {
  return Column(
    children: [
      GestureDetector(
        child: Container(
          child: Row(
            children: [
              Container(
                width: 40.w,
                height: 40.h,
                padding: const EdgeInsets.all(7.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                  color: AppColors.primaryElement,
                ),
                child: Image.asset("assets/icons/settings.png"),
              ),
              SizedBox(width: 15.w),
              Text(
                "Settings",
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ),

      ),
    ],
  );
}
