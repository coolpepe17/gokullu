import 'package:flutter/material.dart';
import 'package:gokullu/screen/trek_menu/kullu_map.dart';
import 'package:gokullu/screen/trek_menu/trek_menu.dart';
import 'package:gokullu/widget/round_button.dart';
import '../../../constant.dart';

class KulluRoute extends StatefulWidget {
  @override
  _KulluRouteState createState() => _KulluRouteState();
}

class _KulluRouteState extends State<KulluRoute> {
  static final double radius = 20;

  UniqueKey keyTile;
  bool isExpanded = false;

  void expandTile() {
    setState(() {
      isExpanded = true;
      keyTile = UniqueKey();
    });
  }

  void shrinkTile() {
    setState(() {
      isExpanded = false;
      keyTile = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: mBackgroundColor,
          elevation: 5,
          centerTitle: true,
          title: Text(
            'How to reach Kullu',
            style: TextStyle(
              color: mPrimaryTextColor,
            ),
          ),
          // centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              KulluMap(),
              SizedBox(height: 10),
              // AboutText(),
              Padding(
                padding: EdgeInsets.all(12),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius),
                    side: BorderSide(color: Colors.black, width: 2),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(radius),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          // GestureDetector(
                          //   onTap: () => isExpanded ? shrinkTile() : expandTile(),
                          //   child: buildImage(),
                          // ),
                          byRoad(context),
                          Divider(),
                          byAir(context),
                          Divider(),
                          byRail(context),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Container(
              //   padding: const EdgeInsets.fromLTRB(40, 5, 40, 5),
              //   child: Row(
              //     children: <Widget>[
              //       Expanded(
              //           child: Button(
              //         title: 'View Treks',
              //         press: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) {
              //                 return TrekMenu();
              //               },
              //             ),
              //           );
              //         },
              //       )),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      );

  // Widget buildImage() => Image.network(
  //       'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80',
  //       fit: BoxFit.cover,
  //       width: double.infinity,
  //       height: 400,
  //     );

  Widget byRoad(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          key: keyTile,
          initiallyExpanded: isExpanded,
          childrenPadding: EdgeInsets.all(16).copyWith(top: 0),
          title: Text(
            'By Road',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          children: [
            Text(
              'State owned bus facilities of Himachal Pradesh Road Transport Corporation are accessible from Kullu connecting with the nearby cities. Kullu is linked to the national capital, New Delhi (570 km), Chandigarh (267 km), Pathankot (285 km) and Shimla (270 km) as well by tourist luxury buses of Himachal Pradesh Tourism Development Corporation. These deluxe buses solve much of the problems of the travelers worried about how to reach Kullu.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
          // onExpansionChanged: (isExpanded) => Utils.showSnackBar(
          //   context,
          //   text: isExpanded ? 'Expand Tile' : 'Shrink Tile',
          //   color: isExpanded ? Colors.green : Colors.red,
          // ),
        ),
      );

  Widget byAir(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          key: keyTile,
          initiallyExpanded: isExpanded,
          childrenPadding: EdgeInsets.all(16).copyWith(top: 0),
          title: Text(
            'By Air',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          children: [
            Text(
              'The closest airport is Kullu Manali Airport at Bhuntar, which is situated at a distance of around 10 km from the heart of the city, Kullu.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
          // onExpansionChanged: (isExpanded) => Utils.showSnackBar(
          //   context,
          //   text: isExpanded ? 'Expand Tile' : 'Shrink Tile',
          //   color: isExpanded ? Colors.green : Colors.red,
          // ),
        ),
      );

  Widget byRail(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          key: keyTile,
          initiallyExpanded: isExpanded,
          childrenPadding: EdgeInsets.all(16).copyWith(top: 0),
          title: Text(
            'By Rail',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          children: [
            Text(
              'Jogindernagar is the nearest railway station located near Kullu which is at a distance of around 125 km. This railway station is well linked to all the major cities and towns of the country through Chandigarh which is 270 km away from Kullu. Therefore, without thinking much about how to reach Kullu by rail, one needs to hop on a train.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
          // onExpansionChanged: (isExpanded) => Utils.showSnackBar(
          //   context,
          //   text: isExpanded ? 'Expand Tile' : 'Shrink Tile',
          //   color: isExpanded ? Colors.green : Colors.red,
          // ),
        ),
      );
}
