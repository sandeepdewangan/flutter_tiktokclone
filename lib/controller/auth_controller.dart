import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/view/home_page.dart';
import 'package:tiktok_clone/view/login_page.dart';
import '../model/user.dart' as UserModel;

class AuthController extends GetxController {
  // Instance will find the auth controller
  static AuthController instance = Get.find();
  // Profile Image
  Rx<File?>? _pickedImage;
  // Firebase auth user
  late Rx<User?> _user;

  // Profile pic getter
  File? get profilePhoto => _pickedImage!.value;

  // on ready, when first time apps loads up.
  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    // Whenever the _user got changes we will call a function.
    ever(_user, _setInitialPage);
  }

  _setInitialPage(User? user) {
    if (user == null) {
      Get.offAll(() => LoginPage());
    } else {
      Get.offAll(() => const HomePage());
    }
  }

  // Registering a user
  void registerUser(
    String username,
    String email,
    String password,
    File? image,
  ) async {
    try {
      // validation check
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        // Save data to storage
        UserCredential userCredential = await firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password);
        // upload image to db
        String downloadUrl = await uploadImage(image);

        UserModel.User user = UserModel.User(
          email: email,
          username: username,
          profilePhoto: downloadUrl,
          uid: userCredential.user!.uid,
        );

        // Upload user information to the firestore
        await fireStore
            .collection('users')
            .doc(userCredential.user!.uid)
            .set(user.toJson());
      } else {
        Get.snackbar("Error Creating Account", "Please enter all the fields.");
      }
    } catch (e) {
      Get.snackbar("Error Creating Account", e.toString());
    }
  }

  // upload image to firebase storage
  Future<String> uploadImage(File image) async {
    Reference ref = firebaseStorage
        .ref()
        .child("profilePics")
        .child(firebaseAuth.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  void pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Get.snackbar("Profile Pic", "Profile Pic Image Choosen Successfully.");
    }
    _pickedImage = Rx<File?>(File(pickedImage!.path));
  }

  void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
      } else {
        Get.snackbar(
            "Error Loggin into Account", "Enter username and password");
      }
    } catch (e) {
      Get.snackbar("Error Loggin into Account", e.toString());
    }
  }
}
