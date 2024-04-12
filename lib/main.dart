import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdax_flutter_exam/config/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pdax_flutter_exam/config/dimensions.dart' as dimensions;
import 'package:pdax_flutter_exam/config/provider/dimensions_provider.dart';
import 'package:pdax_flutter_exam/config/themes.dart';
import 'package:pdax_flutter_exam/router/router.dart';

void main() async {
  // =============== Load ENV =============== //
  await dotenv.load(fileName: Environment.fileName);

  // =============== Run App =============== //
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouteProvider);
    final screenSize = MediaQuery.of(context).size;

    // To determine the device screen size and set the state
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (screenSize.width < dimensions.dimensionMobile) {
        ref.read(dimensionControllerProvider.notifier).isMobile();
      } else if (screenSize.width >= dimensions.dimensionMobile &&
          screenSize.width < dimensions.dimensionDesktop) {
        ref.read(dimensionControllerProvider.notifier).isTablet();
      } else {
        ref.read(dimensionControllerProvider.notifier).isDesktop();
      }
    });

    //
    return MaterialApp.router(
      title: "Charles Lim",
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(context: context).themeData,
    );
  }
}
