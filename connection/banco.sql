DROP DATABASE IF EXISTS insetos_db;
CREATE DATABASE IF NOT EXISTS insetos_db;
USE insetos_db;

CREATE TABLE IF NOT EXISTS usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    email_usuario VARCHAR(100) NOT NULL UNIQUE,
    senha_usuario VARCHAR(255) NOT NULL, -- Suporta o hash seguro (ex: BCrypt)
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS insetos (
    id_insetos INT AUTO_INCREMENT PRIMARY KEY,
    nome_insetos VARCHAR(50) NOT NULL,
    nc_insetos VARCHAR(50) NOT NULL,
    ordem_insetos VARCHAR(65) NOT NULL DEFAULT 'Insecta',
    familia_insetos VARCHAR(65) NOT NULL,
    dieta_insetos VARCHAR(100) NOT NULL,
    destaque BOOLEAN NOT NULL DEFAULT 0,
    curiosidade TEXT,
    foto_insetos TEXT,
    
    INDEX idx_nome (nome_insetos),
    INDEX idx_familia (familia_insetos)
);

CREATE TABLE IF NOT EXISTS favoritos (
    id_usuario INT,
    id_insetos INT,
    PRIMARY KEY (id_usuario, id_insetos),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (id_insetos) REFERENCES insetos(id_insetos) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS habitats (
    id_habitats INT AUTO_INCREMENT PRIMARY KEY,
    nome_habitats VARCHAR(50) NOT NULL,
    clima_habitats VARCHAR(50),
    bioma_habitats VARCHAR(65),
    descricao_habitats TEXT
);

CREATE TABLE IF NOT EXISTS inseto_habitats (
    id_insetos INT,
    id_habitats INT,
    PRIMARY KEY (id_insetos, id_habitats),
    FOREIGN KEY (id_insetos) REFERENCES insetos(id_insetos) ON DELETE CASCADE,
    FOREIGN KEY (id_habitats) REFERENCES habitats(id_habitats) ON DELETE CASCADE
);

INSERT INTO insetos(nome_insetos, nc_insetos, ordem_insetos, familia_insetos, dieta_insetos, curiosidade) VALUES
('Besouro Rinoceronte', 'Oryctes nasicornis', 'insetos', 'Scarabaeidae', 'Detritívoro', 'Consegue levantar até vezes o seu próprio peso, equivalente a um humano erguer vários carros.'),
('Besouro Hércules', 'Dynastes hercules', 'insetos', 'Scarabaeidae', 'Detritívoro', 'É considerado um dos maiores insetoss do mundo e possui um chifre enorme usado para disputas territoriais.'),
('Besouro Rola Bosta', 'Scarabaeus sacer', 'insetos', 'Scarabaeidae', 'Coprófago', 'Navega guiando se pela luz da Via Láctea para rolar suas bolas de esterco em linha reta.'),
('Besouro Golias', 'Goliathus goliatus', 'insetos', 'Scarabaeidae', 'Detritívoro', 'Pode pesar mais de gramas na fase larval, sendo um dos insetoss mais pesados da Terra.'),
('Besouro Elefante', 'Megasoma elephas', 'insetos', 'Scarabaeidae', 'Detritívoro', 'Seu nome vem de seu grande porte e do chifre curvado que lembra a tromba de um elefante.'),
('Besouro Marmorado', 'Anomala dubia', 'insetos', 'Scarabaeidae', 'Herbívoro', 'Suas larvas vivem enterradas no solo se alimentando de raízes em decomposição por meses.'),
('Besouro Verde das Flores', 'Cetonia aurata', 'insetos', 'Scarabaeidae', 'Nectarívoro', 'Possui uma coloração metálica brilhante que confere camuflagem natural entre folhagens e pétalas.'),
('Besouro Atlas', 'Chalcosoma atlas', 'insetos', 'Scarabaeidae', 'Detritívoro', 'Os machos usam seus chifres tridivididos para arremessar rivais para longe durante brigas por fêmeas.'),
('Besouro Ouro', 'Chrysina resplendens', 'insetos', 'Scarabaeidae', 'Herbívoro', 'Sua carcaça brilha como ouro puro devido a estruturas microscópicas que refletem a luz.'),
('Besouro das Videiras', 'Pelidnota punctata', 'insetos', 'Scarabaeidae', 'Herbívoro', 'Atrai se facilmente por luzes artificiais durante as noites quentes de verão.'),
('Besouro Violino', 'Mormolyce phyllodes', 'insetos', 'Carabidae', 'Carnívoro', 'Possui um corpo extremamente achatado e alongado, adaptado para viver sob cascas finas de árvores.'),
('Besouro Bombardeiro', 'Brachinus crepitans', 'insetos', 'Carabidae', 'Carnívoro', 'Dispara um jato químico fervendo a °C misturando compostos explosivos em seu abdômen.'),
('Besouro Caçador Dourado', 'Calosoma sycophanta', 'insetos', 'Carabidae', 'Carnívoro', 'É um excelente predador de lagartas desfolhadoras, ajudando a controlar pragas florestais.'),
('Besouro Tigre Verde', 'Cicindela campestris', 'insetos', 'Carabidae', 'Carnívoro', 'Corre tão rápido que precisa parar de enxergar temporariamente para processar as imagens visuais.'),
('Besouro Carabídeo Violeta', 'Carabus violaceus', 'insetos', 'Carabidae', 'Carnívoro', 'Exala um odor defensivo forte e desagradável quando ameaçado por predadores.'),
('Besouro Corredor Noturno', 'Nebria brevicollis', 'insetos', 'Carabidae', 'Carnívoro', 'Ativo durante a noite, caça ativamente aranhas e outros insetoss no solo da floresta.'),
('Besouro Tigre Praiano', 'Cicindela hybrida', 'insetos', 'Carabidae', 'Carnívoro', 'Habita dunas de areia costeiras, onde caça pequenas presas com mandíbulas afiadas.'),
('Besouro Caçador Catarina', 'Calosoma inquisitor', 'insetos', 'Carabidae', 'Carnívoro', 'Capaz de subir em copas de árvores para caçar lagartas vorazes que atacam carvalhos.'),
('Besouro Grão Negro', 'Harpalus rufipes', 'insetos', 'Carabidae', 'Onívoro', 'Embora seja carnívoro, ocasionalmente consome sementes e grãos caídos no solo.'),
('Besouro Bombardeiro Gigante', 'Pheropsophus verticalis', 'insetos', 'Carabidae', 'Carnívoro', 'Possui uma câmara de reação interna mais desenvolvida, permitindo múltiplos disparos químicos consecutivos.'),
('Besouro Sombrio de Cape', 'Circellium bacchus', 'insetos', 'Scarabaeidae', 'Coprófago', 'Um dos poucos Besouros dung que adaptaram se perfeitamente a climas áridos sem voar.'),
('Besouro do Deserto de Namibe', 'Pachysoma striatum', 'insetos', 'Scarabaeidae', 'Detritívoro', 'Recolhe umidade da neblina matinal usando ranhuras especiais em suas costas.'),
('Besouro Cadeia de Avis', 'Pachysoma denticolle', 'insetos', 'Scarabaeidae', 'Detritívoro', 'Caminha por areias quentes do deserto em busca de detritos orgânicos levados pelo vento.'),
('Besouro Rola Bosta Caminhador', 'Scarabaeus ambiguus', 'insetos', 'Scarabaeidae', 'Coprófago', 'Em vez de rolar, empurra esterco usando as pernas traseiras adaptadas como pás.'),
('Besouro do Deserto Coletor', 'Pachysoma hippocrates', 'insetos', 'Scarabaeidae', 'Detritívoro', 'Suas patas curtas e robustas evitam que afunde na areia fofa durante o forrageamento.'),
('Escaravelho Sombrio de Richtersveld', 'Circellium morbillosum', 'insetos', 'Scarabaeidae', 'Coprófago', 'Sobrevive a variações térmicas extremas em montanhas áridas da África do Sul.'),
('Besouro Rola Bosta Gordo', 'Eucranium arachnoides', 'insetos', 'Scarabaeidae', 'Coprófago', 'Possui um abdômen abaulado que armazena reservas de gordura para períodos de escassez.'),
('Besouro Corredor das Pampas', 'Glyphoderus sterquilinus', 'insetos', 'Scarabaeidae', 'Coprófago', 'Adapta se a campos abertos gramados, correndo rapidamente entre touceiras de capim.'),
('Besouro Escavador Siderus', 'Glyphoderus monticola', 'insetos', 'Scarabaeidae', 'Coprófago', 'Cava galerias subterrâneas profundas para proteger sua fonte de alimento de outros insetoss.'),
('Besouro Caminhador Anactus', 'Anactus edentulus', 'insetos', 'Scarabaeidae', 'Detritívoro', 'Usa seu exoesqueleto espesso para resistir à dessecação sob o sol escaldante.'),
('Besouro Caracol Carcaju', 'Cychrus caraboides', 'insetos', 'Carabidae', 'Carnívoro', 'Suas mandíbulas estreitas são perfeitamente adaptadas para extrair lesmas de dentro de suas conchas.'),
('Besouro Terrestre Coriáceo', 'Carabus coriaceus', 'insetos', 'Carabidae', 'Carnívoro', 'Um dos maiores Besouros terrestres da Europa, incapaz de voar devido aos élitros soldados.'),
('Besouro Cego das Cavernas', 'Anophthalmus hitleri', 'insetos', 'Carabidae', 'Carnívoro', 'Vivendo na mais completa escuridão, perdeu os olhos e a pigmentação ao longo da evolução.'),
('Besouro Pedregal Gigante', 'Anthia thoracic', 'insetos', 'Carabidae', 'Carnívoro', 'Possui glândulas de defesa potentes capazes de cuspir substâncias irritantes a distâncias curtas.'),
('Besouro Corredor Ibérico', 'Carabus rugosus', 'insetos', 'Carabidae', 'Carnívoro', 'Possui coloração escura fosca que ajuda na absorção rápida de calor nas manhãs frias.'),
('Besouro Escavador Sombrio', 'Scarites buparius', 'insetos', 'Carabidae', 'Carnívoro', 'Passa o dia escondido sob pedras grandes, saindo apenas na penumbra para caçar.'),
('Besouro Devorador de Lesmas', 'Carabus nemoralis', 'insetos', 'Carabidae', 'Carnívoro', 'Aliado natural dos agricultores por controlar populações de moluscos pragas em hortas.'),
('Besouro Tigre Sem Asas', 'Manticora imperator', 'insetos', 'Carabidae', 'Carnívoro', 'Um predador voraz e robusto de savanas secas, caçando com investidas rápidas e agressivas.'),
('Besouro Predador de Oito Pontos', 'Anthia sexguttata', 'insetos', 'Carabidae', 'Carnívoro', 'Exibe marcações chamativas em seu corpo para alertar predadores sobre sua toxicidade.'),
('Besouro Terrestre Dourado', 'Carabus auratus', 'insetos', 'Carabidae', 'Carnívoro', 'Brilha com tons metálicos iridescentes quando exposto à luz direta do sol.'),
('Louva a Deus Orquídea', 'Hymenopus coronatus', 'insetos', 'Hymenopodidae', 'Carnívoro', 'Mimiciza perfeitamente uma flor de orquídea para atrair polinizadores inocentes direto para seu bote.'),
('Borboleta monarca', 'Danaus plexippus', 'insetos', 'Nymphalidae', 'Herbívoro', 'Famosa por sua migração multigeracional de milhares de quilômetros entre a América do Norte e o México.'),
('Abelha europeia', 'Apis mellifera', 'insetos', 'Apidae', 'Nectarívoro', 'Fundamental para a polinização de cultivos agrícolas e produção global de mel.'),
('Formiga cortadeira', 'Atta cephalotes', 'insetos', 'Formicidae', 'Herbívoro', 'Cortam pedaços de folhas para cultivar o fungo subterrâneo que serve de alimento para a colônia.'),
('Libélula azul', 'Anax imperator', 'insetos', 'Aeshnidae', 'Carnívoro', 'Ágil predadora aérea com uma taxa de sucesso de captura de presas superior a %.'),
('Joaninha de Sete Pontos', 'Coccinella septempunctata', 'insetos', 'Coccinellidae', 'Carnívoro', 'insetos benéfico que consome vorazmente pulgões nas plantações.'),
('Gafanhoto migratório', 'Locusta migratoria', 'insetos', 'Acrididae', 'Herbívoro', 'Capaz de se reunir em grandes enxames destrutivos que devastam plantações inteiras.'),
('Vaga lume Comum', 'Photinus pyralis', 'insetos', 'Lampyridae', 'Carnívoro', 'Produz luz fria através de bioluminescência abdominal para atrair parceiros sexuais.'),
('Bicho pau Gigante', 'Extatosoma tiaratum', 'insetos', 'Phasmatidae', 'Herbívoro', 'Mestre supremo da camuflagem que se parece perfeitamente com folhas secas e espinhosas.'),
('Cigarra comum', 'Lyristes plebejus', 'insetos', 'Cicadidae', 'Herbívoro', 'Emite um som estridente característico através de membranas chamadas timbales.'),
('Mariposa luna', 'Actias luna', 'insetos', 'Saturniidae', 'Herbívoro', 'Mariposa noturna de coloração verde translúcida que não possui boca na fase adulta.'),
('Mosca varejeira', 'Calliphora vicina', 'insetos', 'Calliphoridae', 'Detritívoro', 'Importante na decomposição de matéria orgânica e em investigações forenses.'),
('Percevejo verde', 'Nezara viridula', 'insetos', 'Pentatomidae', 'Herbívoro', 'Libera um odor defensivo forte e desagradável quando ameaçado ou manuseado.'),
('Tesourinha comum', 'Forficula auricularia', 'insetos', 'Forficulidae', 'Omnívoro', 'Reconhecida pelos cercos em forma de pinça na extremidade do abdome.'),
('Louva deus comum', 'Mantis religiosa', 'insetos', 'Mantidae', 'Carnívoro', 'Predador de emboscada paciente com excelente visão estereoscópica.'),
('Abelha carpintaria', 'Xylocopa virginica', 'insetos', 'Apidae', 'Nectarívoro', 'Fura a madeira para construir seus ninhos em galerias complexas.'),
('Pulga dos gatos', 'Ctenocephalides felis', 'insetos', 'Pulicidae', 'Hematófago', 'Ectoparasita sem asas capaz de saltar dezenas de vezes o seu próprio comprimento.'),
('Barata americana', 'Periplaneta americana', 'insetos', 'Blattidae', 'Detritívoro', 'insetos noturno extremamente resistente e rápido, adaptado a ambientes urbanos.'),
('Cupim subterrâneo', 'Coptotermes formosanus', 'insetos', 'Rhinotermitidae', 'Herbívoro', 'Vive em colônias complexas com castas especializadas e consome celulose de madeira.'),
('Vespa mandarina', 'Vespa mandarinia', 'insetos', 'Vespidae', 'Carnívoro', 'A maior espécie de vespa do mundo, conhecida por ataques devastadores a colmeias de abelhas.'),
('insetos folha', 'Phyllium bioculatum', 'insetos', 'Phylliidae', 'Herbívoro', 'Mimetiza folhas verdes com veias e texturas tão perfeitas que enganam predadores visuais.'),

('Caranguejeira Rosa', 'Grammostola rosea', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Aranha dócil nativa do Chile.'),
('Aranha Golias', 'Theraphosa blondi', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'A maior aranha do mundo.'),
('Tarântula de Joelhos Vermelhos', 'Brachypelma smithi', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Famosa pelas listras laranjas.'),
('Viúva Negra', 'Latrodectus mactans', 'Aracnídeos', 'Theridiidae', 'Carnívoro', 'Veneno neurotóxico potente.'),
('Aranha Marrom', 'Loxosceles reclusa', 'Aracnídeos', 'Sicariidae', 'Carnívoro', 'Veneno necrosante perigoso.'),
('Armadeira', 'Phoneutria nigriventer', 'Aracnídeos', 'Ctenidae', 'Carnívoro', 'Agressiva e venenosa.'),
('Aranha Saltadora Zebra', 'Salticus scenicus', 'Aracnídeos', 'Salticidae', 'Carnívoro', 'Pula grandes distâncias.'),
('Aranha Pescadora', 'Dolomedes tenebrosus', 'Aracnídeos', 'Pisauridae', 'Carnívoro', 'Caça na superfície da água.'),
('Aranha Lobo', 'Lycosa tarantula', 'Aracnídeos', 'Lycosidae', 'Carnívoro', 'Caça correndo no solo.'),
('Aranha Caranguejo', 'Misumena vatia', 'Aracnídeos', 'Thomisidae', 'Carnívoro', 'Camufla se em flores.'),
('Escorpião Amarelo', 'Tityus serrulatus', 'Aracnídeos', 'Buthidae', 'Carnívoro', 'Muito perigoso no Brasil.'),
('Escorpião Imperador', 'Pandinus imperator', 'Aracnídeos', 'Scorpionidae', 'Carnívoro', 'Gigante de garras grossas.'),
('Escorpião Negro', 'Tityus bahiensis', 'Aracnídeos', 'Buthidae', 'Carnívoro', 'Tronco escuro e pernas claras.'),
('Escorpião Dourado', 'Leiurus quinquestriatus', 'Aracnídeos', 'Buthidae', 'Carnívoro', 'Veneno altamente letal.'),
('Escorpião do Deserto', 'Hadrurus arizonensis', 'Aracnídeos', 'Caraboctonidae', 'Carnívoro', 'O maior da América do Norte.'),
('Carrapato Estrela', 'Amblyomma cajennense', 'Aracnídeos', 'Ixodidae', 'Hematófago', 'Transmite febre maculosa.'),
('Carrapato de Boi', 'Rhipicephalus microplus', 'Aracnídeos', 'Ixodidae', 'Hematófago', 'Praga na pecuária.'),
('Ácaro da Poeira', 'Dermatophagoides pteronyssinus', 'Aracnídeos', 'Pyroglyphidae', 'Detritívoro', 'Vive em colchões.'),
('Ácaro da Sarna', 'Sarcoptes scabiei', 'Aracnídeos', 'Sarcoptidae', 'Parasita', 'Escava a pele humana.'),
('Ácaro Vermelho', 'Trombidium holosericeum', 'Aracnídeos', 'Trombidiidae', 'Carnívoro', 'Pelagem vermelha aveludada.'),
('Opilião Comum', 'Phalangium opilio', 'Aracnídeos', 'Phalangiidae', 'Onívoro', 'Pernas muito finas e longas.'),
('Opilião Espinhoso', 'Acanthopachylus aculeatus', 'Aracnídeos', 'Gonyleptidae', 'Onívoro', 'Possui espinhos defensivos.'),
('Opilião Cavernícola', 'Gongylobelus sp.', 'Aracnídeos', 'Gongyleptidae', 'Onívoro', 'Vive em cavernas escuras.'),
('Opilião Laranja', 'Vonones sayi', 'Aracnídeos', 'Cosmetidae', 'Onívoro', 'Cor chamativa e odor forte.'),
('Amblipígio Gigante', 'Acanthophrynus coronatus', 'Aracnídeos', 'Phrynidae', 'Carnívoro', 'Assustador, mas sem veneno.'),
('Aranha Chicote', 'Phrynus marginemaculatus', 'Aracnídeos', 'Phrynidae', 'Carnívoro', 'Usa pernas como antenas.'),
('Aranha Camelo', 'Galeodes arabs', 'Aracnídeos', 'Galeodidae', 'Carnívoro', 'Corre rápido no deserto.'),
('Vinagrinho', 'Mastigoproctus giganteus', 'Aracnídeos', 'Thelyphonidae', 'Carnívoro', 'Dispara ácido acético.'),
('Aranha Teia de Funil', 'Atrax robustus', 'Aracnídeos', 'Atracidae', 'Carnívoro', 'Mortal da Austrália.'),
('Tarântula Azul', 'Cyriopagopus lividus', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Pernas de azul brilhante.'),
('Tarântula Metálica', 'Poecilotheria metallica', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Arborícola ameaçada.'),
('Aranha Espinhosa', 'Gasteracantha cancriformis', 'Aracnídeos', 'Araneidae', 'Carnívoro', 'Abdômen com espinhos.'),
('Aranha de Jardim', 'Argiope aurantia', 'Aracnídeos', 'Araneidae', 'Carnívoro', 'Teia em formato de zig zag.'),
('Caranguejeira Baboon', 'Pelinobius muticus', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Cava tocas no Quênia.'),
('Escorpião de Cauda Grossa', 'Androctonus australis', 'Aracnídeos', 'Buthidae', 'Carnívoro', 'Letal do norte da África.'),
('Escorpião de Casca', 'Centruroides sculpturatus', 'Aracnídeos', 'Buthidae', 'Carnívoro', 'Escala paredes.'),
('Pseudoescorpião', 'Chelifer cancroides', 'Aracnídeos', 'Cheliferidae', 'Carnívoro', 'Come ácaros em livros antigos.'),
('Palpígrado', 'Eukoenenia mirabilis', 'Aracnídeos', 'Eukoeneniidae', 'Carnívoro', 'Micro aracnídeo de solo.'),
('Carrapato de Cervo', 'Ixodes scapularis', 'Aracnídeos', 'Ixodidae', 'Hematófago', 'Vetor da doença de Lyme.'),
('Ácaro Aranha', 'Tetranychus urticae', 'Aracnídeos', 'Tetranychidae', 'Herbívoro', 'Praga agrícola que tece teias.'),
('Ricínuleo', 'Ricinoides atewa', 'Aracnídeos', 'Ricinoididae', 'Carnívoro', 'Parece um carrapato blindado.'),
('Solífugo Dourado', 'Eremobates pallipes', 'Aracnídeos', 'Eremobatidae', 'Carnívoro', 'Caça lagartos à noite.'),
('Aranha Espadachim', 'Dysdera crocata', 'Aracnídeos', 'Dysderidae', 'Carnívoro', 'Caçadora de tatuzinhos.'),
('Aranha Cuspidora', 'Scytodes thoracica', 'Aracnídeos', 'Scytodidae', 'Carnívoro', 'Cospe teia venenosa.'),
('Tarântula Tigre', 'Poecilotheria tigrinawesseli', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Padrão listrado.'),
('Escorpião Listrado', 'Centruroides vittatus', 'Aracnídeos', 'Buthidae', 'Carnívoro', 'Comum no Texas.'),
('Caranguejeira Veludo Negro', 'Grammostola pulchra', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Totalmente preta e mansa.'),
('Tarântula Esqueleto', 'Ephebopus murinus', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Pernas lembram ossos.'),
('Caranguejeira Caranguejo', 'Acanthoscurria geniculata', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Faixas brancas nas pernas.'),
('Opilião Lenhador', 'Leiobunum rotundum', 'Aracnídeos', 'Sclerosomatidae', 'Onívoro', 'Aglomera se em troncos.'),
('Ácaro de Foliculo', 'Demodex folliculorum', 'Aracnídeos', 'Demodicidae', 'Detritívoro', 'Vive nos poros do rosto.'),
('Carrapato de Galinha', 'Argas persicus', 'Aracnídeos', 'Argasidae', 'Hematófago', 'Carrapato mole de aves.'),
('Opilião Gigante', 'Trogulus tricarinatus', 'Aracnídeos', 'Trogulidae', 'Onívoro', 'Cobre se de terra.'),
('Aranha d Água', 'Argyroneta aquatica', 'Aracnídeos', 'Cybaeidae', 'Carnívoro', 'Constrói sino de ar embaixo d água.'),
('Aranha Lince', 'Peucetia viridans', 'Aracnídeos', 'Oxyopidae', 'Carnívoro', 'Pernas cheias de espinhos.'),
('Aranha Caçadora', 'Heteropoda venatoria', 'Aracnídeos', 'Sparassidae', 'Carnívoro', 'Gigante e rápida nas paredes.'),
('Aranha Gladiadora', 'Deinopis subrufa', 'Aracnídeos', 'Deinopidae', 'Carnívoro', 'Joga a teia como uma rede.'),
('Escorpião de Caverna', 'Typhlochactas mitchelli', 'Aracnídeos', 'Typhlochactidae', 'Carnívoro', 'Cego e vive nas trevas.'),
('Amblipígio das Cavernas', 'Charinus cavernicolus', 'Aracnídeos', 'Charinidae', 'Carnívoro', 'Totalmente cego.'),
('Solífugo Gigante', 'Solpuga venosa', 'Aracnídeos', 'Solpugidae', 'Carnívoro', 'Mordida dilacera presas.'),
('Aranha de Pelúcia', 'Eresus sandaliatus', 'Aracnídeos', 'Eresidae', 'Carnívoro', 'Macho vermelho com pintas pretas.'),

('Caranguejo Ermitão', 'Pagurus bernhardus', 'Crustáceos', 'Paguridae', 'Detritívoro', 'Mora em conchas vazias.'),
('Caranguejo Aranha Gigante', 'Macrocheira kaempferi', 'Crustáceos', 'Inachidae', 'Onívoro', 'O maior artrópode do mundo.'),
('Caranguejo Uçá', 'Ucides cordatus', 'Crustáceos', 'Ucididae', 'Herbívoro', 'Vive nos manguezais do Brasil.'),
('Siri Azul', 'Callinectes sapidus', 'Crustáceos', 'Portunidae', 'Onívoro', 'Possui nadadeiras traseiras fortes.'),
('Caranguejo Fantasma', 'Ocypode quadrata', 'Crustáceos', 'Ocypodidae', 'Detritívoro', 'Corre muito rápido na areia.'),
('Lagosta Suada', 'Panulirus argus', 'Crustáceos', 'Palinuridae', 'Carnívoro', 'Não possui pinças grandes.'),
('Lagosta Americana', 'Homarus americanus', 'Crustáceos', 'Nephropidae', 'Carnívoro', 'Garras esmagadoras gigantes.'),
('Camarão Limpador', 'Lysmata amboinensis', 'Crustáceos', 'Hippolytidae', 'Onívoro', 'Limpa parasitas de peixes.'),
('Camarão Pistola', 'Alpheus heterochaelis', 'Crustáceos', 'Alpheidae', 'Carnívoro', 'Gera bolha sônica que atordoa.'),
('Tamarutaca', 'Odontodactylus scyllarus', 'Crustáceos', 'Odontodactylidae', 'Carnívoro', 'Soco mais rápido do oceano.'),
('Tatuzinho de Jardim', 'Armadillidium vulgare', 'Crustáceos', 'Armadillidiidae', 'Detritívoro', 'Enrola se como uma bola.'),
('Isópode Gigante', 'Bathynomus giganteus', 'Crustáceos', 'Cirolanidae', 'Detritívoro', 'Devorador do fundo do mar.'),
('Craca Bolota', 'Balanus glandula', 'Crustáceos', 'Balanidae', 'Filtrador', 'Gruda em rochas e navios.'),
('Krill Antártico', 'Euphausia superba', 'Crustáceos', 'Euphausiidae', 'Filtrador', 'Base da teia alimentar do gelo.'),
('Caranguejo dos Coqueiros', 'Birgus latro', 'Crustáceos', 'Coenobitidae', 'Onívoro', 'Sobe em árvores e quebra cocos.'),
('Camarão Rosa', 'Penaeus paulensis', 'Crustáceos', 'Penaeidae', 'Detritívoro', 'Muito consumido na culinária.'),
('Caranguejo Chama Maré', 'Uca pugnax', 'Crustáceos', 'Ocypodidae', 'Detritívoro', 'Macho tem uma garra gigante.'),
('Caranguejo Yeti', 'Kiwa hirsuta', 'Crustáceos', 'Kiwaidae', 'Carnívoro', 'Garras peludas no fundo do mar.'),
('Lagosta Boxeadora', 'Enoplometopus debelius', 'Crustáceos', 'Enoplometopidae', 'Carnívoro', 'Pequena lagosta de recife.'),
('Camarão Imperador', 'Periclimenes imperator', 'Crustáceos', 'Palaemonidae', 'Onívoro', 'Pega carona em pepinos do mar.'),
('Siri Candeia', 'Portunus pelagicus', 'Crustáceos', 'Portunidae', 'Carnívoro', 'Siri nadador muito ágil.'),
('Lagostim Vermelho', 'Procambarus clarkii', 'Crustáceos', 'Cambaridae', 'Onívoro', 'Lagostim de água doce resistente.'),
('Camarão Bailarino', 'Rhynchocinetes durbanensis', 'Crustáceos', 'Rhynchocinetidae', 'Detritívoro', 'Movimento de dança na água.'),
('Pulga da Areia', 'Talitrus saltator', 'Crustáceos', 'Talitridae', 'Detritívoro', 'Pula nas praias à noite.'),
('Copépode Comum', 'Calanus finmarchicus', 'Crustáceos', 'Calanidae', 'Filtrador', 'Microcrustáceo planctônico.'),
('Caranguejo Decorador', 'Camposcia retusa', 'Crustáceos', 'Inachidae', 'Onívoro', 'Cola algas no corpo para camuflagem.'),
('Caranguejo Vampiro', 'Geosesarma dennerle', 'Crustáceos', 'Sesarmidae', 'Carnívoro', 'Cores roxas e olhos amarelos.'),
('Baratinha da Praia', 'Ligia oceanica', 'Crustáceos', 'Ligiidae', 'Detritívoro', 'Corre pelas pedras na maré baixa.'),
('Camarão Arlequim', 'Hymenocera picta', 'Crustáceos', 'Hymenoceridae', 'Carnívoro', 'Caça exclusivamente estrelas do mar.'),
('Percebe', 'Pollicipes pollicipes', 'Crustáceos', 'Pollicipedidae', 'Filtrador', 'Craca com pedúnculo comestível.'),
('Caranguejo Caleidoscópio', 'Gecarcoidea natalis', 'Crustáceos', 'Gecarcinidae', 'Herbívoro', 'Faz a marcha vermelha em Christmas Island.'),
('Camarão de Poça', 'Palaemon serratus', 'Crustáceos', 'Palaemonidae', 'Onívoro', 'Transparente com listras.'),
('Caranguejo Boxeador', 'Lybia tessellata', 'Crustáceos', 'Xanthidae', 'Onívoro', 'Segura anêmonas nas garras para defesa.'),
('Lagosta Sapateira', 'Scyllarides latus', 'Crustáceos', 'Scyllaridae', 'Onívoro', 'Sem garras, formato achatado.'),
('Siri da Lama', 'Scylla serrata', 'Crustáceos', 'Portunidae', 'Carnívoro', 'Vive enterrado no lodo.'),
('Caranguejo Fiddler', 'Uca tangeri', 'Crustáceos', 'Ocypodidae', 'Detritívoro', 'Agita a garra para cortejar.'),
('Isópode da Madeira', 'Porcellio scaber', 'Crustáceos', 'Porcellionidae', 'Detritívoro', 'Vive embaixo de troncos podres.'),
('Lagostim Azul', 'Cherax destructor', 'Crustáceos', 'Parastacidae', 'Onívoro', 'Garras fortes e cor azulada.'),
('Artêmia', 'Artemia salina', 'Crustáceos', 'Artemiidae', 'Filtrador', 'Sobrevive em lagos super salgados.'),
('Pulga d Água', 'Daphnia pulex', 'Crustáceos', 'Daphniidae', 'Filtrador', 'Nativa de águas doces paradas.'),
('Camarão Sangue', 'Lysmata debelius', 'Crustáceos', 'Hippolytidae', 'Onívoro', 'Vermelho forte com pintas brancas.'),
('Caranguejo Azul Terrestre', 'Cardisoma guanhumi', 'Crustáceos', 'Gecarcinidae', 'Herbívoro', 'Escava tocas na restinga.'),
('Caranguejo Dourado', 'Chaceon fenneri', 'Crustáceos', 'Geryonidae', 'Carnívoro', 'Vive em grandes profundidades.'),
('Lagosta de Água Doce', 'Astacus astacus', 'Crustáceos', 'Astacidae', 'Onívoro', 'Espécie europeia ameaçada.'),
('Caranguejo Rei', 'Paralithodes camtschaticus', 'Crustáceos', 'Lithodidae', 'Carnívoro', 'Altamente comercializado no Alasca.'),
('Camarão Bambu', 'Atyopsis moluccensis', 'Crustáceos', 'Atyidae', 'Filtrador', 'Usa patas em forma de leque para filtrar água.'),
('Caranguejo Japonês', 'Chionoecetes opilio', 'Crustáceos', 'Oregoniidae', 'Onívoro', 'Caranguejo das neves.'),
('Caranguejo Aranha Decorador', 'Oregonia gracilis', 'Crustáceos', 'Oregoniidae', 'Onívoro', 'Parece uma alga andante.'),
('Craca Gigante', 'Austromegabalanus psittacus', 'Crustáceos', 'Balanidae', 'Filtrador', 'Comestível na costa chilena.'),
('Isópode Parasita', 'Cymothoa exigua', 'Crustáceos', 'Cymothoidae', 'Parasita', 'Substitui a língua de peixes.'),
('Lagosta Pintada', 'Panulirus versicolor', 'Crustáceos', 'Palinuridae', 'Carnívoro', 'Coloração vibrante em recifes.'),
('Siri Boia', 'Arenaeus cribrarius', 'Crustáceos', 'Portunidae', 'Carnívoro', 'Comum em praias brasileiras.'),
('Caranguejo Pedra', 'Menippe mercenaria', 'Crustáceos', 'Menippidae', 'Carnívoro', 'Possui pinças esmagadoras massivas.'),
('Camarão Tigre Gigante', 'Penaeus monodon', 'Crustáceos', 'Penaeidae', 'Detritívoro', 'Muito criado em cativeiro.'),
('Camarão Sete Barbas', 'Xiphopenaeus kroyeri', 'Crustáceos', 'Penaeidae', 'Detritívoro', 'Comum no litoral sudeste brasileiro.'),
('Caranguejo de Galápagos', 'Grapsus grapsus', 'Crustáceos', 'Grapsidae', 'Herbívoro', 'Colorido e anda pelas pedras vulcânicas.'),
('Camarão Fantasma', 'Palaemonetes paludosus', 'Crustáceos', 'Palaemonidae', 'Detritívoro', 'Totalmente transparente.'),
('Lagosta de Lama', 'Thalassina anomala', 'Crustáceos', 'Thalassinidae', 'Detritívoro', 'Constrói montes de lama no mangue.'),
('Caranguejo Bola', 'Ilia nucleus', 'Crustáceos', 'Leucosiidae', 'Detritívoro', 'Carapaça perfeitamente esférica.'),
('Anfípode Cego', 'Niphargus', 'Crustáceos', 'Niphargidae', 'Onívoro', 'Vive em lençóis freáticos.'),
('Camarão Nariz de Agulha', 'Farfantepenaeus subtilis', 'Crustáceos', 'Penaeidae', 'Detritívoro', 'Possui rostro alongado.'),

('Caracol de Jardim', 'Cornu aspersum', 'Moluscos', 'Helicidae', 'Herbívoro', 'Deixa um rastro de muco por onde passa.'),
('Caramujo Gigante Africano', 'Lissachatina fulica', 'Moluscos', 'Achatinidae', 'Herbívoro', 'Praga invasora devoradora de hortas.'),
('Polvo Comum', 'Octopus vulgaris', 'Moluscos', 'Octopodidae', 'Carnívoro', 'Extremamente inteligente e mestre em camuflagem.'),
('Lula Colossal', 'Mesonychoteuthis hamiltoni', 'Moluscos', 'Cranchiidae', 'Carnívoro', 'Possui ganchos nos tentáculos.'),
('Lula Gigante', 'Architeuthis dux', 'Moluscos', 'Architeuthidae', 'Carnívoro', 'O olho é do tamanho de um prato.'),
('Ostra do Pacífico', 'Magallana gigas', 'Moluscos', 'Ostreidae', 'Filtrador', 'Cultivada no mundo todo para consumo.'),
('Mexilhão Dourado', 'Limnoperna fortunei', 'Moluscos', 'Mytilidae', 'Filtrador', 'Invasor de rios sul americanos.'),
('Náutilo', 'Nautilus pompilius', 'Moluscos', 'Nautilidae', 'Carnívoro', 'Fóssil vivo com concha em espiral.'),
('Choco', 'Sepia officinalis', 'Moluscos', 'Sepiidae', 'Carnívoro', 'Possui osso interno e muda de textura.'),
('Polvo de Anéis Azuis', 'Hapalochlaena maculosa', 'Moluscos', 'Octopodidae', 'Carnívoro', 'Pequeno mas com veneno mortal.'),
('Polvo Mímico', 'Thaumoctopus mimicus', 'Moluscos', 'Octopodidae', 'Carnívoro', 'Imita peixes venenosos e serpentes.'),
('Polvo Dumbo', 'Grimpoteuthis', 'Moluscos', 'Opisthoteuthidae', 'Carnívoro', 'Nadas com abas que lembram orelhas.'),
('Lesma do Mar Dragão Azul', 'Glaucus atlanticus', 'Moluscos', 'Glaucidae', 'Carnívoro', 'Flutua de cabeça para baixo comendo caravelas.'),
('Bailarina Espanhola', 'Hexabranchus sanguineus', 'Moluscos', 'Hexabranchidae', 'Carnívoro', 'Nada ondulando feito uma saia flamenca.'),
('Lesma Leopardo', 'Limax maximus', 'Moluscos', 'Limacidae', 'Onívoro', 'Acasala pendurada por um fio de muco.'),
('Caracol Cone', 'Conus geographus', 'Moluscos', 'Conidae', 'Carnívoro', 'Dispara um arpão de veneno fatal.'),
('Lula Vampira', 'Vampyroteuthis infernalis', 'Moluscos', 'Vampyroteuthidae', 'Detritívoro', 'Vira do avesso para se proteger.'),
('Marisco', 'Mytilus edulis', 'Moluscos', 'Mytilidae', 'Filtrador', 'Comum em costões rochosos.'),
('Vieira', 'Pecten maximus', 'Moluscos', 'Pectinidae', 'Filtrador', 'Foge nadando abrindo e fechando a concha.'),
('Ostra Perlífera', 'Pinctada margaritifera', 'Moluscos', 'Pteriidae', 'Filtrador', 'Produz pérolas negras valiosas.'),
('Berbigão', 'Cerastoderma edule', 'Moluscos', 'Cardiidae', 'Filtrador', 'Vive enterrado na areia de praias.'),
('Caramujo Trombeta', 'Charonia tritonis', 'Moluscos', 'Charoniidae', 'Carnívoro', 'Predador da estrela do mar coroa de espinhos.'),
('Polvo do Coco', 'Amphioctopus marginatus', 'Moluscos', 'Octopodidae', 'Carnívoro', 'Usa cascas de coco como escudo.'),
('Aruá do Mato', 'Megalobulimus', 'Moluscos', 'Megalobulimidae', 'Herbívoro', 'Caracol nativo gigante das florestas brasileiras.'),
('Caramujo Maçã', 'Pomacea maculata', 'Moluscos', 'Ampullariidae', 'Herbívoro', 'Bota ovos rosas fora da água.'),
('Lesma do Mar Ovelhinha', 'Costasiella kuroshimae', 'Moluscos', 'Costasiellidae', 'Herbívoro', 'Faz fotossíntese com algas que engole.'),
('Lula Voadora', 'Todarodes pacificus', 'Moluscos', 'Ommastrephidae', 'Carnívoro', 'Salta para fora da água planar longas distâncias.'),
('Siba Chocante', 'Metasepia pfefferi', 'Moluscos', 'Sepiidae', 'Carnívoro', 'Anda pelo fundo do mar e exibe cores pulsantes.'),
('Búzio', 'Bulla striata', 'Moluscos', 'Bullidae', 'Herbívoro', 'Concha lisa comum em colares.'),
('Caramujo de Aquário', 'Neritina natalensis', 'Moluscos', 'Neritidae', 'Herbívoro', 'Excelente devorador de algas em vidros.'),
('Argonauta', 'Argonauta argo', 'Moluscos', 'Argonautidae', 'Carnívoro', 'Fêmea cria uma concha fina para ovos.'),
('Lula de Vidro', 'Cranchia scabra', 'Moluscos', 'Cranchiidae', 'Carnívoro', 'Totalmente transparente para sumir na luz.'),
('Chiton', 'Chiton tuberculatus', 'Moluscos', 'Chitonidae', 'Herbívoro', 'Concha feita de placas sobrepostas.'),
('Lesma do Mar Pikachu', 'Thecacera pacifica', 'Moluscos', 'Polyceridae', 'Carnívoro', 'Amarela com pontas pretas.'),
('Bivalve Gigante', 'Tridacna gigas', 'Moluscos', 'Cardiidae', 'Filtrador', 'Pode pesar kg nos recifes de coral.'),
('Bredo', 'Ensis directus', 'Moluscos', 'Pharidae', 'Filtrador', 'Concha reta como uma navalha.'),
('Lesma Banana', 'Ariolimax columbianus', 'Moluscos', 'Ariolimacidae', 'Herbívoro', 'Amarela brilhante das florestas úmidas.'),
('Caracol Assassino', 'Clea helena', 'Moluscos', 'Buccinidae', 'Carnívoro', 'Usado em aquários para comer outros caracóis.'),
('Ostra do Mangue', 'Crassostrea rhizophorae', 'Moluscos', 'Ostreidae', 'Filtrador', 'Gruda nas raízes do mangue.'),
('Caracol de Fogo', 'Platymma tweediei', 'Moluscos', 'Chronidae', 'Onívoro', 'Corpo vermelho vibrante e concha preta.'),
('Polvo Pigmeu', 'Octopus wolfi', 'Moluscos', 'Octopodidae', 'Carnívoro', 'O menor polvo conhecido.'),
('Lula Lagalume', 'Watasenia scintillans', 'Moluscos', 'Enoploteuthidae', 'Carnívoro', 'Brilha forte no escuro para atrair presas.'),
('Pé de Pelicano', 'Aporrhais pespelecani', 'Moluscos', 'Aporrhaidae', 'Onívoro', 'Concha com pontas que lembram patas.'),
('Concha da Lua', 'Polinices', 'Moluscos', 'Naticidae', 'Carnívoro', 'Perfura outras conchas com ácido.'),
('Lesma do mar Alface', 'Elysia crispata', 'Moluscos', 'Plakobranchidae', 'Herbívoro', 'Corpo ondulado que rouba cloroplastos.'),
('Escafópode', 'Antalis vulgaris', 'Moluscos', 'Dentaliidae', 'Detritívoro', 'Concha em forma de dente de elefante.'),
('Polvo Cobertor', 'Tremoctopus violaceus', 'Moluscos', 'Tremoctopodidae', 'Carnívoro', 'Abre uma grande rede de pele para intimidar.'),
('Sépia Faraó', 'Sepia pharaonis', 'Moluscos', 'Sepiidae', 'Carnívoro', 'Textura e cor espetaculares.'),
('Caracol Terrestre Ibérico', 'Otala lactea', 'Moluscos', 'Helicidae', 'Herbívoro', 'Consumido como escargot.'),
('Abre Fecha', 'Spondylus', 'Moluscos', 'Spondylidae', 'Filtrador', 'Concha cheia de espinhos longos.'),
('Lula de Humboldt', 'Dosidicus gigas', 'Moluscos', 'Ommastrephidae', 'Carnívoro', 'Agressiva e caça em grandes bandos.'),
('Caramujo de Areia', 'Nassarius', 'Moluscos', 'Nassariidae', 'Detritívoro', 'Sai da areia quando sente cheiro de carniça.'),
('Búzios Cobra', 'Cypraea tigris', 'Moluscos', 'Cypraeidae', 'Onívoro', 'Concha super polida com pintas.'),
('Polvo das Fontes Termais', 'Vulcanoctopus hydrothermalis', 'Moluscos', 'Octopodidae', 'Carnívoro', 'Vive perto de vulcões submarinos.'),
('Mexilhão Zebra', 'Dreissena polymorpha', 'Moluscos', 'Dreissenidae', 'Filtrador', 'Grave praga de dutos industriais.'),
('Lesma Nua', 'Deroceras reticulatum', 'Moluscos', 'Agriolimacidae', 'Herbívoro', 'Praga agrícola que devora mudas.'),
('Nudibrânquio Pijama', 'Chromodoris quadricolor', 'Moluscos', 'Chromodorididae', 'Carnívoro', 'Listras azuis, brancas e laranjas.'),
('Caracol Pintado', 'Liguus fasciatus', 'Moluscos', 'Orthalicidae', 'Herbívoro', 'Conchas coloridas arborícolas da Flórida.'),
('Teredo', 'Teredo navalis', 'Moluscos', 'Teredinidae', 'Xilófago', 'Cupim do mar, fura cascos de madeira.'),
('Anjo do Mar', 'Clione limacina', 'Moluscos', 'Clionidae', 'Carnívoro', 'Molusco pelágico transparente que parece flutuar com asas.'),
('Caramujo Babosa', 'Physella acuta', 'Moluscos', 'Physidae', 'Detritívoro', 'Caramujo de água doce comum em aquários.'),

('Água viva da lua', 'Aurelia aurita', 'Cnidário', 'Ulmaridae', 'Carnívoro', 'Possui quatro braços orais transparentes e um formato de guarda chuva com margens tentaculares.'),
('Caravela portuguesa', 'Physalia physalis', 'Cnidário', 'Physaliidae', 'Carnívoro', 'Organismo colonial flutuante com tentáculos longos e altamente venenosos.'),
('Anêmona do mar comum', 'Actinia equina', 'Cnidário', 'Actiniidae', 'Carnívoro', 'Fixa se a rochas costeiras e retrai seus tentáculos vermelhos quando exposta à maré baixa.'),
('Água viva juba de leão', 'Cyanea capillata', 'Cnidário', 'Cyaneidae', 'Carnívoro', 'A maior espécie de água viva do mundo, com centenas de tentáculos finos e longos.'),
('Coral cérebro', 'Meandrina meandrites', 'Cnidário', 'Meandrinidae', 'Carnívoro', 'Coral construtor de recifes com sulcos sinuosos que lembram a textura de um cérebro.'),
('Vespa do mar', 'Chironex fleckeri', 'Cnidário', 'Chirodropidae', 'Carnívoro', 'Uma das criaturas mais venenosas do planeta, encontrada nas águas costeiras do Indo Pacífico.'),
('Hydra verde', 'Hydra viridissima', 'Cnidário', 'Hydridae', 'Carnívoro', 'Pequeno pólipo de água doce que vive fixo a vegetação aquática e possui simetria radial.'),
('Coral chifre de alce', 'Acropora palmata', 'Cnidário', 'Acroporidae', 'Carnívoro', 'Coral ramificado essencial para a proteção das costas contra tempestades tropicais.'),
('Anêmona gigante de carpetes', 'Stichodactyla gigantea', 'Cnidário', 'Stichodactylidae', 'Carnívoro', 'Abriga peixes palhaço em simbiose mútua contra predadores marinhos.'),
('Água viva de cabeça de cogumelo', 'Rhizostoma pulmo', 'Cnidário', 'Rhizostomatidae', 'Carnívoro', 'Frequente no Mar Mediterrâneo, alimenta se filtrando plâncton com seus braços fundidos.'),
('Coral fogo', 'Millepora alcicornis', 'Cnidário', 'Milleporidae', 'Carnívoro', 'Hidrocoral urticante que causa forte sensação de queimadura ao toque humano.'),
('Água viva luminosa', 'Pelagia noctiluca', 'Cnidário', 'Pelagiidae', 'Carnívoro', 'Emite forte luz azulada quando perturbada mecanicamente na escuridão do oceano.'),
('Caneta do mar', 'Pennatula phosphorea', 'Cnidário', 'Pennatulidae', 'Carnívoro', 'Colônia de pólipos que se assemelha a uma antiga pena de escrita fincada no sedimento.'),
('Coral sol', 'Tubastraea coccinea', 'Cnidário', 'Dendrophylliidae', 'Carnívoro', 'Espécie invasora no litoral brasileiro, reconhecida por seus pólipos de coloração amarela intensa.'),
('Anêmona sol', 'Condylactis gigantea', 'Cnidário', 'Actiniidae', 'Carnívoro', 'Exibe tentáculos longos com pontas bulbosas vibrantes que variam do verde ao roxo.'),
('Água viva imortal', 'Turritopsis dohrnii', 'Cnidário', 'Oceaniidae', 'Carnívoro', 'Capaz de reverter seu ciclo de vida celular após atingir a maturidade, teoricamente imortal.'),
('Coral mão de morto', 'Alcyonium digitatum', 'Cnidário', 'Alcyoniidae', 'Carnívoro', 'Coral mole de águas frias com lóbulos carnudos que lembram dedos humanos.'),
('Velella', 'Velella velella', 'Cnidário', 'Porpitidae', 'Carnívoro', 'Pequena colônia flutuante dotada de uma crista triangular que atua como vela ao vento.'),
('Anêmona tubo', 'Cerianthus membranaceus', 'Cnidário', 'Cerianthidae', 'Carnívoro', 'Constrói um tubo membranoso no sedimento arenoso de onde projeta seus longos tentáculos.'),
('Coral cogumelo', 'Fungia fungites', 'Cnidário', 'Fungiidae', 'Carnívoro', 'Coral solitário em forma de disco que descansa livremente sobre o substrato arenoso.'),
('Água viva caçadora', 'Chiropsalmus quadrumana', 'Cnidário', 'Chirodropidae', 'Carnívoro', 'Cubozoário com tentáculos dispostos em cachos nos cantos de sua umbrella cúbica.'),
('Coral preto', 'Antipathes dichotoma', 'Cnidário', 'Antipathidae', 'Carnívoro', 'Possui esqueleto córneo escuro muito utilizado historicamente na fabricação de joias.'),
('Anêmona verde gigante', 'Anthopleura xanthogrammica', 'Cnidário', 'Actiniidae', 'Carnívoro', 'Deve sua cor verde vibrante a algas fotossintéticas simbióticas que habitam seus tecidos.'),
('Água viva de ponto azul', 'Mastigias papua', 'Cnidário', 'Mastigiidae', 'Carnívoro', 'Abriga algas zooxantelas que lhe fornecem energia através da luz solar.'),
('Coral de fogo comum', 'Millepora complanata', 'Cnidário', 'Milleporidae', 'Carnívoro', 'Forma lâminas verticais calcárias em recifes rasos e expostos à forte arrebentação.'),
('Anêmona das rochas', 'Bunodosoma caissorum', 'Cnidário', 'Actiniidae', 'Carnívoro', 'Espécie comum no litoral brasileiro com verrugas adesivas pelo corpo.'),
('Água viva japonesa', 'Nemopilema nomurai', 'Cnidário', 'Stomolophidae', 'Carnívoro', 'Gigante dos mares asiáticos que causa enormes prejuízos à pesca comercial.'),
('Coral estrela', 'Montastraea cavernosa', 'Cnidário', 'Faviidae', 'Carnívoro', 'Forma colônias massivas com cálices profundos e bem demarcados na superfície.'),
('Anêmona elegante', 'Anthopleura elegantissima', 'Cnidário', 'Actiniidae', 'Carnívoro', 'Conhecida por formar colônias clonais que travam batalhas territoriais usando tentáculos especializados.'),
('Água viva crucifixe', 'Haliclystus auricula', 'Cnidário', 'Staurozoa', 'Carnívoro', 'Estauromedusa séssil que se fixa a algas marinhas por um pedúnculo basal.'),
('Coral tubular amarelo', 'Tubastraea micrantha', 'Cnidário', 'Dendrophylliidae', 'Carnívoro', 'Forma arbustos densos com ramificações escuras e pólipos amarelos brilhantes.'),
('Anêmona cavalo', 'Actinia fragacea', 'Cnidário', 'Actiniidae', 'Carnívoro', 'Apresenta manchas verdes distintas ao longo de sua base carnuda vermelha.'),
('Água viva bombardeira', 'Periphylla periphylla', 'Cnidário', 'Periphyllidae', 'Carnívoro', 'Espécie de profundidade com coloração marrom avermelhada escura e bioluminescência.'),
('Coral chifre de cervo falso', 'Acropora cervicornis', 'Cnidário', 'Acroporidae', 'Carnívoro', 'Crescimento rápido em forma de galhos cilíndricos pontiagudos.'),
('Anêmona borboleta', 'Aiptasia pallida', 'Cnidário', 'Aiptasiidae', 'Carnívoro', 'Comum em aquários marinhos, considerada praga devido à sua rápida proliferação clonal.'),
('Água viva diamante', 'Chirodropus pragmaticus', 'Cnidário', 'Chirodropidae', 'Carnívoro', 'Cubomedusa predadora com potentes toxinas neurotóxicas em seus tentáculos.'),
('Coral couve flor', 'Pocillopora damicornis', 'Cnidário', 'Pocilloporidae', 'Carnívoro', 'Possui ramificações curtas e compactas que lembram a cabeça de uma couve flor.'),
('Anêmona de fogo', 'Actinodendron arboreum', 'Cnidário', 'Actinodendridae', 'Carnívoro', 'Seus tentáculos lembram galhos de árvores e liberam toxinas severas ao toque.'),
('Água viva coroa', 'Atolla wyvillei', 'Cnidário', 'Atollidae', 'Carnívoro', 'Emite um impressionante show de luzes azuladas em anel quando atacada no abismo marinho.'),
('Coral abano do mar', 'Gorgonia ventalina', 'Cnidário', 'Gorgoniidae', 'Carnívoro', 'Gorgônia em formato de leque plano que se posiciona perpendicularmente às correntes.'),
('Anêmona magnífica', 'Heteractis magnifica', 'Cnidário', 'Stichodactylidae', 'Carnívoro', 'Uma das principais espécies hospedeiras para peixes palhaço em recifes tropicais.'),
('Água viva azul', 'Cyanea lamarckii', 'Cnidário', 'Cyaneidae', 'Carnívoro', 'Água viva translúcida com tons azulados encontrada nas águas temperadas europeias.'),
('Coral colunar', 'Porites astreoides', 'Cnidário', 'Poritidae', 'Carnívoro', 'Forma massas encrustantes ou nodulares com coloração amarelada marcante.'),
('Anêmona pescadora', 'Tealia felina', 'Cnidário', 'Urticinidae', 'Carnívoro', 'Revestida por cascalho e detritos aderidos ao seu corpo pegajoso para camuflagem.'),
('Água viva de fogo africana', 'Rhopilema nomadica', 'Cnidário', 'Rhizostomatidae', 'Carnívoro', 'Espécie invasora migratória no Mar Mediterrâneo com picadas dolorosas.'),
('Coral dedo', 'Porites porites', 'Cnidário', 'Poritidae', 'Carnívoro', 'Forma aglomerados de ramos curtos e grossos semelhantes a dedos grossos.'),
('Anêmona imperador', 'Condylactis aurantiaca', 'Cnidário', 'Actiniidae', 'Carnívoro', 'Possui tentáculos translúcidos com pontas coloridas contrastantes.'),
('Água viva cruciforme gigante', 'Stauromedusa geniculata', 'Cnidário', 'Staurozoa', 'Carnívoro', 'Forma séssil incomum que habita águas frias do norte.'),
('Coral formigueiro', 'Madracis mirabilis', 'Cnidário', 'Pocilloporidae', 'Carnívoro', 'Forma colônias densas de ramos finos e pontiagudos em águas mais profundas.'),
('Anêmona listrada', 'Diadumene lineata', 'Cnidário', 'Haliplanellidae', 'Carnívoro', 'Pequena anêmona invasora global com colônias marcadas por listras verticais verdes e brancas.'),
('Água viva lanterninha', 'Aequorea victoria', 'Cnidário', 'Aequoreidae', 'Carnívoro', 'Famosa na biologia molecular pela proteína verde fluorescente (GFP) extraída de seus tecidos.'),
('Coral tubo verde', 'Clavularia viridis', 'Cnidário', 'Clavulariidae', 'Carnívoro', 'Coral mole incrustante com pólipos que se assemelham a pequenas margaridas verdes brilhantes.'),
('Anêmona tapete', 'Stichodactyla haddoni', 'Cnidário', 'Stichodactylidae', 'Carnívoro', 'Habita fundos arenosos rasos, enterrando sua base e expandindo seu disco adesivo na superfície.'),
('Água viva cauda de cavalo', 'Dactylometra quinquecirrha', 'Cnidário', 'Pelagiidae', 'Carnívoro', 'Apresenta linhas marrons radiais na umbrella e tentáculos longos urticantes.'),
('Coral bola de neve', 'Scolymia cubensis', 'Cnidário', 'Mussidae', 'Carnívoro', 'Coral solitário com pólipo grande e carnoso exibindo cores fluorescentes sob luz azul.'),
('Anêmona pedunculada', 'Alicia mirabilis', 'Cnidário', 'Aliciidae', 'Carnívoro', 'Possui verrugas ramificadas cheias de nematocistos venenosos ao longo de sua coluna.'),
('Água viva comum do atlântico', 'Drymonema dalmatinum', 'Cnidário', 'Drymonematidae', 'Carnívoro', 'Predadora voraz de outras águas vivas, alcançando tamanhos impressionantes.'),
('Coral alface', 'Undaria tenuifolia', 'Cnidário', 'Agariciidae', 'Carnívoro', 'Suas colônias formam lâminas finas e onduladas que lembram folhas de alface dobradas.'),
('Anêmona de vidro', 'Exaiptasia diaphana', 'Cnidário', 'Aiptasiidae', 'Carnívoro', 'Possui corpo translúcido e delgado, amplamente estudada em pesquisas de simbiose.'),
('Água viva púrpura', 'Chrysaora hysosella', 'Cnidário', 'Pelagiidae', 'Carnívoro', 'Reconhecida pelas listras em forma de V marrons ou púrpuras em sua umbrella.'),
('Coral bambu', 'Isidis hippuris', 'Cnidário', 'Isididae', 'Carnívoro', 'Coral de profundidade com esqueleto segmentado em nós calcários e entrenós proteicos.'),

('Estrela do mar comum', 'Asterias rubens', 'Equinodermo', 'Asteriidae', 'Carnívoro', 'Predadora voraz de moluscos bivalves, abrindo suas conchas com os pés ambulacrários.'),
('Oriço do mar roxo', 'Strongylocentrotus purpuratus', 'Equinodermo', 'Echinidae', 'Herbívoro', 'Usa sua poderosa boca com mandíbulas (lanterna de aristóteles) para raspar algas das rochas.'),
('Pepino do mar comum', 'Holothuria tubulosa', 'Equinodermo', 'Holothuriidae', 'Detritívoro', 'Ingere sedimentos marinhos para filtrar matéria orgânica nutritiva no fundo do oceano.'),
('Estrela do mar coroa de espinhos', 'Acanthaster planci', 'Equinodermo', 'Acanthasteridae', 'Carnívoro', 'Especializada em se alimentar de pólipos de corais vivos, podendo causar desequilíbrios em recifes.'),
('Oriço do mar negro', 'Diadema antillarum', 'Equinodermo', 'Diadematidae', 'Herbívoro', 'Possui espinhos finos e longos extremamente venenosos que protegem recifes de supercrescimento de algas.'),
('Estrela do mar azul', 'Linckia laevigata', 'Equinodermo', 'Ophidiasteridae', 'Carnívoro', 'Apresenta coloração azul celeste marcante e regenera se facilmente de fragmentos corporais.'),
('Ofiúro frágil', 'Ophiothrix fragilis', 'Equinodermo', 'Ophiotrichidae', 'Detritívoro', 'Braços longos e flexíveis que se movem em serpenteando velozmente pelo substrato.'),
('Lírio do mar', 'Antedon bifida', 'Equinodermo', 'Antedonidae', 'Suspensívoro', 'Crinoide séssil ou de movimentos lentos que lembra uma flor delicada com braços plumosos.'),
('Bolacha da praia', 'Echinarachnius parma', 'Equinodermo', 'Scutellidae', 'Detritívoro', 'Equinodermo plano achatado em forma de moeda que vive enterrado em bancos de areia.'),
('Estrela girassol', 'Pycnopodia helianthoides', 'Equinodermo', 'Asteriidae', 'Carnívoro', 'Uma das maiores estrelas do mar do mundo, com dezenas de braços ágeis e vorazes.'),
('Pepino do mar leopardo', 'Bohadschia argus', 'Equinodermo', 'Holothuriidae', 'Detritívoro', 'Exibe manchas oculares características em seu corpo cilíndrico robusto.'),
('Oriço lápis', 'Heterocentrotus mammillatus', 'Equinodermo', 'Echinometridae', 'Herbívoro', 'Possui espinhos grossos e maciços em forma de lápis que resistem a fortes ondas.'),
('Estrela almofada', 'Oreaster reticulatus', 'Equinodermo', 'Oreasteridae', 'Carnívoro', 'Estrela robusta com corpo abaulado e textura reticulada rígida.'),
('Ofiúro gigante de cesto', 'Gorgonocephalus eucnemis', 'Equinodermo', 'Gorgonocephalidae', 'Suspensívoro', 'Seus braços ramificados complexos formam uma rede para capturar plâncton nas correntes profundas.'),
('Pepino do mar ananas', 'Thelenota ananas', 'Equinodermo', 'Stichopodidae', 'Detritívoro', 'Possui projeções cutâneas protuberantes que lembram a casca texturizada de um abacaxi.'),
('Oriço do mar verde', 'Strongylocentrotus droebachiensis', 'Equinodermo', 'Strongylocentrotidae', 'Herbívoro', 'Habita águas frias do norte, alimentando se avidamente de algas kelp.'),
('Estrela do mar de sangue', 'Henricia leviuscula', 'Equinodermo', 'Echinasteridae', 'Carnívoro', 'Coloração vermelha ou alaranjada viva, comum em poças de maré rochosas.'),
('Oriço tóxico', 'Toxopneustes pileolus', 'Equinodermo', 'Toxopneustidae', 'Herbívoro', 'Equipado com pedicelárias em forma de flor capazes de injetar toxinas dolorosas.'),
('Estrela batida', 'Patiria miniata', 'Equinodermo', 'Asterinidae', 'Carnívoro', 'Membranas interbraquiais estendidas dão um aspecto de estrela encorpada.'),
('Pepino do mar espinhoso', 'Apostichopus californicus', 'Equinodermo', 'Stichopodidae', 'Detritívoro', 'Importante espécie comercializada na Ásia pela sua textura e valor medicinal.'),
('Ofiúro verde', 'Ophiocoma scolopendrina', 'Equinodermo', 'Ophiocomidae', 'Detritívoro', 'Ativo durante a noite, estende seus braços de fendas rochosas para coletar detritos.'),
('Oriço do mar branco', 'Tripneustes gratilla', 'Equinodermo', 'Toxopneustidae', 'Herbívoro', 'Costuma camuflar se cobrindo o corpo com pedaços de algas e conchas.'),
('Estrela de areia', 'Archaster typicus', 'Equinodermo', 'Archasteridae', 'Detritívoro', 'Vive semi enterrada na areia rasa de praias tropicais protegidas.'),
('Pepino do mar preto', 'Holothuria atra', 'Equinodermo', 'Holothuriidae', 'Detritívoro', 'Revestido por uma camada de muco que frequentemente retém grãos de areia escura.'),
('Oriço do mar de rocha', 'Paracentrotus lividus', 'Equinodermo', 'Echinidae', 'Herbívoro', 'Capaz de escavar cavidades em rochas calcárias duras usando seus dentes e espinhos.'),
('Estrela cometa', 'Linckia guildingi', 'Equinodermo', 'Ophidiasteridae', 'Carnívoro', 'Conhecida por se reproduzir assexuadamente por fissão e regeneração de braços isolados.'),
('Ofiúro reticulado', 'Ophionereis reticulata', 'Equinodermo', 'Ophionereididae', 'Detritívoro', 'Possui um padrão de rede geométrica delicada na superfície dorsal do disco central.'),
('Lírio do mar plumoso', 'Comaster schlegelii', 'Equinodermo', 'Comasteridae', 'Suspensívoro', 'Possui dezenas de braços plumosos coloridos que capturam plâncton na correnteza.'),
('Bolacha da praia gigante', 'Dendraster excentricus', 'Equinodermo', 'Dendrasteridae', 'Detritívoro', 'Forma densos leitos verticais em fundos arenosos expostos às ondas.'),
('Estrela fragilizada vermelha', 'Ophioderma brevispinum', 'Equinodermo', 'Ophiodermatidae', 'Detritívoro', 'Disco central robusto com braços curtos e grossos que se movem de forma serpentina.'),
('Pepino do mar amarelo', 'Cucumaria frondosa', 'Equinodermo', 'Cucumariidae', 'Suspensívoro', 'Estende tentáculos orais ramificados em forma de árvore para filtrar alimento da água.'),
('Oriço do mar coração', 'Echinocardium cordatum', 'Equinodermo', 'Loveniidae', 'Detritívoro', 'Possui simetria bilateral secundária e vive profundamente enterrado no sedimento arenoso.'),
('Estrela das profundidades', 'Bathybiaster vexillifer', 'Equinodermo', 'Benthopectinidae', 'Carnívoro', 'Habita regiões abissais frias alimentando se de detritos e pequenos invertebrados.'),
('Pepino do mar vermelho', 'Parastichopus parvimensis', 'Equinodermo', 'Stichopodidae', 'Detritívoro', 'Exibe coloração avermelhada com tubérculos proeminentes e alimenta se de matéria orgânica.'),
('Ofiúro de espinhos longos', 'Ophiothrix spiculata', 'Equinodermo', 'Ophiotrichidae', 'Detritívoro', 'Possui espinhos transparentes e espinhosos ao longo de seus longos braços.'),
('Oriço diadema austral', 'Centrostephanus coronatus', 'Equinodermo', 'Diadematidae', 'Herbívoro', 'Encontrado em recifes rochosos, possui espinhos longos e escuros com anéis.'),
('Estrela de porcelana', 'Fromia monilis', 'Equinodermo', 'Ophidiasteridae', 'Carnívoro', 'Apresenta placas coloridas contrastantes que lembram peças de mosaico de porcelana.'),
('Pepino do mar gigante cinza', 'Stichopus chloronotus', 'Equinodermo', 'Stichopodidae', 'Detritívoro', 'Corpo verde escuro alongado com papilas dorsais pontiagudas.'),
('Lírio do mar de coral', 'Cenometra bella', 'Equinodermo', 'Colobometridae', 'Suspensívoro', 'Vive empoleirado em gorgônias e corais em busca de correntes ricas em plâncton.'),
('Oriço do mar de fogo', 'Asthenosoma varium', 'Equinodermo', 'Echinothuriidae', 'Herbívoro', 'Possui testas flexíveis e espinhos ocos venenosos muito perigosos.'),
('Estrela do mar de rasteiro', 'Leptasterias polaris', 'Equinodermo', 'Asteriidae', 'Carnívoro', 'Estrela friorentas que incuba seus ovos diretamente sob o corpo em vez de liberá los na água.'),
('Pepino do mar dragão', 'Synapta maculata', 'Equinodermo', 'Synaptidae', 'Detritívoro', 'Pepino serpenteiforme extremamente longo que carece de pés ambulacrários locomotores tradicionais.'),
('Oriço do mar verde escuro', 'Echinometra lucunter', 'Equinodermo', 'Echinometridae', 'Herbívoro', 'Comum na zona intertidal rochosa brasileira, adaptado a fortes impactos de ondas.'),
('Estrela alvinegra', 'Nardoa tuberculata', 'Equinodermo', 'Ophidiasteridae', 'Carnívoro', 'Apresenta tubérculos arredondados distribuídos ao longo de seus braços roliços.'),
('Ofiúro malhado', 'Ophiolepis paucispina', 'Equinodermo', 'Ophiolepididae', 'Detritívoro', 'Pequeno ofiúro que habita fendas em recifes de coral rasos.'),
('Pepino do mar marrom', 'Holothuria forskali', 'Equinodermo', 'Holothuriidae', 'Detritívoro', 'Capaz de ejetar fios pegajosos de Cuvier quando severamente ameaçado por predadores.'),
('Oriço do mar do mediterrâneo', 'Sphaerechinus granularis', 'Equinodermo', 'Toxopneustidae', 'Herbívoro', 'Possui espinhos curtos e grossos com pontas arroxeadas ou brancas.'),
('Estrela do mar espinhosa do atlântico', 'Marthasterias glacialis', 'Equinodermo', 'Asteriidae', 'Carnívoro', 'Grandes espinhos cônicos dispostos em três fileiras ao longo de cada braço.'),
('Lírio do mar elegante', 'Tropometra carinata', 'Equinodermo', 'Tropometridae', 'Suspensívoro', 'Espécie tropical que se agarra a corais e rochas em águas de forte correnteza.'),
('Pepino do mar marinho amarelo escuro', 'Colochirus robustus', 'Equinodermo', 'Cucumariidae', 'Suspensívoro', 'Exibe coloração amarela ou laranja viva com tentáculos ramificados vistosos.'),
('Oriço do mar violeta', 'Arbacia lixula', 'Equinodermo', 'Arbaciidae', 'Herbívoro', 'Reconhecido por sua coloração preta ou roxa escura profunda e carapaça nua no ápice.'),
('Estrela de pintas laranja', 'Fromia indica', 'Equinodermo', 'Ophidiasteridae', 'Carnívoro', 'Pequena estrela com corpo avermelhado e manchas laranja contrastantes.'),
('Pepino do mar espinhento marrom', 'Actinopyga mauritiana', 'Equinodermo', 'Holothuriidae', 'Detritívoro', 'Habita recifes rasos de águas turbulentas, alimentando se de areia rica emnutrientes.'),
('Ofiúro de braços listrados', 'Ophiocoma wendtii', 'Equinodermo', 'Ophiocomidae', 'Detritívoro', 'Possui células em sua pele que funcionam como lentes ópticas naturais, agindo como um olho composto'),
('Oriço do mar australiano', 'Heliocidaris erythrogramma', 'Equinodermo', 'Echinometridae', 'Herbívoro', 'Endêmico da Austrália, com espinhos curtos de tons avermelhados ou esverdeados.'),
('Estrela do mar roxa do pacífico', 'Pisaster ochraceus', 'Equinodermo', 'Asteriidae', 'Carnívoro', 'Espécie chave em ecossistemas de poças de maré na costa oeste norte americana.'),
('Pepino do mar roxo escuro', 'Pseudocolochirus violaceus', 'Equinodermo', 'Cucumariidae', 'Suspensívoro', 'Apresenta tentáculos orais ramificados de cor violeta brilhante para captação de plâncton'),
('Oriço do mar perfurador', 'Echinometra mathaei', 'Equinodermo', 'Echinometridae', 'Herbívoro', 'Amplamente distribuído no Indo Pacífico, abriga se em rochas calcárias erodidas.'),
('Estrela do mar de areia fina', 'Astropecten aranciacus', 'Equinodermo', 'Astropectinidae', 'Carnívoro', 'Estrela de areia com margens pectinadas, caçadora noturna de moluscos e vermes.'),
('Ofiúro de braços longos', 'Amphipholis squamata', 'Equinodermo', 'Amphiuridae', 'Detritívoro', 'Pequeno ofiúro cosmopolita que incuba seus ovos internamente até a eclosão.'),
('Lírio do mar gigante de fenda', 'Lamprometra palmata', 'Equinodermo', 'Mariametridae', 'Suspensívoro', 'Crinoide tropical com múltiplos braços flexíveis que formam leques filtradores.');

UPDATE insetos 
SET foto_insetos = CASE id_insetos
        WHEN 1 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/69/Oryctes_nasicornis-002.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 2 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0e/Dynastes_hercules_ecuatorianus_MHNT.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 3 THEN 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/41/DSC_6tty.jpg/250px-DSC_6tty.jpg?utm_source=en.wikipedia.org&utm_campaign=parser&utm_content=thumbnail'
        WHEN 4 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS90w0MIAR3y2_byZ3-Yv7tThR6z1tKUbg58TQNpqvgASqldPDhYPQS6VAi&s=10'
        WHEN 5 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/67/Elephant_Beetle_Megasoma_elephas_Male_Side_2699px.jpg?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 6 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7f/Anomala_dubia_1.jpg?utm_source=fr.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 7 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/ad/Cetonia-aurata.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 8 THEN 'https://inaturalist-open-data.s3.amazonaws.com/photos/150966431/medium.jpg'
        WHEN 9 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/a9/Gold_Bug_.Plusiotis_resplendens_-_Flickr_-_gailhampshire_%281%29.jpg?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 10 THEN 'https://www.texasento.net/Pelidnota2.jpg'
        WHEN 11 THEN 'https://upload.wikimedia.org/wikipedia/commons/d/df/Violin_beetle_Mormolyce_phyllodes.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 12 THEN 'https://static.inaturalist.org/photos/114151390/medium.jpg'
        WHEN 13 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3a/Calosoma_sycophanta%2BSardinien-2009-Thomas_Huntke.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 14 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/e9/Cicindela.campestris.1809.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 15 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/14/Carabus_violaceus_side.JPG?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 16 THEN 'https://thumb.wikimedia.org/wikipedia/commons/thumb/3/37/Nebria_brevicollis01.jpg/1280px-Nebria_brevicollis01.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=thumbnail'
        WHEN 17 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/04/2015.07.07.-07-Mulde_Eilenburg--Duenen-Sandlaufkaefer.jpg?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 18 THEN 'https://img.cdndsgni.com/preview/10088943.jpg'
        WHEN 19 THEN 'https://thumbs.dreamstime.com/b/besouro-preto-africano-17640485.jpg'
        WHEN 20 THEN 'https://inaturalist-open-data.s3.amazonaws.com/photos/58936079/medium.jpeg'
        WHEN 21 THEN 'https://agropos.com.br/wp-content/uploads/2023/04/Imagem-2024-01-18T233100.494-768x480.png'
        WHEN 22 THEN 'https://tse4.mm.bing.net/th/id/OIP.pzf4coluyh3AyidDp0gyYwHaFj?r=0&rs=1&pid=ImgDetMain&o=7&rm=3'
        WHEN 23 THEN 'https://tse1.mm.bing.net/th/id/OIP.d3cTbS_-yXUaaykoEAgnXwHaEz?r=0&rs=1&pid=ImgDetMain&o=7&rm=3'
        WHEN 24 THEN 'https://super.abril.com.br/wp-content/uploads/2021/07/30-07_besouro_SITE.jpg?quality=70&strip=info&w=1024&h=682&crop=1'
        WHEN 25 THEN 'https://tse2.mm.bing.net/th/id/OIP.F3eh-URGDa2HUy5XlWj-TQHaE3?r=0&rs=1&pid=ImgDetMain&o=7&rm=3'
        WHEN 26 THEN 'https://tse1.mm.bing.net/th/id/OIP.IJoB_ztYOcHGbnDWvJFlKgHaE8?r=0&rs=1&pid=ImgDetMain&o=7&rm=3'
        WHEN 27 THEN 'https://www.coisasdaroca.com/wp-content/uploads/2024/02/besouro-rola-bosta.jpg'
        WHEN 28 THEN 'https://inaturalist-open-data.s3.amazonaws.com/photos/35070315/medium.jpeg'
        WHEN 29 THEN 'https://www.jardineriaon.com/wp-content/uploads/2024/05/El-papel-de-los-escarabajos-en-el-ecosistema-1024x576.jpg'
        WHEN 30 THEN 'https://thumbs.dreamstime.com/b/besouro-do-colorado-come-folhas-de-batata-pragas-insetos-agr%C3%ADcolas-187799092.jpg'
        WHEN 31 THEN 'https://st4.depositphotos.com/27967950/31246/i/450/depositphotos_312462724-stock-photo-hister-beetle-histeridae-moss.jpg'
        WHEN 32 THEN 'https://img.cdndsgni.com/preview/10848488.jpg'
        WHEN 33 THEN 'https://tse1.mm.bing.net/th/id/OIP.u-MHbCgKdshQMCWudyd4fgHaFk?r=0&rs=1&pid=ImgDetMain&o=7&rm=3'
        WHEN 34 THEN 'https://tse1.explicit.bing.net/th/id/OIP.zNHxlPuNsZ2jIR5FsG5gjAHaE4?r=0&rs=1&pid=ImgDetMain&o=7&rm=3'
        WHEN 35 THEN 'https://static.vecteezy.com/ti/fotos-gratis/p1/15327662-besouro-terrestre-pedunculado-adulto-foto.jpg'
        WHEN 36 THEN 'https://educacaoambientaldobrasil.com.br/wp-content/uploads/2025/09/grok_image_7266_1757502056_cropped.jpg'
        WHEN 37 THEN 'https://tse4.mm.bing.net/th/id/OIP.dFQ-Ug2yYWYLVcBEGiLOxAHaEK?r=0&rs=1&pid=ImgDetMain&o=7&rm=3'
        WHEN 38 THEN 'https://static.vecteezy.com/ti/fotos-gratis/p1/13071683-besouro-tigre-metalico-adulto-foto.jpg'
        WHEN 39 THEN 'https://tse2.mm.bing.net/th/id/OIP.Qma-BU31Ulh0TrsESncKUgHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3'
        WHEN 40 THEN 'https://2.bp.blogspot.com/-u2YbGvGdRZk/UylRdR1fI5I/AAAAAAAABKc/QqMdSRq2baU/s1600/6804_633412216685629_1982465215_n.jpg'
        WHEN 41 THEN 'https://th.bing.com/th/id/R.186e8109d0c0d4bf85ffd24e990e943f?rik=Y8HZmS%2fLv2KXpw&pid=ImgRaw&r=0'
        WHEN 42 THEN 'https://tse4.mm.bing.net/th/id/OIP.KJlrwHIU37PpsxJzuMdSMgHaIc?r=0&rs=1&pid=ImgDetMain&o=7&rm=3'
        WHEN 43 THEN 'https://thumbs.dreamstime.com/b/detalhe-de-abelha-ou-da-europeia-ocidental-do-mel-sentando-se-na-flor-violeta-azul-amarela-131416290.jpg'
        WHEN 44 THEN 'https://www.coisasdaroca.com/wp-content/uploads/2024/06/formiga-cortadeira-2-1140x570.jpg'
        WHEN 45 THEN 'https://i.pinimg.com/originals/a3/0e/6c/a30e6c675ef36562a61b6cea9deffb5b.jpg'
        WHEN 46 THEN 'https://tse4.mm.bing.net/th/id/OIP.ZKn5pl2sYGpa7F1XQpxm5gHaE7?r=0&rs=1&pid=ImgDetMain&o=7&rm=3'
        WHEN 47 THEN 'https://media.istockphoto.com/id/1410574979/pt/foto/a-large-brown-locust-locusta-migratoria-with-a-pattern-on-its-body-sits-on-branch-among-green.jpg?s=170667a&w=0&k=20&c=kEYCGqP1Ro9kyDGDo1OJbIEhBRNhj_5ptlPutodyw6A='
        WHEN 48 THEN 'https://conteudo.imguol.com.br/c/noticias/69/2022/09/21/um-vaga-lume-aceso-reacoes-quimicas-permitem-ao-inseto-emitir-luz-1663773643770_v2_750x421.jpg'
        WHEN 49 THEN 'https://conteudo.imguol.com.br/c/noticias/d7/2022/02/22/o-bicho-pau-mimetiza-pedacos-de-madeira-e-gravetos-e-pode-chegar-a-185-centimetros-de-comprimento-1645567456534_v2_750x421.jpg'
        WHEN 50 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTihyXYDOeLHCaSWmIegvjiOj6asCA0BL3GVoE4vA9RYA9tCplQivE8SKM&s=10'
        WHEN 51 THEN 'https://fthmb.tqn.com/hRZa3GfChihX7Qw4UE-ON6s1hCw=/2560x1920/filters:fill(auto,1)/GettyImages-85455257-59af5048519de20010e01544.jpg'
        WHEN 52 THEN 'https://c1.staticflickr.com/9/8105/8587164963_d9a76892e2_z.jpg'
        WHEN 53 THEN 'https://www.remessaonline.com.br/blog/wp-content/uploads/2024/10/percevejo-verde-1024x683.jpg'
        WHEN 54 THEN 'https://tse1.mm.bing.net/th/id/OIP.3eYVgoTNQyDBTqS-yykSPAHaE7?r=0&rs=1&pid=ImgDetMain&o=7&rm=3'
        WHEN 55 THEN 'https://www.ruraltectv.com.br/wp-content/uploads/2021/08/LOUVA-DEUS-Mantis-religiosa-4.2-1140x694.jpg'
        WHEN 56 THEN 'https://mygarden.decorexpro.com/wp-content/uploads/2023/04/9-4-5.jpg'
        WHEN 57 THEN 'https://cdn0.peritoanimal.com.br/pt/posts/7/9/3/pulga_de_gato_23397_1_orig.jpg'
        WHEN 58 THEN 'https://th.bing.com/th/id/R.79f80ed350e8e66a5e40e422bce12402?rik=%2b6neIRVqwkaUcg&pid=ImgRaw&r=0'
        WHEN 59 THEN 'https://tse3.mm.bing.net/th/id/OIP.oePbKUZwc5R322dUiZMsvAHaI-?r=0&rs=1&pid=ImgDetMain&o=7&rm=3'
        WHEN 60 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHpxR2UZtJLQRWwVQMBcK-0rM2fpmwJSnJ5UGFPRCYcNcFz7UA4o4JqKBG&s=10'
        WHEN 61 THEN 'https://clickpetroleoegas.com.br/wp-content/uploads/2026/01/Phyllium-giganteum-.jpg'
        WHEN 62 THEN 'https://media.istockphoto.com/photos/grammostola-rosea-spider-tarantula-try-to-excape-macro-picture-id523681423?k=20&m=523681423&s=612x612&w=0&h=ccdjtLZf5CBZG1_RgbObEyOYqyMwPaxoaFiGq6PsH3c='
        WHEN 63 THEN 'https://3.bp.blogspot.com/-Fr4Ss131ark/VdV8bgOmH6I/AAAAAAAAE7I/XACgaffcfCc/s1600/8368387496_e957af5af6_b.jpg'
        WHEN 64 THEN 'https://tse3.mm.bing.net/th/id/OIP.-noK0sNHsOugjsWt5bKn-QHaE8?r=0&rs=1&pid=ImgDetMain&o=7&rm=3'
        WHEN 65 THEN 'https://www.coisasdaroca.com/wp-content/uploads/2021/05/Latrodectus.jpg'
        WHEN 66 THEN 'https://www.ruraltectv.com.br/wp-content/uploads/2025/11/ARANHA-MARROM-Loxosceles-laeta-1.2.jpg'
        WHEN 67 THEN 'https://tse4.mm.bing.net/th/id/OIP.UtyVNuHn5dYyCy5ESwdJ5AHaEk?r=0&rs=1&pid=ImgDetMain&o=7&rm=3'
        WHEN 68 THEN 'https://tse1.mm.bing.net/th/id/OIP.m4H0mVMB94179MwOJ0jF7AHaE8?r=0&rs=1&pid=ImgDetMain&o=7&rm=3'
        WHEN 69 THEN 'https://th.bing.com/th/id/R.82cfe9d5337775a250389b5fb99b3666?rik=weuj9md9HO6XCA&pid=ImgRaw&r=0'
        WHEN 70 THEN 'https://www.coisasdaroca.com/wp-content/uploads/2021/02/lycosa.jpg'
        WHEN 71 THEN 'https://pictureinsect.com/wiki-image/1080/153662939071512579.jpeg'
        WHEN 72 THEN 'https://tse1.mm.bing.net/th/id/OIP.DRAVf8MKMvTx7MuWnZF3gwHaFD?r=0&rs=1&pid=ImgDetMain&o=7&rm=3'
        WHEN 73 THEN 'https://s2.glbimg.com/_au9X49UxxWxfnw3niWQvaon07E=/e.glbimg.com/og/ed/f/original/2022/08/09/10-animais-que-vivem-do-deserto00005.jpeg'
        WHEN 74 THEN 'https://meuverdejardim.com.br/wp-content/uploads/2023/05/Planta-escorpiao-negro-venenoso-pincas-fortes.webp'
        WHEN 75 THEN 'https://thumbs.dreamstime.com/b/opini%C3%A3o-superior-do-escorpi%C3%A3o-dourado-pequeno-38341588.jpg'
        WHEN 76 THEN 'https://th.bing.com/th/id/R.57fd9813bd4773da7f55cf866e39b0c3?rik=K%2bz0e8W9P6ioCg&pid=ImgRaw&r=0'
        WHEN 77 THEN 'https://tse1.explicit.bing.net/th/id/OIP.WqOkRBXMHX1tCWytXttrlQHaE8?r=0&rs=1&pid=ImgDetMain&o=7&rm=3'
        WHEN 78 THEN 'https://zootecniabrasil.com/wp-content/uploads/2020/09/carrapato-do-boi.jpg'
        WHEN 79 THEN 'https://tse3.mm.bing.net/th/id/OIP.t5-3brmKBVZXNXs_chaAZAHaEo?r=0&rs=1&pid=ImgDetMain&o=7&rm=3'
        WHEN 80 THEN 'https://tse2.mm.bing.net/th/id/OIP.ySKxCVCA5ADg3kl2Lfb-sAHaEK?r=0&rs=1&pid=ImgDetMain&o=7&rm=3'
        WHEN 81 THEN 'https://www.hortasbiologicas.pt/wp-content/uploads/2022/10/aranhico-vermelho.jpg'
        WHEN 82 THEN 'https://tse3.mm.bing.net/th/id/OIP.uIsG7Fx_LQ5pNbDKvnsoWgHaE9?r=0&rs=1&pid=ImgDetMain&o=7&rm=3'
        WHEN 83 THEN 'https://museudaamazonia.org.br/wp-content/uploads/2022/04/Opiliao_site_en.jpg'
        WHEN 84 THEN 'https://www.museosdetenerife.org/muna-museo-de-naturaleza-y-arqueologia/wp-content/uploads/sites/2/2019/07/118407053024230.jpg'
        WHEN 85 THEN 'https://tse1.mm.bing.net/th/id/OIP.owfxDk_d-bcRY6Nxp2H9CgHaE8?r=0&rs=1&pid=ImgDetMain&o=7&rm=3'
        WHEN 86 THEN 'https://pictureinsect.com/image-handle/image/1080/153693398979575809.jpeg?x-oss-process=image/format,webp/resize,s_343&v=1.0'
        WHEN 87 THEN 'https://cdn0.peritoanimal.com.br/pt/posts/7/7/5/amblipigio_amblypygi_24577_1_600.jpg'
        WHEN 88 THEN 'https://tse2.mm.bing.net/th/id/OIP.gFh14zai2TgyQaWGPmpe_gHaEi?r=0&rs=1&pid=ImgDetMain&o=7&rm=3'
        WHEN 89 THEN 'https://tse3.mm.bing.net/th/id/OIP.CxymJnHSL4NXe3uNGademgHaFc?r=0&rs=1&pid=ImgDetMain&o=7&rm=3'
        WHEN 90 THEN 'https://th.bing.com/th/id/R.65f2d07a58d2d80fa347ffb372f94890?rik=KVK0BlgmI2IlYw&pid=ImgRaw&r=0'
        WHEN 91 THEN 'https://tse1.mm.bing.net/th/id/OIP.sImy8Ojz6B9V6twsYHjckgHaEb?r=0&rs=1&pid=ImgDetMain&o=7&rm=3'
        WHEN 92 THEN 'https://tse2.mm.bing.net/th/id/OIP.BME_dKepQo9Ox51R95OZhAHaId?r=0&rs=1&pid=ImgDetMain&o=7&rm=3'
        WHEN 93 THEN 'https://tse2.mm.bing.net/th/id/OIP.qT39BK1QFm45Vbv9B_mXQAHaER?r=0&rs=1&pid=ImgDetMain&o=7&rm=3'
        WHEN 94 THEN 'https://th.bing.com/th/id/R.4ebbd02abf2b087a05a2b7ac364ef6a4?rik=RQBpWDQWeIkogQ&pid=ImgRaw&r=0'
        WHEN 95 THEN 'https://tse1.mm.bing.net/th/id/OIP.AkZvFK08ng-OJLevAglFKQHaEK?r=0&rs=1&pid=ImgDetMain&o=7&rm=3'
        WHEN 96 THEN 'https://ihoffmann.com.br/wp-content/webp-express/webp-images/uploads/2022/11/escorpiao-areia-784x588.jpg.webp'
        WHEN 97 THEN 'https://tse3.mm.bing.net/th/id/OIP.Jx96Uh1FHbRF9pqX2x-zFgHaGK?r=0&rs=1&pid=ImgDetMain&o=7&rm=3'
        WHEN 98 THEN 'https://media.istockphoto.com/photos/close-up-macro-image-of-a-tiny-pseudoscorpion-picture-id1382919704?k=20&m=1382919704&s=612x612&w=0&h=GzIy_EzwpW-5TcNMHGAtpnKAY1qU5ZuiGqojr3trm6A='
        WHEN 99 THEN 'https://alchetron.com/cdn/palpigradi-878a2083-337a-4572-ba12-069ab1e1fb3-resize-750.jpeg'
        WHEN 100 THEN 'https://agroparana.blog.br/wp-content/uploads/2024/10/carrapto-de-cervo-03.jpg'
        WHEN 101 THEN 'https://super.abril.com.br/wp-content/uploads/2026/01/0712-Aranha-layout_site.jpg?quality=70&w=960&h=640&crop=1&strip=all'
        WHEN 102 THEN 'https://faunanews.com.br/wp-content/uploads/2021/07/Macho-de-Ricinulei-cesar-favacho-1024x811.jpg'
        WHEN 103 THEN 'https://thumb.wikimedia.org/wikipedia/commons/thumb/3/32/Sunspider.jpg/960px-Sunspider.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=thumbnail'
        WHEN 104 THEN 'https://www.portal.zoo.bio.br/local/cache-vignettes/L560xH420/aranha_de_espinho-2-157b4.jpg?1639575056'
        WHEN 105 THEN 'https://s2-g1.glbimg.com/HamEvKIZ8gwH0aEs7biEzpOtv0c=/0x0:1383x922/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2023/l/C/iSOj30QXysIql4E7uqaA/whatsapp-image-2023-11-29-at-11.05.59.jpeg'
        WHEN 106 THEN 'https://reptichip.com/cdn/shop/articles/Best_Substrate_for_Costa_Rican_Tiger_Rump_Tarantula_Cyclosternum_fasciatum_ReptiChip_c39010ee-2c2e-401e-aee7-f0904fbf43ce_1024x.png?v=1716992509'
        WHEN 107 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGKgaJ5-9dPcZXPcJpefOXNSphd1Fe6fsxG96IWL-oC1Mkcm1wPKF8xY8&s=10'
        WHEN 108 THEN 'https://media.istockphoto.com/id/503332802/pt/foto/caranguejeira-negra-brasileira-veludo-grammostola-pulchra.jpg?s=612x612&w=0&k=20&c=gXMufM7tfVkVkCTwKGSN_K7BddGemfPDc2TQvXFbX3E='
        WHEN 109 THEN 'https://upload.wikimedia.org/wikipedia/commons/d/d3/E_murinus.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 110 THEN 'https://s2-g1.glbimg.com/474kW56K8O--f_u1FqhgCVqhMT0=/0x0:2048x1403/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2024/J/a/9aBha6RjuAfcc6L9Siug/licensed-image.jpg'
        WHEN 111 THEN 'https://super.abril.com.br/wp-content/uploads/2026/07/1107-opilao-layout_site-CAPA.jpg?quality=70&w=960&h=640&crop=1&strip=all'
        WHEN 112 THEN 'https://clinicafollicles.com.br/wp-content/uploads/2024/09/DEMODEX-FOLLICULORUM-TRATAMENTO-CLINICA-FOLLICLES.webp'
        WHEN 113 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyVO15WYD4B7C1GASpO4wVZFlReDTZmzqQMoQD2EbPcA&s=10'
        WHEN 114 THEN 'https://butantan.gov.br/assets/interna-opiliao.jpg'
        WHEN 115 THEN 'https://www.portal.zoo.bio.br/local/cache-gd2/24/602269e6f270c8924a0e2774495aed.jpg?1640716145'
        WHEN 116 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6zQs9Qc_mYeb0Y5JP75UE_y7I88TsyPqmnYrE7NRXpFLd-ewHgssCce0&s=10'
        WHEN 117 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/61/Heteropoda_maxima_1.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 118 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQk876xMKjBXQ0N8PToPqo8y-aiMXE11Hu1LPdKII2F6f7jGgERhEJR1V0_&s=10'
        WHEN 119 THEN 'https://oeco.org.br/wp-content/uploads/oeco-migration//images/stories/out2013/1234109_560378404011218_1661602950_n.jpg'
        WHEN 120 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwcCLumCryOUPqZKGkyC2M2XzsPqfNrnxIv3rBeMNrDww6H8m4DKpTTxpo&s=10'
        WHEN 121 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlIw9Witl_AT9PovvCbne4TXQt9nuc2k7MGyKXC78h6JxOt5NloJBMMl0&s=10'
        WHEN 122 THEN 'https://m.media-amazon.com/images/I/61dBmscE2nL._AC_UF894,1000_QL80_.jpg'
        WHEN 123 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNJ_4JC_VOMELd2NOb5S5GTv6amqpdW243I7_jtQOSjQ&s=10'
        WHEN 124 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/a7/Macrocheira_kaempferi.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 125 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/fb/Ucides_cordatus_Martinique.JPG?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 126 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1rsko-kXkN6SEzj2qFHwtbd7wEVnKmUzhSFjJHxYnydOTPeHKCnMSYLHd&s=10'
        WHEN 127 THEN 'https://upload.wikimedia.org/wikipedia/commons/d/d4/Maria-Farinha.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 128 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/ec/Panulirus_argus_NOAA.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 129 THEN 'https://seafoodfromcanada.ca/site/uploads/2023/10/homarus-americanus-lobster-1.jpg'
        WHEN 130 THEN 'https://cdn.awsli.com.br/800x800/1760/1760139/produto/1423314829f5daac8af.jpg'
        WHEN 131 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9e/Alpheus_heterochaelis.jpg?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 132 THEN 'https://thumb.wikimedia.org/wikipedia/commons/thumb/3/39/OdontodactylusScyllarus2.jpg/250px-OdontodactylusScyllarus2.jpg?utm_source=pt.wikipedia.org&utm_campaign=parser&utm_content=thumbnail'
        WHEN 133 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/4e/Armadillidium_vulgare_001.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 134 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSU-btZDMtwG3i4xTukM3ExkFSMmPiWzGr-Xjab7texpo0wlbbyCn_Mk2JK&s=10'
        WHEN 135 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsuXbXYklmDGp0j7UnxIN4ieV0-_oEH0vjiKir-YP7gcbVT0hYsci-Sojw&s=10'
        WHEN 136 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKBmjkz2u38ViF4tabBKzVJOMJk8bZw1ITq1qK_pOTuw&s=10'
        WHEN 137 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0a/Coconut_Crab_Birgus_latro.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 138 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOe0wwFRMfOg4tnuNKhudEIKp8ebCbHwFimmVJcLKL5w&s=10'
        WHEN 139 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRweWOujkIhCPX6m597-pm9KLM3WmL4Ui2exIDbyiIhSk5V8eD2C9i8d2U&s=10'
        WHEN 140 THEN 'https://thumb.wikimedia.org/wikipedia/commons/thumb/a/aa/Yeti_crab.jpg/250px-Yeti_crab.jpg?utm_source=en.wikipedia.org&utm_campaign=parser&utm_content=thumbnail'
        WHEN 141 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrTWdNQBWUYHjAv2Kjj0J9LTy6vvBrYgmfmT6jFtshyPL0yplLq_ePg50&s=10'
        WHEN 142 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3f/Emperor_Shrimp_-_Periclimenes_imperator.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 143 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/b2/Portunus_pelagicus_male.jpg?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 144 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/1a/Procambarus_clarkii.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 145 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYEwnE4KheuMU_oIVjMmATfGjhc_yCIAOC7cRjKuE35rmTxOyDZWIHGLE&s=10'
        WHEN 146 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTP4UKcs3PlAwjgUQOai-vmvmea36hgcA34WOmhXXejmpiXwCRDxUEBG9g&s=10'
        WHEN 147 THEN 'https://zooca.eu/wp-content/uploads/2024/10/Raudaate-unik-kilde-til-omega-3.png'
        WHEN 148 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3jDd1hTjMLT8vRqF3u8NtOY37gAN0Lh10xlc0R9L5rw&s=10'
        WHEN 149 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQi8G4xjatsWtSE6724G4YJxoLeTAvoBW68aQfO2h8iPg&s=10'
        WHEN 150 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5LE3HJ_k6SPLzMZ87s2PbHycGc0qqGlAHdNWleywwNg&s=10'
        WHEN 151 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/fe/Harlequin_Shrimp_1.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 152 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgPPQoRzLCloq__du9CGXq122i3mMsuW4XyIsZ9X2N3ZGPtjFEBGkGWUaD&s=10'
        WHEN 153 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjgdAZ5wJ6clSca_Aw2dP-sCp3JPPxWShZsexOV6Yo2A&s=10'
        WHEN 154 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/b9/Palaemon_serratus_Croazia.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 155 THEN 'https://topshelfaquatics.com/cdn/shop/files/tsa-inverts-pom-pom-crab-1251855116.png?v=1785525554&width=1024'
        WHEN 156 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/71/Scyllarides_latus.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 157 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXRrijQV6pLIL0Q-FdfjqLn77qpR0JasJVEZ4YT9j5rqQopmAlHD-qQn7I&s=10'
        WHEN 158 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRD7DSoLGp7WGYJDZlaCFAlm8KspH8NCLR3V4p18tDUD4K3enrW_nNJ_AsZ&s=10'
        WHEN 159 THEN 'https://cdn.isopod.site/2022/10/PA192943.jpg'
        WHEN 160 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1f7xhdduyUN15PyyX3w7KpmTnL7CW_3zr1z9otTJIssjCUJLajXj4_9HZ&s=10'
        WHEN 161 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7d/Artemia_salina_2.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 162 THEN 'https://cdn.interago.com.br/img/png/w_0_q_8/5/mc/Novo%20cat%C3%A1logo/Daphnia/daphnia'
        WHEN 163 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9knQ9EP9FBqxsVVBZjxyExohz742bgxJxNSRV2E7oeQ&s'
        WHEN 164 THEN 'https://s3.animalia.bio/animals/photos/full/original/2560pxblue-land-crab-cardisoma-guanhumi-6852439208.webp'
        WHEN 165 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgr5xkc6mGHAUrJ8hEIMsIAwrYa52UGZnQtuMVzYkgWJEhKyF2VdzNf8PV&s=10'
        WHEN 166 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTa7aul2WWyyq78yjpzXLj0sKmVYhVXz1gYqlksC7aN6EuMWhHezbOc-N2m&s=10'
        WHEN 167 THEN 'https://thumb.wikimedia.org/wikipedia/commons/thumb/3/3e/The_Childrens_Museum_of_Indianapolis_-_Alaskan_red_king_crab.jpg/250px-The_Childrens_Museum_of_Indianapolis_-_Alaskan_red_king_crab.jpg?utm_source=en.wikipedia.org&utm_campaign=parser&utm_content=thumbnail'
        WHEN 168 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSixcK4nyt3DBrsuMSjl5yZozf-0-8bTpEtP0sdzoMrqy4oJI4tl4v8tqI&s=10'
        WHEN 169 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/2e/Chionoecetes_opilio_Kanikkokan.jpg?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 170 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjGGR-fiQvbM1x5GjXVnqpAMbG2jrcHJWG87OcJy8-z8MzqtxqN0rS5Fo&s=10'
        WHEN 171 THEN 'https://www.ecoregistros.org/site/images/dataimages/2023/05/26/536007/Balanus-7-copia-eco.jpg'
        WHEN 172 THEN 'https://s2-g1.glbimg.com/Y4Wsv3DRA0frgXfzzlMwRsqUooc=/0x0:1024x733/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2024/D/Q/TGCVbuSb6oSLAklj8mQw/vicentinodominickarias.jpg'
        WHEN 173 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRr4zUy3TOyzfs2ucf4t5Oq1Gz_32WgC4bsG4ofQSneHw&s=10'
        WHEN 174 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWOEYl1TnyP8mVlY1fok5T1jLMoisFaDPtZ3PLkVC5pGInslN8Q08dgCI&s=10'
        WHEN 175 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS083fT-u2rTACWl-xejbcipzh8lIrQ-MfNlAmpcuQyr4zlBZgMuQETbr8m&s=10'
        WHEN 176 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/98/Penaeus_monodon.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 177 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6yMOPsPQLrKamEUkl2zeez3b6ok4AY7yJgFc3M7x2G5o8r6-pQu1lk8Sg&s=10'
        WHEN 178 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSvAbGKhJ1J-W4iao1iqNqCJFnEwyvqgCi3-gIAxucfQ&s=10'
        WHEN 179 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSiOVoGUktcs2rdFIRRKNJagcYBX3aUnHeYaSGMznvycf8NsvHyWPpYpU&s=10'
        WHEN 180 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/91/Thalassina_anomala.JPG?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 181 THEN 'https://www.researchgate.net/profile/Aytac-Oezguel/publication/312496452/figure/fig2/AS:451832519630850@1484736675564/lia-nucleus-caught-from-Izmir-Bay-Aegean-Sea-Horizontal-bar-10-mm-Photograph-O.png'
        WHEN 182 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/11/Niphargus_ictus.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 183 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/31/Farfantepenaeus_paulensis.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 184 THEN 'https://petehillmansnaturephotography.wordpress.com/wp-content/uploads/2019/08/copse-snail-arianta-arbustorum.jpg'
        WHEN 185 THEN 'https://www.monaconatureencyclopedia.com/wp-content/uploads/2008/12/10-Lissachatina-fulica-%C2%A9-Thomas-Irvine.jpg'
        WHEN 186 THEN 'https://ichef.bbci.co.uk/ace/ws/640/cpsprodpb/11F73/production/_120878537_4cfca0d7-2b27-474f-93b7-4c31269c5cdf.jpg.webp'
        WHEN 187 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdEngdGMY6jozI6CZyxPHnxfNs6M0nBCi3E9jHv02LlSLIFCIwH5tk87b6&s=10'
        WHEN 188 THEN 'https://kureansiklopedi.com/_next/image?url=https%3A%2F%2Fcdn.t3pedia.org%2Fmedia%2Fuploads%2F2025%2F05%2F27%2FnwtUD7q46aAlElHHo9if8TlDU81ByKoK.png&w=1280&q=75'
        WHEN 189 THEN 'https://conchasbrasil.org.br/wp-content/uploads/2023/11/Crassostrea-gigas-120mm-210670.jpg'
        WHEN 190 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/ae/Limnoperna_fortunei.jpg?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 191 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTG7x2uQOIpuLcABM_jtJtDyJpBX4t1lsQ9YsTx8JfJ6Q&s=10'
        WHEN 192 THEN 'https://www.monaconatureencyclopedia.com/wp-content/uploads/2008/08/1-Sepia-officinalis.jpg'
        WHEN 193 THEN 'https://g1.globo.com/Noticias/Mundo/foto/0,,34909589,00.jpg'
        WHEN 194 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTe-aalBHFAICUOb4J4kj4qsrk_U4hMzTGYRPGEIjJFP1CbpmW5E2I13j4&s=10'
        WHEN 195 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/b0/Dumbo-hires_%28cropped%29.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 196 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/21/Glaucus_atlanticus_1_cropped.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 197 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXOAgArvCRIfVoVMRaEqyx4uXnQBOdR5TaVXTMUu9D0g&s=10'
        WHEN 198 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9e/Limax_maximus_5.jpg?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 199 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/79/Conus-geographicus.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 200 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVnjMSA1G8xAcb3P0lBu_gglsAOrutQMdzWEWvIRKiDBwQIV5Zo4JYO6U&s=10'
        WHEN 201 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/af/Blue_mussel_%28Mytilus_edulis%29_shell.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 202 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/b3/Pecten_maximus_Pilgermuschel.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 203 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/1e/Pinctada_margaritifera_MHNT.CON.2002.893.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 204 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7e/Cerastoderma_edule_%28Linnaeus%2C_1758%29_-_iNaturalist.org.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 205 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOt6AUfVbKQaEOhxn3PKJv17l1EtKrLTJ1u31rga4P_Q&s=10'
        WHEN 206 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/e5/Coconut_Octopus_%28Amphioctopus_marginatus%29_%286079648725%29.jpg?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 207 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9-ipkzmcvLNpyeF13kRkoCvcRmYhteWQ19KoZUL_8OA&s=10'
        WHEN 208 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqAU7iFEDqxw8DJ4PsUwvjkXpj-iUBUn7wdlOjj2NoWv9AJ7s0lB-r5nE&s=10'
        WHEN 209 THEN 'https://t4.ftcdn.net/jpg/20/48/14/35/360_F_2048143507_bSEYENHKjkpOWlpxkGSM9fVuVCEvy8qh.jpg'
        WHEN 210 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQP1g1_ycqAW5zQQFavNkprK7CC0N3INgxlwkeI4hJzrdmqEAWtW-Rttow&s=10'
        WHEN 211 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsQMYecQjfUahvvBje8xdL3n4ZSejO0lNhGZ5mdRzF6ImTEXs47ev2UOhC&s=10'
        WHEN 212 THEN 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/49/Bulla_striata_01.JPG/330px-Bulla_striata_01.JPG?utm_source=pt.wikipedia.org&utm_campaign=parser&utm_content=thumbnail'
        WHEN 213 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6F8D2VNRoJXBD8s4P2Lsk_aU6TQXWAK8m8aWJaVSBtsxhykhqreD5koQ&s=10'
        WHEN 214 THEN 'https://thumb.wikimedia.org/wikipedia/commons/thumb/a/a1/Argonauta_argo_Merculiano.jpg/330px-Argonauta_argo_Merculiano.jpg?utm_source=pt.wikipedia.org&utm_campaign=parser&utm_content=thumbnail'
        WHEN 215 THEN 'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/13/Pu_-_Cranchia_scabra_-_2.jpg/250px-Pu_-_Cranchia_scabra_-_2.jpg?utm_source=en.wikipedia.org&utm_campaign=parser&utm_content=thumbnail'
        WHEN 216 THEN 'https://www.monaconatureencyclopedia.com/wp-content/uploads/2008/08/Chiton-tuberculatus.jpg'
        WHEN 217 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWju3DinWobEHgZo427dPdvG9MBuZuOjOrV-wA4X8EsjMwS9idn81kJb71&s=10'
        WHEN 218 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/11/Giant_clam_or_Tridacna_gigas.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 219 THEN 'https://media.conservationjobs.co.uk/2013/03/wiki-800px-Amerikanische_Schwertmuschel-700x525.jpg'
        WHEN 220 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/b5/Banana_Slug-1.jpg?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 221 THEN 'https://www.fishipedia.fr/wp-content/uploads/2020/05/Anentome-helena-v2-725x483.jpg'
        WHEN 222 THEN 'https://conchasbrasil.org.br/wp-content/uploads/2023/11/Crassostrea-gigas-55mm-col-ES.jpg'
        WHEN 223 THEN 'https://static.wixstatic.com/media/2b3d12_8ca9dddfbc61416b90cf30e15d687647~mv2.jpg/v1/fill/w_560,h_374,al_c,q_80,usm_0.66_1.00_0.01,enc_avif,quality_auto/2b3d12_8ca9dddfbc61416b90cf30e15d687647~mv2.jpg'
        WHEN 224 THEN 'https://lifg.australian.museum/Image/ExEFQLVI.jpeg?version=full'
        WHEN 225 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi_AwrvjqPHAV_3w18-a-e01UGAuzRaGw2JpmXeBnBqU2teQw7GNy2clc&s=10'
        WHEN 226 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpZ5wadI12j_SEqctik3w5IPEAA_pmMXwxpSgTlIND5b7G5OwYsi9CO6I&s=10'
        WHEN 227 THEN 'https://conchasbrasil.org.br/wp-content/uploads/2024/02/Polinices-hepaticus.jpg'
        WHEN 228 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpXLKpweJe0bsa1NTBxzz9y9Lx9ALNlYLeLylubSiSxw&s'
        WHEN 229 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmVUuUWNVm5_O4W1dWV9UjvH4dBR_fHlfKA1imIi2lbg&s=10'
        WHEN 230 THEN 'https://zookeys.pensoft.net/showimg/d200x_501553.jpg'
        WHEN 231 THEN 'https://www.sealifebase.se/images/thumbnails/jpg/Tn_Sepha_u0.jpg'
        WHEN 232 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_0fP0opH3YrWSu5O-52wV3qy2XBJmlLtOEA3OJsBH4Q&s=10'
        WHEN 233 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRg8Wqgkd6jE66Ydd-UvT9kMw-0vYNCH4QxnlYjeMchWA&s=10'
        WHEN 234 THEN 'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/92/Dosidicus_gigas.jpg/330px-Dosidicus_gigas.jpg?utm_source=pt.wikipedia.org&utm_campaign=parser&utm_content=thumbnail'
        WHEN 235 THEN 'https://cdn.awsli.com.br/600x450/2799/2799408/produto/384177432/nassarius_snail_nassarius_sp-adcp3r4bz4.jpg'
        WHEN 236 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROxxhxr-hhdDBiGcou8errjNeDUDVF-tRe_lKWXHgG2A&s=10'
        WHEN 237 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/a0/Vulcanoctopus_hydrothermalis.jpg?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 238 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZqEHaaUMN1j3B9jcY2wXpJ3bGemP623gFUR0ofvc5vg&s=10'
        WHEN 239 THEN 'https://upload.wikimedia.org/wikipedia/commons/d/de/Deroceras_reticulatum.JPG?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 240 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvfI0IOoWGzxcI0FrkUk1eW4ann8qv-_8zAjq_PkQ5YNS5LZ0Y-6cXjy0&s=10'
        WHEN 241 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuSkCNC7H36epEIdT1Q6JQ6OO4nHACPz3stjM2_n0gx5DCTcwx8SDcU8g&s=10'
        WHEN 242 THEN 'https://img.odcdn.com.br/wp-content/uploads/2021/07/teredo-1.jpg'
        WHEN 243 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/78/Clione_limacina_by_NOAA.jpg?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 244 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/53/Physa_acuta_001.JPG?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 245 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/f9/Aurelia_aurita_%28Cnidaria%29_Luc_Viatour.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 246 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQY8YRhod7Fqq5EU1xt3S3vwbumibta8CGEKh-kr2nvrFJrc5O0q4VGhiw&s=10'
        WHEN 247 THEN 'https://upload.wikimedia.org/wikipedia/commons/d/da/Actinia_equina2.JPG?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 248 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/22/Largelionsmanejellyfish.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 249 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_lg7Re9iQaAgyk772R1h9QbXQdYatKWO6iAGtaynqguhxKhVGDa5CV-ep&s=10'
        WHEN 250 THEN 'https://imagens.publico.pt/imagens.aspx/1363146?tp=UH&db=IMAGENS&type=JPG'
        WHEN 251 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Hydra_viridissima2.jpg?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 252 THEN 'https://media.istockphoto.com/id/106478325/photo/underwater-coral-reef-elkhorn.jpg?s=612x612&w=0&k=20&c=ngMNErLStEt4v8RII_5-gdk8XByTF6bJwRRf0lwCytE='
        WHEN 253 THEN 'https://lifg.australian.museum/Image/ru6uUtuj.jpeg?version=full'
        WHEN 254 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR560bWB0Iei14iAw2ULVhBe3WtC4vUARUj1nKvkM6Apw&s=10'
        WHEN 255 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9c/Millepora_alcicornis_%28Branching_Fire_Coral%29.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 256 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/77/Pelagia_noctiluca_%28Sardinia%29.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 257 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/cb/Pennatula_phosphorea.jpg?utm_source=it.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 258 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI6iqi7MGUhtVmUThY43J24Sd440faSR4DPcJvUZIC2A&s=10'
        WHEN 259 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDJNloZqiBC78fF_HHmlLufMQ3YZ8U8mGLObmKhykURg&s=10'
        WHEN 260 THEN 'https://s2-g1.glbimg.com/GLeOkRvVzDl6nKSKyV7Jjl49gyM=/0x0:1200x675/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2026/V/w/mnRsIlRwqNP6gWeeAePA/imagem-cortada-41-.jpg'
        WHEN 261 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQgHkA-bwEfz-sV4Vd8w3nE8P8_JLOia7wHt27ZIEbyhevo0XpKZGFJNQ&s=10'
        WHEN 262 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/54/Velella_Bae_an_Anaon.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 263 THEN 'https://www.monaconatureencyclopedia.com/wp-content/uploads/2008/08/il_cerianthus_membranaceus_vive_fino_a_35_m_di_profondita_nelle_acque_tranquille_del_mediterranneo_e_atlantico_orientale.jpg'
        WHEN 264 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQcNVKtUMpWKqTLWi0Via_Ikk83Bh-0xfh75TicE0yLw&s=10'
        WHEN 265 THEN 'https://cifonauta.cebimar.usp.br/media_files/uploads/2/6bf7102e-4bc2-45d3-bbc1-3fb91744fab2_cover.jpg'
        WHEN 266 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/4d/Antipathes_dichotoma2.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 267 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2JQjiTLhQiNkqvck3b0WqfMV93pOoQ31sEPe-KlCzDA&s=10'
        WHEN 268 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/ec/Spotted-jellyfish-af.jpg?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 269 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKfXEheMZBEuBYGLN86Bv2PJvsvVbt48ru0NVChMGZVw&s=10'
        WHEN 270 THEN 'https://cifonauta.cebimar.usp.br/media_files/uploads/2/6accb2f8-11d1-4150-b032-683af22ed9ff_cover.jpg'
        WHEN 271 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRqtjMvK1pvuE5vQrZ9MINmV8TChcdZ_L-AoZlm9gy2NhOY0THKIuiHSY&s=10'
        WHEN 272 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRR7Q6p4EsFpuYa8R1QAgHoW_9oM8Oi6s6NDOTLh7c4ZA&s=10'
        WHEN 273 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_9KwphCtbkiaDkBkn5xQ-AkCp9rLgrPUD0C0c_PtaIA&s=10'
        WHEN 274 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/33/Haliclystus_auricula_%28YPM_IZ_029402%29.jpeg?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 275 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7Y9D2wDM-q-PYot1Tq12lUYuXLHApFziK4518jKUgLsg4oIdzVURnBUuK&s=10'
        WHEN 276 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/14/Actinia_fragacea_%28Strawberry_Anemone%29.JPG?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 277 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgcoReZIdHFsIgirJlUqOn9I48993THHxBs-1Wzq-x4KJ20ADnKc8LKvo&s=10'
        WHEN 278 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfNg1Asn0_3DDB60PX1YJsxZiSRpgVIQCFTnqxhY2oAg&s=10'
        WHEN 279 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/a2/Aiptasia_pallida.jpg?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 280 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/b4/Cubozoa.jpg?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 281 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO3qi276_r8fg91d6qaRNZXWPfqGfI3dNfro-auiGkZA&s=10'
        WHEN 282 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7a/Actinodendron_arboreum2.jpg?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 283 THEN 'https://i.pinimg.com/736x/64/0b/3b/640b3b87d4e85333e14aa3c99b6047f2.jpg'
        WHEN 284 THEN 'https://thumb.wikimedia.org/wikipedia/commons/thumb/a/a6/Gorgonia_ventalina.jpg/250px-Gorgonia_ventalina.jpg?utm_source=en.wikipedia.org&utm_campaign=parser&utm_content=thumbnail'
        WHEN 285 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMk6sld3-JVNaseQuwSzY-1kzgKt2HSCmufmyQalrrgg&s=10'
        WHEN 286 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/57/Blue_jellyfish_in_Brofjorden_at_Sandvik_5_-_cropped.jpg?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 287 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNYVlc5ptrcXNREdvKeSoU7fQKGrAbz0Yc99cm96aU9IRPaXOqSV_rI5u3&s=10'
        WHEN 288 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuqE4F4ias0wvfJuihXt9Y6lY0qwoP_19OnIFl62tNtA&s=10'
        WHEN 289 THEN 'https://inaturalist-open-data.s3.amazonaws.com/photos/99949679/medium.jpg'
        WHEN 290 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWSOoisiDyEf9CVb_uUsH8DHUx--5EClCEFSao7fHbmCnHYs6Mpu4WinFn&s=10'
        WHEN 291 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQU_jwxfdZ5U9Ds7OUO20OmEynhuUEbdkqROX5vIHoGA&s=10'
        WHEN 292 THEN 'https://inaturalist-open-data.s3.amazonaws.com/photos/145955573/medium.jpeg'
        WHEN 293 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_iEdgqcLHzolm8g9dJffm60kDWTHozbOklNNGokLtE8fMxA8Frb_NDNs&s=10'
        WHEN 294 THEN 'https://s3.animalia.bio/animals/photos/full/original/diadumene-lineata-ypm-iz-095215jpeg.webp'
        WHEN 295 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/73/Aequorea4.jpg?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 296 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3b/Pachiclavularia_viridis.JPG?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 297 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAFRvZnIhOKfdR0F6xxsV5-uYa8odJqZyjPXmWe1hk7S12bn--jbLz-1Q&s=10'
        WHEN 298 THEN 'https://www.fishipedia.fr/wp-content/uploads/2026/06/chrysaora-pacifica-725x483.jpg'
        WHEN 299 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKenI790ZAL8rgPlzHXoLIaiIxZSYg3SfVomVk85fiNjMsG-T5jRmlgTTd&s=10'
        WHEN 300 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/eb/Alicia_mirabilis.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 301 THEN 'https://thumb.wikimedia.org/wikipedia/commons/thumb/a/a1/Drymonema_gorgo.jpg/250px-Drymonema_gorgo.jpg?utm_source=en.wikipedia.org&utm_campaign=parser&utm_content=thumbnail'
        WHEN 302 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4vMKTmN1vPzJG3AASCCpCpfrUEyb1NlGxSa6fo-Lg4CiRWpSE1v2bYzo&s=10'
        WHEN 303 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQU-VebTmDEzwu2ozYGS2_ucc-kLu2qDfNOuvNpllESCK-qAopyqB0rP_E&s=10'
        WHEN 304 THEN 'https://s3.animalia.bio/animals/photos/full/1.25x1/chrysaora-hysoscella-from-enoshima-aquarium.webp?id=512016e0a1c7cd34f9a97811b06fa433'
        WHEN 305 THEN 'https://lifg.australian.museum/Image/G7fEvvuy.jpeg?version=full'
        WHEN 306 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8ZjLfqCk6mGIccAnjM_20ofucbjCFQPIkljS55CVVQxpV6TeX0YN2CGElyqjmgwJfz8qqmTakoyjDuzRvD03UiSnKFax6MEuTVejgVQ&s=10'
        WHEN 307 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6j5DPtTMbKOv0P3Y3qO-hhuU-5-C3WBeI0SWUU8LKlNZeDCqPuKNQ-0N8&s=10'
        WHEN 308 THEN 'https://museubiodiversidade.uevora.pt/wp-content/uploads/2019/11/1202_Ht-II.jpg'
        WHEN 309 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0b/Acanthaster_planci_460468243_%28closeup%29.jpg?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 310 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/fd/Diadema_antillarum_Flower_Garden_Banks.jpg?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 311 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0muXlYJt5KarIVZCGnmZG8DZ_9Uq32zzW27KNoOS7uA&s=10'
        WHEN 312 THEN 'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/19/Ophiothrix-fragilis_4338.jpg/250px-Ophiothrix-fragilis_4338.jpg?utm_source=species.wikimedia.org&utm_campaign=parser&utm_content=thumbnail'
        WHEN 313 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqjqLwCLKZgzy5wOVINB1eh3b9N0xBjNS3RZMdjoeCWNQDFr8gxAVoZW4&s=10'
        WHEN 314 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPOwW_14i07pcyrVPcb282Ro4RMX_JZtTRkG0M-HiNoXqcKfz4E-hHGo6b&s=10'
        WHEN 315 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAEhy3DLT8ulxmD7wSJ6jR_k0OJiZJDjz78lJFCgCJ1_RbTJNSbduprag&s=10'
        WHEN 316 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/57/Bohadschia_argus.jpg?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 317 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/63/Heterocentrotus_mammillatus_in_situ_from_Hawaii.JPG?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 318 THEN 'https://static.inaturalist.org/photos/11626901/medium.jpg'
        WHEN 319 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfgUMqs7SzDlO5-ZQ40hB3zRBHkVTIx00x4MGXYKqj2VFDjblt9M4SDNa2&s=10'
        WHEN 320 THEN 'https://thumb.wikimedia.org/wikipedia/commons/thumb/a/a0/Sea_Cucumber_%28Thelenota_ananas%29_%286130015849%29.jpg/250px-Sea_Cucumber_%28Thelenota_ananas%29_%286130015849%29.jpg?utm_source=en.wikipedia.org&utm_campaign=parser&utm_content=thumbnail'
        WHEN 321 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZEjKuBwGjcrV0vlEgVjTm8cG5q1FIy0mNZBCBG35OxA&s=10'
        WHEN 322 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtZFUX2eo4-ozK2mtTxLoV_3YvtL4DEF2qXbl9q4k8ig&s=10'
        WHEN 323 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/51/Toxopneustes_pileolus_%28Sea_urchin%29.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 324 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhGANZ_MQ8eWcshs4ipyYGgvAvrIeNbxE0Q2yHMWW8hhgXWq75hDwDwrQ&s=10'
        WHEN 325 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdGxc6LstZkXouNoK3XiK0CtI_PoH6TLbAF__tXL_T9OxxSRHTbI9G3pU&s=10'
        WHEN 326 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaqTcbOKI5lHFj8THHT2PIEgVqmr3ujgESVPPUQSOimqF2kvboAJARRsU&s=10'
        WHEN 327 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4YPgNq1-OunyIgrX33AKO1iDFlZg2Q-wFsOdEibpg0iVawYbtxnZXNd0&s=10'
        WHEN 328 THEN 'https://cdnx.jumpseller.com/fragario-do-norte/image/43932817/C_pia_de_Imagem_Peixes_Novo_Website__78_.png?1703858255'
        WHEN 329 THEN 'https://lifg.australian.museum/Image/xpJbbFRb.jpeg?version=full'
        WHEN 330 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4SQ8Sro5fhgk1H0h0MBceKmXFW-F11s-nIXUYkFR6JA&s=10'
        WHEN 331 THEN 'https://www.portal.zoo.bio.br/local/cache-vignettes/L560xH420/estrela_do_mar_vermelha-3dd81.jpg?1752835541'
        WHEN 332 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/71/Ophionereis_reticulata_1.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 333 THEN 'https://www.underwaterkwaj.com/uw-misc/crinoid/Comaster-schlegelii-jj-3-091602jpg.jpg'
        WHEN 334 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1TYQbWhtk9Km_b0ZTbre_p3JLdrjdjyfoSyV8OGXXtLAuBwXH1vi-zzbi&s=10'
        WHEN 335 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS65hxIM0Z4_djm5xtawBuknlVdEeB-ArofUgStzLHsWQ&s=10'
        WHEN 336 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSu32H0VJVtAuVqU6xiU0rVGydO-D7mtrx-oYG0icjPuubC8R3qj1_i19A&s=10'
        WHEN 337 THEN 'https://images.marinespecies.org/thumbs/144647_echinocardium-cordatum-oral.jpg?w=700'
        WHEN 338 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbqdm-qRaoBA6qhXTiUiqcNOLE_hPUYx0DszOHDSyKag&s=10'
        WHEN 339 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUX1cdHrHGUfGKosutQYZDUWrld4u9lwv0FVBHV3a0V-x8hDKJ49xVCKU&s=10'
        WHEN 340 THEN 'https://nathistoc.bio.uci.edu/Echinos/Ophiopterus1.jpg'
        WHEN 341 THEN 'https://inaturalist-open-data.s3.amazonaws.com/photos/6062509/medium.jpeg'
        WHEN 342 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRATHP5nopHcaEFGUJo12rjD-4ylJfY9ZL8vliHgcl9dg&s=10'
        WHEN 343 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdQ4Hh_flzEgjTGb4aSAHU4ewIRD-QEDmqqQPJotNxhw&s=10'
        WHEN 344 THEN 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4a/Cenometra_bella_Maldives.JPG/250px-Cenometra_bella_Maldives.JPG?utm_source=en.wikipedia.org&utm_campaign=parser&utm_content=thumbnail'
        WHEN 345 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSK8VdR67qkuiDUKzTn_IeKJpkHAe6QQyDYny689SvDW5_q-r60yE9bOMMY&s=10'
        WHEN 346 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMZAcyBxwO-d5-_yEKpBiuNvuDkiUP31CEBFKFcFSRgyeyKoWcvpZ0Uyrd&s=10'
        WHEN 347 THEN 'https://www.meerwasser-lexikon.de/imgHaupt/64909_5fc54029bcf58.jpg'
        WHEN 348 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9X76U_mofZ5j88eMsVgNSjeYvErUqRCe3oVhWA50_1Cy0ro07sfUxEDE&s=10'
        WHEN 349 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNW8ZfHs5AhEUtRBWSUTMA9p-XHtShy7jfq3bbpiiBAmT67cgNK6jwnDDX&s=10'
        WHEN 350 THEN 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b3/Ophiolepis_paucispina_389644336.jpg/250px-Ophiolepis_paucispina_389644336.jpg?utm_source=en.wikipedia.org&utm_campaign=parser&utm_content=thumbnail'
        WHEN 351 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8PueEGRR3vVQCRYaCfkUMKlrzcBho9wPlv3ig_uax5p5xzOhGXSczDxs&s=10'
        WHEN 352 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVfb456Ge6GfcpECpaCM4X80lAxWJa8tcQVuZwDd3sfw&s=10'
        WHEN 353 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjoEcUiVEQqk_nw5u08uWrhtSlysfQtOyqfjCeLNqEXw&s=10'
        WHEN 354 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHBGpVzQMk7BBytmdfl4YbvV84pvmTzTeso60oG5QE4KpWaWAd1CzuGAM&s=10'
        WHEN 355 THEN 'https://cdn.abicart.com/shop/ws41/55741/art41/h4765/183424765-origpic-16590c.jpg'
        WHEN 356 THEN 'https://thumb.wikimedia.org/wikipedia/commons/thumb/8/8c/Arbacia_lixula_02.JPG/250px-Arbacia_lixula_02.JPG?utm_source=en.wikipedia.org&utm_campaign=parser&utm_content=thumbnail'
        WHEN 357 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9mwImE6o1ZQidrTXxL9wBshweLQ0G7qVWcj5v_AX3GA&s=10'
        WHEN 358 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTM-mku8Nw9a3evevvkn-eOtTG-zU0APjbSLda46yRjw&s=10'
        WHEN 359 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkF_ZSwJisQMqRJbrnxbNtG2nbILK_1scXzAu1IwJAlekCrINdPpPkrCI&s=10'
        WHEN 360 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsThWpLra6bja24UqaHKFkd4YRXfwwlZHy2QGwpsUXKcRuwV35Kq4E-EAV&s=10'
        WHEN 361 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/89/Ochre_sea_star.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 362 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/13/Pseudocolochirus_axiologus.jpg?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original'
        WHEN 363 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv0Ph0OV6sj7vKxj2yezh3925eSijzsLU0D8P8K8lAFQ&s=10'
        WHEN 364 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNdyRfQBsjWfNo3_J1tMbPRiVHk-xwFIOjU3LgTCSSF-01zTD8y9r3XqLD&s=10'
        WHEN 365 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZrtb30Cz404dOHJSnNbMN91VoxgxQvgkBS8Q37brPoFLT0hDS9cWFAmvQ&s=10'
        WHEN 366 THEN 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6J2AE8leqSHSudC1mm082GJ67MXw_BSxoU5adNhCAHN9z2M_u3GF7rFs&s=10'
        ELSE foto_insetos
    END
WHERE id_insetos BETWEEN 1 AND 366;

SELECT * FROM insetos;