import 'dart:convert' as convert;
import 'package:sinajuve_app/ui/utils/prefs.dart';

class Adesao {
  String tipoDeUnidade;
  String nomeCompletoDoGovernadoraOuPrefeitoa;
  String eMailDoGovernadoraOuPrefeitoa;
  String telefoneDoGovernadoraOuPrefeitoa;
  String telefoneDoGabineteDoGovernadoraOuPrefeitoa;
  String estadoDoGovernoDoEstadoGovernoDistritalOuGovernoMunicipal;
  String cidadeDoGovernoDoEstadoGovernoDistritalOuGovernoMunicipal;
  String enderecoDoGovernoDoEstadoGovernoDistritalOuGovernoMunicipal;
  String complementoDoGovernoDoEstadoGovernoDistritalOuGovernoMunicipal;
  String cepDoGovernoDoEstadoGovernoDistritalOuGovernoMunicipal;
  String nomeCompletoDoRepresentantesuplente;
  String eMailDoRepresentantesuplente;
  String cpfDoRepresentantesuplente;
  String sexoDoRepresentantesuplente;
  String concursadoComissionado;
  String concursadoComissionadoOutro;
  String telefoneDoRepresentantesuplente;
  String celularDoRepresentantesuplente;
  String cargoOuFuncaoDoRepresentantesuplente;
  String tempoDeAtuacaoComoGestoraEmMeses;
  String escolaridadeOuFormacaoDoRepresentantesuplente;
  String nomeDoOrganismoGestor;
  String siglaDoOrganismoGestor;
  String anoDeCriacaoDoOrganismoGestor;
  String secretariaAQueEstaVinculadoOOrgaoGestor;
  String naturezaJuridicaDoOrganismoGestor;
  String naturezaJuridicaDoOrganismoGestorOutro;
  String esferaDeGovernoDoOrganismoGestor;
  String estadoDoOrganismoGestor;
  String cidadeDoOrganismoGestor;
  String enderecoDoOrganismoGestor;
  String complementoDoOrganismoGestor;
  String cepDoOrganismoGestor;
  String telefoneDoOrganismoGestor;
  String celularDoOrganismoGestor;
  String eMailDoOrganismoGestor;
  String websiteDoOrganismoGestor;
  String redesSociaisDaUnidade;
  String descricaoDasPoliticasProgramasProjetosEouAcoes;
  String descricaoDasPoliticasProgramasProjetosEouAcoesEmDestaque;
  String
  descricaoConveniosParaODesenvolvimentoDePoliticasProgramasProjetosEouAcoesDeJuventude;
  String descricaoDaEquipe;
  String espacoFisicoDaUnidade;
  String espacoFisicoDaUnidadeOutro;
  String estruturasFisicasQuePossui;
  String numeroDeEstacoesDeTrabalho;
  String numeroDeComputadores;
  String osRecursosDaUnidadeProvemDe;
  String osRecursosDaUnidadeProvemDeOutro;
  String orcamentoDisponivelParaOAnoAtualEmReais;
  String descricaoDasInstituicoes;
  String cidadaniaParticipacaoSocialEPoliticaERepresentacaoJuvenil;
  String educacao;
  String profissionalizacaoTrabalhoERenda;
  String diversidadeEIgualdade;
  String saude;
  String cultura;
  String comunicacaoELiberdadeDeExpressao;
  String desportoELazer;
  String territorioEMobilidade;
  String sustentabilidadeEMeioAmbiente;
  String segurancaPublicaEAcessoAJustica;
  String nomeCompletoDoPresidenteOuSecretarioa;
  String eMailDoPresidenteOuSecretarioa;
  String cpfDoPresidenteOuSecretarioa;
  String telefoneDoPresidenteOuSecretarioa;
  String celularDoPresidenteOuSecretarioa;
  String cargoOuFuncaoDoPresidenteOuSecretarioa;
  String escolaridadeOuFormacaoDoPresidenteOuSecretarioa;
  String nomeDoConselhoDeJuventude;
  String anoDeCriacaoDoConselho;
  String esferaDeGovernoDoConselho;
  String deQuemFoiAIniciativaParaCriacaoDoConselho;
  String deQuemFoiAIniciativaParaCriacaoDoConselhoOutro;
  String aInstitucionalizacaoSeDeuAtravesDaNorma;
  String aInstitucionalizacaoSeDeuAtravesDaNormaOutra;
  String numeroTotalDeConselheiros;
  String duracaoDoMandatoDosConselheiros;
  String duracaoDoMandatoDosConselheirosOutro;
  String maneiraQueERealizadaAEleicaoescolhaDosConselheiros;
  String maneiraQueERealizadaAEleicaoescolhaDosConselheirosOutro;
  String caraterDosConselheiros;
  String caraterDosConselheirosOutro;
  String percentualDoPoderPublico;
  String percentualDaSociedadeCivil;
  String principaisAreasDeAtuacaoDasEntidadesQueParticipamDoConselho;
  String estadoDoConselhoDeJuventude;
  String cidadeDoConselhoDeJuventude;
  String enderecoDoConselhoDeJuventude;
  String complementoDoConselhoDeJuventude;
  String cepDoConselhoDeJuventude;
  String telefoneDoConselhoDeJuventude;
  String celularDoConselhoDeJuventude;
  String eMailDoConselhoDeJuventude;
  String websiteDoConselhoDeJuventude;
  String redesSociaisDoConselhoDeJuventude;
  String espacoFisicoDoConselhoDeJuventude;
  String espacoFisicoDoConselhoDeJuventudeOutro;
  String historico;
  String nomeCompletoDoPresidenteOuSecretario;
  String eMailDoPresidenteOuSecretario;
  String cpfDoPresidenteOuSecretario;
  String telefoneDoPresidenteOuSecretario;
  String celularDoPresidenteOuSecretario;
  String sexoDoPresidenteOuSecretario;
  String escolaridadeOuFormacaoDoPresidenteOuSecretario;
  String razaoSocialDaOsc;
  String nomeDaOrganizacao;
  String cnpjDaOsc;
  String anoDeFundacaoDaOsc;
  String naturezaJuridicaDaOsc;
  String naturezaJuridicaDaOscOutro;
  String principaisAreasDeAtuacaoDasEntidadesQueParticipamDaOrganizacao;
  String titulacoesECertificacoes;
  String titulacoesECertificacoesOutra;
  String estadoDaOrganizacao;
  String cidadeDaOrganizacao;
  String enderecoDaOrganizacao;
  String complementoDaOrganizacao;
  String cepDaOrganizacao;
  String telefoneDaOrganizacao;
  String celularDaOrganizacao;
  String eMailDaOrganizacao;
  String websiteDaOrganizacao;
  String redesSociaisDaOrganizacao;
  String osRecursosDaOrganizacaoProvemDe;
  String osRecursosDaOrganizacaoProvemDeOutro;
  String usuario;
  String situacao;

  Adesao(
      {this.tipoDeUnidade,
        this.nomeCompletoDoGovernadoraOuPrefeitoa,
        this.eMailDoGovernadoraOuPrefeitoa,
        this.telefoneDoGovernadoraOuPrefeitoa,
        this.telefoneDoGabineteDoGovernadoraOuPrefeitoa,
        this.estadoDoGovernoDoEstadoGovernoDistritalOuGovernoMunicipal,
        this.cidadeDoGovernoDoEstadoGovernoDistritalOuGovernoMunicipal,
        this.enderecoDoGovernoDoEstadoGovernoDistritalOuGovernoMunicipal,
        this.complementoDoGovernoDoEstadoGovernoDistritalOuGovernoMunicipal,
        this.cepDoGovernoDoEstadoGovernoDistritalOuGovernoMunicipal,
        this.nomeCompletoDoRepresentantesuplente,
        this.eMailDoRepresentantesuplente,
        this.cpfDoRepresentantesuplente,
        this.sexoDoRepresentantesuplente,
        this.concursadoComissionado,
        this.concursadoComissionadoOutro,
        this.telefoneDoRepresentantesuplente,
        this.celularDoRepresentantesuplente,
        this.cargoOuFuncaoDoRepresentantesuplente,
        this.tempoDeAtuacaoComoGestoraEmMeses,
        this.escolaridadeOuFormacaoDoRepresentantesuplente,
        this.nomeDoOrganismoGestor,
        this.siglaDoOrganismoGestor,
        this.anoDeCriacaoDoOrganismoGestor,
        this.secretariaAQueEstaVinculadoOOrgaoGestor,
        this.naturezaJuridicaDoOrganismoGestor,
        this.naturezaJuridicaDoOrganismoGestorOutro,
        this.esferaDeGovernoDoOrganismoGestor,
        this.estadoDoOrganismoGestor,
        this.cidadeDoOrganismoGestor,
        this.enderecoDoOrganismoGestor,
        this.complementoDoOrganismoGestor,
        this.cepDoOrganismoGestor,
        this.telefoneDoOrganismoGestor,
        this.celularDoOrganismoGestor,
        this.eMailDoOrganismoGestor,
        this.websiteDoOrganismoGestor,
        this.redesSociaisDaUnidade,
        this.descricaoDasPoliticasProgramasProjetosEouAcoes,
        this.descricaoDasPoliticasProgramasProjetosEouAcoesEmDestaque,
        this.descricaoConveniosParaODesenvolvimentoDePoliticasProgramasProjetosEouAcoesDeJuventude,
        this.descricaoDaEquipe,
        this.espacoFisicoDaUnidade,
        this.espacoFisicoDaUnidadeOutro,
        this.estruturasFisicasQuePossui,
        this.numeroDeEstacoesDeTrabalho,
        this.numeroDeComputadores,
        this.osRecursosDaUnidadeProvemDe,
        this.osRecursosDaUnidadeProvemDeOutro,
        this.orcamentoDisponivelParaOAnoAtualEmReais,
        this.descricaoDasInstituicoes,
        this.cidadaniaParticipacaoSocialEPoliticaERepresentacaoJuvenil,
        this.educacao,
        this.profissionalizacaoTrabalhoERenda,
        this.diversidadeEIgualdade,
        this.saude,
        this.cultura,
        this.comunicacaoELiberdadeDeExpressao,
        this.desportoELazer,
        this.territorioEMobilidade,
        this.sustentabilidadeEMeioAmbiente,
        this.segurancaPublicaEAcessoAJustica,
        this.nomeCompletoDoPresidenteOuSecretarioa,
        this.eMailDoPresidenteOuSecretarioa,
        this.cpfDoPresidenteOuSecretarioa,
        this.telefoneDoPresidenteOuSecretarioa,
        this.celularDoPresidenteOuSecretarioa,
        this.cargoOuFuncaoDoPresidenteOuSecretarioa,
        this.escolaridadeOuFormacaoDoPresidenteOuSecretarioa,
        this.nomeDoConselhoDeJuventude,
        this.anoDeCriacaoDoConselho,
        this.esferaDeGovernoDoConselho,
        this.deQuemFoiAIniciativaParaCriacaoDoConselho,
        this.deQuemFoiAIniciativaParaCriacaoDoConselhoOutro,
        this.aInstitucionalizacaoSeDeuAtravesDaNorma,
        this.aInstitucionalizacaoSeDeuAtravesDaNormaOutra,
        this.numeroTotalDeConselheiros,
        this.duracaoDoMandatoDosConselheiros,
        this.duracaoDoMandatoDosConselheirosOutro,
        this.maneiraQueERealizadaAEleicaoescolhaDosConselheiros,
        this.maneiraQueERealizadaAEleicaoescolhaDosConselheirosOutro,
        this.caraterDosConselheiros,
        this.caraterDosConselheirosOutro,
        this.percentualDoPoderPublico,
        this.percentualDaSociedadeCivil,
        this.principaisAreasDeAtuacaoDasEntidadesQueParticipamDoConselho,
        this.estadoDoConselhoDeJuventude,
        this.cidadeDoConselhoDeJuventude,
        this.enderecoDoConselhoDeJuventude,
        this.complementoDoConselhoDeJuventude,
        this.cepDoConselhoDeJuventude,
        this.telefoneDoConselhoDeJuventude,
        this.celularDoConselhoDeJuventude,
        this.eMailDoConselhoDeJuventude,
        this.websiteDoConselhoDeJuventude,
        this.redesSociaisDoConselhoDeJuventude,
        this.espacoFisicoDoConselhoDeJuventude,
        this.espacoFisicoDoConselhoDeJuventudeOutro,
        this.historico,
        this.nomeCompletoDoPresidenteOuSecretario,
        this.eMailDoPresidenteOuSecretario,
        this.cpfDoPresidenteOuSecretario,
        this.telefoneDoPresidenteOuSecretario,
        this.celularDoPresidenteOuSecretario,
        this.sexoDoPresidenteOuSecretario,
        this.escolaridadeOuFormacaoDoPresidenteOuSecretario,
        this.razaoSocialDaOsc,
        this.nomeDaOrganizacao,
        this.cnpjDaOsc,
        this.anoDeFundacaoDaOsc,
        this.naturezaJuridicaDaOsc,
        this.naturezaJuridicaDaOscOutro,
        this.principaisAreasDeAtuacaoDasEntidadesQueParticipamDaOrganizacao,
        this.titulacoesECertificacoes,
        this.titulacoesECertificacoesOutra,
        this.estadoDaOrganizacao,
        this.cidadeDaOrganizacao,
        this.enderecoDaOrganizacao,
        this.complementoDaOrganizacao,
        this.cepDaOrganizacao,
        this.telefoneDaOrganizacao,
        this.celularDaOrganizacao,
        this.eMailDaOrganizacao,
        this.websiteDaOrganizacao,
        this.redesSociaisDaOrganizacao,
        this.osRecursosDaOrganizacaoProvemDe,
        this.osRecursosDaOrganizacaoProvemDeOutro,
        this.usuario,
        this.situacao});

  Adesao.fromJson(Map<String, dynamic> json) {
    tipoDeUnidade = json['tipo_de_unidade'];
    nomeCompletoDoGovernadoraOuPrefeitoa =
    json['nome_completo_do_governadora_ou_prefeitoa'];
    eMailDoGovernadoraOuPrefeitoa = json['e-mail_do_governadora_ou_prefeitoa'];
    telefoneDoGovernadoraOuPrefeitoa =
    json['telefone_do_governadora_ou_prefeitoa'];
    telefoneDoGabineteDoGovernadoraOuPrefeitoa =
    json['telefone_do_gabinete_do_governadora_ou_prefeitoa'];
    estadoDoGovernoDoEstadoGovernoDistritalOuGovernoMunicipal = json[
    'estado_do_governo_do_estado_governo_distrital_ou_governo_municipal'];
    cidadeDoGovernoDoEstadoGovernoDistritalOuGovernoMunicipal = json[
    'cidade_do_governo_do_estado_governo_distrital_ou_governo_municipal'];
    enderecoDoGovernoDoEstadoGovernoDistritalOuGovernoMunicipal = json[
    'endereco_do_governo_do_estado_governo_distrital_ou_governo_municipal'];
    complementoDoGovernoDoEstadoGovernoDistritalOuGovernoMunicipal = json[
    'complemento_do_governo_do_estado_governo_distrital_ou_governo_municipal'];
    cepDoGovernoDoEstadoGovernoDistritalOuGovernoMunicipal =
    json['cep_do_governo_do_estado_governo_distrital_ou_governo_municipal'];
    nomeCompletoDoRepresentantesuplente =
    json['nome_completo_do_representantesuplente'];
    eMailDoRepresentantesuplente = json['e-mail_do_representantesuplente'];
    cpfDoRepresentantesuplente = json['cpf_do_representantesuplente'];
    sexoDoRepresentantesuplente = json['sexo_do_representantesuplente'];
    concursadoComissionado = json['concursado_comissionado'];
    concursadoComissionadoOutro = json['concursado_comissionado_outro'];
    telefoneDoRepresentantesuplente = json['telefone_do_representantesuplente'];
    celularDoRepresentantesuplente = json['celular_do_representantesuplente'];
    cargoOuFuncaoDoRepresentantesuplente =
    json['cargo_ou_funcao_do_representantesuplente'];
    tempoDeAtuacaoComoGestoraEmMeses =
    json['tempo_de_atuacao_como_gestora_em_meses'];
    escolaridadeOuFormacaoDoRepresentantesuplente =
    json['escolaridade_ou_formacao_do_representantesuplente'];
    nomeDoOrganismoGestor = json['nome_do_organismo_gestor'];
    siglaDoOrganismoGestor = json['sigla_do_organismo_gestor'];
    anoDeCriacaoDoOrganismoGestor = json['ano_de_criacao_do_organismo_gestor'];
    secretariaAQueEstaVinculadoOOrgaoGestor =
    json['secretaria_a_que_esta_vinculado_o_orgao_gestor'];
    naturezaJuridicaDoOrganismoGestor =
    json['natureza_juridica_do_organismo_gestor'];
    naturezaJuridicaDoOrganismoGestorOutro =
    json['natureza_juridica_do_organismo_gestor_outro'];
    esferaDeGovernoDoOrganismoGestor =
    json['esfera_de_governo_do_organismo_gestor'];
    estadoDoOrganismoGestor = json['estado_do_organismo_gestor'];
    cidadeDoOrganismoGestor = json['cidade_do_organismo_gestor'];
    enderecoDoOrganismoGestor = json['endereco_do_organismo_gestor'];
    complementoDoOrganismoGestor = json['complemento_do_organismo_gestor'];
    cepDoOrganismoGestor = json['cep_do_organismo_gestor'];
    telefoneDoOrganismoGestor = json['telefone_do_organismo_gestor'];
    celularDoOrganismoGestor = json['celular_do_organismo_gestor'];
    eMailDoOrganismoGestor = json['e-mail_do_organismo_gestor'];
    websiteDoOrganismoGestor = json['website_do_organismo_gestor'];
    redesSociaisDaUnidade = json['redes_sociais_da_unidade'];
    descricaoDasPoliticasProgramasProjetosEouAcoes =
    json['descricao_das_politicas_programas_projetos_eou_acoes'];
    descricaoDasPoliticasProgramasProjetosEouAcoesEmDestaque = json[
    'descricao_das_politicas_programas_projetos_eou_acoes_em_destaque'];
    descricaoConveniosParaODesenvolvimentoDePoliticasProgramasProjetosEouAcoesDeJuventude =
    json[
    'descricao_convenios_para_o_desenvolvimento_de_politicas_programas_projetos_eou_acoes_de_juventude'];
    descricaoDaEquipe = json['descricao_da_equipe'];
    espacoFisicoDaUnidade = json['espaco_fisico_da_unidade'];
    espacoFisicoDaUnidadeOutro = json['espaco_fisico_da_unidade_outro'];
    estruturasFisicasQuePossui = json['estruturas_fisicas_que_possui'];
    numeroDeEstacoesDeTrabalho = json['numero_de_estacoes_de_trabalho'];
    numeroDeComputadores = json['numero_de_computadores'];
    osRecursosDaUnidadeProvemDe = json['os_recursos_da_unidade_provem_de'];
    osRecursosDaUnidadeProvemDeOutro =
    json['os_recursos_da_unidade_provem_de_outro'];
    orcamentoDisponivelParaOAnoAtualEmReais =
    json['orcamento_disponivel_para_o_ano_atual_em_reais'];
    descricaoDasInstituicoes = json['descricao_das_instituicoes'];
    cidadaniaParticipacaoSocialEPoliticaERepresentacaoJuvenil = json[
    'cidadania_participacao_social_e_politica_e_representacao_juvenil'];
    educacao = json['educacao'];
    profissionalizacaoTrabalhoERenda =
    json['profissionalizacao,_trabalho_e_renda'];
    diversidadeEIgualdade = json['diversidade_e_igualdade'];
    saude = json['saude'];
    cultura = json['cultura'];
    comunicacaoELiberdadeDeExpressao =
    json['comunicacao_e_liberdade_de_expressao'];
    desportoELazer = json['desporto_e_lazer'];
    territorioEMobilidade = json['territorio_e_mobilidade'];
    sustentabilidadeEMeioAmbiente = json['sustentabilidade_e_meio_ambiente'];
    segurancaPublicaEAcessoAJustica =
    json['seguranca_publica_e_acesso_a_justica'];
    nomeCompletoDoPresidenteOuSecretarioa =
    json['nome_completo_do_presidente_ou_secretarioa'];
    eMailDoPresidenteOuSecretarioa =
    json['e-mail_do_presidente_ou_secretarioa'];
    cpfDoPresidenteOuSecretarioa = json['cpf_do_presidente_ou_secretarioa'];
    telefoneDoPresidenteOuSecretarioa =
    json['telefone_do_presidente_ou_secretarioa'];
    celularDoPresidenteOuSecretarioa =
    json['celular_do_presidente_ou_secretarioa'];
    cargoOuFuncaoDoPresidenteOuSecretarioa =
    json['cargo_ou_funcao_do_presidente_ou_secretarioa'];
    escolaridadeOuFormacaoDoPresidenteOuSecretarioa =
    json['escolaridade_ou_formacao_do_presidente_ou_secretarioa'];
    nomeDoConselhoDeJuventude = json['nome_do_conselho_de_juventude'];
    anoDeCriacaoDoConselho = json['ano_de_criacao_do_conselho'];
    esferaDeGovernoDoConselho = json['esfera_de_governo_do_conselho'];
    deQuemFoiAIniciativaParaCriacaoDoConselho =
    json['de_quem_foi_a_iniciativa_para_criacao_do_conselho'];
    deQuemFoiAIniciativaParaCriacaoDoConselhoOutro =
    json['de_quem_foi_a_iniciativa_para_criacao_do_conselho_outro'];
    aInstitucionalizacaoSeDeuAtravesDaNorma =
    json['a_institucionalizacao_se_deu_atraves_da_norma'];
    aInstitucionalizacaoSeDeuAtravesDaNormaOutra =
    json['a_institucionalizacao_se_deu_atraves_da_norma_outra'];
    numeroTotalDeConselheiros = json['numero_total_de_conselheiros'];
    duracaoDoMandatoDosConselheiros =
    json['duracao_do_mandato_dos_conselheiros'];
    duracaoDoMandatoDosConselheirosOutro =
    json['duracao_do_mandato_dos_conselheiros_outro'];
    maneiraQueERealizadaAEleicaoescolhaDosConselheiros =
    json['maneira_que_e_realizada_a_eleicaoescolha_dos_conselheiros'];
    maneiraQueERealizadaAEleicaoescolhaDosConselheirosOutro =
    json['maneira_que_e_realizada_a_eleicaoescolha_dos_conselheiros_outro'];
    caraterDosConselheiros = json['carater_dos_conselheiros'];
    caraterDosConselheirosOutro = json['carater_dos_conselheiros_outro'];
    percentualDoPoderPublico = json['percentual_do_poder_publico'];
    percentualDaSociedadeCivil = json['percentual_da_sociedade_civil'];
    principaisAreasDeAtuacaoDasEntidadesQueParticipamDoConselho = json[
    'principais_areas_de_atuacao_das_entidades_que_participam_do_conselho'];
    estadoDoConselhoDeJuventude = json['estado_do_conselho_de_juventude'];
    cidadeDoConselhoDeJuventude = json['cidade_do_conselho_de_juventude'];
    enderecoDoConselhoDeJuventude = json['endereco_do_conselho_de_juventude'];
    complementoDoConselhoDeJuventude =
    json['complemento_do_conselho_de_juventude'];
    cepDoConselhoDeJuventude = json['cep_do_conselho_de_juventude'];
    telefoneDoConselhoDeJuventude = json['telefone_do_conselho_de_juventude'];
    celularDoConselhoDeJuventude = json['celular_do_conselho_de_juventude'];
    eMailDoConselhoDeJuventude = json['e-mail_do_conselho_de_juventude'];
    websiteDoConselhoDeJuventude = json['website_do_conselho_de_juventude'];
    redesSociaisDoConselhoDeJuventude =
    json['redes_sociais_do_conselho_de_juventude'];
    espacoFisicoDoConselhoDeJuventude =
    json['espaco_fisico_do_conselho_de_juventude'];
    espacoFisicoDoConselhoDeJuventudeOutro =
    json['espaco_fisico_do_conselho_de_juventude_outro'];
    cidadaniaParticipacaoSocialEPoliticaERepresentacaoJuvenil = json[
    'cidadania,_participacao_social_e_politica,_e_representacao_juvenil'];
    historico = json['historico'];
    nomeCompletoDoPresidenteOuSecretario =
    json['nome_completo_do_presidente_ou_secretario'];
    eMailDoPresidenteOuSecretario = json['e-mail_do_presidente_ou_secretario'];
    cpfDoPresidenteOuSecretario = json['cpf_do_presidente_ou_secretario'];
    telefoneDoPresidenteOuSecretario =
    json['telefone_do_presidente_ou_secretario'];
    celularDoPresidenteOuSecretario =
    json['celular_do_presidente_ou_secretario'];
    sexoDoPresidenteOuSecretario = json['sexo_do_presidente_ou_secretario'];
    escolaridadeOuFormacaoDoPresidenteOuSecretario =
    json['escolaridade_ou_formacao_do_presidente_ou_secretario'];
    razaoSocialDaOsc = json['razao_social_da_osc'];
    nomeDaOrganizacao = json['nome_da_organizacao'];
    cnpjDaOsc = json['cnpj_da_osc'];
    anoDeFundacaoDaOsc = json['ano_de_fundacao_da_osc'];
    naturezaJuridicaDaOsc = json['natureza_juridica_da_osc'];
    naturezaJuridicaDaOscOutro = json['natureza_juridica_da_osc_outro'];
    principaisAreasDeAtuacaoDasEntidadesQueParticipamDaOrganizacao = json[
    'principais_areas_de_atuacao_das_entidades_que_participam_da_organizacao'];
    titulacoesECertificacoes = json['titulacoes_e_certificacoes'];
    titulacoesECertificacoesOutra = json['titulacoes_e_certificacoes_outra'];
    estadoDaOrganizacao = json['estado_da_organizacao'];
    cidadeDaOrganizacao = json['cidade_da_organizacao'];
    enderecoDaOrganizacao = json['endereco_da_organizacao'];
    complementoDaOrganizacao = json['complemento_da_organizacao'];
    cepDaOrganizacao = json['cep_da_organizacao'];
    telefoneDaOrganizacao = json['telefone_da_organizacao'];
    celularDaOrganizacao = json['celular_da_organizacao'];
    eMailDaOrganizacao = json['e-mail_da_organizacao'];
    websiteDaOrganizacao = json['website_da_organizacao'];
    redesSociaisDaOrganizacao = json['redes_sociais_da_organizacao'];
    osRecursosDaOrganizacaoProvemDe =
    json['os_recursos_da_organizacao_provem_de'];
    osRecursosDaOrganizacaoProvemDeOutro =
    json['os_recursos_da_organizacao_provem_de_outro'];
    usuario = json['usuario'];
    situacao = json['situacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tipo_de_unidade'] = this.tipoDeUnidade;
    data['nome_completo_do_governadora_ou_prefeitoa'] =
        this.nomeCompletoDoGovernadoraOuPrefeitoa;
    data['e-mail_do_governadora_ou_prefeitoa'] =
        this.eMailDoGovernadoraOuPrefeitoa;
    data['telefone_do_governadora_ou_prefeitoa'] =
        this.telefoneDoGovernadoraOuPrefeitoa;
    data['telefone_do_gabinete_do_governadora_ou_prefeitoa'] =
        this.telefoneDoGabineteDoGovernadoraOuPrefeitoa;
    data['estado_do_governo_do_estado_governo_distrital_ou_governo_municipal'] =
        this.estadoDoGovernoDoEstadoGovernoDistritalOuGovernoMunicipal;
    data['cidade_do_governo_do_estado_governo_distrital_ou_governo_municipal'] =
        this.cidadeDoGovernoDoEstadoGovernoDistritalOuGovernoMunicipal;
    data['endereco_do_governo_do_estado_governo_distrital_ou_governo_municipal'] =
        this.enderecoDoGovernoDoEstadoGovernoDistritalOuGovernoMunicipal;
    data['complemento_do_governo_do_estado_governo_distrital_ou_governo_municipal'] =
        this.complementoDoGovernoDoEstadoGovernoDistritalOuGovernoMunicipal;
    data['cep_do_governo_do_estado_governo_distrital_ou_governo_municipal'] =
        this.cepDoGovernoDoEstadoGovernoDistritalOuGovernoMunicipal;
    data['nome_completo_do_representantesuplente'] =
        this.nomeCompletoDoRepresentantesuplente;
    data['e-mail_do_representantesuplente'] = this.eMailDoRepresentantesuplente;
    data['cpf_do_representantesuplente'] = this.cpfDoRepresentantesuplente;
    data['sexo_do_representantesuplente'] = this.sexoDoRepresentantesuplente;
    data['concursado_comissionado'] = this.concursadoComissionado;
    data['concursado_comissionado_outro'] = this.concursadoComissionadoOutro;
    data['telefone_do_representantesuplente'] =
        this.telefoneDoRepresentantesuplente;
    data['celular_do_representantesuplente'] =
        this.celularDoRepresentantesuplente;
    data['cargo_ou_funcao_do_representantesuplente'] =
        this.cargoOuFuncaoDoRepresentantesuplente;
    data['tempo_de_atuacao_como_gestora_em_meses'] =
        this.tempoDeAtuacaoComoGestoraEmMeses;
    data['escolaridade_ou_formacao_do_representantesuplente'] =
        this.escolaridadeOuFormacaoDoRepresentantesuplente;
    data['nome_do_organismo_gestor'] = this.nomeDoOrganismoGestor;
    data['sigla_do_organismo_gestor'] = this.siglaDoOrganismoGestor;
    data['ano_de_criacao_do_organismo_gestor'] =
        this.anoDeCriacaoDoOrganismoGestor;
    data['secretaria_a_que_esta_vinculado_o_orgao_gestor'] =
        this.secretariaAQueEstaVinculadoOOrgaoGestor;
    data['natureza_juridica_do_organismo_gestor'] =
        this.naturezaJuridicaDoOrganismoGestor;
    data['natureza_juridica_do_organismo_gestor_outro'] =
        this.naturezaJuridicaDoOrganismoGestorOutro;
    data['esfera_de_governo_do_organismo_gestor'] =
        this.esferaDeGovernoDoOrganismoGestor;
    data['estado_do_organismo_gestor'] = this.estadoDoOrganismoGestor;
    data['cidade_do_organismo_gestor'] = this.cidadeDoOrganismoGestor;
    data['endereco_do_organismo_gestor'] = this.enderecoDoOrganismoGestor;
    data['complemento_do_organismo_gestor'] = this.complementoDoOrganismoGestor;
    data['cep_do_organismo_gestor'] = this.cepDoOrganismoGestor;
    data['telefone_do_organismo_gestor'] = this.telefoneDoOrganismoGestor;
    data['celular_do_organismo_gestor'] = this.celularDoOrganismoGestor;
    data['e-mail_do_organismo_gestor'] = this.eMailDoOrganismoGestor;
    data['website_do_organismo_gestor'] = this.websiteDoOrganismoGestor;
    data['redes_sociais_da_unidade'] = this.redesSociaisDaUnidade;
    data['descricao_das_politicas_programas_projetos_eou_acoes'] =
        this.descricaoDasPoliticasProgramasProjetosEouAcoes;
    data['descricao_das_politicas_programas_projetos_eou_acoes_em_destaque'] =
        this.descricaoDasPoliticasProgramasProjetosEouAcoesEmDestaque;
    data['descricao_convenios_para_o_desenvolvimento_de_politicas_programas_projetos_eou_acoes_de_juventude'] =
        this.descricaoConveniosParaODesenvolvimentoDePoliticasProgramasProjetosEouAcoesDeJuventude;
    data['descricao_da_equipe'] = this.descricaoDaEquipe;
    data['espaco_fisico_da_unidade'] = this.espacoFisicoDaUnidade;
    data['espaco_fisico_da_unidade_outro'] = this.espacoFisicoDaUnidadeOutro;
    data['estruturas_fisicas_que_possui'] = this.estruturasFisicasQuePossui;
    data['numero_de_estacoes_de_trabalho'] = this.numeroDeEstacoesDeTrabalho;
    data['numero_de_computadores'] = this.numeroDeComputadores;
    data['os_recursos_da_unidade_provem_de'] = this.osRecursosDaUnidadeProvemDe;
    data['os_recursos_da_unidade_provem_de_outro'] =
        this.osRecursosDaUnidadeProvemDeOutro;
    data['orcamento_disponivel_para_o_ano_atual_em_reais'] =
        this.orcamentoDisponivelParaOAnoAtualEmReais;
    data['descricao_das_instituicoes'] = this.descricaoDasInstituicoes;
    data['cidadania_participacao_social_e_politica_e_representacao_juvenil'] =
        this.cidadaniaParticipacaoSocialEPoliticaERepresentacaoJuvenil;
    data['educacao'] = this.educacao;
    data['profissionalizacao,_trabalho_e_renda'] =
        this.profissionalizacaoTrabalhoERenda;
    data['diversidade_e_igualdade'] = this.diversidadeEIgualdade;
    data['saude'] = this.saude;
    data['cultura'] = this.cultura;
    data['comunicacao_e_liberdade_de_expressao'] =
        this.comunicacaoELiberdadeDeExpressao;
    data['desporto_e_lazer'] = this.desportoELazer;
    data['territorio_e_mobilidade'] = this.territorioEMobilidade;
    data['sustentabilidade_e_meio_ambiente'] =
        this.sustentabilidadeEMeioAmbiente;
    data['seguranca_publica_e_acesso_a_justica'] =
        this.segurancaPublicaEAcessoAJustica;
    data['nome_completo_do_presidente_ou_secretarioa'] =
        this.nomeCompletoDoPresidenteOuSecretarioa;
    data['e-mail_do_presidente_ou_secretarioa'] =
        this.eMailDoPresidenteOuSecretarioa;
    data['cpf_do_presidente_ou_secretarioa'] =
        this.cpfDoPresidenteOuSecretarioa;
    data['telefone_do_presidente_ou_secretarioa'] =
        this.telefoneDoPresidenteOuSecretarioa;
    data['celular_do_presidente_ou_secretarioa'] =
        this.celularDoPresidenteOuSecretarioa;
    data['cargo_ou_funcao_do_presidente_ou_secretarioa'] =
        this.cargoOuFuncaoDoPresidenteOuSecretarioa;
    data['escolaridade_ou_formacao_do_presidente_ou_secretarioa'] =
        this.escolaridadeOuFormacaoDoPresidenteOuSecretarioa;
    data['nome_do_conselho_de_juventude'] = this.nomeDoConselhoDeJuventude;
    data['ano_de_criacao_do_conselho'] = this.anoDeCriacaoDoConselho;
    data['esfera_de_governo_do_conselho'] = this.esferaDeGovernoDoConselho;
    data['de_quem_foi_a_iniciativa_para_criacao_do_conselho'] =
        this.deQuemFoiAIniciativaParaCriacaoDoConselho;
    data['de_quem_foi_a_iniciativa_para_criacao_do_conselho_outro'] =
        this.deQuemFoiAIniciativaParaCriacaoDoConselhoOutro;
    data['a_institucionalizacao_se_deu_atraves_da_norma'] =
        this.aInstitucionalizacaoSeDeuAtravesDaNorma;
    data['a_institucionalizacao_se_deu_atraves_da_norma_outra'] =
        this.aInstitucionalizacaoSeDeuAtravesDaNormaOutra;
    data['numero_total_de_conselheiros'] = this.numeroTotalDeConselheiros;
    data['duracao_do_mandato_dos_conselheiros'] =
        this.duracaoDoMandatoDosConselheiros;
    data['duracao_do_mandato_dos_conselheiros_outro'] =
        this.duracaoDoMandatoDosConselheirosOutro;
    data['maneira_que_e_realizada_a_eleicaoescolha_dos_conselheiros'] =
        this.maneiraQueERealizadaAEleicaoescolhaDosConselheiros;
    data['maneira_que_e_realizada_a_eleicaoescolha_dos_conselheiros_outro'] =
        this.maneiraQueERealizadaAEleicaoescolhaDosConselheirosOutro;
    data['carater_dos_conselheiros'] = this.caraterDosConselheiros;
    data['carater_dos_conselheiros_outro'] = this.caraterDosConselheirosOutro;
    data['percentual_do_poder_publico'] = this.percentualDoPoderPublico;
    data['percentual_da_sociedade_civil'] = this.percentualDaSociedadeCivil;
    data['principais_areas_de_atuacao_das_entidades_que_participam_do_conselho'] =
        this.principaisAreasDeAtuacaoDasEntidadesQueParticipamDoConselho;
    data['estado_do_conselho_de_juventude'] = this.estadoDoConselhoDeJuventude;
    data['cidade_do_conselho_de_juventude'] = this.cidadeDoConselhoDeJuventude;
    data['endereco_do_conselho_de_juventude'] =
        this.enderecoDoConselhoDeJuventude;
    data['complemento_do_conselho_de_juventude'] =
        this.complementoDoConselhoDeJuventude;
    data['cep_do_conselho_de_juventude'] = this.cepDoConselhoDeJuventude;
    data['telefone_do_conselho_de_juventude'] =
        this.telefoneDoConselhoDeJuventude;
    data['celular_do_conselho_de_juventude'] =
        this.celularDoConselhoDeJuventude;
    data['e-mail_do_conselho_de_juventude'] = this.eMailDoConselhoDeJuventude;
    data['website_do_conselho_de_juventude'] =
        this.websiteDoConselhoDeJuventude;
    data['redes_sociais_do_conselho_de_juventude'] =
        this.redesSociaisDoConselhoDeJuventude;
    data['espaco_fisico_do_conselho_de_juventude'] =
        this.espacoFisicoDoConselhoDeJuventude;
    data['espaco_fisico_do_conselho_de_juventude_outro'] =
        this.espacoFisicoDoConselhoDeJuventudeOutro;
    data['cidadania,_participacao_social_e_politica,_e_representacao_juvenil'] =
        this.cidadaniaParticipacaoSocialEPoliticaERepresentacaoJuvenil;
    data['historico'] = this.historico;
    data['nome_completo_do_presidente_ou_secretario'] =
        this.nomeCompletoDoPresidenteOuSecretario;
    data['e-mail_do_presidente_ou_secretario'] =
        this.eMailDoPresidenteOuSecretario;
    data['cpf_do_presidente_ou_secretario'] = this.cpfDoPresidenteOuSecretario;
    data['telefone_do_presidente_ou_secretario'] =
        this.telefoneDoPresidenteOuSecretario;
    data['celular_do_presidente_ou_secretario'] =
        this.celularDoPresidenteOuSecretario;
    data['sexo_do_presidente_ou_secretario'] =
        this.sexoDoPresidenteOuSecretario;
    data['escolaridade_ou_formacao_do_presidente_ou_secretario'] =
        this.escolaridadeOuFormacaoDoPresidenteOuSecretario;
    data['razao_social_da_osc'] = this.razaoSocialDaOsc;
    data['nome_da_organizacao'] = this.nomeDaOrganizacao;
    data['cnpj_da_osc'] = this.cnpjDaOsc;
    data['ano_de_fundacao_da_osc'] = this.anoDeFundacaoDaOsc;
    data['natureza_juridica_da_osc'] = this.naturezaJuridicaDaOsc;
    data['natureza_juridica_da_osc_outro'] = this.naturezaJuridicaDaOscOutro;
    data['principais_areas_de_atuacao_das_entidades_que_participam_da_organizacao'] =
        this.principaisAreasDeAtuacaoDasEntidadesQueParticipamDaOrganizacao;
    data['titulacoes_e_certificacoes'] = this.titulacoesECertificacoes;
    data['titulacoes_e_certificacoes_outra'] =
        this.titulacoesECertificacoesOutra;
    data['estado_da_organizacao'] = this.estadoDaOrganizacao;
    data['cidade_da_organizacao'] = this.cidadeDaOrganizacao;
    data['endereco_da_organizacao'] = this.enderecoDaOrganizacao;
    data['complemento_da_organizacao'] = this.complementoDaOrganizacao;
    data['cep_da_organizacao'] = this.cepDaOrganizacao;
    data['telefone_da_organizacao'] = this.telefoneDaOrganizacao;
    data['celular_da_organizacao'] = this.celularDaOrganizacao;
    data['e-mail_da_organizacao'] = this.eMailDaOrganizacao;
    data['website_da_organizacao'] = this.websiteDaOrganizacao;
    data['redes_sociais_da_organizacao'] = this.redesSociaisDaOrganizacao;
    data['os_recursos_da_organizacao_provem_de'] =
        this.osRecursosDaOrganizacaoProvemDe;
    data['os_recursos_da_organizacao_provem_de_outro'] =
        this.osRecursosDaOrganizacaoProvemDeOutro;
    data['usuario'] = this.usuario;
    data['situacao'] = this.situacao;
    return data;
  }

  void save() {
    Map map = toJson();
    String json = convert.json.encode(map);
    Prefs.setString("adesao.prefs", json);
  }

  static Future<Adesao> get() async {
    String json = await Prefs.getString("adesao.prefs");
    if (json.isEmpty) {
      return null;
    }
    Map map = convert.json.decode(json);
    Adesao adesao = Adesao.fromJson(map);
    return adesao;
  }

  static void clear() {
    Prefs.setString("adesao.prefs", "");
  }
}
