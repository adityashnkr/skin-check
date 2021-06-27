import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
var source;

class Tensorflow extends StatefulWidget {
  @override
  _TensorflowState createState() => _TensorflowState();
}

class _TensorflowState extends State<Tensorflow> {
  List _outputs;
  File _image;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model.tflite",
      labels: "assets/labels.txt",
      numThreads: 1,
    );
  }
  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        );
    setState(() {
      _loading = false;
      _outputs = output;
    });
  }
  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
  pickImage() async {
    var image = await ImagePicker.pickImage(source: source);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = image;
    });
    classifyImage(_image);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Skin Check",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        backgroundColor: Colors.amber,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _loading ? Container(
              height: 300,
              width: 300,
            ):
            Container(
              margin: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _image == null ? Container() : Container(child:Image.file(_image),height: 300,),
                  SizedBox(
                    height: 20,
                  ),
                  _image == null ? Container() : _outputs != null ?
                  Text(_outputs[0]["label"],style: TextStyle(color: Colors.black,fontSize: 20),
                  ) : Container(child: Text(""))
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(mainAxisAlignment:MainAxisAlignment.center,
              children: [
              FloatingActionButton(
                tooltip: 'Pick Image',
                onPressed: (){
                  setState(() {
                    source = ImageSource.gallery;
                  });
                  pickImage();},
                child: Icon(Icons.add_a_photo,
                  size: 20,
                  color: Colors.white,
                ),
                backgroundColor: Colors.amber,
              ),
              SizedBox(width: 20,),
              FloatingActionButton(
                tooltip: 'Pick Image',
                onPressed: (){
                  setState(() {
                    source = ImageSource.camera;
                  });
                  pickImage();},
                child: Icon(Icons.camera,
                  size: 20,
                  color: Colors.white,
                ),
                backgroundColor: Colors.amber,
              ),
            ],),
            SizedBox(height: 20,),
            Container(child: FlatButton(padding:EdgeInsets.all(10), child: Text('Consult to Doctors'),onPressed:(){ Navigator.pushNamed(context,'DoctorsList');},),color: Colors.amber,)

          ],
        ),
      ),
    );
  }
}
