part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();
}

class LoadUsersEvent extends UsersEvent {
  @override
  List<Object?> get props => [];
}

class LoadUserDetailsEvent extends UsersEvent {
  final int userId;

  const LoadUserDetailsEvent(this.userId);

  @override
  List<Object?> get props => [userId];
}
