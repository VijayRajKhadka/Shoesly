import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shoesly/ui/views/home_screen/home_view_model.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StackedView<HomeViewModel>{
  const HomeView({super.key});

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
   return Scaffold(

     appBar: AppBar(),
     body: Center(
       child: Text("Home"),
     ),
   );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
  }

