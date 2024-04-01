import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_segment/flutter_segment.dart';
import 'package:AIApp/api/dio/dio_ext.dart';
import 'package:AIApp/model/recipe_request.dart';
import 'package:AIApp/model/recipe_response.dart';
import 'package:AIApp/state/access_token.dart';
import 'package:AIApp/state/error.dart';
import 'package:AIApp/state/history.dart';
import 'package:AIApp/state/mode_speed.dart';
import 'package:AIApp/state/session_id.dart';
import 'package:AIApp/state/user_id.dart';

import 'api.dart';

CancelToken? _token;

final recipeAPI = FutureProvider.autoDispose
    .family<RecipeResponse, String>((ref, prompt) async {
  final payload = RecipeRequest(
    userId: ref.read(UserIdNotifier.provider)!,
    sessionId: ref.read(sessionId)!,
    modelSpeed: ref.read(modelSpeed),
    prompt: prompt,
  );
  _token?.cancel();
  _token = CancelToken();

  try {
    final result = await ref.read(dio).safePost(
          '/recipe-request',
          RecipeResponse.fromJson,
          cancelToken: _token,
          data: {'payload': payload.toJson()},
          options: ref.read(accessToken),
          ref: ref,
        );

    final historyNotifier = ref.read(HistoryNotifier.provider.notifier);
    historyNotifier.addAll(result.recipes, prompt);
    Segment.track(eventName: 'Receive recipes', properties: {'prompt': prompt});

    return result;
  } on Exception catch (e) {
    ref.read(ErrorNotifier.provider.notifier).store(e.toString());
    rethrow;
  }
});
