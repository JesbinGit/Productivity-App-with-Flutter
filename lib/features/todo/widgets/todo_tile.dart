import 'package:first/common/utils/constants.dart';
import 'package:first/common/widgets/appstyle.dart';
import 'package:first/common/widgets/hieght_spacer.dart';
import 'package:first/common/widgets/reusable_text.dart';
import 'package:first/common/widgets/width_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class TodoTile extends StatelessWidget {
  const TodoTile(
      {super.key,
      this.color,
      this.title,
      this.description,
      this.start,
      this.end,
      this.editwidget,
      this.delete,
      this.switcher});

  final Color? color;
  final String? title;
  final String? description;
  final String? start;
  final String? end;
  final Widget? editwidget;
  final void Function()? delete;
  final Widget? switcher;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(8.h),
            width: AppConst.kWidth,
            decoration: BoxDecoration(
              color: AppConst.ccBlue,
              borderRadius: BorderRadius.all(
                Radius.circular(AppConst.kRadius),
              ),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 80,
                        width: 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(AppConst.kRadius)),
                          //Todo: Add dynamic colors
                          color: color ?? AppConst.kLight,
                        ),
                      ),
                      WidthSpacer(wydth: 15),
                      Padding(
                        padding: EdgeInsets.all(8.h),
                        child: SizedBox(
                          width: AppConst.kWidth * 0.6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ReusableText(
                                  text: title ?? "Tittle of ToDo ",
                                  style: appstyle(
                                      18, AppConst.ccBlack, FontWeight.bold)),
                              HeightSpacer(hieght: 3),
                              ReusableText(
                                  text: description ?? "Description ",
                                  style: appstyle(
                                      12, AppConst.ccBlack, FontWeight.bold)),
                              HeightSpacer(hieght: 3),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: AppConst.kWidth * 0.3,
                                    height: 25.h,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 0.3,
                                        color: AppConst.ccGreyBk,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(AppConst.kRadius)),
                                      color: AppConst.kLight,
                                    ),
                                    child: Center(
                                        child: ReusableText(
                                            text: "$start | $end",
                                            style: appstyle(
                                                12,
                                                AppConst.ccBlack,
                                                FontWeight.normal))),
                                  ),
                                  WidthSpacer(wydth: 20),
                                  Row(
                                    children: [
                                      SizedBox(
                                        child: editwidget,
                                      ),
                                      WidthSpacer(wydth: 20),
                                      GestureDetector(
                                        onTap: delete,
                                        child: const Icon(
                                            MaterialCommunityIcons.delete),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 0.h),
                    child: switcher,
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
