import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myteacher/common/values/colors.dart';

AppBar buildAppBar() {
  return AppBar(
    centerTitle: true,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        height: 1.0,
      ),
    ),
    title: Text(
      'Log In',
      style: TextStyle(
          color: AppColors.primaryText,
          fontWeight: FontWeight.bold,
          fontSize: 16.sp),
    ),
  );
}

Widget signInOptions(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _iconName('google'),
        _iconName('apple'),
        _iconName('facebook'),
      ],
    ),
  );
}

Widget _iconName(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset('assets/icons/$iconName.png'),
    ),
  );
}

Widget reusableTect(String text) {
  return Container(
      margin: EdgeInsets.only(bottom: 5.h),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.grey.withOpacity(0.6),
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
        ),
      ));
}

Widget buildTextField(String hintText, String type, String iconName) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 20.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(16.w),
      ),
      border: Border.all(color: AppColors.primaryFourElementText),
    ),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 14.w),
          width: 16.w,
          height: 16.h,
          child: Image.asset('assets/icons/$iconName.png'),
        ),
        SizedBox(
          width: 270.w,
          height: 50.h,
          child: TextField(
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              hintText: hintText,
              hintStyle:
                  const TextStyle(color: AppColors.primarySecondaryElementText),
            ),
            style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.primaryText,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.normal),
            autofocus: false,
            obscureText: type == 'password' ? true : false,
          ),
        ),
      ],
    ),
  );
}

Widget forgetPassword() {
  return Container(
    width: 260.w,
    height: 44.h,
    margin: EdgeInsets.only(left: 25.h),
    child: GestureDetector(
      onTap: () {},
      child: Text(
        'Forget Password?',
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 12.sp,
          fontWeight: FontWeight.normal,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primaryText,
        ),
      ),
    ),
  );
}

Widget buildLoginandRegButton(String buttonName, String type) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      margin: EdgeInsets.only(
          left: 25.w, right: 25.w, top: type == 'login' ? 40.h : 20.h),
      width: 325.w,
      height: 50.h,
      decoration: BoxDecoration(
          color: type == 'login'
              ? AppColors.primaryElement
              : AppColors.primaryBackground,
          borderRadius: BorderRadius.all(
            Radius.circular(16.w),
          ),
          border: Border.all(
              color: type == 'login'
                  ? Colors.transparent
                  : AppColors.primaryFourElementText),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ]),
      child: Center(
          child: Text(
        buttonName,
        style: TextStyle(
            fontSize: 16.sp,
            color: type == 'login'
                ? AppColors.primaryBackground
                : AppColors.primaryText,
            fontWeight: FontWeight.normal),
      )),
    ),
  );
}
