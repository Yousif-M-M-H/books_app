import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newest_books_cubit_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksCubitState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksCubitInitial());

  final HomeRepo homeRepo;

  Future<void> fetchNewestCubit() async {
    emit(NewestBooksCubitLoaded());
    var result = await homeRepo.fetchNewestBooks();
    result.fold(
      (failure) {
        emit(
          NewestBooksCubitFaliure(failure.errMessage),
        );
      },
      (books) {
        emit(
          NewestBooksCubitSuccess(books),
        );
      },
    );
  }
}
