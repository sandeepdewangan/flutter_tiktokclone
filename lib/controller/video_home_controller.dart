import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/model/video.dart';

class VideoHomeController extends GetxController {
  final RxList<Video> _videoList = RxList<Video>([]);
  List<Video> get videoList => _videoList.value;

  @override
  void onInit() {
    super.onInit();
    _videoList.bindStream(
        fireStore.collection('videos').snapshots().map((QuerySnapshot query) {
      List<Video> videos = [];
      for (var element in query.docs) {
        videos.add(Video.fromSnap(element));
      }
      return videos;
    }));
  }
}
