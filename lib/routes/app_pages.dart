import 'package:calculator/routes/app_routes.dart';
import 'package:calculator/ui/pages/calc_page.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.initial,
      page: () => const CalcPage(),
    ),
  ];
}
