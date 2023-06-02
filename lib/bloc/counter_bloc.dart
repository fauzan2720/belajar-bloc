import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<AddCounterEvent>((event, emit) => emit(state + 1));

    on<ReduceCounterEvent>((event, emit) {
      if (state > 0) {
        emit(state - 1);
      }
    });

    on<ClearCounterEvent>((event, emit) => emit(0));
  }
}
