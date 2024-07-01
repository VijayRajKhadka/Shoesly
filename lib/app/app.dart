import 'package:shoesly/ui/views/cart_screen/cart_view.dart';
import 'package:shoesly/ui/views/check_out_screen/check_out_view.dart';
import 'package:shoesly/ui/views/filter_screen/filter_view.dart';
import 'package:shoesly/ui/views/home_screen/home_view.dart';
import 'package:shoesly/ui/views/product_screen/product_view.dart';
import 'package:shoesly/ui/views/review_screen/review_view.dart';
import 'package:shoesly/ui/views/splash_screen/splash_screen_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/shoeServices.dart';


@StackedApp(
    routes: [
        MaterialRoute(page: SplashScreenView, initial: true),
        MaterialRoute(page: HomeView),
        MaterialRoute(page: ProductView),
        MaterialRoute(page: CartView),
        MaterialRoute(page: FilterView),
        MaterialRoute(page: ReviewView),
        MaterialRoute(page: CheckOutView),




    ],
    dependencies: [
      Singleton(classType: NavigationService),
      Singleton(classType: FirestoreService)


    ]
)



class App{}