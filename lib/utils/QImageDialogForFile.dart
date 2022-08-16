import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QImageDialogForFile extends StatelessWidget {

  final File file;

  //requiring the list of todos
  // QImageDialogForNetwork({Key key, required this.fileURL}) : super(key: key);
  QImageDialogForFile({required this.file});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        //decoration: BoxDecoration(color: Colors.amber),
        // child: Text('text $i', style: TextStyle(fontSize: 16.0),)
        child: InteractiveViewer(
          panEnabled: true,
          boundaryMargin: EdgeInsets.all(100),
          maxScale: 2,
          child: Image.file(
            // 'images/contoh_soal.png',
            file,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

// image: DecorationImage(image: AssetImage('images/contoh_soal.png'),fit: BoxFit.contain)
