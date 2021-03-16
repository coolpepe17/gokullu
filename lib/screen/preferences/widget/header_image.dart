import 'package:flutter/material.dart';
import '../../../constant.dart';

class HeaderImage extends StatelessWidget {
  const HeaderImage({
    Key key,
    @required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 230,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
              'assets/images/${trekNames[index]}.jpg' // fit: BoxFit.cover),
              ),
          // child: UnconstrainedBox(
          //   child: SvgPicture.asset(
          //     'assets/icons/${trekNames[index]}.svg',
          //     height: 100,
          //   ),
          // ),
        )));
  }
}
