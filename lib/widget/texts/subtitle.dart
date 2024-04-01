import 'package:flutter/widgets.dart';
import 'package:AIApp/widget/theme_selectors.dart';

class Subtitle extends StatelessWidget {
  final String text;

  const Subtitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: tt(context).headlineMedium,
        textAlign: TextAlign.left,
      );
}
