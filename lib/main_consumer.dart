import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

final helloInixindoProvider = Provider<String>((ref) {
  return 'Hello Inixindo Yahood!';
});

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Riverpod Lab",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Riverpod Lab"),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Consumer(
                builder: (context, WidgetRef ref, child) {
                  final helloInixindo = ref.watch(helloInixindoProvider);
                  return Text(helloInixindo);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
