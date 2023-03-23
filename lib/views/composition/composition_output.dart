import 'package:flutter/material.dart';
import 'package:gsc/utils/finite_state.dart';
import 'package:gsc/view_model/state/composition_provider.dart';
import 'package:provider/provider.dart';

class CompositionOutput extends StatelessWidget {
  const CompositionOutput({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<CompositionProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Composition Output"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Consumer<CompositionProvider>(builder: (context, data, _) {
          if (data.actionState == StateAction.loading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                prov.processedData.length,
                (index) {
                  return Text(prov.processedData[index]);
                },
              ),
            );
          }
        }),
      ),
    );
  }
}
