import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/common/widgets/base_text_widget.dart';
import 'package:ulearning_app/pages/home/bloc/home_page_blocs.dart';
import 'package:ulearning_app/pages/home/bloc/home_page_states.dart';
import 'package:ulearning_app/pages/home/widgets/home_page_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: BlocBuilder<HomePageBlocs, HomePageStates>(builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            // crossAxisAlignment: CrossAxisAlignment.start,
            slivers: [
              SliverToBoxAdapter(
                child: reusableText(
                  text: "Hello",
                  textColor: AppColors.primaryThirdElementText,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SliverToBoxAdapter(
                child: reusableText(
                  text: "Estelson",
                  marginTop: 5.h,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(top: 20.h),
              ),
              SliverToBoxAdapter(
                child: searchView(),
              ),
              SliverToBoxAdapter(
                child: slidersView(context, state),
              ),
              SliverToBoxAdapter(
                child: menuView(),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 0.w),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 1.6,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {},
                        child: courseGrid(),
                      );
                    },
                    childCount: 4,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
