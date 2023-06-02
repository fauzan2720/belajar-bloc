part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class AddCounterEvent extends CounterEvent {}

class ReduceCounterEvent extends CounterEvent {}

class ClearCounterEvent extends CounterEvent {}
