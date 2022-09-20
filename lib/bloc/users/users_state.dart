part of 'users_bloc.dart';

abstract class UsersState extends Equatable {
  const UsersState();
}

class UsersInitial extends UsersState {
  @override
  List<Object> get props => [];
}

class LoadingUsersState extends UsersState {
  @override
  List<Object> get props => [];
}

class UsersLoadedState extends UsersState {
  final List<Map<String, dynamic>> data;

  const UsersLoadedState(this.data);

  @override
  List<Object> get props => [data];
}

class ErrorState extends UsersState {
  final String errorMessage;

  const ErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class LoadingUserDetailsState extends UsersState {
  @override
  List<Object> get props => [];
}

class UserDetailsLoadedState extends UsersState {
  final Map<String, dynamic> data;

  const UserDetailsLoadedState(this.data);

  @override
  List<Object> get props => [data];
}
