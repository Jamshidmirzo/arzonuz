import 'package:arzonuz/data/models/feedback/feedback_request.dart';
import 'package:arzonuz/logic/repositories/feedback_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'feedback_event.dart';
part 'feedback_state.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  FeedbackRepository feedbackRepository = FeedbackRepository();
  FeedbackBloc() : super(FeedbackInitial()) {
    on<FeedbackEvent>((event, emit) {});
    on<FeedbackGetAll>(_getAll);
  }
  _getAll(FeedbackGetAll event, emit) async {
    emit(FeedbackLoading());
    try {
      final responce = await feedbackRepository.getFeedbacks(
        event.productId,
      );
      emit(
        FeedbackLoaded(feedbackRequest: responce),
      );
    } catch (e) {
      emit(
        FeedbackError(
          message: e.toString(),
        ),
      );
    }
  }
}
