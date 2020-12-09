import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_providers_example/widget/text_widget.dart';

Future<int> fetchWeather() async {
  await Future.delayed(Duration(seconds: 2));

  return 20;
}

// FutureProvider.autoDispose: destroys state if no-longer listened
final futureProvider = FutureProvider<int>((ref) => fetchWeather());

class FutureProviderPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final future = watch(futureProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('FutureProvider'),
      ),
      body: Center(
        child: future.when(
          data: (value) => TextWidget(value.toString()),
          loading: () => CircularProgressIndicator(),
          error: (e, stack) => TextWidget('Error: $e'),
        ),
      ),
    );
  }
}
