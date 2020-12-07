import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sinajuve_app/ui/pages/home/icon_pages/forum_page.dart';
import 'package:sinajuve_app/ui/pages/home/icon_pages/indicators_report_page.dart';
import 'package:sinajuve_app/ui/pages/home/icon_pages/public_consultations_page.dart';
import 'package:sinajuve_app/ui/pages/home/icon_pages/public_pol_map_page.dart';
import 'package:sinajuve_app/ui/pages/home/icon_pages/public_pol_sub_page.dart';
import 'package:sinajuve_app/ui/utils/nav.dart';
import 'package:sinajuve_app/ui/widgets/drawer/drawer_list.dart';

import 'icon_pages/forum_page.dart';
import 'icon_pages/indicators_report_page.dart';
import 'icon_pages/public_consultations_page.dart';
import 'icon_pages/public_pol_map_page.dart';
import 'icon_pages/public_pol_sub_page.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/sinajuve_log_flat_2.png",
              fit: BoxFit.contain,
              height: 80,
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: _body(context),
      ),
      drawer: DrawerList(),
    );
  }
}

_body(context) {
  Size size = MediaQuery.of(context).size;
  return Container(
    padding: const EdgeInsets.fromLTRB(15.0, 100.0, 15.0, 20.0),
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
              Expanded(
                flex: 1,
                // Mapa de politicas publicas.
                child: InkWell(
                  onTap: () {
                    push(context, PublicPolMapPage());
                  },
                  child: Image.asset(
                    "assets/images/icones_pin_min_300x300.png",
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    push(context, PublicPolSubPage());
                  },
                  child: Image.asset(
                    // Subsistema de pol. publicas.
                    "assets/images/icones_pasta_min_300x300.png",
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
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
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: () {
                    push(context, IndicatorsReportPage());
                  },
                  child: Image.asset(
                    //Relatorio de indicadores
                    "assets/images/icones_indicadores.png",
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: () {
                    push(context, PublicConsultationsPage());
                  },
                  child: Image.asset(
                    //Consultas publicas
                    "assets/images/icones_lupa_min_300x300.png",
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
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
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: () {
                    push(context, ForumPage());
                  },
                  child: Image.asset(
                    // Forum
                    "assets/images/icones_2_forum.png",
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Image.asset(
                  //Noticias
                  "assets/images/icones_pasta_min_300x300.png",
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
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

_img(String img, {width, height, BoxFit boxFit}) {
  return Image.asset(
    img,
    width: width,
    height: height,
    fit: boxFit,
  );
}

_expandedText(String text, {double width, double height, int flex}) {
  return Expanded(
    flex: 1,
    child: Text(
      // Subsistema de pol. publicas.
      text,
      textAlign: TextAlign.center,
    ),
  );
}
