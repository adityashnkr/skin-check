import 'package:flutter/material.dart';
import 'package:tensorflow/tensorflow.dart';

import 'Chat.dart';
import 'Doctors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tensorflow Lite',
      home: Tensorflow(),
      routes: {
        'Tensorflow': (context) => Tensorflow(),
        'DoctorsList': (context) => DoctorsList(),
        'Chats': (context) => Chats(),
      }
    );
  }
}
