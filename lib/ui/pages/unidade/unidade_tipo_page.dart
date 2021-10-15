import 'package:flutter/material.dart';
import 'package:sinajuve_app/ui/pages/unidade/unidade_lista_estados_page.dart';
import 'package:sinajuve_app/ui/utils/nav.dart';

class UnidadeTipoPage extends StatefulWidget {
  UnidadeTipoPage(this.tipo);
  var tipo;
  @override
  _UnidadeTipoPageState createState() =>
      _UnidadeTipoPageState();
}

class _UnidadeTipoPageState
    extends State<UnidadeTipoPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Visualizar unidades de juventude"),
      ),
      body: Center(
        child: _body(context),
      ),
    );
  }

  Container _body(context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 15.0, 20.0),
      child: ListView(
        children: <Widget>[
          _listTile("Conselhos de Juventude", uj: "CJ"),
          _listTile("Organismos Gestores", uj: "OG"),
          _listTile("Organização Social Civil", uj: "OSC"),
        ],
      ),
    );
  }

  Card _listTile(title, {subtitle, uj}) {
    return Card(
        child: ListTile(
      title: Container(
        width: double.infinity,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      subtitle: Text(subtitle == null ? " " : subtitle),
      //tileColor: subtitle == null ? null : Colors.white,
      leading: Icon(Icons.list),
      onTap: () {
        push(context, UnidadeListaEstadosPage(uj: uj, tipo: widget.tipo,));
      },
    ));
  }
}
