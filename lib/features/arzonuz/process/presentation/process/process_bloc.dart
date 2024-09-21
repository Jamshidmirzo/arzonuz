import 'package:arzonuz/features/arzonuz/data/repositories/process_repository.dart';
import 'package:arzonuz/features/arzonuz/process/data/model/process_models/process_request.dart';
import 'package:bloc/bloc.dart';
part 'process_event.dart';
part 'process_state.dart';

class ProcessBloc extends Bloc<ProcessEvent, ProcessState> {
  ProcessRepository processRepository = ProcessRepository();
  ProcessBloc() : super(ProcessInitial()) {
    on<ProcessEvent>((event, emit) {});
    on<ProcessBuyEvent>(_buy);
  }
  _buy(ProcessBuyEvent event, emit) async {
    emit(ProcessLoadingState());
    try {
      final responce = await processRepository.buy(event.processRequest);
      if (responce.isNotEmpty) {
        emit(ProcessBuyedState());
      } else {
        emit(
          ProcessBuyedErrorState(),
        );
      }
    } catch (e) {
      emit(
        ProcessErrorState(
          message: e.toString(),
        ),
      );
    }
  }
}
