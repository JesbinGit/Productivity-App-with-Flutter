import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:first/common/utils/constants.dart';
import 'package:first/common/widgets/appstyle.dart';
import 'package:first/common/widgets/custom_text.dart';
import 'package:first/common/widgets/expansion_tile.dart';
import 'package:first/common/widgets/hieght_spacer.dart';
import 'package:first/common/widgets/reusable_text.dart';
import 'package:first/common/widgets/width_spacer.dart';
import 'package:first/features/auth/pages/login.dart';
import 'package:first/features/pomodoro/main_screen.dart';
import 'package:flutter/gestures.dart';
import 'dart:async';
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

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  late final TabController tabController =
      TabController(length: 2, vsync: this);
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
                        Spacer(),
                        HeightSpacer(hieght: 25),
                        ReusableText(
                            text: "HomePage",
                            style: appstyle(
                                18, AppConst.ccBlack, FontWeight.bold)),
                        Spacer(),
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
        bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: AppConst.ccBlue,
            items: <Widget>[
              Icon(Icons.access_time, size: 30),
              Icon(Icons.home, size: 30),
              Icon(Icons.cloud, size: 30),
            ],
            onTap: (index) {
              switch (index) {
                case 0:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CustomTimer()),
                  );
                  break;
                case 1:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                  break;
                case 2:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                  break;
              }
            }),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              const HeightSpacer(hieght: 25),
              Row(
                children: [
                  Icon(
                    Icons.list,
                    size: 25,
                  ),
                  const WidthSpacer(wydth: 10),
                  ReusableText(
                    text: "Today's Task",
                    style: appstyle(18, AppConst.ccBlack, FontWeight.bold),
                  )
                ],
              ), // Row
              const HeightSpacer(hieght: 25),
              Container(
                decoration: BoxDecoration(
                  color: AppConst.ccGrey,
                  borderRadius: BorderRadius.circular(AppConst.kRadius),
                ),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                    color: AppConst.ccBlue,
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppConst.kRadius)),
                  ),
                  controller: tabController,
                  labelPadding: EdgeInsets.zero,
                  isScrollable: false,
                  labelStyle: appstyle(24, AppConst.kRed, FontWeight.w700),
                  unselectedLabelColor: AppConst.ccGrey,
                  tabs: [
                    Tab(
                      child: SizedBox(
                        width: AppConst.kWidth * 0.5,
                        child: Center(
                          child: ReusableText(
                              text: "Pending",
                              style: appstyle(
                                  16, AppConst.ccBlack, FontWeight.bold)),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: AppConst.kWidth * 0.5,
                        child: Center(
                          child: ReusableText(
                              text: "Completed",
                              style: appstyle(
                                  16, AppConst.ccBlack, FontWeight.bold)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const HeightSpacer(hieght: 25),
              SizedBox(
                height: AppConst.kHieght * 0.3,
                width: AppConst.kWidth,
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppConst.kRadius)),
                  child: TabBarView(controller: tabController, children: [
                    Container(
                      color: AppConst.ccGrey,
                      height: AppConst.kHieght * 0.3,
                    ),
                    Container(
                      color: AppConst.ccGrey,
                      height: AppConst.kHieght * 0.3,
                    )
                  ]),
                ),
              ),
              const HeightSpacer(hieght: 20),
              const expansionTile(
                  text: "Tommorrow's Task",
                  text2: "Things to do for tommorrow",
                  children: []),
              const HeightSpacer(hieght: 20),
              expansionTile(
                  text: DateTime.now()
                      .add(Duration(days: 2))
                      .toString()
                      .substring(5, 10),
                  text2: "Things to do for tommorrow",
                  children: []),
              const HeightSpacer(hieght: 20),
              const expansionTile(
                  text: "Tommorrow's Task",
                  text2: "Things to do for tommorrow",
                  children: [])
            ],
          ),
        )));
  }
}
