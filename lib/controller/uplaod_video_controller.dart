import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/model/video.dart';
import 'package:video_compress/video_compress.dart';

class UploadVideoController extends GetxController {
  late String _filename;

  generateIdForVideoNImage() {
    Timestamp ts = Timestamp.now();
    _filename = "${ts.microsecondsSinceEpoch}-${ts.microsecondsSinceEpoch}";
  }

  // upload video
  uploadVideo(
      {required String songName,
      required String caption,
      required String videoPath}) async {
    // Generate the id for video and image thmbnail file
    generateIdForVideoNImage();
    try {
      String uid = firebaseAuth.currentUser!.uid;
      // get user details
      DocumentSnapshot userDoc =
          await fireStore.collection("users").doc(uid).get();

      // upload the video
      String videoUrl = await _uploadVideoToStorage(videoPath);
      // upload image thumnail of video storage
      String thumbUrl = await _uploadImageThumnailToStorage(videoPath);
      // Video model
      Video video = Video(
          username: (userDoc.data()! as Map<String, dynamic>)['username'],
          uid: uid,
          id: _filename,
          likes: [],
          commentCount: 0,
          shareCount: 0,
          songName: songName,
          caption: caption,
          videoUrl: videoUrl,
          profilePhoto:
              (userDoc.data()! as Map<String, dynamic>)['profilePhoto'],
          thumbnail: thumbUrl);
      await fireStore.collection("videos").doc(_filename).set(
            video.toJson(),
          );
      Get.back();
    } catch (e) {
      Get.snackbar("Error Uploading Video", e.toString());
    }
  }

  _uploadVideoToStorage(String videoPath) async {
    Reference ref = firebaseStorage.ref().child('videos').child(_filename);
    // put into db
    UploadTask task = ref.putFile(await _compressVideo(videoPath));
    TaskSnapshot snap = await task;
    String downloadURL = await snap.ref.getDownloadURL();
    return downloadURL;
  }

  _compressVideo(String videoPath) async {
    final compressedVideo = await VideoCompress.compressVideo(videoPath,
        quality: VideoQuality.MediumQuality);
    return compressedVideo!.file;
  }

  Future<String> _uploadImageThumnailToStorage(String videoPath) async {
    Reference ref = firebaseStorage.ref().child('thumbnails').child(_filename);
    UploadTask task = ref.putFile(await _getThumbnail(videoPath));
    TaskSnapshot snap = await task;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  _getThumbnail(String videoPath) async {
    final thumb = await VideoCompress.getFileThumbnail(videoPath);
    return thumb;
  }
}
