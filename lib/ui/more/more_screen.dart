import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/core/auth/auth_session_notifier.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';
import 'package:wc_2026_mobile/ui/more/widgets/header.dart';
import 'package:wc_2026_mobile/ui/more/widgets/menu_row.dart';
import 'package:wc_2026_mobile/ui/more/widgets/menu_section.dart';
import 'package:wc_2026_mobile/ui/more/widgets/profile_card.dart';

class const MoreScreen({super.key, required final AuthSessionNotifier _session})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: ListView(
        padding: .fromLTRB(AppDimens.gridMargin, 16, AppDimens.gridMargin, 24),
        children: [
          ProfileCard(
            initials: _session.initials,
            name: _session.user?.name ?? '',
            email: _session.user?.email ?? '',
          ),
          const SizedBox(height: 24),
          const MenuSection(
            title: 'CONTA',
            rows: [
              MenuRow(
                icon: Icons.person_rounded,
                bubbleColor: AppColors.red,
                iconColor: AppColors.white,
                title: 'MEU PERFIL',
                subTitle: 'nome, foto e dados da conta ',
              ),
              MenuRow(
                icon: Icons.notifications_none_rounded,
                bubbleColor: AppColors.ink,
                iconColor: AppColors.yellow,
                title: 'NOTIFICAÇÕES',
                subTitle: 'avisos de troca e novidades',
              ),
            ],
          ),
          const SizedBox(height: 24),
          const MenuSection(
            title: 'APLICATIVO',
            rows: [
              MenuRow(
                icon: Icons.help_outline_rounded,
                bubbleColor: AppColors.cream,
                iconColor: AppColors.border,
                bubbleRing: AppColors.ink,
                title: 'COMO FUNCIONA',
                subTitle: 'guia rápido do álbum',
              ),
              MenuRow(
                icon: Icons.mail_outline_rounded,
                bubbleColor: AppColors.cream,
                iconColor: AppColors.border,
                bubbleRing: AppColors.ink,
                title: 'FALE COM A GENTE',
                subTitle: 'dúvidas, erros e sugestões',
              ),
              MenuRow(
                icon: Icons.info_outline_rounded,
                bubbleColor: AppColors.cream,
                iconColor: AppColors.border,
                bubbleRing: AppColors.ink,
                title: 'SOBRE O APP',
                subTitle: 'termos, privacidade e versão',
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              style: AppTheme.dangerOutlineButton,
              onPressed: _session.logout,
              child: Text('SAIR DA CONTA'),
            ),
          ),
          const SizedBox(height: 18),
          Text(
            'COPA 2026 · VERSÃO 1.0.0',
            textAlign: .center,
            style: AppTextStyles.overline.copyWith(color: AppColors.grayText),
          ),
        ],
      ),
    );
  }
}
