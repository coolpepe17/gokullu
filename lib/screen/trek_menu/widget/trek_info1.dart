import 'package:flutter/material.dart';
import 'package:gokullu/constant.dart';

class TrekInfo1 extends StatelessWidget {
  const TrekInfo1({
    Key key,
    @required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 30,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                route[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: mTitleTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          Divider(
            color: Colors.grey.withOpacity(1.0),
            thickness: 1.5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                altitude[index],
                style: TextStyle(
                  color: mTitleTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
            ],
          ),
          Divider(
            color: Colors.grey.withOpacity(1.0),
            thickness: 1.5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                trekLength[index],
                style: TextStyle(
                  color: mTitleTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
            ],
          ),
          Divider(
            color: Colors.grey.withOpacity(1.0),
            thickness: 1.5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                duration[index],
                style: TextStyle(
                  color: mTitleTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
            ],
          ),
          Divider(
            color: Colors.grey.withOpacity(1.0),
            thickness: 1.5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                difficulty[index],
                style: TextStyle(
                  color: mTitleTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
            ],
          ),
          Divider(
            color: Colors.grey.withOpacity(1.0),
            thickness: 1.5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                bestSeason[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: mTitleTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
            ],
          ),
          Divider(
            color: Colors.grey.withOpacity(1.0),
            thickness: 1.5,
          ),
        ],
      ),
    );
  }
}
