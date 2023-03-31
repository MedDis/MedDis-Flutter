import 'package:flutter/material.dart';
import 'package:gsc/utils/finite_state.dart';
import 'package:gsc/view_model/state/composition_provider.dart';
import 'package:provider/provider.dart';

import '../dictionary/custom_card_drugs.dart';

class CompositionOutput extends StatelessWidget {
  const CompositionOutput({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<CompositionProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text("Drug Compositions"),
        backgroundColor: const Color(0xFFF5F5F5),
      ),
      body: Consumer<CompositionProvider>(
        builder: (context, data, _) {
          if (data.actionState == StateAction.loading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (data.processedData.isEmpty) {
              return const Center(
                child: Text("Tidak Mendeteksi Apapun"),
              );
            } else {
              return SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  child: Column(
                    children: List.generate(
                      prov.processedData.length,
                      (index) => CustomCardDrugs(
                        title: prov.processedData[index] ?? "Empty",
                        id: 0,
                      ),
                    ),
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
