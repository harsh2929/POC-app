import 'package:flutter/material.dart';
import 'package:AIApp/settings.dart';
import 'package:AIApp/theme.dart';
import 'package:AIApp/widget/theme_selectors.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: M.normal, top: M.normal),
        child: Text(
          title,
          style: tt(context).labelMedium!.copyWith(color: C.grey3),
        ),
      );
}
