import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sikometh_2/sharedpreferences.dart';
import 'package:sikometh_2/splashscreen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _username = "";

  @override
  void initState() {
    super.initState();
    DataSharedPreferences().readString("username").then((value) {
      setState(() {
        _username = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/background.jpg',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text("Profile"),
          ),
          body: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    width: 100,
                    height: 100,
                    decoration: const ShapeDecoration(
                      shape: CircleBorder(),
                      color: Colors.amber,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.person,
                        size: 80,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Text(
                    _username.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Card(
                  color: Colors.blue,
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: 250,
                    child: Column(
                      children: [
                        Text(
                          _username.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const Divider(
                          color: Colors.white,
                        ),
                        const Text(
                          "19200551825",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const Divider(
                          color: Colors.white,
                        ),
                        const Text(
                          "Universitas ...",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const Divider(
                          color: Colors.white,
                        ),
                        const Text(
                          "Teknik Informatika",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offAll(() => const SplashScreen());
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text("LOGOUT"),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
