import 'dart:ui';

import 'package:copdb/features/copdb/presentation/pages/SignUpScreenPages/PasswordScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/SignUpScreenPages/_Screen.dart';
import 'package:copdb/features/copdb/presentation/widgets/ImageSelection.dart';
import 'package:flutter/material.dart';


class AvatarScreen extends StatefulWidget 
{
  @override
  _AvatarScreen createState() => _AvatarScreen();
}

class _AvatarScreen extends State<AvatarScreen>
{
  @override
  Widget build(BuildContext context) {
    return Screen(
      text: 'select a profile \npicture',
      page: PasswordScreen(),
      alt: ImageSelection(
        onFileAdd: (image) 
        {
          // on image add from gallery
          // image is a File class
        },
      ),
      onSubmit: (s) {
        //on press next from the _screen
      },
    );
  }
}

