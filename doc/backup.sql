-- Logico_v2_ViagensBSI:

BEGIN;

CREATE TABLE SOLICITACAO_VIAGEM (
    id SERIAL UNIQUE NOT NULL,
    nome VARCHAR(150),
    orcamento_minimo DECIMAL,
    data_partida DATE,
    data_retorno DATE,
    descricao_preferencias_passeio TEXT,
    descricao_preferencias_voo TEXT,
    descricao_preferencias_hospedagem TEXT,
    descricao_perfil_grupo TEXT,
    orcamento_maximo DECIMAL,
    id_cidade_origem INTEGER,
    id_cidade_destino INTEGER,
    id_cliente_responsavel INTEGER
);

CREATE TABLE PACOTE_VIAGEM (
    id SERIAL UNIQUE NOT NULL,
    foi_escolhido BOOLEAN DEFAULT false NOT NULL,
    id_solicitacao_viagem INTEGER NOT NULL
);

CREATE TABLE EMPRESA (
    id SERIAL NOT NULL UNIQUE,
    razao_social VARCHAR(255) NOT NULL,
    nome_fantasia VARCHAR(255),
    cnpj VARCHAR(14) NOT NULL UNIQUE,
    id_ramo_empresa INTEGER NOT NULL,
    id_endereco INTEGER
);

CREATE TABLE RESERVA_QUARTO (
    id SERIAL UNIQUE NOT NULL,
    numero_quarto VARCHAR(255),
    data_checkin DATE,
    hora_checkin TIME,
    previsao_dias_hospedagem INTEGER,
    data_previsao_checkout DATE,
    hora_previsao_checkout TIME,
    valor_diaria DECIMAL,
    id_pacote_viagem INTEGER,
    id_hospedaria INTEGER
);

CREATE TABLE HOSPEDARIA (
    id SERIAL UNIQUE NOT NULL,
    descricao TEXT,
    numero_estrelas INTEGER,
    link_website VARCHAR(255)
);

CREATE TABLE TIPO_VEICULO (
    id SERIAL NOT NULL UNIQUE,
    descricao VARCHAR(200) NOT NULL UNIQUE
);

CREATE TABLE RAMO_EMPRESA (
    id SERIAL NOT NULL UNIQUE,
    descricao VARCHAR(255) NOT NULL UNIQUE,
    UNIQUE (descricao, id)
);

CREATE TABLE RESERVA_VEICULO (
    id SERIAL UNIQUE NOT NULL,
    numero_veiculo VARCHAR(255),
    placa_veiculo VARCHAR(255),
    preco_diaria DECIMAL,
    data_inicio DATE,
    hora_inicio TIME,
    previsao_dias_aluguel INTEGER,
    data_previsao_entrega DATE,
    hora_previsao_entrega TIME,
    id_pacote_viagem INTEGER,
    id_tipo_veiculo INTEGER,
    id_empresa_locadora INTEGER
);

CREATE TABLE PASSEIO (
    id SERIAL NOT NULL UNIQUE,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    id_endereco INTEGER
);

CREATE TABLE ENDERECO (
    id SERIAL NOT NULL UNIQUE,
    logradouro VARCHAR(255),
    numero INTEGER,
    complemento VARCHAR(255),
    cep VARCHAR(8),
    id_cidade INTEGER NOT NULL
);

CREATE TABLE CIDADE (
    id SERIAL NOT NULL UNIQUE,
    nome VARCHAR(150) NOT NULL,
    id_estado INTEGER NOT NULL
);

CREATE TABLE ESTADO (
    id SERIAL UNIQUE NOT NULL,
    nome VARCHAR(100),
    sigla VARCHAR(5) UNIQUE
);

CREATE TABLE BENEFICIO_HOSPEDAGEM (
    id SERIAL NOT NULL UNIQUE,
    nome VARCHAR(255) NOT NULL UNIQUE,
    UNIQUE (nome, id)
);

CREATE TABLE PASSAGEM_AEREA (
    id SERIAL NOT NULL UNIQUE,
    numero_voo VARCHAR(255),
    numero_passagem VARCHAR(255) UNIQUE,
    numero_assento VARCHAR(255),
    data_decolagem DATE,
    horario_decolagem TIME,
    data_pouso DATE,
    horario_pouso TIME,
    id_cliente_titular INTEGER,
    id_companhia_aerea INTEGER
);

CREATE TABLE TIPO_DOCUMENTO (
    id SERIAL NOT NULL UNIQUE,
    descricao VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE TIPO_NECESSIDADE_ESPECIAL (
    id SERIAL NOT NULL UNIQUE,
    descricao VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE CLIENTE (
    id SERIAL NOT NULL UNIQUE,
    data_nascimento DATE,
    nome_social VARCHAR(150) NOT NULL,
    nome_registro VARCHAR(150) 
);

CREATE TABLE TIPO_CONTATO (
    id SERIAL NOT NULL UNIQUE,
    descricao VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE STATUS (
    id SERIAL NOT NULL UNIQUE,
    descricao VARCHAR(40) NOT NULL UNIQUE,
    UNIQUE (descricao, id)
);

CREATE TABLE PAGAMENTO (
    id SERIAL NOT NULL UNIQUE,
    valor DECIMAL NOT NULL,
    desconto DECIMAL,
    qtd_parcelas INTEGER DEFAULT 1,
    data_hora_pagamento TIMESTAMP,
    id_metodo_pagamento INTEGER NOT NULL,
    id_pacote_viagem INTEGER NOT NULL
);

CREATE TABLE METODO_PAGAMENTO (
    id SERIAL NOT NULL UNIQUE,
    descricao VARCHAR(70) NOT NULL UNIQUE
);

CREATE TABLE EMPRESA_VEICULO (
    id_empresa INTEGER NOT NULL,
    id_tipo_veiculo INTEGER NOT NULL
);

CREATE TABLE BENEFICIO_HOSPEDARIA (
    id_hospedaria INTEGER NOT NULL,
    id_beneficio_hospedagem INTEGER NOT NULL
);

CREATE TABLE EMPRESA_PASSEIO (
    id_passeio INTEGER NOT NULL,
    id_empresa INTEGER NOT NULL,
    preco DECIMAL
);

CREATE TABLE PASSAGEM_AEREA_VIAGEM (
    id_pacote_viagem INTEGER NOT NULL,
    id_passagem_aerea INTEGER NOT NULL
);

CREATE TABLE DOCUMENTO_CLIENTE (
    id_tipo_documento INTEGER NOT NULL,
    id_cliente INTEGER NOT NULL,
    numero_documento VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE NECESSIDADE_ESPECIAL_CLIENTE (
    id_cliente INTEGER NOT NULL,
    id_necessidade_especial INTEGER NOT NULL
);

CREATE TABLE CONTATO_CLIENTE_RESPONSAVEL (
    id_tipo_contato INTEGER NOT NULL,
    id_cliente INTEGER NOT NULL,
    descricao VARCHAR(100) NOT NULL
);

CREATE TABLE AGENDA_PASSEIO_VIAGEM (
    id_pacote_viagem INTEGER NOT NULL,
    id_passeio INTEGER NOT NULL,
    hora TIME,
    data DATE
);

CREATE TABLE CONTATO_EMPRESA (
    id_tipo_contato INTEGER NOT NULL,
    id_empresa INTEGER NOT NULL,
    descricao VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE ACOMPANHANTE_VIAGEM (
    id_cliente INTEGER NOT NULL,
    id_solicitacao_viagem INTEGER NOT NULL
);

CREATE TABLE SITUACAO_ATENDIMENTO (
    id_solicitacao_viagem INTEGER NOT NULL,
    id_status INTEGER NOT NULL,
    data_hora_mudanca TIMESTAMP NOT NULL
);

CREATE TABLE PROCURA_VEICULO_VIAGEM (
    id_tipo_veiculo INTEGER NOT NULL,
    id_solicitacao_viagem INTEGER NOT NULL
);

-- Adicionando as constraints para a tabela SOLICITACAO_VIAGEM
ALTER TABLE SOLICITACAO_VIAGEM ADD CONSTRAINT PK_SOLICITACAO_VIAGEM
    PRIMARY KEY (id);

ALTER TABLE SOLICITACAO_VIAGEM ADD CONSTRAINT FK_SOLICITACAO_VIAGEM_CIDADE_ORIGEM
    FOREIGN KEY (id_cidade_origem)
    REFERENCES CIDADE (id);

ALTER TABLE SOLICITACAO_VIAGEM ADD CONSTRAINT FK_SOLICITACAO_VIAGEM_CIDADE_DESTINO
    FOREIGN KEY (id_cidade_destino)
    REFERENCES CIDADE (id);

ALTER TABLE SOLICITACAO_VIAGEM ADD CONSTRAINT FK_SOLICITACAO_VIAGEM_CLIENTE_RESPONSAVEL
    FOREIGN KEY (id_cliente_responsavel)
    REFERENCES CLIENTE (id);

-- Adicionando as constraints para a tabela PACOTE_VIAGEM
ALTER TABLE PACOTE_VIAGEM ADD CONSTRAINT PK_PACOTE_VIAGEM
    PRIMARY KEY (id);

ALTER TABLE PACOTE_VIAGEM ADD CONSTRAINT FK_PACOTE_VIAGEM_SOLICITACAO_VIAGEM
    FOREIGN KEY (id_solicitacao_viagem)
    REFERENCES SOLICITACAO_VIAGEM (id);

-- Adicionando as constraints para a tabela EMPRESA
ALTER TABLE EMPRESA ADD CONSTRAINT PK_EMPRESA
    PRIMARY KEY (id);

ALTER TABLE EMPRESA ADD CONSTRAINT FK_EMPRESA_RAMO_EMPRESA
    FOREIGN KEY (id_ramo_empresa)
    REFERENCES RAMO_EMPRESA (id);

ALTER TABLE EMPRESA ADD CONSTRAINT FK_EMPRESA_ENDERECO
    FOREIGN KEY (id_endereco)
    REFERENCES ENDERECO (id);

-- Adicionando as constraints para a tabela RESERVA_QUARTO
ALTER TABLE RESERVA_QUARTO ADD CONSTRAINT PK_RESERVA_QUARTO
    PRIMARY KEY (id);

ALTER TABLE RESERVA_QUARTO ADD CONSTRAINT FK_RESERVA_QUARTO_PACOTE_VIAGEM
    FOREIGN KEY (id_pacote_viagem)
    REFERENCES PACOTE_VIAGEM (id);

ALTER TABLE RESERVA_QUARTO ADD CONSTRAINT FK_RESERVA_QUARTO_HOSPEDARIA
    FOREIGN KEY (id_hospedaria)
    REFERENCES HOSPEDARIA (id);

-- Adicionando as constraints para a tabela HOSPEDARIA
ALTER TABLE HOSPEDARIA ADD CONSTRAINT PK_HOSPEDARIA
    PRIMARY KEY (id);

-- Adicionando as constraints para a tabela TIPO_VEICULO
ALTER TABLE TIPO_VEICULO ADD CONSTRAINT PK_TIPO_VEICULO
    PRIMARY KEY (id);

-- Adicionando as constraints para a tabela RAMO_EMPRESA
ALTER TABLE RAMO_EMPRESA ADD CONSTRAINT PK_RAMO_EMPRESA
    PRIMARY KEY (id);

-- Adicionando as constraints para a tabela RESERVA_VEICULO
ALTER TABLE RESERVA_VEICULO ADD CONSTRAINT PK_RESERVA_VEICULO
    PRIMARY KEY (id);

ALTER TABLE RESERVA_VEICULO ADD CONSTRAINT FK_RESERVA_VEICULO_PACOTE_VIAGEM
    FOREIGN KEY (id_pacote_viagem)
    REFERENCES PACOTE_VIAGEM (id);

ALTER TABLE RESERVA_VEICULO ADD CONSTRAINT FK_RESERVA_VEICULO_TIPO_VEICULO
    FOREIGN KEY (id_tipo_veiculo)
    REFERENCES TIPO_VEICULO (id);

ALTER TABLE RESERVA_VEICULO ADD CONSTRAINT FK_RESERVA_VEICULO_EMPRESA
    FOREIGN KEY (id_empresa_locadora)
    REFERENCES EMPRESA (id);

-- Adicionando as constraints para a tabela PASSEIO
ALTER TABLE PASSEIO ADD CONSTRAINT PK_PASSEIO
    PRIMARY KEY (id);

ALTER TABLE PASSEIO ADD CONSTRAINT FK_PASSEIO_ENDERECO
    FOREIGN KEY (id_endereco)
    REFERENCES ENDERECO (id);

-- Adicionando as constraints para a tabela ENDERECO
ALTER TABLE ENDERECO ADD CONSTRAINT PK_ENDERECO
    PRIMARY KEY (id);

ALTER TABLE ENDERECO ADD CONSTRAINT FK_ENDERECO_CIDADE
    FOREIGN KEY (id_cidade)
    REFERENCES CIDADE (id);

-- Adicionando as constraints para a tabela CIDADE
ALTER TABLE CIDADE ADD CONSTRAINT PK_CIDADE
    PRIMARY KEY (id);

ALTER TABLE CIDADE ADD CONSTRAINT FK_CIDADE_ESTADO
    FOREIGN KEY (id_estado)
    REFERENCES ESTADO (id);

-- Adicionando as constraints para a tabela ESTADO
ALTER TABLE ESTADO ADD CONSTRAINT PK_ESTADO
    PRIMARY KEY (id);

-- Adicionando as constraints para a tabela BENEFICIO_HOSPEDAGEM
ALTER TABLE BENEFICIO_HOSPEDAGEM ADD CONSTRAINT PK_BENEFICIO_HOSPEDAGEM
    PRIMARY KEY (id);

-- Adicionando as constraints para a tabela PASSAGEM_AEREA
ALTER TABLE PASSAGEM_AEREA ADD CONSTRAINT PK_PASSAGEM_AEREA
    PRIMARY KEY (id);

ALTER TABLE PASSAGEM_AEREA ADD CONSTRAINT FK_PASSAGEM_AEREA_CLIENTE_TITULAR
    FOREIGN KEY (id_cliente_titular)
    REFERENCES CLIENTE (id);

ALTER TABLE PASSAGEM_AEREA ADD CONSTRAINT FK_PASSAGEM_AEREA_COMPANHIA_AEREA
    FOREIGN KEY (id_companhia_aerea)
    REFERENCES EMPRESA (id);

-- Adicionando as constraints para a tabela TIPO_DOCUMENTO
ALTER TABLE TIPO_DOCUMENTO ADD CONSTRAINT PK_TIPO_DOCUMENTO
    PRIMARY KEY (id);

-- Adicionando as constraints para a tabela TIPO_NECESSIDADE_ESPECIAL
ALTER TABLE TIPO_NECESSIDADE_ESPECIAL ADD CONSTRAINT PK_TIPO_NECESSIDADE_ESPECIAL
    PRIMARY KEY (id);

-- Adicionando as constraints para a tabela CLIENTE
ALTER TABLE CLIENTE ADD CONSTRAINT PK_CLIENTE
    PRIMARY KEY (id);

-- Adicionando as constraints para a tabela TIPO_CONTATO
ALTER TABLE TIPO_CONTATO ADD CONSTRAINT PK_TIPO_CONTATO
    PRIMARY KEY (id);
    
-- Adicionando as constraints para a tabela STATUS
ALTER TABLE STATUS ADD CONSTRAINT PK_STATUS
    PRIMARY KEY (id);

-- Adicionando as constraints para a tabela PAGAMENTO
ALTER TABLE PAGAMENTO ADD CONSTRAINT PK_PAGAMENTO
    PRIMARY KEY (id);

ALTER TABLE PAGAMENTO ADD CONSTRAINT FK_PAGAMENTO_METODO_PAGAMENTO
    FOREIGN KEY (id_metodo_pagamento)
    REFERENCES METODO_PAGAMENTO (id);

ALTER TABLE PAGAMENTO ADD CONSTRAINT FK_PAGAMENTO_PACOTE_VIAGEM
    FOREIGN KEY (id_pacote_viagem)
    REFERENCES PACOTE_VIAGEM (id);

-- Adicionando as constraints para a tabela METODO_PAGAMENTO
ALTER TABLE METODO_PAGAMENTO ADD CONSTRAINT PK_METODO_PAGAMENTO
    PRIMARY KEY (id);
    
-- Adicionando as constraints para a tabela EMPRESA_VEICULO
ALTER TABLE EMPRESA_VEICULO ADD CONSTRAINT FK_EMPRESA_VEICULO_EMPRESA
    FOREIGN KEY (id_empresa)
    REFERENCES EMPRESA (id);

ALTER TABLE EMPRESA_VEICULO ADD CONSTRAINT FK_EMPRESA_VEICULO_TIPO_VEICULO
    FOREIGN KEY (id_tipo_veiculo)
    REFERENCES TIPO_VEICULO (id);

-- Adicionando as constraints para a tabela BENEFICIO_HOSPEDARIA
ALTER TABLE BENEFICIO_HOSPEDARIA ADD CONSTRAINT FK_Oferece_HOSPEDARIA
    FOREIGN KEY (id_hospedaria)
    REFERENCES HOSPEDARIA (id);

ALTER TABLE BENEFICIO_HOSPEDARIA ADD CONSTRAINT FK_Oferece_BENEFICIO_HOSPEDAGEM
    FOREIGN KEY (id_beneficio_hospedagem)
    REFERENCES BENEFICIO_HOSPEDAGEM (id);

-- Adicionando as constraints para a tabela EMPRESA_PASSEIO
ALTER TABLE EMPRESA_PASSEIO ADD CONSTRAINT FK_EMPRESA_PASSEIO_PASSEIO
    FOREIGN KEY (id_passeio)
    REFERENCES PASSEIO (id);

ALTER TABLE EMPRESA_PASSEIO ADD CONSTRAINT FK_EMPRESA_PASSEIO_EMPRESA
    FOREIGN KEY (id_empresa)
    REFERENCES EMPRESA (id);
    
-- Adicionando as constraints para a tabela PASSAGEM_AEREA_VIAGEM
ALTER TABLE PASSAGEM_AEREA_VIAGEM ADD CONSTRAINT FK_PASSAGEM_AEREA_VIAGEM_PACOTE_VIAGEM
    FOREIGN KEY (id_pacote_viagem)
    REFERENCES PACOTE_VIAGEM (id);

ALTER TABLE PASSAGEM_AEREA_VIAGEM ADD CONSTRAINT FK_PASSAGEM_AEREA_VIAGEM_PASSAGEM_AEREA
    FOREIGN KEY (id_passagem_aerea)
    REFERENCES PASSAGEM_AEREA (id);

-- Adicionando as constraints para a tabela DOCUMENTO_CLIENTE
ALTER TABLE DOCUMENTO_CLIENTE ADD CONSTRAINT FK_DOCUMENTO_CLIENTE_TIPO_DOCUMENTO
    FOREIGN KEY (id_tipo_documento)
    REFERENCES TIPO_DOCUMENTO (id);

ALTER TABLE DOCUMENTO_CLIENTE ADD CONSTRAINT FK_DOCUMENTO_CLIENTE_CLIENTE
    FOREIGN KEY (id_cliente)
    REFERENCES CLIENTE (id);

-- Adicionando as constraints para a tabela NECESSIDADE_ESPECIAL_CLIENTE
ALTER TABLE NECESSIDADE_ESPECIAL_CLIENTE ADD CONSTRAINT FK_NECESSIDADE_ESPECIAL_CLIENTE_CLIENTE
    FOREIGN KEY (id_cliente)
    REFERENCES CLIENTE (id);

ALTER TABLE NECESSIDADE_ESPECIAL_CLIENTE ADD CONSTRAINT FK_NECESSIDADE_ESPECIAL_CLIENTE_NECESSIDADE_ESPECIAL
    FOREIGN KEY (id_necessidade_especial)
    REFERENCES TIPO_NECESSIDADE_ESPECIAL (id);

-- Adicionando as constraints para a tabela CONTATO_CLIENTE_RESPONSAVEL
ALTER TABLE CONTATO_CLIENTE_RESPONSAVEL ADD CONSTRAINT FK_CONTATO_CLIENTE_RESPONSAVEL_TIPO_CONTATO
    FOREIGN KEY (id_tipo_contato)
    REFERENCES TIPO_CONTATO (id);

ALTER TABLE CONTATO_CLIENTE_RESPONSAVEL ADD CONSTRAINT FK_CONTATO_CLIENTE_RESPONSAVEL_CLIENTE
    FOREIGN KEY (id_cliente)
    REFERENCES CLIENTE (id);
    
-- Adicionando as constraints para a tabela AGENDA_PASSEIO_VIAGEM
ALTER TABLE AGENDA_PASSEIO_VIAGEM ADD CONSTRAINT FK_AGENDA_PASSEIO_VIAGEM_PACOTE_VIAGEM
    FOREIGN KEY (id_pacote_viagem)
    REFERENCES PACOTE_VIAGEM (id);

ALTER TABLE AGENDA_PASSEIO_VIAGEM ADD CONSTRAINT FK_AGENDA_PASSEIO_VIAGEM_PASSEIO
    FOREIGN KEY (id_passeio)
    REFERENCES PASSEIO (id);

-- Adicionando as constraints para a tabela CONTATO_EMPRESA
ALTER TABLE CONTATO_EMPRESA ADD CONSTRAINT FK_CONTATO_EMPRESA_TIPO_CONTATO
    FOREIGN KEY (id_tipo_contato)
    REFERENCES TIPO_CONTATO (id);

ALTER TABLE CONTATO_EMPRESA ADD CONSTRAINT FK_CONTATO_EMPRESA_EMPRESA
    FOREIGN KEY (id_empresa)
    REFERENCES EMPRESA (id);

-- Adicionando as constraints para a tabela ACOMPANHANTE_VIAGEM
ALTER TABLE ACOMPANHANTE_VIAGEM ADD CONSTRAINT FK_ACOMPANHANTE_VIAGEM_CLIENTE
    FOREIGN KEY (id_cliente)
    REFERENCES CLIENTE (id);

ALTER TABLE ACOMPANHANTE_VIAGEM ADD CONSTRAINT FK_ACOMPANHANTE_VIAGEM_SOLICITACAO_VIAGEM
    FOREIGN KEY (id_solicitacao_viagem)
    REFERENCES SOLICITACAO_VIAGEM (id);

-- Adicionando as constraints para a tabela SITUACAO_ATENDIMENTO
ALTER TABLE SITUACAO_ATENDIMENTO ADD CONSTRAINT FK_SITUACAO_ATENDIMENTO_SOLICITACAO_VIAGEM
    FOREIGN KEY (id_solicitacao_viagem)
    REFERENCES SOLICITACAO_VIAGEM (id);

ALTER TABLE SITUACAO_ATENDIMENTO ADD CONSTRAINT FK_SITUACAO_ATENDIMENTO_STATUS
    FOREIGN KEY (id_status)
    REFERENCES STATUS (id);

-- Adicionando as constraints para a tabela PROCURA_VEICULO_VIAGEM
ALTER TABLE PROCURA_VEICULO_VIAGEM ADD CONSTRAINT FK_PROCURA_VEICULO_VIAGEM_TIPO_VEICULO
    FOREIGN KEY (id_tipo_veiculo)
    REFERENCES TIPO_VEICULO (id);

ALTER TABLE PROCURA_VEICULO_VIAGEM ADD CONSTRAINT FK_PROCURA_VEICULO_VIAGEM_SOLICITACAO_VIAGEM
    FOREIGN KEY (id_solicitacao_viagem)
    REFERENCES SOLICITACAO_VIAGEM (id);

-- Backup dados estaticos do banco

INSERT INTO TIPO_VEICULO (id, descricao) VALUES
(1, 'Bicicleta'),
(2, 'Caminhonete'),
(3, 'Carro automático'),
(4, 'Carro básico econômico com ar condicionado'),
(5, 'Carro básico econômico sem ar condicionado'),
(6, 'Carro blindado'),
(7, 'Carro compacto'),
(8, 'Carro de luxo'),
(9, 'Carro esportivo'),
(10, 'Carro executivo'),
(11, 'Carro familiar'),
(12, 'Carro utilitário'),
(13, 'Minivan'),
(14, 'Motocicleta'),
(15, 'Pickup'),
(16, 'Quadriciclo'),
(17, 'Triciclo'),
(18, 'Van'),
(19, 'Vespa');

INSERT INTO RAMO_EMPRESA (id, descricao) VALUES
(1, 'Aluguel de veículos'),
(2, 'Hotelaria'),
(3, 'Transporte aéreo de passageiros'),
(4, 'Turismo');

INSERT INTO TIPO_DOCUMENTO (id, descricao) VALUES
(1, 'Carteira de Trabalho'),
(2, 'Certidão de Nascimento'),
(3, 'CNH'),
(4, 'CPF'),
(5, 'Passaporte'),
(6, 'RG');

INSERT INTO TIPO_CONTATO (id, descricao) VALUES
(1, 'E-mail'),
(2, 'Facebook'),
(3, 'Instagram'),
(4, 'Telefone celular'),
(5, 'Telefone fixo'),
(6, 'Tiktok'),
(7, 'Twitter');

INSERT INTO STATUS (id, descricao) VALUES
(1, 'Arranjo de propostas'),
(2, 'Em análise'),
(3, 'Finalizada'),
(4, 'Novo'),
(5, 'Perdida'),
(6, 'Propostas enviadas');

INSERT INTO METODO_PAGAMENTO (id, descricao) VALUES
(1, 'Ame Digital'),
(2, 'Cartão de crédito'),
(3, 'Cartão de débito'),
(4, 'Dinheiro'),
(5, 'DOC'),
(6, 'Paypal'),
(7, 'Picpay'),
(8, 'Pix'),
(9, 'TED');

-- Inserir dados na tabela ESTADO
INSERT INTO ESTADO (id, nome, sigla) VALUES
(1, 'Rio de Janeiro', 'RJ'),
(2, 'Santa Catarina', 'SC'),
(3, 'Bahia', 'BA'),
(4, 'São Paulo', 'SP'),
(5, 'Paraná', 'PR'),
(6, 'Pernambuco', 'PE'),
(7, 'Ceará', 'CE'),
(8, 'Amazonas', 'AM'),
(9, 'Rio Grande do Sul', 'RS'),
(10, 'Rio Grande do Norte', 'RN'),
(11, 'Espírito Santo', 'ES');

-- Inserir dados na tabela CIDADE
INSERT INTO CIDADE (id, nome, id_estado) VALUES
(1, 'Rio de Janeiro', 1),    -- Rio de Janeiro, RJ
(2, 'Paraty', 1), -- Rio de Janeiro, RJ
(3, 'Búzios', 1), -- Rio de Janeiro
(4, 'Cabo Frio', 1), -- Rio de Janeiro
(5, 'Arraial do Cabo', 1), -- Rio de Janeiro
(6, 'Angra dos Reis', 1), -- Rio de Janeiro
(7, 'Balneário Camboriú', 2), -- Santa Catarina
(8, 'Florianópolis', 2),    -- Florianópolis, SC
(9, 'Blumenau', 2), -- Santa Catarina
(10, 'Salvador', 3),         -- Salvador, BA
(11, 'Porto Seguro', 3), -- Bahia
(12, 'Trancoso', 3), -- Bahia
(13, 'Arraial d’Ajuda', 3), -- Bahia
(14, 'Praia do Forte', 3), -- Bahia
(15, 'Morro de São Paulo', 3), -- Bahia
(16, 'Ilhéus', 3), -- Bahia
(17, 'Lençóis', 3), -- Bahia
(18, 'Chapada Diamantina', 3), -- Bahia
(19, 'Caraíva', 3), -- Bahia
(20, 'São Paulo', 4),        -- São Paulo, SP
(21, 'Foz do Iguaçu', 5),    -- Foz do Iguaçu, PR
(22, 'Curitiba', 5), -- Paraná
(23, 'Porto de Galinhas', 6),-- Porto de Galinhas, PE
(24, 'Fernando de Noronha', 6), -- Pernambuco
(25, 'Recife', 6), -- Pernambuco
(26, 'Olinda', 6), -- Pernambuco
(27, 'Fortaleza', 7),        -- Fortaleza, CE
(28, 'Jericoacoara', 7), -- Ceará
(29, 'Canoa Quebrada', 7), -- Ceará
(30, 'Manaus', 8),           -- Manaus, AM
(31, 'Natal', 10),           -- Natal, RN
(32, 'São Miguel do Gostoso', 10), -- Rio Grande do Norte
(33, 'Praia de Genipabu', 10), -- Rio Grande do Norte
(34, 'Praia de Ponta Negra', 10), -- Rio Grande do Norte
(35, 'Praia de Maracajaú', 10), -- Rio Grande do Norte
(36, 'Gramado', 9),         -- Gramado, RS
(37, 'Porto Alegre', 9), -- Rio Grande do Sul
(38, 'Caxias do Sul', 9), -- Rio Grande do Sul
(39, 'Vitória', 11), -- Espírito Santo
(40, 'Serra', 11), -- Espírito Santo
(41, 'Vila Velha', 11), -- Espírito Santo
(42, 'Cariacica', 11), -- Espírito Santo
(43, 'Viana', 11), -- Espírito Santo
(44, 'Domingos Martins', 11), -- Espírito Santo
(45, 'Santa Teresa', 11), -- Espírito Santo
(46, 'Santa Leopoldina', 11), -- Espírito Santo
(47, 'Marataízes', 11), -- Espírito Santo
(48, 'Linhares', 11), -- Espírito Santo
(49, 'Colantina', 11), -- Espírito Santo
(50, 'Afonso Cláudio', 11); -- Espírito Santo

INSERT INTO TIPO_NECESSIDADE_ESPECIAL (id, descricao) VALUES
(1, 'Obesidade'),
(2, 'Gravidez'),
(3, 'Cardiopata'),
(4, 'Idoso'),
(5, 'Diabetes'),
(6, 'Transplantado'),
(7, 'Distúrbios Respiratórios'),
(8, 'Escoliose acentuada'),
(9, 'Fotofobia'),
(10, 'Surdez'),
(11, 'Surdocegueira'),
(12, 'Deficiência auditiva'),
(13, 'Baixa visão'),
(14, 'Cegueira'),
(15, 'Deficiência intelectual'),
(16, 'Deficiência física'),
(17, 'Autismo'),
(18, 'Epilepsia'),
(19, 'Esquizofrenia');

INSERT INTO BENEFICIO_HOSPEDAGEM (id, nome) VALUES
(1, 'Piscina'),
(2, 'Piscina coberta'),
(3, 'Piscina aquecida'),
(4, 'Salão de jogos'),
(5, 'Café da manhã'),
(6, 'Almoço'),
(7, 'Jantar'),
(8, 'All Inclusive'),
(9, 'Playground'),
(10, 'Pesque e pague'),
(11, 'Elevador'),
(12, 'Coworking'),
(13, 'Auditório'),
(14, 'Spa'),
(15, 'Massagem'),
(16, 'Passeio a cavalo'),
(17, 'Passeio de charrete'),
(18, 'Café colonial'),
(19, 'Wifi gratuito'),
(20, 'Pet friendly');

INSERT INTO CLIENTE (id, nome_social, nome_registro, data_nascimento) VALUES
(1, 'Osvaldo Manuel Figueiredo', 'Osvaldo Manuel Figueiredo', '1991-01-20'),
(2, 'César Murilo Novaes', 'César Murilo Novaes', '1969-07-11'),
(3, 'Luna Sueli da Rocha', 'Luna Sueli da Rocha', '1993-04-12'),
(4, 'Flávia Juliana Francisca de Paula', 'Flávia Juliana Francisca de Paula', '1983-08-02'),
(5, 'Luiz Theo Lopes', 'Luiz Theo Lopes', '1974-05-11'),
(6, 'Lavínia Renata Isabelly Brito', 'Lavínia Renata Isabelly Brito', '1947-06-18'),
(7, 'Danilo Enzo Gonçalves', 'Danilo Enzo Gonçalves', '1962-03-12'),
(8, 'Beatriz Letícia Lorena da Mota', 'Beatriz Letícia Lorena da Mota', '2000-02-24'),
(9, 'Camila Cristiane Drumond', 'Camila Cristiane Drumond', '1989-11-14'),
(10, 'Filipe Giovanni Isaac Almada', 'Filipe Giovanni Isaac Almada', '1984-07-20'),
(11, 'Osvaldo Luís Raul Barros', 'Osvaldo Luís Raul Barros', '1953-04-26'),
(12, 'Kaique Bernardo Benício da Mata', 'Kaique Bernardo Benício da Mata', '1992-02-09'),
(13, 'Tatiane Joana Sales', 'Tatiane Joana Sales', '1946-11-12'),
(14, 'Patrícia Luiza Jennifer Silveira', 'Patrícia Luiza Jennifer Silveira', '1958-07-10'),
(15, 'Antônia Letícia Rodrigues', 'Antônia Letícia Rodrigues', '1996-03-12'),
(16, 'Isabel Lívia Assis', 'Isabel Lívia Assis', '2000-01-13'),
(17, 'Olivia Daniela Débora Aparício', 'Olivia Daniela Débora Aparício', '1954-03-04'),
(18, 'Sarah Carolina Elisa Nunes', 'Sarah Carolina Elisa Nunes', '1976-10-05'),
(19, 'Sueli Maitê Pereira', 'Sueli Maitê Pereira', '1989-06-12'),
(20, 'Kauê Leandro Castro', 'Kauê Leandro Castro', '1955-10-20'),
(21, 'Isabelle Eliane Fernandes', 'Isabelle Eliane Fernandes', '1997-05-21'),
(22, 'Cláudia Rafaela Simone Almeida', 'Cláudia Rafaela Simone Almeida', '1977-11-01'),
(23, 'Noah Ian Carlos da Luz', 'Noah Ian Carlos da Luz', '2003-08-26'),
(24, 'Lívia Rosa Lívia da Rosa', 'Lívia Rosa Lívia da Rosa', '1951-05-21'),
(25, 'Valentina Elaine Nogueira', 'Valentina Elaine Nogueira', '1997-06-25'),
(26, 'Noah Daniel Oliveira', 'Noah Daniel Oliveira', '1946-09-14'),
(27, 'Brenda Simone Valentina Martins', 'Brenda Simone Valentina Martins', '1998-09-17'),
(28, 'Diego Juan Rezende', 'Diego Juan Rezende', '1959-04-20'),
(29, 'César Gabriel Costa', 'César Gabriel Costa', '1954-01-25'),
(30, 'Otávio Thiago Nicolas da Conceição', 'Otávio Thiago Nicolas da Conceição', '1966-10-01');

INSERT INTO DOCUMENTO_CLIENTE (id_tipo_documento, id_cliente, numero_documento) VALUES
(3, 1, '16630376390'), -- Osvaldo Manuel Figueiredo
(3, 2, '38440626614'), -- César Murilo Novaes
(3, 3, '65363295032'), -- Luna Sueli da Rocha
(3, 4, '07136475317'), -- Flávia Juliana Francisca de Paula
(3, 5, '46212942617'), -- Luiz Theo Lopes
(3, 6, '38787055147'), -- Lavínia Renata Isabelly Brito
(3, 7, '66904846100'), -- Danilo Enzo Gonçalves
(3, 8, '88584615849'), -- Beatriz Letícia Lorena da Mota
(3, 9, '12168963800'), -- Camila Cristiane Drumond
(3, 10, '51873321473'), -- Filipe Giovanni Isaac Almada
(3, 11, '07351679070'), -- Osvaldo Luís Raul Barros
(3, 12, '17026202804'), -- Kaique Bernardo Benício da Mata
(3, 13, '97620567445'), -- Tatiane Joana Sales
(3, 14, '78712856967'), -- Patrícia Luiza Jennifer Silveira
(3, 15, '83768422429'), -- Antônia Letícia Rodrigues
(3, 16, '47765912356'), -- Isabel Lívia Assis
(3, 17, '27691585110'), -- Olivia Daniela Débora Aparício
(3, 18, '49874246227'), -- Sarah Carolina Elisa Nunes
(3, 19, '75282484285'), -- Sueli Maitê Pereira
(3, 20, '83694154078'), -- Kauê Leandro Castro
(3, 21, '14313790349'), -- Isabelle Eliane Fernandes
(3, 22, '80021459096'), -- Cláudia Rafaela Simone Almeida
(3, 23, '77387321809'), -- Noah Ian Carlos da Luz
(3, 24, '65053714193'), -- Lívia Rosa Lívia da Rosa
(3, 25, '29419529851'), -- Valentina Elaine Nogueira
(5, 25, '481355078'),    -- Valentina Elaine Nogueira - RG
(3, 26, '74539562851'), -- Noah Daniel Oliveira
(5, 26, '175266104'),    -- Noah Daniel Oliveira - RG
(3, 27, '39171774980'), -- Brenda Simone Valentina Martins
(5, 27, '318291782'),    -- Brenda Simone Valentina Martins - RG
(3, 28, '20023862858'), -- Diego Juan Rezende
(5, 28, '259477321'),    -- Diego Juan Rezende - RG
(3, 29, '74140488883'), -- César Gabriel Costa
(5, 29, '344442330'),    -- César Gabriel Costa - RG
(3, 30, '49137784048'), -- Otávio Thiago Nicolas da Conceição
(5, 30, '344404730');    -- Otávio Thiago Nicolas da Conceição - RG

INSERT INTO NECESSIDADE_ESPECIAL_CLIENTE (id_cliente, id_necessidade_especial) VALUES
(20, 12),
(26, 10),
(6, 4),
(29, 1);

INSERT INTO SOLICITACAO_VIAGEM 
(   
    id,
    nome,
    orcamento_minimo,
    orcamento_maximo,
    data_partida,
    data_retorno,
    descricao_preferencias_passeio,
    descricao_preferencias_voo,
    descricao_preferencias_hospedagem,
    descricao_perfil_grupo,
    id_cidade_origem,
    id_cidade_destino,
    id_cliente_responsavel
) VALUES
(1, 'Patrícia: Arraial do Cabo - Balneário Camboriu', 5000.0, 15000.0, '2024-02-12', '2024-02-18', 
'Gostamos de passeios tranquilos e com conforto, como passeios de lancha, ou passeios fechados.', 'Fileira dupla, apenas. Vôo curto e sem conexões, se possível.', 
'Local bonito, confortável, de preferência com algum serviço de conveniência 24 horas.', 'Somos um casal muito apaixonado, que ama viajar, comer, desfrutar do que há de bom na vida.',
5, 7, 14),
(2, 'Patrícia: Arraial do Cabo - Chapada Diamantina', 5000, 15000, '2024-07-24', '2024-07-28', 
'Queremos muitos passeios ao ar livre, com contato com a natureza.', 'Fileira dupla, apenas.', 
'Local com bastante contato com a natureza, reservado. Não muito longe dos passeios e que tenha refeições no local.', 'Somos um casal muito apaixonado, que ama viajar, comer, desfrutar do que há de bom na vida.',
5, 18, 14),
(3, 'Patrícia: Arraial do Cabo - Paraty', 3000, 15000, '2024-12-28', '2025-01-03', 
'Não é a primeira vez que vamos a Paraty, queremos passeios diferentes e tranquilos, mas ao mesmo tempo aproveitar o ano novo longe do fervo de Arraial.', 'Vamos de carro.', 
'Confortável.', 'Somos um casal muito apaixonado, que ama viajar, comer, desfrutar do que há de bom na vida.',
5, 2, 14),
(4, 'Patrícia: Arraial do Cabo - Búzios', 3000, 6000, '2024-09-12', '2024-09-16', 
'Queremos passeios relaxantes e, ao mesmo tempo, animados, como ir ao spa, ir a restaurantes, ir à praia, mas também coisas divertidas.', 'Vamos de carro, pela manhã e retornaremos pela manhã no dia 16..', 
'Hospedagem confortável, mas queremos ficar em quartos separados.', 'Somos um grupo de amigas que amam sair para comer, beber e conversar, e queremos um tempo de descanso de nossos maridos!.',
5, 3, 14),
(5, 'Kaique da Mata: Recife - São Paulo', 1500, 4000, '2024-10-30', '2024-11-03', 'Queremos conhecer o máximo possível da cidade nesse tempo: a 25 de Março, os Parques e os museus, a Liberdade e tudo o que é possível ver nesse espaço de tempo',
'Queremos um vôo ecômico, mesmo que isso demande fazer mais escalas ou até mesmo trocar de companhia aérea nas conexões.', 
'Queremos uma hospedagem com bastente custo-benefício, quartos bonitos, limpos e confortáveis, mas por um preço bacana. Não nos importamos com as instações do hotel, apenas queremos um bom e farto café da manhã. Luna e Osvaldo e eu e Beatriz devemos ficar no mesmo quarto, enquanto os outros dois ficarão no próprio quarto, todos com cama de casal.',
'Somos um grupo de amigos unidos e que nos conhecemos há mais de 8 anos! Gostamos de cultura, agitação, gente nova e reunida. Gostamos de aproveitar não apenas a vida diurna, mas também a noturna! O orçamento que coloquei aqui é individual.', 
25, 20, 12),
(6, 'Viagem de amigas de Antônia: Rio de Janeiro - Lençóis', 2000, 5000, '2024-05-30', '2024-06-01', 'Queremos curtir!', 'Não temos preferências.', 'Que não seja um moquifo! Queremos ficar todas juntas.', 'Somos bem animadas!',
1, 17, 15),
(7, 'Viagem em família Cézar Novaes : Serra - Salvador', 10000, 22000, '2024-02-09', '2024-02-13', 'Queremos passeios tranquilos e que possam ser feitos em família, como sair para comer e beber, ir à praia, visitar a cidade.',
'Queremos um vôo confortável e que não dependa de muitas conexões e tempo de espera entre aeroportos.', 'Queremos ficar em uma casa, com pelo menos 3 quartos de casal.', 'Somos uma família, apesar de viajarmos no carnaval, queremos descanso e sossego.',
40, 10, 2),
(8, 'Viagem a trabalho Sueli Pereira: Recife - Natal', 1000, 1200, '2023-12-04', '2023-12-05', 'Não quero fazer passeios.', 'Vôo rápido em classe econômica', 'Hospedagem confortável, mas sem muito luxo e também sem miséria, com café da manhã.', 'Só vou a trabalho.',
25, 31, 19),
(9, 'Luíz Lopes Viagem de casal: Florianópolis - Foz do Iguaçu', 3000, 5000, '2024-04-13', '2024-04-15', 'Queremos ver as cataratas, e também visitar a cidade. Passeios tranquilos, sem muito esforço.', 'Sem muita firula.',
'Hotel simples, barato, bonito e confortável, com café da manhã.', 'Só queremos aproveitar minha folga no trabalho para conhecer as cataratas.', 
8, 21, 22),
(10, 'Otávio Conceição viagem com irmãos: Serra - Domingos Martins', 1000, 5000, '2024-02-09', '2024-02-11', 'Queremos dicas de algo fora do convencional pedra azul, lavandário, etc.',
'Vamos de carro', 'Hospedagem simples, um quarto para cada.', 'Somos irmãos que deram sorte de se encontrar na vida, gostamos de comida, bebida, vinhos, cachaça... Só coisa boa!',
40, 44, 30),
(11, 'Olívia Aparício: Caixias do Sul - Porto de Galinhas', 2000, 7000, '2024-06-26', '2024-06-29', 'Nunca fomos, não sei muito bem o que queremos além de praia...', 'O mais barato!',
'O melhor custo-benefício, perto da praia, com café da manhã.', 'Somos bem tranquilos, gostamos de praia.',
 38, 23, 17),
(12, 'Osvaldo Barros: Serra - Paraty', 500, 5000, '2024-05-09', '2024-05-12', 'Passeios culturais e pelas praias.', 'O que ficar melhor para sair de Serra e ir até Paraty.',
'Lugal calmo, confortável, com café da manhã. Banheiro padrão de hotel! Talvez uma pousada seja legal.', 'Tranquilo e animado, depende do passeio.', 
40, 2, 11);

INSERT INTO ACOMPANHANTE_VIAGEM (id_solicitacao_viagem, id_cliente) VALUES 
(1, 7),
(2, 7),
(3, 7),
(4, 13), (4, 25),
(5, 1), (5, 23), (5, 3), (5, 8),
(6, 16), (6, 21), (6, 25), (6, 27),
(7, 6), (7, 9), (7, 10), (7, 26), (7, 18),
(9, 5),
(10, 20), (10, 28),
(11, 29),
(12, 24);

-- contato cliente responsavel
INSERT INTO CONTATO_CLIENTE_RESPONSAVEL (id_tipo_contato, id_cliente, descricao) VALUES
(4, 14, '22985915050'),
(4, 12, '81998111117'),
(4, 15, '21985323494'),
(4, 2, '27999856790'),
(4, 19, '81992578200'),
(4, 22, '48994042581'),
(4, 30, '27991189057'),
(4, 17, '54995946124'),
(4, 11, '27988401989');

-- Tabela ENDERECO
INSERT INTO ENDERECO (id, logradouro, numero, complemento, cep, id_cidade) VALUES
(1, 'Rua Ricardo de Assis Pereira', 636, null, '13563650', 20),
(2, 'Rua José Pedro Maduro', 45, null, '23071050', 1),
(3, 'Escadaria Luiz Fernando Silva', 1893, null, '29046024', 39),
(4, 'Avenida Paulista', 2064, '01310928', null, 20),
(5, 'AV MARCOS PENTEADO DE ULHOA RODRIGUES', 939, null, '06460040', 20),
(6, 'PC SENADOR SALGADO FILHO', null, 'TERREOAEREA PUBLICA ENT EIXOS 46-48 O-P SALA DE GERENCIA BACK OFFICE', '20021340', 1),
(7, 'Rua Atica', 673, 'Andar 6 sala 62', '04634042', 20),
(8, 'Rua Orivaldo Batista Cunha', 223, null, '88332035', 7),
(9, 'Rua Jardim da Saudade', 2, null, '88332055', 7),
(10, 'Rua Dois de Julho 112', 122, 'Chácara do Cacau', '48300970', 18),
(11, '3ª Travessa Boa Vista', 11, null, '45604282', 18),
(12, 'Rua Igarapé', 2245, null, '26173525', 2),
(13, 'Travessa Icos', 211, null, '25560351', 2),
(14, 'Rua Quissamã', 1244, null, '26293474', 3),
(15, 'Rua Maria Domingues', 920, null, '26060480', 3),
(16, 'Rua Edison David', 1103, null, '18048266', 20),
(17, 'Rua Dona Risoleta de Moraes', 1203, null, '11453210', 20),
(18, 'Avenida Pinto', 92, null, '41100109', 17),
(19, 'Rua Antônio Carneiro', 786, null, '48071250', 17),
(20, 'Rua Caiena', 33, null, '42828532', 10),
(21, 'Travessa Railda', 9928, null, '41235440', 10),
(22, 'Rua Minas Gerais', 209, null, '59297162', 31),
(23, 'Rua Tenente Osório', 4456, null, '59141145', 31),
(24, 'Rua Ruy Leal', 223, null, '81490046', 21),
(25, 'Rua Pádua', 922, null, '86041070', 21),
(26, 'Rua Antenor França', 57, null, '29941810', 44),
(27, 'Rua Rio Guaíba', 87, null, '29142289', 44),
(28, 'Rua Pedro Galvão', 99, null, '55291320', 23),
(29, 'Rua Trinta e Três', 1, null, '53540780', 23),
(30, 'Rodovia Beto Carrero World', null, 'Praia de Armação do Itapocorói', '88385000', 7),
(31, 'Rua Cardeal', 299, null, '23081210', 2),
(32, 'Ramal A', 100, null, '28898036', 3),
(33, 'Rua Gaspar Dutra', 220, null, '85863270', 21),
(34, 'Rua Professora Branca', 39, null, '55334970', 23),
(35, 'Avenida Brasil', 3322, 'Barra Sul', '88330063', 7),
(36, 'Molhe da Barra Sul', null, null, null, 7),
(37, 'Rodovia das praias de Balneário Camboriu', null, null, null, 7),
(38, 'Avenida Governador Irineu Bornhausen', 5600, null, '88025202', 7),
(39, 'Centro histórico', null, null, null, 2),
(40, 'Píer de Paraty', null, null, null, 2),
-- Búzios
(41, 'Centro de Búzios', NULL, NULL, '28950000', 3),
(42, 'Praia de Geribá', NULL, NULL, '28950000', 3),
(43, 'Praia de João Fernandes', NULL, NULL, '28950000', 3),
(44, 'Cais do Mangue', NULL, NULL, '28950000', 3),
-- São Paulo
(45, 'Avenida Paulista', NULL, NULL, '01310000', 20),
(46, 'Avenida Paulista', 1578, 'MASP', '01310200', 20),
(47, 'Mirante do SESC', NULL, NULL, '01323903', 20),
(48, 'Mercado Municipal', NULL, NULL, '01024000', 20),
(49, 'Liberdade', NULL, NULL, '01503001', 20),
-- Lençóis e Chapada Diamantina
(50, 'Gruta da Lapa Doce', NULL, NULL, '46960000', 17),
(51, 'Rio Pratinha', NULL, NULL, '46930000', 17),
(52, 'Gruta do Poço Encantado', NULL, NULL, '46930000', 17),
(53, 'Cachoeira da Fumaça', NULL, NULL, '46960000', 17),
(54, 'Vale do Capão', NULL, NULL, '46930000', 17),
(55, 'Morro do Pai Inácio', NULL, NULL, '46930000', 18),
(56, 'Cidade da Pedra', NULL, NULL, '46930000', 18),
(57, 'Pantanal de Marimbus', NULL, NULL, '46930000', 18),
(58, 'Cachoeira do Buracão', NULL, NULL, '46930000', 18),
-- Salvador
(59, 'Casa do Rio Vermelho', NULL, NULL, '41950600', 10),
(60, 'Ilha de Itaparica', NULL, NULL, '41950600', 10),
(61, 'Ilha dos Frades', NULL, 'Piscinas Naturais', '40301150', 10),
(62, 'Morro de São Paulo', NULL, NULL, '45428000', 10),
(63, 'Praia do Forte', NULL, NULL, '48280000', 10),
-- Natal
(64, 'Maracajaú', NULL, NULL, '59580000', 31),
(65, 'Praia do Genipabu', NULL, NULL, '59570000', 31),
(66, 'São Miguel do Gostoso', NULL, NULL, '59585000', 31),
(67, 'Barra do Cunhaú', NULL, NULL, '59161970', 31),
-- Foz do Iguaçu
(68, 'Parque Nacional de Iguaçu', NULL, NULL, '85853830', 21),
(69, 'BR 469', NULL, 'KM 18', '85853830', 21),
(70, 'Parque das Aves', NULL, NULL, '85855750', 21),
(71, 'Macuco Safári', NULL, NULL, '85853830', 21),
(72, 'Itaipu Binacional', NULL, NULL, '85855750', 21),
-- Domingos Martins
(73, 'Portal da Cidade', NULL, NULL, '29260000', 44),
(74, 'Portal das Orquídeas', NULL, NULL, '29260000', 44),
(75, 'Cervejaria Barba Ruiva', NULL, NULL, '29260000', 44),
(76, 'Casa da Cultura e Museu Histórico', NULL, NULL, '29260000', 44),
(77, 'Praça Dr. Arthur Gerhardt', NULL, NULL, '29260000', 44),
-- Porto de Galinhas
(78, 'R. das Piscinas Naturais', 1150, NULL, '55590000', 23), -- Visita às Piscinas Naturais não especificou localização
(79, 'Praia de Serrambi', NULL, NULL, '55578000', 23),
(80, 'Centro da Cidade', NULL, NULL, '55590000', 23);

-- Tabela EMPRESA
-- Dados para a tabela EMPRESA
INSERT INTO EMPRESA (id, razao_social, nome_fantasia, cnpj, id_ramo_empresa, id_endereco) VALUES
-- Locadora de veículos nacional
(1, 'Locadora Sônico SA', 'Locadora Sônico', '34973912000161', 1, 1),
(2, 'Locadora Local SA', 'Locadora Legal', '61547483000133', 1, 2),
(3, 'Speedy Locadora SA', 'Speedy Locadora', '03562499000119', 1, 3),
-- Companhia aérea
(4, 'AEROVIAS DEL CONTINENTE AMERICANO S.A. AVIANCA', 'Avianca', '33712837000110', 3, 4),
(5, 'AZUL LINHAS AEREAS BRASILEIRAS S.A.', 'Azul Linhas Aéreas', '09295295000160', 3, 5),
(6, 'GOL LINHAS AEREAS S.A.', 'Gol', '07575651000159', 3, 6),
(7, 'TAM LINHAS AEREAS S/A.', 'LATAM Linhas Aéreas', '02012863000160', 3, 7),
-- Hospedaria
(8, 'Gran Hotel Hotelaria SA', 'Gran Hotel', '66073516000174', 2, 8),
(9, 'Hotel Green Hotelaria SA', 'Hotel Green', '40661768000120', 2, 9),
(10, 'Chalé da Floresta ME', 'Chalé da Floresta', '47971677000130', 2, 10),
(11, 'Villa da Montanha SA', 'Villa da Montanha', '42454153000159', 2, 11),
(12, 'Pousada do Rio EPP Ltda', 'Pousada do Rio', '60727233000112', 2, 12),
(13, 'Hotel Spa das Termas EPP Ltda', 'Hotel Spa das Termas', '22911540000160', 2, 13),
(14, 'Villa Tropical SA', 'Villa Tropical', '57022863000187', 2, 14),
(15, 'Resort Paradise SA', 'Resort Paradise', '93420348000119', 2, 15),
(16, 'Daybreak Hotel SA', 'Daybreak Hotel', '98403261000157', 2, 16),
(17, 'TopGun Hotel SA', 'TopGun Hotel', '63152630000100', 2, 17),
(18, 'Argos Hotel SA', 'Argos Hotel', '22302472000131', 2, 18),
(19, 'Cleonice Bochimpani Furtado 258.534.321-92 MEI', 'Urban Retreat', '33449767000151', 2, 19),
(20, 'Gustavo Santos Marica 042.178.212-98 MEI', 'Casa do Mar', '53211467000147', 2, 20),
(21, 'Resort dos Sonhos SA', 'Resort dos Sonhos', '95844141000105', 2, 21),
(22, 'Hotel Charme SA', 'Hotel Charme', '83821387000174', 2, 22),
(23, 'Hotel Plus SA', 'Hotel Plus', '82950722000171', 2, 23),
(24, 'Pousada das Estações EPP Ltda', 'Pousada das Estações', '08214569000161', 2, 24),
(25, 'Hotel Colonial SA', 'Hotel Colonial', '53335387000101', 2, 25),
(26, 'Refúgio das Montanhas SA', 'Refúgio das Montanhas', '26838417000111', 2, 26),
(27, 'Pousada da Serra EPP Ltda', 'Pousada da Serra', '33261116000133', 2, 27),
(28, 'Pousada Cave SA', 'Pousada Cave', '81946457000195', 2, 28),
(29, 'Bluejay Pousada SA', 'Bluejay Pousada', '62718773000165', 2, 29),
-- Empresas de Passeios
(30, 'Beto Carrero World Paque SA', 'Beto Carrero World', '62903857300016', 4, 30), -- empresa de passeio - beto carrero
(31, 'Turismo em Paraty SA', 'Turismo Amigo Paraty', '01503698000120', 4, 31), -- empresa de passeio - passeios de paraty
(32, 'Turismo em Buzios SA', 'Turismo Legal Buzios', '41252280000102', 4, 32), -- empresa de passeio - 
(33, 'Turismo em Foz do Iguaço SA', 'Turismo Interessante Paraná', '43785315000102', 4, 33), -- empresa de passeio - 
(34, 'Turismo em Porto de Galinhas SA', 'Turismo Exploration Pernambuco', '21738158000133', 4, 34); -- empresa de passeio

INSERT INTO HOSPEDARIA (id, descricao, numero_estrelas, link_website) VALUES
(8, 'Como o próprio nome diz: Gran Hotel!! Luxo, Espanha, anos 1899, inovação... Chiclas que chiclas. Bom para lua de mel. Tem cassino, shows próprios e parques internos.', 5, 'www.granhotel.com.br/'), -- hospedagem balneario camboriu
(9, 'Hotel de alto padrão, em área de vantagem no meio da cidade, próximo ao mar e os centros turísticos.', 4, 'www.greenhotel.com.br'), -- hospedagem balneario camboriu
(10, 'Chalés individual isolados. Todos tem banheira, alguns tem ofurô, é possível comprar kit com café da manhã, massas e vinhos. Total privacidade para o hóspede.', 4, 'www.chaledafloresta.com.br'), -- hospesagem chapada diamantina
(11, 'Pousada muito reconfortante, porém em uma vila de chalés individuais. Tem café da manhã no refeitório central e oferece passeios e trilhas privados.', 3, 'www.villamontanha.com.br'), -- hospedagem chapada diamantina
(12, 'Pousada bastante tranquila, com café da manhã ok, nível standars, mas de baixo orçamento. Próximo ao rio.', 2, 'www.pousada-do-rio.com'), -- hospesagem paraty
(13, 'Hotel bonito, elegante, simples, com café da manhã e buffet disponível a um preço no combo.', 3, 'www.spatermasparaty.com.br'), -- hospedagem paraty
(14, 'Bom hotel para quem quer equilíbrio entre orçamento e serviço, com café da manhã e almoço.', 3, 'www.villatropical.com.br'), -- hospesagem buzios
(15, 'Resort perfeito para passar com a família, amigos ou em casal. All Inclusive, vários restaurantes, várias áreas de piscina, praia privativa, serviço de quarto.', 5, 'www.resortparadise.com.br'), -- hospesagem buzios
(16, 'Ótimo custo-benefício, com café da manhã excelente.', 2, 'www.daybreaksp.com'), -- hospedagem sao paulo
(17, 'Padrão internacional, boa localização.', 4, 'www.topgun.com'), -- hospedagem sao paulo
(18, 'Aconchegante, confortável, good vibes.', 3, 'www.argo.com'), -- hospesagem lençóis
(19, 'Casa de temporada', 4, 'www.urbanretreat.com.br'), -- hospedagem lençóis
(20, 'Casa de temporada', 3, 'www.casadomar.com.br'), -- hospedagem salvador
(21, 'Resort do fervo!', 5, 'www.resortdossonhos.com.br'), -- hospedagem salvador
(22, 'Bom custo-benefício.', 2,'www.hotelcharmenatal.com.br'), -- hospesagem natal
(23, 'Hotel de qualidade um pouco superior, custo-benefício para boa localização.', 3,'www.plushotel-natal-rn.com.br'), -- hospedagem natal
(24, 'Aconhegante.', 3,'www.pousadaestacoespr.com.br'), -- hospesagem foz do iguaçu
(25, 'Aconchegante, tranquilo, espaçoso', 3,'www.colonialhotelparana.com.br'), -- hospedagem foz do iguaçu
(26, 'Hotel muito bom, bom para famílias.', 4,'www.refugiodasmontanhas.com.br'), -- hospesagem domingos martins
(27, 'Econômica.', 2,'www.pousadadm.com.br'), -- hospedagem domingos martins
(28, 'Próximo a praia, entrada particular.', 3,'www.pousadacave.com.br'), -- hospesagem porto de galinhas
(29, 'Um pouco afastada da praia, mais próxima do centro comercial.', 3,'www.bluejaypousada.com.br'); -- hospedagem porto de galinhas

INSERT INTO BENEFICIO_HOSPEDARIA (id_hospedaria, id_beneficio_hospedagem) VALUES
(8, 14),
(8, 7),
(8, 4),
(8, 18),
(8, 10),
(9, 18),
(9, 1),
(9, 3),
(9, 11),
(9, 11),
(10, 10),
(10, 11),
(10, 17),
(10, 1),
(10, 15),
(11, 13),
(11, 19),
(11, 4),
(11, 1),
(11, 1),
(12, 7),
(12, 10),
(12, 6),
(12, 8),
(12, 5),
(13, 9),
(13, 20),
(13, 3),
(13, 10),
(13, 7),
(14, 3),
(14, 7),
(14, 18),
(14, 20),
(14, 13),
(15, 10),
(15, 4),
(15, 6),
(15, 1),
(15, 5),
(16, 3),
(16, 9),
(16, 1),
(16, 11),
(16, 18),
(17, 3),
(17, 18),
(17, 1),
(17, 6),
(17, 6),
(18, 4),
(18, 14),
(18, 19),
(18, 19),
(18, 16),
(19, 1),
(19, 1),
(19, 14),
(19, 16),
(19, 11),
(20, 7),
(20, 14),
(20, 3),
(20, 6),
(20, 10),
(21, 12),
(21, 4),
(21, 2),
(21, 3),
(21, 4),
(22, 4),
(22, 2),
(22, 2),
(22, 15),
(22, 8),
(23, 18),
(23, 15),
(23, 6),
(23, 18),
(23, 2),
(24, 20),
(24, 14),
(24, 6),
(24, 19),
(24, 6),
(25, 12),
(25, 18),
(25, 2),
(25, 7),
(25, 19),
(26, 17),
(26, 16),
(26, 10),
(26, 10),
(26, 5),
(27, 16),
(27, 11),
(27, 11),
(27, 13),
(27, 18),
(28, 16),
(28, 4),
(28, 16),
(28, 12),
(28, 9),
(29, 11),
(29, 20),
(29, 13),
(29, 4),
(29, 8);

INSERT INTO EMPRESA_VEICULO (id_empresa, id_tipo_veiculo) VALUES
(1, 3),
(1, 4),
(1, 5),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(2, 1),
(2, 14),
(2, 16),
(2, 17),
(2, 19),
(3, 2),
(3, 6),
(3, 12),
(3, 13),
(3, 15),
(3, 18);

INSERT INTO CONTATO_EMPRESA (id_empresa, id_tipo_contato, descricao) VALUES
(1, 1, 'contato@locadorasonico.com.br'),
(1, 5, '1136660482'),
(1, 4, '11988877307'),
(2, 5, '2128716698'),
(2, 4, '21983629154'),
(2, 1, 'contact@legalocadora.com'),
(3, 1, 'contate-nos@speedy.locadora.com'),
(3, 4, '27999822085'),
(4, 1, 'fiscal@avianca.com.br'),
(4, 5, '1121761079'),
(5, 1, 'tributario@voeazul.com.br'),
(5, 5, '1141349800'),
(6, 1, 'bambanassessoria@hotmail.com'),
(6, 5, '1177364837'),
(6, 5, '1122744136'),
(7, 1, 'fiscal@latam.com.br'),
(7, 5, '1150357319'),
(8, 5, '5527563454'),
(9, 4, '53991118365'),
(10, 5, '7328593270'),
(10, 4, '75987474119'),
(11, 4, '75987474118'),
(11, 1, 'contato@villadamontanha.com'),
(12, 4, '21984482852'),
(13, 4, '21974877185'),
(14, 4, '21974365287'),
(14, 1, 'oi@villa.tropical.com'),
(15, 4, '24986795992'),
(15, 5, '2231311252'),
(15, 1, 'talktous@buziosresortparadise.com'),
(16, 1, 'contact@daybreakhotel.com'),
(16, 5, '1137295463'),
(16, 4, '11967644246'),
(17, 1, 'stakeholders@topgunbr.com'),
(17, 5, '1127547312'),
(18, 4, '71982306932'),
(18, 5, '7137696858'),
(19, 4, '73998822846'),
(19, 1, 'oi@urbanretrat.com'),
(20, 1, 'contato@casadomar.com'),
(20, 4, '71968153612'),
(21, 5, '77983128193'),
(21, 1, 'saibamais@resort.dos.sonhos.com'),
(22, 1, 'faleconosto@hotelcharme.com.br'),
(22, 5, '8433228312'),
(23, 1, 'contato@hotelplus.com.br'),
(23, 5, '8429741652'),
(24, 1, 'contato@pousadaestacoes.com'),
(24, 5, '4533853482'),
(25, 1, 'contact@hotelcolonial.com.br'),
(25, 5, '4237861412'),
(26, 1, 'reserva@refugiodasmontanhas.com'),
(26, 5, '2737791661'),
(27, 5, '2724231225'),
(27, 4, '28979863415'),
(28, 1, 'oi@cavepousada.com'),
(28, 4, '81986517585'),
(28, 5, '8127430072'),
(29, 1, 'reserva@bluejaypousada.com'),
(29, 4, '87989952674'),
(30, 5, '4838651050'),
(31, 5, '2128914316'),
(32, 5, '2127477342'),
(33, 5, '4338107183'),
(34, 5, '8129691479');

-- Balneario Camboriu
INSERT INTO PASSEIO (id, nome, descricao, id_endereco) VALUES
(1, 'Passeio a San Miguel', 'O Passeio San Miguel é um local charmoso e agradável com diferentes opções de lazer. Possui gastronomia variada, arte, música ao vivo, moda feminina e eventos regulares. Aqui é a escolha perfeita para viver bons momentos entre família e amigos.', 35),
(2, 'Passeio a Molhe da Barra Sul', 'O Molhe da Barra Sul está localizado no final da Avenida Atlântica, lado direito da Praia Central de Balneário Camboriú, em frente ao Parque Unipraias. Proporciona uma vista única e deslumbrante de toda a orla de Balneário Camboriú.', 36),
(3, 'Beto Carrero World', 'O maior parque temático da América Latina! Mais de 100 incríveis atrações para toda a família!', 30),
(4, 'Interpraias', 'Conheça as atrações da rodovia Interpraias, que liga 6 praias de Balneário Camboriú e se conecta à BR-101, em Itapema SC.', 37),
(5, 'Visita ao Museu da imagem e do som', 'Criado em 1998 com a finalidade de preservar os documentos e pesquisas audiovisuais de relevância nacional e principalmente do estado catarinense.', 38),
-- Paraty
(6, 'Tour pelo centro histórico', 'Conheça a história da cidade com o guia.', 39),
(7, 'Passeio de escuna', 'Passeio de escuna, mergulho, parada em ilhas, almoço e bebidas incluso', 40),
(8, 'Passeio a praia da trindade', 'Passar o dia na praia da trindade.', 40),
(9, 'Passeio a praia do sono', 'Passar o dia na praia do sono.', 40),
(10, 'Passeio a cachoeira do tobogã', 'Visira a cachoeira do tobogã.', 40),
-- Búzios
(11, 'Tour pelo Centro de Búzios', 'Descubra os encantos do centro de Búzios neste passeio a pé, explorando suas ruas charmosas e atrações locais.', 41),
(12, 'Passeio à Praia de Geribá', 'Desfrute de um dia ensolarado na famosa Praia de Geribá, com areias brancas e águas cristalinas.', 42),
(13, 'Passeio à Praia de João Fernandes', 'Explore a beleza natural da Praia de João Fernandes, com suas águas calmas e paisagem deslumbrante.', 43),
(14, 'Passeio de Escuna', 'Aventura marítima esperando por você! Embarque em uma emocionante jornada de escuna por Búzios.', 44),
(15, 'Passeio de Buggy', 'Acelere pelas paisagens incríveis de Búzios em um passeio de buggy cheio de adrenalina.', 43),
-- São Paulo
(16, 'Passeio pela Avenida Paulista', 'Caminhe pela famosa Avenida Paulista e descubra as atrações culturais e comerciais ao longo do caminho.', 45),
(17, 'Visita ao MASP', 'Explore o renomado Museu de Arte de São Paulo (MASP) e mergulhe na rica cena artística da cidade.', 46),
(18, 'Visita ao Mirante do SESC', 'Desfrute de uma vista panorâmica da cidade de São Paulo a partir do Mirante do SESC, uma experiência imperdível.', 47),
(19, 'Visita ao Mercado Municipal', 'Mergulhe na cultura culinária de São Paulo com uma visita ao Mercado Municipal, conhecido por suas delícias gastronômicas.', 48),
(20, 'Visita à Liberdade', 'Descubra o bairro da Liberdade, conhecido por sua atmosfera oriental, lojas encantadoras e gastronomia única.', 49),
-- Lençóis e Chapada Diamantina
(21, 'Passeio à Gruta da Lapa Doce', 'Explore as maravilhas subterrâneas na Gruta da Lapa Doce, uma experiência única na Chapada Diamantina.', 50),
(22, 'Passeio no Rio Pratinha', 'Relaxe e aproveite as águas cristalinas do Rio Pratinha neste passeio tranquilo pela natureza.', 51),
(23, 'Passeio Gruta do Poço Encantado', 'Descubra a magia da Gruta do Poço Encantado, com suas águas azuis deslumbrantes.', 52),
(24, 'Passeio Cachoeira da Fumaça', 'Aventure-se em uma trilha emocionante até a Cachoeira da Fumaça, uma das mais altas do Brasil.', 53),
(25, 'Passeio Piscinas Naturais no Vale do Capão', 'Relaxe nas piscinas naturais do Vale do Capão e aproveite a serenidade desse paraíso escondido.', 54),
(26, 'Passeio no Morro do Pai Inácio', 'Desfrute de uma vista panorâmica incrível do alto do Morro do Pai Inácio, um dos pontos mais icônicos da região.', 55),
(27, 'Passeio na Cidade da Pedra', 'Explore os mistérios da Cidade da Pedra, um local cheio de formações rochosas fascinantes.', 56),
(28, 'Passeio pelo Pantanal de Marimbus', 'Embarque em uma aventura pelo Pantanal de Marimbus e descubra a rica fauna e flora do ecossistema.', 57),
(29, 'Passeio na Cachoeira do Buracão', 'Caminhe até a deslumbrante Cachoeira do Buracão e deixe-se envolver pela beleza natural.', 58),
-- Salvador
(30, 'Casa do Rio Vermelho', 'Explore a Casa do Rio Vermelho, antiga residência de Jorge Amado e Zélia Gattai, e mergulhe na história literária.', 59),
(31, 'Passeio à Ilha de Itaparica', 'Navegue até a encantadora Ilha de Itaparica e desfrute de praias paradisíacas e cultura local.', 60),
(32, 'Passeio à Ilha dos Frades com Piscinas Naturais', 'Descubra a Ilha dos Frades e suas piscinas naturais, um refúgio tropical próximo a Salvador.', 61),
(33, 'Morro de São Paulo', 'Viva a atmosfera única de Morro de São Paulo, com suas praias encantadoras e energia vibrante.', 62),
(34, 'Praia do Forte', 'Explore as belezas naturais da Praia do Forte, conhecida por suas areias brancas e atrações locais.', 63),
-- Natal
(35, 'Excursão a Maracajaú', 'Participe de uma emocionante excursão a Maracajaú, incluindo passeio de quadriciclo e mergulho nas águas cristalinas.', 64),
(36, 'Excursão para a Praia do Genipabu', 'Descubra a beleza da Praia de Genipabu em uma excursão que oferece emoção e paisagens deslumbrantes.', 65),
(37, 'Excursão a São Miguel do Gostoso', 'Explore São Miguel do Gostoso em uma excursão que combina beleza natural e autenticidade local.', 66),
(38, 'Excursão a Barra do Cunhaú', 'Descubra os encantos de Barra do Cunhaú em uma emocionante excursão que oferece experiências únicas.', 67),
-- Foz do Iguaçu
(39, 'Parque Nacional de Iguaçu', 'Maravilhe-se com as imponentes Cataratas do Iguaçu neste passeio pelo Parque Nacional.', 68),
(40, 'Cataratas do Iguaçu', 'Aproxime-se da grandiosidade das Cataratas do Iguaçu e sinta a energia das poderosas quedas dágua.', 69),
(41, 'Parque das Aves', 'Explore a diversidade da fauna no Parque das Aves, lar de aves exóticas e coloridas.', 70),
(42, 'Macuco Safári', 'Embarque em uma aventura emocionante no Macuco Safári, onde a natureza e a adrenalina se encontram.', 71),
(43, 'Itaipu Binacional', 'Conheça a grandiosa Itaipu Binacional, uma das maiores usinas hidrelétricas do mundo.', 72),
-- Domingos Martins
(44, 'Visita ao Portal da Cidade', 'Comece sua jornada explorando o charmoso Portal da Cidade de Domingos Martins.', 73),
(45, 'Visita ao Portal das Orquídeas', 'Descubra a beleza das orquídeas no Portal das Orquídeas, um local encantador para os amantes da natureza.', 74),
(46, 'Visita à Cervejaria Barba Ruiva', 'Sinta os sabores locais com uma visita à Cervejaria Barba Ruiva, conhecida por suas cervejas artesanais.', 75),
(47, 'Casa da Cultura e Museu Histórico', 'Mergulhe na história local com uma visita à Casa da Cultura e ao Museu Histórico de Domingos Martins.', 76),
(48, 'Praça Dr. Arthur Gerhardt', 'Relaxe na Praça Dr. Arthur Gerhardt, um local pitoresco para apreciar a atmosfera da cidade.', 77),
-- Porto de Galinhas
(49, 'Visita às Piscinas Naturais', 'Explore as famosas piscinas naturais de Porto de Galinhas, repletas de vida marinha e águas cristalinas.', 78),
(50, 'Passeio de Buggy 4h', 'Aventure-se em um emocionante passeio de buggy de 4 horas pelas praias e dunas de Porto de Galinhas.', 79),
(51, 'Visita à Praia de Serrambi', 'Descubra a tranquilidade da Praia de Serrambi em um passeio relaxante pela costa.', 79),
(52, 'Passeio pelo Centro da Cidade', 'Explore o charmoso centro da cidade de Porto de Galinhas, cheio de lojas, restaurantes e cultura local.', 80);

INSERT INTO EMPRESA_PASSEIO (id_empresa, id_passeio, preco) VALUES
(30, 3, 0),
(30, 3, 149.90),
(30, 3, 238.90),
(31, 7, 200.00),
(32, 14, 70.00),
(32, 15, 80.00),
(33, 39, 80.00),
(33, 40, 90.00),
(33, 41, 70.00),
(33, 42, 386.00),
(33, 43, 160.00),
(34, 50, 150.00);

-- Dados para a tabela PASSAGEM_AEREA
INSERT INTO PASSAGEM_AEREA 
(   
    id,
    numero_passagem,
    numero_voo, 
    numero_assento, 
    data_decolagem, 
    horario_decolagem, 
    data_pouso, 
    horario_pouso, 
    id_cliente_titular, 
    id_companhia_aerea
) 
VALUES
(1, 'ABC123', 'PA001', 'A01', '2024-02-12', '08:00:00', '2024-02-12', '10:30:00', 14, 4), -- viagem 1
(2, 'XYZ789', 'PA002', 'B02', '2024-02-12', '08:00:00', '2024-02-12', '10:30:00', 7, 4),
(3, 'DEF456', 'PA003', 'C03', '2024-02-18', '10:30:00', '2024-02-18', '12:15:00', 14, 4),
(4, 'GHI789', 'PA004', 'D04', '2024-02-18', '10:30:00', '2024-02-18', '12:15:00', 7, 4), 
(5, 'JKL321', 'PA005', 'E05', '2024-07-24', '16:20:00', '2024-07-24', '19:00:00', 14, 4), -- viagem 2
(6, 'MNO654', 'PA006', 'F06', '2024-07-24', '16:20:00', '2024-07-24', '19:00:00', 7, 4),
(7, 'ZQR987', 'PA007', 'G07', '2024-07-28', '11:30:00', '2024-07-28', '14:00:00', 14, 4),
(8, 'STl654', 'PA008', 'H08', '2024-07-28', '11:30:00', '2024-07-28', '14:00:00', 7, 4), 
(9, 'VWX321', 'PA009', 'I09', '2024-10-30', '17:40:00', '2024-10-30', '20:20:00', 12, 5), -- viagem 5
(10, 'YZA987', 'PA010', 'J10', '2024-10-30', '17:40:00', '2024-10-30', '20:20:00', 1, 5),
(11, 'BCD654', 'PA011', 'K11', '2024-10-30', '17:40:00', '2024-10-30', '20:20:00', 23, 5),
(12, 'EFG326', 'PA012', 'L12', '2024-10-30', '17:40:00', '2024-10-30', '20:20:00', 3, 5),
(13, 'HIJ984', 'PA013', 'M13', '2024-10-30', '17:40:00', '2024-10-30', '20:20:00', 8, 5),
(14, 'HIJ953', 'PA014', 'N14', '2024-11-03', '11:55:00', '2024-11-03', '14:30:00', 12, 6),
(15, 'NAP321', 'PA015', 'O15', '2024-11-03', '11:55:00', '2024-11-03', '14:30:00', 1, 6),
(16, 'PQR988', 'PA016', 'P16', '2024-11-03', '11:55:00', '2024-11-03', '14:30:00', 23, 6),
(17, 'STU655', 'PA017', 'Q17', '2024-11-03', '11:55:00', '2024-11-03', '14:30:00', 3, 6),
(18, 'VWX322', 'PA018', 'R18', '2024-11-03', '11:55:00', '2024-11-03', '14:30:00', 8, 6), 
(19, 'VWX340', 'PA019', 'S19', '2024-05-30', '12:45:00', '2024-05-30', '15:30:00', 15, 4), -- viagem 6
(20, 'BCD655', 'PA020', 'T20', '2024-05-30', '12:45:00', '2024-05-30', '15:30:00', 16, 4),
(21, 'EFG322', 'PA021', 'U21', '2024-05-30', '12:45:00', '2024-05-30', '15:30:00', 21, 4),
(22, 'HIJ989', 'PA022', 'V22', '2024-05-30', '12:45:00', '2024-05-30', '15:30:00', 25, 4),
(23, 'KLM554', 'PA023', 'W23', '2024-05-30', '12:45:00', '2024-05-30', '15:30:00', 27, 4),
(24, 'NOP121', 'PA024', 'X24', '2024-06-01', '13:15:00', '2024-06-01', '15:50:00', 15, 6),
(25, 'PQR387', 'PA025', 'Y25', '2024-06-01', '13:15:00', '2024-06-01', '15:50:00', 16, 6),
(26, 'STU644', 'PA026', 'Z26', '2024-06-01', '13:15:00', '2024-06-01', '15:50:00', 21, 6),
(27, 'VWX346', 'PA027', 'AA27', '2024-06-01', '13:15:00', '2024-06-01', '15:50:00', 25, 6),
(28, 'VWX343', 'PA028', 'AB28', '2024-06-01', '13:15:00', '2024-06-01', '15:50:00', 27, 6), 
(29, 'VWX347', 'PA029', 'AC29', '2024-02-09', '08:15:00', '2024-02-09', '10:50:00', 2, 5), -- viagem 7
(30, 'AFG322', 'PA030', 'AD30', '2024-02-09', '08:15:00', '2024-02-09', '10:50:00', 6, 5),
(31, 'HIJ986', 'PA031', 'AE31', '2024-02-09', '08:15:00', '2024-02-09', '10:50:00', 9, 5),
(32, 'HIJ981', 'PA032', 'AF32', '2024-02-09', '08:15:00', '2024-02-09', '10:50:00', 10, 5),
(33, 'NAO321', 'PA033', 'AG33', '2024-02-09', '08:15:00', '2024-02-09', '10:50:00', 26, 5),
(34, 'YQR987', 'PA034', 'AH34', '2024-02-09', '08:15:00', '2024-02-09', '10:50:00', 18, 5),
(35, 'SYL654', 'PA035', 'AI35', '2024-02-13', '11:45:00', '2024-02-13', '14:20:00', 2, 6),
(36, 'VWX341', 'PA036', 'AJ36', '2024-02-13', '11:45:00', '2024-02-13', '14:20:00', 6, 6),
(37, 'VWX344', 'PA037', 'AK37', '2024-02-13', '11:45:00', '2024-02-13', '14:20:00', 9, 6),
(38, 'VWX336', 'PA038', 'AL38', '2024-02-13', '11:45:00', '2024-02-13', '14:20:00', 10, 6),
(39, 'EFG321', 'PA039', 'AM39', '2024-02-13', '11:45:00', '2024-02-13', '14:20:00', 26, 6),
(40, 'HIJ982', 'PA040', 'AN40', '2024-02-13', '11:45:00', '2024-02-13', '14:20:00', 18, 6), 
(41, 'HIJ983', 'PA041', 'AO41', '2024-04-12', '15:15:00', '2024-04-12', '17:50:00', 22, 5), -- viagem 9
(42, 'NOP321', 'PA042', 'AP42', '2024-04-12', '15:15:00', '2024-04-12', '17:50:00', 5, 5),
(43, 'PQR917', 'PA043', 'AQ43', '2024-04-15', '17:40:00', '2024-04-15', '20:40:00', 22, 5),
(44, 'STU654', 'PA044', 'AR44', '2024-04-15', '17:40:00', '2024-04-15', '20:40:00', 5, 5), 
(45, 'VWX342', 'PA045', 'AS45', '2024-06-26', '13:55:00', '2024-06-26', '16:30:00', 17, 5), -- viagem 11
(46, 'VWX345', 'PA046', 'AT46', '2024-06-26', '13:55:00', '2024-06-26', '16:30:00', 29, 5),
(47, 'VWX326', 'PA047', 'AU47', '2024-06-29', '08:45:00', '2024-06-29', '11:20:00', 17, 6),
(48, 'EFG323', 'PA048', 'AV48', '2024-06-29', '08:45:00', '2024-06-29', '11:20:00', 29, 6);

INSERT INTO PACOTE_VIAGEM (id, foi_escolhido, id_solicitacao_viagem) VALUES
(1, true, 1),
(2, true, 2),
(3, true, 3),
(4, true, 4),
(5, true, 5),
(6, true, 6),
(7, true, 7),
(9, true, 9),
(10, true, 10),
(11, true, 11),
(12, true, 12);

INSERT INTO AGENDA_PASSEIO_VIAGEM (id_pacote_viagem, id_passeio, hora, data) VALUES
(1, 1, '09:00:00', '2024-02-13'),
(1, 2, '16:00:00', '2024-02-13'),
(1, 4, '09:00:00', '2024-02-14'),
(1, 5, '09:00:00', '2024-02-15'),

(2, 26, '09:00:00', '2024-07-24'),
(2, 27, '09:00:00', '2024-07-25'),
(2, 28, '09:00:00', '2024-07-26'),
(2, 29, '09:00:00', '2024-07-27'),

(3, 6, '17:00:00', '2024-12-28'),
(3, 7, '09:00:00', '2024-12-29'),
(3, 8, '09:00:00', '2024-12-30'),
(3, 9, '09:00:00', '2024-12-31'),
(3, 10, '14:00:00', '2024-01-02'),

(4, 11, '16:00:00', '2024-09-13'),
(4, 12, '09:00:00', '2024-09-14'),
(4, 13, '09:00:00', '2024-09-15'),
(4, 14, '11:00:00', '2024-09-16'),
(4, 15, '14:00:00', '2024-09-15'),

(5, 16, '10:00:00', '2024-10-31'),
(5, 17, '15:00:00', '2024-10-31'),
(5, 18, '17:30:00', '2024-10-31'),
(5, 19, '10:00:00', '2024-11-01'),
(5, 20, '09:00:00', '2024-11-02'),

(6, 25, '09:00:00', '2024-05-30'),

(7, 30, '09:00:00', '2024-02-09'),
(7, 31, '09:00:00', '2024-02-10'),
(7, 32, '09:00:00', '2024-02-11'),
(7, 33, '09:00:00', '2024-02-12'),
(7, 34, '09:00:00', '2024-02-13'),

(9, 40, '10:00:00', '2024-04-13'),
(9, 41, '16:00:00', '2024-04-13'),
(9, 42, '08:00:00', '2024-04-14'),

(10, 44, '10:00:00', '2024-02-09'), 
(10, 45, '10:25:00', '2024-02-09'), 
(10, 46, '19:00:00', '2024-02-09'), 
(10, 47, '10:00:00', '2024-02-10'), 
(10, 48, '08:00:00', '2024-02-11'),

(11, 49, '09:00:00', '2024-06-26'),
(11, 51, '08:30:00', '2024-06-27'),
(11, 50, '10:30:00', '2024-06-27'),
(11, 52, '15:00:00', '2024-06-28'),

(12, 7, '11:00:00', '2024-05-09'),
(12, 7, '11:00:00', '2024-05-10'),
(12, 7, '11:00:00', '2024-05-11'),
(12, 10, '09:00:00', '2024-05-09');

INSERT INTO PASSAGEM_AEREA_VIAGEM (id_pacote_viagem, id_passagem_aerea) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 5),
(5, 6),
(5, 7),
(5, 8),
(5, 9),
(5, 10),
(6, 1),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(6, 7),
(6, 8),
(6, 9),
(6, 10),
(7, 1),
(7, 2),
(7, 3),
(7, 4),
(7, 5),
(7, 6),
(7, 7),
(7, 8),
(7, 9),
(7, 10),
(7, 11),
(7, 12),
(9, 1),
(9, 2),
(9, 3),
(9, 4),
(11, 1),
(11, 2),
(11, 3),
(11, 4);

INSERT INTO PROCURA_VEICULO_VIAGEM (id_solicitacao_viagem, id_tipo_veiculo) VALUES
(1, 3), (1, 10),
(2, 9),
(5, 4), (5, 5),
(6, 4), (6, 9),
(7, 4),
(11, 5);

-- Inserir dados iniciais
INSERT INTO SITUACAO_ATENDIMENTO (id_solicitacao_viagem, id_status, data_hora_mudanca)
VALUES
    (1, 4, '2023-11-22 17:48:59'),
    (2, 4, '2023-10-11 19:45:22'),
    (3, 4, '2023-12-28 08:00:21'),
    (4, 4, '2023-11-04 03:23:20'),
    (5, 4, '2023-10-02 01:53:25'),
    (6, 4, '2023-11-24 07:34:58'),
    (7, 4, '2023-11-07 16:47:09'),
    (9, 4, '2023-09-21 04:54:53'),
    (10, 4, '2023-10-05 23:06:39'),
    (11, 4, '2023-09-10 12:29:25'),
    (12, 4, '2023-12-05 02:37:54');

-- Inserir mudanças de status
INSERT INTO SITUACAO_ATENDIMENTO (id_solicitacao_viagem, id_status, data_hora_mudanca)
VALUES
    -- Solicitação 1
    (1, 2, '2023-11-23 10:30:00'),  -- Mudança para "em analise"
    (1, 6, '2023-11-25 14:12:30'),  -- Mudança para "enviadas"
    (1, 1, '2023-11-26 18:45:12'),  -- Mudança para "arranjo"
    (1, 3, '2023-11-28 09:20:05');  -- Mudança para "finalizada"

-- Solicitação 2
INSERT INTO SITUACAO_ATENDIMENTO (id_solicitacao_viagem, id_status, data_hora_mudanca)
VALUES
    (2, 2, '2023-10-12 14:00:00'),
    (2, 6, '2023-10-15 08:30:45'),
    (2, 1, '2023-10-18 19:10:22'),
    (2, 3, '2023-10-20 10:55:00');

-- Solicitação 3
INSERT INTO SITUACAO_ATENDIMENTO (id_solicitacao_viagem, id_status, data_hora_mudanca)
VALUES
    (3, 2, '2023-12-29 15:00:00'),
    (3, 6, '2023-12-30 11:20:18'),
    (3, 1, '2024-01-02 09:35:40'),
    (3, 3, '2024-01-05 17:45:00');

-- Solicitação 4
INSERT INTO SITUACAO_ATENDIMENTO (id_solicitacao_viagem, id_status, data_hora_mudanca)
VALUES
    (4, 2, '2023-11-05 08:30:00'),  -- Mudança para "em analise"
    (4, 6, '2023-11-08 12:45:30'),  -- Mudança para "enviadas"
    (4, 1, '2023-11-10 15:20:12'),  -- Mudança para "arranjo"
    (4, 3, '2023-11-12 20:55:05');  -- Mudança para "finalizada"

-- Solicitação 5
INSERT INTO SITUACAO_ATENDIMENTO (id_solicitacao_viagem, id_status, data_hora_mudanca)
VALUES
    (5, 2, '2023-10-03 10:00:00'),
    (5, 6, '2023-10-06 14:20:45'),
    (5, 1, '2023-10-09 19:10:22'),
    (5, 3, '2023-10-12 10:35:00');

-- Solicitação 6
INSERT INTO SITUACAO_ATENDIMENTO (id_solicitacao_viagem, id_status, data_hora_mudanca)
VALUES
    (6, 2, '2023-11-25 10:00:00'),
    (6, 6, '2023-11-28 14:20:45'),
    (6, 1, '2023-12-01 19:10:22'),
    (6, 3, '2023-12-04 10:35:00');

-- Solicitação 7
INSERT INTO SITUACAO_ATENDIMENTO (id_solicitacao_viagem, id_status, data_hora_mudanca)
VALUES
    (7, 2, '2023-11-08 10:00:00'),
    (7, 6, '2023-11-11 14:20:45'),
    (7, 1, '2023-11-14 19:10:22'),
    (7, 3, '2023-11-17 10:35:00');

-- Solicitação 9
INSERT INTO SITUACAO_ATENDIMENTO (id_solicitacao_viagem, id_status, data_hora_mudanca)
VALUES
    (9, 2, '2023-09-22 10:00:00'),
    (9, 6, '2023-09-25 14:20:45'),
    (9, 1, '2023-09-28 19:10:22'),
    (9, 3, '2023-10-01 10:35:00');

-- Solicitação 10
INSERT INTO SITUACAO_ATENDIMENTO (id_solicitacao_viagem, id_status, data_hora_mudanca)
VALUES
    (10, 2, '2023-10-06 10:00:00'),
    (10, 6, '2023-10-09 14:20:45'),
    (10, 1, '2023-10-12 19:10:22'),
    (10, 3, '2023-10-15 10:35:00');

-- Solicitação 11
INSERT INTO SITUACAO_ATENDIMENTO (id_solicitacao_viagem, id_status, data_hora_mudanca)
VALUES
    (11, 2, '2023-09-11 10:00:00'),
    (11, 6, '2023-09-14 14:20:45'),
    (11, 1, '2023-09-17 19:10:22'),
    (11, 3, '2023-09-20 10:35:00');

-- Solicitação 12
INSERT INTO SITUACAO_ATENDIMENTO (id_solicitacao_viagem, id_status, data_hora_mudanca)
VALUES
    (12, 2, '2023-12-07 10:00:00'),
    (12, 6, '2023-12-10 14:20:45'),
    (12, 1, '2023-12-13 19:10:22'),
    (12, 3, '2023-12-16 10:35:00');

-- Solicitação 8
INSERT INTO SITUACAO_ATENDIMENTO (id_solicitacao_viagem, id_status, data_hora_mudanca)
VALUES
    (8, 4, '2023-11-25 00:38:05'),
    (8, 2, '2023-11-25 10:19:05'),
    (8, 5, '2023-11-25 10:25:22');

-- Inserir dados na tabela RESERVA_QUARTO
INSERT INTO RESERVA_QUARTO (
    numero_quarto,
    data_checkin,
    hora_checkin,
    previsao_dias_hospedagem,
    data_previsao_checkout,
    hora_previsao_checkout,
    valor_diaria,
    id_pacote_viagem,
    id_hospedaria
)
VALUES
    ('101', '2024-02-12', '14:00:00', 6, '2024-02-18', '12:00:00', 250.00, 1, 8), -- 1
    ('205', '2024-07-24', '15:30:00', 4, '2024-07-28', '11:00:00', 300.00, 2, 11), -- 2
    ('103', '2024-12-28', '12:00:00', 7, '2025-01-03', '10:00:00', 180.00, 3, 13), -- 3
    ('302', '2024-09-12', '08:00:00', 4, '2024-09-16', '08:00:00', 200.00, 4, 15), -- 4
    ('303', '2024-09-12', '08:00:00', 4, '2024-09-16', '08:00:00', 200.00, 4, 15),
    ('304', '2024-09-12', '08:00:00', 4, '2024-09-16', '08:00:00', 200.00, 4, 15), 
    ('415', '2024-10-30', '09:00:00', 4, '2024-11-03', '16:00:00', 120.00, 5, 16), -- 5
    ('416', '2024-10-30', '09:00:00', 4, '2024-11-03', '16:00:00', 120.00, 5, 16),
    ('417', '2024-10-30', '09:00:00', 4, '2024-11-03', '16:00:00', 120.00, 5, 16),
    ('101', '2024-05-30', '14:00:00', 3, '2024-06-01', '12:00:00', 100.00, 6, 18), -- 6
    ('201', '2024-02-09', '12:00:00', 4, '2024-02-13', '10:00:00', 350.00, 7, 20), -- 7 casa
    ('208', '2024-04-13', '10:00:00', 2, '2024-04-15', '14:00:00', 160.00, 9, 25), -- 9
    ('306', '2024-02-09', '12:00:00', 2, '2024-02-11', '12:00:00', 90.00, 10, 26), -- 10
    ('307', '2024-02-09', '12:00:00', 2, '2024-02-11', '12:00:00', 90.00, 10, 26),
    ('308', '2024-02-09', '12:00:00', 2, '2024-02-11', '12:00:00', 90.00, 10, 26),
    ('402', '2024-06-26', '14:00:00', 3, '2024-06-29', '10:00:00', 220.00, 11, 28), -- 11
    ('104', '2024-05-09', '10:00:00', 3, '2024-05-12', '12:00:00', 120.00, 12, 13); -- 12

-- Inserir dados na tabela RESERVA_VEICULO
INSERT INTO RESERVA_VEICULO (
    numero_veiculo,
    placa_veiculo,
    preco_diaria,
    data_inicio,
    hora_inicio,
    previsao_dias_aluguel,
    data_previsao_entrega,
    hora_previsao_entrega,
    id_pacote_viagem,
    id_tipo_veiculo,
    id_empresa_locadora
)
VALUES
    ('A123', 'ABC-1234', 120.00, '2024-02-12', '14:00:00', 6, '2024-02-18', '12:00:00', 1, 3, 1),
    ('B456', 'DEF-5678', 150.00, '2024-07-24', '15:30:00', 4, '2024-07-28', '11:00:00', 2, 9, 1),
    ('C789', 'GHI-9101', 80.00, '2024-10-30', '09:00:00', 4, '2024-11-03', '16:00:00', 5, 4, 1),
    ('D012', 'JKL-2345', 100.00, '2024-05-30', '14:00:00', 3, '2024-06-01', '12:00:00', 6, 9, 1),
    ('E345', 'MNO-6789', 350.00, '2024-02-09', '12:00:00', 4, '2024-02-13', '10:00:00', 7, 4, 1),
    ('I567', 'YZA-1617', 220.00, '2024-06-26', '14:00:00', 3, '2024-06-29', '10:00:00', 11, 5, 1);

-- Inserir dados na tabela PAGAMENTO
INSERT INTO PAGAMENTO (valor, desconto, qtd_parcelas, data_hora_pagamento, id_metodo_pagamento, id_pacote_viagem)
VALUES
    (2220, 0, 1, '2023-11-22 17:48:59', 2, 1),
    (1800, 0, 1, '2023-10-11 19:45:22', 6, 2),
    (1660, 50, 1, '2023-12-28 08:00:21', 3, 3),
    (1425, 0, 1, '2023-11-04 03:23:20', 5, 4),
    (1760, 0, 1, '2023-10-02 01:53:25', 2, 5),
    (600, 0, 1, '2023-11-24 07:34:58', 4, 6),
    (2800, 0, 1, '2023-11-07 16:47:09', 7, 7),
    (1412, 0, 1, '2023-09-21 04:54:53', 8, 9),
    (540, 0, 1, '2023-10-05 23:06:39', 9, 10),
    (1320, 0, 1, '2023-09-10 12:29:25', 2, 11),
    (360, 0, 1, '2023-12-05 02:37:54', 1, 12),
    (1425, 0, 3, '2023-11-04 03:23:20', 2, 4);

COMMIT;

