import 'package:json_annotation/json_annotation.dart';

part 'book_model.g.dart';

@JsonSerializable()
class BookModel {
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "subtitle")
  final String? subtitle;
  @JsonKey(name: "isbn13")
  final String isbn13;
  @JsonKey(name: "price")
  final String price;
  @JsonKey(name: "image")
  final String image;
  @JsonKey(name: "url")
  final String? url;

  BookModel({
    required this.title,
    this.subtitle,
    required this.isbn13,
    required this.price,
    required this.image,
    this.url,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookModelToJson(this);
}
