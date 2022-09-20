import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repo/users.dart';

part 'users_event.dart';

part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersInitial()) {
    on<LoadUsersEvent>((event, emit) async {
      emit(LoadingUsersState());
      var service = Users.create();
      var response = await service.getUsers();

      if (response.isSuccessful) {
        List<Map<String, dynamic>> data = [];
        for (var dataItem in response.body!) {
          Map<String, dynamic> item = {};
          item['id'] = dataItem.id;
          item['name'] = dataItem.name;
          item['username'] = dataItem.username;
          data.add(item);
        }

        emit(UsersLoadedState(data));
      } else {
        emit(ErrorState(response.error.toString()));
      }
    });

    on<LoadUserDetailsEvent>((event, emit) async {
      emit(LoadingUserDetailsState());
      var service = Users.create();
      var response = await service.getUserById(event.userId);

      if (response.isSuccessful) {
        Map<String, dynamic>? data = response.body?.toJson();

        emit(UserDetailsLoadedState(data!));
      } else {
        emit(ErrorState(response.error.toString()));
      }
    });
  }
}
