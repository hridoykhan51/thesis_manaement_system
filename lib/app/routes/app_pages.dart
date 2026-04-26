import 'package:get/get.dart';

import '../../features/auth/presentation/bindings/auth_binding.dart';
import '../../features/auth/pages/screen/login_page.dart';
import '../../features/dashboard/student/bindings/student_binding.dart';
import '../../features/dashboard/student/pages/screen/student_dashboard_page.dart';
import '../../features/landing_page/bindings/landing_page_binding.dart';
import '../../features/landing_page/pages/screen/landing_page.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = <GetPage<dynamic>>[
    GetPage(
      name: AppRoutes.landing,
      page: () => const LandingPage(),
      binding: LandingPageBinding(),
    ),
    GetPage(
      name: AppRoutes.auth,
      page: () => const LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.studentDashboard,
      page: () => const StudentDashboardPage(),
      bindings: [
        AuthBinding(),
        StudentBinding(),
      ],
    ),
  ];
}
