part of 'main_bloc.dart';

class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object?> get props => [];
}

class LogOutEvent extends MainEvent {
  final UserModel? user;
  final BuildContext context;

  const LogOutEvent(this.user, this.context);
}
