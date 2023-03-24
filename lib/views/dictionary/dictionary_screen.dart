import 'package:flutter/material.dart';
import 'package:gsc/view_model/state/dictionary_provider.dart';
import 'package:gsc/views/dictionary/custom_card_drugs.dart';
import 'package:gsc/views/dictionary/custom_category.dart';
import 'package:gsc/widgets/custom_search_bar.dart';
import 'package:provider/provider.dart';

class DictionaryScreen extends StatelessWidget {
  const DictionaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final prov = Provider.of<DictionaryProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text(
          "Dictionary",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: const Color(0xFFF5F5F5),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 1 / 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSearchBar(),
            const SizedBox(
              height: 18,
            ),
            const Text(
              "Jenis",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                  color: Colors.grey,
                  width: 2,
                )),
              ),
              width: double.maxFinite,
              height: size.height * 1 / 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  prov.drugs.length,
                  (index) => CustomCategory(
                    title: prov.drugs[index]["title"]!,
                    asset: prov.drugs[index]["asset"]!,
                  ),
                ),
              ),
            ),
            Column(
              children: List.generate(
                4,
                (index) => const CustomCardDrugs(
                  title: "Abacavir",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
