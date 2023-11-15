/* Logico_v1_ViagensBSI: */

CREATE TABLE SOLICITACAO_VIAGEM (
    id integer,
    nome vachar(150),
    orcamento_minimo decimal,
    data_partida date,
    data_retorno date,
    descricao_preferencias_passeio text,
    descricao_preferencias_voo text,
    descricao_preferencias_hospedagem text,
    descricao_perfil_grupo text,
    orcamento_maximo decimal,
    id_cidade_origem integer,
    id_cidade_destino integer,
    id_cliente_responsavel integer
);

CREATE TABLE PACOTE_VIAGEM (
    id integer,
    foi_escolhido boolean,
    id_solicitacao_viagem integer
);

CREATE TABLE EMPRESA (
    id integer,
    razao_social varchar(255),
    nome_fantasia varchar(255),
    cnpj varchar(20),
    id_ramo_empresa integer,
    id_endereco integer
);

CREATE TABLE RESERVA_QUARTO (
    id integer,
    numero_quarto varchar(255),
    data_checkin DATE,
    hora_checkin TIME,
    valor_diaria DECIMAL,
    previsao_dias_hospedagem INTEGER,
    data_previsao_checkout DATE,
    hora_previsao_checkout TIME,
    id_pacote_viagem integer,
    id_hospedaria integer
);

CREATE TABLE HOSPEDARIA (
    descricao text,
    numero_estrelas integer,
    link_website varchar(255),
    id integer
);

CREATE TABLE TIPO_VEICULO (
    id integer,
    descricao VARCHAR(200)
);

CREATE TABLE RAMO_EMPRESA (
    id integer,
    descricao varchar(255)
);

CREATE TABLE RESERVA_VEICULO (
    id INTEGER,
    numero_veiculo VARCHAR(255),
    placa_veiculo vachar(255),
    preco_diaria DECIMAL,
    data_inicio DATE,
    hora_inicio TIME,
    previsao_dias_aluguel INTEGER,
    data_previsao_entrega DATE,
    hora_previsao_entrega TIME,
    id_pacote_viagem integer,
    id_tipo_veiculo integer
);

CREATE TABLE PASSEIO (
    id integer,
    nome vachar(255),
    descricao text,
    id_endereco integer
);

CREATE TABLE ENDERECO (
    id integer,
    logradouro varchar(255),
    numero integer,
    complemento varchar(255),
    cep varchar(8),
    id_cidade integer
);

CREATE TABLE CIDADE (
    id integer,
    nome vachar(150),
    id_estado integer
);

CREATE TABLE ESTADO (
    id integer,
    nome varchar(100),
    sigla varchar(5)
);

CREATE TABLE BENEFICIO_HOSPEDAGEM (
    id integer,
    nome varchar(255)
);

CREATE TABLE CLASSE (
    id integer,
    descricao vachar(100)
);

CREATE TABLE PASSAGEM_AEREA (
    id integer,
    numero_voo varchar(255),
    numero_passagem varchar(255),
    numero_assento vachar(255),
    horario_decolagem time,
    horario_pouso time,
    id_classe integer,
    id_cliente_titular integer,
    id_companhia_aerea integer,
    id_aeroporto_origem integer,
    id_aeroporto_destino integer
);

CREATE TABLE TIPO_DOCUMENTO (
    id integer,
    descricao varchar(20)
);

CREATE TABLE TIPO_NECESSIDADE_ESPECIAL (
    descricao vachar(150),
    id integer
);

CREATE TABLE CLIENTE (
    data_nascimento date,
    nome_social vachar(150),
    nome_registro vachar(150),
    id integer
);

CREATE TABLE TIPO_CONTATO (
    descricao varchar(100),
    id integer
);

CREATE TABLE STATUS (
    id integer,
    descricao varchar(40)
);

CREATE TABLE PAGAMENTO (
    id INTEGER,
    valor decimal,
    desconto decimal,
    qtd_parcelas integer,
    data_hora_pagamento datetime,
    id_metodo_pagamento integer,
    id_pacote_viagem integer,
    id integer,
    data_hora_fechamento datetime
);

CREATE TABLE METODO_PAGAMENTO (
    id integer,
    descricao varchar(70)
);

CREATE TABLE AEROPORTO (
    id integer,
    codigo varchar(3)
);

CREATE TABLE EMPRESA_VEICULO (
    id_empresa integer,
    id_tipo_veiculo integer
);

CREATE TABLE BENEFICIO_HOSPEDARIA (
    id_hospedaria integer,
    id_beneficio_hospedagem integer
);

CREATE TABLE EMPRESA_PASSEIO (
    id_passeio integer,
    id_empresa integer,
    preco decimal
);

CREATE TABLE PASSAGEM_AEREA_VIAGEM (
    id_pacote_viagem integer,
    id_passagem_aerea integer
);

CREATE TABLE DOCUMENTO_CLIENTE (
    id_tipo_documento integer,
    id_cliente integer,
    numero_documento varchar(20)
);

CREATE TABLE NECESSIDADE_ESPECIAL_CLIENTE (
    id_cliente integer,
    id_necessidade_especial integer
);

CREATE TABLE CONTATO_CLIENTE_RESPONSAVEL (
    id_tipo_contato integer,
    id_cliente integer,
    descricao varchar(100)
);

CREATE TABLE AGENDA_PASSEIO_VIAGEM (
    id_pacote_viagem integer,
    id_passeio integer,
    hora time,
    data date
);

CREATE TABLE CONTATO_EMPRESA (
    id_tipo_contato integer,
    id_empresa integer,
    descricao varchar(150)
);

CREATE TABLE ACOMPANHANTE_VIAGEM (
    id_cliente integer,
    id_solicitacao_viagem integer
);

CREATE TABLE SITUACAO_ATENDIMENTO (
    id_solicitacao_viagem integer,
    id_status integer,
    data_hora_mudanca datetime
);

CREATE TABLE PROCURA_VEICULO_VIAGEM (
    id_tipo_veiculo integer,
    id_solicitacao_viagem integer
);
 
ALTER TABLE EMPRESA ADD CONSTRAINT FK_EMPRESA_1
    FOREIGN KEY (nome_fantasia)
    REFERENCES ??? (???);
 
ALTER TABLE ENDERECO ADD CONSTRAINT FK_ENDERECO_1
    FOREIGN KEY (numero)
    REFERENCES ??? (???);