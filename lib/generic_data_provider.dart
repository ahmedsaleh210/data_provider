import 'package:flutter/material.dart';

class DataProvider<T> extends InheritedWidget {
  final T provider;

  const DataProvider({
    super.key,
    required Widget child,
    required this.provider,
  }) : super(child: child);

  @override
  bool updateShouldNotify(DataProvider oldWidget) =>
      provider != oldWidget.provider;

  static T of<T>(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<DataProvider<T>>()
            as DataProvider<T>)
        .provider;
  }
}

extension DataProviderExtension on BuildContext {
  T readData<T>() {
    return (dependOnInheritedWidgetOfExactType<DataProvider<T>>()
            as DataProvider<T>)
        .provider;
  }
}
