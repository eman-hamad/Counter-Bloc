part of 'counter_cubit_cubit.dart';

@immutable
abstract class CounterCubitState {}

class CounterCubitInitial extends CounterCubitState {
  CounterCubitInitial();
}
class CounterCubitIncrement extends CounterCubitState {}
class CounterCubitReached extends CounterCubitState {
  // final int count;
//   CounterCubitReached(this.count);
//   bool get hasReachedThreshold => count >= 10;
}