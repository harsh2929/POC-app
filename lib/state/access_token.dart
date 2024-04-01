import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:AIApp/utils/logger.dart';
import 'package:dio/dio.dart';


final accessToken = Provider((ref) {
  final value = ref.watch(ACN.provider);
  return Options(headers: {"Authorization": "Bearer $value"});
});

class ACN extends StateNotifier<String> {
  final Ref ref;
  static final provider = StateNotifierProvider<ACN, String>(
      ACN.new);

  ACN(this.ref) : super("");

  store(String accessToken) {
    L.d("----->accessToken: $accessToken");
    return state = accessToken;
  }
}
