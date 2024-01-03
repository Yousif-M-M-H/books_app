import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_cubit_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksCubitState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksCubitInitial());
  final HomeRepo homeRepo;

  Future<void> fetchFeatureBooks() async {
    emit(FeaturedBooksCubitLoading());
    var result = await homeRepo.fetchFeatureBooks();
    result.fold(
      (failure) {
        emit(
          FeaturedBooksCubitFailure(failure.errMessage),
        );
      },
      (books) {
        emit(
          FeaturedBooksCubitSuccess(books),
        );
      },
    );
  }
}
