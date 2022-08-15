import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:try_file_picker_all/utils/QFileUtil.dart';
import 'package:try_file_picker_all/utils/QStyle.dart';
import 'package:try_file_picker_all/utils/q_string_util.dart';

class SimplePicker extends StatefulWidget{

  const SimplePicker({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SimplePickerState();
  }

}

//tidak cocok untuk upload dokumen word, excel, ppt. in such cases either do not preview the result directly or use the advance picker style.
class SimplePickerState extends State<SimplePicker>{

  PlatformFile? platformFile=null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Simple Picker")),
      body: Center(child: Column(
        children: [
          const SizedBox(height: 48,),
          InkWell(
            child: const Text('Tap to pick a file',),
            onTap: ()async{
              showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                      title: const Text('File apa yang ingin anda unggah?'),
                      content: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children : <Widget>[
                          _buildUploadGambar(),
                          const SizedBox(height:10),
                          _buildUploadPDF(),
                          const SizedBox(height:10),
                          _buildUploadCamera(),
                        ],)));
          },),
          const SizedBox(height: 48,),
          Text(platformFile==null?"":platformFile!.name),
        ],),),
    );
  }

  Widget _buildUploadGambar() {
    String scope="exam, _buildUploadGambar";
    return InkWell(
      onTap: () async {
        QStringUtil.log(scope,"handle upload gambar disini");
        Navigator.pop(context);
        final result = await FilePicker.platform.pickFiles(
          allowMultiple: false,
          type: FileType.image,
        );
        if (result == null) return;
        setState(() {
          platformFile = result.files.first;
        });},
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        decoration: boxDecorations(bgColor: Colors.blue, radius: 4),
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Expanded(flex:1, child: Icon(Icons.image, size: 30, color: Colors.white)), // icon
            Expanded(flex:4, child: Text('Gambar', style: TextStyle(color: Colors.white))), // text
          ],
        ),
      ),
    );
  }

  Widget _buildUploadPDF() {
    String scope="exam, _buildUploadPDF";
    return InkWell(
      onTap: () async {
        QStringUtil.log(scope,"handle upload pdf disini");
        Navigator.pop(context);
        final result = await FilePicker.platform.pickFiles(
          allowMultiple: false,
          type: FileType.custom,
          allowedExtensions: QFileUtil.pdfOnly(),
        );
        if (result == null) return;
        setState(() {
          platformFile = result.files.first;
        });},
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        decoration: boxDecorations(
            bgColor: Colors.blue, radius: 4),
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Expanded(flex:1, child: Icon(Icons.picture_as_pdf, size: 30, color: Colors.white)), // icon
            Expanded(flex:4, child: Text('PDF', style: TextStyle(color: Colors.white))), // text
          ],
        ),
      ),
    );
  }

  Widget _buildUploadCamera() {
    return InkWell(
      onTap: (){
        openPicker(ImageSource.camera);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        decoration: boxDecorations(
            bgColor: Colors.blue, radius: 4),
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Expanded(flex:1, child: Icon(Icons.photo_camera, size: 30, color: Colors.white)), // icon
            Expanded(flex:4, child: Text('Kamera', style: TextStyle(color: Colors.white))), // text
          ],
        ),
      ),
    );
  }

  openPicker(ImageSource source) async {
    var picture = await ImagePicker().pickImage(source: source, maxHeight: 1920, maxWidth: 1080);

    if(picture != null){
      PlatformFile platformFileFromCamera = PlatformFile(name: picture.name, size: await picture.length(), readStream: picture.openRead(), path: picture.path);

      setState(() {
        platformFile=platformFileFromCamera;
      });

    }

    Navigator.pop(context);
  }

}