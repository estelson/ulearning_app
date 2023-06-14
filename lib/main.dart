import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/routes/routes.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/firebase_options.dart';
import 'package:ulearning_app/pages/application/bloc/app_blocs.dart';
import 'package:ulearning_app/pages/application/bloc/app_states.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  setSystemUi();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: AppColors.primaryText),
            ),
          ),
          onGenerateRoute: AppPages.generateRouteSettings,
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Demo Home Page"),
        centerTitle: true,
        // Cor da StatusBar em dispositivos mobile
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      body: Center(child: BlocBuilder<AppBlocs, AppState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                // "${BlocProvider.of<AppBlocs>(context).state.counter}",
                "${state.index}",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          );
        },
      )),
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   children: [
      //     FloatingActionButton(
      //       heroTag: "heroTag1",
      //       onPressed: () => BlocProvider.of<AppBlocs>(context).add(
      //         Decrement(),
      //       ),
      //       tooltip: 'Decrement',
      //       child: const Icon(Icons.remove),
      //     ),
      //     FloatingActionButton(
      //       heroTag: "heroTag2",
      //       onPressed: () => BlocProvider.of<AppBlocs>(context).add(
      //         Increment(),
      //       ),
      //       tooltip: 'Increment',
      //       child: const Icon(Icons.add),
      //     ),
      //   ],
      // ),
    );
  }
}

/// Cor da StatusBar em dispositivos mobile
void setSystemUi() {
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    );

    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}
