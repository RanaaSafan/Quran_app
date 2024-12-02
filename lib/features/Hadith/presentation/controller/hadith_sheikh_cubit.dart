
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/Hadith/data/Repo/repo_hadith.dart';

import 'hadith_sheikh_state.dart';


class HadithSheikhCubit extends Cubit<HadithSheikhState>{
  final RepoHadith repoHadith;

  HadithSheikhCubit(this.repoHadith):super(HadithSheikhInitial());

  getBook(String name) async {
    emit(HadithSheikhLoading());
    final result = await repoHadith.FetchHadithBySheikh(name);


    result.fold(
            (failure) => emit(HadithSheikhFailure(error: failure.errMessage)),
            (BooksData) => emit(HadithSheikhSuccess(bookSheikh: BooksData)),
    );
  }
}
