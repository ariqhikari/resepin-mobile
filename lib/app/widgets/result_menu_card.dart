part of 'widgets.dart';

class ResultMenuCard extends StatefulWidget {
  final Menu menu;

  const ResultMenuCard({
    super.key,
    required this.menu,
  });

  @override
  _ResultMenuCardState createState() => _ResultMenuCardState();
}

class _ResultMenuCardState extends State<ResultMenuCard> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [defaultBoxShadow],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Image.asset(
                  "assets/images/creation_example.png", // Ganti dengan gambar dari menu jika tersedia
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.menu.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        SizedBox(
                          width: 120,
                          child: OutlinedButton(
                            onPressed: toggleFavorite,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  isFavorite
                                      ? "assets/icons/ic_favorite_fill.svg"
                                      : "assets/icons/ic_favorite.svg", // Change icon based on state
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  "Save",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ), // Toggle favorite state
                          ),
                        ),
                        const SizedBox(width: 12),
                        SizedBox(
                          width: 120,
                          child: OutlinedButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/icons/ic_share.svg"),
                                const SizedBox(width: 8),
                                const Text(
                                  "Share",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ExpansionTile(
            expandedAlignment: Alignment.topLeft,
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            shape: const Border(),
            collapsedShape: const Border(),
            title: const Text(
              'Instructions',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.menu.instruction,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          ExpansionTile(
            expandedAlignment: Alignment.topLeft,
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            shape: const Border(),
            collapsedShape: const Border(),
            title: const Text(
              'Ingredients',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            children: widget.menu.ingredients
                .map(
                  (ingredient) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '- ${ingredient.name} (${ingredient.quantity} ${ingredient.unit})',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                )
                .toList(),
          ),
          ExpansionTile(
            expandedAlignment: Alignment.topLeft,
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            shape: const Border(),
            collapsedShape: const Border(),
            title: const Text(
              'Nutrition',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Calories: ${widget.menu.nutrient.calories} kcal\n'
                  'Protein: ${widget.menu.nutrient.protein} g\n'
                  'Fat: ${widget.menu.nutrient.fat} g\n'
                  'Carbohydrates: ${widget.menu.nutrient.carbohydrates} g\n'
                  'Fiber: ${widget.menu.nutrient.fiber} g\n'
                  'Sugar: ${widget.menu.nutrient.sugar} g\n'
                  'Sodium: ${widget.menu.nutrient.sodium} mg\n'
                  'Cholesterol: ${widget.menu.nutrient.cholesterol} mg',
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
