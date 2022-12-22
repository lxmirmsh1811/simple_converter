import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_converter/utils/helper_enums.dart';

import 'package:simple_converter/features/home/presentation/pages/home_view.dart';
import 'package:simple_converter/features/home/presentation/widgets/drawer.dart';

import '../../../../utils/service_locator.dart';
import '../cubit/home_cubit.dart';

class HomePageArguments {
  final Categories pageTitle;

  HomePageArguments({
    required this.pageTitle,
  });
}

class Home extends StatelessWidget {
  static const String routeName = 'home';
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;

    final homePageArguments = args != null ? args as HomePageArguments : null;
    return Scaffold(
      backgroundColor: Colors.grey[850],
      drawer: const ConversionDrawer(
        key: ValueKey('drawer'),
      ),
      appBar: AppBar(
        key: const ValueKey('appBar'),
        title: Text(
          homePageArguments?.pageTitle.categoryName ??
              Categories.length.categoryName,
        ),
      ),
      body: BlocProvider<HomeCubit>(
        create: (context) => getIt<HomeCubit>(),
        child: HomeView(
            category: homePageArguments?.pageTitle ?? Categories.length),
      ),
    );
  }
}
