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
    // instanes of CounterCubitCubit and States
    var counterCubit = BlocProvider.of<CounterCubitCubit>(context);
    var states = context.read<CounterCubitCubit>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        leading: IconButton(
            onPressed: () {
              // call add func to toggle
              context.read<ThemeBloc>().add(ToggleThemeEvent());
            },
            icon: const Icon(size: 35, Icons.toggle_off)),
      ),
      // BlocListener to listen to states
      body: BlocListener<CounterCubitCubit, CounterCubitState>(
          listener: (context, state) {
            if (states.isReachedPositive()) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("You Reached to 10 ")));
            }
            if (states.isReachedNegative()) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("You Reached to -10 ")));
            }

            if (states.isReachedMinus()) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const AlertDialog(
                      title: Text("Hi"),
                      content: Text("You Reached to negative numbers "));
                },
              );
            }
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                // BlocBuilder rebuilds ui
                BlocBuilder<CounterCubitCubit, CounterCubitState>(
                  builder: (context, state) {
                    return Text(
                      '${counterCubit.counter}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  },
                )
              ],
            ),
          )),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            // call state
            onPressed: states.incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            onPressed: states.decrementCounter,
            tooltip: 'Dercrement',
            child: const Icon(Icons.minimize),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
