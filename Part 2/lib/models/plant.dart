class Plant {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String size;
  final String description;

  Plant({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.size,
    required this.description,
  });

  // Sample data
  static List<Plant> samplePlants = [
    Plant(
      id: '1',
      name: 'Cactus',
      price: 29.99,
      imageUrl: 'https://images.unsplash.com/photo-1459411552884-841db9b3cc2a',
      size: 'Small',
      description: 'A beautiful desert cactus that requires minimal water.',
    ),
    Plant(
      id: '2',
      name: 'Aloe Vera',
      price: 24.99,
      imageUrl: 'https://images.unsplash.com/photo-1596547609652-9cf5d8c10917',
      size: 'Medium',
      description: 'Medicinal plant known for its healing properties.',
    ),
    Plant(
      id: '3',
      name: 'Snake Plant',
      price: 34.99,
      imageUrl: 'https://images.unsplash.com/photo-1593482892290-f54927ae2b64',
      size: 'Large',
      description: 'Air-purifying plant that thrives in low light conditions.',
    ),
  ];
}
