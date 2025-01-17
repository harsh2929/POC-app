import 'package:flutter/material.dart';
import 'package:AIApp/theme.dart';
import 'package:AIApp/widget/theme_selectors.dart';

class JourneyTitle extends StatelessWidget {
  final String title;

  const JourneyTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) => Text(
        title,
        style: tt(context).titleSmall!.copyWith(color: C.purple),
      );
}
