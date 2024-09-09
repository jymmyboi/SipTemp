class Drink {
  final String name;
  final int minTemp;
  final int maxTemp;
  final String description;
  final String type;

  Drink({
    required this.name,
    required this.minTemp,
    required this.maxTemp,
    required this.description,
    required this.type,
  });

  factory Drink.fromJson(Map<String, dynamic> json) {
    return Drink(
      name: json['name'],
      minTemp: json['min_temp'],
      maxTemp: json['max_temp'],
      description: json['description'],
      type: json['type'],
    );
  }
}
//TODO: implement type and description.
