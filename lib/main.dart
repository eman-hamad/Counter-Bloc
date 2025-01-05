import 'package:counter__with_bloc/blocs/theme_state.dart';
import 'package:counter__with_bloc/cubits/counter_cubit_cubit.dart';
import 'package:counter__with_bloc/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/theme_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    
    return MultiBlocProvider(
    providers: [
      BlocProvider<CounterCubitCubit>(
          create: (context) => CounterCubitCubit(),
        ),
BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
     
    ],
      
     
      child: BlocBuilder<ThemeBloc , ThemeState>(
        builder: (context , state) =>
       MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: state.themeData,
          home: const HomeScreen(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }
}
