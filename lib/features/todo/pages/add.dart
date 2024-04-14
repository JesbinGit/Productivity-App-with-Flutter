import 'package:first/common/utils/constants.dart';
import 'package:first/common/widgets/appstyle.dart';
import 'package:first/common/widgets/custom_otn_btn.dart';
import 'package:first/common/widgets/custom_text.dart';
import 'package:first/common/widgets/hieght_spacer.dart';

import 'package:first/features/todo/controllers/dates/dates_provider.dart';
import 'package:flutter/material.dart';
import 'package:first/common/helpers/db_helper.dart';
import 'package:first/common/models/task_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'add.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;

class AddTasks extends StatefulWidget {
  const AddTasks({Key? key})
      : super(key: key); // Fixed syntax error in the constructor

  @override
  State<AddTasks> createState() => _AddTasksState();
}

class _AddTasksState extends State<AddTasks> {
  final TextEditingController title = TextEditingController();
  final TextEditingController desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dateState =
        context.read(dateStateProvider); // Accessing datesStateProvider
    return Scaffold(
      backgroundColor: AppConst.kLight,
      appBar: AppBar(
        backgroundColor: AppConst.kLight,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            const HeightSpacer(hieght: 20), // Fixed typo in the widget name
            CustomTextField(
              hintText: "Add Title",
              controller: title,
              hintStyle: appstyle(16, AppConst.ccBlack, FontWeight.w600),
            ),
            const HeightSpacer(hieght: 20),
            CustomTextField(
              hintText: "Add Description",
              controller: desc,
              hintStyle: appstyle(16, AppConst.ccBlack, FontWeight.w600),
            ),
            const HeightSpacer(hieght: 20),

            CustomOtlnBtn(
              onTap: () {
                picker.DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(2008, 3, 5),
                    maxTime: DateTime(2024, 12, 31),
                    theme: picker.DatePickerTheme(
                        headerColor: AppConst.ccBlue,
                        backgroundColor: Colors.white,
                        itemStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        doneStyle:
                            TextStyle(color: Colors.white, fontSize: 16)),
                    onConfirm: (date) {
                  ref.read(dateStateProvider.notifier).setDate.toString();
                }, currentTime: DateTime.now(), locale: picker.LocaleType.en);
              },
              width: AppConst.kWidth,
              height: 52.h,
              text: "Set Date",
              color2: AppConst.ccBlue,
              color: AppConst.kGreyBk,
            ),
            HeightSpacer(hieght: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomOtlnBtn(
                  onTap: () {},
                  width: AppConst.kWidth * 0.4,
                  height: 52.h,
                  text: "Start Time",
                  color2: AppConst.ccBlue,
                  color: AppConst.kGreyBk,
                ),
                CustomOtlnBtn(
                  onTap: () {},
                  width: AppConst.kWidth * 0.4,
                  height: 52.h,
                  text: "End Time",
                  color2: AppConst.ccBlue,
                  color: AppConst.kGreyBk,
                ),
              ],
            ),
            const HeightSpacer(hieght: 20),
            CustomOtlnBtn(
              width: AppConst.kWidth,
              height: 52.h,
              text: "Submit",
              color2: AppConst.kGreen,
              color: AppConst.kGreyBk,
            ),
          ],
        ),
      ),
    );
  }
}
