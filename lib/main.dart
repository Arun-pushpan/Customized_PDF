// //main.dart file :
//
// import 'package:flutter/material.dart';
// import 'package:g_pdf/pdf_view.dart';
//
//
// void main() {
//   runApp(MaterialApp(
//     theme: ThemeData(textTheme: TextTheme()),
//     home: MyPage(),
//   ));
// }
//
// class MyPage extends StatelessWidget {
//   const MyPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: MaterialButton(
//           color: Colors.blue,
//           child: Text("Generate Pdf"),
//           onPressed: () {
//             orderPdfView(context, "Purchase Order");
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:g_pdf/home.dart';
import 'package:g_pdf/pdf_generate.dart';

void main (){
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.black,
          selectionColor: Colors.cyan,
          selectionHandleColor: Colors.grey
        ),
        appBarTheme: AppBarTheme(
          color: Colors.yellow,
          shape: Border.all(),
          elevation: 20,
        )
      ),
      debugShowCheckedModeBanner: false,

      title: "PDF View",
      home:PdfView(),
    );
  }
}


// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   static const int _initialPage = 2;
//   int _actualPageNumber = _initialPage, _allPagesCount = 0;
//   bool isSampleDoc = true;
//   late PdfControllerPinch _pdfController;
//
//   @override
//   void initState() {
//     _pdfController = PdfControllerPinch(
//       document: PdfDocument.openAsset('assets/hello.pdf'),
//       initialPage: _initialPage,
//     );
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _pdfController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) => MaterialApp(
//     theme: ThemeData(primaryColor: Colors.white),
//     darkTheme: ThemeData.dark(),
//     home: Scaffold(
//       backgroundColor: Colors.grey,
//       appBar: AppBar(
//         title: const Text('PDF View'),
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(Icons.navigate_before),
//             onPressed: () {
//               _pdfController.previousPage(
//                 curve: Curves.ease,
//                 duration: const Duration(milliseconds: 100),
//               );
//             },
//           ),
//           Container(
//             alignment: Alignment.center,
//             child: Text(
//               '$_actualPageNumber/$_allPagesCount',
//               style: const TextStyle(fontSize: 22),
//             ),
//           ),
//           IconButton(
//             icon: const Icon(Icons.navigate_next),
//             onPressed: () {
//               _pdfController.nextPage(
//                 curve: Curves.ease,
//                 duration: const Duration(milliseconds: 100),
//               );
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.download),
//             onPressed: () {
//               // if (isSampleDoc) {
//               //   _pdfController.loadDocument(
//               //       PdfDocument.openAsset('assets/dummy.pdf'));
//               // } else {
//               //   _pdfController.loadDocument(
//               //       PdfDocument.openAsset('assets/sample.pdf'));
//               // }
//               // isSampleDoc = !isSampleDoc;
//             },
//           )
//         ],
//       ),
//       body: CustomPerformanceOverlay(
//         // enabled: true,
//         child: PdfViewPinch(
//           documentLoader: const Center(child: CircularProgressIndicator()),
//           pageLoader: const Center(child: CircularProgressIndicator()),
//           controller: _pdfController,
//           onDocumentLoaded: (document) {
//             setState(() {
//               _allPagesCount = document.pagesCount;
//             });
//           },
//           onPageChanged: (page) {
//             setState(() {
//               _actualPageNumber = page;
//             });
//           },
//         ),
//       ),
//     ),
//   );
//
// }