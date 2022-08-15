import 'dart:io';

import 'package:dio/dio.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class QFileUtil{

  static Future<void> openFile({required String url, String? fileName}) async {
    final name = fileName ?? url.split('/').last;
    final file = await downloadFile(url, name);
    if (file == null) return;
    OpenFile.open(file.path);
  }

  static Future<File?> downloadFile(String url, String name) async {
    final appStorage  = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');

    try {
      final response = await Dio().get(
          url,
          options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            receiveTimeout: 0,
          )
      );

      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();

      return file;
    }
    catch (e) {
      return null;
    }
  }

  static List<String> allowedFileTypes() {
    return ['pdf', 'png', 'jpg', 'jpeg', 'doc', 'docx'];
  }

  static List<String> imagesOnly() {
    return ['png', 'jpg', 'jpeg', 'heic'];
  }

  static List<String> pdfOnly() {
    return ['pdf'];
  }

}