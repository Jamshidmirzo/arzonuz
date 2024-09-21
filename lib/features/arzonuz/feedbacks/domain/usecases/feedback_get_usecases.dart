// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:arzonuz/features/arzonuz/favourite/data/model/feedback/feedback_request.dart';
import 'package:arzonuz/features/arzonuz/feedbacks/domain/repository/feedbacks_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:arzonuz/core/error/failure.dart';
import 'package:arzonuz/core/usecases/usecases.dart';

class FeedbackGetUsecases extends Usecases<FeedbackRequest, FeedbackGetParams> {
  FeedbacksRepository feedbackRequest;
  FeedbackGetUsecases({
    required this.feedbackRequest,
  });
  @override
  Future<Either<Failure, FeedbackRequest>> call(FeedbackGetParams params) {
    return feedbackRequest.getFeedback(params.productId);
  }
}

class FeedbackGetParams {
  String productId;
  FeedbackGetParams({
    required this.productId,
  });
}
