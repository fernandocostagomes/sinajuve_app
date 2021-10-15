import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sinajuve_app/ui/pages/home/icon_pages/noticias_page.dart';
import 'package:sinajuve_app/ui/utils/nav.dart';

import 'icon_pages/forum_page.dart';
import 'icon_pages/indicators_report_page.dart';
import 'icon_pages/public_consultations_page.dart';
import 'icon_pages/public_pol_map_page.dart';
import 'icon_pages/public_pol_sub_page.dart';

Container body_home(context) {
  Size size = MediaQuery.of(context).size;
  return Container(
    padding: const EdgeInsets.fromLTRB(15.0, 50.0, 15.0, 20.0),
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/ilustra-1_pequena.png"),
        fit: BoxFit.cover,
      ),
    ),
    child: ListView(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _expandedIcon(
              context,
              "assets/images/icones_pin_min_300x300.png",
              PublicPolMapPage(),
            ),
            _expandedIcon(
              context,
              "assets/images/icones_pasta_min_300x300.png",
              PublicPolSubPage(),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _expandedText("Mapa de Políticas Públicas"),
            _expandedText("Subsistema de Políticas Públicas"),
          ],
        ),
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _expandedIcon(context, "assets/images/icones_indicadores.png",
                IndicatorsReportPage()),
            _expandedIcon(context, "assets/images/icones_lupa_min_300x300.png",
                PublicConsultationsPage()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _expandedText("Relatório de Indicadores"),
            _expandedText("Consultas públicas"),
          ],
        ),
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _expandedIcon(
                context, "assets/images/icones_2_forum.png", ForumPage()),
            _expandedIcon(context, "assets/images/icone-2_noticias.png",
                NoticiasPage()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _expandedText("Fórum"),
            _expandedText("Notícias"),
          ],
        ),
      ],
    ),
  );
}

Container body_home2(context) {
  Size size = MediaQuery.of(context).size;
  return Container(
    padding: const EdgeInsets.fromLTRB(15.0, 120.0, 15.0, 20.0),
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/ilustra-1_pequena.png"),
        fit: BoxFit.cover,
      ),
    ),
    child: Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _expandedIcon(
                context,
                "assets/images/icones_pin_min_300x300.png",
                PublicPolMapPage(),
              ),
              _expandedIcon(
                context,
                "assets/images/icones_pasta_min_300x300.png",
                PublicPolSubPage(),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _expandedText("Mapa de Políticas Públicas"),
              _expandedText("Subsistema de Políticas Públicas"),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _expandedIcon(context, "assets/images/icones_indicadores.png",
                  IndicatorsReportPage()),
              _expandedIcon(
                  context,
                  "assets/images/icones_lupa_min_300x300.png",
                  PublicConsultationsPage()),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _expandedText("Relatório de Indicadores"),
              _expandedText("Consultas públicas"),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _expandedIcon(
                  context,
                  "assets/images/icones_2_forum.png",
                  ForumPage()),
              _expandedIcon(
                  context,
                  "assets/images/icones_pasta_min_300x300.png",
                  NoticiasPage()),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _expandedText("Fórum"),
              _expandedText("Notícias"),
            ],
          ),
        ),
      ],
    ),
  );
}

_expandedText(String text, {double width, double height, int flex}) {
  return Expanded(
    flex: 1,
    child: Text(
      text,
      textAlign: TextAlign.center,
    ),
  );
}

_expandedIcon(BuildContext context, pathIcon, Widget page) {
  return Expanded(
    flex: 1,
    child: InkWell(
      onTap: () {
        push(context, page);
      },
      child: Image.asset(
        pathIcon,
        width: 100,
        height: 100,
        fit: BoxFit.contain,
      ),
    ),
  );
}
