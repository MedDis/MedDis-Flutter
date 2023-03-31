import 'package:flutter/material.dart';
import 'package:gsc/utils/colors.dart';

class SubDictionary extends StatelessWidget {
  const SubDictionary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: const Text(
          "Dextromethorphan HBr",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                // color: Colors.white,
                decoration: const BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
                height: 240,

                // color: primary,
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                ),
              )
            ],
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Deskripsi",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    margin: EdgeInsets.zero,
                    elevation: 5,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      child: Table(
                        border: TableBorder.symmetric(
                          inside: const BorderSide(width: 1),
                        ),
                        children: [
                          buildTableRow(["Golongan", "Obat bebas terbatas"]),
                          buildTableRow(
                              ["Kategori", "Obat batuk kering atau antitusif"]),
                          buildTableRow(["Manfaat", "Meredakan batuk kering"]),
                          buildTableRow([
                            "Konsumsi",
                            "Dewasa dan anak usia lebih dari 4 tahun"
                          ]),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Dosis",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Dewasa dan anak usia > 12 tahun: 30 mg, 3-4 kali sehari. Dosis tidak boleh lebih dari 120 mg per hari.",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Anak usia 6-12 tahun: 15 mg, 3-4 kali sehari. Dosis tidak boleh lebih dari 60 mg per hari.",
                  ),
                  const Text(
                    "Anak usia 4-6 tahun: 7.5 mg, 3-4 kali sehari. Dosis tidak boleh lebih dari 30 mg per hari.",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TableRow buildTableRow(List<String> rowData) => TableRow(
        decoration: const BoxDecoration(),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(rowData[0]),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(rowData[1]),
          ),
        ],
      );
}
