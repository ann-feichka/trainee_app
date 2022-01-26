import 'dart:async';

class DetailsStreamBloc{
  final detailController = StreamController();
  Stream get getDetail => detailController.stream;

}