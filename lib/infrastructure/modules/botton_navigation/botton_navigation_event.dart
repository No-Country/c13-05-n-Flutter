part of 'botton_navigation_bloc.dart';

abstract class BottonNavigationEvent extends Equatable {
  BottonMavigationEvent();

  @override
  List<Object> get props => [];
}

class TabChangeEvent extends BottonNavigationEvent {
  final int newIndex;

  TabChangeEvent(this.newIndex);

  @override
  List<Object> get props => [newIndex];

  @override
  BottonMavigationEvent() {
    // TODO: implement BottonMavigationEvent
    throw UnimplementedError();
  }
}
