import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/controller/video_home_controller.dart';
import 'package:video_player/video_player.dart';

class VideoHomePage extends StatelessWidget {
  VideoHomePage({Key? key}) : super(key: key);

  final _videoHomeController = Get.put(VideoHomeController());
  late VideoPlayerController _vpController;

  Widget AddVideoPlayer(url) {
    _vpController = VideoPlayerController.network(url)
      ..initialize().then((value) {
        _vpController.play();
        _vpController.setVolume(1);
      });
    return VideoPlayer(_vpController);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(() => PageView.builder(
          itemCount: _videoHomeController.videoList.length,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          scrollDirection: Axis.vertical,
          itemBuilder: (ctx, index) {
            final data = _videoHomeController.videoList[index];
            return Stack(
              children: [
                AddVideoPlayer(data.videoUrl),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(data.profilePhoto),
                            radius: 15,
                          ),
                          SizedBox(width: 5),
                          Text(data.username),
                          SizedBox(width: 5),
                          OutlinedButton(
                            onPressed: () {},
                            child: Text("Follow"),
                          ),
                        ],
                      ),
                      Text(data.caption),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    height: size.height * .30,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: Column(children: [
                            Icon(
                              Icons.thumb_up,
                              size: 25,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(data.likes.length.toString()),
                          ]),
                        ),
                        Container(
                          child: Column(children: [
                            Icon(
                              Icons.comment,
                              size: 25,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(data.commentCount.toString()),
                          ]),
                        ),
                        Container(
                          child: Column(children: [
                            Icon(
                              Icons.share,
                              size: 25,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          })),
    );
  }
}
