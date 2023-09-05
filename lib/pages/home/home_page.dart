import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myteacher/common/values/colors.dart';
import 'package:myteacher/pages/home/widgets/home_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        body: buildPagesFromNav(_index),
        bottomNavigationBar: Container(
          width: 375.w,
          height: 52.h,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.h),
              topRight: Radius.circular(20.h),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: _index,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: AppColors.primaryElement,
            unselectedItemColor: AppColors.primaryFourElementText,
            onTap: (value) {
              setState(() {
                _index = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                label: 'home',
                activeIcon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset(
                    'assets/icons/home.png',
                    color: AppColors.primaryElement,
                  ),
                ),
                icon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset('assets/icons/home.png'),
                ),
              ),
              BottomNavigationBarItem(
                label: 'search',
                activeIcon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset(
                    'assets/icons/search2.png',
                    color: AppColors.primaryElement,
                  ),
                ),
                icon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset('assets/icons/search2.png'),
                ),
              ),
              BottomNavigationBarItem(
                label: 'course',
                activeIcon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset(
                    'assets/icons/play-circle1.png',
                    color: AppColors.primaryElement,
                  ),
                ),
                icon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset('assets/icons/play-circle1.png'),
                ),
              ),
              BottomNavigationBarItem(
                label: 'chat',
                activeIcon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset(
                    'assets/icons/message-circle.png',
                    color: AppColors.primaryElement,
                  ),
                ),
                icon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset('assets/icons/message-circle.png'),
                ),
              ),
              BottomNavigationBarItem(
                label: 'profile',
                activeIcon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset(
                    'assets/icons/person2.png',
                    color: AppColors.primaryElement,
                  ),
                ),
                icon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset('assets/icons/person2.png'),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
