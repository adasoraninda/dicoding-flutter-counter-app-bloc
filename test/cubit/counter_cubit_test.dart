import 'package:bloc_test/bloc_test.dart';
import 'package:counter_app/counter_cubit.dart';
import 'package:counter_app/counter_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CounterCubit counterCubit;

  setUp(() {
    counterCubit = CounterCubit();
  });

  test('Initial state should be CounterState(0)', () {
    expect(counterCubit.state, const CounterState(0));
  });

  blocTest<CounterCubit, CounterState>(
    'Should emit (CounterState(1) when Increment event is added',
    build: () => counterCubit,
    act: (cubit) => cubit.increment(),
    expect: () => [
      const CounterState(1),
    ],
  );

  blocTest<CounterCubit, CounterState>(
    'Should emit (CounterState(-1) when Increment event is added',
    build: () => counterCubit,
    act: (cubit) => cubit.decrement(),
    expect: () => [
      const CounterState(-1),
    ],
  );
}
