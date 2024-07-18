class Item {
  final int id;
  final String color;
  final String text;
  final String icon;

  Item({
    required this.id,
    required this.color,
    required this.text,
    required this.icon,
  });

  // Factory method to create an Item from a JSON map
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      color: json['color'],
      text: json['text'],
      icon: json['icon'],
    );
  }

  // Method to convert an Item to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'color': color,
      'text': text,
      'icon': icon,
    };
  }
}
