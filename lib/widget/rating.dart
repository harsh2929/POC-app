import 'package:collection_ext/all.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:AIApp/ext/list_ext.dart';
import 'package:AIApp/settings.dart';
import 'package:AIApp/theme.dart';

_getStar(double rating, int index) => index - rating == 0.5
    ? Icons.star_half
    : (index < rating ? Icons.star : Icons.star_border);

class Rating extends HookConsumerWidget {
  final double rating;
  const Rating({super.key, required this.rating});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: 1.upTo(5).mapp((index) => Icon(
            _getStar(rating, index),
            color: C.front,
            size: M.normal,
          )),
    );
  }
}
