import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:sinajuve_app/ui/pages/login/login_page.dart';
import 'package:sinajuve_app/ui/pages/unidade/unidade.dart';
import 'package:sinajuve_app/ui/pages/unidade/unidade_bloc.dart';
import 'package:sinajuve_app/ui/pages/unidade/unidade_lista_por_estado_tipo_page.dart';
import 'package:sinajuve_app/ui/utils/nav.dart';

import '../api_response.dart';

class UnidadeListaEstadosPage extends StatefulWidget {
  UnidadeListaEstadosPage({this.uj, this.tipo});
  final String uj;
  final String tipo;

  @override
  _UnidadeListaEstadosPageState createState() => _UnidadeListaEstadosPageState();
}



class _UnidadeListaEstadosPageState extends State<UnidadeListaEstadosPage> {
  var isLoading = false;
  final _bloc = UnidadeBloc();
  var list_unidades = List();
  var listUnidadeElement = List<UnidadeElement>();
  var list_estados = new List();

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
        return Text("Organismos Gestores");
        break;
      case "OSC":
        return Text("Organização Social Civil");
        break;
      case "CJ":
        return Text("Conselhos da Juventude");
        break;
    }
  }

  void _carregarDados() async {
    ApiResponse apiResponse = await _bloc.getData(widget.uj, widget.tipo);
    if (apiResponse.ok) {
      Unidade unidade = await Unidade.get();
      listUnidadeElement = unidade.unidades;
      _tratarLista(listUnidadeElement);
      setState(() {
        isLoading = false;
      });
    } else {
      await push(context, LoginPage()).whenComplete(() => _carregarDados());
    }
  }

  _tratarLista(List<UnidadeElement> unidade) {
    try {
      var todosEstadoslist = new List<String>();
      for(UnidadeElement estado in unidade)
        {
          todosEstadoslist.add(estado.estado);
        }
      list_estados = LinkedHashSet<String>.from(todosEstadoslist).toList();
    } catch (error, exception) {
      return;
    }
  }

  buildListView() {
    final itens = List<String>.generate(
        list_estados.length, (i) => list_estados[i]);
    return ListView.builder(
      itemCount: itens.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(itens[index]),
          trailing: Icon(Icons.add),
          onTap: () {
            push(context, UnidadeListaPorEstadoTipoPage(estado: itens[index], tipo: widget.tipo, uj: widget.uj));
          },
        );
      },
    );
  }
}
