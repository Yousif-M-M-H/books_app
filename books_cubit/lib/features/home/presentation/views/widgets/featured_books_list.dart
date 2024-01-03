import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/widgets/error_widget.dart';
import 'package:bookly_app/core/widgets/loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/view_models/featured_books_cubit/featured_books_cubit_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksCubitState>(
      builder: (context, state) {
        if (state is FeaturedBooksCubitSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    AppRouter.pageNavigator(context, AppRouter.kBookDetailsView,
                        extra: state.books[index]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: BooksPhoto(
                      aspectRatio: 2.7 / 4,
                      imageUrl:
                          state.books[index].volumeInfo.imageLinks?.thumbnail ??
                              '',
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksCubitFailure) {
          return CustomErrorWidget(
            errMessage: state.errMessage,
          );
        } else {
          return const LoadingIndicator();
        }
      },
    );
  }
}
