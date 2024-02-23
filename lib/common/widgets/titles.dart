import 'package:first/common/utils/constants.dart';
import 'package:first/common/widgets/appstyle.dart';
import 'package:first/common/widgets/hieght_spacer.dart';
import 'package:first/common/widgets/reusable_text.dart';
import 'package:first/common/widgets/width_spacer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomTitles extends StatelessWidget {
  const BottomTitles(
      {super.key, required this.text, required this.text2, this.clr});

  final String text;
  final String text2;
  final Color? clr;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppConst.kWidth,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Consumer(
              builder: (context, ref, child) {
                return Container(
                  height: 80,
                  width: 5,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppConst.kRadius)),
                    //Todo: Add dynamic colors
                    color: AppConst.ccBlue,
                  ),
                );
              },
            ),
            WidthSpacer(wydth: 15),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                      text: text,
                      style: appstyle(24, AppConst.ccBlack, FontWeight.bold)),
                  HeightSpacer(hieght: 10),
                  ReusableText(
                      text: text2,
                      style: appstyle(12, AppConst.ccBlack, FontWeight.normal)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
