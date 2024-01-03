import 'package:bookly_app/core/utils/app_router.dart';

import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_photo.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  const BookItem({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {
          AppRouter.pageNavigator(
            context,
            AppRouter.kBookDetailsView,
            extra: bookModel,
          );
        },
        child: SizedBox(
          height: 124,
          child: Row(
            children: [
              BooksPhoto(
                aspectRatio: 2.5 / 4,
                imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        bookModel.volumeInfo.title!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle20,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      bookModel.volumeInfo.authors?[0] ?? 'Unknown',
                      style: Styles.textStyle14,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Free',
                          style: Styles.textStyle20.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        BookRating(
                          rating: bookModel.volumeInfo.averageRating ?? 0,
                          count: bookModel.volumeInfo.ratingsCount ?? 0,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
