import 'package:shoesly/ui/views/cart_screen/cart_view.dart';
import 'package:shoesly/ui/views/filter_screen/filter_view.dart';
import 'package:shoesly/ui/views/home_screen/home_view.dart';
import 'package:shoesly/ui/views/product_screen/product_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';


@StackedApp(
    routes: [
        MaterialRoute(page: HomeView, initial: true),
        MaterialRoute(page: ProductView),
        MaterialRoute(page: CartView),
        MaterialRoute(page: FilterView),


    ],
    dependencies: [
      Singleton(classType: NavigationService),


    ]
)



class App{}