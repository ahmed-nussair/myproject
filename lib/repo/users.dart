import 'package:chopper/chopper.dart';

import '../model/user.dart';
import '../model/address.dart';
import '../model/company.dart';
import '../model/geo.dart';

import 'base_url.dart';
import 'json_to_type_converter.dart';

part 'users.chopper.dart';

@ChopperApi(baseUrl: '/users')
abstract class Users extends ChopperService {
  @Get()
  Future<Response<List<User>>> getUsers();

  @Get()
  Future<Response<List<User>>> getUser(@Query('id') int userId);

  @Get(path: '/{userId}')
  Future<Response<User>> getUserById(@Path('userId') int userId);

  static Users create() {
    var client = ChopperClient(
      baseUrl: baseUrl,
      converter: JsonToTypeConverter({
        User: (json) => User.fromJson(json),
        Address: (json) => Address.fromJson(json),
        Geo: (json) => Geo.fromJson(json),
        Company: (json) => Company.fromJson(json),
      }),
      services: [
        _$Users(),
      ],
    );
    return _$Users(client);
  }
}
