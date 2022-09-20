import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screen_util.dart';
import 'user_details.dart';
import '../bloc/users/users_bloc.dart';
import 'user_item.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);
    return BlocProvider(
      create: (_) => UsersBloc()..add(LoadUsersEvent()),
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<UsersBloc, UsersState>(
            builder: (context, state) => state is LoadingUsersState
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : state is UsersLoadedState
                    ? ListView(
                        children: List.generate(
                          state.data.length,
                          (index) => UserItem(
                            id: state.data[index]['id'],
                            name: state.data[index]['name'],
                            username: state.data[index]['username'],
                            onUserPressed: (userId) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => UserDetails(
                                          userId: userId,
                                        )),
                              );
                            },
                          ),
                        ),
                      )
                    : Container(),
          ),
        ),
      ),
    );
  }
}
