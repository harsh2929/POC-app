import 'package:flutter/widgets.dart';
import 'package:AIApp/theme.dart';
import 'package:AIApp/widget/theme_selectors.dart';

class NormalBody extends StatelessWidget {
  final String title;
  final bool inverted;
  final Color? color;

  const NormalBody(
    this.title, {
    super.key,
    this.inverted = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) => Text(
        title,
        style: tt(context)
            .bodyMedium!
            .copyWith(color: color ?? (inverted ? C.back : C.front)),
        softWrap: true,
      );
}
