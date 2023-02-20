import 'package:advice_api/api_request_feature/application/bloc/advice_bloc.dart';
import 'package:advice_api/api_request_feature/application/bloc/container_bloc.dart';
import 'package:advice_api/api_request_feature/presentation/widgets/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdviceScreen extends StatelessWidget {
  const AdviceScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<ContainerBloc, ContainerState>(
            builder: (context, state) {
              if (state is ContainerInitial) {
                return const ContainerWidget();
              } else {
                return const Placeholder();
              }
            },
          ),
          const SizedBox(height: 30),
          //Sould be wrapped with Bloc Widget.
          BlocBuilder<AdviceBloc, AdviceState>(
            builder: (context, state) {
              if (state is AdviceInitial) {
                return const Text('Initialise');
              } else if (state is AdviceLoading) {
                return const SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(),
                );
              } else if (state is AdviceLoaded) {
                return const SizedBox(
                  width: 300,
                  child: Text(
                    'Straightforward American ingenuity and capitalism at its best. - Elon Musk',
                    textAlign: TextAlign.center,
                  ),
                );
              } else {
                return const Placeholder();
              }
            },
          ),
          const SizedBox(height: 30),
          TextButton.icon(
              onPressed: () {
                BlocProvider.of<AdviceBloc>(context).add(RequestAdvice());
                BlocProvider.of<ContainerBloc>(context).add(AdviceIsShown());
              },
              icon: const Icon(Icons.api),
              label: const Text('Start Api request '))
        ],
      ),
    );
  }
}
