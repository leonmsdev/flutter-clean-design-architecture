import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'advice_event.dart';
part 'advice_state.dart';

class AdviceBloc extends Bloc<AdviceEvent, AdviceState> {
  AdviceBloc() : super(AdviceInitial()) {
    on<AdviceEvent>((event, emit) async {
      emit(AdviceLoading());
      await Future.delayed(const Duration(seconds: 2));
      emit(AdviceLoaded());
    });
  }
}
