part of 'counter_cubit_cubit.dart';
// states of counter
@immutable
abstract class CounterCubitState {}

class CounterCubitInitial extends CounterCubitState {
  CounterCubitInitial();
}
class CounterCubitIncrement extends CounterCubitState {}
class CounterCubitDecrement  extends CounterCubitState {}
class CounterCubitReached extends CounterCubitState {
  // final int count;
//   CounterCubitReached(this.count);
//   bool get hasReachedThreshold => count >= 10;
}
