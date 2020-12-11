import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sinajuve_app/ui/pages/unidade/unidade_detalhes.dart';
import 'package:sinajuve_app/ui/utils/download_alert.dart';
import 'package:path_provider/path_provider.dart';

Container body_og(context, UnidadeDetalhes pUnidadeDetalhes) {
  var unidadeDetalhes = new UnidadeDetalhes();
  unidadeDetalhes = pUnidadeDetalhes;
  var context2 = context;
  return Container(
    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 15.0, 20.0),
    child: ListView(
      children: <Widget>[
        ExpansionTile(
          title: Container(
            width: double.infinity,
            child: _titleContainer(
                "Revise os dados de seu processo de adesão", 20),
          ),
          children: [
            _listTile("Situação do avaliador:", subtitle: unidadeDetalhes.situacao),
            _listTile("Último parecer:",
                subtitle: _parseHistorie(unidadeDetalhes.historico)),
            _listTile("Histórico dos pareceres:", subtitle: unidadeDetalhes.historico),
          ],
        ),
        ExpansionTile(
          title: _titleContainer("Revise os dados de seu Organismo Gestor", 20),
          children: [
            ExpansionTile(
                title: _titleContainer("DOCUMENTAÇÃO", 15),
                leading: Icon(Icons.list),
                children: [
                  _listTile("Documento de criação do Organismo Gestor:",
                      fontSize: 16,
                      subtitle:
                          unidadeDetalhes.documentoDeCriacaoDoOrganismoGestor,
                    url:  unidadeDetalhes.documentoDeCriacaoDoOrganismoGestor,
                      leading: true,
                  ),
                  _listTile("Portaria de nomeação do(a) gestor(a):",
                      fontSize: 16,
                      subtitle: unidadeDetalhes.portariaDeNomeacaoDoaGestora,
                      url: unidadeDetalhes.portariaDeNomeacaoDoaGestora,
                      leading: true,
                  ),
                  _listTile("Termo de Pactuação Federativo:",
                      fontSize: 16,
                      subtitle: unidadeDetalhes.termoDePactuacaoFederativo,
                    url: unidadeDetalhes.termoDePactuacaoFederativo,
                      leading: true,
                    ),
                  _listTile("Termo de adesão da unidades de juventude:",
                      fontSize: 16,
                      subtitle: unidadeDetalhes.termoDeAdesaoDaUnidadeDeJuventude,
                      url: unidadeDetalhes.termoDeAdesaoDaUnidadeDeJuventude,
                      leading: true,
                  ),
                  _listTile(
                      "Comprovante de instituição do Conselho de Juventude:",
                      fontSize: 16,
                      subtitle: unidadeDetalhes.comprovanteDeInstituicaoDoConselhoDeJuventude,
                      url: unidadeDetalhes.comprovanteDeInstituicaoDoConselhoDeJuventude,
                      leading: true,
                      context: context),
                  // _listTile(
                  //     "Cópia de documento de identificação com foto e assinatura:",
                  //     fontSize: 16,
                  //     subtitle: "",
                  //     leading: true,
                  //     url: ""),
                ]),
            ExpansionTile(
                title: _titleContainer(
                    "DADOS DO GOVERNO DO ESTADO, GOVERNO DISTRITAL OU GOVERNO MUNICIPAL",
                    15),
                leading: Icon(Icons.list),
                children: [
                  _listTile("Tipo de unidade:",
                      subtitle: unidadeDetalhes.tipoDeUnidade),
                  _listTile("Nome completo do Governandor(a) ou Prefeito(a):",
                      subtitle: unidadeDetalhes.nomeCompletoDoGovernadoraOuPrefeitoa),
                  _listTile("E-mail do gabinete:",
                      subtitle: unidadeDetalhes.eMailDoGovernadoraOuPrefeitoa),
                  _listTile("Telefone do Governandor(a) ou Prefeito(a):",
                      subtitle:
                          unidadeDetalhes.telefoneDoGabineteDoGovernadoraOuPrefeitoa),
                ]),
            ExpansionTile(
                title: _titleContainer(
                    "ENDEREÇO COMPLETO DO GOVERNO DO ESTADO, GOVERNO DISTRITAL OU GOVERNO MUNICIPAL",
                    15),
                leading: Icon(Icons.list),
                children: [
                  _listTile("Estado:",
                      subtitle: unidadeDetalhes
                          .estadoDoGovernoDoEstadoGovernoDistritalOuGovernoMunicipal),
                  _listTile("Cidade:",
                      subtitle: unidadeDetalhes
                          .cidadeDoGovernoDoEstadoGovernoDistritalOuGovernoMunicipal),
                  _listTile("Endereço:",
                      subtitle: unidadeDetalhes
                          .enderecoDoGovernoDoEstadoGovernoDistritalOuGovernoMunicipal),
                  _listTile("Complemento do endereço:",
                      subtitle: unidadeDetalhes
                          .complementoDoGovernoDoEstadoGovernoDistritalOuGovernoMunicipal),
                  _listTile("CEP do endereço:",
                      subtitle: unidadeDetalhes
                          .cepDoGovernoDoEstadoGovernoDistritalOuGovernoMunicipal),
                ]),
            ExpansionTile(
                title: _titleContainer(
                    "DADOS DO REPRESENTANTE/SUPLENTE INDICADO PELO GOVERNO DO ESTADO, GOVERNO DISTRITAL OU GOVERNO MUNICIPAL",
                    15),
                leading: Icon(Icons.list),
                children: [
                  _listTile("Nome completo do Representante/Suplente:",
                      subtitle: unidadeDetalhes.nomeCompletoDoRepresentantesuplente),
                  _listTile("E-mail do Representante/Suplente:",
                      subtitle: unidadeDetalhes.eMailDoRepresentantesuplente),
                  _listTile("CPF do Representante/Suplente:",
                      subtitle: unidadeDetalhes.cpfDoRepresentantesuplente),
                  _listTile("Sexo do Representante/Suplente:",
                      subtitle: unidadeDetalhes.sexoDoRepresentantesuplente),
                  _listTile("Concursado, Comissionado, Outros:",
                      subtitle: unidadeDetalhes.concursadoComissionadoOutro),
                  _listTile("Telefone do Representante/Suplente:",
                      subtitle: unidadeDetalhes.telefoneDoRepresentantesuplente),
                  _listTile("Celular do Representante/Suplente:",
                      subtitle: unidadeDetalhes.celularDoRepresentantesuplente),
                  _listTile("Cargo ou função do Representante/Suplente:",
                      subtitle: unidadeDetalhes.cargoOuFuncaoDoRepresentantesuplente),
                  _listTile("Há quanto tempo (em meses) atua como gestor(a):",
                      subtitle: unidadeDetalhes.tempoDeAtuacaoComoGestoraEmMeses),
                  _listTile(
                      "Escolaridade ou Formação do Representante/Suplente:",
                      subtitle: unidadeDetalhes
                          .escolaridadeOuFormacaoDoRepresentantesuplente),
                ]),
            ExpansionTile(
                title: _titleContainer("DADOS DO ORGANISMO GESTOR", 15),
                leading: Icon(Icons.list),
                children: [
                  _listTile("Nome do organismo gestor:",
                      subtitle: unidadeDetalhes.nomeDoOrganismoGestor),
                  _listTile("Sigla do organismo gestor:",
                      subtitle: unidadeDetalhes.siglaDoOrganismoGestor),
                  _listTile("Ano de criação do organismo gestor:",
                      subtitle: unidadeDetalhes.anoDeCriacaoDoOrganismoGestor),
                  _listTile(
                      "Secretaria a que está vinculado o organismo gestor:",
                      subtitle:
                          unidadeDetalhes.secretariaAQueEstaVinculadoOOrgaoGestor),
                  _listTile("Natureza jurídica do organismo gestor:",
                      subtitle: unidadeDetalhes.naturezaJuridicaDoOrganismoGestor),
                  _listTile("Esfera do Governo do organismo gestor:",
                      subtitle: unidadeDetalhes.esferaDeGovernoDoOrganismoGestor),
                ]),
            ExpansionTile(
                title: _titleContainer("DADOS INSTITUCIONAIS PARA CONTATO", 15),
                leading: Icon(Icons.list),
                children: [
                  _listTile("Estado do organismo gestor:",
                      subtitle: unidadeDetalhes.estadoDoOrganismoGestor),
                  _listTile("Cidade do organismo gestor:",
                      subtitle: unidadeDetalhes.cidadeDoOrganismoGestor),
                  _listTile("Endereço do organismo gestor:",
                      subtitle: unidadeDetalhes.enderecoDoOrganismoGestor),
                  _listTile("Complemento do organismo gestor:",
                      subtitle: unidadeDetalhes.complementoDoOrganismoGestor),
                  _listTile("CEP do organismo gestor:",
                      subtitle: unidadeDetalhes.cepDoOrganismoGestor),
                  _listTile("Telefone do organismo gestor:",
                      subtitle: unidadeDetalhes.telefoneDoOrganismoGestor),
                  _listTile("Celular do organismo gestor:",
                      subtitle: unidadeDetalhes.celularDoOrganismoGestor),
                  _listTile("E-mail do organismo gestor:",
                      subtitle: unidadeDetalhes.eMailDoOrganismoGestor),
                  _listTile("Website do organismo gestor:",
                      subtitle: unidadeDetalhes.websiteDoOrganismoGestor),
                  _listTile("Redes sociais do organismo gestor:",
                      subtitle: unidadeDetalhes.redesSociaisDaUnidade),
                ]),
            ExpansionTile(
                title: _titleContainer(
                    "POLÍTICAS, PROGRAMAS, PROJETOS E/OU AÇÕES", 15),
                leading: Icon(Icons.list),
                children: [
                  //Inserir terceira linha para o item abaixo, anexo.
                  _listTile(
                      "Políticas, programas, projetos e/ou ações de juventude:",
                      subtitle: unidadeDetalhes
                          .descricaoConveniosParaODesenvolvimentoDePoliticasProgramasProjetosEouAcoesDeJuventude),
                  //Inserir terceira linha para o item abaixo, anexo.
                  _listTile(
                      "Convênios para o desenvolvimento de políticas, programas, projetos e/ou ações de juventude:",
                      subtitle: unidadeDetalhes
                          .descricaoConveniosParaODesenvolvimentoDePoliticasProgramasProjetosEouAcoesDeJuventude),
                  _listTile("Descrição da equipe:",
                      subtitle: unidadeDetalhes.descricaoDaEquipe),
                ]),
            ExpansionTile(
                title: _titleContainer("SOBRE A ESTRUTURA FÍSICA", 15),
                leading: Icon(Icons.list),
                children: [
                  _listTile("Qual espaço físico a unidade possui?",
                      subtitle: unidadeDetalhes.espacoFisicoDaUnidade),
                  _listTile("Qual itens a unidade possui?",
                      subtitle: unidadeDetalhes.estruturasFisicasQuePossui),
                  _listTile("Estações de trabalho - Quantidade:",
                      subtitle: unidadeDetalhes.numeroDeEstacoesDeTrabalho),
                  _listTile("Computadores - Quantidade:",
                      subtitle: unidadeDetalhes.numeroDeComputadores),
                ]),
            ExpansionTile(
                title: _titleContainer(
                    "FONTES DE RECURSOS FINANCEIROS ORÇAMENTÁRIOS", 15),
                leading: Icon(Icons.list),
                children: [
                  _listTile("Recursos da unidade provêm de:",
                      subtitle: unidadeDetalhes.osRecursosDaUnidadeProvemDe),
                  _listTile(
                      "Qual o valor disponível para o plano atual em Reais?",
                      subtitle:
                          unidadeDetalhes.orcamentoDisponivelParaOAnoAtualEmReais),
                ]),
            ExpansionTile(
                title: _titleContainer("REDE DE APOIO", 15),
                leading: Icon(Icons.list),
                children: [
                  _listTile(
                      "Quais são as instituições governamentais ou não governamentais de maior destaque que tem em seu Estado, Distrito Federal ou Município que prestam atendimento para a juventude?",
                      subtitle: unidadeDetalhes.descricaoDasInstituicoes),
                ]),
            ExpansionTile(
                title: _titleContainer(
                    "CITE AS INSTITUIÇÕES GOVERNAMENTAIS RELACIONADAS AOS 11 EIXOS QUE A SUA UNIDADE DESENVOLVE PARCERIA",
                    15),
                leading: Icon(Icons.list),
                children: [
                  _listTile(
                      "Cidadania, Participação Social e Política e Representação:",
                      subtitle: unidadeDetalhes
                          .cidadaniaParticipacaoSocialEPoliticaERepresentacaoJuvenil),
                  _listTile("Educação:", subtitle: unidadeDetalhes.educacao),
                  _listTile("Profissionalização, Trabalho e Renda:",
                      subtitle: unidadeDetalhes.profissionalizacaoTrabalhoERenda),
                  _listTile("Diversidade e Igualdade:",
                      subtitle: unidadeDetalhes.diversidadeEIgualdade),
                  _listTile("Saúde:", subtitle: unidadeDetalhes.saude),
                  _listTile("Cultura:", subtitle: unidadeDetalhes.cultura),
                  _listTile("Comunicação e Liberdade de Expressão:",
                      subtitle: unidadeDetalhes.comunicacaoELiberdadeDeExpressao),
                  _listTile("Desporto e Lazer:",
                      subtitle: unidadeDetalhes.desportoELazer),
                  _listTile("Território e Mobilidade:",
                      subtitle: unidadeDetalhes.territorioEMobilidade),
                  _listTile("Sustentabilidade e Meio Ambiente:",
                      subtitle: unidadeDetalhes.sustentabilidadeEMeioAmbiente),
                  _listTile("Segurança Pública e Acesso à Justiça:",
                      subtitle: unidadeDetalhes.segurancaPublicaEAcessoAJustica),
                ]),
          ],
        ),
      ],
    ),
  );
}

Container body_cj(context, UnidadeDetalhes pUnidadeDetalhes) {
  var unidadeDetalhes = new UnidadeDetalhes();
  unidadeDetalhes = pUnidadeDetalhes;
  return Container(
    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 15.0, 20.0),
    child: ListView(
      children: <Widget>[
        ExpansionTile(
          title:
              _titleContainer("Revise os dados de seu processo de adesão", 20),
          children: [
            _listTile("Situação do avaliador:", subtitle: unidadeDetalhes.situacao),
            _listTile("Último parecer:",
                subtitle: _parseHistorie(unidadeDetalhes.historico)),
            _listTile("Histórico dos pareceres:", subtitle: unidadeDetalhes.historico),
          ],
        ),
        ExpansionTile(
          title: _titleContainer(
              "Revise os dados de seu Conselho de Juventude", 20),
          children: [
            ExpansionTile(
                title: _titleContainer("DOCUMENTAÇÃO", 15),
                leading: Icon(Icons.list),
                children: [
                  _listTile("Envie o documento de criação do conselho:",
                      context: context,
                      subtitle: unidadeDetalhes.documentoDeCriacaoDoConselho,
                      leading: true,
                      url: unidadeDetalhes.documentoDeCriacaoDoConselho,
                  ),
                  _listTile("Envie o ato constitutivo:",
                      subtitle: unidadeDetalhes.atoConstitutivo,
                      leading: true,
                      url: unidadeDetalhes.atoConstitutivo,
                  ),
                  _listTile("Envie a ata de eleição dos conselheiros:",
                      subtitle: unidadeDetalhes.ataDeEleicaoDosConselheiros,
                      leading: true,
                      url: unidadeDetalhes.ataDeEleicaoDosConselheiros,
                  ),
                ]),
            ExpansionTile(
                title: Container(
                  width: double.infinity,
                  child: Text(
                    "DADOS DO(A) PRESIDENTE OU SECRETÁRIO(A) DO CONSELHO(A)",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                leading: Icon(Icons.list),
                children: [
                  _listTile("Nome completo do Presidente ou Secretário(a):",
                      subtitle: unidadeDetalhes.nomeCompletoDoPresidenteOuSecretarioa),
                  _listTile("Email do Presidente ou Secretário(a):",
                      subtitle: unidadeDetalhes.eMailDoPresidenteOuSecretarioa),
                  _listTile("CPF do Presidente ou Secretário(a) *:",
                      subtitle: unidadeDetalhes.cpfDoPresidenteOuSecretarioa),
                  _listTile("Telefone do Presidente ou Secretário(a) *:",
                      subtitle: unidadeDetalhes.telefoneDoPresidenteOuSecretarioa),
                  _listTile("Celular do Presidente ou Secretário(a):",
                      subtitle: unidadeDetalhes.celularDoPresidenteOuSecretarioa),
                  _listTile("Cargo ou função do Presidente ou Secretário(a) *:",
                      subtitle: unidadeDetalhes.cargoOuFuncaoDoPresidenteOuSecretarioa),
                  _listTile(
                      "Escolaridade ou Formação do Presidente ou Secretário(a) *:",
                      subtitle: unidadeDetalhes
                          .escolaridadeOuFormacaoDoPresidenteOuSecretarioa),
                ]),
            ExpansionTile(
                title: _titleContainer("DADOS DO CONSELHO", 15),
                leading: Icon(Icons.list),
                children: [
                  _listTile("Nome do conselho*:",
                      subtitle: unidadeDetalhes.nomeDoConselhoDeJuventude),
                  _listTile("Ano de criação do conselho*:",
                      subtitle: unidadeDetalhes.anoDeCriacaoDoConselho),
                  _listTile("Esfera de Governo do conselho*:",
                      subtitle: unidadeDetalhes.esferaDeGovernoDoConselho),
                  _listTile(
                      "De quem foi a iniciativa para criação do conselho?",
                      subtitle:
                          unidadeDetalhes.deQuemFoiAIniciativaParaCriacaoDoConselho),
                  _listTile(
                      "Sua institucionalização se deu através de que norma?*",
                      subtitle:
                          unidadeDetalhes.aInstitucionalizacaoSeDeuAtravesDaNorma),
                  _listTile("Qual?*",
                      subtitle:
                          unidadeDetalhes.aInstitucionalizacaoSeDeuAtravesDaNormaOutra),
                  _listTile("Qual é o número total de conselheiros?*",
                      subtitle: unidadeDetalhes.numeroTotalDeConselheiros),
                  _listTile("Qual é a duração do mandato dos conselheiros?*",
                      subtitle: unidadeDetalhes.duracaoDoMandatoDosConselheiros),
                  _listTile(
                      "De que maneira é realizada a eleição/escolha dos conselheiros?*",
                      subtitle: unidadeDetalhes
                          .maneiraQueERealizadaAEleicaoescolhaDosConselheiros),
                  _listTile("Qual é o caráter do conselho?*",
                      subtitle: unidadeDetalhes.caraterDosConselheiros),
                  _listTile("Qual é a proporcionalidade do conselho?",
                      subtitle: ""),
                  _listTile("Percentual do Poder Público:",
                      subtitle: unidadeDetalhes.percentualDoPoderPublico),
                  _listTile("Percentual da Sociedade Civil:",
                      subtitle: unidadeDetalhes.percentualDaSociedadeCivil),
                  _listTile(
                      "Quais são as principais áreas de atuação das entidades que participam da organização?",
                      subtitle: unidadeDetalhes
                          .principaisAreasDeAtuacaoDasEntidadesQueParticipamDoConselho),
                ]),
            ExpansionTile(
                title: _titleContainer("DADOS INSTITUCIONAIS PARA CONTATO", 15),
                leading: Icon(Icons.list),
                children: [
                  _listTile("Estado do conselho de juventude:",
                      subtitle: unidadeDetalhes.estadoDoConselhoDeJuventude),
                  _listTile("Cidade do conselho de juventude:",
                      subtitle: unidadeDetalhes.cidadeDoConselhoDeJuventude),
                  _listTile("Endereço do conselho de juventude:",
                      subtitle: unidadeDetalhes.enderecoDoConselhoDeJuventude),
                  _listTile("Complemento do conselho de juventude:",
                      subtitle: unidadeDetalhes.complementoDoConselhoDeJuventude),
                  _listTile("CEP do conselho de juventude:",
                      subtitle: unidadeDetalhes.cepDoConselhoDeJuventude),
                  _listTile("Telefone do conselho de juventude:",
                      subtitle: unidadeDetalhes.telefoneDoConselhoDeJuventude),
                  _listTile("Celular do conselho de juventude:",
                      subtitle: unidadeDetalhes.celularDoConselhoDeJuventude),
                  _listTile("Email do conselho de juventude:",
                      subtitle: unidadeDetalhes.eMailDoConselhoDeJuventude),
                  _listTile("Website do conselho de juventude:",
                      subtitle: unidadeDetalhes.websiteDoConselhoDeJuventude),
                  _listTile("Redes sociais do conselho de juventude:",
                      subtitle: unidadeDetalhes.redesSociaisDoConselhoDeJuventude),
                ]),
            ExpansionTile(
                title: _titleContainer("POLÍTICAS, PROGRAMAS, PROJETOS E/OU AÇÕES", 15),
                leading: Icon(Icons.list),
                children: [
                  _listTile(
                      "Políticas, programas, projetos e/ou ações de juventude:",
                      subtitle: unidadeDetalhes
                          .descricaoConveniosParaODesenvolvimentoDePoliticasProgramasProjetosEouAcoesDeJuventude),
                  _listTile(
                      "Políticas, programas, projetos e/ou ações em destaque:",
                      subtitle: unidadeDetalhes
                          .descricaoDasPoliticasProgramasProjetosEouAcoesEmDestaque),
                  _listTile(
                      "O conselho possui convênios para o desenvolvimento de políticas, programas, projetos e/ou ações de juventude?",
                      subtitle: unidadeDetalhes
                          .descricaoConveniosParaODesenvolvimentoDePoliticasProgramasProjetosEouAcoesDeJuventude),
                  _listTile("Descrição da equipe:",
                      subtitle: unidadeDetalhes.descricaoDaEquipe),
                ]),
            ExpansionTile(
                title: _titleContainer("SOBRE A ESTRUTURA FÍSICA", 15),
                leading: Icon(Icons.list),
                children: [
                  _listTile("Qual espaço físico a unidade possui?",
                      subtitle: unidadeDetalhes.espacoFisicoDoConselhoDeJuventude),
                  _listTile("Qual itens a unidade possui?",
                      subtitle: unidadeDetalhes.estruturasFisicasQuePossui),
                  _listTile("Estações de trabalho - Quantidade:",
                      subtitle: unidadeDetalhes.numeroDeEstacoesDeTrabalho),
                  _listTile("Computadores - Quantidade:",
                      subtitle: unidadeDetalhes.numeroDeComputadores),
                ]),
            ExpansionTile(
                title: _titleContainer("FONTES DE RECURSOS FINANCEIROS ORÇAMENTÁRIOS", 15),
                leading: Icon(Icons.list),
                children: [
                  _listTile("Os recursos da unidade provêm de:",
                      subtitle: unidadeDetalhes.osRecursosDaUnidadeProvemDe),
                  _listTile("Qual o valor disponível para o plano atual?",
                      subtitle:
                          unidadeDetalhes.orcamentoDisponivelParaOAnoAtualEmReais),
                ]),
            ExpansionTile(
                title: _titleContainer("REDE DE APOIO", 15),
                leading: Icon(Icons.list),
                children: [
                  _listTile(
                      "Quais são as instituições governamentais ou não governamentais de maior destaque que tem em seu Estado, Distrito Federal ou Município que prestam atendimento para a juventude?",
                      subtitle: unidadeDetalhes.descricaoDasInstituicoes),
                ]),
            ExpansionTile(
                title: _titleContainer(
                    "CITE AS INSTITUIÇÕES GOVERNAMENTAIS RELACIONADAS AOS 11 EIXOS QUE A SUA UNIDADE DESENVOLVE PARCERIA", 15),
                leading: Icon(Icons.list),
                children: [
                  _listTile(
                      "Cidadania, Participação Social e Política e Representação:",
                      subtitle: unidadeDetalhes
                          .cidadaniaParticipacaoSocialEPoliticaERepresentacaoJuvenil),
                  _listTile("Educação:", subtitle: unidadeDetalhes.educacao),
                  _listTile("Profissionalização, Trabalho e Renda:",
                      subtitle: unidadeDetalhes.profissionalizacaoTrabalhoERenda),
                  _listTile("Diversidade e Igualdade:",
                      subtitle: unidadeDetalhes.diversidadeEIgualdade),
                  _listTile("Saúde:", subtitle: unidadeDetalhes.saude),
                  _listTile("Cultura:", subtitle: unidadeDetalhes.cultura),
                  _listTile("Comunicação e Liberdade de Expressão:",
                      subtitle: unidadeDetalhes.comunicacaoELiberdadeDeExpressao),
                  _listTile("Desporto e Lazer:",
                      subtitle: unidadeDetalhes.desportoELazer),
                  _listTile("Território e Mobilidade:",
                      subtitle: unidadeDetalhes.territorioEMobilidade),
                  _listTile("Sustentabilidade e Meio Ambiente:",
                      subtitle: unidadeDetalhes.sustentabilidadeEMeioAmbiente),
                  _listTile("Segurança Pública e Acesso à Justiça:",
                      subtitle: unidadeDetalhes.segurancaPublicaEAcessoAJustica),
                ]),
          ],
        ),
      ],
    ),
  );
}

Container body_osc(context, UnidadeDetalhes pUnidadeDetalhes) {
  var unidadeDetalhes = new UnidadeDetalhes();
  var buildContext = context;
  unidadeDetalhes = pUnidadeDetalhes;
  return Container(
    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 15.0, 20.0),
    child: ListView(
      children: <Widget>[
        ExpansionTile(
          title:
              _titleContainer("Revise os dados de seu processo de adesão", 20),
          children: [
            _listTile("Situação do avaliador:", subtitle: unidadeDetalhes.situacao),
            _listTile("Último parecer:",
                subtitle: _parseHistorie(unidadeDetalhes.historico)),
            _listTile("Histórico dos pareceres:", subtitle: unidadeDetalhes.historico),
          ],
        ),
        ExpansionTile(
          title: _titleContainer(
              "Revise os dados de sua Organização da Sociedade Civil", 20),
          children: [
            ExpansionTile(
                title: _titleContainer("DOCUMENTAÇÃO", 15),
                leading: Icon(Icons.list),
                children: [
                  _listTile(
                      "Ata de fundação da Organização da Sociedade Civil (OSC):",
                      subtitle:
                      unidadeDetalhes.ataDeFundacaoDaOrganizacaoDaSociedadeCivilOsc,
                      url:
                      unidadeDetalhes.ataDeFundacaoDaOrganizacaoDaSociedadeCivilOsc,
                      leading: true),
                  _listTile(
                    "Estatuto aprovado da Organização da Sociedade Civil (OSC):",
                    subtitle: unidadeDetalhes
                        .estatutoAprovadoDaOrganizacaoDaSociedadeCivilOsc,
                    url: unidadeDetalhes
                        .estatutoAprovadoDaOrganizacaoDaSociedadeCivilOsc,
                    leading: true,
                  ),
                  _listTile(
                      "Registro em cartório da Organização da Sociedade Civil (OSC):",
                      subtitle: unidadeDetalhes
                          .registroEmCartorioDaOrganizacaoDaSociedadeCivilOsc,
                      leading: true,
                      url: unidadeDetalhes
                          .registroEmCartorioDaOrganizacaoDaSociedadeCivilOsc),
                  _listTile(
                    "Comprovante de inscrição e de situação cadastral no CNPJ:",
                    subtitle: unidadeDetalhes
                        .comprovanteDeInscricaoEDeSituacaoCadastralNoCnpj,
                    leading: true,
                    url: unidadeDetalhes
                        .comprovanteDeInscricaoEDeSituacaoCadastralNoCnpj,
                  ),
                  _listTile(
                    "Ata de eleição ou posse (mais recente):",
                    subtitle: unidadeDetalhes.ataDeEleicaoOuPosseMaisRecente,
                    leading: true,
                    url: unidadeDetalhes.ataDeEleicaoOuPosseMaisRecente,
                  ),
                ]),
            ExpansionTile(
                title: _titleContainer(
                    "DADOS DO(A) PRESIDENTE, VICE-PRESIDENTE OU SECRETÁRIO(A)",
                    15),
                leading: Icon(Icons.list),
                children: [
                  _listTile("Nome completo do Presidente ou Secretário:",
                      subtitle: unidadeDetalhes.nomeCompletoDoPresidenteOuSecretario),
                  _listTile("Email do Presidente ou Secretário(a):",
                      subtitle: unidadeDetalhes.eMailDoPresidenteOuSecretario),
                  _listTile("CPF do Presidente ou Secretário(a):",
                      subtitle: unidadeDetalhes.cpfDoPresidenteOuSecretario),
                  _listTile("Telefone do Presidente ou Secretário(a):",
                      subtitle: unidadeDetalhes.telefoneDoPresidenteOuSecretario),
                  _listTile("Celular do Presidente ou Secretário(a):",
                      subtitle: unidadeDetalhes.celularDoPresidenteOuSecretario),
                  _listTile("Indique o sexo do Presidente ou Secretário(a):",
                      subtitle: unidadeDetalhes.sexoDoPresidenteOuSecretario),
                  _listTile(
                      "Escolaridade ou Formação do Presidente ou Secretário(a):",
                      subtitle: unidadeDetalhes
                          .escolaridadeOuFormacaoDoPresidenteOuSecretario),
                ]),
            ExpansionTile(
                title: _titleContainer(
                    "DADOS GERAIS DA ORGANIZAÇÃO DA SOCIEDADE CIVIL", 15),
                leading: Icon(Icons.list),
                children: [
                  _listTile("Razão Social:",
                      subtitle: unidadeDetalhes.razaoSocialDaOsc),
                  _listTile("Qual é o nome fantasia?",
                      subtitle: unidadeDetalhes.nomeDaOrganizacao),
                  _listTile("Qual é o CNPJ?", subtitle: unidadeDetalhes.cnpjDaOsc),
                  _listTile("Ano de fundação:",
                      subtitle: unidadeDetalhes.anoDeFundacaoDaOsc),
                  _listTile("Natureza Jurídica:",
                      subtitle: unidadeDetalhes.naturezaJuridicaDaOsc),
                  _listTile(
                      "Quais são as principais áreas de atuação das entidades que participam da organização?",
                      subtitle: unidadeDetalhes
                          .principaisAreasDeAtuacaoDasEntidadesQueParticipamDaOrganizacao),
                  _listTile("Titulações e Certificações:",
                      subtitle: unidadeDetalhes.titulacoesECertificacoes),
                ]),
            ExpansionTile(
                title: _titleContainer("DADOS INSTITUCIONAIS PARA CONTATO", 15),
                leading: Icon(Icons.list),
                children: [
                  _listTile("Estado da organização:",
                      subtitle: unidadeDetalhes.estadoDaOrganizacao),
                  _listTile("Cidade da organização:",
                      subtitle: unidadeDetalhes.cidadeDaOrganizacao),
                  _listTile("Endereço da organização:",
                      subtitle: unidadeDetalhes.enderecoDaOrganizacao),
                  _listTile("Complemento da organização:",
                      subtitle: unidadeDetalhes.complementoDaOrganizacao),
                  _listTile("CEP da organização:",
                      subtitle: unidadeDetalhes.cepDaOrganizacao),
                  _listTile("Telefone da organização:",
                      subtitle: unidadeDetalhes.telefoneDaOrganizacao),
                  _listTile("Celular da organização:",
                      subtitle: unidadeDetalhes.celularDaOrganizacao),
                  _listTile("E-mail da organização:",
                      subtitle: unidadeDetalhes.eMailDaOrganizacao),
                  _listTile("Website da organização:",
                      subtitle: unidadeDetalhes.websiteDaOrganizacao),
                  _listTile("Redes sociais da organização:",
                      subtitle: unidadeDetalhes.redesSociaisDaOrganizacao),
                ]),
            ExpansionTile(
                title: _titleContainer(
                    "POLÍTICAS, PROGRAMAS, PROJETOS E/OU AÇÕES", 15),
                leading: Icon(Icons.list),
                children: [
                  _listTile(
                      "Políticas, programas, projetos e/ou ações de juventude:",
                      subtitle: unidadeDetalhes
                          .descricaoDasPoliticasProgramasProjetosEouAcoes),
                  //Inserir terceira linha para o item abaixo, anexo.
                  _listTile(
                      "Políticas, programas, projetos e/ou ações em destaque:",
                      subtitle: unidadeDetalhes
                          .descricaoDasPoliticasProgramasProjetosEouAcoesEmDestaque),
                  //Inserir terceira linha.
                ]),
            ExpansionTile(
                title: _titleContainer(
                    "FONTES DE RECURSOS FINANCEIROS ORÇAMENTÁRIOS", 15),
                leading: Icon(Icons.list),
                children: [
                  _listTile("Os recursos da unidade provêm de:",
                      subtitle: unidadeDetalhes.osRecursosDaOrganizacaoProvemDe),
                  _listTile("Qual o valor disponível para o plano atual?",
                      subtitle:
                          unidadeDetalhes.orcamentoDisponivelParaOAnoAtualEmReais),
                ]),
          ],
        ),
      ],
    ),
  );
}

Card _listTile(title,
    {subtitle, bool leading = false, url, double fontSize = 17, context}) {
  return Card(
      child: ListTile(
    title: Container(
      width: double.infinity,
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    leading: leading == true ? Icon(Icons.picture_as_pdf) : null,
    subtitle: Text(subtitle == null ? " " : subtitle),
    //tileColor: subtitle == null ? Colors.grey : Colors.white,
    onTap: () {
      //url != "" ? startDownload(context, url, subtitle) : null;
    },
  ));
}

Container _titleContainer(text, double fontSize) {
  return Container(
    width: double.maxFinite,
    child: Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

startDownload(context, String url, String filename) async {
  try
  {
    Directory appDocDir = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    if (Platform.isAndroid) {
      Directory(appDocDir.path.split('Android')[0] + '${Constants.appName}')
          .createSync();
    }

    String path = Platform.isIOS
        ? appDocDir.path + '/$filename.pdf'
        : appDocDir.path.split('Android')[0] +
        '${Constants.appName}/$filename.pdf';
    print(path);
    File file = File(path);
    if (!await file.exists()) {
      await file.create();
    } else {
      await file.delete();
      await file.create();
    }

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => DownloadAlert(
        url: url,
        path: path,
      ),
    ).then((v) {
      // When the download finishes, we then add the book
      // to our local database
      if (v != null) {
      }
    });
  }
  catch(Exception)
  {

  }
}

String _parseHistorie(String data) {
  if(data != ""){
    var s = data.split("\n");
    return s[2];
  }
  return data;
}


