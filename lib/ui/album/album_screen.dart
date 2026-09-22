import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/domain/models/team/team.dart';
import 'package:wc_2026_mobile/ui/album/widgets/filter_tabs.dart';
import 'package:wc_2026_mobile/ui/album/widgets/header.dart';
import 'package:wc_2026_mobile/ui/album/widgets/team_selection.dart';
import 'package:wc_2026_mobile/ui/album/widgets/team_strip.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';

class const AlbumScreen({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(onBack: () {}),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: CustomScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 8),
                  Padding(
                    padding: const .symmetric(horizontal: AppDimens.gridMargin),
                    child: TextField(
                      decoration: AppTheme.searchInput.copyWith(
                        fillColor: AppColors.white,
                        hintText: 'Buscar figurinha, país ou nº…',
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: const .symmetric(horizontal: AppDimens.gridMargin),
                    child: _SummaryFilter(),
                  ),
                  SizedBox(height: 16),
                  _TeamsFilter(),
                  SizedBox(height: 20),
                ],
              ),
            ),
            _Album(),
          ],
        ),
      ),
    );
  }
}

class const _SummaryFilter() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FilterTabs(
      total: 10,
      missing: 20,
      repeated: 30,
      selected: null,
      onSelected: (value) {
        debugPrint('Alterando a tab $value');
      },
    );
  }
}

class const _TeamsFilter() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      child: TeamStrip(
        teams: [
          Team(
            code: "ALG",
            name: "Algeria",
            flagUrl: "/flags/alg.png",
            primaryColor: 0xFF007A3D,
          ),
          Team(
            code: "ARG",
            name: "Argentina",
            flagUrl: "/flags/arg.png",
            primaryColor: 0xFF6CACE4,
          ),
          Team(
            code: "AUS",
            name: "Australia",
            flagUrl: "/flags/aus.png",
            primaryColor: 0xFFFFCD00,
          ),
          Team(
            code: "AUT",
            name: "Austria",
            flagUrl: "/flags/aut.png",
            primaryColor: 0xFFEF3340,
          ),
          Team(
            code: "BEL",
            name: "Belgium",
            flagUrl: "/flags/bel.png",
            primaryColor: 0xFFED2939,
          ),
          Team(
            code: "BRA",
            name: "Brazil",
            flagUrl: "/flags/bra.png",
            primaryColor: 0xFFFFDF00,
          ),
          Team(
            code: "CMR",
            name: "Cameroon",
            flagUrl: "/flags/cmr.png",
            primaryColor: 0xFF007A5E,
          ),
          Team(
            code: "CAN",
            name: "Canada",
            flagUrl: "/flags/can.png",
            primaryColor: 0xFFD52B1E,
          ),
          Team(
            code: "CHI",
            name: "Chile",
            flagUrl: "/flags/chi.png",
            primaryColor: 0xFFE4002B,
          ),
          Team(
            code: "COL",
            name: "Colombia",
            flagUrl: "/flags/col.png",
            primaryColor: 0xFFFCD116,
          ),
          Team(
            code: "CRC",
            name: "Costa Rica",
            flagUrl: "/flags/crc.png",
            primaryColor: 0xFFD90429,
          ),
          Team(
            code: "CRO",
            name: "Croatia",
            flagUrl: "/flags/cro.png",
            primaryColor: 0xFFFF0000,
          ),
          Team(
            code: "DEN",
            name: "Denmark",
            flagUrl: "/flags/den.png",
            primaryColor: 0xFFC8102E,
          ),
          Team(
            code: "ECU",
            name: "Ecuador",
            flagUrl: "/flags/ecu.png",
            primaryColor: 0xFFFFDD00,
          ),
          Team(
            code: "EGY",
            name: "Egypt",
            flagUrl: "/flags/egy.png",
            primaryColor: 0xFFCF0921,
          ),
          Team(
            code: "ENG",
            name: "England",
            flagUrl: "/flags/eng.png",
            primaryColor: 0xFFCE1124,
          ),
          Team(
            code: "FRA",
            name: "France",
            flagUrl: "/flags/fra.png",
            primaryColor: 0xFF002395,
          ),
          Team(
            code: "GER",
            name: "Germany",
            flagUrl: "/flags/ger.png",
            primaryColor: 0xFF000000,
          ),
          Team(
            code: "GHA",
            name: "Ghana",
            flagUrl: "/flags/gha.png",
            primaryColor: 0xFF006B3F,
          ),
          Team(
            code: "IRN",
            name: "Iran",
            flagUrl: "/flags/irn.png",
            primaryColor: 0xFF239F40,
          ),
          Team(
            code: "ITA",
            name: "Italy",
            flagUrl: "/flags/ita.png",
            primaryColor: 0xFF0066B2,
          ),
          Team(
            code: "CIV",
            name: "Ivory Coast",
            flagUrl: "/flags/civ.png",
            primaryColor: 0xFFFF8200,
          ),
          Team(
            code: "JAM",
            name: "Jamaica",
            flagUrl: "/flags/jam.png",
            primaryColor: 0xFFFFB81C,
          ),
          Team(
            code: "JPN",
            name: "Japan",
            flagUrl: "/flags/jpn.png",
            primaryColor: 0xFF0B2B67,
          ),
          Team(
            code: "MEX",
            name: "Mexico",
            flagUrl: "/flags/mex.png",
            primaryColor: 0xFF006847,
          ),
          Team(
            code: "MAR",
            name: "Morocco",
            flagUrl: "/flags/mar.png",
            primaryColor: 0xFFC1272D,
          ),
          Team(
            code: "NED",
            name: "Netherlands",
            flagUrl: "/flags/ned.png",
            primaryColor: 0xFFF36C21,
          ),
          Team(
            code: "NGA",
            name: "Nigeria",
            flagUrl: "/flags/nga.png",
            primaryColor: 0xFF008751,
          ),
          Team(
            code: "NOR",
            name: "Norway",
            flagUrl: "/flags/nor.png",
            primaryColor: 0xFFBA0C2F,
          ),
          Team(
            code: "PAN",
            name: "Panama",
            flagUrl: "/flags/pan.png",
            primaryColor: 0xFFDA121A,
          ),
          Team(
            code: "PAR",
            name: "Paraguay",
            flagUrl: "/flags/par.png",
            primaryColor: 0xFFCE1126,
          ),
          Team(
            code: "PER",
            name: "Peru",
            flagUrl: "/flags/per.png",
            primaryColor: 0xFFD91023,
          ),
          Team(
            code: "POL",
            name: "Poland",
            flagUrl: "/flags/pol.png",
            primaryColor: 0xFFDC143C,
          ),
          Team(
            code: "POR",
            name: "Portugal",
            flagUrl: "/flags/por.png",
            primaryColor: 0xFFDA291C,
          ),
          Team(
            code: "QAT",
            name: "Qatar",
            flagUrl: "/flags/qat.png",
            primaryColor: 0xFF8A1538,
          ),
          Team(
            code: "KSA",
            name: "Saudi Arabia",
            flagUrl: "/flags/ksa.png",
            primaryColor: 0xFF006C35,
          ),
          Team(
            code: "SCO",
            name: "Scotland",
            flagUrl: "/flags/sco.png",
            primaryColor: 0xFF0065BD,
          ),
          Team(
            code: "SEN",
            name: "Senegal",
            flagUrl: "/flags/sen.png",
            primaryColor: 0xFF00853F,
          ),
          Team(
            code: "SRB",
            name: "Serbia",
            flagUrl: "/flags/srb.png",
            primaryColor: 0xFFC6363C,
          ),
        ],
        selected: 'BRA',
        onSelected: (_) {},
      ),
    );
  }
}

class const _Album() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        TeamSelection(
          name: 'Brasil',
          flagPath: '/flags/bra.png',
          color: Color(0XFFFFDF00),
          progress: '2/21',
          stickers: [
            (
              code: 'BRA',
              number: 1,
              label: 'Brasil',
              collected: true,
              player: 'JOGADOR',
              count: 2,
            ),
            (
              code: 'BRA',
              number: 10,
              label: 'Brasil',
              collected: true,
              player: 'JOGADOR',
              count: 1,
            ),
            (
              code: 'BRA',
              number: 20,
              label: 'Brasil',
              collected: false,
              player: 'JOGADOR',
              count: 0,
            ),
            (
              code: 'BRA',
              number: 20,
              label: 'Brasil',
              collected: false,
              player: 'JOGADOR',
              count: 0,
            ),
            (
              code: 'BRA',
              number: 20,
              label: 'Brasil',
              collected: false,
              player: 'JOGADOR',
              count: 0,
            ),
            (
              code: 'BRA',
              number: 20,
              label: 'Brasil',
              collected: false,
              player: 'JOGADOR',
              count: 0,
            ),
          ],
          onStickerTap: (value) {},
        ),
        TeamSelection(
          name: 'BEL',
          flagPath: '/flags/bel.png',
          color: Color(0XFFED2939),
          progress: '5/21',
          stickers: [
            (
              code: 'BEL',
              number: 1,
              label: 'Brasil',
              collected: true,
              player: 'JOGADOR',
              count: 2,
            ),
            (
              code: 'BRA',
              number: 10,
              label: 'Brasil',
              collected: true,
              player: 'JOGADOR',
              count: 1,
            ),
            (
              code: 'BRA',
              number: 20,
              label: 'Brasil',
              collected: false,
              player: 'JOGADOR',
              count: 0,
            ),
            (
              code: 'BRA',
              number: 20,
              label: 'Brasil',
              collected: false,
              player: 'JOGADOR',
              count: 0,
            ),
            (
              code: 'BRA',
              number: 20,
              label: 'Brasil',
              collected: false,
              player: 'JOGADOR',
              count: 0,
            ),
            (
              code: 'BRA',
              number: 20,
              label: 'Brasil',
              collected: false,
              player: 'JOGADOR',
              count: 0,
            ),
          ],
          onStickerTap: (value) {},
        ),
      ],
    );
  }
}
