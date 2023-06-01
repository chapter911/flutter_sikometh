import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Surat extends StatefulWidget {
  const Surat({super.key});

  @override
  State<Surat> createState() => _SuratState();
}

class _SuratState extends State<Surat> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        'assets/background.jpg',
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Surat"),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Container(
                        padding: const EdgeInsets.all(10),
                        color: Colors.blue,
                        child: const Center(
                          child: Text(
                            "Surat Panggilan 1",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      titlePadding: const EdgeInsets.all(0),
                      content: Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red[900],
                          ),
                          child: const Text("TUTUP"),
                        ),
                      ],
                    ),
                  );
                },
                child: Card(
                  elevation: 10,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          width: double.maxFinite,
                          color: Colors.blue,
                          child: const Center(
                            child: Text(
                              "Surat Panggilan 1",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          width: double.maxFinite,
                          child: const Center(
                            child: Text(
                              "DiTujukkan Kepada Orang Tua",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
