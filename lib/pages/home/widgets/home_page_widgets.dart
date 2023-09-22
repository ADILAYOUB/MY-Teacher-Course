import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myteacher/common/values/colors.dart';
import 'package:myteacher/pages/home/bloc/home_page_bloc.dart';
import 'package:myteacher/pages/home/bloc/home_page_events.dart';
import 'package:myteacher/pages/home/bloc/home_page_state.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 6.w, right: 6.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 16.w,
            height: 12.h,
            child: Image.asset('assets/icons/menu.png'),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/icons/person.png'),
              )),
            ),
          )
        ],
      ),
    ),
  );
}

// Text for home Page
Widget homePageText(
  String name, {
  Color color = AppColors.primaryText,
  int top = 20,
}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      name,
      style: TextStyle(
        color: color,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget searchView() {
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(16.h),
          border: Border.all(
            color: AppColors.primaryFourElementText,
          ),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 16.w),
              width: 16.w,
              height: 16.w,
              child: Image.asset('assets/icons/search.png'),
            ),
            SizedBox(
              width: 240.w,
              height: 40.h,
              child: TextField(
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
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
                  hintText: 'Search Courses',
                  hintStyle:
                      TextStyle(color: AppColors.primarySecondaryElementText),
                ),
                style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.primaryText,
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.normal),
                autofocus: false,
                obscureText: false,
              ),
            ),
          ],
        ),
      ),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.all(
                Radius.circular(16.w),
              ),
              border: Border.all(
                color: AppColors.primaryElement,
              )),
          child: Image.asset('assets/icons/options.png'),
        ),
      ),
    ],
  );
}

Widget sliderView(BuildContext context, HomePageStates state) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 324.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value) {
            context.read<HomePageBlocs>().add(HomePageDots(value));
          },
          children: [
            _sliderContainer(imagePath: 'assets/icons/art.png'),
            _sliderContainer(imagePath: 'assets/icons/Image(1).png'),
            _sliderContainer(imagePath: 'assets/icons/Image(2).png'),
            _sliderContainer(imagePath: 'assets/icons/image(3).png'),
            _sliderContainer(imagePath: 'assets/icons/image(4).png'),
          ],
        ),
      ),
      Container(
          child: DotsIndicator(
        dotsCount: 5,
        position: state.index,
        decorator: DotsDecorator(
          activeColor: AppColors.primaryElement,
          activeSize: const Size(16.0, 4.0),
          color: AppColors.primaryThreeElementText,
          size: const Size.square(4.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      ))
    ],
  );
}

// slider widget

Widget _sliderContainer({String imagePath = "assets/icons/art.png"}) {
  return Container(
    margin: EdgeInsets.only(
      top: 20.h,
      right: 12.h,
    ),
    width: 324.w,
    height: 160.h,
    child: PageView(
      children: [
        Container(
          width: 324.w,
          height: 160.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20.h),
            ),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(imagePath),
            ),
          ),
        ),
      ],
    ),
  );
}

// Menu View for items
Widget menuView() {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Container(
      width: 325.w,
      margin: EdgeInsets.only(top: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _reusableText('Choose your Coursees'),
          GestureDetector(
            onTap: () {},
            child: _reusableText(
              'See All',
              color: AppColors.primarySecondaryElementText,
              fontSize: 12,
            ),
          ),
        ],
      ),
    ),
    Row(
      children: [
        _reusabeMenuText('All'),
        _reusabeMenuText(
          'Popular',
          textColor: AppColors.primaryThreeElementText,
          backgroundColor: Colors.white,
        ),
        _reusabeMenuText(
          'Newest',
          textColor: AppColors.primaryThreeElementText,
          backgroundColor: Colors.white,
        ),
      ],
    )
  ]);
}

// reusable  text in home Scree
Widget _reusableText(
  String text, {
  Color color = AppColors.primaryText,
  int fontSize = 16,
  fontWeight = FontWeight.bold,
}) {
  return Container(
    child: Text(text,
        style: TextStyle(
          fontWeight: fontWeight,
          color: color,
          fontSize: fontSize.sp,
        )),
  );
}

// Reusabe text for the menu

Widget _reusabeMenuText(
  String text, {
  Color textColor = AppColors.primaryElementText,
  Color backgroundColor = AppColors.primaryElement,
}) {
  return Container(
    margin: EdgeInsets.only(right: 20.w),
    decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.w),
        border: Border.all(color: backgroundColor)),
    padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 16.w),
    child: _reusableText(
      text,
      color: textColor,
      fontSize: 12,
      fontWeight: FontWeight.normal,
    ),
  );
}
