class Shoe {
  final String name;
  final String brand;
  final String description;
  final String imageUrl;
  final double price;
  final List<int> sizes;
  final double rating;
  final int reviews;

  Shoe({
    required this.name,
    required this.brand,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.sizes,
    required this.rating,
    required this.reviews,
  });

  factory Shoe.fromMap(Map<String, dynamic> data) {
    return Shoe(
      name: data['name'] ?? '',
      brand: data['brand'] ?? '',
      description: data['description'] ?? '',
      imageUrl: data['image'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
      sizes: List<int>.from(data['sizes'] ?? []),
      rating: (data['rating'] ?? 0).toDouble(),
      reviews: data['reviews'] ?? 0,
    );
  }
}
