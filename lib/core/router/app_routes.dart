import 'package:go_router/go_router.dart';
import 'package:saidoffapp/core/router/name_routes.dart';
import 'package:saidoffapp/features/home/view/page/home.dart';
import 'package:saidoffapp/features/login/view/page/login_page.dart';
import 'package:saidoffapp/features/onboarding/view/pages/onboarding_page.dart';
import 'package:saidoffapp/features/register/view/pages/register.dart';
import 'package:saidoffapp/features/spash/view/pages/splash_page.dart';
import 'package:saidoffapp/keraksiz.dart';

class Routing {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.initial,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: Routes.initial,
        path: Routes.initial,
        builder: (context, state) => const SplashPage(),
      ),
      //  GoRoute(
      //   name: Routes.initial,
      //   path: Routes.initial,
      //   builder: (context, state) => const Keraksiz(),
      // ),
       GoRoute(
        name: Routes.onboarding,
        path: Routes.onboarding,
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        name: Routes.login,
        path: Routes.login,
        builder: (context, state) => const LoginPage(),
      ), GoRoute(
        name: Routes.register,
        path: Routes.register,
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        name: Routes.home,
        path: Routes.home,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
