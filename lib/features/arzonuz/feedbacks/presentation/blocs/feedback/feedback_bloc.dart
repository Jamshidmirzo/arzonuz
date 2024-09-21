import 'package:arzonuz/features/arzonuz/favourite/data/model/feedback/feedback_request.dart';
import 'package:arzonuz/features/arzonuz/feedbacks/domain/usecases/feedback_get_usecases.dart';
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'feedback_event.dart';
part 'feedback_state.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  FeedbackGetUsecases feedbackGetUsecases;
  FeedbackBloc({required this.feedbackGetUsecases}) : super(FeedbackInitial()) {
    on<FeedbackEvent>((event, emit) {});
    on<FeedbackGetAll>(_getAll);
  }
  _getAll(FeedbackGetAll event, emit) async {
    emit(FeedbackLoading());

    final responce = await feedbackGetUsecases(
        FeedbackGetParams(productId: event.productId));
    responce.fold((error) {
      emit(
        FeedbackError(
          message: 'wertgyhjkjhgfds',
        ),
      );
    }, (data) {
      emit(
        FeedbackLoaded(feedbackRequest: data),
      );
    });
  }
}
