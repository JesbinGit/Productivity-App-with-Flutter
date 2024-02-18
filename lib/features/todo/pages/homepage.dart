import 'package:first/common/utils/constants.dart';
import 'package:first/common/widgets/appstyle.dart';
import 'package:first/common/widgets/hieght_spacer.dart';
import 'package:first/common/widgets/reusable_text.dart';
import 'package:first/common/widgets/width_spacer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
//sdsdsd
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ReusableText(
                  text: "Test ",
                  style: appstyle(26, AppConst.kBlueLight, FontWeight.bold)),
              WidthSpacer(
                wydth: 20,
              ),
              ReusableText(
                  text: "Test ",
                  style: appstyle(26, AppConst.kBlueLight, FontWeight.bold)),
              WidthSpacer(
                wydth: 20,
              ),
              ReusableText(
                  text: "Test ",
                  style: appstyle(26, AppConst.kBlueLight, FontWeight.bold)),
              WidthSpacer(
                wydth: 20,
              ),
            ]),
      ),
    );
  }
}
