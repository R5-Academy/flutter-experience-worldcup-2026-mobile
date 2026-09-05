import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wc_2026_mobile/routing/routes.dart';
import 'package:wc_2026_mobile/ui/auth/login/login_bindings.dart';
import 'package:wc_2026_mobile/ui/auth/login/login_screen.dart';
import 'package:wc_2026_mobile/ui/splash/splash_screen.dart';
import 'package:wc_2026_mobile/ui/welcome/welcome_screen.dart';

GoRouter router() => GoRouter(
  initialLocation: Routes.login,
  routes: [
    GoRoute(path: Routes.splash, builder: (_, _) => SplashScreen()),
    GoRoute(path: Routes.welcome, builder: (_, _) => WelcomeScreen()),
    GoRoute(
      path: Routes.login,
      builder: (_, _) => LoginBindings(
        screenBuilder: (context) {
          return LoginScreen(viewModel: context.read());
        },
      ),
    ),
  ],
);
