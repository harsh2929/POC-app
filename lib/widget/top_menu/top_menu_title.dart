import 'package:flutter/material.dart';
import 'package:AIApp/model/tree.dart';
import 'package:AIApp/settings.dart';
import 'package:AIApp/theme.dart';
import 'package:AIApp/widget/theme_selectors.dart';

class TopMenuTitle extends StatelessWidget {
  final Tree node;
  final bool selected;

  const TopMenuTitle({
    super.key,
    required this.node,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        height: 24,
        padding:
            const EdgeInsets.only(left: M.normal, right: M.normal, bottom: 2),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: selected ? C.front : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          node.category.toUpperCase(),
          style: tt(context).bodySmall!.copyWith(
                color: selected ? C.front : C.grey3,
                fontWeight: FontWeight.w700,
              ),
          softWrap: false,
          overflow: TextOverflow.fade,
        ),
      );
}
