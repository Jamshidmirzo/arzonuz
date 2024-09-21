part of 'process_bloc.dart';

sealed class ProcessState {}

final class ProcessInitial extends ProcessState {}

final class ProcessBuyedState extends ProcessState {}

final class ProcessBuyedErrorState extends ProcessState {}


final class ProcessErrorState extends ProcessState {
  String message;
  ProcessErrorState({required this.message});
}
final class ProcessLoadingState extends ProcessState {}

