import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sikometh_2/jadwal.dart';
import 'package:sikometh_2/kehadiran.dart';
import 'package:sikometh_2/nilai.dart';
import 'package:sikometh_2/profilepage.dart';
import 'package:sikometh_2/sharedpreferences.dart';
import 'package:sikometh_2/splashscreen.dart';
import 'package:sikometh_2/surat.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
            title: const Text("Selamat Datang"),
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: () {
                  DataSharedPreferences().clearData();
                  Get.offAll(() => const SplashScreen());
                },
                icon: const Icon(
                  Icons.power_settings_new,
                ),
              ),
            ],
          ),
          body: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => const ProfilePage());
                  },
                  child: Card(
                    elevation: 10,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Image.asset(
                              'assets/logo_app.jpg',
                              scale: 15,
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text("19200551825"),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    _username.toUpperCase(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text("Teknik Informatika"),
                                ),
                                const Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    "Universitas ...",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: InkWell(
                    onTap: () {
                      Get.to(() => const Jadwal());
                    },
                    child: Card(
                      elevation: 10,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            color: Colors.blue,
                            child: const Center(
                              child: Text(
                                "Jadwal Kuliah Anda Selanjutnya ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("10:00 - Kalkulus, Ruang : B001"),
                                Divider(),
                                Text("11:00 - Pemograman, Ruang : B005"),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: (1 / 0.7),
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(() => const Jadwal());
                          },
                          child: Card(
                            elevation: 15,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: Container(
                                      padding: const EdgeInsets.all(10),
                                      child: Image.asset(
                                        'assets/timetable.png',
                                        fit: BoxFit.fill,
                                      )),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.blue,
                                    child: const Center(
                                      child: Text(
                                        "Jadwal Kuliah",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => const Kehadiran());
                          },
                          child: Card(
                            elevation: 15,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: Container(
                                      padding: const EdgeInsets.all(10),
                                      child: Image.asset(
                                        'assets/attendance.png',
                                        fit: BoxFit.fill,
                                      )),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.blue,
                                    child: const Center(
                                      child: Text(
                                        "Kehadiran",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => const Nilai());
                          },
                          child: Card(
                            elevation: 15,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: Container(
                                      padding: const EdgeInsets.all(10),
                                      child: Image.asset(
                                        'assets/score.png',
                                        fit: BoxFit.fill,
                                      )),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.blue,
                                    child: const Center(
                                      child: Text(
                                        "Nilai",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => const Surat());
                          },
                          child: Card(
                            elevation: 15,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: Container(
                                      padding: const EdgeInsets.all(10),
                                      child: Image.asset(
                                        'assets/letter.png',
                                        fit: BoxFit.fill,
                                      )),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.blue,
                                    child: const Center(
                                      child: Text(
                                        "Surat",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              const url = "https://wa.me/+6282190957447";
              await launchUrlString(
                url,
                mode: LaunchMode.externalApplication,
              );
            },
            child: const Icon(Icons.message),
          ),
        ),
      ],
    );
  }
}
