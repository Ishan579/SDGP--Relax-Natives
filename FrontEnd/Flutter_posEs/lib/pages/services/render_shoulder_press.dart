import 'package:flutter/material.dart';
class RenderShoulderPress extends StatefulWidget {
  final List<dynamic> xyPointsArray;
  final int imageHeight;
  final int imageWidth;
  final double screenHeight;
  final double screenWidth;

  RenderShoulderPress(
      {this.xyPointsArray, this.imageHeight, this.imageWidth, this.screenHeight, this.screenWidth});
  @override
  _RenderShoulderPressState createState() => _RenderShoulderPressState();
}

class _RenderShoulderPressState extends State<RenderShoulderPress> {
  Map<String, List<double>> inputArr;

  String excercise = 'shoulder_press';
  double upperRange = 300;
  double lowerRange = 500;
  bool midCount, isCorrectPosture;
  int _counter;
  Color correctColor;
  double shoulderLY;
  double shoulderRY;

  double wristLX, wristLY, wristRX, wristRY, elbowLX, elbowRX;
  double kneeRY;
  double kneeLY;
  bool squatUp;
  String whatToDo = 'Finding Posture';

  var leftEyePos = Vector(0, 0);
  var rightEyePos = Vector(0, 0);
  var leftShoulderPos = Vector(0, 0);
  var rightShoulderPos = Vector(0, 0);
  var leftHipPos = Vector(0, 0);
  var rightHipPos = Vector(0, 0);
  var leftElbowPos = Vector(0, 0);
  var rightElbowPos = Vector(0, 0);
  var leftWristPos = Vector(0, 0);
  var rightWristPos = Vector(0, 0);
  var leftKneePos = Vector(0, 0);
  var rightKneePos = Vector(0, 0);
  var leftAnklePos = Vector(0, 0);
  var rightAnklePos = Vector(0, 0);

  @override
  void initState() {
    inputArr = new Map();
    midCount = false;
    isCorrectPosture = false;
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
      wristLX = poses['leftWrist'][0];
      wristLY = poses['leftWrist'][1];
      wristRX = poses['rightWrist'][0];
      wristRY = poses['rightWrist'][1];
      elbowLX = poses['leftElbow'][0];
      elbowRX = poses['rightElbow'][0];

      shoulderLY = poses['leftShoulder'][1];
      shoulderRY = poses['rightShoulder'][1];
      kneeLY = poses['leftKnee'][1];
      kneeRY = poses['rightKnee'][1];
    });
    if (excercise == 'arm_press') {
      if (squatUp) {
        return wristLX > 280 &&
            elbowLX > 280 &&
            wristRX < 95 &&
            elbowRX < 95 &&
            wristLY < 240 &&
            wristLY > 200 &&
            wristRY < 240 &&
            wristRY > 200;
      } else {
        return wristLY < 125 && wristRY < 125;
      }
    }
  }

  _checkCorrectPosture(Map<String, List<double>> poses) {
    if (_postureAccordingToExercise(poses)) {
      if (!isCorrectPosture) {
        setState(() {
          isCorrectPosture = true;
          correctColor = Colors.green;
        });
      }
    } else {
      if (isCorrectPosture) {
        setState(() {
          isCorrectPosture = false;
          correctColor = Colors.red;
        });
      }
    }
  }

  Future<void> _countingLogic(Map<String, List<double>> poses) async {
    if (poses != null) {
      _checkCorrectPosture(poses);

      if (isCorrectPosture && squatUp && midCount == false) {
        //in correct initial posture
        setState(() {
          whatToDo = 'Lift';
          //correctColor = Colors.green;
        });
        squatUp = !squatUp;
        isCorrectPosture = false;
      }

      //lowered all the way
      if (isCorrectPosture && !squatUp && midCount == false) {
        midCount = true;
        isCorrectPosture = false;
        squatUp = !squatUp;
        setState(() {
          whatToDo = 'Drop';
          //correctColor = Colors.green;
        });
      }

      //back up
      if (midCount && isCorrectPosture) {
        incrementCounter();
        midCount = false;
        squatUp = !squatUp;
        setState(() {
          whatToDo = 'Lift';
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
        leftEyePos.x = x - 280;
        leftEyePos.y = y - 25;
      }
      if (k["part"] == 'rightEye') {
        rightEyePos.x = x - 280;
        rightEyePos.y = y - 25;
      }
      if (k["part"] == 'leftShoulder') {
        leftShoulderPos.x = x - 280;
        leftShoulderPos.y = y - 25;
      }
      if (k["part"] == 'rightShoulder') {
        rightShoulderPos.x = x - 280;
        rightShoulderPos.y = y - 25;
      }
      if (k["part"] == 'leftElbow') {
        leftElbowPos.x = x - 280;
        leftElbowPos.y = y - 25;
      }
      if (k["part"] == 'rightElbow') {
        rightElbowPos.x = x - 280;
        rightElbowPos.y = y - 25;
      }
      if (k["part"] == 'leftWrist') {
        leftWristPos.x = x - 280;
        leftWristPos.y = y - 25;
      }
      if (k["part"] == 'rightWrist') {
        rightWristPos.x = x - 280;
        rightWristPos.y = y - 25;
      }
      if (k["part"] == 'leftHip') {
        leftHipPos.x = x - 280;
        leftHipPos.y = y - 25;
      }
      if (k["part"] == 'rightHip') {
        rightHipPos.x = x - 280;
        rightHipPos.y = y - 25;
      }
      if (k["part"] == 'leftKnee') {
        leftKneePos.x = x - 280;
        leftKneePos.y = y - 25;
      }
      if (k["part"] == 'rightKnee') {
        rightKneePos.x = x - 280;
        rightKneePos.y = y - 25;
      }
      if (k["part"] == 'leftAnkle') {
        leftAnklePos.x = x - 280;
        leftAnklePos.y = y - 25;
      }
      if (k["part"] == 'rightAnkle') {
        rightAnklePos.x = x - 280;
        rightAnklePos.y = y - 25;
      }
    }

    List<Widget> _renderKeypoints() {
      var lists = <Widget>[];
      widget.xyPointsArray.forEach((re) {
        var list = re["keypoints"].values.map<Widget>((k) {
          var _x = k["x"];
          var _y = k["y"];
          var scaleW, scaleH, x, y;

          if (widget.screenHeight / widget.screenWidth >
              widget.imageHeight / widget.imageWidth) {
            scaleW = widget.screenHeight / widget.imageHeight * widget.imageWidth;
            scaleH = widget.screenHeight;
            var difW = (scaleW - widget.screenWidth) / scaleW;
            x = (_x - difW / 2) * scaleW;
            y = _y * scaleH;
          } else {
            scaleH = widget.screenWidth / widget.imageWidth * widget.imageHeight;
            scaleW = widget.screenWidth;
            var difH = (scaleH - widget.screenHeight) / scaleH;
            x = _x * scaleW;
            y = (_y - difH / 2) * scaleH;
          }
          inputArr[k['part']] = [x, y];
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
            leftEyePos.x = x - 230;
            leftEyePos.y = y - 45;
          }
          if (k["part"] == 'rightEye') {
            rightEyePos.x = x - 230;
            rightEyePos.y = y - 45;
          }
          return Positioned(
            left: x - 230,
            top: y - 50,
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

        _countingLogic(inputArr);
        inputArr.clear();

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
              MyPainter(left: leftShoulderPos, right: rightShoulderPos),
            ),
            CustomPaint(
              painter: MyPainter(left: leftElbowPos, right: leftShoulderPos),
            ),
            CustomPaint(
              painter: MyPainter(left: leftWristPos, right: leftElbowPos),
            ),
            CustomPaint(
              painter: MyPainter(left: rightElbowPos, right: rightShoulderPos),
            ),
            CustomPaint(
              painter: MyPainter(left: rightWristPos, right: rightElbowPos),
            ),
            CustomPaint(
              painter: MyPainter(left: leftShoulderPos, right: leftHipPos),
            ),
            CustomPaint(
              painter: MyPainter(left: leftHipPos, right: leftKneePos),
            ),
            CustomPaint(
              painter: MyPainter(left: leftKneePos, right: leftAnklePos),
            ),
            CustomPaint(
              painter: MyPainter(left: rightShoulderPos, right: rightHipPos),
            ),
            CustomPaint(
              painter: MyPainter(left: rightHipPos, right: rightKneePos),
            ),
            CustomPaint(
              painter: MyPainter(left: rightKneePos, right: rightAnklePos),
            ),
            CustomPaint(
              painter: MyPainter(left: leftHipPos, right: rightHipPos),
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
