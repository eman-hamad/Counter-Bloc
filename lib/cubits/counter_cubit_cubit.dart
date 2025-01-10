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
// func check if it reached to 10
  bool isReached() {
    if (counter >= 10) {
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
