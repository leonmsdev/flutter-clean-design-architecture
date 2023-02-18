part of 'advice_bloc.dart';

@immutable
abstract class AdviceState {}

class AdviceInitial extends AdviceState {}

class AdviceLoading extends AdviceState {}

class AdviceLoaded extends AdviceState {}

class AdviceError extends AdviceState {}
