import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

final helloInixindoProvider = Provider<String>((ref) {
  return 'Hello Inixindo Best Yahood!';
});

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<MainApp> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  @override
  void initState() {
    super.initState();
    final helloInixindo = ref.read(helloInixindoProvider);
    debugPrint(helloInixindo);
  }

  @override
  Widget build(BuildContext context) {
    final helloInixindo = ref.watch(helloInixindoProvider);

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
              Text(helloInixindo),
            ],
          ),
        ),
      ),
    );
  }
}
