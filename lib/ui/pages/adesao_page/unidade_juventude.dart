import 'package:flutter/material.dart';
import 'package:sinajuve_app/ui/pages/adesao_page/adesao.dart';
import 'package:sinajuve_app/ui/pages/adesao_page/widget_unidade_juventude/body_adesao.dart';

class UnidadeJuventude extends StatefulWidget {
  @override
  _UnidadeJuventudeState createState() => _UnidadeJuventudeState();
}

class _UnidadeJuventudeState extends State<UnidadeJuventude> {
  var adesao;
  String title;

  @override
  void initState() {
    _getget();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Adesão"),
      ),
      body: Center(
        child: _getTipoUnidade(),
      ),
    );
  }

  _getTipoUnidade( ){
    switch(adesao.tipoDeUnidade)
    {
      case "OG":
        return body_og(context, adesao);
        break;
      case "CJ":
        return body_cj(context, adesao);
        break;
      case "OSC":
        return body_osc(context, adesao);
        break;
    }
  }

  void _getget() async {
    adesao = await Adesao.get();
    setState(() {
      title = adesao.nomeCompletoDoRepresentantesuplente;
    });
  }

  String _parseHistorie(String data) {
    var s = data.split("\n");
    return s[2];
  }

  Card _listTile(title, {subtitle}) {
    return Card(
        child: ListTile(
      title: Container(
        width: double.infinity,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      subtitle: Text(subtitle == null ? " " : subtitle),
      tileColor: subtitle == null ? Colors.blueGrey : Colors.white,
    ));
  }
}
