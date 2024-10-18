
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/Hadith/data/Repo/repo_hadith.dart';

import 'hadith_state.dart';

class HadithCubit extends Cubit<HadithState>{
  final RepoHadith repoHadith;

  HadithCubit(this.repoHadith):super(HadithInitial());

   getBook() async {
    emit(HadithLoading());
    final result = await repoHadith.FetchHadith();

    result.fold(
          (failure) => emit(HadithFailure(error: failure.errMessage)),
          (BooksData) => emit(HadithSuccess(books: BooksData))
    );
}
}
