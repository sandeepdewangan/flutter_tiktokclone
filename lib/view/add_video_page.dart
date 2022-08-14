import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/view/video_confirm_page.dart';

class AddVideoPage extends StatelessWidget {
  const AddVideoPage({Key? key}) : super(key: key);

  pickaVideo(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Get.to(() => VideoConfirmPage(), arguments: File(video.path));
    }
  }

  showOptionButton(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              children: [
                SimpleDialogOption(
                  padding: const EdgeInsets.all(10),
                  onPressed: () => pickaVideo(ImageSource.gallery, context),
                  child: Row(
                    children: const [
                      Icon(Icons.image),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Gallery"),
                    ],
                  ),
                ),
                SimpleDialogOption(
                    padding: const EdgeInsets.all(10),
                    onPressed: () => pickaVideo(ImageSource.camera, context),
                    child: Row(
                      children: const [
                        Icon(Icons.camera),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Camera"),
                      ],
                    )),
                SimpleDialogOption(
                    padding: const EdgeInsets.all(10),
                    onPressed: () => Get.back(),
                    child: Row(
                      children: const [
                        Icon(Icons.cancel),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Cancel"),
                      ],
                    )),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => showOptionButton(context),
          style: ElevatedButton.styleFrom(
            primary: myRed,
          ),
          child: const Text(
            "Add Video",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
