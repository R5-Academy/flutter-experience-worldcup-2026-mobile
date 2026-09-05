import 'package:material_ui/material_ui.dart';
import 'package:validatorless/validatorless.dart';
import 'package:wc_2026_mobile/ui/core/share/labeled_field.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';

class const LoginForm({
  super.key,
  required final TextEditingController emailController,
  required final TextEditingController passwordController,
  final VoidCallback? onSubmit,
}) extends StatelessWidget {
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
            controller: emailController,
            label: 'E-MAIL',
            hint: 'voce@exemplo.com',
            keyboardType: .emailAddress,
            textInputAction: .next,
            required: true,
            validator: Validatorless.required('E-mail obrigatório'),
          ),
          const SizedBox(height: 17),
          LabeledField.password(
            controller: passwordController,
            label: 'SENHA',
            hint: '*********',
            textInputAction: .done,
            required: true,
            validator: Validatorless.required('Senha obrigatória'),
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
              onPressed: onSubmit,
              style: AppTheme.darkButton,
              child: Text('ENTRAR NO ÁLBUM  →'),
            ),
          ),
        ],
      ),
    );
  }
}
