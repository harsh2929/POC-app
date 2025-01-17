import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:AIApp/screens/recipe/recipe_detail_screen.dart';
import 'package:AIApp/screens/recipe/recipe_result_screen.dart';
import 'package:AIApp/screens/recipe/schedule_later_screen.dart';
import 'package:AIApp/screens/refine/search_screen.dart';
import 'package:AIApp/screens/start_screen/meal_wiz_onboarding.dart';
import 'package:AIApp/state/app_state.dart';
import 'package:AIApp/state/meal_wiz_onboarding_seen.dart';
import 'package:AIApp/utils/page_creator.dart';

class MealWizContent extends HookConsumerWidget {
  const MealWizContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mealWizOnboardingSeen =
        ref.watch(MealWizOnboardingSeenNotifier.provider);
    final appState = ref.watch(AppStateNotifier.provider);
    return Navigator(
      onPopPage: (route, result) => false,
      pages: [
        pageCreator(const MealWizOnboarding()),
        if (mealWizOnboardingSeen) pageCreator(const SearchScreen()),
        if (appState.index >= AppState.recipe.index)
          pageCreator(const RecipeResultScreen()),
        if (appState.index >= AppState.recipeDetail.index)
          pageCreator(const RecipeDetailScreen()),
        if (appState.index >= AppState.scheduleLater.index)
          pageCreator(const ScheduleLaterScreen()),
      ],
    );
  }
}
