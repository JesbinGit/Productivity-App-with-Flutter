import 'package:first/common/utils/constants.dart';

import 'package:first/common/widgets/custom_otn_btn.dart';
import 'package:first/common/widgets/hieght_spacer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

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
            const HeightSpacer(hieght: 50),
            CustomOtlnBtn(
                onTap: () {
                  Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context)=> LoginPage()))
                
                },
                width: AppConst.kWidth * 0.9,
                height: AppConst.kHieght * 0.06,
                text: "Login With Phone Number",
                color: AppConst.kLight)
          ],
        ));
  }
}
