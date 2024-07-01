import 'package:shoesly/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class SplashScreenViewModel extends BaseViewModel{
  final NavigationService _navigationService = locator<NavigationService>();

  void onStartApp() async {
    await Future.delayed(const Duration(milliseconds: 4000));

    //clearing all stacks and routing to home page
    _navigationService.clearStackAndShow(Routes.homeView);

    }
  }
