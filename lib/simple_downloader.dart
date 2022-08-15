import 'package:flutter/material.dart';

class SimpleDownloader extends StatefulWidget{
  const SimpleDownloader({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new SimpleDownloaderState();
  }
}

class SimpleDownloaderState extends State<SimpleDownloader>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple Downloader")),
      body: Center(child: Column(
        children: [
          InkWell(child: const Text('Tap to download a file',),onTap: ()async{

          },),
        ],),),
    );
  }
}