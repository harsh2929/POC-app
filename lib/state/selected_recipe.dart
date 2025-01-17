import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:AIApp/model/recipe.dart';
import 'package:AIApp/state/app_state.dart';

class SelectedRecipeNotifier extends StateNotifier<Recipe> {
  final Ref ref;
  static final provider = StateNotifierProvider<SelectedRecipeNotifier, Recipe>(
      SelectedRecipeNotifier.new);

  SelectedRecipeNotifier(this.ref) : super(Recipe.empty);

  store(Recipe recipe, bool fromHistory) {
    state = recipe;
    final appStateNotifier = ref.read(AppStateNotifier.provider.notifier);
    fromHistory
        ? appStateNotifier.historyDetail()
        : appStateNotifier.recipeDetail();
  }
}
