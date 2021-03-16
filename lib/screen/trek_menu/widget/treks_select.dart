import 'package:flutter/material.dart';
import 'package:gokullu/constant.dart';
import 'package:gokullu/screen/preferences/trek_details.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TrekSelect extends StatelessWidget {
  const TrekSelect({
    Key key,
    this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return TrekDetails(index);
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: mPrimaryTextColor.withOpacity(0.2),
              width: 2,
            ),
          ),
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 55,
              height: 50,
              child: SvgPicture.asset('assets/icons/${trekNames[index]}.svg'),
            ),
            SizedBox(
              width: 25,
            ),
            Expanded(
              child: Text(
                trekNames[index],
                style: TextStyle(
                  color: mSecondColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(
              Icons.keyboard_arrow_right,
              color: mPrimaryColor,
            )
          ],
        ),
      ),
    );
  }
}
