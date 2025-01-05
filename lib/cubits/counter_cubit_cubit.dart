import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_cubit_state.dart';

class CounterCubitCubit extends Cubit<CounterCubitState> {
  CounterCubitCubit() : super(CounterCubitInitial());

  int counter = 0;
  // ThemeData theme = ThemeData.light();
  void incrementCounter() {
    emit(CounterCubitIncrement());

    counter++;
  }

  void decrementCounter() {
    emit(CounterCubitDecrement());

    counter--;
  }

  bool isReachedPositive() {
    if (counter == 10) {
      // emit(CounterCubitReached(counter));
      return true;
    } else {
      return false;
    }
  }

  bool isReachedNegative() {
    if (counter == -10) {
      // emit(CounterCubitReached(counter));
      return true;
    } else {
      return false;
    }
  }

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
