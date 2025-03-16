import 'package:colibreria/src/features/home/domain/entities/book_detail.dart';

class BookDetailModel extends BookDetail {
  const BookDetailModel({
    required super.title,
    super.subtitle,
    required super.authors,
    required super.publisher,
    required super.isbn10,
    required super.isbn13,
    required super.pages,
    required super.year,
    required super.rating,
    required super.desc,
    required super.price,
    required super.image,
    required super.url,
    super.pdfs,
  });

  factory BookDetailModel.fromJson(Map<String, dynamic> json) {
    List<PdfModel>? pdfs;
    if (json['pdf'] != null) {
      pdfs = [];
      (json['pdf'] as Map<String, dynamic>).forEach((key, value) {
        pdfs!.add(PdfModel.fromJson(key, value));
      });
    }

    return BookDetailModel(
      title: json['title'] ?? '',
      subtitle: json['subtitle'],
      authors: json['authors'] ?? '',
      publisher: json['publisher'] ?? '',
      isbn10: json['isbn10'] ?? '',
      isbn13: json['isbn13'] ?? '',
      pages: json['pages'] ?? '',
      year: json['year'] ?? '',
      rating: json['rating'] ?? '',
      desc: json['desc'] ?? '',
      price: json['price'] ?? '',
      image: json['image'] ?? '',
      url: json['url'] ?? '',
      pdfs: pdfs,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'title': title,
      'authors': authors,
      'publisher': publisher,
      'isbn10': isbn10,
      'isbn13': isbn13,
      'pages': pages,
      'year': year,
      'rating': rating,
      'desc': desc,
      'price': price,
      'image': image,
      'url': url,
    };

    if (subtitle != null) {
      data['subtitle'] = subtitle;
    }

    if (pdfs != null) {
      final Map<String, dynamic> pdfMap = {};
      for (var pdf in pdfs!) {
        pdfMap[pdf.name] = pdf.url;
      }
      data['pdf'] = pdfMap;
    }

    return data;
  }
}

class PdfModel extends Pdf {
  const PdfModel({required super.name, required super.url});

  factory PdfModel.fromJson(String name, String url) {
    return PdfModel(name: name, url: url);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'url': url};
  }
}
