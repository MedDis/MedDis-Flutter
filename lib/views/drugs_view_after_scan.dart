import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/state/drugs_state.dart';

class DrugsViewAfterScan extends StatefulWidget {
  const DrugsViewAfterScan({Key? key, required this.id, required this.name})
      : super(key: key);
  final int id;
  final String name;

  @override
  State<DrugsViewAfterScan> createState() => _DrugsViewAfterScanState();
}

class _DrugsViewAfterScanState extends State<DrugsViewAfterScan> {
  @override
  void initState() {
    Future.microtask(() => Provider.of<DrugsProvider>(context, listen: false)
      ..fetchDrugssData(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      backgroundColor: Colors.white,
      body: Consumer<DrugsProvider>(
        builder: (context, value, child) {
          return SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 18,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Drugs Description',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                      'Paracetamol is a medicine to relieve fever and mild to moderate pain, such as headaches, menstrual pain, or aches. Paracetamol or acetaminophen is available as tablets, syrup, drops, suppositories and infusions.'),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Benefits',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text('Relieves fever and pain'),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Dosage',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        textAlign: TextAlign.start,
                        text: const TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: "Adult :",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                )),
                            TextSpan(
                              text:
                                  'Two capsules or 500 mg tablets, taken every 4-6 hours, maximum dose per day is 4000 mg.',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      RichText(
                        textAlign: TextAlign.start,
                        text: const TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: "Children 12 years and older: ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                )),
                            TextSpan(
                              text:
                                  '325 mg-650 mg, taken every 4-6 hours or 1000 mg every 6-8 hours.',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      RichText(
                        textAlign: TextAlign.start,
                        text: const TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: "Children <12 years: ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                )),
                            TextSpan(
                              text:
                                  'syrup preparation of 120 mg-500 mg, taken every 4-6 hours, maximum 4 doses in a day.',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      RichText(
                        textAlign: TextAlign.start,
                        text: const TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: "Infants 1-2 months: ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                )),
                            TextSpan(
                              text:
                                  'drop preparation of 30-60 mg, taken every 8 hours.',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Side Effects',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                      "Right upper abdomen pain, Dark-colored urine, Pale or grayish stools, Loss of appetite, Unusually tired, Penyakit kuning"),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Drug Interactions',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        textAlign: TextAlign.start,
                        text: const TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Warfarin",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      RichText(
                        textAlign: TextAlign.start,
                        text: const TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: "Carbamazepine: ",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                )),
                            TextSpan(
                              text:
                                  'May decrease the effectiveness of Paracetamol',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      RichText(
                        textAlign: TextAlign.start,
                        text: const TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text:
                                    "Primidone, phenytoin, or phenobarbital: ",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                )),
                            TextSpan(
                              text: 'Can lower serum concentrations',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      RichText(
                        textAlign: TextAlign.start,
                        text: const TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: "Metoclopramide: ",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                )),
                            TextSpan(
                              text:
                                  'May increase the absorption of Paracetamol',
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.start,
                        text: const TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: "Cholestyramine: ",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                )),
                            TextSpan(
                              text: 'May decrease drug absorption',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
