import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sikometh_2/kehadiran_detail.dart';

class Kehadiran extends StatefulWidget {
  const Kehadiran({super.key});

  @override
  State<Kehadiran> createState() => _KehadiranState();
}

class _KehadiranState extends State<Kehadiran> {
  final List<String> _matpel = ["Pemograman", "Pendidikan Agama", "Kalkulus"],
      _sks = ["3 sks", "2 sks", "3 sks"],
      _persentase = ["95 %", "92 %", "80 %"];

  final List<Widget> _list = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < _matpel.length; i++) {
      _list.add(
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: InkWell(
            onTap: () {
              Get.to(() => const KehadiranDetail(), arguments: _matpel[i]);
            },
            child: Card(
              elevation: 15,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.maxFinite,
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          _matpel[i],
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(_sks[i]),
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Text(_persentase[i]),
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
        ),
      );
    }
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
            title: const Text("Kehadiran Mahasiswa"),
          ),
          body: Container(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(children: _list),
            ),
          ),
        ),
      ],
    );
  }
}
