

import 'package:quran_app/features/quran/data/models/quran_edition.dart';

import '../../data/models/data.dart';
import '../../data/models/surah.dart';
import '../../data/models/surah_datas.dart';

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
