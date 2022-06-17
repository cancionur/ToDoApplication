import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_application/cubit/anasayfa_cubit.dart';
import 'package:to_do_application/cubit/yapilacak_detay_cubit.dart';
import 'package:to_do_application/cubit/yapilacak_kayit_cubit.dart';
import 'package:to_do_application/views/anasayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => YapilacakKayitCubit()),
        BlocProvider(create: (context) => YapilacakDetayCubit()),
        BlocProvider(create: (context) => AnaSayfaCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AnaSayfa(),
      ),
    );
  }
}


