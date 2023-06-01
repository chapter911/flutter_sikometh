import 'package:flutter/material.dart';

class Jadwal extends StatefulWidget {
  const Jadwal({super.key});

  @override
  State<Jadwal> createState() => _JadwalState();
}

class _JadwalState extends State<Jadwal> {
  final List<String> _hari = [
        "Senin",
        "Senin",
        "Rabu",
        "Kamis",
        "Kamis",
        "Jum'at"
      ],
      _matpel = [
        "10:00 - 12:00 - Pemograman, Ruang : B001",
        "10:00 - 12:00 - Kalkulus, Ruang : B003",
        "10:00 - 12:00 - Pemograman, Ruang : B002",
        "10:00 - 12:00 - Pemograman, Ruang : B005",
        "10:00 - 12:00 - Pemograman, Ruang : B009",
        "09:00 - 11:00 - Pendidikan Agama, Ruang : B009"
      ];

  final List<Widget> _data = [];

  @override
  void initState() {
    super.initState();
    //menampilkan jadwal kuliah
    for (var i = 0; i < _hari.length; i++) {
      _data.add(Container(
        margin: const EdgeInsets.only(bottom: 10),
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
                      _hari[i],
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(_matpel[i]),
                )
              ],
            ),
          ),
        ),
      ));
    }
    setState(() {});
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
            title: const Text("Jadwal Kuliah"),
          ),
          body: Container(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: _data,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
