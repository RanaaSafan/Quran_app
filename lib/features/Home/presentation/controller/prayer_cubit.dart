
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/Home/data/Repo/prayer_repo.dart';
import 'package:quran_app/features/Home/presentation/controller/prayer_state.dart';

class PrayerCubit extends Cubit<PrayerState>{
  final PrayerRepo prayerRepo;

  PrayerCubit(this.prayerRepo):super(PrayerInitial());

  getPrayer(String date) async {
    emit(PrayerLoading());
    final result = await prayerRepo.FetchPrayer(date);

    result.fold(
            (failure) => emit(PrayerFailure(error: failure.errMessage)),
            (Timings) => emit(PrayerSuccess(timings: Timings))
    );
  }
}
