import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/ui/core/share/labeled_field.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';

class LoginForm extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .fromLTRB(30, 32, 30, 26),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppDimens.borderRadiusXl,
        boxShadow: AppShadows.lg,
      ),
      child: Column(
        crossAxisAlignment: .start,
        mainAxisSize: .min,
        children: [
          Container(
            padding: .symmetric(horizontal: 18, vertical: 7),
            decoration: ShapeDecoration(
              color: AppColors.red,
              shape: StadiumBorder(),
            ),
            child: Text(
              'ENTRAR',
              style: AppTextStyles.overline.copyWith(color: AppColors.white),
            ),
          ),
          const SizedBox(height: 14),
          Text('BEM-VINDO', style: AppTextStyles.display),
          Text(
            'DE VOLTA',
            style: AppTextStyles.display.copyWith(color: AppColors.red),
          ),
          const SizedBox(height: 8),
          Text(
            'Continue montando seu álbum oficial.',
            style: AppTextStyles.body.copyWith(color: AppColors.grayText),
          ),
          const SizedBox(height: 25),
          LabeledField(
            label: 'E-MAIL',
            hint: 'voce@exemplo.com',
            keyboardType: .emailAddress,
            textInputAction: .next,
            required: true,
          ),
          const SizedBox(height: 17),
          LabeledField.password(
            label: 'SENHA',
            hint: '*********',
            textInputAction: .done,
            required: true,
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: .zero,
              textStyle: AppTextStyles.caption,
            ),
            child: Text('Esqueci minha senha →'),
          ),
          const SizedBox(height: 23),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {},
              style: AppTheme.darkButton,
              child: Text('ENTRAR NO ÁLBUM  →'),
            ),
          ),
        ],
      ),
    );
  }
}
