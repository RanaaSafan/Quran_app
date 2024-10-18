
import '../../data/models/timings.dart';

class PrayerState{}
class PrayerInitial extends PrayerState{}
class PrayerLoading extends PrayerState{}
class PrayerSuccess extends PrayerState{
  final List<Timings> timings;

  PrayerSuccess({required this.timings});
}
class PrayerFailure extends PrayerState{
  final String error;

  PrayerFailure({required this.error});
}
