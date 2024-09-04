import 'package:flutter_bloc/flutter_bloc.dart';

class FilterCubit extends Cubit<int?> {
  FilterCubit() : super(null);

  void selectFilter(int index) => emit(index);
}
