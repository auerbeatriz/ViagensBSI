-- Backup dados estaticos do banco

INSERT INTO TIPO_VEICULO (descricao) VALUES
('Bicicleta'),
('Caminhonete'),
('Carro automático'),
('Carro básico econômico com ar condicionado'),
('Carro básico econômico sem ar condicionado'),
('Carro blindado'),
('Carro compacto'),
('Carro de luxo'),
('Carro esportivo'),
('Carro executivo'),
('Carro familiar'),
('Carro utilitário'),
('Minivan'),
('Motocicleta'),
('Pickup'),
('Quadriciclo'),
('Triciclo'),
('Van'),
('Vespa');

INSERT INTO RAMO_EMPRESA (descricao) VALUES
('Aluguel de veículos'),
('Hotelaria'),
('Transporte aéreo de passageiros'),
('Turismo');

INSERT INTO TIPO_DOCUMENTO (descricao) VALUES
('Carteira de Trabalho'),
('Certidão de Nascimento'),
('CNH'),
('CPF'),
('Passaporte'),
('RG');

INSERT INTO TIPO_CONTATO (descricao) VALUES
('E-mail'),
('Facebook'),
('Instagram'),
('Telefone celular'),
('Telefone fixo'),
('Tiktok'),
('Twitter');

INSERT INTO STATUS (descricao) VALUES
('Arranjo de propostas'),
('Em análise'),
('Finalizada'),
('Novo'),
('Perdida'),
('Propostas enviadas');

INSERT INTO METODO_PAGAMENTO (descricao) VALUES
('Ame Digital'),
('Cartão de crédito'),
('Cartão de débito'),
('Dinheiro'),
('DOC'),
('Paypal'),
('Picpay'),
('Pix'),
('TED');

-- Inserir dados na tabela ESTADO
INSERT INTO ESTADO (nome, sigla) VALUES
('Rio de Janeiro', 'RJ'),
('Santa Catarina', 'SC'),
('Bahia', 'BA'),
('São Paulo', 'SP'),
('Paraná', 'PR'),
('Pernambuco', 'PE'),
('Ceará', 'CE'),
('Amazonas', 'AM'),
('Rio Grande do Sul', 'RS'),
('Rio Grande do Norte', 'RN'),
('Espírito Santo', 'ES');

-- Inserir dados na tabela CIDADE
INSERT INTO CIDADE (nome, id_estado) VALUES
('Rio de Janeiro', 1),    -- Rio de Janeiro, RJ
('Paraty', 1), -- Rio de Janeiro, RJ
('Búzios', 1), -- Rio de Janeiro
('Cabo Frio', 1), -- Rio de Janeiro
('Arraial do Cabo', 1), -- Rio de Janeiro
('Angra dos Reis', 1), -- Rio de Janeiro
('Balneário Camboriú', 2), -- Santa Catarina
('Florianópolis', 2),    -- Florianópolis, SC
('Blumenau', 2), -- Santa Catarina
('Salvador', 3),         -- Salvador, BA
('Porto Seguro', 3), -- Bahia
('Trancoso', 3), -- Bahia
('Arraial d’Ajuda', 3), -- Bahia
('Praia do Forte', 3), -- Bahia
('Morro de São Paulo', 3), -- Bahia
('Ilhéus', 3), -- Bahia
('Lençóis', 3), -- Bahia
('Chapada Diamantina', 3), -- Bahia
('Caraíva', 3), -- Bahia
('São Paulo', 4),        -- São Paulo, SP
('Foz do Iguaçu', 5),    -- Foz do Iguaçu, PR
('Curitiba', 5), -- Paraná
('Porto de Galinhas', 6),-- Porto de Galinhas, PE
('Fernando de Noronha', 6), -- Pernambuco
('Recife', 6), -- Pernambuco
('Olinda', 6), -- Pernambuco
('Fortaleza', 7),        -- Fortaleza, CE
('Jericoacoara', 7), -- Ceará
('Canoa Quebrada', 7), -- Ceará
('Manaus', 8),           -- Manaus, AM
('Natal', 10),           -- Natal, RN
('São Miguel do Gostoso', 10), -- Rio Grande do Norte
('Praia de Genipabu', 10), -- Rio Grande do Norte
('Praia de Ponta Negra', 10), -- Rio Grande do Norte
('Praia de Maracajaú', 10), -- Rio Grande do Norte
('Gramado', 9),         -- Gramado, RS
('Porto Alegre', 9), -- Rio Grande do Sul
('Caxias do Sul', 9), -- Rio Grande do Sul
('Vitória', 11), -- Espírito Santo
('Serra', 11), -- Espírito Santo
('Vila Velha', 11), -- Espírito Santo
('Cariacica', 11), -- Espírito Santo
('Viana', 11), -- Espírito Santo
('Domingos Martins', 11), -- Espírito Santo
('Santa Teresa', 11), -- Espírito Santo
('Santa Leopoldina', 11), -- Espírito Santo
('Marataízes', 11), -- Espírito Santo
('Linhares', 11), -- Espírito Santo
('Colantina', 11), -- Espírito Santo
('Afonso Cláudio', 11); -- Espírito Santo

INSERT INTO TIPO_NECESSIDADE_ESPECIAL (descricao) VALUES
('Obesidade'),
('Gravidez'),
('Cardiopata'),
('Idoso'),
('Diabetes'),
('Transplantado'),
('Distúrbios Respiratórios'),
('Escoliose acentuada'),
('Fotofobia'),
('Surdez'),
('Surdocegueira'),
('Deficiência auditiva'),
('Baixa visão'),
('Cegueira'),
('Deficiência intelectual'),
('Deficiência física'),
('Autismo'),
('Epilepsia'),
('Esquizofrenia');

INSERT INTO BENEFICIO_HOSPEDAGEM (nome) VALUES
('Piscina'),
('Piscina coberta'),
('Piscina aquecida'),
('Salão de jogos'),
('Café da manhã'),
('Almoço'),
('Jantar'),
('All Inclusive'),
('Playground'),
('Pesque e pague'),
('Elevador'),
('Coworking'),
('Auditório'),
('Spa'),
('Massagem'),
('Passeio a cavalo'),
('Passeio de charrete'),
('Café colonial'),
('Wifi gratuito'),
('Pet friendly');

INSERT INTO CLIENTE (nome_social, nome_registro, data_nascimento) VALUES
('Osvaldo Manuel Figueiredo', 'Osvaldo Manuel Figueiredo', '1991-01-20'),
('César Murilo Novaes', 'César Murilo Novaes', '1969-07-11'),
('Luna Sueli da Rocha', 'Luna Sueli da Rocha', '1993-04-12'),
('Flávia Juliana Francisca de Paula', 'Flávia Juliana Francisca de Paula', '1983-08-02'),
('Luiz Theo Lopes', 'Luiz Theo Lopes', '1974-05-11'),
('Lavínia Renata Isabelly Brito', 'Lavínia Renata Isabelly Brito', '1947-06-18'),
('Danilo Enzo Gonçalves', 'Danilo Enzo Gonçalves', '1962-03-12'),
('Beatriz Letícia Lorena da Mota', 'Beatriz Letícia Lorena da Mota', '2000-02-24'),
('Camila Cristiane Drumond', 'Camila Cristiane Drumond', '1989-11-14'),
('Filipe Giovanni Isaac Almada', 'Filipe Giovanni Isaac Almada', '1984-07-20'),
('Osvaldo Luís Raul Barros', 'Osvaldo Luís Raul Barros', '1953-04-26'),
('Kaique Bernardo Benício da Mata', 'Kaique Bernardo Benício da Mata', '1992-02-09'),
('Tatiane Joana Sales', 'Tatiane Joana Sales', '1946-11-12'),
('Patrícia Luiza Jennifer Silveira', 'Patrícia Luiza Jennifer Silveira', '1958-07-10'),
('Antônia Letícia Rodrigues', 'Antônia Letícia Rodrigues', '1996-03-12'),
('Isabel Lívia Assis', 'Isabel Lívia Assis', '2000-01-13'),
('Olivia Daniela Débora Aparício', 'Olivia Daniela Débora Aparício', '1954-03-04'),
('Sarah Carolina Elisa Nunes', 'Sarah Carolina Elisa Nunes', '1976-10-05'),
('Sueli Maitê Pereira', 'Sueli Maitê Pereira', '1989-06-12'),
('Kauê Leandro Castro', 'Kauê Leandro Castro', '1955-10-20'),
('Isabelle Eliane Fernandes', 'Isabelle Eliane Fernandes', '1997-05-21'),
('Cláudia Rafaela Simone Almeida', 'Cláudia Rafaela Simone Almeida', '1977-11-01'),
('Noah Ian Carlos da Luz', 'Noah Ian Carlos da Luz', '2003-08-26'),
('Lívia Rosa Lívia da Rosa', 'Lívia Rosa Lívia da Rosa', '1951-05-21'),
('Valentina Elaine Nogueira', 'Valentina Elaine Nogueira', '1997-06-25'),
('Noah Daniel Oliveira', 'Noah Daniel Oliveira', '1946-09-14'),
('Brenda Simone Valentina Martins', 'Brenda Simone Valentina Martins', '1998-09-17'),
('Diego Juan Rezende', 'Diego Juan Rezende', '1959-04-20'),
('César Gabriel Costa', 'César Gabriel Costa', '1954-01-25'),
('Otávio Thiago Nicolas da Conceição', 'Otávio Thiago Nicolas da Conceição', '1966-10-01');

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
(   nome,
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
('Patrícia: Arraial do Cabo - Balneário Camboriu', 5000, 15000, '2024-02-12', '2024-02-18', 
'Gostamos de passeios tranquilos e com conforto, como passeios de lancha, ou passeios fechados.', 'Fileira dupla, apenas. Vôo curto e sem conexões, se possível.', 
'Local bonito, confortável, de preferência com algum serviço de conveniência 24 horas.', 'Somos um casal muito apaixonado, que ama viajar, comer, desfrutar do que há de bom na vida.',
5, 7, 14),
('Patrícia: Arraial do Cabo - Chapada Diamantina', 5000, 15000, '2024-07-24', '2024-07-28', 
'Queremos muitos passeios ao ar livre, com contato com a natureza.', 'Fileira dupla, apenas.', 
'Local com bastante contato com a natureza, reservado. Não muito longe dos passeios e que tenha refeições no local.', 'Somos um casal muito apaixonado, que ama viajar, comer, desfrutar do que há de bom na vida.',
5, 18, 14),
('Patrícia: Arraial do Cabo - Paraty', 3000, 15000, '2024-12-28', '2025-01-03', 
'Não é a primeira vez que vamos ao Rio de Janeiro, queremos passeios diferentes e tranquilos, mas ao mesmo tempo aproveitar o ano novo na cidade maravilhosa', 'Vamos de carro.', 
'Queremos nos hospedar no Copacabana Palace na noite de ano novo. Nos outros dias, podemos ficar em outros hotéis próximos, se estourar o orçamento.', 'Somos um casal muito apaixonado, que ama viajar, comer, desfrutar do que há de bom na vida.',
5, 18, 14),
('Patrícia: Arraial do Cabo - Paraty', 3000, 15000, '2024-12-28', '2025-01-03', 
'Não é a primeira vez que vamos ao Rio de Janeiro, queremos passeios diferentes e tranquilos, mas ao mesmo tempo aproveitar o ano novo na cidade maravilhosa', 'Vamos de carro.', 
'Queremos nos hospedar no Copacabana Palace na noite de ano novo. Nos outros dias, podemos ficar em outros hotéis próximos, se estourar o orçamento.', 'Somos um casal muito apaixonado, que ama viajar, comer, desfrutar do que há de bom na vida.',
5, 18, 14),

INSERT INTO ENDERECO (logradouro, numero, cep, id_cidade) VALUES
('Rua Ricardo de Assis Pereira', 636, '13563650', 20),
('Rua José Pedro Maduro', 45, '23071050', 1),
('Escadaria Luiz Fernando Silva', 1893, '29046024', 39),

INSERT INTO EMPRESA (razao_social, nome_fantasia, cnpj, id_ramo_empresa, id_endereco) VALUES
('Locadora Sônico SA', 'Locadora Sônico', '34973912000161', 1, 1),
('Locadora Local SA', 'Locadora Legal', '61547483000133', 1, 2),
('Speedy Locadora SA', 'Speedy Locadora', '03562499000119', 1, 3)

INSERT INTO CONTATO_EMPRESA (id_empresa, id_tipo_contato, descricao) VALUES
(1, 1, 'contato@locadorasonico.com.br'),
(1, 5, '1136660482'),
(1, 4, '11988877307'),
(2, 5, '2128716698'),
(2, 4, '21983629154'),
(2, 1, 'contact@legalocadora.com'),
(3, 1, 'contate-nos@speedy.locadora.com'),
(3, 4, '27999822085'),
