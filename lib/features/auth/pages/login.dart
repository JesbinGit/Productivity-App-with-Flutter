import 'package:first/common/utils/constants.dart';
import 'package:first/common/widgets/appstyle.dart';
import 'package:first/common/widgets/custom_otn_btn.dart';
import 'package:first/common/widgets/custom_text.dart';
import 'package:first/common/widgets/hieght_spacer.dart';
import 'package:first/common/widgets/reusable_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Image.asset(
                "assets/images/to-do-list.png",
                width: 300,
              ),
            ),
            HeightSpacer(hieght: 20),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 16.w),
              child: ReusableText(
                  text: "Please Enter Your Phone Number",
                  style: appstyle(17, AppConst.kLight, FontWeight.w500)),
            ),
            const HeightSpacer(hieght: 20),
            Center(
              child: CustomTextField(
                controller: phone,
                //  prefixIcon: Container(
                //  padding: EdgeInsets.all(4),
                //child: GestureDetector(

                // ),
                // ),
                keyboardType: TextInputType.phone,
                hintText: "Enter your phone number",
                hintStyle: appstyle(16, AppConst.kGreyDk, FontWeight.w600),
              ),
            ),
            const HeightSpacer(hieght: 20),
            CustomOtlnBtn(
              width: AppConst.kWidth * 0.9,
              height: AppConst.kHieght * 0.07,
              text: "Send Code",
              color: AppConst.kBkDark,
              color2: AppConst.kLight,
            )
          ],
        ),
      )),
    );
  }
}
