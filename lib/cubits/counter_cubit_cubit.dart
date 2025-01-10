import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_cubit_state.dart';

class CounterCubitCubit extends Cubit<CounterCubitState> {
  CounterCubitCubit() : super(CounterCubitInitial());

  int counter = 0;
  // ThemeData theme = ThemeData.light();
  // func to increment counter
  void incrementCounter() {
    emit(CounterCubitIncrement());

    counter++;
  }
// func to decrement counter
  void decrementCounter() {
    emit(CounterCubitDecrement());

    counter--;
  }
// func to check if counter is positive
  bool isReachedPositive() {
    if (counter == 10) {
      // emit(CounterCubitReached(counter));
      return true;
    } else {
      return false;
    }
  }
// func to check if counter is -10
  bool isReachedNegative() {
    if (counter == -10) {
      // emit(CounterCubitReached(counter));
      return true;
    } else {
      return false;
    }
  }
// func to check if counter is negative
  bool isReachedMinus() {
    if (counter < 0) {
      // emit(CounterCubitReached(counter));
      return true;
    } else {
      return false;
    }
  }
  // ToggleTheme()
  // {
  //   if (theme ==  ThemeData.light())
  //   {
  //     theme =  ThemeData.dark();
  //   }
  //   else{
  //     theme =  ThemeData.light();
  //   }
  // }
}
