import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_weather/features/weather/presentation/pages/home_page.dart';

import 'features/weather/presentation/bloc/main_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,

        home: HomePage(),
      ),
    );
  }
}


