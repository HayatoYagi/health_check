import 'package:flutter/material.dart';
import 'package:health_check/firebase/fire_auth.dart';
import 'package:health_check/ui/form/form_page.dart';

class LaunchPage extends StatelessWidget {
  const LaunchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                // TODO: add loading indicator
                await FireAuth.signIn();
                // TODO: move to HomeView
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const FormPage()));
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
