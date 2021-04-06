import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
class Home2 extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home2> {
  bool _loading = true;
  File _image;
  List _output;

  final picker =ImagePicker();
  @override
  void initState(){
    super.initState();
    loadModel().then((value) {

      setState(() {

      });

    });

  }

  //creating an async  function named classify Image , taking Image as a para
  classifyImage(File image) async {
    loadModel();
    var output = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,

    );
    setState(() {
      _output = output;
      _loading = false;
    });
  }
  loadModel() async {
    await Tflite.loadModel(
      model: 'assets/model_unquant.tflite',
      labels:'assets/labels.txt',
    );

  }


  @override
  void dispose(){
    //TODO : implement dispose
    Tflite.close();
    super.dispose();
  }
pickImage () async{
    var image = await picker.getImage(
        source: ImageSource.gallery
    );
    if(image ==null) {
      return null;
    }
    setState(() {
      _image=File(image.path);
    });

    classifyImage(_image);

}

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.amberAccent,
        body: Container(

          padding: EdgeInsets.symmetric(horizontal: 24),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height:85
              ),
              Text('TeachableMachine.com CNN',
                style: TextStyle(
                  color: Colors.black
                ),
              ),
              SizedBox(height:6
              ),
              Text('Cats and Dogs',
                style: TextStyle(
                    color: Colors.black,
                  fontSize: 28
                ),
              ),
              SizedBox(height:40
              ),
              Center(
                child: _loading ? Container(
                  width: 280,
                  child:Column(
                    children:<Widget> [
                      Image.asset('assets/catvsdog.jpeg'),
                      SizedBox(height:50
                      ),
                    ],
                  )
                ):Container(
                  child:Column(
                    children: <Widget>[
                      Container(
                        height: 250,
                        child:
                          Image.file(_image),
                      ),
                      SizedBox(
                        height:20,
                      ),
                  _output != null ? Text ('${_output}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  ) :Container(

                  )

                    ],
                  )
                ),
              ),
              Container(
                  width:MediaQuery.of(context).size.width,
                child:Column(children:<Widget> [
                  GestureDetector(
                    onTap:(){},
                    child:Container(
                        width: MediaQuery.of(context).size.width-260,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 17),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child:(Text("Take a photo",
                          style:TextStyle(
                            color: Colors.white,
                          ))
                      )
                    )
                  ),
                  SizedBox(
                      height:10),
                    GestureDetector(
                        onTap:pickImage,
                        child:Container(
                            width: MediaQuery.of(context).size.width-260,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 25,
                                vertical: 17),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child:(Text("Camera",
                                style:TextStyle(
                                  color: Colors.white,
                                ))
                            )
                        )
                    ),

                ],
                )
              )
            ],
          )
        ),
      );
  }
}
