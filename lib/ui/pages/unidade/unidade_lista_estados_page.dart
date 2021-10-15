import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:sinajuve_app/ui/pages/login/login.dart';
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
      Login loginPrefs = await Login.get();
      await push(context, LoginPage(loginPrefs.login)).whenComplete(() => _carregarDados());
    }
  }

  _tratarLista(List<UnidadeElement> unidade) {
    try {
      var todosEstadoslist = new List<String>();
      for(UnidadeElement estado in unidade)
        {
          todosEstadoslist.add(estado.estado);
        }
      todosEstadoslist.sort();
      list_estados = LinkedHashSet<String>.from(todosEstadoslist).toList();


    }catch (error, exception) {
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
          title: Text(_tratarNomeEstado(itens[index])),
          trailing: Icon(Icons.add),
          onTap: () {
            push(context, UnidadeListaPorEstadoTipoPage(estado: itens[index], tipo: widget.tipo, uj: widget.uj));
          },
        );
      },
    );
  }

  _tratarNomeEstado(uf)
  {
    switch (uf) {
      case "RO":
        return "Rondônia";
        break;

      case "AC":
        return "Acre";
        break;

      case "AM":
        return "Amazonas";
        break;

      case "RR":
        return "Roraima";
        break;

      case "PA":
        return "Pará";
        break;

      case "AP":
        return "Amapá";
        break;

      case "TO":
        return "Tocantins";
        break;

      case "MA":
        return "Maranhão";
        break;

      case "PI":
        return "Piauí";
        break;

      case "CE":
        return "Ceará";
        break;

      case "RN":
        return "Rio Grande do Norte";
        break;

      case "PB":
        return "Paraíba";
        break;

      case "PE":
        return "Pernambuco";
        break;

      case "AL":
        return "Alagoas";
        break;

      case "SE":
        return "Sergipe";
        break;

      case "BA":
        return "Bahia";
        break;

      case "MG":
        return "Minas Gerais";
        break;

      case "ES":
        return "Espírito Santo";
        break;

      case "RJ":
        return "Rio de Janeiro";
        break;

      case "SP":
        return "São Paulo";
        break;

      case "PR":
        return "Paraná";
        break;

      case "SC":
        return "Santa Catarina";
        break;

      case "RS":
        return "Rio Grande do Sul";
        break;

      case "MS":
        return "Mato Grosso do Sul";
        break;

      case "MT":
        return "Mato Grosso";
        break;

      case "GO":
        return "Goiás";
        break;

      case "DF":
        return "Distrito Federal";
        break;

      default:
        return uf;
        break;
    }
  }
}
