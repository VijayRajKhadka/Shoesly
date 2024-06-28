import 'package:shoesly/ui/views/home_screen/home_view.dart';
import 'package:shoesly/ui/views/product_screen/product_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';


@StackedApp(
    routes: [
        MaterialRoute(page: HomeView, initial: true),
        MaterialRoute(page: ProductView),
    ],
    dependencies: [
      Singleton(classType: NavigationService),


    ]
)



class App{}