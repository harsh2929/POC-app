import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:AIApp/widget/base_screen.dart';
import 'package:AIApp/widget/progress.dart';

class LoadingScreen extends HookConsumerWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      const BaseScreen(child: Center(child: Progress()));
}
