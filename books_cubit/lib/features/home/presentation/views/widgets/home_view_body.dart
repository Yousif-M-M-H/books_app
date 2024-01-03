import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/home_appbar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_books_list.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeAppBar(),
              FeaturedBooksListView(),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 30,
                ),
                child: Text(
                  'Newest Books',
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: NewestBooksListView(),
        ),
      ],
    );
  }
}
