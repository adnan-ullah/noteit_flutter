import '../presentation/bloc/notes/notes_view.dart';
import '../presentation/bloc/products/product_view.dart';
import '../presentation/pages/CricketPage.dart';
import 'app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.PRODUCTS;

  static final routes = [
    GetPage(
      name: Paths.PRODUCTS,
      page: () => ProductsPage(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: Paths.NOTEPAGE,
      page: () => NotesPage(),
      middlewares: [MyMiddelware()],
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(milliseconds: 500),
    ),  GetPage(
      name: '/cricket',
      page: () => CricketPage(),
      middlewares: [MyMiddelware()],
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(milliseconds: 500),
    ),
  ];
}

class MyMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    print(page?.name);
    return super.onPageCalled(page);
  }
}