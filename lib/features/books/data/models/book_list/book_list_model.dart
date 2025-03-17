import 'package:json_annotation/json_annotation.dart';
import 'package:librery_app/features/books/data/models/book/book_model.dart';

part 'book_list_model.g.dart';

@JsonSerializable()
class BookListModel {
  @JsonKey(name: "error")
  final String error;
  @JsonKey(name: "total")
  final String total;
  @JsonKey(name: "page")
  final String? page;
  @JsonKey(name: "books")
  final List<BookModel> books;

  BookListModel({
    required this.error,
    required this.total,
    required this.books,
    this.page,
  });

  factory BookListModel.fromJson(Map<String, dynamic> json) =>
      _$BookListModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookListModelToJson(this);
}
