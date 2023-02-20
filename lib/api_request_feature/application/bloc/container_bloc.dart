import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'container_event.dart';
part 'container_state.dart';

class ContainerBloc extends Bloc<ContainerEvent, ContainerState> {
  ContainerBloc() : super(ContainerInitial()) {
    on<AdviceIsShown>((event, emit) {
      emit(ContainerDone());
    });
  }
}
