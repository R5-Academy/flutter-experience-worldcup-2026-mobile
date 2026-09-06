import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wc_2026_mobile/routing/routes.dart';
import 'package:wc_2026_mobile/ui/auth/login/login_bindings.dart';
import 'package:wc_2026_mobile/ui/auth/login/login_screen.dart';
import 'package:wc_2026_mobile/ui/auth/register/register_bindings.dart';
import 'package:wc_2026_mobile/ui/auth/register/register_screen.dart';
import 'package:wc_2026_mobile/ui/home/home_screen.dart';
import 'package:wc_2026_mobile/ui/splash/splash_screen.dart';
import 'package:wc_2026_mobile/ui/welcome/welcome_screen.dart';

GoRouter router() => GoRouter(
  initialLocation: Routes.splash,
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
    GoRoute(
      path: Routes.authRegister,
      builder: (context, state) => RegisterBindings(
        screenBuilder: (context) => RegisterScreen(viewModel: context.read()),
      ),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => HomeScreen(name: state.extra as String),
    ),
  ],
);
