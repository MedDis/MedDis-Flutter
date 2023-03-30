import 'package:flutter/material.dart';

class ListDiseaseCard extends StatelessWidget {
  const ListDiseaseCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          2,
          (index) => Row(
            children: [
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Container(
                  height: size.height * 2 / 16,
                  width: size.width * 3.5 / 8,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://cdn.shopify.com/s/files/1/1282/4197/articles/urticaria_skin_834x.jpg?v=1651854304",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 1 / 72,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
