part of 'process_bloc.dart';

sealed class ProcessEvent {}

class ProcessBuyEvent extends ProcessEvent {
  ProcessRequest processRequest;
  ProcessBuyEvent({required this.processRequest});
}
