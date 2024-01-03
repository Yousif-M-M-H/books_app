import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_action_button.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_photo.dart';
import 'package:flutter/material.dart';

class BookItemDetailsScetion extends StatelessWidget {
  const BookItemDetailsScetion({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 36,
        ),
        SizedBox(
          width: 162,
          child: BooksPhoto(
            imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
            aspectRatio: 2.7 / 4,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          bookModel.volumeInfo.title!,
          textAlign: TextAlign.center,
          style: Styles.textStyle30,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          bookModel.volumeInfo.authors?[0] ?? 'Unknown',
          textAlign: TextAlign.center,
          style: Styles.textStyle18.copyWith(
            color: const Color(0xff707070),
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        BookRating(
          rating: bookModel.volumeInfo.averageRating ?? 0,
          count: bookModel.volumeInfo.ratingsCount ?? 0,
        ),
        const SizedBox(height: 14),
        BookActionButton(
          bookModel: bookModel,
        ),
      ],
    );
  }
}
