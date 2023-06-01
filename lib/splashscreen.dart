import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sikometh_2/dashboard.dart';
import 'package:sikometh_2/sharedpreferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) {
      setState(() {
        isLoading = false;
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
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/logo_app.jpg',
                    scale: 5,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "SIKOMETH 2",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 70, right: 70, top: 20),
                    child: isLoading
                        ? const LinearProgressIndicator(
                            backgroundColor: Colors.orange,
                          )
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                controller: _username,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  labelText: "username",
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: const Icon(Icons.person),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextField(
                                controller: _password,
                                textAlign: TextAlign.center,
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: "password",
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: const Icon(Icons.vpn_key),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: double.maxFinite,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_username.text.isEmpty) {
                                      Get.snackbar("Informasi",
                                          "Harap input username anda",
                                          colorText: Colors.black,
                                          backgroundColor: Colors.yellow);
                                    } else if (_password.text != "123") {
                                      Get.snackbar("Maaf",
                                          "Password yang anda masukkan salah",
                                          colorText: Colors.black,
                                          backgroundColor: Colors.yellow);
                                    } else {
                                      DataSharedPreferences().saveString(
                                          "username", _username.text);
                                      Get.to(() => const Dashboard());
                                    }
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("MASUK"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
