import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_task/core/themes/app_themes.dart';
import 'package:machine_task/features/products/bloc/product_bloc.dart';
import 'package:machine_task/features/products/views/pages/product_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductBloc(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppThemes.themeData,
          title: AppThemes.appName,
          home: ProductPage(),
        ),
      ),
    );
  }
}
