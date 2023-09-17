import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:training_tasks/screens/science_screen.dart';

import 'controller/category_cubit.dart';


void main() {
  runApp(

    const MyApp(),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => CategoryCubit())
        ),
        // BlocProvider(create: ((context) => NewsApiCubit())
        // )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: scienceScreen(),
        // newsScreen(),

      ),
    );
  }
}

