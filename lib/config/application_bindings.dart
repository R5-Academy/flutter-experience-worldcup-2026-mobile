import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wc_2026_mobile/config/environment.dart';
import 'package:wc_2026_mobile/core/auth/auth_session_notifier.dart';
import 'package:wc_2026_mobile/data/repositories/album/album_repository.dart';
import 'package:wc_2026_mobile/data/repositories/album/album_repository_remote.dart';
import 'package:wc_2026_mobile/data/repositories/auth/auth_repository.dart';
import 'package:wc_2026_mobile/data/repositories/auth/auth_repository_remote.dart';
import 'package:wc_2026_mobile/data/repositories/auth_session/auth_session_repository.dart';
import 'package:wc_2026_mobile/data/repositories/auth_session/auth_session_repository_local.dart';
import 'package:wc_2026_mobile/data/repositories/team/team_repository.dart';
import 'package:wc_2026_mobile/data/repositories/team/team_repository_remote.dart';
import 'package:wc_2026_mobile/data/services/api/album_api.dart';
import 'package:wc_2026_mobile/data/services/api/auth_api.dart';
import 'package:wc_2026_mobile/data/services/api/team_api.dart';
import 'package:wc_2026_mobile/data/services/local/secure_storage_service.dart';
import 'package:wc_2026_mobile/domain/use_cases/auth/auth_logout_use_case.dart';
import 'package:wc_2026_mobile/domain/use_cases/auth/auth_restore_session_use_case.dart';
import 'package:wc_2026_mobile/routing/router.dart';

class const ApplicationBindings({super.key, required final Widget child})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => SecureStorageService()),

        Provider(
          create: (context) => Dio(BaseOptions(baseUrl: Environment.baseUrl)),
        ),

        Provider(create: (context) => AuthApi(context.read())),
        Provider<AuthRepository>(
          create: (context) => AuthRepositoryRemote(authApi: context.read()),
        ),
        Provider<AuthSessionRepository>(
          create: (context) =>
              AuthSessionRepositoryLocal(storage: context.read()),
        ),

        Provider(create: (context) => TeamApi(context.read())),
        Provider<TeamRepository>(
          create: (context) => TeamRepositoryRemote(teamApi: context.read()),
        ),

        Provider(create: (context) => AlbumApi(context.read())),
        Provider<AlbumRepository>(
          create: (context) => AlbumRepositoryRemote(albumApi: context.read()),
        ),

        Provider(
          create: (context) =>
              AuthLogoutUseCase(authSessionRepository: context.read()),
        ),
        Provider(
          create: (context) =>
              AuthRestoreSessionUseCase(authSessionRepository: context.read()),
        ),

        ChangeNotifierProvider(
          lazy: false,
          create: (context) => AuthSessionNotifier(
            authLogoutUseCase: context.read(),
            authRestoreSessionUseCase: context.read(),
          ),
        ),
        Provider<GoRouter>(create: (context) => router(context.read())),
      ],
      child: child,
    );
  }
}
