// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$Users extends Users {
  _$Users([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = Users;

  @override
  Future<Response<List<User>>> getUsers() {
    final $url = '/users';
    final $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<User>, User>($request);
  }

  @override
  Future<Response<List<User>>> getUser(int userId) {
    final $url = '/users';
    final $params = <String, dynamic>{'id': userId};
    final $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<User>, User>($request);
  }

  @override
  Future<Response<User>> getUserById(int userId) {
    final $url = '/users/${userId}';
    final $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<User, User>($request);
  }
}
