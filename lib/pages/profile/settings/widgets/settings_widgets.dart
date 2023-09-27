import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myteacher/common/widgets/base_text.dart';

AppBar settingsAppBar() {
  return AppBar(
    title: reusableText('Settings'),
    centerTitle: true,
  );
}

Widget settingsButton(BuildContext context, void Function()? onPressed) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Confirm Logout'),
              content: const Text('Are you sure? you want to logout'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: onPressed,
                  child: const Text('Confirm'),
                )
              ],
            );
          });
    },
    child: Container(
      height: 100.w,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/icons/Logout.png',
          ),
          fit: BoxFit.fitHeight,
        ),
      ),
    ),
  );
}
