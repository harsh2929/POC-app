import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:AIApp/state/app_state.dart';
import 'package:AIApp/theme.dart';
import 'package:AIApp/widget/aclose_button.dart';
import 'package:AIApp/widget/theme_selectors.dart';
import 'package:AIApp/widget/top_view.dart';

class ActionTop extends HookConsumerWidget {
  final String title;
  const ActionTop({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStateNotifier = ref.read(AppStateNotifier.provider.notifier);
    return TopView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 44,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 44),
                Text(
                  title,
                  style: tt(context).titleMedium!.copyWith(color: C.white),
                ),
                ACloseButton(onPressed: appStateNotifier.start, color: C.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
