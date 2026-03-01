import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../core/network/api_client.dart';

class AppProviders extends StatelessWidget {
  final Widget child;

  const AppProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [Provider<ApiClient>(create: (_) => ApiClient())],
      child: child,
    );
  }
}
