import '../../data/models/book.dart';

class HadithState{}
class HadithInitial extends HadithState{}
class HadithLoading extends HadithState{}
class HadithSuccess extends HadithState{
  final List<Book> books;

  HadithSuccess({required this.books});
}
class HadithFailure extends HadithState{
  final String error;

  HadithFailure({required this.error});
}