import 'package:flutter/material.dart';
import 'package:sinajuve_app/ui/pages/login/login.dart';
import 'package:sinajuve_app/ui/pages/login/login_page.dart';
import 'package:sinajuve_app/ui/pages/unidade/widget_unidade/body_unidade.dart';
import 'package:sinajuve_app/ui/pages/unidade/unidade_bloc.dart';
import 'package:sinajuve_app/ui/pages/unidade/unidade_detalhes.dart';
import 'package:sinajuve_app/ui/utils/nav.dart';

import '../api_response.dart';

class UnidadeDetalhesPage extends StatefulWidget {
  UnidadeDetalhesPage(String this.id, String this.nome);
  var id;
  var nome;

  @override
  _UnidadeDetalhesPageState createState() =>
      _UnidadeDetalhesPageState();
}

class _UnidadeDetalhesPageState
    extends State<UnidadeDetalhesPage> {
  var isLoading = false;
  final _bloc = UnidadeBloc();
  UnidadeDetalhes unidadeDetalhes;

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
        title: Text(widget.nome),
      ),
      body: isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : _getTipoUnidade(),
    );
  }

  _getTipoUnidade(){
    switch(unidadeDetalhes.tipoDeUnidade)
    {
      case "OG":
        return body_og(context, unidadeDetalhes);
        break;
      case "CJ":
        return body_cj(context, unidadeDetalhes);
        break;
      case "OSC":
        return body_osc(context, unidadeDetalhes);
        break;
    }
  }

  void _carregarDados() async {
    ApiResponse apiResponse = await _bloc.getDetalhes(widget.id);
    if(apiResponse.ok){
      unidadeDetalhes = await UnidadeDetalhes.get();
      setState(() {
        isLoading = false;
      });
    }    else{
      Login loginPrefs = await Login.get();
      await push(context, LoginPage(loginPrefs.login)).whenComplete(() => _carregarDados());
    }
  }
}
