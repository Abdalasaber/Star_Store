import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());

  static OnBoardingCubit get(context) => BlocProvider.of(context);

  bool isLast = false;
  isTrue() {
    isLast = true;
    emit(IsTrueState());
  }

  isFalse() {
    isLast = false;
    emit(IsFalseState());
  }
}
