import 'package:flutter/material.dart';
import 'package:gsc/utils/finite_state.dart';
import 'package:gsc/view_model/state/dictionary_provider.dart';
import 'package:gsc/view_model/state/drugs_product_state.dart';
import 'package:gsc/views/dictionary/custom_card_drugs.dart';
import 'package:gsc/views/dictionary/custom_category.dart';
import 'package:gsc/widgets/custom_search_bar.dart';
import 'package:provider/provider.dart';

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({super.key});

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  @override
  void initState() {
    Future.microtask(() =>
        Provider.of<DrugsProductProvider>(context, listen: false)
          ..fetchDrugsProductsData());
    super.initState();
  }

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
            const Flexible(flex: 0, child: const CustomSearchBar()),
            const Flexible(
              flex: 0,
              child: SizedBox(
                height: 18,
              ),
            ),
            const Flexible(
              flex: 0,
              child: Text(
                "Type",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Flexible(
              flex: 0,
              child: Container(
                // decoration: const BoxDecoration(
                //   border: Border(
                //       bottom: BorderSide(
                //     color: Colors.grey,
                //     width: 2,
                //   )),
                // ),
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
            ),
            Expanded(
              flex: 1,
              child: Consumer<DrugsProductProvider>(
                builder: (context, value, _) {
                  print(value.drugsProductState);
                  if (value.drugsProductState == StateAction.hasData) {
                    return ListView.builder(
                      itemCount: value.data.length,
                      itemBuilder: (context, index) => CustomCardDrugs(
                        title: value.data[index].name!,
                      ),
                    );
                  } else if (value.drugsProductState == StateAction.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Center(
                      child: Text(value.drugsProductMessage),
                    );
                  }
                },
              ),
            ),
            // Column(
            //   children: List.generate(
            //     4,
            //     (index) => const CustomCardDrugs(
            //       title: "Abacavir",
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
