import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookActionButton extends StatelessWidget {
  const BookActionButton({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomButton(
          leftSideRadius: 16,
          text: 'Free',
          textStyle: Styles.textStyle16.copyWith(
            color: Colors.black,
          ),
          color: const Color(0xffffffff),
        ),
        CustomButton(
          rightSideRadius: 16,
          text: 'Preview',
          onPressed: () async {
            Uri uri = Uri.parse(bookModel.volumeInfo.previewLink!);
            if (await canLaunchUrl(uri)) {
              launchUrl(uri);
            }
          },
          textStyle: Styles.textStyle16.copyWith(
            color: const Color(0xffffffff),
          ),
          color: const Color(0xffEF8262),
        ),
      ],
    );
  }
}
