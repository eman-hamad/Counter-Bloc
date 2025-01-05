import 'package:counter__with_bloc/blocs/theme_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/theme_bloc.dart';
import '../cubits/counter_cubit_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    var counterCubit = BlocProvider.of<CounterCubitCubit>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        leading: IconButton(
            onPressed: () {
              context.read<ThemeBloc>().add(ToggleThemeEvent());
            },
            icon: const Icon(size: 35, Icons.toggle_off)),
      ),
      body: BlocConsumer<CounterCubitCubit, CounterCubitState>(
        listener: (context, state) {
          if (counterCubit.isReached()) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("You Reached to 10 ")));
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${counterCubit.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                )
              ],
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: counterCubit.incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
