import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myteacher/common/values/colors.dart';
import 'package:myteacher/pages/home/widgets/home_page_widgets.dart';

import 'bloc/home_page_bloc.dart';
import 'bloc/home_page_state.dart';

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
      body: BlocBuilder<HomePageBlocs, HomePageStates>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 24.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                homePageText(
                  'Assalamu Alaikum',
                  color: AppColors.primaryThreeElementText,
                ),
                homePageText(
                  'Adil Ayoub',
                  top: 5,
                ),
                SizedBox(height: 20.h),
                searchView(),
                sliderView(context, state),
                menuView(),
              ],
            ),
          );
        },
      ),
    );
  }
}
