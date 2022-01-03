import 'package:counter_app/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(0));

  void increment() {
    emit(CounterState(state.value + 1));
  }

  void decrement() {
    emit(CounterState(state.value - 1));
  }
}
