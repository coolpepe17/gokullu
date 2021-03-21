import 'package:flutter/material.dart';
import 'package:gokullu/constant.dart';
import 'package:gokullu/screen/trek_menu/widget/treks_select.dart';

class TrekMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView.builder(
        itemCount: trekNames.length,
        itemBuilder: (context, index) => TrekSelect(
          index: index,
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 5,
      centerTitle: true,
      title: Text(
        'Trek Selector',
        style: TextStyle(
          color: mPrimaryTextColor,
        ),
      ),
      // leading: IconButton(
      //   icon: Icon(
      //     Icons.arrow_back_ios,
      //     color: mPrimaryTextColor,
      //   ),
      //   onPressed: () {
      //     Navigator.pop(context);
      //   },
      // ),
      bottom: PreferredSize(
        child: Divider(
          height: 1,
          color: mPrimaryTextColor.withOpacity(0.5),
        ),
        preferredSize: Size.fromHeight(1),
      ),
    );
  }
}
