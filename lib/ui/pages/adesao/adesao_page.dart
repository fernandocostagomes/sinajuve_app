import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sinajuve_app/ui/pages/adesao/adesao.dart';
import 'package:sinajuve_app/ui/pages/adesao/adesao_bloc.dart';
import 'package:sinajuve_app/ui/pages/adesao/widget_adesao/body_adesao.dart';
import 'package:sinajuve_app/ui/pages/api_response.dart';
import 'package:sinajuve_app/ui/pages/login/login.dart';
import 'package:sinajuve_app/ui/pages/login/login_page.dart';
import 'package:sinajuve_app/ui/utils/nav.dart';

class AdesaoPage extends StatefulWidget {
  const AdesaoPage({Key key}) : super(key: key);
  
  @override
  _AdesaoPageState createState() => _AdesaoPageState();
}

class _AdesaoPageState extends State<AdesaoPage> {
  var isLoading = false;
  final _bloc = AdesaoBloc();
  var adesao;

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
        title: Text("Adesão"),
      ),
      body: isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : _getTipoUnidade(),
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

  void _carregarDados() async {
    ApiResponse apiResponse = await _bloc.getData();
    if(apiResponse.ok){
      adesao = await Adesao.get();
      setState(() {
        isLoading = false;
      });
    }    else{
      Login loginPrefs = await Login.get();
      await push(context, LoginPage(loginPrefs.login)).whenComplete(() => _carregarDados());
    }
  }
}