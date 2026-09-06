import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wc_2026_mobile/config/environment.dart';
import 'package:wc_2026_mobile/data/repositories/auth/auth_repository.dart';
import 'package:wc_2026_mobile/data/repositories/auth/auth_repository_remote.dart';
import 'package:wc_2026_mobile/data/repositories/team/team_repository.dart';
import 'package:wc_2026_mobile/data/repositories/team/team_repository_remote.dart';
import 'package:wc_2026_mobile/data/services/api/auth_api.dart';
import 'package:wc_2026_mobile/data/services/api/team_api.dart';
import 'package:wc_2026_mobile/routing/router.dart';

class const ApplicationBindings({super.key, required final Widget child})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<GoRouter>(create: (context) => router()),
        Provider(
          create: (context) => Dio(BaseOptions(baseUrl: Environment.baseUrl)),
        ),
        Provider(create: (context) => AuthApi(context.read())),
        Provider<AuthRepository>(
          create: (context) => AuthRepositoryRemote(authApi: context.read()),
        ),

        Provider(create: (context) => TeamApi(context.read())),
        Provider<TeamRepository>(
          create: (context) => TeamRepositoryRemote(teamApi: context.read()),
        ),
      ],
      child: child,
    );
  }
}
