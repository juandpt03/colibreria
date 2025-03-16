import 'package:colibreria/src/features/home/domain/entities/book.dart';

class BookModel extends Book {
  const BookModel({
    required super.title,
    required super.subtitle,
    required super.isbn13,
    required super.price,
    required super.image,
    required super.url,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      isbn13: json['isbn13'] ?? '',
      price: json['price'] ?? '',
      image: json['image'] ?? '',
      url: json['url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'isbn13': isbn13,
      'price': price,
      'image': image,
      'url': url,
    };
  }

  static List<BookModel> fromJsonList(Map<String, dynamic> json) {
    final List<dynamic> jsonList = json['books'] ?? [];

    return jsonList.map((json) => BookModel.fromJson(json)).toList();
  }
}
