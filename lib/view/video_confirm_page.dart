import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:video_player/video_player.dart';

class VideoConfirmPage extends StatelessWidget {
  VideoConfirmPage({Key? key}) : super(key: key);

  late VideoPlayerController vpController;
  TextEditingController _captionController = TextEditingController();
  TextEditingController _songNameController = TextEditingController();

  startPlayerController() {
    print(Get.arguments);
    vpController = VideoPlayerController.file(Get.arguments);
    vpController.initialize();
    vpController.play();
    vpController.setVolume(1);
    vpController.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    startPlayerController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .80,
            child: VideoPlayer(vpController),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: TextField(
              controller: _captionController,
              decoration: const InputDecoration(hintText: "Enter Caption"),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: TextField(
              controller: _songNameController,
              decoration: const InputDecoration(hintText: "Enter Song Name"),
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: myRed,
              ),
              onPressed: () {},
              child: const Text("Share!")),
        ]),
      ),
    );
  }
}
