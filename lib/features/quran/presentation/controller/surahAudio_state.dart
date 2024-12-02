import '../../data/models/data.dart';


abstract class SurahAudioState {}

class SurahAudioLoading extends SurahAudioState {}

class SurahAudioInital extends SurahAudioState {}

class SurahAudioSuccess extends SurahAudioState {
  final Data surahListAudio;

  SurahAudioSuccess({required this.surahListAudio});
}

class SurahAudioFailer extends SurahAudioState {
  final String errmsg;

  SurahAudioFailer({required this.errmsg});
}
