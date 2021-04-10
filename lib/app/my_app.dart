import 'package:presente_crud/app/view/presente_details.dart';
import 'package:presente_crud/app/view/presente_form.dart';
import 'package:flutter/material.dart';

import 'view/presente_list.dart';

class MyApp extends StatelessWidget {
  static const HOME = '/';
  static const PRESENTE_FORM = 'presente-form';
  static const PRESENTE_DETAILS = 'presente-details';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Presentes - App Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        HOME: (context) => PresenteList(),
        PRESENTE_FORM: (context) => PresenteForm(),
        PRESENTE_DETAILS: (context) => PresenteDetails()
      },
    );
  }
}
