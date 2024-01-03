import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/search/data/repos/search_repo_impl.dart';
import 'package:bookly_app/features/search/presentation/view_models/search/search_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_list_view.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(getIt.get<SearchRepoImpl>()),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchTextField(),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Search Result',
              style: Styles.textStyle18,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: SearchListView(),
          ),
        ],
      ),
    );
  }
}
