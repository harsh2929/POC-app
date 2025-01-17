import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:AIApp/screens/history/history_tab.dart';
import 'package:AIApp/screens/setting_screen.dart';
import 'package:AIApp/screens/start_screen/meal_wiz_content.dart';
import 'package:AIApp/screens/start_screen/start_tab_bar.dart';
import 'package:AIApp/settings.dart';
import 'package:AIApp/state/tab.dart';
import 'package:AIApp/theme.dart';
import 'package:AIApp/utils/after_delay.dart';
import 'package:AIApp/utils/logger.dart';

class StartScreen extends HookConsumerWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tab = ref.watch(TabNotifier.provider);
    final tabNotifier = ref.read(TabNotifier.provider.notifier);

    final pageController = usePageController();
    final onChangeTab = useCallback((int index) async {
      tabNotifier.setTab(index);
      while (!pageController.hasClients) {
        await Future.delayed(const Duration(milliseconds: 100));
      }
      pageController.animateToPage(index, duration: A.normal, curve: CV.normal);
    }, [pageController.hasClients, tab]);

    useEffect(() {
      onChangeTab(tab);
      return null;
    }, [tab]);
    useAutomaticKeepAlive();

    return Scaffold(
      backgroundColor: C.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
              child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: const [
              MealWizContent(),
              HistoryTab(),
              SettingScreen(),
            ],
          )),
          Container(height: 1, width: double.infinity, color: C.grey5),
          StartTabBar(onChangeTab: onChangeTab, selectedIndex: tab),
        ],
      ),
    );
  }
}
