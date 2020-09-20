import 'dart:io';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:copdb/features/copdb/presentation/animations/FadeAnimation.dart';
import 'package:flutter/material.dart';

typedef void FileCallback(File s);
class ImageSelection extends StatefulWidget 
{
  final FileCallback onFileAdd;
  ImageSelection({this.onFileAdd});
  @override
  _ImageSelection createState() => _ImageSelection();
}

class _ImageSelection extends State<ImageSelection>
{
  File _image;
  final picker = ImagePicker();

  Future getImage() async 
  {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      print(pickedFile.path);
      _image = File(pickedFile.path);
      widget.onFileAdd(_image);
    });
  }


  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      1,
      Container(
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                FadeAnimation(
                  1,
                  GestureDetector(
                      onTap: getImage,
                      child: Container(
                      alignment: Alignment.centerLeft,
                      height: 50,
                      padding: EdgeInsets.only(left: 20.0, right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xFF54C6EB),
                      ),
                      child: Text(
                        'Choose Picture',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ), 
            _image == null ? Container() : Container(
              margin: EdgeInsets.only(top: 24),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(_image.path),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF54C6EB).withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Color(0xFF54C6EB), width: 1.5),
              ),
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}

