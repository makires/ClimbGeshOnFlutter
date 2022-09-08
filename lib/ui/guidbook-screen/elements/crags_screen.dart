import 'dart:io';
import 'dart:async';
import 'dart:typed_data';
import 'package:climb_gesh_on_flutter_demo/ui/guidbook-screen/climbing_area_model.dart';
import 'package:climb_gesh_on_flutter_demo/ui/guidbook-screen/elements/crag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

class GuidbookPdfWidget extends StatefulWidget {
  const GuidbookPdfWidget({
    Key? key,
    required this.file,
  }) : super(key: key);
  final File file;
  @override
  State<GuidbookPdfWidget> createState() => _GuidbookPdfWidgetState();
}

class _GuidbookPdfWidgetState extends State<GuidbookPdfWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Печатный гайдбук'),
      ),
      body: PDFView(filePath: widget.file.path),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       appBar: AppBar(
  //         title: Text('PDF'),
  //       ),
  //       body: SfPdfViewer.network(
  //           'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf'));
  // }
}

class ApiPdf {
  static Future<File> loadAsset(String nameAsset) async {
    Completer<File> completer = Completer();
    try {
      final data = await rootBundle.load('assets/pdf/$nameAsset');
      final bytes = data.buffer.asUint8List();
      final directory = await getApplicationDocumentsDirectory();
      File file = File('${directory.path}/$nameAsset');
      await file.writeAsBytes(bytes);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }
    return completer.future;
  }
}

class CragsListScreen extends StatelessWidget {
  const CragsListScreen({
    Key? key,
    required this.area,
  }) : super(key: key);

  static const routeName = '/crags';
  final ClimbingAreaModel area;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Скалы'),
        actions: [
          if (area.guidbookUrl.isNotEmpty)
            IconButton(
              onPressed: () async {
                var guidFile = await ApiPdf.loadAsset(area.guidbookUrl);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => GuidbookPdfWidget(
                      file: guidFile,
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.menu_book_sharp,
                size: 28,
              ),
            )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var crag in area.crags) CragWidget(crag: crag),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
