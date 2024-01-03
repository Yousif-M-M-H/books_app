import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(
    this.searchRepo,
  ) : super(SearchInitial());

  final SearchRepo searchRepo;

  Future<void> fetchSearchBooks(String search) async {
    emit(SearchLoading());
    var result = await searchRepo.fetchSearchBooks(search);
    result.fold(
      (failure) {
        emit(
          SearchFailure(failure.errMessage),
        );
      },
      (books) {
        emit(
          SearchSuccess(books),
        );
      },
    );
  }
}
