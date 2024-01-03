import 'package:bookly_app/core/widgets/book_item.dart';
import 'package:bookly_app/core/widgets/error_widget.dart';
import 'package:bookly_app/core/widgets/loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/view_models/newest_books_cubit/newest_books_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksCubitState>(
        builder: (context, state) {
      if (state is NewestBooksCubitSuccess) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsetsDirectional.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return BookItem(
                bookModel: state.books[index],
              );
            },
          ),
        );
      } else if (state is NewestBooksCubitFaliure) {
        return CustomErrorWidget(errMessage: state.errMessage);
      } else {
        return const LoadingIndicator();
      }
    });
  }
}
