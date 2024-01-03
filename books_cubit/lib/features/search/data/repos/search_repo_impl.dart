import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl extends SearchRepo {
  final ApiServices apiServices;
  SearchRepoImpl(this.apiServices);
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks(
      String search) async {
    try {
      Map<String, dynamic> data = await apiServices.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=$search');
      List<BookModel> books = [];

      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(
          ServerFailure(
            e.toString(),
          ),
        );
      }
    }
  }
}
