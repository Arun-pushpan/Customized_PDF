import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'package:performance/performance.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}



class _HomeState extends State<Home> {
  static const int _initialPage = 1;
  int _actualPageNumber = _initialPage , _allPagesCount = 0;
  bool isSampleDoc = true;
  late PdfControllerPinch _pdfController;

  @override
  void initState() {
    _pdfController = PdfControllerPinch(
      document: PdfDocument.openAsset('assets/dummy.pdf'),
      initialPage: _initialPage,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }
  void display(){
    Text("Project No :");
    SizedBox(height: 20,);
    Text("Project No :");
    SizedBox(height: 20,);
    Text("Project No :");
    SizedBox(height: 20,);
    Text("Project No :");
    SizedBox(height: 20,);

  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text('PDF View'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            onPressed: () {
              _pdfController.previousPage(
                curve: Curves.ease,
                duration: const Duration(milliseconds: 100),
              );
            },
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              '$_actualPageNumber/$_allPagesCount',
              style: const TextStyle(fontSize: 22),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            onPressed: () {
              _pdfController.nextPage(
                curve: Curves.ease,
                duration: const Duration(milliseconds: 100),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () {

              // if (isSampleDoc) {
              //   _pdfController.loadDocument(
              //       PdfDocument.openAsset('assets/dummy.pdf'));
              // } else {
              //   _pdfController.loadDocument(
              //       PdfDocument.openAsset('assets/sample.pdf'));
              // }
              // isSampleDoc = !isSampleDoc;
            },
          ),
          IconButton(
            icon: Icon(Icons.print),
            onPressed: (){},
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 4.0, color: Colors.black),
          ),
            // enabled: true,
            child: PdfViewPinch(
              documentLoader: const Center(child: CircularProgressIndicator()),
              pageLoader: const Center(child: CircularProgressIndicator()),
              controller: _pdfController,

              onDocumentLoaded: (document) {
                setState(() {
                  _allPagesCount = document.pagesCount;
                });
              },
              onPageChanged: (page) {
                setState(() {
                  _actualPageNumber = page;
                });
              },
            ),
          ),
        ),
  );

}