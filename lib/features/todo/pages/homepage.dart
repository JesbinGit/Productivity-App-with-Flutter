import 'package:first/common/utils/constants.dart';
import 'package:first/common/widgets/appstyle.dart';
import 'package:first/common/widgets/hieght_spacer.dart';
import 'package:first/common/widgets/reusable_text.dart';
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
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ReusableText(
            text: "Test Test Test",
            style: appstyle(26, AppConst.kBlueLight, FontWeight.bold)),
        const HeightSpacer(hieght: 30),
        ReusableText(
            text: "Test Test Test",
            style: appstyle(26, AppConst.kBlueLight, FontWeight.bold)),
      ]),
    );
  }
}
