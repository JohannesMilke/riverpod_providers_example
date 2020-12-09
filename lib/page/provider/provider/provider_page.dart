import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:riverpod_providers_example/widget/text_widget.dart';

final numberProvider = Provider<int>((ref) => 42);

class ProviderPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final number = watch(numberProvider).toString();

    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
      body: Center(child: TextWidget(number)),
    );
  }
}

// class ProviderPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Provider'),
//       ),
//       body: Center(
//         child: Consumer(
//           builder: (context, watch, child) {
//             final number = watch(numberProvider).toString();

//             return TextWidget(number);
//           },
//         ),
//       ),
//     );
//   }
// }
