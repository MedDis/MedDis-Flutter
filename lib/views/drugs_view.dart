import 'package:flutter/material.dart';
import 'package:gsc/utils/finite_state.dart';
import 'package:provider/provider.dart';

import '../view_model/state/drugs_state.dart';

class DrugsView extends StatefulWidget {
  const DrugsView({Key? key, required this.id}) : super(key: key);
  final int id;

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
      body: Consumer<DrugsProvider>(
        builder: (context, value, child) {
          if (value.drugsState == StateAction.hasData) {
            return Column(
              children: [
                Text(value.data!.name),
                Text("======="),
                Text(value.data!.desc),
                Text("======="),
                Text(value.data!.dosage),
              ],
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
