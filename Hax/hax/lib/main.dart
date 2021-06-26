import 'dart:io';
import 'package:hax/tensorflow.dart';
import 'package:tflite/tflite.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
var finalimage;
var recognitions;
var pickedfile;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Future<void>takepicture() async {
  //   await Permission.camera.request();
  //   pickedfile = await ImagePicker.platform.pickImage(source: ImageSource.gallery,maxHeight: 400);
  //   setState(() {
  //     finalimage = File(pickedfile.path);
  //   });
  // // }
  // void loadmodel()async{
  //   String res = await Tflite.loadModel(
  //       model: "assets/model.tflite",
  //       labels: "assets/labels.txt",
  //       numThreads: 1, // defaults to 1
  //       isAsset: true, // defaults to true, set to false to load resources outside assets
  //       useGpuDelegate: false // defaults to false, set to true to use GPU delegate
  //   );
  // }
  @override
  void initState() {
    // loadmodel();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text('HAX'),
      ),
      body: Center(
        child: Tensorflow(),
        // child: Column(
        //
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     FloatingActionButton(onPressed: takepicture),
        //     Container(child:finalimage==null?Text('No Image'): Image.file(finalimage),),
        //     FloatingActionButton(onPressed: (){
        //      setState(() {
        //         recognitions =  Tflite.runModelOnImage(
        //            path: pickedfile.path,   // required
        //            imageMean: 0.0,   // defaults to 117.0
        //            imageStd: 255.0,  // defaults to 1.0
        //            numResults: 2,    // defaults to 5
        //            threshold: 0.2,   // defaults to 0.1
        //            asynch: true      // defaults to true
        //        );
        //         print('\n\n\naaaaaaaaaaaaaaa${recognitions}aaaaaaaaaaaaaaaaaaaa\n\n\n');
        //      });
        //     }),
        //     Text('\n\n\naaaaaaaaaaaaaaa${recognitions}aaaaaaaaaaaaaaaaaaaa\n\n\n')
        //   ]
        // ),
      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
