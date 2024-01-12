import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

final helloInixindoProvider = Provider<String>((ref) {
  return 'Hello Inixindo!';
});

final counterStateProvider = StateProvider<int>((_) => 0);

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Riverpod Lab",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: const RiverpodApp(),
    );
  }
}

class RiverpodApp extends ConsumerWidget {
  const RiverpodApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final helloInixindo = ref.watch(helloInixindoProvider);
    final counter = ref.watch(counterStateProvider);

    ref.listen(counterStateProvider, (previous, current) {
      debugPrint("$current");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Value is $current")));
    });

    return Scaffold(
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
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => ref.read(counterStateProvider.notifier).state++,
              child: Text("Value is $counter"),
            ),
          ],
        ),
      ),
    );
  }
}
