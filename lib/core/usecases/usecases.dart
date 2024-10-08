import 'package:arzonuz/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class Usecases<Type,Params> {
 Future<Either<Failure, Type>> call(Params params);
}
