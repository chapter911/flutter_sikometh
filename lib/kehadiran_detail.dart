import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KehadiranDetail extends StatefulWidget {
  const KehadiranDetail({super.key});

  @override
  State<KehadiranDetail> createState() => _KehadiranDetailState();
}

class _KehadiranDetailState extends State<KehadiranDetail> {
  String _matpel = "";
  final List<String> _tanggal = [
        "2023-01-01",
        "2023-01-02",
        "2023-01-03",
        "2023-01-04",
        "2023-01-05",
        "2023-01-06",
        "2023-01-07",
        "2023-01-08",
        "2023-01-09",
        "2023-01-10",
        "2023-01-11",
        "2023-01-12",
        "2023-01-13",
        "2023-01-14"
      ],
      _kehadiran = [
        "H",
        "H",
        "H",
        "H",
        "H",
        "H",
        "A",
        "H",
        "H",
        "H",
        "I",
        "H",
        "H",
        "H"
      ];
  final List<Widget> _list = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      _matpel = Get.arguments;
    });
    for (int i = 0; i < _tanggal.length; i++) {
      _list.add(Card(
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
                child: Text(
                  "Pertemuan Ke : $i",
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text("Tanggal ${_tanggal[i]}"),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        color: _kehadiran[i] == "H"
                            ? Colors.green
                            : _kehadiran[i] == "I"
                                ? Colors.yellow
                                : Colors.red,
                        child: Text(
                          _kehadiran[i],
                          style: TextStyle(
                            color: _kehadiran[i] == "H" || _kehadiran[i] == "A"
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ));
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
            title: Text("Detail Kehadiran $_matpel"),
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
