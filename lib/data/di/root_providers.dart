import 'package:flutter/widgets.dart';

import 'app_providers.dart';
import 'auth_providers.dart';
import 'home_providers.dart';

class RootProviders extends StatelessWidget {
  final Widget child;

  const RootProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AppProviders(
      child: AuthProviders(
        child: HomeProviders(
          child: child,
        ),
      ),
    );
  }
}