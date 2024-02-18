import 'package:first/common/utils/constants.dart';
import 'package:first/common/widgets/appstyle.dart';
import 'package:first/common/widgets/hieght_spacer.dart';
import 'package:first/common/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: AppConst.kHieght,
        width: AppConst.kWidth,
        color: AppConst.kBkDark,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30.w,
              ),
              child: Image.asset("assets/images/to-do-list.png"),
            ),
            const HeightSpacer(hieght: 100),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ReusableText(
                    text: "Productivity App",
                    style: appstyle(30, AppConst.kLight, FontWeight.w600)),
                const HeightSpacer(hieght: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Text(
                    "Welcome !! Get Ready To Be More Productive ",
                    textAlign: TextAlign.center,
                    style: appstyle(16, AppConst.kLight, FontWeight.normal),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
