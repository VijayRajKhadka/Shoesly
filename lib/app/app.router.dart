// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i9;
import 'package:flutter/material.dart';
import 'package:shoesly/model/shoe_model.dart' as _i10;
import 'package:shoesly/ui/views/cart_screen/cart_view.dart' as _i5;
import 'package:shoesly/ui/views/check_out_screen/check_out_view.dart' as _i8;
import 'package:shoesly/ui/views/filter_screen/filter_view.dart' as _i6;
import 'package:shoesly/ui/views/home_screen/home_view.dart' as _i3;
import 'package:shoesly/ui/views/product_screen/product_view.dart' as _i4;
import 'package:shoesly/ui/views/review_screen/review_view.dart' as _i7;
import 'package:shoesly/ui/views/splash_screen/splash_screen_view.dart' as _i2;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i11;

class Routes {
  static const splashScreenView = '/';

  static const homeView = '/home-view';

  static const productView = '/product-view';

  static const cartView = '/cart-view';

  static const filterView = '/filter-view';

  static const reviewView = '/review-view';

  static const checkOutView = '/check-out-view';

  static const all = <String>{
    splashScreenView,
    homeView,
    productView,
    cartView,
    filterView,
    reviewView,
    checkOutView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashScreenView,
      page: _i2.SplashScreenView,
    ),
    _i1.RouteDef(
      Routes.homeView,
      page: _i3.HomeView,
    ),
    _i1.RouteDef(
      Routes.productView,
      page: _i4.ProductView,
    ),
    _i1.RouteDef(
      Routes.cartView,
      page: _i5.CartView,
    ),
    _i1.RouteDef(
      Routes.filterView,
      page: _i6.FilterView,
    ),
    _i1.RouteDef(
      Routes.reviewView,
      page: _i7.ReviewView,
    ),
    _i1.RouteDef(
      Routes.checkOutView,
      page: _i8.CheckOutView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashScreenView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SplashScreenView(),
        settings: data,
      );
    },
    _i3.HomeView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.HomeView(),
        settings: data,
      );
    },
    _i4.ProductView: (data) {
      final args = data.getArgs<ProductViewArguments>(nullOk: false);
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.ProductView(args.shoeRating,
            key: args.key, shoeModel: args.shoeModel),
        settings: data,
      );
    },
    _i5.CartView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.CartView(),
        settings: data,
      );
    },
    _i6.FilterView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.FilterView(),
        settings: data,
      );
    },
    _i7.ReviewView: (data) {
      final args = data.getArgs<ReviewViewArguments>(nullOk: false);
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => _i7.ReviewView(args.rating, key: args.key),
        settings: data,
      );
    },
    _i8.CheckOutView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.CheckOutView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class ProductViewArguments {
  const ProductViewArguments({
    required this.shoeRating,
    this.key,
    required this.shoeModel,
  });

  final double shoeRating;

  final _i9.Key? key;

  final _i10.Shoe shoeModel;

  @override
  String toString() {
    return '{"shoeRating": "$shoeRating", "key": "$key", "shoeModel": "$shoeModel"}';
  }

  @override
  bool operator ==(covariant ProductViewArguments other) {
    if (identical(this, other)) return true;
    return other.shoeRating == shoeRating &&
        other.key == key &&
        other.shoeModel == shoeModel;
  }

  @override
  int get hashCode {
    return shoeRating.hashCode ^ key.hashCode ^ shoeModel.hashCode;
  }
}

class ReviewViewArguments {
  const ReviewViewArguments({
    required this.rating,
    this.key,
  });

  final double rating;

  final _i9.Key? key;

  @override
  String toString() {
    return '{"rating": "$rating", "key": "$key"}';
  }

  @override
  bool operator ==(covariant ReviewViewArguments other) {
    if (identical(this, other)) return true;
    return other.rating == rating && other.key == key;
  }

  @override
  int get hashCode {
    return rating.hashCode ^ key.hashCode;
  }
}

extension NavigatorStateExtension on _i11.NavigationService {
  Future<dynamic> navigateToSplashScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProductView({
    required double shoeRating,
    _i9.Key? key,
    required _i10.Shoe shoeModel,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.productView,
        arguments: ProductViewArguments(
            shoeRating: shoeRating, key: key, shoeModel: shoeModel),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCartView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.cartView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToFilterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.filterView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToReviewView({
    required double rating,
    _i9.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.reviewView,
        arguments: ReviewViewArguments(rating: rating, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCheckOutView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.checkOutView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProductView({
    required double shoeRating,
    _i9.Key? key,
    required _i10.Shoe shoeModel,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.productView,
        arguments: ProductViewArguments(
            shoeRating: shoeRating, key: key, shoeModel: shoeModel),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCartView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.cartView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithFilterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.filterView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithReviewView({
    required double rating,
    _i9.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.reviewView,
        arguments: ReviewViewArguments(rating: rating, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCheckOutView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.checkOutView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
