class Laptop {
  final int? total;
  final int? skip;
  final int? limit;

  final List<Products>? product;

  const Laptop(
      {required this.total,
      required this.skip,
      required this.limit,
      required this.product});

  factory Laptop.fromJson(Map<String, dynamic> json) {
    return Laptop(
        total: json['total'],
        skip: json['skip'],
        limit: json['limit'],
        product: List<Products>.from(
            json['products'].map((product) => Products.fromJson(product))));
  }
}

class Products {
  final int? id;
  final String? title;
  final String? description;
  final int? price;
  final num? discountPercent;
  final num? rating;
  final int? stock;
  final String? brand;
  final String? category;
  final String? thumbNail;
  final List<dynamic>? images;

  const Products(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.discountPercent,
      required this.rating,
      required this.stock,
      required this.brand,
      required this.category,
      required this.thumbNail,
      required this.images});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        price: json['price'],
        discountPercent: json['discountPercentage'],
        rating: json['rating'],
        stock: json['stock'],
        brand: json['brand'],
        category: json['category'],
        thumbNail: json['thumbnail'],
        images: json['images']);
  }
}
