import 'package:flutter/material.dart';
import 'package:gsc/utils/finite_state.dart';
import 'package:provider/provider.dart';

import '../view_model/state/drugs_state.dart';

class DrugsView extends StatefulWidget {
  const DrugsView({Key? key, required this.id, required this.name})
      : super(key: key);
  final int id;
  final String name;

  @override
  State<DrugsView> createState() => _DrugsViewState();
}

class _DrugsViewState extends State<DrugsView> {
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
          if (value.drugsState == StateAction.hasData) {
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
                    Text(value.data!.desc),
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
                    Text(value.data!.dosage),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      'Drug Composition',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(value.data!.composition),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      'Drug Indication',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(value.data!.indication),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      'Drug Effect',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(value.data!.effect),
                  ],
                ),
              ),
            );
          } else if (value.drugsState == StateAction.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Center(
              child: Text('Error'),
            );
          }
        },
      ),
    );
  }
}
