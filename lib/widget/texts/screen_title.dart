import 'package:flutter/material.dart';
import 'package:AIApp/theme.dart';
import 'package:AIApp/widget/theme_selectors.dart';

class ScreenTitle extends StatelessWidget {
  final String title;
  final bool inverted;

  const ScreenTitle(this.title, {super.key, this.inverted = false});

  @override
  Widget build(BuildContext context) => Text(
        title,
        style: tt(context)
            .bodyMedium!
            .copyWith(color: inverted ? C.back : C.front),
        softWrap: false,
        overflow: TextOverflow.fade,
      );
}
