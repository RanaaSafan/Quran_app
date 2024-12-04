

import '../../data/models/asmaa_husnai.dart';

class AsmaaAllahState{}
class AsmaaAllahInitial extends AsmaaAllahState{}
class AsmaaAllahLoading extends AsmaaAllahState{}
class AsmaaAllahSuccess extends AsmaaAllahState{
  final List<AsmaUlHusna> Asmaulhusna;

  AsmaaAllahSuccess({required this.Asmaulhusna});
}
class AsmaaAllahFailure extends AsmaaAllahState{
  final String error;

  AsmaaAllahFailure({required this.error});
}
