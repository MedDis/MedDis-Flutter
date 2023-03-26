import 'package:flutter/material.dart';
import 'package:gsc/view_model/state/home_provider.dart';
import 'package:gsc/views/composition/composition_screen.dart';
import 'package:gsc/views/home/widget/empty_card.dart';
import 'package:gsc/views/home/widget/list_new_cards.dart';
import 'package:gsc/views/home/widget/menu_cards.dart';
import 'package:gsc/views/human_body/human_body_screen.dart';
import 'package:gsc/widgets/custom_search_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text(
          "MedDis",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: const Color(0xFFF5F5F5),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 1 / 16),
            child: const CustomSearchBar(),
          ),
          const SizedBox(
            height: 18,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 1 / 16),
            child: const Text(
              "News",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Consumer<HomeProvider>(builder: (contex, data, _) {
            if (data.dataCards.isNotEmpty) {
              return ListNewCards(
                dataCards: data.dataCards,
              );
            } else {
              return const EmptyCard();
            }
          }),
          const SizedBox(
            height: 18,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 1 / 16),
            child: const Text(
              "Menu",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MenuCards(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CompositionScreen(),
                        ),
                      );
                    },
                    images: "assets/images/compotition_image.png",
                    title: "Composition",
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const MenuCards(
                    images: "assets/images/complaint_image.png",
                    title: "Complaint",
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  MenuCards(
                    images: "assets/images/complaint_image.png",
                    title: "Human Body",
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const HumanBodyScreen(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
