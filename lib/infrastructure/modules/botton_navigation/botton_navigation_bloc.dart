import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'botton_navigation_event.dart';
// part 'botton_navigation_state.dart';

class BottonNavigationBloc extends Bloc<BottonNavigationEvent, int> {
  BottonNavigationBloc() : super(0) {
    on<TabChangeEvent>((event, emit) => emit(event.newIndex));
  }
}
