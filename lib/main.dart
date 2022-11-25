import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:text_editor_like_insta/animated_text_kit.dart';
import 'package:text_editor_like_insta/text_edit_insta.dart';

import 'implementation_admob_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Components',
      home: TextEditorLikeInsta(),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:text_editor/text_editor.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   final fonts = [
//     'OpenSans',
//     'Billabong',
//     'GrandHotel',
//     'Oswald',
//     'Quicksand',
//     'BeautifulPeople',
//     'BeautyMountains',
//     'BiteChocolate',
//     'BlackberryJam',
//     'BunchBlossoms',
//     'CinderelaRegular',
//     'Countryside',
//     'Halimun',
//     'LemonJelly',
//     'QuiteMagicalRegular',
//     'Tomatoes',
//     'TropicalAsianDemoRegular',
//     'VeganStyle',
//   ];
//   TextStyle _textStyle = TextStyle(
//     fontSize: 50,
//     color: Colors.white,
//     fontFamily: 'Billabong',
//   );
//   String _text = 'Sample Text';
//   TextAlign _textAlign = TextAlign.center;
//
//   void _tapHandler(text, textStyle, textAlign) {
//     showGeneralDialog(
//       context: context,
//       barrierDismissible: false,
//       transitionDuration: Duration(
//         milliseconds: 400,
//       ), // how long it takes to popup dialog after button click
//       pageBuilder: (_, __, ___) {
//         // your widget implementation
//         return Container(
//           color: Colors.black.withOpacity(0.4),
//           child: Scaffold(
//             backgroundColor: Colors.transparent,
//             body: SafeArea(
//               // top: false,
//               child: Container(
//                 child: TextEditor(
//                   fonts: fonts,
//                   text: text,
//                   textStyle: textStyle,
//                   textAlingment: textAlign,
//                   minFontSize: 10,
//                   // paletteColors: [
//                   //   Colors.black,
//                   //   Colors.white,
//                   //   Colors.blue,
//                   //   Colors.red,
//                   //   Colors.green,
//                   //   Colors.yellow,
//                   //   Colors.pink,
//                   //   Colors.cyanAccent,
//                   // ],
//                   // decoration: EditorDecoration(
//                   //   textBackground: TextBackgroundDecoration(
//                   //     disable: Text('Disable'),
//                   //     enable: Text('Enable'),
//                   //   ),
//                   //   doneButton: Icon(Icons.close, color: Colors.white),
//                   //   fontFamily: Icon(Icons.title, color: Colors.white),
//                   //   colorPalette: Icon(Icons.palette, color: Colors.white),
//                   //   alignment: AlignmentDecoration(
//                   //     left: Text(
//                   //       'left',
//                   //       style: TextStyle(color: Colors.white),
//                   //     ),
//                   //     center: Text(
//                   //       'center',
//                   //       style: TextStyle(color: Colors.white),
//                   //     ),
//                   //     right: Text(
//                   //       'right',
//                   //       style: TextStyle(color: Colors.white),
//                   //     ),
//                   //   ),
//                   // ),
//                   onEditCompleted: (style, align, text) {
//                     setState(() {
//                       _text = text;
//                       _textStyle = style;
//                       _textAlign = align;
//                     });
//                     Navigator.pop(context);
//                   },
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       resizeToAvoidBottomInset: false,
//       body: SafeArea(
//         top: false,
//         child: Center(
//           child: Stack(
//             children: [
//               Center(child: Image.asset('assets/images/practice.jpg')),
//               Center(
//                 child: GestureDetector(
//                   onTap: () => _tapHandler(_text, _textStyle, _textAlign),
//                   child: Text(
//                     _text,
//                     style: _textStyle,
//                     textAlign: _textAlign,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
