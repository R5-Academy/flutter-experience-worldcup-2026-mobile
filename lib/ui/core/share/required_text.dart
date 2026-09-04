import 'package:flutter/widgets.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';

class const RequiredText({
  super.key,
  required final String text,
  final TextStyle? style,
  final bool required = true,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (!required) return Text(text, style: style);

    return Text.rich(
      TextSpan(
        text: text,
        children: const [
          TextSpan(
            text: " *",
            style: TextStyle(color: AppColors.red),
          ),
        ],
        style: style,
      ),
    );
  }
}
