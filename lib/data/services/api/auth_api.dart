import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wc_2026_mobile/data/services/api/model/auth/auth_session_api_model.dart';
import 'package:wc_2026_mobile/data/services/api/model/login/login_request.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio) = _AuthApi;

  @POST('/v1/auth/login')
  @Extra({})
  Future<AuthSessionApiModel> login(@Body() LoginRequest request);
}
