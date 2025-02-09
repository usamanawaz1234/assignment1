import 'package:flutter/material.dart';
import '../models/plant.dart';

class PlantController extends ChangeNotifier {
  final List<Plant> _plants = [
    Plant(
      id: '1',
      name: 'Ficus',
      imageUrl: 'assets/images/ficus.png',
      price: 29.99,
      size: 'Small',
      description: 'A beautiful indoor ficus plant.',
    ),
    Plant(
      id: '2',
      name: 'Cactus',
      imageUrl: 'assets/images/cactus.png',
      price: 19.99,
      size: 'Small',
      description: 'A low-maintenance cactus.',
    ),
    Plant(
      id: '3',
      name: 'Samantha Tree',
      imageUrl: 'assets/images/samantha.png',
      price: 39.99,
      size: 'Medium',
      description: 'A lovely decorative tree for your home.',
    ),
    Plant(
      id: '4',
      name: 'Alovera',
      imageUrl: 'assets/images/alovera.png',
      price: 24.99,
      size: 'Medium',
      description: 'A versatile aloe vera plant.',
    ),
  ];

  List<Plant> get plants => _plants;

  List<Plant> filterPlants(String size) {
    if (size.isEmpty) return _plants;
    return _plants.where((plant) => plant.size.toLowerCase() == size.toLowerCase()).toList();
  }

  Plant? getPlantById(String id) {
    try {
      return _plants.firstWhere((plant) => plant.id == id);
    } catch (e) {
      return null;
    }
  }
}
