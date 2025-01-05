import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_cubit_state.dart';

class CounterCubitCubit extends Cubit<CounterCubitState> {
  CounterCubitCubit() : super(CounterCubitInitial());

  int counter = 0;

  void incrementCounter() {
    emit(CounterCubitIncrement());

    counter++;
  }

  isReached() {
    if (counter >= 10) {
     // emit(CounterCubitReached(counter));
      return true;
    }
  }
}
