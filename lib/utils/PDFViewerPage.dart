import 'dart:io';

import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class PDFViewerPage extends StatefulWidget {

  final File file;

  const PDFViewerPage({required this.file});

  @override
  State<PDFViewerPage> createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  bool _isLoading = true;
  late PDFDocument _pdf;

  void _loadFile() async {
    // Load the pdf file from the
    _pdf = await PDFDocument.fromFile(widget.file);

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PDF Viewer")),
      body: Container(
        child: _isLoading
          ? const Center(child: CircularProgressIndicator())
        : PDFViewer(document: _pdf)
        ),
      );
  }
}
