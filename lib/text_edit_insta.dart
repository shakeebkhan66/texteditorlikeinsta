import 'package:flutter/material.dart';
import 'package:text_editor/text_editor.dart';

class TextEditorLikeInsta extends StatefulWidget {
  const TextEditorLikeInsta({Key? key}) : super(key: key);

  @override
  State<TextEditorLikeInsta> createState() => _TextEditorLikeInstaState();
}

class _TextEditorLikeInstaState extends State<TextEditorLikeInsta> {

  final fonts = [
    'OpenSans',
    'Billabong',
    'GrandHotel',
    'Oswald',
    'Quicksand',
    'BeautifulPeople',
    'BeautyMountains',
    'BiteChocolate',
    'BlackberryJam',
    'BunchBlossoms',
    'CinderelaRegular',
    'Countryside',
    'Halimun',
    'LemonJelly',
    'QuiteMagicalRegular',
    'Tomatoes',
    'TropicalAsianDemoRegular',
    'VeganStyle',
  ];

  String _text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          children: [
            Center(child: Image.asset("assets/images/practice.jpg", fit: BoxFit.cover,)),
            Center(
              child: TextEditor(
                text: _text,
                  fonts: fonts,
                  onEditCompleted: (style, align, text){
                    setState(() {
                      style = const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
                      align = TextAlign.center;
                      _text = text;
                    });
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}
