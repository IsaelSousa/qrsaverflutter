import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:qrsaver/shared/models/user_model.dart';
import 'package:qrsaver/shared/services/auth/auth_controller.dart';

class LoginController {
  final authController = AuthController();

  Future<void> googleSignIn(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email'
      ],
    );
    try {
      final response = await _googleSignIn.signIn();
      final user = UserModel(
        name: response!.displayName!,
        photoURL: response.photoUrl
      );
      authController.setUser(context, user);
      print(user);

    } catch (error) {
      authController.setUser(context, null);
      print(error); // ignore: avoid_print
    }
  }
}
