import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:AIApp/screens/history/history_detail_screen.dart';
import 'package:AIApp/screens/history/history_screen.dart';
import 'package:AIApp/screens/recipe/schedule_later_screen.dart';
import 'package:AIApp/state/app_state.dart';
import 'package:AIApp/utils/page_creator.dart';

class HistoryTab extends HookConsumerWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(AppStateNotifier.provider);
    return Navigator(
      onPopPage: (route, result) => false,
      pages: [
        pageCreator(const HistoryScreen()),
        if (appState.index >= AppState.historyDetail.index)
          pageCreator(const HistoryDetailScreen()),
        if (appState.index >= AppState.scheduleLater.index)
          pageCreator(const ScheduleLaterScreen()),
      ],
    );
  }
}
