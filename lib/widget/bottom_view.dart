import 'package:flutter/widgets.dart';
import 'package:AIApp/theme.dart';

class BottomView extends StatelessWidget {
  final Widget child;

  const BottomView({super.key, required this.child});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        margin: const EdgeInsets.only(top: 0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
          color: C.header,
          /*  boxShadow: [
            BoxShadow(
              color: C.borderGrey,
              offset: Offset(0, -2),
              blurRadius: 4,
            ),
          ],*/
        ),
        child: child,
      );
}
