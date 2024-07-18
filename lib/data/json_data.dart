import 'dart:convert';
import 'dart:developer';

import 'package:crud_app/data/models/item_model.dart';

void main() {
  // Example JSON data
  String jsonData = '''
  {
    "items": [
      {
        "id": 1,
        "color": "#FF5733",
        "text": "Account Balance",
        "icon": "warning"
      },
      {
        "id": 2,
        "color": "#FFFF00",
        "text": "Success Payment",
        "icon": "check_circle"
      },
      {
        "id": 3,
        "color": "#FFA500",
        "text": "Information",
        "icon": "info"
      }{
        "id": 4,
        "color": "#00FF00",
        "text": "Information",
        "icon": "info"
      }
    ]
  }
  ''';

  // Parse the JSON data
  Map<String, dynamic> jsonMap = jsonDecode(jsonData);

  // Extract items list from the JSON map
  List<dynamic> itemsJson = jsonMap['items'];

  // Convert JSON list to a list of Item objects
  List<Item> items = itemsJson.map((itemJson) => Item.fromJson(itemJson)).toList();

  // Use the items as needed
  for (var item in items) {
    log('ID: ${item.id}, Color: ${item.color}, Text: ${item.text}, Icon: ${item.icon}');
  }
}
