import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myteacher/common/values/colors.dart';
import 'package:myteacher/pages/welcome/bloc/welcome_states.dart';
import 'package:myteacher/pages/welcome/bloc/welcone_blocs.dart';

import 'bloc/welcome_events.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 30.h),
            child: SizedBox(
                width: 375.w,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    PageView(
                      controller: pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (index) {
                        state.index = index;
                        BlocProvider.of<WelcomeBloc>(context).add(
                          WelcomeEvent(),
                        );
                      },
                      children: [
                        _landingPage(
                            1,
                            context,
                            'Watch What You Want',
                            'Unlock the World\'s Knowledge with Expert Video Courses. Forget about a for of paper all knowledge in one learning!',
                            'assets/images/reading.png',
                            'Next'),
                        _landingPage(
                          2,
                          context,
                          'Grow With Us',
                          'Comprehensive Learning at Your Fingertips. Always keep in touch with your tutor and friends. let\'s get connected!',
                          'assets/images/boy.png',
                          'Next',
                        ),
                        _landingPage(
                            3,
                            context,
                            'Make YourSelf Smarter',
                            'Dive into Interactive Video Courses. Anywhere, anytime. The time at your discretion so study whenever your want.',
                            'assets/images/man.png',
                            'Get Started'),
                      ],
                    ),
                    Positioned(
                      bottom: 80.h,
                      child: DotsIndicator(
                        position: state.index,
                        dotsCount: 3,
                        decorator: DotsDecorator(
                            activeColor: AppColors.primaryElement,
                            activeSize: const Size(18.0, 8.0),
                            color: AppColors.primaryThreeElementText,
                            size: const Size.square(10.0),
                            activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            )),
                      ),
                    ),
                  ],
                )),
          );
        },
      )),
    );
  }

  Widget _landingPage(int index, BuildContext context, String title,
      String subtitle, String imageName, String buttonName) {
    return Column(
      children: [
        // for image
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(
            imageName,
            fit: BoxFit.cover,
          ),
        ),
        // for text
        Text(
          title,
          style: TextStyle(
              fontSize: 30.sp,
              color: AppColors.primaryText,
              fontWeight: FontWeight.normal),
        ),
        Container(
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subtitle,
            style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.primarySecondaryElementText,
                fontWeight: FontWeight.normal),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            } else {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/sign_In', (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 24.w, right: 24.w),
            width: 325.w,
            height: 44.h,
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.all(Radius.circular(16.w)),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.primarySecondaryElementText,
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ]),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        )
      ],
    );
  }
}
