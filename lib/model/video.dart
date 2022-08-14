import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Video {
  String username;
  String uid;
  String id;
  List likes;
  int commentCount;
  int shareCount;
  String songName;
  String caption;
  String videoUrl;
  String profilePhoto;
  String thumbnail;

  Video({
    required this.username,
    required this.uid,
    required this.id,
    required this.likes,
    required this.commentCount,
    required this.shareCount,
    required this.songName,
    required this.caption,
    required this.videoUrl,
    required this.profilePhoto,
    required this.thumbnail,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'id': id,
        'likes': likes,
        'commentCount': commentCount,
        'shareCount': shareCount,
        'songName': songName,
        'caption': caption,
        'videoUrl': videoUrl,
        'profilePhoto': profilePhoto,
        'thumbnail': thumbnail,
      };

  static Video fromSnap(DocumentSnapshot snap) {
    return Video(
      username: snap['username'] ?? '',
      uid: snap['uid'] ?? '',
      id: snap['id'] ?? '',
      likes: List.from(snap['likes']),
      commentCount: snap['commentCount']?.toInt() ?? 0,
      shareCount: snap['shareCount']?.toInt() ?? 0,
      songName: snap['songName'] ?? '',
      caption: snap['caption'] ?? '',
      videoUrl: snap['videoUrl'] ?? '',
      profilePhoto: snap['profilePhoto'] ?? '',
      thumbnail: snap['thumbnail'] ?? '',
    );
  }
}
