import '../../data/models/book.dart';
import '../../data/models/model_dataSheikh/hadiths.dart';

class HadithSheikhState{}
class HadithSheikhInitial extends HadithSheikhState{}
class HadithSheikhLoading extends HadithSheikhState{}
class HadithSheikhSuccess extends HadithSheikhState{
  final List<Hadiths> bookSheikh;

  HadithSheikhSuccess({required this.bookSheikh});
}
class HadithSheikhFailure extends HadithSheikhState{
  final String error;

  HadithSheikhFailure({required this.error});
}
