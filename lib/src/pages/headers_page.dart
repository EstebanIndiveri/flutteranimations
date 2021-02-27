import 'package:disenos/src/pages/animaciones_page.dart';
import 'package:flutter/material.dart';
// import 'package:disenos/src/widwets/headers.dart';


class HeadersPage extends StatelessWidget {
  const HeadersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:AnimacionesPage()
    );
  }
}