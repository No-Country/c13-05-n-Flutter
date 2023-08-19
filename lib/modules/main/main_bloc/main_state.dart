part of 'main_bloc.dart';

class MainState extends Equatable {
  final UserModel? user;

  const MainState(this.user);

  @override
  List<Object> get props => [];
  MainState copyWith({required UserModel? user}) {
    return MainState(user);
  }
}
