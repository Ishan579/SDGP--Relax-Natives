import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class RenderSquat extends StatefulWidget {
  final List<dynamic> xyPointsArray;
  final int imageHeight;
  final int imageWidth;
  final double screenHeight;
  final double screenWidth;

  RenderSquat(
      {this.xyPointsArray, this.imageHeight, this.imageWidth, this. screenHeight, this.screenWidth});
  @override
  _RenderSquatState createState() => _RenderSquatState();
}

class _RenderSquatState extends State<RenderSquat> {
  Map<String, List<double>> inputArray;

  String excerciseName = 'squat';
  double upperValue = 300;
  double lowerValue = 500;
  bool midCount, checkCorrectPosture;
  int _counter;
  Color correctColor;
  double shoulderLY;
  double shoulderRY;
  double kneeRY;
  double kneeLY;
  bool squatUp;
  String whatToDo = 'Finding Posture';
  bool wristAlignment, shoulderAlignment, ankleAlignment, kneeAndHipAlignment;

  var leftEyePosition = Vector(0, 0);
  var rightEyePosition = Vector(0, 0);
  var leftShoulderPosition = Vector(0, 0);
  var rightShoulderPosition = Vector(0, 0);
  var leftHipPosition = Vector(0, 0);
  var rightHipPosition = Vector(0, 0);
  var leftElbowPosition = Vector(0, 0);
  var rightElbowPosition = Vector(0, 0);
  var leftWristPosition = Vector(0, 0);
  var rightWristPosition = Vector(0, 0);
  var leftKneePosition = Vector(0, 0);
  var rightKneePosition = Vector(0, 0);
  var leftAnklePosition = Vector(0, 0);
  var rightAnklePosition = Vector(0, 0);

  @override
  void initState() {
    inputArray = new Map();
    midCount = false;
     checkCorrectPosture = false;
    _counter = 0;
    correctColor = Colors.red;
    shoulderLY = 0;
    shoulderRY = 0;
    kneeRY = 0;
    kneeLY = 0;
    squatUp = true;
    super.initState();
  }

  bool _postureAccordingToExercise(Map<String, List<double>> poses) {
    setState(() {
      shoulderLY = poses['leftShoulder'][1];
      shoulderRY = poses['rightShoulder'][1];
      kneeLY = poses['leftKnee'][1];
      kneeRY = poses['rightKnee'][1];
    });
    if (excerciseName == 'squat') {
      if (squatUp) {
        return poses['leftShoulder'][1] < 320 &&
            poses['leftShoulder'][1] > 280 &&
            poses['rightShoulder'][1] < 320 &&
            poses['rightShoulder'][1] > 280 &&
            poses['rightKnee'][1] > 570 &&
            poses['leftKnee'][1] > 570;
      } else {
        return poses['leftShoulder'][1] > 475 &&
            poses['rightShoulder'][1] > 475;
      }
    }
  }


  _checkCorrectPosture(Map<String, List<double>> poses) {
    if (_postureAccordingToExercise(poses)) {
      if (!checkCorrectPosture) {
        setState(() {
          whatToDo = "leftShoulder should be "+"less than 320";
          whatToDo = "leftShoulder is "+ shoulderLY.toString();
          whatToDo = " leftShoulder should be "+"greater than 280";
          whatToDo = " leftShoulder is "+ shoulderLY.toString();
          whatToDo = " rightShoulder should be "+"less than 320";
          whatToDo = "rightShoulder "+shoulderRY.toString();
          whatToDo = "rightShoulder should be "+"greater than 280";
          whatToDo = "rightShoulder is "+shoulderRY.toString();
          whatToDo = "rightKnee should be "+"greater than 570";
          whatToDo = "rightKnee is "+ kneeRY.toString();
          whatToDo = "leftKnee should be "+"greater than 570";
          whatToDo = "leftKnee is "+ kneeLY.toString();

         checkCorrectPosture = true;
          correctColor = Colors.green;
        });
      }
    } else {
      if (checkCorrectPosture) {
        setState(() {
         checkCorrectPosture = false;
          correctColor = Colors.red;

        });
      }
    }
  }

  Future<void> _countingLogic(Map<String, List<double>> poses) async {
    if (poses != null) {
      _checkCorrectPosture(poses);

      if (checkCorrectPosture && squatUp && midCount == false) {
        //in correct initial posture
        setState(() {
          whatToDo = 'Squat Down';
          //correctColor = Colors.green;
        });
        squatUp = !squatUp;
        checkCorrectPosture = false;
      }

      //lowered all the way
      if (checkCorrectPosture && !squatUp && midCount == false) {
        midCount = true;
        checkCorrectPosture = false;
        squatUp = !squatUp;
        setState(() {
          whatToDo = 'Go Up';
          //correctColor = Colors.green;
        });
      }


      //back up
      if (midCount &&
          poses['leftShoulder'][1] < 320 &&
          poses['leftShoulder'][1] > 280 &&
          poses['rightShoulder'][1] < 320 &&
          poses['rightShoulder'][1] > 280) {
        incrementCounter();
        midCount = false;
        squatUp = !squatUp;
        setState(() {
          //whatToDo = 'Go Up';
        });
      }
    }
  }

  void incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    void _getKeyPoints(k, x, y) {
      if (k["part"] == 'leftEye') {
        leftEyePosition.x = x - 280;
        leftEyePosition.y = y - 25;
      }
      if (k["part"] == 'rightEye') {
        rightEyePosition.x = x - 280;
        rightEyePosition.y = y - 25;
      }
      if (k["part"] == 'leftShoulder') {
        leftShoulderPosition.x = x - 280;
        leftShoulderPosition.y = y - 25;
      }
      if (k["part"] == 'rightShoulder') {
        rightShoulderPosition.x = x - 280;
        rightShoulderPosition.y = y - 25;
      }
      if (k["part"] == 'leftElbow') {
        leftElbowPosition.x = x - 280;
        leftElbowPosition.y = y - 25;
      }
      if (k["part"] == 'rightElbow') {
        rightElbowPosition.x = x - 280;
        rightElbowPosition.y = y - 25;
      }
      if (k["part"] == 'leftWrist') {
        leftWristPosition.x = x - 280;
        leftWristPosition.y = y - 25;
      }
      if (k["part"] == 'rightWrist') {
        rightWristPosition.x = x - 280;
        rightWristPosition.y = y - 25;
      }
      if (k["part"] == 'leftHip') {
        leftHipPosition.x = x - 280;
        leftHipPosition.y = y - 25;
      }
      if (k["part"] == 'rightHip') {
        rightHipPosition.x = x - 280;
        rightHipPosition.y = y - 25;
      }
      if (k["part"] == 'leftKnee') {
        leftKneePosition.x = x - 280;
        leftKneePosition.y = y - 25;
      }
      if (k["part"] == 'rightKnee') {
        rightKneePosition.x = x - 280;
        rightKneePosition.y = y - 25;
      }
      if (k["part"] == 'leftAnkle') {
        leftAnklePosition.x = x - 280;
        leftAnklePosition.y = y - 25;
      }
      if (k["part"] == 'rightAnkle') {
        rightAnklePosition.x = x - 280;
        rightAnklePosition.y = y - 25;
      }
    }

    List<Widget> _renderKeypoints() {
      var lists = <Widget>[];
      widget.xyPointsArray.forEach((re) {
        var list = re["keypoints"].values.map<Widget>((k) {
          var _x = k["x"];
          var _y = k["y"];
          var scaleWidth, scaleHeight, x, y;

          if (widget.screenHeight / widget.screenWidth >
              widget.imageHeight / widget.imageWidth) {
            scaleWidth = widget.screenHeight / widget.imageHeight * widget.imageWidth;
            scaleHeight = widget.screenHeight;
            var difW = (scaleWidth - widget.screenWidth) / scaleWidth;
            x = (_x - difW / 2) * scaleWidth ;
            y = _y * scaleHeight;
          } else {
            scaleHeight = widget.screenWidth / widget.imageWidth * widget.imageHeight;
            scaleWidth = widget.screenWidth;
            var difH = ( scaleHeight - widget.screenHeight) /  scaleHeight ;
            x = _x * scaleWidth;
            y = (_y - difH / 2) * scaleHeight;
          }
          inputArray[k['part']] = [x, y];
          //Mirroring
          if (x > 320) {
            var temp = x - 320;
            x = 320 - temp;
          } else {
            var temp = 320 - x;
            x = 320 + temp;
          }

          _getKeyPoints(k, x, y);

          if (k["part"] == 'leftEye') {
            leftEyePosition.x = x - 280;
            leftEyePosition.y = y - 25;
          }
          if (k["part"] == 'rightEye') {
            rightEyePosition.x = x - 280;
            rightEyePosition.y = y - 25;
          }
          return Positioned(
            left: x - 270,
            top: y - 20,
            width: 100,
            height: 15,
            child: Container(
                // child: Text(
                //   "● ${k["part"]}",
                //   style: TextStyle(
                //     color: Color.fromRGBO(37, 213, 253, 1.0),
                //     fontSize: 12.0,
                //   ),
                // ),
                ),
          );
        }).toList();

        _countingLogic(inputArray);
        inputArray.clear();

        lists..addAll(list);
      });
      //lists.clear();

      return lists;
    }

    return Stack(
      children: <Widget>[
        Stack(
          children: [
            CustomPaint(
              painter:
                  MyPainter(left: leftShoulderPosition, right: rightShoulderPosition),
            ),
            CustomPaint(
              painter: MyPainter(left: leftElbowPosition, right: leftShoulderPosition),
            ),
            CustomPaint(
              painter: MyPainter(left: leftWristPosition, right: leftElbowPosition),
            ),
            CustomPaint(
              painter: MyPainter(left: rightElbowPosition, right: rightShoulderPosition),
            ),
            CustomPaint(
              painter: MyPainter(left: rightWristPosition, right: rightElbowPosition),
            ),
            CustomPaint(
              painter: MyPainter(left: leftShoulderPosition, right: leftHipPosition),
            ),
            CustomPaint(
              painter: MyPainter(left: leftHipPosition, right: leftKneePosition),
            ),
            CustomPaint(
              painter: MyPainter(left: leftKneePosition, right: leftAnklePosition),
            ),
            CustomPaint(
              painter: MyPainter(left: rightShoulderPosition, right: rightHipPosition),
            ),
            CustomPaint(
              painter: MyPainter(left: rightHipPosition, right: rightKneePosition),
            ),
            CustomPaint(
              painter: MyPainter(left: rightKneePosition, right: rightAnklePosition),
            ),
            CustomPaint(
              painter: MyPainter(left: leftHipPosition, right: rightHipPosition),
            ),
          ],
        ),
        Stack(children: _renderKeypoints()),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 50,
            width: widget.screenWidth,
            decoration: BoxDecoration(
              color: correctColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25)),
            ),
            child: Column(
              children: [
                Text(
                  '$whatToDo\nArm Presses: ${_counter.toString()}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Vector {
  double x, y;
  Vector(this.x, this.y);
}

class MyPainter extends CustomPainter {
  Vector left;
  Vector right;
  MyPainter({this.left, this.right});
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(left.x, left.y);
    final p2 = Offset(right.x, right.y);
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 4;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
