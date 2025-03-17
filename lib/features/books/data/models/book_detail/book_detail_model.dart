import 'package:json_annotation/json_annotation.dart';
import 'package:librery_app/features/books/data/models/book/book_model.dart';

part 'book_detail_model.g.dart';

@JsonSerializable()
class BookDetailModel extends BookModel {
  @JsonKey(name: "error")
  final String error;
  @JsonKey(name: "authors")
  final String authors;
  @JsonKey(name: "publisher")
  final String publisher;
  @JsonKey(name: "language")
  final String language;
  @JsonKey(name: "isbn10")
  final String isbn10;
  @JsonKey(name: "pages")
  final String pages;
  @JsonKey(name: "year")
  final String year;
  @JsonKey(name: "rating")
  final String rating;
  @JsonKey(name: "desc")
  final String desc;

  BookDetailModel({
    required this.error,
    required this.authors,
    required this.publisher,
    required this.language,
    required this.isbn10,
    required this.pages,
    required this.year,
    required this.rating,
    required this.desc,
    required super.title,
    super.subtitle,
    required super.isbn13,
    required super.price,
    required super.image,
    super.url,
  });

  factory BookDetailModel.fromJson(Map<String, dynamic> json) =>
      _$BookDetailModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BookDetailModelToJson(this);
}
