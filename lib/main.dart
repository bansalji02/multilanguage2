import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('hi'), Locale('pa')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multilanguage demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('intro').tr(),
            const SizedBox(
              height: 16,
            ),
            ButtonBar(
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.locale = Locale('en', 'US');
                  },
                  child: Text('English'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.setLocale(Locale('pa'));
                  },
                  child: Text('Punjabi '),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.locale = Locale('hi');
                  },
                  child: Text('Hindi'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
