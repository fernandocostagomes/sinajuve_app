import 'package:flutter/material.dart';
import 'package:sinajuve_app/ui/pages/adesao/adesao_page.dart';
import 'package:sinajuve_app/ui/pages/login/login_page.dart';
import 'package:sinajuve_app/ui/pages/unidade/unidade.dart';
import 'package:sinajuve_app/ui/pages/unidade/unidade_bloc.dart';
import 'package:sinajuve_app/ui/pages/unidade/unidade_detalhes_page.dart';
import 'package:sinajuve_app/ui/utils/nav.dart';

import '../api_response.dart';

class UnidadeListaPorEstadoTipoPage extends StatefulWidget {
  UnidadeListaPorEstadoTipoPage({this.estado, this.tipo, this.uj});

  final String estado;
  final String tipo;
  final String uj;

  @override
  _UnidadeListaPorEstadoTipoPageState createState() =>
      _UnidadeListaPorEstadoTipoPageState();
}

class _UnidadeListaPorEstadoTipoPageState
    extends State<UnidadeListaPorEstadoTipoPage> {
  var isLoading = false;
  var listUnidadeElementEstado = List<UnidadeElement>();

  @override
  void initState() {
    super.initState();
    isLoading = true;
    _carregarDados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: _getTitle(),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : buildListView(),
    );
  }

  _getTitle() {
    switch (widget.uj) {
      case "OG":
        return Text("Organismos Gestores - " + widget.estado);
        break;
      case "OSC":
        return Text("Organização Social Civil - " + widget.estado);
        break;
      case "CJ":
        return Text("Conselhos da Juventude - " + widget.estado);
        break;
    }
  }

  //filtrar dentro do get as unidades dentro do estado escolhido.

  void _carregarDados() async {
    Unidade unidade = await Unidade.get();
    for(UnidadeElement unidadeElement in unidade.unidades){
      if(unidadeElement.estado == widget.estado){
        listUnidadeElementEstado.add(unidadeElement);
      }
    }
    setState(() {
      isLoading = false;
    });
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
      subtitle: Text(subtitle == null ? " " : subtitle + widget.estado),
      //tileColor: subtitle == null ? null : Colors.white,
      leading: Icon(Icons.format_list_bulleted),
      onTap: () {},
    ));
  }

  buildListView() {
    final itens = List<UnidadeElement>.generate(
        listUnidadeElementEstado.length, (i) => listUnidadeElementEstado[i]);
    return ListView.builder(
      itemCount: itens.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
              'Nome: ${itens[index].nome}\nCidade: ${itens[index].cidade}-${itens[index].estado}\n'),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            push(context,
                UnidadeDetalhesPage(itens[index].id, itens[index].nome));
          },
        );
      },
    );
  }
}
