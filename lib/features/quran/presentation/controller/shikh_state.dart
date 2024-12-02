

import 'package:quran_app/features/quran/data/models/model_edition_surah/quran_edition.dart';

import '../../data/models/data.dart';
import '../../data/models/model_surah_names/surah.dart';


class ShikhState{}

class ShikhLoading extends ShikhState{}

class ShikhInital extends ShikhState{}

class ShikhSuccess extends ShikhState{
  final List<QuranEdition> shikhList;

  ShikhSuccess({required this.shikhList});
}

class ShikhFailer extends ShikhState {
  final String errmsg;

  ShikhFailer({required this.errmsg});

}
