import 'package:flutter/widgets.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';

class const CodeField({
  super.key,
  required final String code,
  required final int length,
  required final int letters,
}) extends StatelessWidget {
  final _groupGap = 10.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 66,
      child: Row(
        children: [
          for (var i = 0; i < length; i++) ...[
            if (i == letters) ...[
              SizedBox(width: _groupGap),
              SizedBox(width: 22, child: _Dash()),
              SizedBox(width: _groupGap),
            ] else if (i > 0)
              SizedBox(width: 8),

            Expanded(child: _Box(char: null, placeholder: 'A', active: true)),
          ],
        ],
      ),
    );
  }
}

class const _Box({
  required final String? char,
  required final String placeholder,
  required final bool active,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final empty = char == null;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: active && empty
            ? Color.alphaBlend(
                AppColors.green.withValues(alpha: .06),
                AppColors.white,
              )
            : AppColors.white,
        borderRadius: AppDimens.borderRadiusSm,
        border: .all(
          color: active ? AppColors.green : AppColors.border,
          width: active ? 2 : 1.5,
        ),
      ),
      child: Center(
        child: Text(
          char ?? placeholder,
          style: AppTextStyles.code.copyWith(
            color: empty ? AppColors.ink.withValues(alpha: .16) : AppColors.ink,
          ),
        ),
      ),
    );
  }
}

class const _Dash() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '-',
        style: AppTextStyles.code.copyWith(color: AppColors.grayText),
      ),
    );
  }
}
