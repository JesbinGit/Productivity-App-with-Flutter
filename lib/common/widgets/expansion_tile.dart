import 'package:first/common/utils/constants.dart';
import 'package:first/common/widgets/titles.dart';
import 'package:flutter/material.dart';

class expansionTile extends StatelessWidget {
  const expansionTile(
      {super.key,
      required this.text,
      required this.text2,
      this.onExpansionChanged,
      this.trailing,
      required this.children});

  final String text;
  final String text2;
  final ValueChanged<bool>? onExpansionChanged;
  final Widget? trailing;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5.0,
            spreadRadius: 2.0,
            offset: Offset(0, 2),
          ),
        ],
        color: AppConst.ccGrey,
        borderRadius: BorderRadius.all(Radius.circular(AppConst.kRadius)),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          title: BottomTitles(
            text: text,
            text2: text2,
          ),
          tilePadding: EdgeInsets.zero,
          childrenPadding: EdgeInsets.zero,
          onExpansionChanged: onExpansionChanged,
          controlAffinity: ListTileControlAffinity.trailing,
          trailing: trailing,
          children: children,
        ),
      ),
    );
  }
}
