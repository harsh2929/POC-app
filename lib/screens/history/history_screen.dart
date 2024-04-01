import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:AIApp/ext/list_ext.dart';
import 'package:AIApp/screens/recipe_carousel.dart';
import 'package:AIApp/state/history.dart';
import 'package:AIApp/state/tab.dart';
import 'package:AIApp/theme.dart';
import 'package:AIApp/widget/texts/large_body.dart';
import 'package:AIApp/widget/texts/normal_title.dart';
import 'package:AIApp/widget/vec_pic.dart';

class HistoryScreen extends HookConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipes = ref.watch(HistoryNotifier.provider
        .select((state) => state.mapp((a) => a.recipe)));
    final tabNotifier = ref.read(TabNotifier.provider.notifier);
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const NormalTitle("Your cookbook"),
          if (recipes.isEmpty) const Spacer(),
          recipes.isEmpty
              ? InkWell(
                  onTap: () => tabNotifier.setTab(0),
                  child: const Column(
                    children: [
                      VecPic(
                        'big_logo',
                        iconSize: 128,
                        color: C.front,
                      ),
                      SizedBox(height: 32),
                      LargeBody("Add your first recipe!",
                          color: C.front, bold: true),
                    ],
                  ),
                )
              : Expanded(
                  child: RecipeCarousel(
                    recipes: recipes,
                    fromHistory: true,
                  ),
                ),
          if (recipes.isEmpty) const Spacer(),
          if (recipes.isNotEmpty) const SizedBox(height: 8),
        ],
      ),
    );
  }
}
