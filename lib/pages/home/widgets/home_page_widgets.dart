import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/common/widgets/base_text_widget.dart';
import 'package:ulearning_app/pages/home/bloc/home_page_blocs.dart';
import 'package:ulearning_app/pages/home/bloc/home_page_events.dart';
import 'package:ulearning_app/pages/home/bloc/home_page_states.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(
        left: 7.w,
        right: 7.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.w,
            child: Image.asset("assets/icons/menu.png"),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/icons/person.png"),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

/// Reusable search bar
Widget searchView() {
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.h),
          border: Border.all(color: AppColors.primaryFourthElementText),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w),
              width: 16.w,
              height: 16.w,
              child: Image.asset("assets/icons/search.png"),
            ),
            Container(
              width: 240.w,
              height: 40.h,
              child: TextField(
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                  hintText: " Search your course...",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  hintStyle: TextStyle(
                    color: AppColors.primarySecondaryElementText,
                  ),
                ),
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp,
                ),
                autocorrect: false,
                obscureText: false,
              ),
            ),
          ],
        ),
      ),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.all(Radius.circular(13.w)),
            border: Border.all(color: AppColors.primaryElement),
          ),
          child: Image.asset("assets/icons/options.png"),
        ),
      )
    ],
  );
}

/// Reusable sliders view
Widget slidersView(BuildContext context, HomePageStates state) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value) {
            debugPrint(value.toString());
            context.read<HomePageBlocs>().add(HomePageDots(value));
          },
          physics: const BouncingScrollPhysics(),
          children: [
            _slidersContainer(path: "assets/icons/art.png"),
            _slidersContainer(path: "assets/icons/Image_1.png"),
            _slidersContainer(path: "assets/icons/Image_2.png"),
          ],
        ),
      ),
      Container(
        child: DotsIndicator(
          dotsCount: 3,
          position: state.index,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryElement,
            size: const Size.square(5.0),
            activeSize: const Size(17.0, 5.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      )
    ],
  );
}

/// Sliders widget
Widget _slidersContainer({String path = "assets/icons/art.png"}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.h)),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(path),
        )),
  );
}

/// Menu view for showing items
Widget menuView() {
  return Column(
    children: [
      /*Container(
        width: 325.w,
        child: */
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          reusableText(
            text: "Choose your course",
            marginTop: 15,
            fontWeight: FontWeight.bold,
          ),
          GestureDetector(
            child: reusableText(
              text: "See all",
              textColor: AppColors.primaryThirdElementText,
              marginTop: 15,
              fontSize: 14,
            ),
          )
        ],
      ),
      /*),*/
      Container(
        margin: EdgeInsets.only(top: 20.w),
        child: Row(
          children: [
            _reusableMenuViewItemText(menuItemText: "All"),
            _reusableMenuViewItemText(
              menuItemText: "Popular",
              textColor: AppColors.primaryThirdElementText,
              backgroundColor: Colors.white,
            ),
            _reusableMenuViewItemText(
              menuItemText: "Newest",
              textColor: AppColors.primaryThirdElementText,
              backgroundColor: Colors.white,
            ),
          ],
        ),
      )
    ],
  );
}

/// Items of menu view
Widget _reusableMenuViewItemText({
  required String menuItemText,
  Color textColor = AppColors.primaryElementText,
  Color backgroundColor = AppColors.primaryElement,
}) {
  return Container(
    margin: EdgeInsets.only(right: 8.w),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(7.w),
      border: Border.all(color: backgroundColor),
    ),
    padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h, bottom: 5.h),
    child: reusableText(
      text: menuItemText,
      textColor: textColor,
      marginTop: 0,
      fontSize: 14,
    ),
  );
}

/// Course grid view UI
Widget courseGrid(/*{required AssetImage image, String title = "", String subtitle = ""}*/) {
  return Container(
    padding: EdgeInsets.all(10.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.w),
      image: const DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage("assets/icons/Image_2.png"),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Best course for IT and Engineering",
          maxLines: 1,
          textAlign: TextAlign.left,
          overflow: TextOverflow.fade,
          softWrap: false,
          style: TextStyle(
            color: AppColors.primaryElementText,
            fontWeight: FontWeight.bold,
            fontSize: 11.sp,
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          "Flutter best course",
          maxLines: 1,
          textAlign: TextAlign.left,
          overflow: TextOverflow.fade,
          softWrap: false,
          style: TextStyle(
            color: AppColors.primaryFourthElementText,
            fontWeight: FontWeight.normal,
            fontSize: 10.sp,
          ),
        ),
      ],
    ),
  );
}
