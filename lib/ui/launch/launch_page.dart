import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_check/firebase/fire_auth.dart';
import 'package:health_check/firebase/firestore.dart';
import 'package:health_check/ui/edit_profile/edit_profile_page.dart';
import 'package:health_check/ui/home/home_page.dart';

class LaunchPage extends StatelessWidget {
  const LaunchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 96, 123, 184),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "健康観察入力アプリ",
              style: TextStyle(
                color: Colors.white,
                // TODO: set font
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset(
              "assets/images/health-check.png",
              width: MediaQuery.of(context).size.width * 0.7,
            ),
            ElevatedButton(
              onPressed: () async {
                showGeneralDialog(
                    context: context,
                    barrierDismissible: false,
                    transitionDuration: const Duration(milliseconds: 300),
                    barrierColor: Colors.black.withOpacity(0.5),
                    pageBuilder: (BuildContext context, Animation animation,
                        Animation secondaryAnimation) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    });
                try {
                  await FireAuth.signIn();
                } on FirebaseAuthException catch (e) {
                  print(e);
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  return;
                }

                if (await Firestore.getUserData() == null) {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditProfilePage(
                                fromLaunchPage: true,
                              )));
                } else {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: const StadiumBorder(),
                fixedSize: Size(
                  MediaQuery.of(context).size.width - 60,
                  50,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/google-color.png",
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text(
                    "Google Sign-In",
                    style: TextStyle(
                      color: Colors.grey,
                      // TODO: set font
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
