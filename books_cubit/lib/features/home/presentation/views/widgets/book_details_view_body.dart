import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_appbar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_details_section.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const BookDetailsAppBar(),
              BookItemDetailsScetion(
                bookModel: bookModel,
              ),
              Container(
                constraints: const BoxConstraints(
                  minHeight: 50,
                ),
              ),
              const SimilarBooksSection(),
            ],
          ),
        ),
      ),
    ]);
  }
}
