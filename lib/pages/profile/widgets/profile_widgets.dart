import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myteacher/common/values/colors.dart';

AppBar profileAppBar() {
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
          Text(
            'Profile',
            style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 24.w,
            height: 24.h,
            child: Image.asset('assets/icons/more-vertical.png'),
          ),
        ],
      ),
    ),
  );
}

// profile image
Widget profileImage() {
  return Container(
    width: 80.w,
    height: 80.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.h),
      image: const DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            'assets/icons/headpic.png',
          )),
    ),
    alignment: Alignment.bottomRight,
    padding: EdgeInsets.only(right: 6.w),
    child: Image(
        width: 24.w,
        height: 24.h,
        image: const AssetImage('assets/icons/edit_3.png')),
  );
}

// list of profile details
Widget listProfileDetail() {
  return Container(
    margin: EdgeInsets.only(top: 20.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          child: Container(
            margin: EdgeInsets.only(left: 24.w),
            child: Row(
              children: [
                Container(
                    width: 40.w,
                    height: 40.h,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.w),
                      color: AppColors.primaryElement,
                    ),
                    child: Image.asset('assets/icons/settings.png')),
                SizedBox(
                  width: 16.w,
                ),
                Text(
                  'Settings',
                  style: TextStyle(
                      color: AppColors.primaryText,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
