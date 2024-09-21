import 'package:arzonuz/core/error/failure.dart';
import 'package:arzonuz/features/arzonuz/favourite/data/model/feedback/feedback_request.dart';
import 'package:dartz/dartz.dart';

abstract class FeedbacksRepository {
  Future<Either<Failure, FeedbackRequest>> getFeedback(String productId);
}
