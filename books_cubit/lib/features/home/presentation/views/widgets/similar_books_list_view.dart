import 'package:bookly_app/core/widgets/error_widget.dart';
import 'package:bookly_app/core/widgets/loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/view_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_photo.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: 112,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 10,
                );
              },
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return BooksPhoto(
                  imageUrl:
                      state.books[index].volumeInfo.imageLinks?.thumbnail ?? '',
                  aspectRatio: 0.625,
                );
              },
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const LoadingIndicator();
        }
      },
    );
  }
}
