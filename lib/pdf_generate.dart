import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import 'home.dart';

class PdfView extends StatefulWidget {
  const PdfView({Key? key}) : super(key: key);

  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {

  @override
  Widget build(BuildContext context) {
    MediaQuery
        .of(context)
        .size
        .height;
    MediaQuery
        .of(context)
        .size
        .width;
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 20,
            centerTitle: true,
            title: const Text("Convert PDF ",
              textAlign: TextAlign.center,

              style: TextStyle(fontWeight: FontWeight.w800,
                  fontSize: 25,
                  fontFamily: 'Lobster'
              ),),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 400,
                  width: 400,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            blurStyle: BlurStyle.inner,
                            color: Colors.black,
                            offset: Offset(4.0, 2.0),
                            blurRadius: 2.0,
                            spreadRadius: 2.0
                        )
                      ]
                  ),
                  child: Column(
                    children: [
                       SizedBox(height: 60),
                      Container(
                        height: 80,
                        width: 300,
                        child: ElevatedButton(
                          child: Text("Generate PDF",style: TextStyle(fontSize: 25,
                          fontWeight: FontWeight.w900),),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => Home()));
                          },),
                      ),
                      SizedBox(height: 80,),
                      Container(
                        height: 80,
                        width: 300,
                        child: ElevatedButton(
                          child: Text("Display  PDF",style: TextStyle(fontSize: 25,
                              fontWeight: FontWeight.w900),),
                          onPressed: _displayPdf),
                      ),

                    ],
                  ),
                ),
              ),
            ),

          ),


        )
    );
  }
  void _displayPdf() {
    final doc = pw.Document();
    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Container(
            height: 900,
            width: double.infinity,
            padding: pw.EdgeInsets.only(left: 10,top: 50),
            decoration: pw.BoxDecoration(
              border: pw.Border.all(width: 4,
                color: PdfColor.fromHex('#000000'),
              ),
            ),
             child: pw.Column(
               //mainAxisAlignment: pw.MainAxisAlignment,
               crossAxisAlignment: pw.CrossAxisAlignment.start,
               children: [
                 pw.Text(
                'Project Name          :',
                style: pw.TextStyle(fontSize: 25,
                    fontWeight: pw.FontWeight.bold),
                ),pw.SizedBox(height: 40),
                 pw.Text(
                   'Agreement No        :',
                   style: pw.TextStyle(fontSize: 25,
                       fontWeight: pw.FontWeight.bold),
                 ),pw.SizedBox(height: 40),
                 pw.Text(
                   'Project No              :',
                   style: pw.TextStyle(fontSize: 25,
                       fontWeight: pw.FontWeight.bold),
                 ),pw.SizedBox(height: 40),
                 pw.Text(
                   'Document No         :',
                   style: pw.TextStyle(fontSize: 25,
                       fontWeight: pw.FontWeight.bold),
                 ),pw.SizedBox(height: 40),
                 pw.Text(
                   'Revision No            :',
                   style: pw.TextStyle(fontSize: 25,
                       fontWeight: pw.FontWeight.bold),
                 ),pw.SizedBox(height: 40),
                 pw.Text(
                   'Any additional info :',
                   style: pw.TextStyle(fontSize: 25,
                       fontWeight: pw.FontWeight.bold),
                 ),
               ]
             )
          );
        },
      ),
    );

    /// open Preview Screen
    Navigator.push(context, MaterialPageRoute(builder:
        (context) => PreviewScreen(doc: doc),));
  }

}
class PreviewScreen extends StatelessWidget {
  final pw.Document doc;

  const PreviewScreen({
    Key? key,
    required this.doc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_outlined),
        ),
        centerTitle: true,
        title: Text("Preview"),
      ),
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 4,color: Colors.grey)
        ),
        child: PdfPreview(
          build: (format) => doc.save(),
          allowSharing: true,
          allowPrinting: true,
          initialPageFormat: PdfPageFormat.a4,
          pdfFileName: "mydoc.pdf",
        ),
      ),
    );
  }
}
