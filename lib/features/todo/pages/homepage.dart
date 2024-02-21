import 'package:first/common/utils/constants.dart';
import 'package:first/common/widgets/appstyle.dart';
import 'package:first/common/widgets/custom_text.dart';
import 'package:first/common/widgets/hieght_spacer.dart';
import 'package:first/common/widgets/reusable_text.dart';
import 'package:first/common/widgets/width_spacer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});
//sdsdsd
  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppConst.kLight,
        appBar: AppBar(
            backgroundColor: AppConst.kLight,
            automaticallyImplyLeading: false,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(85),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 25.w,
                          height: 25.h,
                          decoration: BoxDecoration(
                              // color: AppConst.ccBlack,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.access_time,
                              color: AppConst.ccBlack,
                            ),
                          ),
                        ),
                        Spacer(),
                        HeightSpacer(hieght: 25),
                        ReusableText(
                            text: "HomePage",
                            style: appstyle(
                                18, AppConst.ccBlack, FontWeight.bold)),
                        Spacer(),
                        Container(
                          width: 25.w,
                          height: 25.h,
                          decoration: BoxDecoration(
                              color: AppConst.ccBlack,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.add,
                              color: AppConst.kLight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  HeightSpacer(hieght: 20),
                  CustomTextField(
                    hintText: "Search Tasks",
                    controller: search,
                    prefixIcon: Container(
                      padding: EdgeInsets.all(14),
                      child: GestureDetector(
                        onTap: null,
                        child: Icon(
                          AntDesign.search1,
                          color: AppConst.ccGreyBk,
                        ),
                      ),
                    ),
                    suffixIcon: const Icon(
                      FontAwesome.sliders,
                      color: AppConst.ccGreyBk,
                    ),
                  ),
                  const HeightSpacer(hieght: 15),
                ],
              ),
            )),
        body: SafeArea(
            child: Padding(padding: EdgeInsets.symmetric(horizontal: 20))));
  }
}
