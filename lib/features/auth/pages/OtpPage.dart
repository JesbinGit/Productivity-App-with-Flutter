import 'package:first/common/utils/constants.dart';
import 'package:first/common/widgets/appstyle.dart';
import 'package:first/common/widgets/hieght_spacer.dart';
import 'package:first/common/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeightSpacer(hieght: AppConst.kHieght * 0.12),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Image.asset(
                  "assets/images/to-do-list.png",
                  width: AppConst.kWidth * 0.5,
                ),
              ),
              HeightSpacer(hieght: 26),
              ReusableText(
                  text: "Enter Your OTP",
                  style: appstyle(18, AppConst.kLight, FontWeight.bold)),
              HeightSpacer(hieght: 26),
              Pinput(
                length: 6,
                showCursor: true,
                //     onCompleted: ((value) {
                //   if(value.length == 6){

                //  }
                //  },
                //  onSubmitted: (value) {
                //   if(value.length == 6)
                //  {}
                //}
              )
            ],
          ),
        ),
      ),
    );
  }
}
