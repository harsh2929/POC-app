import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:AIApp/settings.dart';
import 'package:AIApp/state/app_state.dart';
import 'package:AIApp/state/error.dart';
import 'package:AIApp/theme.dart';
import 'package:AIApp/utils/compose.dart';
import 'package:AIApp/widget/abutton.dart';
import 'package:AIApp/widget/base_screen.dart';
import 'package:AIApp/widget/texts/normal_title.dart';
import 'package:AIApp/widget/theme_selectors.dart';

class ErrorScreen extends HookConsumerWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errorNotifier = ref.read(ErrorNotifier.provider.notifier);
    final appStateNotifier = ref.read(AppStateNotifier.provider.notifier);
    final error = ref.watch(ErrorNotifier.provider);

    final copyToClipboard = useCallback(() async {
      if (error == null) {
        return;
      }
      Clipboard.setData(ClipboardData(text: error)).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Error details copied to clipboard")));
      });
    }, [error]);
    return BaseScreen(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(M.normal, M.normal, M.normal, 0),
      child: Column(
        children: [
          const NormalTitle("HTTP error"),
          const SizedBox(height: M.normal),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                error ?? "",
                style: tt(context).bodyMedium!.copyWith(color: C.front),
                softWrap: true,
              ),
            ),
          ),
          AButton(onPressed: copyToClipboard, title: "Copy to clipboard"),
          AButton(
              onPressed: errorNotifier.reset, title: "Done", inverted: true),
          AButton(
              onPressed: compose(appStateNotifier.start, errorNotifier.reset),
              title: "Restart App",
              inverted: true),
        ],
      ),
    ));
  }
}
