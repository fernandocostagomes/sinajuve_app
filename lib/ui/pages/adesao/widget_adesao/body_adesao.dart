import 'package:flutter/material.dart';
import 'package:sinajuve_app/ui/pages/adesao/adesao.dart';

Container body_og(context, Adesao pAdesao) {
  var adesao2 = new Adesao();
  adesao2 = pAdesao;
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
            _listTile("Situação do avaliador:", subtitle: adesao2.situacao),
            _listTile("Último parecer:",
                subtitle: _parseHistorie(adesao2.historico)),
            _listTile("Histórico dos pareceres:", subtitle: adesao2.historico),
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
                          "Documento 1:  Sistema-para-Gestão-do-Prêmio-de-inovação-11.pdf",
                      leading: true,
                      url:
                          "https://sinajuve.ibict.br/wp-content/uploads/2020/11/Sistema-para-Gest%C3%A3o-do-Pr%C3%AAmio-de-inova%C3%A7%C3%A3o.pdf"),
                  _listTile("Portaria de nomeação do(a) gestor(a):",
                      fontSize: 16,
                      subtitle:
                          "Documento 2: Sistema-para-Gestão-do-Prêmio-de-inovação-1.pdf",
                      leading: true,
                      url:
                          "https://sinajuve.ibict.br/wp-content/uploads/2020/11/Sistema-para-Gest%C3%A3o-do-Pr%C3%AAmio-de-inova%C3%A7%C3%A3o-1.pdf"),
                  _listTile("Termo de Pactuação Federativo:",
                      fontSize: 16,
                      subtitle:
                          "Documento 3: Sistema-para-Gestão-do-Prêmio-de-inovação-2.pdf",
                      leading: true,
                      url:
                          "https://sinajuve.ibict.br/wp-content/uploads/2020/11/Sistema-para-Gest%C3%A3o-do-Pr%C3%AAmio-de-inova%C3%A7%C3%A3o-2.pdf"),
                  _listTile("Termo de adesão da unidades de juventude:",
                      fontSize: 16,
                      subtitle:
                          "Documento 4: Sistema-para-Gestão-do-Prêmio-de-inovação-3.pdf",
                      leading: true,
                      url:
                          "https://sinajuve.ibict.br/wp-content/uploads/2020/11/Sistema-para-Gest%C3%A3o-do-Pr%C3%AAmio-de-inova%C3%A7%C3%A3o-3.pdf"),
                  _listTile(
                      "Comprovante de instituição do Conselho de Juventude:",
                      fontSize: 16,
                      subtitle:
                          "Documento 5: Sistema-para-Gestão-do-Prêmio-de-inovação-4.pdf",
                      leading: true,
                      url:
                          "https://sinajuve.ibict.br/wp-content/uploads/2020/11/Sistema-para-Gest%C3%A3o-do-Pr%C3%AAmio-de-inova%C3%A7%C3%A3o-4.pdf"),
                  _listTile(
                      "Cópia de documento de identificação com foto e assinatura:",
                      fontSize: 16,
                      subtitle:
                          "Documento 6: Sistema-para-Gestão-do-Prêmio-de-inovação-5.pdf",
                      leading: true,
                      url:
                          "https://sinajuve.ibict.br/wp-content/uploads/2020/11/Sistema-para-Gest%C3%A3o-do-Pr%C3%AAmio-de-inova%C3%A7%C3%A3o-5.pdf"),
                ]),
            ExpansionTile(
                title: _titleContainer(
                    "DADOS DO GOVERNO DO ESTADO, GOVERNO DISTRITAL OU GOVERNO MUNICIPAL",
                    15),
                leading: Icon(Icons.list),
                children: [
                  _listTile("Tipo de unidade:",
                      subtitle: adesao2.tipoDeUnidade),
                  _listTile("Nome completo do Governandor(a) ou Prefeito(a):",
                      subtitle: adesao2.nomeCompletoDoGovernadoraOuPrefeitoa),
                  _listTile("E-mail do gabinete:",
                      subtitle: adesao2.eMailDoGovernadoraOuPrefeitoa),
                  _listTile("Telefone do Governandor(a) ou Prefeito(a):",
                      subtitle:
                          adesao2.telefoneDoGabineteDoGovernadoraOuPrefeitoa),
                ]),
            ExpansionTile(
                title: _titleContainer(
                    "ENDEREÇO COMPLETO DO GOVERNO DO ESTADO, GOVERNO DISTRITAL OU GOVERNO MUNICIPAL",
                    15),
                leading: Icon(Icons.list),
                children: [
                  _listTile("Estado:",
                      subtitle: adesao2
                          .estadoDoGovernoDoEstadoGovernoDistritalOuGovernoMunicipal),
                  _listTile("Cidade:",
                      subtitle: adesao2
                          .cidadeDoGovernoDoEstadoGovernoDistritalOuGovernoMunicipal),
                  _listTile("Endereço:",
                      subtitle: adesao2
                          .enderecoDoGovernoDoEstadoGovernoDistritalOuGovernoMunicipal),
                  _listTile("Complemento do endereço:",
                      subtitle: adesao2
                          .complementoDoGovernoDoEstadoGovernoDistritalOuGovernoMunicipal),
                  _listTile("CEP do endereço:",
                      subtitle: adesao2
                          .cepDoGovernoDoEstadoGovernoDistritalOuGovernoMunicipal),
                ]),
            ExpansionTile(
                title: _titleContainer(
                    "DADOS DO REPRESENTANTE/SUPLENTE INDICADO PELO GOVERNO DO ESTADO, GOVERNO DISTRITAL OU GOVERNO MUNICIPAL",
                    15),
                leading: Icon(Icons.list),
                children: [
                  _listTile("Nome completo do Representante/Suplente:",
                      subtitle: adesao2.nomeCompletoDoRepresentantesuplente),
                  _listTile("E-mail do Representante/Suplente:",
                      subtitle: adesao2.eMailDoRepresentantesuplente),
                  _listTile("CPF do Representante/Suplente:",
                      subtitle: adesao2.cpfDoRepresentantesuplente),
                  _listTile("Sexo do Representante/Suplente:",
                      subtitle: adesao2.sexoDoRepresentantesuplente),
                  _listTile("Concursado, Comissionado, Outros:",
                      subtitle: adesao2.concursadoComissionadoOutro),
                  _listTile("Telefone do Representante/Suplente:",
                      subtitle: adesao2.telefoneDoRepresentantesuplente),
                  _listTile("Celular do Representante/Suplente:",
                      subtitle: adesao2.celularDoRepresentantesuplente),
                  _listTile("Cargo ou função do Representante/Suplente:",
                      subtitle: adesao2.cargoOuFuncaoDoRepresentantesuplente),
                  _listTile("Há quanto tempo (em meses) atua como gestor(a):",
                      subtitle: adesao2.tempoDeAtuacaoComoGestoraEmMeses),
                  _listTile(
                      "Escolaridade ou Formação do Representante/Suplente:",
                      subtitle: adesao2
                          .escolaridadeOuFormacaoDoRepresentantesuplente),
                ]),
            ExpansionTile(
                title: _titleContainer("DADOS DO ORGANISMO GESTOR", 15),
                leading: Icon(Icons.list),
                children: [
                  _listTile("Nome do organismo gestor:",
                      subtitle: adesao2.nomeDoOrganismoGestor),
                  _listTile("Sigla do organismo gestor:",
                      subtitle: adesao2.siglaDoOrganismoGestor),
                  _listTile("Ano de criação do organismo gestor:",
                      subtitle: adesao2.anoDeCriacaoDoOrganismoGestor),
                  _listTile(
                      "Secretaria a que está vinculado o organismo gestor:",
                      subtitle:
                          adesao2.secretariaAQueEstaVinculadoOOrgaoGestor),
                  _listTile("Natureza jurídica do organismo gestor:",
                      subtitle: adesao2.naturezaJuridicaDoOrganismoGestor),
                  _listTile("Esfera do Governo do organismo gestor:",
                      subtitle: adesao2.esferaDeGovernoDoOrganismoGestor),
                ]),
            ExpansionTile(
                title: _titleContainer("DADOS INSTITUCIONAIS PARA CONTATO", 15),
                leading: Icon(Icons.list),
                children: [
                  _listTile("Estado do organismo gestor:",
                      subtitle: adesao2.estadoDoOrganismoGestor),
                  _listTile("Cidade do organismo gestor:",
                      subtitle: adesao2.cidadeDoOrganismoGestor),
                  _listTile("Endereço do organismo gestor:",
                      subtitle: adesao2.enderecoDoOrganismoGestor),
                  _listTile("Complemento do organismo gestor:",
                      subtitle: adesao2.complementoDoOrganismoGestor),
                  _listTile("CEP do organismo gestor:",
                      subtitle: adesao2.cepDoOrganismoGestor),
                  _listTile("Telefone do organismo gestor:",
                      subtitle: adesao2.telefoneDoOrganismoGestor),
                  _listTile("Celular do organismo gestor:",
                      subtitle: adesao2.celularDoOrganismoGestor),
                  _listTile("E-mail do organismo gestor:",
                      subtitle: adesao2.eMailDoOrganismoGestor),
                  _listTile("Website do organismo gestor:",
                      subtitle: adesao2.websiteDoOrganismoGestor),
                  _listTile("Redes sociais do organismo gestor:",
                      subtitle: adesao2.redesSociaisDaUnidade),
                ]),
            ExpansionTile(
                title: _titleContainer(
                    "POLÍTICAS, PROGRAMAS, PROJETOS E/OU AÇÕES", 15),
                leading: Icon(Icons.list),
                children: [
                  //Inserir terceira linha para o item abaixo, anexo.
                  _listTile(
                      "Políticas, programas, projetos e/ou ações de juventude:",
                      subtitle: adesao2
                          .descricaoConveniosParaODesenvolvimentoDePoliticasProgramasProjetosEouAcoesDeJuventude),
                  //Inserir terceira linha para o item abaixo, anexo.
                  _listTile(
                      "Convênios para o desenvolvimento de políticas, programas, projetos e/ou ações de juventude:",
                      subtitle: adesao2
                          .descricaoConveniosParaODesenvolvimentoDePoliticasProgramasProjetosEouAcoesDeJuventude),
                  _listTile("Descrição da equipe:",
                      subtitle: adesao2.descricaoDaEquipe),
                ]),
            ExpansionTile(
                title: _titleContainer("SOBRE A ESTRUTURA FÍSICA", 15),
                leading: Icon(Icons.list),
                children: [
                  _listTile("Qual espaço físico a unidade possui?",
                      subtitle: adesao2.espacoFisicoDaUnidade),
                  _listTile("Qual itens a unidade possui?",
                      subtitle: adesao2.estruturasFisicasQuePossui),
                  _listTile("Estações de trabalho - Quantidade:",
                      subtitle: adesao2.numeroDeEstacoesDeTrabalho),
                  _listTile("Computadores - Quantidade:",
                      subtitle: adesao2.numeroDeComputadores),
                ]),
            ExpansionTile(
                title: _titleContainer(
                    "FONTES DE RECURSOS FINANCEIROS ORÇAMENTÁRIOS", 15),
                leading: Icon(Icons.list),
                children: [
                  _listTile("Recursos da unidade provêm de:",
                      subtitle: adesao2.osRecursosDaUnidadeProvemDe),
                  _listTile(
                      "Qual o valor disponível para o plano atual em Reais?",
                      subtitle:
                          adesao2.orcamentoDisponivelParaOAnoAtualEmReais),
                ]),
            ExpansionTile(
                title: _titleContainer("REDE DE APOIO", 15),
                leading: Icon(Icons.list),
                children: [
                  _listTile(
                      "Quais são as instituições governamentais ou não governamentais de maior destaque que tem em seu Estado, Distrito Federal ou Município que prestam atendimento para a juventude?",
                      subtitle: adesao2.descricaoDasInstituicoes),
                ]),
            ExpansionTile(
                title: _titleContainer(
                    "CITE AS INSTITUIÇÕES GOVERNAMENTAIS RELACIONADAS AOS 11 EIXOS QUE A SUA UNIDADE DESENVOLVE PARCERIA",
                    15),
                leading: Icon(Icons.list),
                children: [
                  _listTile(
                      "Cidadania, Participação Social e Política e Representação:",
                      subtitle: adesao2
                          .cidadaniaParticipacaoSocialEPoliticaERepresentacaoJuvenil),
                  _listTile("Educação:", subtitle: adesao2.educacao),
                  _listTile("Profissionalização, Trabalho e Renda:",
                      subtitle: adesao2.profissionalizacaoTrabalhoERenda),
                  _listTile("Diversidade e Igualdade:",
                      subtitle: adesao2.diversidadeEIgualdade),
                  _listTile("Saúde:", subtitle: adesao2.saude),
                  _listTile("Cultura:", subtitle: adesao2.cultura),
                  _listTile("Comunicação e Liberdade de Expressão:",
                      subtitle: adesao2.comunicacaoELiberdadeDeExpressao),
                  _listTile("Desporto e Lazer:",
                      subtitle: adesao2.desportoELazer),
                  _listTile("Território e Mobilidade:",
                      subtitle: adesao2.territorioEMobilidade),
                  _listTile("Sustentabilidade e Meio Ambiente:",
                      subtitle: adesao2.sustentabilidadeEMeioAmbiente),
                  _listTile("Segurança Pública e Acesso à Justiça:",
                      subtitle: adesao2.segurancaPublicaEAcessoAJustica),
                ]),
          ],
        ),
      ],
    ),
  );
}

Container body_cj(context, Adesao pAdesao) {
  var adesao2 = new Adesao();
  adesao2 = pAdesao;
  return Container(
    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 15.0, 20.0),
    child: ListView(
      children: <Widget>[
        ExpansionTile(
          title:
              _titleContainer("Revise os dados de seu processo de adesão", 20),
          children: [
            _listTile("Situação do avaliador:", subtitle: adesao2.situacao),
            _listTile("Último parecer:",
                subtitle: _parseHistorie(adesao2.historico)),
            _listTile("Histórico dos pareceres:", subtitle: adesao2.historico),
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
                      subtitle:
                          "Documento 1:  Sistema-para-Gestão-do-Prêmio-de-inovação-11.pdf",
                      leading: true,
                      url:
                          "https://sinajuve.ibict.br/wp-content/uploads/2020/11/Sistema-para-Gest%C3%A3o-do-Pr%C3%AAmio-de-inova%C3%A7%C3%A3o-11.pdf"),
                  _listTile("Envie o ato constitutivo:",
                      subtitle:
                          "Documento 2: Sistema-para-Gestão-do-Prêmio-de-inovação-12.pdf",
                      leading: true,
                      url:
                          "https://sinajuve.ibict.br/wp-content/uploads/2020/11/Sistema-para-Gest%C3%A3o-do-Pr%C3%AAmio-de-inova%C3%A7%C3%A3o-12.pdf"),
                  _listTile("Envie a ata de eleição dos conselheiros:",
                      subtitle:
                          "Documento 3: Sistema-para-Gestão-do-Prêmio-de-inovação-13.pdf",
                      leading: true,
                      url:
                          "https://sinajuve.ibict.br/wp-content/uploads/2020/11/Sistema-para-Gest%C3%A3o-do-Pr%C3%AAmio-de-inova%C3%A7%C3%A3o-13.pdf"),
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
                      subtitle: adesao2.nomeCompletoDoPresidenteOuSecretarioa),
                  _listTile("Email do Presidente ou Secretário(a):",
                      subtitle: adesao2.eMailDoPresidenteOuSecretarioa),
                  _listTile("CPF do Presidente ou Secretário(a) *:",
                      subtitle: adesao2.cpfDoPresidenteOuSecretarioa),
                  _listTile("Telefone do Presidente ou Secretário(a) *:",
                      subtitle: adesao2.telefoneDoPresidenteOuSecretarioa),
                  _listTile("Celular do Presidente ou Secretário(a):",
                      subtitle: adesao2.celularDoPresidenteOuSecretarioa),
                  _listTile("Cargo ou função do Presidente ou Secretário(a) *:",
                      subtitle: adesao2.cargoOuFuncaoDoPresidenteOuSecretarioa),
                  _listTile(
                      "Escolaridade ou Formação do Presidente ou Secretário(a) *:",
                      subtitle: adesao2
                          .escolaridadeOuFormacaoDoPresidenteOuSecretarioa),
                ]),
            ExpansionTile(
                title: _titleContainer("DADOS DO CONSELHO", 15),
                leading: Icon(Icons.list),
                children: [
                  _listTile("Nome do conselho*:",
                      subtitle: adesao2.nomeDoConselhoDeJuventude),
                  _listTile("Ano de criação do conselho*:",
                      subtitle: adesao2.anoDeCriacaoDoConselho),
                  _listTile("Esfera de Governo do conselho*:",
                      subtitle: adesao2.esferaDeGovernoDoConselho),
                  _listTile(
                      "De quem foi a iniciativa para criação do conselho?",
                      subtitle:
                          adesao2.deQuemFoiAIniciativaParaCriacaoDoConselho),
                  _listTile(
                      "Sua institucionalização se deu através de que norma?*",
                      subtitle:
                          adesao2.aInstitucionalizacaoSeDeuAtravesDaNorma),
                  _listTile("Qual?*",
                      subtitle:
                          adesao2.aInstitucionalizacaoSeDeuAtravesDaNormaOutra),
                  _listTile("Qual é o número total de conselheiros?*",
                      subtitle: adesao2.numeroTotalDeConselheiros),
                  _listTile("Qual é a duração do mandato dos conselheiros?*",
                      subtitle: adesao2.duracaoDoMandatoDosConselheiros),
                  _listTile(
                      "De que maneira é realizada a eleição/escolha dos conselheiros?*",
                      subtitle: adesao2
                          .maneiraQueERealizadaAEleicaoescolhaDosConselheiros),
                  _listTile("Qual é o caráter do conselho?*",
                      subtitle: adesao2.caraterDosConselheiros),
                  _listTile("Qual é a proporcionalidade do conselho?",
                      subtitle: ""),
                  _listTile("Percentual do Poder Público:",
                      subtitle: adesao2.percentualDoPoderPublico),
                  _listTile("Percentual da Sociedade Civil:",
                      subtitle: adesao2.percentualDaSociedadeCivil),
                  _listTile(
                      "Quais são as principais áreas de atuação das entidades que participam da organização?",
                      subtitle: adesao2
                          .principaisAreasDeAtuacaoDasEntidadesQueParticipamDoConselho),
                ]),
            ExpansionTile(
                title: _titleContainer("DADOS INSTITUCIONAIS PARA CONTATO", 15),
                leading: Icon(Icons.list),
                children: [
                  _listTile("Estado do conselho de juventude:",
                      subtitle: adesao2.estadoDoConselhoDeJuventude),
                  _listTile("Cidade do conselho de juventude:",
                      subtitle: adesao2.cidadeDoConselhoDeJuventude),
                  _listTile("Endereço do conselho de juventude:",
                      subtitle: adesao2.enderecoDoConselhoDeJuventude),
                  _listTile("Complemento do conselho de juventude:",
                      subtitle: adesao2.complementoDoConselhoDeJuventude),
                  _listTile("CEP do conselho de juventude:",
                      subtitle: adesao2.cepDoConselhoDeJuventude),
                  _listTile("Telefone do conselho de juventude:",
                      subtitle: adesao2.telefoneDoConselhoDeJuventude),
                  _listTile("Celular do conselho de juventude:",
                      subtitle: adesao2.celularDoConselhoDeJuventude),
                  _listTile("Email do conselho de juventude:",
                      subtitle: adesao2.eMailDoConselhoDeJuventude),
                  _listTile("Website do conselho de juventude:",
                      subtitle: adesao2.websiteDoConselhoDeJuventude),
                  _listTile("Redes sociais do conselho de juventude:",
                      subtitle: adesao2.redesSociaisDoConselhoDeJuventude),
                ]),
            ExpansionTile(
                title: _titleContainer("POLÍTICAS, PROGRAMAS, PROJETOS E/OU AÇÕES", 15),
                leading: Icon(Icons.list),
                children: [
                  _listTile(
                      "Políticas, programas, projetos e/ou ações de juventude:",
                      subtitle: adesao2
                          .descricaoConveniosParaODesenvolvimentoDePoliticasProgramasProjetosEouAcoesDeJuventude),
                  _listTile(
                      "Políticas, programas, projetos e/ou ações em destaque:",
                      subtitle: adesao2
                          .descricaoDasPoliticasProgramasProjetosEouAcoesEmDestaque),
                  _listTile(
                      "O conselho possui convênios para o desenvolvimento de políticas, programas, projetos e/ou ações de juventude?",
                      subtitle: adesao2
                          .descricaoConveniosParaODesenvolvimentoDePoliticasProgramasProjetosEouAcoesDeJuventude),
                  _listTile("Descrição da equipe:",
                      subtitle: adesao2.descricaoDaEquipe),
                ]),
            ExpansionTile(
                title: _titleContainer("SOBRE A ESTRUTURA FÍSICA", 15),
                leading: Icon(Icons.list),
                children: [
                  _listTile("Qual espaço físico a unidade possui?",
                      subtitle: adesao2.espacoFisicoDoConselhoDeJuventude),
                  _listTile("Qual itens a unidade possui?",
                      subtitle: adesao2.estruturasFisicasQuePossui),
                  _listTile("Estações de trabalho - Quantidade:",
                      subtitle: adesao2.numeroDeEstacoesDeTrabalho),
                  _listTile("Computadores - Quantidade:",
                      subtitle: adesao2.numeroDeComputadores),
                ]),
            ExpansionTile(
                title: _titleContainer("FONTES DE RECURSOS FINANCEIROS ORÇAMENTÁRIOS", 15),
                leading: Icon(Icons.list),
                children: [
                  _listTile("Os recursos da unidade provêm de:",
                      subtitle: adesao2.osRecursosDaUnidadeProvemDe),
                  _listTile("Qual o valor disponível para o plano atual?",
                      subtitle:
                          adesao2.orcamentoDisponivelParaOAnoAtualEmReais),
                ]),
            ExpansionTile(
                title: _titleContainer("REDE DE APOIO", 15),
                leading: Icon(Icons.list),
                children: [
                  _listTile(
                      "Quais são as instituições governamentais ou não governamentais de maior destaque que tem em seu Estado, Distrito Federal ou Município que prestam atendimento para a juventude?",
                      subtitle: adesao2.descricaoDasInstituicoes),
                ]),
            ExpansionTile(
                title: _titleContainer(
                    "CITE AS INSTITUIÇÕES GOVERNAMENTAIS RELACIONADAS AOS 11 EIXOS QUE A SUA UNIDADE DESENVOLVE PARCERIA", 15),
                leading: Icon(Icons.list),
                children: [
                  _listTile(
                      "Cidadania, Participação Social e Política e Representação:",
                      subtitle: adesao2
                          .cidadaniaParticipacaoSocialEPoliticaERepresentacaoJuvenil),
                  _listTile("Educação:", subtitle: adesao2.educacao),
                  _listTile("Profissionalização, Trabalho e Renda:",
                      subtitle: adesao2.profissionalizacaoTrabalhoERenda),
                  _listTile("Diversidade e Igualdade:",
                      subtitle: adesao2.diversidadeEIgualdade),
                  _listTile("Saúde:", subtitle: adesao2.saude),
                  _listTile("Cultura:", subtitle: adesao2.cultura),
                  _listTile("Comunicação e Liberdade de Expressão:",
                      subtitle: adesao2.comunicacaoELiberdadeDeExpressao),
                  _listTile("Desporto e Lazer:",
                      subtitle: adesao2.desportoELazer),
                  _listTile("Território e Mobilidade:",
                      subtitle: adesao2.territorioEMobilidade),
                  _listTile("Sustentabilidade e Meio Ambiente:",
                      subtitle: adesao2.sustentabilidadeEMeioAmbiente),
                  _listTile("Segurança Pública e Acesso à Justiça:",
                      subtitle: adesao2.segurancaPublicaEAcessoAJustica),
                ]),
          ],
        ),
      ],
    ),
  );
}

Container body_osc(context, Adesao pAdesao) {
  var adesao2 = new Adesao();
  adesao2 = pAdesao;
  return Container(
    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 15.0, 20.0),
    child: ListView(
      children: <Widget>[
        ExpansionTile(
          title:
              _titleContainer("Revise os dados de seu processo de adesão", 20),
          children: [
            _listTile("Situação do avaliador:", subtitle: adesao2.situacao),
            _listTile("Último parecer:",
                subtitle: _parseHistorie(adesao2.historico)),
            _listTile("Histórico dos pareceres:", subtitle: adesao2.historico),
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
                          "Documento 1: Sistema-para-Gestão-do-Prêmio-de-inovação-6.pdf",
                      leading: true,
                      url:
                          "https://sinajuve.ibict.br/wp-content/uploads/2020/11/Sistema-para-Gest%C3%A3o-do-Pr%C3%AAmio-de-inova%C3%A7%C3%A3o-6."),
                  _listTile(
                      "Estatuto aprovado da Organização da Sociedade Civil (OSC):",
                      subtitle:
                          "Documento 2: Sistema-para-Gestão-do-Prêmio-de-inovação-7.pdf",
                      leading: true,
                      url:
                          "https://sinajuve.ibict.br/wp-content/uploads/2020/11/Sistema-para-Gest%C3%A3o-do-Pr%C3%AAmio-de-inova%C3%A7%C3%A3o-7.pdf"),
                  _listTile(
                      "Registro em cartório da Organização da Sociedade Civil (OSC):",
                      subtitle:
                          "Documento 3: Sistema-para-Gestão-do-Prêmio-de-inovação-8.pdf",
                      leading: true,
                      url:
                          "https://sinajuve.ibict.br/wp-content/uploads/2020/11/Sistema-para-Gest%C3%A3o-do-Pr%C3%AAmio-de-inova%C3%A7%C3%A3o-8.pdf"),
                  _listTile(
                      "Comprovante de inscrição e de situação cadastral no CNPJ:",
                      subtitle:
                          "Documento 4: Sistema-para-Gestão-do-Prêmio-de-inovação-9.pdf",
                      leading: true,
                      url:
                          "https://sinajuve.ibict.br/wp-content/uploads/2020/11/Sistema-para-Gest%C3%A3o-do-Pr%C3%AAmio-de-inova%C3%A7%C3%A3o-9.pdf"),
                  _listTile("Ata de eleição ou posse (mais recente):",
                      subtitle:
                          "Documento 5: Sistema-para-Gestão-do-Prêmio-de-inovação-10.pdf",
                      leading: true,
                      url:
                          "https://sinajuve.ibict.br/wp-content/uploads/2020/11/Sistema-para-Gest%C3%A3o-do-Pr%C3%AAmio-de-inova%C3%A7%C3%A3o-10.pdf"),
                ]),
            ExpansionTile(
                title: _titleContainer(
                    "DADOS DO(A) PRESIDENTE, VICE-PRESIDENTE OU SECRETÁRIO(A)",
                    15),
                leading: Icon(Icons.list),
                children: [
                  _listTile("Nome completo do Presidente ou Secretário:",
                      subtitle: adesao2.nomeCompletoDoPresidenteOuSecretario),
                  _listTile("Email do Presidente ou Secretário(a):",
                      subtitle: adesao2.eMailDoPresidenteOuSecretario),
                  _listTile("CPF do Presidente ou Secretário(a):",
                      subtitle: adesao2.cpfDoPresidenteOuSecretario),
                  _listTile("Telefone do Presidente ou Secretário(a):",
                      subtitle: adesao2.telefoneDoPresidenteOuSecretario),
                  _listTile("Celular do Presidente ou Secretário(a):",
                      subtitle: adesao2.celularDoPresidenteOuSecretario),
                  _listTile("Indique o sexo do Presidente ou Secretário(a):",
                      subtitle: adesao2.sexoDoPresidenteOuSecretario),
                  _listTile(
                      "Escolaridade ou Formação do Presidente ou Secretário(a):",
                      subtitle: adesao2
                          .escolaridadeOuFormacaoDoPresidenteOuSecretario),
                ]),
            ExpansionTile(
                title: _titleContainer(
                    "DADOS GERAIS DA ORGANIZAÇÃO DA SOCIEDADE CIVIL", 15),
                leading: Icon(Icons.list),
                children: [
                  _listTile("Razão Social:",
                      subtitle: adesao2.razaoSocialDaOsc),
                  _listTile("Qual é o nome fantasia?",
                      subtitle: adesao2.nomeDaOrganizacao),
                  _listTile("Qual é o CNPJ?", subtitle: adesao2.cnpjDaOsc),
                  _listTile("Ano de fundação:",
                      subtitle: adesao2.anoDeFundacaoDaOsc),
                  _listTile("Natureza Jurídica:",
                      subtitle: adesao2.naturezaJuridicaDaOsc),
                  _listTile(
                      "Quais são as principais áreas de atuação das entidades que participam da organização?",
                      subtitle: adesao2
                          .principaisAreasDeAtuacaoDasEntidadesQueParticipamDaOrganizacao),
                  _listTile("Titulações e Certificações:",
                      subtitle: adesao2.titulacoesECertificacoes),
                ]),
            ExpansionTile(
                title: _titleContainer("DADOS INSTITUCIONAIS PARA CONTATO", 15),
                leading: Icon(Icons.list),
                children: [
                  _listTile("Estado da organização:",
                      subtitle: adesao2.estadoDaOrganizacao),
                  _listTile("Cidade da organização:",
                      subtitle: adesao2.cidadeDaOrganizacao),
                  _listTile("Endereço da organização:",
                      subtitle: adesao2.enderecoDaOrganizacao),
                  _listTile("Complemento da organização:",
                      subtitle: adesao2.complementoDaOrganizacao),
                  _listTile("CEP da organização:",
                      subtitle: adesao2.cepDaOrganizacao),
                  _listTile("Telefone da organização:",
                      subtitle: adesao2.telefoneDaOrganizacao),
                  _listTile("Celular da organização:",
                      subtitle: adesao2.celularDaOrganizacao),
                  _listTile("E-mail da organização:",
                      subtitle: adesao2.eMailDaOrganizacao),
                  _listTile("Website da organização:",
                      subtitle: adesao2.websiteDaOrganizacao),
                  _listTile("Redes sociais da organização:",
                      subtitle: adesao2.redesSociaisDaOrganizacao),
                ]),
            ExpansionTile(
                title: _titleContainer(
                    "POLÍTICAS, PROGRAMAS, PROJETOS E/OU AÇÕES", 15),
                leading: Icon(Icons.list),
                children: [
                  _listTile(
                      "Políticas, programas, projetos e/ou ações de juventude:",
                      subtitle: adesao2
                          .descricaoDasPoliticasProgramasProjetosEouAcoes),
                  //Inserir terceira linha para o item abaixo, anexo.
                  _listTile(
                      "Políticas, programas, projetos e/ou ações em destaque:",
                      subtitle: adesao2
                          .descricaoDasPoliticasProgramasProjetosEouAcoesEmDestaque),
                  //Inserir terceira linha.
                ]),
            ExpansionTile(
                title: _titleContainer(
                    "FONTES DE RECURSOS FINANCEIROS ORÇAMENTÁRIOS", 15),
                leading: Icon(Icons.list),
                children: [
                  _listTile("Os recursos da unidade provêm de:",
                      subtitle: adesao2.osRecursosDaOrganizacaoProvemDe),
                  _listTile("Qual o valor disponível para o plano atual?",
                      subtitle:
                          adesao2.orcamentoDisponivelParaOAnoAtualEmReais),
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
    leading: leading == true ? Icon(Icons.picture_as_pdf_outlined) : null,
    subtitle: Text(subtitle == null ? " " : subtitle),
    tileColor: subtitle == null ? Colors.grey : Colors.white,
    onTap: () {
      url != "" ? _downloadPDF(url, context) : null;
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

_downloadPDF(url, context) {}

String _parseHistorie(String data) {
  var s = data.split("\n");
  return s[2];
}
