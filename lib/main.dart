import 'package:data_provider_example/generic_data_provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return DataProvider(
      // TODO Create Object
      provider: HomeData()..setTitle('Test Inherited Widget'),
      child: const Scaffold(
          body: Center(
              child: Column(
        children: [TextWidget()],
      ))),
    );
  }
}
class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final homeData = context.readData<HomeData>(); //TODO Access Object
    return Text(homeData.title ?? '', style: const TextStyle(fontSize: 35));
  }
}
class HomeData {
  String? title;

  void setTitle(String title) {
    this.title = title;
  }
}
