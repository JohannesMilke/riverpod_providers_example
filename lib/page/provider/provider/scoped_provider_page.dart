import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_providers_example/widget/text_widget.dart';

final scopedProvider = ScopedProvider<int>((ref) => throw UnimplementedError());

class ScopedProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('ScopedProvider'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildScoped(42),
              buildScoped(90),
              buildScoped(), // throws exception
            ],
          ),
        ),
      );

  Widget buildScoped([int value]) {
    final consumer = Consumer(
      builder: (context, watch, child) {
        final number = watch(scopedProvider).toString();

        return TextWidget(number);
      },
    );

    return value == null
        ? consumer
        : ProviderScope(
            overrides: [
              scopedProvider.overrideWithValue(value),
            ],
            child: consumer,
          );
  }
}
