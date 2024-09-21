// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:arzonuz/core/error/exception.dart';
import 'package:dartz/dartz.dart';
import 'package:arzonuz/core/error/failure.dart';
import 'package:arzonuz/features/arzonuz/favourite/data/model/feedback/feedback_request.dart';
import 'package:arzonuz/features/arzonuz/feedbacks/data/datasource/feedback_datasource.dart';
import 'package:arzonuz/features/arzonuz/feedbacks/domain/repository/feedbacks_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FeedbackRepositoryImpl extends FeedbacksRepository {
  FeedbackDatasource feedbackDatasource;
  SharedPreferences shared;
  FeedbackRepositoryImpl({
    required this.shared,
    required this.feedbackDatasource,
  });
  @override
  Future<Either<Failure, FeedbackRequest>> getFeedback(String productId) async {
    String? refreshToken = shared.getString('refreshToken');
    if (refreshToken != null) {
      return await _getFeedback(
          () => feedbackDatasource.getFeedbacks(refreshToken, productId));
    } else {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, FeedbackRequest>> _getFeedback(
      Future<FeedbackRequest?> Function() getFeedback) async {
    try {
      final response = await getFeedback();
      if (response != null) {
        return Right(response);
      } else {
        return Left(ServerFailure());
      }
    } on ServerExeption {
      return Left(
        ServerFailure(),
      );
    }
  }
}
