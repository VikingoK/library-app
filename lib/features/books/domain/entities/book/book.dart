import 'package:freezed_annotation/freezed_annotation.dart';
part 'book.freezed.dart';

@freezed
class Book with _$Book {
  const factory Book({
    required final String title,
    required final String? subtitle,
    required final String isbn13,
    required final String price,
    required final String image,
    required final String? url,
  }) = _Book;

  factory Book.empty() => Book(
        title: '',
        subtitle: null,
        isbn13: '',
        price: '\$0.0',
        image: '',
        url: null,
      );
}
