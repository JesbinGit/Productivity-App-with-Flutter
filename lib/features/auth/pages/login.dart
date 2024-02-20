import 'package:country_picker/country_picker.dart';
import 'package:first/common/utils/constants.dart';
import 'package:first/common/widgets/appstyle.dart';
import 'package:first/common/widgets/custom_otn_btn.dart';
import 'package:first/common/widgets/custom_text.dart';
import 'package:first/common/widgets/hieght_spacer.dart';
import 'package:first/features/auth/pages/OtpPage.dart';
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
  Country country = Country(
    phoneCode: "1",
    countryCode: "US",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "USA",
    example: "USA",
    displayName: "United States Of America",
    displayNameNoCountryCode: "US",
    e164Key: "",
  );

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
                prefixIcon: Container(
                  padding: EdgeInsets.all(14),
                  child: GestureDetector(
                    onTap: () {
                      showCountryPicker(
                          context: context,
                          countryListTheme: CountryListThemeData(
                              backgroundColor: AppConst.kLight,
                              bottomSheetHeight: AppConst.kHieght * 0.6,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(AppConst.kRadius),
                                topRight: Radius.circular(AppConst.kRadius),
                              )),
                          onSelect: (code) {
                            setState(() {});
                          });
                    },
                    child: ReusableText(
                        text: "${country.flagEmoji} + ${country.phoneCode}",
                        style: appstyle(18, AppConst.kBkDark, FontWeight.bold)),
                  ),
                ),
                keyboardType: TextInputType.phone,
                hintText: "Enter your phone number",
                hintStyle: appstyle(16, AppConst.kGreyDk, FontWeight.w600),
              ),
            ),
            const HeightSpacer(hieght: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomOtlnBtn(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const OtpPage()));
                },
                width: AppConst.kWidth * 0.9,
                height: AppConst.kHieght * 0.07,
                text: "Send Code",
                color: AppConst.kBkDark,
                color2: AppConst.kLight,
              ),
            )
          ],
        ),
      )),
    );
  }
}
