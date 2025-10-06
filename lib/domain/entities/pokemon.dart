
class Pokemon {
  final String ability;
  final int baseExperience;
  final int height;
  final String name;
  final int order;
  final String sprite;
  final Map<String, int> stats;
  final List<String> types;
  final int weight;
  final String description;
  final Map<String, List<String>> weaknesses;
  final String category;

  Pokemon({
        required this.ability,
        required this.baseExperience,
        required this.height,
        required this.name,
        required this.order,
        required this.sprite,
        required this.stats,
        required this.types,
        required this.weight,
        required this.description,
        required this.weaknesses,
        required this.category,
    });
}