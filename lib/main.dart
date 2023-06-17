import 'package:experiment_with_bloc/cubit/home_states.dart';
import 'package:experiment_with_bloc/data/repository/home_repository.dart';
import 'package:experiment_with_bloc/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  HomeRepository.registerAdapter();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => HomeCubit()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
