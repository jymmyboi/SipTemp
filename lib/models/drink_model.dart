class Drink {
  final String name;
  final int minTemp;
  final int maxTemp;

  Drink({
    required this.name,
    required this.minTemp,
    required this.maxTemp,
  });

  factory Drink.fromJson(Map<String, dynamic> json) {
    return Drink(
      name: json['name'],
      minTemp: json['min_temp'],
      maxTemp: json['max_temp'],
    );
  }
}
//TODO: implement type and description.
