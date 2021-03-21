// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'dart:io';

// class SignUpImages extends StatefulWidget {
//   SignUpImages(this.parentAction);
//   final ValueChanged<List<dynamic>> parentAction;
//   @override
//   State<StatefulWidget> createState() => _SignUpImages();
// }

// class _SignUpImages extends State<SignUpImages>
//     with AutomaticKeepAliveClientMixin<SignUpImages> {
//   int _imagePosition = 0;
//   List<File> _imageList = List<File>.generate(4, (file) => File(''));

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.only(top: 28.0, bottom: 28.0),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.only(left: 18.0),
//                 child: Align(
//                   alignment: Alignment.center,
//                   child: Text(
//                     'Select Profile Pic',
//                     style: TextStyle(fontSize: 20),
//                   ),
//                 ),
//               ),
//               Container(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.all(15.0),
//                       child: new GestureDetector(
//                         onTap: () {
//                           _imagePosition = 0;
//                           _getImage();
//                         },
//                         child: Container(
//                           width: 120,
//                           height: 120,
//                           child: Card(
//                               child: (_imageList[0].path != '')
//                                   ? Image.file(
//                                       _imageList[0],
//                                       fit: BoxFit.fill,
//                                     )
//                                   : Icon(Icons.add_photo_alternate,
//                                       size: 100, color: Colors.grey[700])),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(15.0),
//                       child: new GestureDetector(
//                         onTap: () {
//                           _imagePosition = 1;
//                           _getImage();
//                         },
//                         child: Container(
//                           width: 120,
//                           height: 120,
//                           child: Card(
//                               child: (_imageList[1].path != '')
//                                   ? Image.file(
//                                       _imageList[1],
//                                       fit: BoxFit.fill,
//                                     )
//                                   : Icon(Icons.add_photo_alternate,
//                                       size: 100, color: Colors.grey[700])),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.all(15.0),
//                       child: new GestureDetector(
//                         onTap: () {
//                           _imagePosition = 2;
//                           _getImage();
//                         },
//                         child: Container(
//                           width: 120,
//                           height: 120,
//                           child: Card(
//                               child: (_imageList[2].path != '')
//                                   ? Image.file(
//                                       _imageList[2],
//                                       fit: BoxFit.fill,
//                                     )
//                                   : Icon(Icons.add_photo_alternate,
//                                       size: 100, color: Colors.grey[700])),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(15.0),
//                       child: new GestureDetector(
//                         onTap: () {
//                           _imagePosition = 3;
//                           _getImage();
//                         },
//                         child: Container(
//                           width: 120,
//                           height: 120,
//                           child: Card(
//                               child: (_imageList[3].path != '')
//                                   ? Image.file(
//                                       _imageList[3],
//                                       fit: BoxFit.fill,
//                                     )
//                                   : Icon(Icons.add_photo_alternate,
//                                       size: 100, color: Colors.grey[700])),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _setGenderToData(String key, dynamic value) {
//     List<dynamic> addData = List<dynamic>();
//     addData.add(key);
//     addData.add(value);
//     widget.parentAction(addData);
//   }

//   Future _getImage() async {
//     // Get image from gallery.
//     // PickedFile imageFile = await ImagePicker.getImage(source: ImageSource.gallery);
//     // ignore: deprecated_member_use
//     File image = await ImagePicker.pickImage(source: ImageSource.gallery);
//     _cropImage(image);
//   }

//   Future<Null> _cropImage(File image) async {
//     File croppedFile = await ImageCropper.cropImage(
//         sourcePath: image.path,
//         aspectRatioPresets: Platform.isAndroid
//             ? [
//                 CropAspectRatioPreset.square,
//                 CropAspectRatioPreset.ratio3x2,
//                 CropAspectRatioPreset.original,
//                 CropAspectRatioPreset.ratio4x3,
//                 CropAspectRatioPreset.ratio16x9
//               ]
//             : [
//                 CropAspectRatioPreset.original,
//                 CropAspectRatioPreset.square,
//                 CropAspectRatioPreset.ratio3x2,
//                 CropAspectRatioPreset.ratio4x3,
//                 CropAspectRatioPreset.ratio5x3,
//                 CropAspectRatioPreset.ratio5x4,
//                 CropAspectRatioPreset.ratio7x5,
//                 CropAspectRatioPreset.ratio16x9
//               ],
//         androidUiSettings: AndroidUiSettings(
//             toolbarTitle: 'Cropper',
//             toolbarColor: Colors.blue[800],
//             toolbarWidgetColor: Colors.white,
//             initAspectRatio: CropAspectRatioPreset.original,
//             lockAspectRatio: false),
//         iosUiSettings: IOSUiSettings(
//           title: 'Cropper',
//         ));

//     if (croppedFile != null) {
//       setState(() {
//         _setGenderToData('image$_imagePosition', croppedFile.path);
//         _imageList[_imagePosition] = croppedFile;
//       });
//     }
//   }

//   @override
//   bool get wantKeepAlive => true;
// }
