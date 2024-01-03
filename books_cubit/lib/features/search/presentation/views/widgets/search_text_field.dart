import 'package:bookly_app/features/search/presentation/view_models/search/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
        top: 40,
      ),
      child: TextField(
        onChanged: (value) {
          BlocProvider.of<SearchCubit>(context).fetchSearchBooks(value);
        },
        decoration: InputDecoration(
          enabledBorder: buildTextFieldBorder(),
          focusedBorder: buildTextFieldBorder(),
          hintText: 'Search',
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Opacity(
              opacity: 0.8,
              child: Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 22,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

OutlineInputBorder buildTextFieldBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(
      12,
    ),
    borderSide: const BorderSide(
      color: Colors.white,
    ),
  );
}
