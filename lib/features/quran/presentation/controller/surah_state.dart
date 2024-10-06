

import '../../data/models/data.dart';
import '../../data/models/surah.dart';

class SurahState{}

class SurahLoading extends SurahState{}

class SurahInital extends SurahState{}

class SurahSuccess extends SurahState{
  final List<Data> surahList;

  SurahSuccess({required this.surahList});
}

class SurahFailer extends SurahState {
  final String errmsg;

  SurahFailer({required this.errmsg});

}
