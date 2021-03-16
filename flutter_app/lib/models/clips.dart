class VideoClip {
  final String description;
  final String thumbName;
  final String title;
  final String parent;
  final int runtime;

  VideoClip(this.title, this.description, this.runtime, this.thumbName, this.parent);

  String videoPath() {
    return "$parent";
  }

  String thumbPath() {
    return "$thumbName";
  }

  // ignore: non_constant_identifier_names
  static List<VideoClip> Clips18_28 = [
    VideoClip("Execrise 1", "Leg ", 0, "img/thumb.png", "https://www.googleapis.com/drive/v3/files/1YQwYz619iIub1gX_pn1gyOeVOIj4B702?alt=media&key=AIzaSyDHmVFBJHYqoK-bVMWztb51iGNx4uF5GiU"),
    VideoClip("Execrise 2", "Arm", 0, "img/thumb.png", "https://www.googleapis.com/drive/v3/files/1YBwQX64N87SNX_gnjWT0x1QAPQLnyKuV?alt=media&key=AIzaSyBN_y5s3dJjYBnawgYKLOalBLbV9y0cS7s"),
    VideoClip("Execrise 3", "Neck", 0, "img/thumb.png", "https://www.googleapis.com/drive/v3/files/1mWP4hchab-qmlAf4k-gMbAQvYycHwJr6?alt=media&key=AIzaSyBN_y5s3dJjYBnawgYKLOalBLbV9y0cS7s"),
    VideoClip("Execrise 4", "Hand", 0, "img/thumb.png", "https://www.googleapis.com/drive/v3/files/1mWP4hchab-qmlAf4k-gMbAQvYycHwJr6?alt=media&key=AIzaSyBN_y5s3dJjYBnawgYKLOalBLbV9y0cS7s"),
    VideoClip("Execrise 5", "Head", 0, "img/thumb.png", "https://www.googleapis.com/drive/v3/files/1x9LmqCnfVPyHz64DQqPNGgCVFlRUAJ45?alt=media&key=AIzaSyBN_y5s3dJjYBnawgYKLOalBLbV9y0cS7s"),
  ];

  // ignore: non_constant_identifier_names
  static List<VideoClip> Clips28_48 = [
    VideoClip("Execrise 1", "Leg ", 0, "", "https://www.googleapis.com/drive/v3/files/1M2TZDyJv7qyDd7HeRxiqYx8nOGHdN66H?alt=media&key=AIzaSyBN_y5s3dJjYBnawgYKLOalBLbV9y0cS7s"),
    VideoClip("Execrise 2", "Arm", 0, "", "https://www.googleapis.com/drive/v3/files/1YBwQX64N87SNX_gnjWT0x1QAPQLnyKuV?alt=media&key=AIzaSyBN_y5s3dJjYBnawgYKLOalBLbV9y0cS7s"),
    VideoClip("Execrise 3", "Neck", 0, "", "https://www.googleapis.com/drive/v3/files/1mWP4hchab-qmlAf4k-gMbAQvYycHwJr6?alt=media&key=AIzaSyBN_y5s3dJjYBnawgYKLOalBLbV9y0cS7s"),
    VideoClip("Execrise 4", "Hand", 0, "", "https://www.googleapis.com/drive/v3/files/1mWP4hchab-qmlAf4k-gMbAQvYycHwJr6?alt=media&key=AIzaSyBN_y5s3dJjYBnawgYKLOalBLbV9y0cS7s"),
    VideoClip("Execrise 5", "Head", 0, "", "https://www.googleapis.com/drive/v3/files/1x9LmqCnfVPyHz64DQqPNGgCVFlRUAJ45?alt=media&key=AIzaSyBN_y5s3dJjYBnawgYKLOalBLbV9y0cS7s"),
  ];

  // ignore: non_constant_identifier_names
  static List<VideoClip> Clips48_58 = [
    VideoClip("Execrise 1", "Leg ", 0, "", "https://www.googleapis.com/drive/v3/files/1M2TZDyJv7qyDd7HeRxiqYx8nOGHdN66H?alt=media&key=AIzaSyBN_y5s3dJjYBnawgYKLOalBLbV9y0cS7s"),
    VideoClip("Execrise 2", "Arm", 0, "", "https://www.googleapis.com/drive/v3/files/1YBwQX64N87SNX_gnjWT0x1QAPQLnyKuV?alt=media&key=AIzaSyBN_y5s3dJjYBnawgYKLOalBLbV9y0cS7s"),
    VideoClip("Execrise 3", "Neck", 0, "", "https://www.googleapis.com/drive/v3/files/1mWP4hchab-qmlAf4k-gMbAQvYycHwJr6?alt=media&key=AIzaSyBN_y5s3dJjYBnawgYKLOalBLbV9y0cS7s"),
    VideoClip("Execrise 4", "Hand", 0, "", "https://www.googleapis.com/drive/v3/files/1mWP4hchab-qmlAf4k-gMbAQvYycHwJr6?alt=media&key=AIzaSyBN_y5s3dJjYBnawgYKLOalBLbV9y0cS7s"),
    VideoClip("Execrise 5", "Head", 0, "", "https://www.googleapis.com/drive/v3/files/1x9LmqCnfVPyHz64DQqPNGgCVFlRUAJ45?alt=media&key=AIzaSyBN_y5s3dJjYBnawgYKLOalBLbV9y0cS7s"),
  ];
}

