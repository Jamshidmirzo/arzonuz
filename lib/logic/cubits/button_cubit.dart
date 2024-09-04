import 'package:bloc/bloc.dart';

class ButtonCubit extends Cubit<int> {
  ButtonCubit() : super(-1);

  void selectButton(int index) {
    emit(index);
  }
}
