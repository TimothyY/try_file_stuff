import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:try_file_picker_all/simple_downloader.dart';
import 'package:try_file_picker_all/simple_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Try File Picker ALL"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(child: const Text('Go to simple_download_file sample',),onTap: ()async{
              showToast('handle Go to file_picker sample here',duration: Duration(seconds: 2),
                position: ToastPosition.bottom,
                backgroundColor: Colors.black.withOpacity(0.8),
                radius: 13.0,);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SimpleDownloader()),
              );
            },),
            SizedBox(height: 64,),
            InkWell(child: const Text('Go to simple_picker_for_image_n_file_n_camera sample',),onTap: ()async{
              showToast('handle Go to image_n_file_picker sample here',duration: Duration(seconds: 2),
                position: ToastPosition.bottom,
                backgroundColor: Colors.black.withOpacity(0.8),
                radius: 13.0,);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SimplePicker()),
              );
            },),
          ],
        ),
      ),
    );
  }
}
