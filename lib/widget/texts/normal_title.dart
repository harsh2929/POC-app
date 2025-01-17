import 'package:flutter/material.dart';
import 'package:AIApp/theme.dart';
import 'package:AIApp/widget/theme_selectors.dart';

class NormalTitle extends StatelessWidget {
  final String title;
  final bool inverted;

  const NormalTitle(this.title, {super.key, this.inverted = false});

  @override
  Widget build(BuildContext context) => Text(
        title,
        style: tt(context)
            .titleLarge!
            .copyWith(color: inverted ? C.back : C.black),
        softWrap: false,
        overflow: TextOverflow.fade,
      );
}
