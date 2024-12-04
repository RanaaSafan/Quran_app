
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/repo_asmaahusna.dart';
import 'asmaa_allah_state.dart';

class AsmaaAllahCubit extends Cubit<AsmaaAllahState>{
  final RepoAsmaahusna AsmaaRepo;

  AsmaaAllahCubit(this.AsmaaRepo):super(AsmaaAllahState());

  getAsmaa() async {
    emit(AsmaaAllahLoading());
    final result = await AsmaaRepo.FetchAmsmaaHusna();

    result.fold(
            (failure) => emit(AsmaaAllahFailure(error: failure.errMessage)),
            (AsmaaRepo) => emit(AsmaaAllahSuccess(Asmaulhusna: AsmaaRepo))
    );
  }
}
