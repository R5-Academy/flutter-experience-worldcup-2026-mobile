import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wc_2026_mobile/core/auth/auth_session_notifier.dart';
import 'package:wc_2026_mobile/routing/routes.dart';
import 'package:wc_2026_mobile/ui/album/album_bindings.dart';
import 'package:wc_2026_mobile/ui/album/album_screen.dart';
import 'package:wc_2026_mobile/ui/auth/login/login_bindings.dart';
import 'package:wc_2026_mobile/ui/auth/login/login_screen.dart';
import 'package:wc_2026_mobile/ui/auth/register/register_bindings.dart';
import 'package:wc_2026_mobile/ui/auth/register/register_screen.dart';
import 'package:wc_2026_mobile/ui/home/home_bindings.dart';
import 'package:wc_2026_mobile/ui/home/home_screen.dart';
import 'package:wc_2026_mobile/ui/main/main_screen.dart';
import 'package:wc_2026_mobile/ui/more/more_screen.dart';
import 'package:wc_2026_mobile/ui/splash/splash_screen.dart';
import 'package:wc_2026_mobile/ui/sticker/detail/detail_bindings.dart';
import 'package:wc_2026_mobile/ui/sticker/detail/detail_screen.dart';
import 'package:wc_2026_mobile/ui/trades/trades_screen.dart';
import 'package:wc_2026_mobile/ui/welcome/welcome_screen.dart';

GoRouter router(AuthSessionNotifier session) => GoRouter(
  initialLocation: Routes.splash,
  refreshListenable: session,
  redirect: (_, state) {
    final destination = state.matchedLocation;

    if (destination == Routes.splash) return null;

    if (!session.isRestored) return null;

    final isPublic = Routes.public.contains(destination);

    if (!session.isSignedIn) return isPublic ? null : Routes.login;

    return isPublic ? Routes.home : null;
  },
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, _) => SplashScreen(sessionNotifier: context.read()),
    ),
    GoRoute(path: Routes.welcome, builder: (_, _) => WelcomeScreen()),
    GoRoute(
      path: Routes.login,
      builder: (_, _) => LoginBindings(
        screenBuilder: (context) {
          return LoginScreen(viewModel: context.read());
        },
      ),
    ),
    GoRoute(
      path: Routes.authRegister,
      builder: (context, state) => RegisterBindings(
        screenBuilder: (context) => RegisterScreen(viewModel: context.read()),
      ),
    ),

    GoRoute(
      path: Routes.stickerPath,
      builder: (context, state) {
        final sticker = state.extra as DetailArgs;

        return DetailBindings(
          stickers: sticker,
          screenBuilder: (context) => DetailScreen(sticker: sticker),
        );
      },
    ),

    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          MainScreen(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.home,
              builder: (context, state) => HomeBindings(
                screenBuilder: (context) => HomeScreen(
                  viewModel: context.read(),
                  session: context.read(),
                ),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.album,
              builder: (context, state) => AlbumBindings(
                screenBuilder: (context) =>
                    AlbumScreen(viewModel: context.read()),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.trades,
              builder: (context, state) => TradesScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.more,
              builder: (context, state) => MoreScreen(session: context.read()),
            ),
          ],
        ),
      ],
    ),
  ],
);
