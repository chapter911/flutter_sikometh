import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Nilai extends StatefulWidget {
  const Nilai({super.key});

  @override
  State<Nilai> createState() => _NilaiState();
}

class _NilaiState extends State<Nilai> {
  final List<String> _matpel = ["Pemograman", "Pendidikan Agama", "Kalkulus"],
      _kuis = ["80.00", "75.00", "93.00"],
      _tugas = ["80.00", "80.00", "80.00"],
      _uts = ["80.00", "80.00", "80.00"],
      _uas = ["80.00", "80.00", "80.00"],
      _akhir = ["81.00", "82.00", "83.00"],
      _sks = ["3 sks", "2 sks", "3 sks"],
      _bobot = ["85.00", "85.00", "85.00"],
      _kn = ["85.00", "85.00", "85.00"];

  final List<Widget> _list = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < _matpel.length; i++) {
      _list.add(InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.blue,
                child: Center(
                  child: Text(
                    _matpel[i],
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              titlePadding: const EdgeInsets.all(0),
              content: Table(
                border: const TableBorder(
                  horizontalInside: BorderSide(
                    width: 1,
                    color: Colors.blue,
                    style: BorderStyle.solid,
                  ),
                ),
                children: [
                  TableRow(children: [
                    const Text("Kuis"),
                    const Text(" : "),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(_kuis[i]),
                    ),
                  ]),
                  TableRow(children: [
                    const Text("Tugas"),
                    const Text(" : "),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(_tugas[i]),
                    ),
                  ]),
                  TableRow(children: [
                    const Text("UTS"),
                    const Text(" : "),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(_uts[i]),
                    ),
                  ]),
                  TableRow(children: [
                    const Text("UAS"),
                    const Text(" : "),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(_uas[i]),
                    ),
                  ]),
                  TableRow(children: [
                    const Text("Nilai Akhir"),
                    const Text(" : "),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(_akhir[i]),
                    ),
                  ]),
                  const TableRow(children: [
                    Text("Kuis"),
                    Text(" : "),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text("90"),
                    ),
                  ]),
                  TableRow(children: [
                    const Text("SKS"),
                    const Text(" : "),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(_sks[i]),
                    ),
                  ]),
                  TableRow(children: [
                    const Text("Bobot"),
                    const Text(" : "),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(_bobot[i]),
                    ),
                  ]),
                  TableRow(children: [
                    const Text("K * N"),
                    const Text(" : "),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(_kn[i]),
                    ),
                  ]),
                ],
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
                )
              ],
            ),
          );
        },
        child: Card(
          elevation: 15,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Container(
                color: Colors.blue,
                width: double.maxFinite,
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    _matpel[i],
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(10),
                child: Text(
                  _sks[i],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
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
            title: const Text("Nilai"),
          ),
          body: Container(
            padding: const EdgeInsets.all(10),
            child: Column(children: _list),
          ),
        ),
      ],
    );
  }
}
