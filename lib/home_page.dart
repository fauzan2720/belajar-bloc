import 'package:belajar_bloc/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Belajar Bloc"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<CounterBloc, int>(
            listener: (context, state) {
              SnackBar snackBar = SnackBar(
                content: Text("State sekarang: $state"),
                duration: const Duration(
                  milliseconds: 500,
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            builder: (context, state) {
              return Text(
                state.toString(),
                style: const TextStyle(
                  fontSize: 40.0,
                ),
              );
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () =>
                    context.read<CounterBloc>().add(ReduceCounterEvent()),
                child: const Text(
                  "Reduce",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () =>
                    context.read<CounterBloc>().add(AddCounterEvent()),
                child: const Text(
                  "Add",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () =>
                context.read<CounterBloc>().add(ClearCounterEvent()),
            child: const Text(
              "Clear",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
