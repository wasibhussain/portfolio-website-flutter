import 'package:flutter/material.dart';
import 'package:portfolio_site/core/local_data_source.dart';
import 'package:portfolio_site/dashboard/views/screen/home.dart';
import 'package:portfolio_site/theme/app_theme.dart';
import 'package:portfolio_site/theme/theme_provider.dart';
import 'package:provider/provider.dart';

main() async {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  bool? themeVal;

  @override
  void initState() {
    setval();
    super.initState();
  }

  setval() async {
  bool isDark = await LocalDataSource.getThemeValue();
  Provider.of<ThemeProvider>(context, listen: false).isDarkTheme = isDark;
}


  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, provider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: provider.isDarkTheme
              ? AppTheme().darkTheme
              : AppTheme().lightTheme,
          home: const HomeScreen(),
        );
      },
    );
  }
}
