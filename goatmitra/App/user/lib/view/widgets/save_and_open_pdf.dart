import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';


class SaveAndOpenDocument{
  static Future<File> savePdf({
    required String name,
    required Document pdf,
  }) async{
    final root=await getExternalStorageDirectory();
    final file=File('${root!.path}/$name');
    await file.writeAsBytes(await pdf.save());
    debugPrint('${root!.path}/$name');
    return file;
  }

  static Future<void> openPDF(File file) async{
    final path=file.path;
    await OpenFile.open(path);
  }
}
