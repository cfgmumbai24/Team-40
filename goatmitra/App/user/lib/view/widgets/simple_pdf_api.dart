import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdf; // Add the library prefix 'pdf'
import 'package:pdf/widgets.dart';
import 'save_and_open_pdf.dart';
class SimplePdfApi{
  final gemini=Gemini.instance;
  
  Future<String?> getResponse({
    required String name,
    required String weight,
    required String height,
    required String fever,
    required String nose,
    required String lathargic,
    required String diarrhea,
    required String sneezing,
    required String coatChange,
  }) async {
    String query="These are the details about a goat.\n.Dont generate a response using bold characters. Create a Medical Report: \nName: $name\nWeight: $weight\nHeight: $height\nFever: $fever\nRunning Nose: $nose\nLathargic: $lathargic\nDiarrhea: $diarrhea\nSneezing: $sneezing\nCoat Change: $coatChange\n";
    print(query);
    String? response="";
    await gemini.text(query).then((value) {
      print(value);
      response =value?.content?.parts?.last.text;
      print(response);
    });
    return response;
  }
  Future<File> generateSimpleTextPdf({
      required String name,
      required String weight,
      required String height,
      required String fever,
      required String nose,
      required String lathargic,
      required String diarrhea,
      required String sneezing,
      required String coatChange,
    }) async{
      String? gemResponse=await getResponse(name: name, weight: weight, height: height, fever: fever, nose: nose, lathargic: lathargic, diarrhea: diarrhea, sneezing: sneezing, coatChange: coatChange);
      // String text=markdownToPlainText(gemResponse);
      final pdf.Document doc=pdf.Document(); 
      doc.addPage(
        pdf.MultiPage(
          pageFormat: PdfPageFormat.a4,
          build: (context)=>[
            customHeader(),
            customHeadline(name: name), // Pass the 'name' parameter to the customHeadline method
            pdf.Header(
              text:'Diagnosis Report',
              textStyle: pdf.TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ),
            Paragraph(text: gemResponse,
            style: pdf.TextStyle(fontSize: 24)),
          ],
          header: (context)=>buildPageNumber(context),
          footer: (context)=>buildPageNumber(context),
        ) 
      );
      return SaveAndOpenDocument.savePdf(name: 'Report_${name}.pdf', pdf: doc);
    }
  static pdf.Widget customHeader()=>pdf.Container(
    padding: pdf.EdgeInsets.only(bottom: 3*PdfPageFormat.mm),
    decoration: pdf.BoxDecoration(
      border: pdf.Border(
        bottom: pdf.BorderSide(
          color: PdfColors.blue,
          width: 2,
        ),
      ),
    ),
    child: pdf.Row(
      children: [
        PdfLogo(),
        pdf.SizedBox(width: 0.5*PdfPageFormat.cm),
        pdf.Text(
          'Medical Report',
          style: pdf.TextStyle(
            color: PdfColors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 50,
          ),
        )
      ],
    )
  );
  static pdf.Widget customHeadline({required String name})=>pdf.Header(
    child: pdf.Text(
      'Name: ${name}',
      style: pdf.TextStyle(
        color: PdfColors.blue,
        fontWeight: FontWeight.bold,
        fontSize: 50,
      ),
    ),
    padding: pdf.EdgeInsets.all(8),
    decoration: pdf.BoxDecoration(
        color: PdfColors.red,
    ),
  );
  static pdf.Widget buildPageNumber(pdf.Context context){
    return pdf.Container(
      alignment: pdf.Alignment.center,
      margin: pdf.EdgeInsets.only(top: 10),
      child: pdf.Text(
        'Page ${context.pageNumber} of ${context.pagesCount}',
        style: pdf.TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        )
      ),
    );
  }
}