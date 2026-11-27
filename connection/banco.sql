DROP DATABASE IF EXISTS insetos_db_app;
CREATE DATABASE IF NOT EXISTS insetos_db_app;
USE insetos_db_app;

CREATE TABLE IF NOT EXISTS usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    email_usuario VARCHAR(100) NOT NULL UNIQUE,
    senha_usuario VARCHAR(255) NOT NULL, 
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
('Mosca doméstica', 'Musca domestica', 'insetos', 'Muscidae', 'Detritívoro', 'Sente o sabor com as patas, pois possui receptores gustativos nas pernas.'),
('Mosquito da dengue', 'Aedes aegypti', 'insetos', 'Culicidae', 'Hematófago', 'Somente as fêmeas picam, pois precisam do sangue para o desenvolvimento dos ovos.'),
('Borboleta Morpho azul', 'Morpho menelaus', 'insetos', 'Nymphalidae', 'Frugívoro', 'O azul metálico das asas vem da estrutura microscópica das escamas, e não de pigmentos.'),
('Borboleta rabo de andorinha', 'Papilio machaon', 'insetos', 'Papilionidae', 'Nectarívoro', 'Suas lagartas exibem um órgão em forma de chifre que libera odor para afastar predadores.'),
('Mariposa caveira', 'Acherontia atropos', 'insetos', 'Sphingidae', 'Nectarívoro', 'Tem um desenho semelhante a uma caveira no tórax e invade colmeias para roubar mel.'),
('Bicho-da-seda', 'Bombyx mori', 'insetos', 'Bombycidae', 'Herbívoro', 'Seu casulo é formado por um único fio contínuo de seda, de grande valor têxtil.'),
('Grilo doméstico', 'Acheta domesticus', 'insetos', 'Gryllidae', 'Onívoro', 'O macho canta esfregando as asas, e a frequência do canto varia com a temperatura.'),
('Esperança verde', 'Tettigonia viridissima', 'insetos', 'Tettigoniidae', 'Onívoro', 'Possui órgãos auditivos localizados nas pernas dianteiras.'),
('Cigarra periódica', 'Magicicada septendecim', 'insetos', 'Cicadidae', 'Herbívoro', 'Passa quase todo o ciclo de vida debaixo da terra e emerge em massa a cada 17 anos.'),
('Percevejo de cama', 'Cimex lectularius', 'insetos', 'Cimicidae', 'Hematófago', 'Consegue sobreviver por meses sem se alimentar quando não há hospedeiros por perto.'),
('Piolho humano', 'Pediculus humanus', 'insetos', 'Pediculidae', 'Hematófago', 'Ectoparasita sem asas que prende os ovos, chamados lêndeas, firmemente aos fios de cabelo.'),
('Abelha jataí', 'Tetragonisca angustula', 'insetos', 'Apidae', 'Nectarívoro', 'Abelha nativa sem ferrão, muito apreciada pelo mel suave e pela facilidade de criação.'),
('Mamangava', 'Bombus terrestris', 'insetos', 'Apidae', 'Nectarívoro', 'Realiza polinização por vibração, técnica essencial para flores como as do tomateiro.'),
('Abelha uruçu', 'Melipona scutellaris', 'insetos', 'Apidae', 'Nectarívoro', 'Abelha nativa brasileira sem ferrão que constrói ninhos com potes de cera para guardar mel.'),
('Formiga lava-pés', 'Solenopsis invicta', 'insetos', 'Formicidae', 'Onívoro', 'Quando a colônia é inundada, as operárias se agarram umas às outras e formam jangadas vivas.'),
('Formiga bala', 'Paraponera clavata', 'insetos', 'Formicidae', 'Onívoro', 'Possui uma das picadas mais dolorosas entre os insetos, comparada a um tiro.'),
('Formiga argentina', 'Linepithema humile', 'insetos', 'Formicidae', 'Onívoro', 'Forma supercolônias gigantescas que se estendem por continentes inteiros.'),
('Formiga de correição', 'Eciton burchellii', 'insetos', 'Formicidae', 'Carnívoro', 'Vive em colônias nômades que marcham em enormes colunas caçando outros artrópodes.'),
('Vespa papel', 'Polistes dominula', 'insetos', 'Vespidae', 'Carnívoro', 'Constrói ninhos de fibras de madeira mastigadas e misturadas com saliva.'),
('Vespa esmeralda', 'Ampulex compressa', 'insetos', 'Ampulicidae', 'Carnívoro', 'Injeta veneno no cérebro de baratas para controlá-las e usá-las como alimento para suas larvas.'),
('Vespa caçadora de tarântulas', 'Pepsis grossa', 'insetos', 'Pompilidae', 'Nectarívoro', 'A fêmea paralisa tarântulas com a picada e as usa como alimento para sua larva.'),
('Libélula vermelha', 'Sympetrum sanguineum', 'insetos', 'Libellulidae', 'Carnívoro', 'O macho adulto tem coloração vermelha intensa e defende ativamente seu território.'),
('Donzelinha esplêndida', 'Calopteryx splendens', 'insetos', 'Calopterygidae', 'Carnívoro', 'Os machos realizam voos de corte exibindo as asas azuis metálicas para atrair fêmeas.'),
('Efêmera comum', 'Ephemera danica', 'insetos', 'Ephemeridae', 'Detritívoro', 'Na fase adulta vive apenas poucas horas ou dias, dedicados exclusivamente à reprodução.'),
('Joaninha asiática', 'Harmonia axyridis', 'insetos', 'Coccinellidae', 'Carnívoro', 'Apresenta enorme variação de cores e padrões nos élitros, indo do laranja ao preto.'),
('Crisopa verde', 'Chrysoperla carnea', 'insetos', 'Chrysopidae', 'Carnívoro', 'Suas larvas, chamadas de leões-de-pulgões, são vorazes predadoras de pragas agrícolas.'),
('Formiga-leão', 'Myrmeleon formicarius', 'insetos', 'Myrmeleontidae', 'Carnívoro', 'A larva cava um funil de areia para capturar formigas que escorregam até o fundo.'),
('Barata alemã', 'Blattella germanica', 'insetos', 'Ectobiidae', 'Onívoro', 'A fêmea carrega a ooteca presa ao abdômen até pouco antes da eclosão dos ovos.'),
('Barata de Madagascar', 'Gromphadorhina portentosa', 'insetos', 'Blaberidae', 'Detritívoro', 'Emite um chiado forçando o ar pelos espiráculos, usado em disputas e na corte.'),
('Louva-a-deus fantasma', 'Phyllocrania paradoxa', 'insetos', 'Hymenopodidae', 'Carnívoro', 'Imita folhas secas com extensões na cabeça e no corpo para se camuflar.'),
('Louva-a-deus africano', 'Sphodromantis lineola', 'insetos', 'Mantidae', 'Carnívoro', 'Captura presas com as patas dianteiras em um movimento extremamente rápido.'),
('Bicho-pau indiano', 'Carausius morosus', 'insetos', 'Lonchodidae', 'Herbívoro', 'As fêmeas podem se reproduzir sem acasalamento, por partenogênese.'),
('Gafanhoto do deserto', 'Schistocerca gregaria', 'insetos', 'Acrididae', 'Herbívoro', 'Pode mudar de comportamento e cor ao entrar na fase gregária, formando nuvens devastadoras.'),
('Grilo-toupeira', 'Gryllotalpa gryllotalpa', 'insetos', 'Gryllotalpidae', 'Onívoro', 'Possui patas dianteiras largas e fortes, adaptadas para escavar túneis no solo.'),
('Weta gigante', 'Deinacrida heteracantha', 'insetos', 'Anostostomatidae', 'Herbívoro', 'Um dos insetos mais pesados do mundo, nativo da Nova Zelândia.'),
('Cupim de madeira seca', 'Cryptotermes brevis', 'insetos', 'Kalotermitidae', 'Herbívoro', 'Vive dentro da própria madeira e dispensa contato com o solo, infestando móveis.'),
('Mosca-das-frutas', 'Drosophila melanogaster', 'insetos', 'Drosophilidae', 'Frugívoro', 'Organismo modelo fundamental na genética, com vários Prêmios Nobel associados a seu estudo.'),
('Mosca tsé-tsé', 'Glossina morsitans', 'insetos', 'Glossinidae', 'Hematófago', 'Transmite o protozoário causador da doença do sono na África.'),
('Mosca-da-bicheira', 'Cochliomyia hominivorax', 'insetos', 'Calliphoridae', 'Parasita', 'Suas larvas se alimentam de tecidos vivos de animais de sangue quente.'),





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
('Escorpião-de-Barriga-Preta', 'Tityus stigmurus', 'Aracnídeos', 'Buthidae', 'Carnívoro', 'Comum no Nordeste e com manchas escuras no ventre.'),
('Escorpião-do-Nordeste', 'Tityus costatus', 'Aracnídeos', 'Buthidae', 'Carnívoro', 'Ocorre em áreas de Mata Atlântica e possui coloração alaranjada.'),
('Escorpião-de-Cauda-Estreita', 'Parabuthus transvaalicus', 'Aracnídeos', 'Buthidae', 'Carnívoro', 'Usa a cauda para estridular quando se sente ameaçado.'),
('Escorpião-de-Rocha', 'Hadogenes troglodytes', 'Aracnídeos', 'Hormuridae', 'Carnívoro', 'Corpo bem achatado para se espremer em fendas de pedra.'),
('Escorpião-de-Floresta', 'Heterometrus spinifer', 'Aracnídeos', 'Scorpionidae', 'Carnívoro', 'Grande, escuro e de pinças largas, comum no Sudeste Asiático.'),
('Escorpião-Peludo-do-Deserto', 'Hadrurus spadix', 'Aracnídeos', 'Caraboctonidae', 'Carnívoro', 'Possui cerdas sensoriais longas no metassoma e pernas.'),
('Escorpião-de-Pata-Amarela', 'Centruroides exilicauda', 'Aracnídeos', 'Buthidae', 'Carnívoro', 'É uma das espécies mais tóxicas da América do Norte.'),
('Escorpião-de-Casca-Mexicano', 'Centruroides limpidus', 'Aracnídeos', 'Buthidae', 'Carnívoro', 'Espécie de importância médica no oeste do México.'),
('Escorpião-Indiano-Vermelho', 'Hottentotta tamulus', 'Aracnídeos', 'Buthidae', 'Carnívoro', 'Bastante temido em regiões rurais da Índia.'),
('Escorpião-de-Areia-Namibiano', 'Opistophthalmus carinatus', 'Aracnídeos', 'Scorpionidae', 'Carnívoro', 'Cava tocas profundas em solos arenosos e secos.'),
('Carrapato-Marrom-do-Cão', 'Rhipicephalus sanguineus', 'Aracnídeos', 'Ixodidae', 'Hematófago', 'Adapta-se facilmente a ambientes internos e canis.'),
('Carrapato-do-Cavalo', 'Dermacentor nitens', 'Aracnídeos', 'Ixodidae', 'Hematófago', 'Costuma fixar-se dentro das orelhas de equídeos.'),
('Carrapato-de-Pombo', 'Argas reflexus', 'Aracnídeos', 'Argasidae', 'Hematófago', 'Alimentar-se à noite e esconde-se em frestas de ninhos.'),
('Carrapato-de-Tartaruga', 'Amblyomma dissimile', 'Aracnídeos', 'Ixodidae', 'Hematófago', 'Frequente em répteis e anfíbios em áreas tropicais.'),
('Carrapato-de-Cobra', 'Amblyomma rotundatum', 'Aracnídeos', 'Ixodidae', 'Hematófago', 'Pode reproduzir-se por partenogênese sem necessidade de macho.'),
('Ácaro-da-Farinha', 'Acarus siro', 'Aracnídeos', 'Acaridae', 'Detritívoro', 'Multiplica-se em grãos, farinhas e queijos armazenados.'),
('Ácaro-das-Abelhas', 'Varroa destructor', 'Aracnídeos', 'Varroidae', 'Parasita', 'Alimenta-se da hemolinfa de abelhas e enfraquece colmeias.'),
('Ácaro-do-Solo', 'Oribatida sp.', 'Aracnídeos', 'Oribatidae', 'Detritívoro', 'Ajuda a fragmentar matéria orgânica e reciclar nutrientes.'),
('Ácaro-Predador-de-Ácaros', 'Phytoseiulus persimilis', 'Aracnídeos', 'Phytoseiidae', 'Carnívoro', 'Usado no controle biológico contra ácaros-rajados.'),
('Ácaro-de-Galinha', 'Dermanyssus gallinae', 'Aracnídeos', 'Dermanyssidae', 'Hematófago', 'Pica aves principalmente no escuro e esconde-se de dia.'),
('Opilião-de-Caverna-Cego', 'Phalangodidae sp.', 'Aracnídeos', 'Phalangodidae', 'Onívoro', 'Perdeu olhos funcionais em ambientes subterrâneos.'),
('Opilião-Coroado', 'Metagyndes sp.', 'Aracnídeos', 'Gonyleptidae', 'Onívoro', 'Apresenta tubérculos e espinhos marcantes no dorso.'),
('Opilião-de-Pernas-Gigantes', 'Dicranopalpus ramosus', 'Aracnídeos', 'Phalangiidae', 'Onívoro', 'Mantém as pernas estendidas para frente quando em repouso.'),
('Opilião-Aquático', 'Hydrozetes lacustris', 'Aracnídeos', 'Hydrozetidae', 'Detritívoro', 'Vive associado a plantas aquáticas em águas doces.'),
('Opilião-Dourado-da-Mata', 'Discocyrtus sp.', 'Aracnídeos', 'Gonyleptidae', 'Onívoro', 'Comum na serrapilheira úmida de florestas tropicais.'),
('Amblipígio-Anão', 'Charinus brasilianus', 'Aracnídeos', 'Charinidae', 'Carnívoro', 'Pequeno aracnídeo sem veneno encontrado em matas e cavernas.'),
('Amblipígio-de-Caverna-Asiático', 'Sarax sp.', 'Aracnídeos', 'Charinidae', 'Carnívoro', 'Usa pedipalpos espinhosos para segurar presas com rapidez.'),
('Vinagrinho-de-Cauda-Curta', 'Schizomus sp.', 'Aracnídeos', 'Hubbardiidae', 'Carnívoro', 'Aracnídeo diminuto de solo úmido e serrapilheira.'),
('Vinagrinho-Tropical', 'Mastigoproctus baracoensis', 'Aracnídeos', 'Thelyphonidae', 'Carnívoro', 'Espécie robusta que libera secreção de cheiro avinagrado.'),
('Solífugo-do-Deserto', 'Galeodes granti', 'Aracnídeos', 'Galeodidae', 'Carnívoro', 'Movimenta-se em rajadas rápidas por áreas áridas.'),
('Solífugo-Noturno', 'Eremobates durangonus', 'Aracnídeos', 'Eremobatidae', 'Carnívoro', 'Caça insetos e pequenos vertebrados durante a noite.'),
('Pseudoescorpião-dos-Livros', 'Lamprochernes nodosus', 'Aracnídeos', 'Chernetidae', 'Carnívoro', 'Às vezes pega carona em insetos voadores para se dispersar.'),
('Pseudoescorpião-de-Casca', 'Garypus californicus', 'Aracnídeos', 'Garypidae', 'Carnívoro', 'Vive sob pedras e cascas em zonas costeiras.'),
('Pseudoescorpião-de-Solo', 'Chthonius ischnocheles', 'Aracnídeos', 'Chthoniidae', 'Carnívoro', 'Pequeno predador que caça colêmbolos e ácaros na terra.'),
('Palpígrado-de-Solo', 'Koenenia sp.', 'Aracnídeos', 'Eukoeneniidae', 'Carnívoro', 'Possui um flagelo articulado na ponta do abdômen.'),
('Ricínuleo-de-Floresta', 'Cryptocellus sp.', 'Aracnídeos', 'Ricinoididae', 'Carnívoro', 'Tem uma aba móvel na frente do corpo que cobre a boca.'),
('Caranguejeira-Azul-do-Brasil', 'Pterinopelma sazimai', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Espécie nativa de áreas altas com reflexos azulados.'),
('Caranguejeira-de-Listras-Brancas', 'Acanthoscurria brocklehursti', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Aranha grande de hábitos terrestres e temperamento variável.'),
('Viúva-Campestre', 'Latrodectus campestreensis', 'Aracnídeos', 'Theridiidae', 'Carnívoro', 'Constrói teias irregulares resistentes em frestas e arbustos. Exemplar associado a ambiente campestre.'),





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
('Búzio Cabeça de Martelo', 'Malleus malleus', 'Moluscos', 'Malleidae', 'Filtrador', 'Tem formato que lembra um martelo ou âncora.'),
('Caracol Marinho Tigre', 'Tonna galea', 'Moluscos', 'Tonnidae', 'Carnívoro', 'Concha globosa bem inflada e leve.'),
('Polvo de Sete Braços', 'Haliphron atlanticus', 'Moluscos', 'Alloposidae', 'Carnívoro', 'O macho tem o braço reprodutivo enrolado sob o olho.'),
('Lula Espiral', 'Spirula spirula', 'Moluscos', 'Spirulidae', 'Carnívoro', 'Possui concha interna espiralada com câmaras de gás.'),
('Mexilhão Verde', 'Perna viridis', 'Moluscos', 'Mytilidae', 'Filtrador', 'Muito usado em cultivos e indicador ambiental.'),
('Ostra Americana', 'Crassostrea virginica', 'Moluscos', 'Ostreidae', 'Filtrador', 'Importante na filtragem de estuários.'),
('Caracol de Jardim Listado', 'Cepaea nemoralis', 'Moluscos', 'Helicidae', 'Herbívoro', 'Apresenta grande variação de cores e faixas na concha.'),
('Lesma do Mar Morango', 'Peltodoris nobilis', 'Moluscos', 'Discodorididae', 'Carnívoro', 'Quando esmagada solta aroma que lembra morango.'),
('Lula Pigmeia', 'Idiosepius paradoxus', 'Moluscos', 'Idiosepiidae', 'Carnívoro', 'Uma das menores lulas, fixa-se em algas com glândula adesiva.'),
('Caracol Fusiforme', 'Fusinus colus', 'Moluscos', 'Fasciolariidae', 'Carnívoro', 'Concha alongada com canal sifonal bem comprido.'),
('Bivalve Lima', 'Lima lima', 'Moluscos', 'Limidae', 'Filtrador', 'Tem tentáculos longos e brancos que não cabem na concha.'),
('Caramujo de Rio', 'Melanoides tuberculata', 'Moluscos', 'Thiaridae', 'Detritívoro', 'Comum em substratos de água doce e reprodução partenogenética.'),
('Polvo Arenoso', 'Callistoctopus macropus', 'Moluscos', 'Octopodidae', 'Carnívoro', 'Avermelhado com manchas brancas, ativo ao entardecer.'),
('Lula Diamante', 'Thysanoteuthis rhombus', 'Moluscos', 'Thysanoteuthidae', 'Carnívoro', 'Corpo em formato de losango e nadadeiras longas.'),
('Caracol Harpa', 'Harpa major', 'Moluscos', 'Harpidae', 'Carnívoro', 'Concha com costelas salientes que lembram cordas de harpa.'),
('Ostra Espinhosa do Pacífico', 'Spondylus princeps', 'Moluscos', 'Spondylidae', 'Filtrador', 'Concha avermelhada com espinhos marcantes.'),
('Lesma do Mar Pavão', 'Histiomena', 'Moluscos', 'Histiomenidae', 'Carnívoro', 'Coloração chamativa em ambientes recifais.'),
('Caramujo Capacete', 'Cassis cornuta', 'Moluscos', 'Cassidae', 'Carnívoro', 'Concha robusta usada na fabricação de camafeus.'),
('Bivalve Coração', 'Corculum cardissa', 'Moluscos', 'Cardiidae', 'Filtrador', 'Concha achatada que lembra um coração e abriga microalgas.'),
('Lula Bobtail Havaiana', 'Euprymna scolopes', 'Moluscos', 'Sepiolidae', 'Carnívoro', 'Usa bactérias bioluminescentes para camuflagem ventral.'),
('Caracol Olho de Boi', 'Turbo setosus', 'Moluscos', 'Turbinidae', 'Herbívoro', 'Tem opérculo calcário espesso que veda a abertura.'),
('Mexilhão de Água Doce', 'Anodonta cygnea', 'Moluscos', 'Anodontidae', 'Filtrador', 'Larvas parasitam temporariamente peixes de água doce.'),
('Lesma do Mar Cromodoris', 'Chromodoris annae', 'Moluscos', 'Chromodorididae', 'Carnívoro', 'Exibe padrões de pontos e bordas contrastantes.'),
('Caracol Concha de Aranha', 'Lambis lambis', 'Moluscos', 'Strombidae', 'Herbívoro', 'A borda da concha forma projeções que parecem patas.'),
('Polvo Estrelado', 'Octopus briareus', 'Moluscos', 'Octopodidae', 'Carnívoro', 'Pode assumir tom azul-esverdeado brilhante sob luz.'),
('Bivalve Navio', 'Bankia gouldi', 'Moluscos', 'Teredinidae', 'Xilófago', 'Perfurador de madeira semelhante ao teredo.'),
('Caramujo Ampulária Dourada', 'Pomacea diffusa', 'Moluscos', 'Ampullariidae', 'Herbívoro', 'Popular em aquários de água doce e menos agressiva às plantas.'),
('Lula de Recifes do Caribe', 'Sepioteuthis sepioidea', 'Moluscos', 'Loliginidae', 'Carnívoro', 'Comunica-se mudando padrões de cor na pele.'),
('Caracol Vênus', 'Venerupis philippinarum', 'Moluscos', 'Veneridae', 'Filtrador', 'Bivalve muito explorado na aquicultura costeira.'),
('Lesma do Mar Flabellina', 'Flabellinopsis iodinea', 'Moluscos', 'Coryphellidae', 'Carnívoro', 'Corpo violeta intenso com ceratas alaranjadas.'),
('Caramujo Cônico Marble', 'Conus marmoreus', 'Moluscos', 'Conidae', 'Carnívoro', 'Concha escura com manchas claras que parecem mármore.'),
('Bivalve Arca', 'Anadara granosa', 'Moluscos', 'Arcidae', 'Filtrador', 'Possui sangue avermelhado por causa da hemoglobina.'),
('Caracol Tritão do Atlântico', 'Charonia variegata', 'Moluscos', 'Charoniidae', 'Carnívoro', 'Predador de equinodermos em recifes tropicais.'),
('Polvo de Fundo Profundo', 'Benthoctopus', 'Moluscos', 'Octopodidae', 'Carnívoro', 'Habita regiões abissais de águas frias e escuras.'),
('Lula Recifal de Ponta Branca', 'Sepioteuthis lessoniana', 'Moluscos', 'Loliginidae', 'Carnívoro', 'Forma cardumes costeiros e faz desovas em algas ou galhos.'),
('Caracol de Terra Brasileiro', 'Thaumastus', 'Moluscos', 'Megalobulimidae', 'Herbívoro', 'Gênero presente em áreas florestais sul-americanas.'),
('Ostra de Rocha', 'Striostrea prismatica', 'Moluscos', 'Ostreidae', 'Filtrador', 'Fixa-se firmemente em rochas da zona entremarés.'),
('Lesma do Mar Cinza', 'Arion vulgaris', 'Moluscos', 'Arionidae', 'Onívoro', 'Adapta-se bem a jardins e áreas agrícolas úmidas.'),
('Caramujo Nerita', 'Nerita peloronta', 'Moluscos', 'Neritidae', 'Herbívoro', 'Vive na faixa de respingos das ondas em costões.'),





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
('Água viva do mar', 'Chrysaora quinquecirrha', 'Cnidário', 'Pelagiidae', 'Carnívoro', 'Espécie costeira comum com tentáculos longos e urticantes que variam de cor conforme o ambiente.'),
('Coral mesa', 'Acropora hyacinthus', 'Cnidário', 'Acroporidae', 'Carnívoro', 'Forma estruturas largas e achatadas em forma de prateleira que oferecem abrigo para peixes de recife.'),
('Anêmona plumosa', 'Metridium senile', 'Cnidário', 'Metridiidae', 'Carnívoro', 'Quando expandida, exibe uma coroa densa de centenas de tentáculos finos e emplumados.'),
('Água viva balão', 'Catostylus mosaicus', 'Cnidário', 'Catostylidae', 'Carnívoro', 'Comum em estuários e baías, apresenta umbrella firme e coloração que varia do azul ao marrom.'),
('Coral bolha', 'Plerogyra sinuosa', 'Cnidário', 'Euphylliidae', 'Carnívoro', 'Possui vesículas cheias de líquido que lembram uvas ou bolhas e se expandem durante o dia.'),
('Anêmona morango', 'Corynactis californica', 'Cnidário', 'Corallimorphidae', 'Carnívoro', 'Forma tapetes coloridos em rochas submersas com tentáculos terminados em pequenas esferas.'),
('Água viva de caixa australiana', 'Chironex yamaguchii', 'Cnidário', 'Chirodropidae', 'Carnívoro', 'Cubozoário altamente perigoso presente em águas tropicais com veneno de ação rápida.'),
('Coral martelo', 'Euphyllia ancora', 'Cnidário', 'Euphylliidae', 'Carnívoro', 'Apresenta pólipos alongados com pontas em formato de âncora ou martelo que balançam na correnteza.'),
('Anêmona da areia', 'Edwardsia elegans', 'Cnidário', 'Edwardsiidae', 'Carnívoro', 'Vive enterrada na areia ou lama, deixando apenas a coroa de tentáculos exposta na superfície.'),
('Água viva reversível', 'Cassiopea xamachana', 'Cnidário', 'Cassiopeidae', 'Carnívoro', 'Costuma ficar de cabeça para baixo no fundo raso, abrigando algas simbióticas nos tentáculos.'),
('Coral cérebro labirinto', 'Diploria labyrinthiformis', 'Cnidário', 'Faviidae', 'Carnívoro', 'Construído por esqueletos calcários duros com sulcos profundos e contínuos em formato de labirinto.'),
('Anêmona joia', 'Corynactis viridis', 'Cnidário', 'Corallimorphidae', 'Carnívoro', 'Pequena espécie colonial de cores vivas que recobre superfícies rochosas em áreas sombreadas.'),
('Água viva capacete', 'Pericolpa quadrigata', 'Cnidário', 'Periphyllidae', 'Carnívoro', 'Medusa de águas profundas com umbrella cônica marcada e comportamento bioluminescente.'),
('Coral chifre de veado', 'Acropora cervicornis', 'Cnidário', 'Acroporidae', 'Carnívoro', 'Forma ramificações longas e esguias semelhantes a galhadas, sendo importante na formação de recifes.'),
('Anêmona roxa', 'Condylactis passiflora', 'Cnidário', 'Actiniidae', 'Carnívoro', 'Exibe disco oral vistoso e tentáculos longos com tons que vão do creme ao arroxeado.'),
('Água viva cristal', 'Aequorea forskalea', 'Cnidário', 'Aequoreidae', 'Carnívoro', 'Corpo transparente em forma de sino com canais radiais bem definidos e margem tentacular.'),
('Coral orelha de elefante', 'Mycedium elephantotus', 'Cnidário', 'Agariciidae', 'Carnívoro', 'Forma lâminas largas e onduladas com coralitos voltados para a borda externa da colônia.'),
('Anêmona cravo', 'Phymanthus crucifer', 'Cnidário', 'Phymanthidae', 'Carnívoro', 'Possui disco oral ornamental com padrões geométricos e tentáculos curtos ao redor da borda.'),
('Água viva cometa', 'Tiburonia granrojo', 'Cnidário', 'Ulmaridae', 'Carnívoro', 'Medusa de águas profundas de coloração vermelho-vinho intensa e sem tentáculos longos.'),
('Coral cérebro simétrico', 'Pseudodiploria strigosa', 'Cnidário', 'Faviidae', 'Carnívoro', 'Coral massivo resistente, comum em recifes tropicais, com cristas e vales bem pronunciados.'),
('Anêmona do mangue', 'Bunodeopsis globulifera', 'Cnidário', 'Boloceroididae', 'Carnívoro', 'Pequena anêmona associada a raízes de mangue e áreas costeiras abrigadas com bojos arredondados.'),
('Água viva sino', 'Gonionemus vertens', 'Cnidário', 'Olindiidae', 'Carnívoro', 'Hidromedusa pequena com tentáculos adesivos dotados de ventosas para fixação em algas.'),
('Coral flor de pedra', 'Mussa angulosa', 'Cnidário', 'Mussidae', 'Carnívoro', 'Coral grande e carnoso de esqueletos angulosos que ganha cores vibrantes sob iluminação azul.'),
('Anêmona de maré', 'Anthopleura sola', 'Cnidário', 'Actiniidae', 'Carnívoro', 'Habita poças de maré rochosas e apresenta tentáculos espessos com tonalidade esverdeada.'),
('Água viva guarda-sol', 'Rhizostoma luteum', 'Cnidário', 'Rhizostomatidae', 'Carnívoro', 'Espécie pelágica de grande porte com braços orais ramificados e ausência de tentáculos marginais.'),
('Coral pedra cérebro', 'Colpophyllia natans', 'Cnidário', 'Faviidae', 'Carnívoro', 'Forma grandes domos calcários com canais sinuosos profundos que ajudam a sustentar o recife.'),
('Anêmona estrela do mar', 'Nematostella vectensis', 'Cnidário', 'Edwardsiidae', 'Carnívoro', 'Espécie estuarina tolerante a variações de salinidade, bastante usada como organismo modelo.'),
('Água viva bolha de sabão', 'Chrysaora pacifica', 'Cnidário', 'Pelagiidae', 'Carnívoro', 'Apresenta umbrella translúcida com marcas radiais discretas e tentáculos finos e longos.'),
('Coral couve verde', 'Montipora capricornis', 'Cnidário', 'Acroporidae', 'Carnívoro', 'Cresce em placas ou espirais sobrepostas, muito comum em recifes e aquários marinhos.'),
('Anêmona flamejante', 'Epiactis prolifera', 'Cnidário', 'Actiniidae', 'Carnívoro', 'Carrega seus filhotes presos à coluna externa do corpo para proteção durante o desenvolvimento.'),
('Água viva véu de noiva', 'Olindias sambaquiensis', 'Cnidário', 'Olindiidae', 'Carnívoro', 'Hidromedusa translúcida encontrada em águas costeiras e estuarinas com tentáculos finos.'),
('Coral cérebro estrelado', 'Montastraea annularis', 'Cnidário', 'Faviidae', 'Carnívoro', 'Construtor tradicional de recifes com crescimento em colunas ou lóbulos bem definidos.'),
('Anêmona rosa', 'Actinia equina rosea', 'Cnidário', 'Actiniidae', 'Carnívoro', 'Variedade de coloração rosada intensa que se retrai quando a maré baixa e expõe a rocha.'),
('Água viva fantasma gigante', 'Stygiomedusa gigantea', 'Cnidário', 'Ulmaridae', 'Carnívoro', 'Uma das maiores medusas de águas profundas, com braços orais longos em forma de fita.'),
('Coral chifre de veado azul', 'Acropora millepora', 'Cnidário', 'Acroporidae', 'Carnívoro', 'Forma colônias ramificadas compactas que podem exibir tons azuis, verdes ou avermelhados.'),
('Anêmona dourada', 'Condylactis gigantea aurea', 'Cnidário', 'Actiniidae', 'Carnívoro', 'Apresenta tentáculos alongados de tonalidade dourada ou amarelada com pontas contrastantes.'),
('Água viva flor de lótus', 'Mastigias albipunctatus', 'Cnidário', 'Mastigiidae', 'Carnívoro', 'Possui manchas brancas características na umbrella e vive em associação com algas fotossintéticas.'),
('Coral cérebro rugoso', 'Diploria clivosa', 'Cnidário', 'Faviidae', 'Carnívoro', 'Coral incrustante ou maciço de superfície ondulada, adaptado a zonas de maior agitação da água.'),
('Anêmona tentáculo longo', 'Macrodactyla doreensis', 'Cnidário', 'Actiniidae', 'Carnívoro', 'Prefere substratos arenosos ou lodosos e estende tentáculos compridos com pontas levemente arredondadas.'),





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
('Lírio do mar gigante de fenda', 'Lamprometra palmata', 'Equinodermo', 'Mariametridae', 'Suspensívoro', 'Crinoide tropical com múltiplos braços flexíveis que formam leques filtradores.'),
('Estrela do mar lisa', 'Asterias forbesi', 'Equinodermo', 'Asteriidae', 'Carnívoro', 'Espécie muito comum na costa atlântica norte-americana, predadora de ostras e mexilhões.'),
('Estrela do mar solar', 'Crossaster papposus', 'Equinodermo', 'Solasteridae', 'Carnívoro', 'Possui cerca de oito a quatorze braços e alimenta-se inclusive de outras estrelas-do-mar.'),
('Estrela do mar espinhosa do pacífico', 'Pisaster brevispinus', 'Equinodermo', 'Asteriidae', 'Carnívoro', 'Estrela rosada de grande porte que escava na areia em busca de mariscos.'),
('Estrela do mar almofada azul', 'Pentaceraster cumingi', 'Equinodermo', 'Oreasteridae', 'Carnívoro', 'Corpo robusto com tubérculos salientes e coloração variável entre tons de vermelho, laranja e azul.'),
('Estrela do mar de cinco pontas', 'Asterina gibbosa', 'Equinodermo', 'Asterinidae', 'Detritívoro', 'Pequena estrela compacta encontrada em poças de maré e fundos rochosos rasos.'),
('Estrela do mar do antártico', 'Odontaster validus', 'Equinodermo', 'Odontasteridae', 'Detritívoro', 'Espécie abundante em águas antárticas com dieta variada incluindo detritos e algas.'),
('Estrela do mar de braços longos', 'Luidia clathrata', 'Equinodermo', 'Luidiidae', 'Carnívoro', 'Estrela esguia de fundo arenoso que engole presas inteiras como pequenos moluscos e crustáceos.'),
('Estrela do mar pente', 'Astropecten irregularis', 'Equinodermo', 'Astropectinidae', 'Carnívoro', 'Enterra-se rapidamente na areia ou lama e caça durante a noite.'),
('Estrela do mar de recife', 'Linckia multifora', 'Equinodermo', 'Ophidiasteridae', 'Carnívoro', 'Frequentemente apresenta formato assimétrico devido à regeneração a partir de braços separados.'),
('Estrela do mar pérola', 'Fromia ghardaqana', 'Equinodermo', 'Ophidiasteridae', 'Carnívoro', 'Pequena estrela tropical de coloração vibrante associada a recifes de coral.'),
('Oriço do mar vermelho gigante', 'Mesocentrotus franciscanus', 'Equinodermo', 'Strongylocentrotidae', 'Herbívoro', 'Um dos maiores ouriços do mundo, pode viver por décadas e alimenta-se de algas marinhas.'),
('Oriço do mar de espinhos longos do pacífico', 'Diadema mexicanum', 'Equinodermo', 'Diadematidae', 'Herbívoro', 'Possui espinhos finos e longos que ajudam a controlar o crescimento de macroalgas.'),
('Oriço do mar de buraco', 'Echinometra viridis', 'Equinodermo', 'Echinometridae', 'Herbívoro', 'Habita fendas e cavidades em recifes de coral rasos.'),
('Oriço do mar de botões', 'Lytechinus variegatus', 'Equinodermo', 'Toxopneustidae', 'Herbívoro', 'Comum em pradarias marinhas tropicais, costuma cobrir-se com detritos e folhas de fanerógamas.'),
('Oriço do mar de espinhos curtos', 'Strongylocentrotus pallidus', 'Equinodermo', 'Strongylocentrotidae', 'Herbívoro', 'Habita águas frias e profundas, alimentando-se de algas e matéria orgânica.'),
('Oriço do mar de coração branco', 'Brissopsis lyrifera', 'Equinodermo', 'Brissidae', 'Detritívoro', 'Vive enterrado em sedimentos lodosos e arenosos, criando canais para circulação de água.'),
('Oriço do mar de prato', 'Clypeaster rosaceus', 'Equinodermo', 'Clypeasteridae', 'Detritívoro', 'Possui carapaça espessa e ovalada com bordas arredondadas em fundos arenosos tropicais.'),
('Oriço do mar de agulha', 'Eucidaris tribuloides', 'Equinodermo', 'Cidaridae', 'Herbívoro', 'Apresenta espinhos primários grossos e rombudos onde frequentemente crescem algas e epibiontes.'),
('Pepino do mar de areia', 'Holothuria grisea', 'Equinodermo', 'Holothuriidae', 'Detritívoro', 'Comum em costas rochosas e arenosas, ingere sedimento para extrair matéria orgânica.'),
('Pepino do mar de pedra', 'Holothuria polii', 'Equinodermo', 'Holothuriidae', 'Detritívoro', 'Encontrado sob pedras e em áreas arenosas do Mediterrâneo, atua na reciclagem de sedimentos.'),
('Pepino do mar de recife', 'Holothuria leucospilota', 'Equinodermo', 'Holothuriidae', 'Detritívoro', 'Corpo escuro alongado que pode liberar fios brancos pegajosos quando perturbado.'),
('Pepino do mar de abacaxi vermelho', 'Thelenota anax', 'Equinodermo', 'Stichopodidae', 'Detritívoro', 'Espécie de grande porte em fundos arenosos próximos a recifes, importante na limpeza do substrato.'),
('Pepino do mar de vidro', 'Peniagone diaphana', 'Equinodermo', 'Elpidiidae', 'Detritívoro', 'Espécie pelágica de águas profundas com corpo translúcido e delicado.'),
('Pepino do mar de cauda', 'Molpadia oolitica', 'Equinodermo', 'Molpadiidae', 'Detritívoro', 'Vive enterrado em lamas profundas com uma região posterior afilada voltada para o sedimento.'),
('Pepino do mar de jardim', 'Stichopus herrmanni', 'Equinodermo', 'Stichopodidae', 'Detritívoro', 'Apresenta coloração amarelada ou acinzentada com pequenas manchas escuras em áreas de areia e ervas marinhas.'),
('Pepino do mar de espinhos suaves', 'Australostichopus mollis', 'Equinodermo', 'Stichopodidae', 'Detritívoro', 'Comum em águas costeiras temperadas, auxilia na aeração e revolvimento do sedimento.'),
('Ofiúro de braços trançados', 'Ophiactis savignyi', 'Equinodermo', 'Ophiactidae', 'Detritívoro', 'Pequeno ofiúro frequentemente encontrado em esponjas, algas e corais, podendo multiplicar-se por fissão.'),
('Ofiúro de disco liso', 'Ophiura albida', 'Equinodermo', 'Ophiuridae', 'Carnívoro', 'Habita fundos arenosos e lodosos, alimentando-se de pequenos invertebrados e detritos.'),
('Ofiúro de espinhos curvos', 'Ophiocomina nigra', 'Equinodermo', 'Ophiocomidae', 'Detritívoro', 'De coloração escura, pode formar agregações densas em substratos rochosos.'),
('Ofiúro de brânquias', 'Amphiura filiformis', 'Equinodermo', 'Amphiuridae', 'Suspensívoro', 'Enterra o disco no sedimento e estende braços longos na água para capturar partículas em suspensão.'),
('Ofiúro de recife estrelado', 'Ophiolepis superba', 'Equinodermo', 'Ophiolepididae', 'Detritívoro', 'Exibe padrão geométrico contrastante no disco e braços com anéis marcados.'),
('Ofiúro de águas profundas', 'Bathypterois-like Ophiuroid', 'Equinodermo', 'Ophiacanthidae', 'Carnívoro', 'Adaptação a ambientes profundos com baixa disponibilidade de alimento, capturando presas diminutas.'),
('Lírio do mar de plumas douradas', 'Himerometra robustipinna', 'Equinodermo', 'Himerometridae', 'Suspensívoro', 'Crinoide de recife que abre seus braços plumosos em forma de leque para filtrar plâncton.'),
('Lírio do mar de braços finos', 'Oxycomanthus bennetti', 'Equinodermo', 'Comasteridae', 'Suspensívoro', 'Apresenta múltiplos braços finos e delicados, sendo mais ativo durante a noite.'),
('Lírio do mar de recife escuro', 'Colobometra perspinosa', 'Equinodermo', 'Colobometridae', 'Suspensívoro', 'Fixa-se em estruturas de recife expostas a correntes moderadas para alimentar-se em suspensão.'),
('Lírio do mar de águas profundas', 'Metacrinus rotundus', 'Equinodermo', 'Issocrinidae', 'Suspensívoro', 'Crinoide pedunculado de águas mais profundas que mantém seu cálice elevado na correnteza.'),
('Bolacha da praia de cinco furos', 'Mellita quinquiesperforata', 'Equinodermo', 'Mellitidae', 'Detritívoro', 'Apresenta cinco lúnulas (fendas) na carapaça achatada que ajudam na estabilidade contra ondas e na alimentação.'),
('Bolacha da praia de seis furos', 'Leodia sexiesperforata', 'Equinodermo', 'Mellitidae', 'Detritívoro', 'Característica de praias arenosas tropicais, com seis aberturas na carapaça para passagem de areia e alimento.'),
('Bolacha da praia do pacífico', 'Encope micropora', 'Equinodermo', 'Mellitidae', 'Detritívoro', 'Carapaça achatada com entalhes ou fendas, adaptada à vida semi-enterrada em areia fina.'),





('Lagosta-azul-americana', 'Homarus americanus', 'Crustáceo', 'Nephropidae', 'Onívoro / Detritívoro', 'Pode viver mais de 50 anos e apresenta coloração azulada rara devido a mutação genética.'),
('Lagosta-europeia', 'Homarus gammarus', 'Crustáceo', 'Nephropidae', 'Onívoro / Carnívoro', 'Habita fundos rochosos do Atlântico Norte e do Mediterrâneo, saindo à noite para caçar.'),
('Lagosta-espinhosa-do-caribe', 'Panulirus argus', 'Crustáceo', 'Palinuridae', 'Onívoro / Carnívoro', 'Realiza migrações sazonais em filas organizadas no outono para águas mais profundas.'),
('Lagosta-pintada', 'Panulirus versicolor', 'Crustáceo', 'Palinuridae', 'Onívoro / Detritívoro', 'Destaca-se pelas antenas longas esbranquiçadas e faixas escuras na carapaça.'),
('Lagosta-verde', 'Panulirus laevicauda', 'Crustáceo', 'Palinuridae', 'Onívoro / Carnívoro', 'Comum no litoral brasileiro, prefere recifes rasos e áreas próximas a manguezais.'),
('Lagosta-sapateira', 'Scyllarides latus', 'Crustáceo', 'Scyllaridae', 'Carnívoro', 'Possui antenas achatadas em forma de pá no lugar das antenas longas tradicionais.'),
('Lagosta-anã', 'Scyllarus arctus', 'Crustáceo', 'Scyllaridae', 'Onívoro / Detritívoro', 'Espécie pequena do Mediterrâneo e Atlântico oriental que se camufla entre rochas e algas.'),
('Lagostim-vermelho-do-pantanal', 'Procambarus clarkii', 'Crustáceo', 'Cambaridae', 'Onívoro', 'Conhecido pela alta capacidade de adaptação a ambientes de água doce e escavação de tocas.'),
('Lagostim-azul-de-água-doce', 'Cherax destructor', 'Crustáceo', 'Parastacidae', 'Onívoro / Detritívoro', 'Originário da Austrália, tolera variações de temperatura e oxigênio em rios e lagoas.'),
('Lagostim-de-marfim', 'Cherax quadricarinatus', 'Crustáceo', 'Parastacidae', 'Onívoro', 'Machos adultos desenvolvem manchas avermelhadas na margem externa das pinças.'),
('Camarão-rosa', 'Farfantepenaeus paulensis', 'Crustáceo', 'Penaeidae', 'Onívoro / Detritívoro', 'Utiliza estuários e lagunas costeiras como berçário antes de migrar para o mar aberto.'),
('Camarão-branco', 'Litopenaeus vannamei', 'Crustáceo', 'Penaeidae', 'Onívoro / Detritívoro', 'Uma das espécies de camarão mais cultivadas no mundo pela rápida adaptação a diferentes salinidades.'),
('Camarão-sete-barbas', 'Xiphopenaeus kroyeri', 'Crustáceo', 'Penaeidae', 'Onívoro / Detritívoro', 'Recebe esse nome pelos três pares de apêndices longos e um ímpar que lembram barbas.'),
('Camarão-tigre-gigante', 'Penaeus monodon', 'Crustáceo', 'Penaeidae', 'Onívoro / Carnívoro', 'Pode ultrapassar 30 cm de comprimento e exibe listras transversais escuras e claras.'),
('Camarão-pistola-vermelho', 'Alpheus heterochaelis', 'Crustáceo', 'Alpheidae', 'Carnívoro', 'Fecha sua pinça maior em alta velocidade para criar uma bolha de cavitação com estalo forte.'),
('Camarão-palhaço', 'Gnathophyllum americanum', 'Crustáceo', 'Gnathophyllidae', 'Onívoro / Detritívoro', 'Pequeno e colorido, costuma viver associado a equinodermos em recifes tropicais.'),
('Camarão-limpador-do-pacífico', 'Lysmata amboinensis', 'Crustáceo', 'Lysmatidae', 'Parasitário / Detritívoro', 'Remove ectoparasitas e tecidos mortos de peixes em estações de limpeza nos recifes.'),
('Camarão-bailarina', 'Rhynchocinetes durbanensis', 'Crustáceo', 'Rhynchocinetidae', 'Onívoro / Detritívoro', 'Possui rostro móvel articulado e listras vermelhas e brancas marcantes.'),
('Camarão-fantasma-de-água-doce', 'Palaemonetes paludosus', 'Crustáceo', 'Palaemonidae', 'Onívoro / Detritívoro', 'Corpo quase transparente permite observar órgãos internos e o fluxo da hemolinfa.'),
('Camarão-pitu', 'Macrobrachium carcinus', 'Crustáceo', 'Palaemonidae', 'Onívoro', 'Habita rios de água doce na fase adulta e depende da água salobra para o desenvolvimento larval.'),
('Caranguejo-uçá', 'Ucides cordatus', 'Crustáceo', 'Ocypodidae', 'Detritívoro / Herbívoro', 'Escava galerias profundas nos manguezais e alimenta-se principalmente de folhas caídas.'),
('Caranguejo-aratu', 'Goniopsis cruentata', 'Crustáceo', 'Grapsidae', 'Onívoro / Herbívoro', 'Ágil e colorido, sobe em raízes e troncos de mangue para escapar de predadores.'),
('Caranguejo-violinista-de-areia', 'Uca pugilator', 'Crustáceo', 'Ocypodidae', 'Detritívoro', 'O macho agita sua pinça hipertrofiada para atrair fêmeas e defender seu território.'),
('Caranguejo-real-do-alasca', 'Paralithodes camtschaticus', 'Crustáceo', 'Lithodidae', 'Onívoro / Carnívoro', 'Apesar do nome, evoluiu de ancestrais semelhantes a ermitões e tem apenas três pares de pernas ambulatórias.'),
('Caranguejo-aranha-gigante-do-japão', 'Macrocheira kaempferi', 'Crustáceo', 'Inachidae', 'Onívoro / Carnívoro', 'Possui a maior envergadura entre os artrópodes vivos, podendo passar de 3 metros entre as pontas das pernas.'),
('Caranguejo-das-neves', 'Chionoecetes opilio', 'Crustáceo', 'Oregoniidae', 'Carnívoro / Detritívoro', 'Vive em águas frias e profundas, alimentando-se de vermes, moluscos, equinodermos e outros crustáceos.'),
('Caranguejo-azul-americano', 'Callinectes sapidus', 'Crustáceo', 'Portunidae', 'Onívoro / Carnívoro', 'O último par de pernas é achatado como remos, permitindo nadar com agilidade lateral.'),
('Caranguejo-siri-guaia', 'Menippe nodifrons', 'Crustáceo', 'Menippidae', 'Carnívoro / Onívoro', 'Usa suas pinças robustas para quebrar conchas de moluscos e carapaças duras.'),
('Caranguejo-de-coco', 'Birgus latro', 'Crustáceo', 'Coenobitidae', 'Onívoro / Herbívoro', 'Maior artrópode terrestre do mundo; respira por órgão branquial adaptado ao ar e pode subir em palmeiras.'),
('Caranguejo-ermitão-terrestre', 'Coenobita clypeatus', 'Crustáceo', 'Coenobitidae', 'Onívoro / Detritívoro', 'Protege o abdômen macio dentro de conchas vazias de gastrópodes e troca de concha conforme cresce.'),
('Ermitão-de-patas-azuis', 'Clibanarius tricolor', 'Crustáceo', 'Diogenidae', 'Herbívoro / Detritívoro', 'Muito utilizado em aquários marinhos por raspar algas de rochas e substratos.'),
('Caranguejo-ferradura-do-atlântico', 'Limulus polyphemus', 'Crustáceo', 'Limulidae', 'Carnívoro / Detritívoro', 'Embora pertença à classe Merostomata (quelicerados), é frequentemente buscado em acervos de artrópodes costeiros e tem sangue azul à base de cobre.'),
('Caranguejo-de-água-doce-europeu', 'Potamon fluviatile', 'Crustáceo', 'Potamidae', 'Onívoro', 'Habita riachos e córregos limpos da região mediterrânea, saindo à noite para forragear.'),
('Caranguejo-vermelho-da-ilha-christmas', 'Gecarcoidea natalis', 'Crustáceo', 'Gecarcinidae', 'Herbívoro / Detritívoro', 'Famoso pela migração em massa anual da floresta até o oceano para liberar ovos na água.'),
('Caranguejo-fantasma-do-atlântico', 'Ocypode quadrata', 'Crustáceo', 'Ocypodidae', 'Onívoro / Detritívoro', 'Corre rapidamente pelas praias arenosas e cava tocas inclinadas acima da linha da maré.'),
('Caranguejo-de-pedra-da-flórida', 'Menippe mercenaria', 'Crustáceo', 'Menippidae', 'Carnívoro', 'Tem pinças extremamente fortes usadas para abrir ostras e caracóis marinhos.'),
('Caranguejo-boxeador', 'Lybia tessellata', 'Crustáceo', 'Xanthidae', 'Onívoro / Carnívoro', 'Carrega uma pequena anêmona-do-mar em cada pinça para defesa e captura de alimento.'),
('Caranguejo-decorador', 'Camposcia retusa', 'Crustáceo', 'Inachidae', 'Onívoro / Herbívoro', 'Fixa algas, esponjas e hidrozoários na carapaça para se camuflar perfeitamente no fundo.'),
('Caranguejo-chines-de-garra-peluda', 'Eriocheir sinensis', 'Crustáceo', 'Varunidae', 'Onívoro', 'Possui tufos densos de cerdas nas pinças e realiza longas migrações entre água doce e salgada.'),
('Caranguejo-mangue-vermelho', 'Sesarma curacaoense', 'Crustáceo', 'Sesarmidae', 'Onívoro / Detritívoro', 'Comum em áreas de transição de manguezais, suporta oscilações de umidade e salinidade.'),
('Tamarutaca-pavão', 'Odontodactylus scyllarus', 'Crustáceo', 'Odontodactylidae', 'Carnívoro', 'Estomatópode com visão complexa e apêndices raptores capazes de desferir golpes ultrarrápidos.'),
('Tamarutaca-lança', 'Lysiosquilla maculata', 'Crustáceo', 'Lysiosquillidae', 'Carnívoro', 'Estomatópode alongado que espreita em tocas e usa apêndices espinhosos para perfurar presas.'),
('Tamarutaca-comum', 'Squilla mantis', 'Crustáceo', 'Squillidae', 'Carnívoro', 'Comum em fundos arenosos e lodosos, caça pequenos peixes, vermes e crustáceos.'),
('Craca-gigante', 'Austromegabalanus psittacus', 'Crustáceo', 'Balanidae', 'Filtrador / Suspensívoro', 'Cirripédio séssil que vive fixo a rochas ou outras conchas e filtra plâncton com os cirros.'),
('Craca-comum-de-costão', 'Balanus glandula', 'Crustáceo', 'Balanidae', 'Filtrador / Suspensívoro', 'Forma densas colônias na zona entremarés de costas rochosas.'),
('Craca-ganso', 'Lepas anatifera', 'Crustáceo', 'Lepasidae', 'Filtrador / Suspensívoro', 'Fixa-se a troncos flutuantes e destroços no mar aberto por meio de um pedúnculo flexível.'),
('Craca-parasita-de-caranguejo', 'Sacculina carcini', 'Crustáceo', 'Sacculinidae', 'Parasitário', 'Rizocefálico cuja fase adulta forma estruturas internas no hospedeiro, alterando seu comportamento.'),
('Pulga-d-água-comum', 'Daphnia pulex', 'Crustáceo', 'Daphniidae', 'Filtrador / Herbívoro', 'Cladócero de água doce importante na cadeia alimentar aquática, capaz de alternar reprodução partenogenética e sexuada.'),
('Pulga-d-água-gigante', 'Daphnia magna', 'Crustáceo', 'Daphniidae', 'Filtrador / Herbívoro', 'Amplamente utilizada em bioensaios ecotoxicológicos por sua sensibilidade a alterações na água.'),
('Copépode-calanoide-marinho', 'Calanus finmarchicus', 'Crustáceo', 'Calanidae', 'Herbívoro / Filtrador', 'Componente fundamental do zooplâncton do Atlântico Norte, rico em lipídios e base da dieta de peixes e baleias.'),
('Copépode-ciclopoide-de-água-doce', 'Cyclops strenuus', 'Crustáceo', 'Cyclopidae', 'Onívoro / Carnívoro', 'Pequeno crustáceo planctônico facilmente reconhecido pelas fêmeas carregando dois sacos de ovos.'),
('Copépode-harpacticoide', 'Tigriopus californicus', 'Crustáceo', 'Harpacticidae', 'Detritívoro / Herbívoro', 'Habita poças de maré rochosas sujeitas a grandes variações de temperatura e salinidade.'),
('Copépode-parasita-de-peixe', 'Lepeophtheirus salmonis', 'Crustáceo', 'Caligidae', 'Parasitário', 'Ectoparasita que se alimenta de muco, pele e sangue de salmonídeos marinhos.'),
('Krill-antártico', 'Euphausia superba', 'Crustáceo', 'Euphausiidae', 'Filtrador / Herbívoro', 'Eufausiáceo bioluminescente que forma imensos cardumes e sustenta baleias, pinguins e focas no Oceano Austral.'),
('Krill-do-pacífico', 'Euphausia pacifica', 'Crustáceo', 'Euphausiidae', 'Onívoro / Filtrador', 'Realiza migrações verticais diárias entre profundidades maiores e águas superficiais.'),
('Tatuzinho-de-jardim', 'Armadillidium vulgare', 'Crustáceo', 'Armadillidiidae', 'Detritívoro / Herbívoro', 'Isópode terrestre que enrola o corpo em forma de bola quando ameaçado e ajuda a decompor matéria orgânica.'),
('Tatuzinho-de-parede', 'Porcellio scaber', 'Crustáceo', 'Porcellionidae', 'Detritívoro', 'Isópode terrestre comum sob troncos, pedras e solo úmido, onde recicla nutrientes.'),
('Isópode-gigante-das-profundezas', 'Bathynomus giganteus', 'Crustáceo', 'Cirolanidae', 'Carnívoro / Necrófago', 'Vive no fundo marinho profundo e pode passar longos períodos sem alimento até encontrar carcaças que afundam.'),
('Piolho-de-baleia', 'Cyamus boopis', 'Crustáceo', 'Cyamidae', 'Parasitário / Detritívoro', 'Anfípode ciamídeo achatado dorsoventralmente que vive agarrado à pele e às cracas de baleias.'),
('Pulga-da-areia', 'Talitrus saltator', 'Crustáceo', 'Talitridae', 'Detritívoro', 'Anfípode costeiro que salta agilmente sobre a areia úmida das praias para escapar da dessecação.'),
('Anfípode-de-água-doce', 'Gammarus pulex', 'Crustáceo', 'Gammaridae', 'Detritívoro / Onívoro', 'Comum em rios e riachos oxigenados, desempenha papel relevante na fragmentação de folhas caídas.'),
('Camarão-esqueleto', 'Caprella linearis', 'Crustáceo', 'Caprellidae', 'Onívoro / Carnívoro', 'Anfípode de corpo fino e alongado que se camufla entre hidrozoários e algas imitando gravetos.'),
('Artêmia-de-salina', 'Artemia salina', 'Crustáceo', 'Artemiidae', 'Filtrador / Herbívoro', 'Branquiópode de ambientes hipersalinos cujos cistos dormentes resistem a condições extremas de seca.'),
('Camarão-girino', 'Triops cancriformis', 'Crustáceo', 'Triopsidae', 'Onívoro / Detritívoro', 'Notostráceo com carapaça em forma de escudo e cauda bifurcada; aparece em poças temporárias.'),
('Ostracode-marinho-luminoso', 'Vargula hilgendorfii', 'Crustáceo', 'Cypridinidae', 'Detritívoro / Necrófago', 'Pequeno crustáceo bivalve que emite luz azulada ao secretar luciferina e luciferase na água.'),
('Ostracode-de-água-doce', 'Cypris pubera', 'Crustáceo', 'Cyprididae', 'Herbívoro / Detritívoro', 'Encerrado em uma carapaça bivalve calcificada, habita lagoas e brejos de água doce.'),
('Caranguejo-eremita-gigante-do-pacífico', 'Pagurus armatus', 'Crustáceo', 'Paguridae', 'Onívoro / Detritívoro', 'Habita fundos arenosos e rochosos do Pacífico norte, trocando de concha à medida que cresce.'),
('Caranguejo-aranha-europeu', 'Maja squinado', 'Crustáceo', 'Majidae', 'Onívoro / Herbívoro', 'Forma grandes agregações sazonais em águas rasas antes de migrar para áreas mais fundas.'),
('Siri-azul', 'Callinectes danae', 'Crustáceo', 'Portunidae', 'Onívoro / Carnívoro', 'Frequente em baías, estuários e costas arenosas do Atlântico ocidental.'),
('Siri-cabeleira', 'Cronius ruber', 'Crustáceo', 'Portunidae', 'Carnívoro', 'Predador ativo de pequenos crustáceos, moluscos e poliquetas em ambientes costeiros.'),
('Caranguejo-de-mangue-roxo', 'Aratus pisonii', 'Crustáceo', 'Sesarmidae', 'Herbívoro / Onívoro', 'Sobe com facilidade em galhos e folhas de mangue-vermelho para se alimentar.'),
('Caranguejo-ferradura-do-pacífico', 'Tachypleus tridentatus', 'Crustáceo', 'Limulidae', 'Carnívoro / Detritívoro', 'Encontrado em costas arenosas e estuários do Indo-Pacífico, com cauda longa e rígida.'),
('Camarão-de-vidro', 'Palaemonetes argentinus', 'Crustáceo', 'Palaemonidae', 'Onívoro / Detritívoro', 'Comum em ambientes dulcícolas e estuarinos da América do Sul, formando cardumes próximos à vegetação.'),
('Lagostim-de-riacho', 'Austropotamobius pallipes', 'Crustáceo', 'Astacidae', 'Onívoro / Detritívoro', 'Indicador de boa qualidade de água em riachos europeus, sensível à poluição e a doenças fúngicas.'),
('Lagosta-de-profundidade', 'Nephrops norvegicus', 'Crustáceo', 'Nephropidae', 'Carnívoro / Detritívoro', 'Escava túneis em fundos lodosos e sai em horários específicos de luminosidade para caçar.'),
('Camarão-manteiga', 'Metapenaeus monoceros', 'Crustáceo', 'Penaeidae', 'Onívoro / Detritívoro', 'Espécie eurialina que tolera amplas faixas de salinidade em estuários e áreas costeiras.'),
('Camarão-vermelho-do-atlântico', 'Pleoticus robustus', 'Crustáceo', 'Solenoceridae', 'Onívoro / Carnívoro', 'Vive sobre fundos lodosos em águas mais profundas da plataforma continental e talude.'),
('Caranguejo-de-areia-do-pacífico', 'Emerita analoga', 'Crustáceo', 'Hippidae', 'Filtrador / Suspensívoro', 'Enterra-se de costas na areia batida pelas ondas e estende antenas plumosas para filtrar alimento.'),
('Caranguejo-toupeira-do-atlântico', 'Emerita talpoida', 'Crustáceo', 'Hippidae', 'Filtrador / Suspensívoro', 'Cava rapidamente na areia molhada das praias acompanhando o movimento das marés.'),
('Caranguejo-porcelana-anêmona', 'Neopetrolisthes maculatus', 'Crustáceo', 'Porcellanidae', 'Filtrador / Suspensívoro', 'Vive entre os tentáculos de anêmonas-do-mar sem ser picado e usa maxilípedes plumosos para filtrar.'),
('Caranguejo-porcelana-de-recife', 'Petrolisthes galathinus', 'Crustáceo', 'Porcellanidae', 'Filtrador / Detritívoro', 'Pequeno e achatado, esconde-se sob rochas, corais e esponjas na zona entremarés.'),
('Camarão-imperador', 'Zenopontonia rex', 'Crustáceo', 'Palaemonidae', 'Onívoro / Detritívoro', 'Associa-se frequentemente a pepinos-do-mar e nudibrânquios em recifes tropicais.'),
('Camarão-harlequin', 'Hymenocera picta', 'Crustáceo', 'Hymenoceridae', 'Carnívoro', 'Especializado em caçar estrelas-do-mar, usando pinças largas e foliáceas para virá-las e imobilizá-las.'),
('Caranguejo-arrozal', 'Austrothelphusa transversa', 'Crustáceo', 'Gecarcinucidae', 'Onívoro / Detritívoro', 'Sobrevive a longas secas em tocas profundas no solo de regiões áridas e semiáridas da Austrália.'),
('Caranguejo-de-água-doce-do-japão', 'Geothelphusa dehaani', 'Crustáceo', 'Potamidae', 'Onívoro', 'Espécie endêmica do Japão que realiza todo o ciclo de vida em água doce, sem fase marinha.'),
('Camarão-de-caverna-cego', 'Typhlatya pearsi', 'Crustáceo', 'Atyidae', 'Detritívoro', 'Troglóbia de cenotes e cavernas calcárias, sem pigmentação e sem olhos funcionais.'),
('Camarão-de-água-doce-caridina', 'Caridina multidentata', 'Crustáceo', 'Atyidae', 'Herbívoro / Detritívoro', 'Muito conhecido pelo consumo constante de algas filamentosas em ambientes de água doce.'),
('Caranguejo-de-patas-vermelhas', 'Hemigrapsus sanguineus', 'Crustáceo', 'Varunidae', 'Onívoro', 'Onívoro generalista que habita costas rochosas e pode formar populações densas fora de sua área nativa.'),
('Caranguejo-de-recife-de-manchas-brancas', 'Actaeodes tomentosus', 'Crustáceo', 'Xanthidae', 'Herbívoro / Onívoro', 'Coberto por finas cerdas, habita fendas e cascalho coralino em recifes rasos.'),
('Caranguejo-de-mangue-de-garra-roxa', 'Perisesarma bidens', 'Crustáceo', 'Sesarmidae', 'Herbívoro / Detritívoro', 'Alimenta-se de folhas de mangue em decomposição e ajuda na ciclagem de nutrientes do sedimento.'),
('Lagosta-de-barba', 'Linuparus trigonus', 'Crustáceo', 'Palinuridae', 'Carnívoro / Detritívoro', 'Possui cristas longitudinais marcantes na carapaça e vive em fundos arenosos e lodosos.'),
('Camarão-de-recife-de-bandas', 'Stenopus hispidus', 'Crustáceo', 'Stenopodidae', 'Onívoro / Parasitário', 'Tem corpo esbranquiçado com faixas vermelhas e antenas longas, atuando como limpador de peixes.'),
('Caranguejo-de-profundidade-de-garra-branca', 'Chaceon quinquedens', 'Crustáceo', 'Geryonidae', 'Carnívoro / Necrófago', 'Habita o talude continental em águas profundas e frias, alimentando-se de invertebrados e carcaças.'),
('Caranguejo-de-rocha-do-pacífico', 'Romaleon antennarium', 'Crustáceo', 'Cancridae', 'Carnívoro', 'Possui pinças escuras robustas e pernas pilosas adaptadas a costas rochosas e pradarias de algas.'),
('Caranguejo-de-pedra-do-atlântico', 'Cancer irroratus', 'Crustáceo', 'Cancridae', 'Carnívoro / Onívoro', 'Comum no litoral leste da América do Norte, caça mexilhões, cracas e pequenos peixes.'),
('Camarão-de-rocha-europeu', 'Palaemon elegans', 'Crustáceo', 'Palaemonidae', 'Onívoro / Detritívoro', 'Habita poças de maré e zonas de algas em costas rochosas, exibindo faixas escuras no corpo.'),
('Tamarutaca-zebrada', 'Hemisquilla californiensis', 'Crustáceo', 'Hemisquillidae', 'Carnívoro', 'Estomatópode de águas temperadas do Pacífico que usa golpes rápidos contra presas de carapaça dura.'),
('Craca-de-baleia', 'Coronula diadema', 'Crustáceo', 'Coronulidae', 'Filtrador / Suspensívoro', 'Vive incrustada na pele de baleias-jubarte, aproveitando o deslocamento do hospedeiro para filtrar alimento.'),
('Isópode-de-profundidade-esférico', 'Sphaeroma terebrans', 'Crustáceo', 'Sphaeromatidae', 'Detritívoro / Herbívoro', 'Escava galerias em raízes de mangue e madeira submersa em águas estuarinas.'),
('Camarão-de-água-doce-amazônico', 'Macrobrachium amazonicum', 'Crustáceo', 'Palaemonidae', 'Onívoro / Detritívoro', 'Amplamente distribuído em rios e várzeas da bacia amazônica e de outras bacias sul-americanas.');





UPDATE insetos 
SET foto_insetos = CASE id_insetos
        WHEN 1 THEN 'https://upload.wikimedia.org/wikipedia/commons/d/da/Oryctes_nasicornis.jpg'
        WHEN 2 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/ce/Dynastes_hercules.jpg'
        WHEN 3 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/fe/Scarabaeus_sacer.jpg'
        WHEN 4 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/60/Goliathus_goliatus.jpg'
        WHEN 5 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/b0/Megasoma_elephas.jpg'
        WHEN 6 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/39/Anomala_dubia.jpg'
        WHEN 7 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/f7/Cetonia_aurata.jpg'
        WHEN 8 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0c/Chalcosoma_atlas.jpg'
        WHEN 9 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/33/Chrysina_resplendens.jpg'
        WHEN 10 THEN 'https://upload.wikimedia.org/wikipedia/commons/d/dc/Pelidnota_punctata.jpg'
        WHEN 11 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/e5/Mormolyce_phyllodes.jpg'
        WHEN 12 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/77/Brachinus_crepitans.jpg'
        WHEN 13 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/35/Calosoma_sycophanta.jpg'
        WHEN 14 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/f2/Cicindela_campestris.jpg'
        WHEN 15 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/2f/Carabus_violaceus.jpg'
        WHEN 16 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/b0/Nebria_brevicollis.jpg'
        WHEN 17 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/cf/Cicindela_hybrida.jpg'
        WHEN 18 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/81/Calosoma_inquisitor.jpg'
        WHEN 19 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9e/Harpalus_rufipes.jpg'
        WHEN 20 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/8b/Pheropsophus_verticalis.jpg'
        WHEN 21 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/f6/Circellium_bacchus.jpg'
        WHEN 22 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/53/Pachysoma_striatum.jpg'
        WHEN 23 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/1c/Pachysoma_denticolle.jpg'
        WHEN 24 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/a0/Scarabaeus_ambiguus.jpg'
        WHEN 25 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/1b/Pachysoma_hippocrateae.jpg'
        WHEN 26 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/f6/Circellium_bacchus.jpg'
        WHEN 27 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/f5/Eucranium_arachnoides.jpg'
        WHEN 28 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/b6/Glyphoderus_sterquilinus.jpg'
        WHEN 29 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0c/Glyphoderus_monticola.jpg'
        WHEN 30 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0a/Anactus_edentulus.jpg'
        WHEN 31 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0d/Cychrus_caraboides.jpg'
        WHEN 32 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/bd/Carabus_coriaceus.jpg'
        WHEN 33 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3b/Anophthalmus_hitleri.jpg'
        WHEN 34 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/90/Anthia_thoracica.jpg'
        WHEN 35 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/8e/Carabus_rugosus.jpg'
        WHEN 36 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Scarites_buparius.jpg'
        WHEN 37 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/03/Carabus_nemoralis.jpg'
        WHEN 38 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/fb/Manticora_imperator.jpg'
        WHEN 39 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/2a/Anthia_sexguttata.jpg'
        WHEN 40 THEN 'https://upload.wikimedia.org/wikipedia/commons/d/d5/Carabus_auratus.jpg'
        WHEN 41 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/21/Hymenopus_coronatus.jpg'
        WHEN 42 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/51/Danaus_plexippus.jpg'
        WHEN 43 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9c/Apis_mellifera.jpg'
        WHEN 44 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/11/Atta_cephalotes.jpg'
        WHEN 45 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/a4/Anax_imperator.jpg'
        WHEN 46 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/ee/Coccinella_septempunctata.jpg'
        WHEN 47 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/1d/Locusta_migratoria.jpg'
        WHEN 48 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/c5/Photinus_pyralis.jpg'
        WHEN 49 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/fc/Extatosoma_tiaratum.jpg'
        WHEN 50 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/71/Lyristes_plebejus.jpg'
        WHEN 51 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/e8/Actias_luna.jpg'
        WHEN 52 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/e0/Calliphora_vicina.jpg'
        WHEN 53 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/98/Nezara_viridula.jpg'
        WHEN 54 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/90/Forficula_auricularia.jpg'
        WHEN 55 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/a8/Mantis_religiosa.jpg'
        WHEN 56 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/ee/Xylocopa_virginica.jpg'
        WHEN 57 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/cd/Ctenocephalides_felis.jpg'
        WHEN 58 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/ba/Periplaneta_americana.jpg'
        WHEN 59 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/75/Coptotermes_formosanus.jpg'
        WHEN 60 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/f5/Vespa_mandarinia.jpg'
        WHEN 61 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/fa/Phyllium_bioculatum.jpg'
        WHEN 62 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/1e/Musca_domestica.jpg'
        WHEN 63 THEN 'https://upload.wikimedia.org/wikipedia/commons/d/d0/Aedes_aegypti.jpg'
        WHEN 64 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6f/Morpho_menelaus.jpg'
        WHEN 65 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Papilio_machaon.jpg'
        WHEN 66 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/59/Acherontia_atropos.jpg'
        WHEN 67 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/e1/Bombyx_mori.jpg'
        WHEN 68 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/fd/Acheta_domesticus.jpg'
        WHEN 69 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3d/Tettigonia_viridissima.jpg'
        WHEN 70 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/43/Magicicada_septendecim.jpg'
        WHEN 71 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/b1/Cimex_lectularius.jpg'
        WHEN 72 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/22/Pediculus_humanus.jpg'
        WHEN 73 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/25/Tetragonisca_angustula.jpg'
        WHEN 74 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/f6/Bombus_terrestris.jpg'
        WHEN 75 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/35/Melipona_scutellaris.jpg'
        WHEN 76 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/71/Solenopsis_invicta.jpg'
        WHEN 77 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/cb/Paraponera_clavata.jpg'
        WHEN 78 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/e1/Linepithema_humile.jpg'
        WHEN 79 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3f/Eciton_burchellii.jpg'
        WHEN 80 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/ff/Polistes_dominula.jpg'
        WHEN 81 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/a1/Ampulex_compressa.jpg'
        WHEN 82 THEN 'https://upload.wikimedia.org/wikipedia/commons/d/d3/Pepsis_grossa.jpg'
        WHEN 83 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7d/Sympetrum_sanguineum.jpg'
        WHEN 84 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/36/Calopteryx_splendens.jpg'
        WHEN 85 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/03/Ephemera_danica.jpg'
        WHEN 86 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/10/Harmonia_axyridis.jpg'
        WHEN 87 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/ef/Chrysoperla_carnea.jpg'
        WHEN 88 THEN 'https://upload.wikimedia.org/wikipedia/commons/d/df/Myrmeleon_formicarius.jpg'
        WHEN 89 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/fa/Blattella_germanica.jpg'
        WHEN 90 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/fd/Gromphadorhina_portentosa.jpg'
        WHEN 91 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/fc/Phyllocrania_paradoxa.jpg'
        WHEN 92 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/41/Sphodromantis_lineola.jpg'
        WHEN 93 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/45/Carausius_morosus.jpg'
        WHEN 94 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/77/Schistocerca_gregaria.jpg'
        WHEN 95 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/69/Gryllotalpa_gryllotalpa.jpg'
        WHEN 96 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/51/Deinacrida_heteracantha.jpg'
        WHEN 97 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/b9/Cryptotermes_brevis.jpg'
        WHEN 98 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/1d/Drosophila_melanogaster.jpg'
        WHEN 99 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/19/Glossina_morsitans.jpg'
        WHEN 100 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/cf/Cochliomyia_hominivorax.jpg'
        WHEN 101 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/e3/Episyrphus_balteatus.jpg'
        WHEN 102 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/41/Tabanus_bovinus.jpg'
        WHEN 103 THEN 'https://upload.wikimedia.org/wikipedia/commons/d/d4/Culex_pipiens.jpg'
        WHEN 104 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/a5/Triatoma_infestans.jpg'
        WHEN 105 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5d/Dactylopius_coccus.jpg'
        WHEN 106 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/11/Myzus_persicae.jpg'
        WHEN 107 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/68/Philaenus_spumarius.jpg'
        WHEN 108 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/30/Zelus_renardii.jpg'
        WHEN 109 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/09/Lucanus_cervus.jpg'
        WHEN 110 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/f3/Tenebrio_molitor.jpg'
        WHEN 111 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3c/Sitophilus_zeamais.jpg'
        WHEN 112 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/e5/Lytta_vesicatoria.jpg'
        WHEN 113 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/bf/Pyrophorus_noctilucus.jpg'
        WHEN 114 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/eb/Titanus_giganteus.jpg'
        WHEN 115 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/97/Acrocinus_longimanus.jpg'
        WHEN 116 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/64/Dytiscus_marginalis.jpg'
        WHEN 117 THEN 'https://upload.wikimedia.org/wikipedia/commons/d/dd/Popillia_japonica.jpg'
        WHEN 118 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/be/Nicrophorus_vespilloides.jpg'
        WHEN 119 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/c0/Lepisma_saccharina.jpg'
        WHEN 120 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/a8/Frankliniella_occidentalis.jpg'
        WHEN 121 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/60/Caligo_eurilochus.jpg'
        WHEN 122 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Hermetia_illucens.jpg'
        WHEN 123 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/c1/Stomoxys_calcitrans.jpg'
        WHEN 124 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/1e/Sarcophaga_carnaria.jpg'
        WHEN 125 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/a9/Anopheles_gambiae.jpg'
        WHEN 126 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/06/Culicoides_impunctatus.jpg'
        WHEN 127 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/ee/Simulium_damnosum.jpg'
        WHEN 128 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/94/Aedes_albopictus.jpg'
        WHEN 129 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/e4/Asilus_crabroniformis.jpg'
        WHEN 130 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/46/Bombylius_major.jpg'
        WHEN 131 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/11/Tipula_paludosa.jpg'
        WHEN 132 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/f0/Heliconius_charithonia.jpg'
        WHEN 133 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/e9/Vanessa_atalanta.jpg'
        WHEN 134 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/63/Aglais_io.jpg'
        WHEN 135 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/91/Ornithoptera_alexandrae.jpg'
        WHEN 136 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/f2/Gonepteryx_rhamni.jpg'
        WHEN 137 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/c2/Pieris_brassicae.jpg'
        WHEN 138 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/a0/Kallima_inachus.jpg'
        WHEN 139 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/21/Greta_oto.jpg'
        WHEN 140 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/c3/Diaethria_clymena.jpg'
        WHEN 141 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/c5/Attacus_atlas.jpg'
        WHEN 142 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/f8/Macroglossum_stellatarum.jpg'
        WHEN 143 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Manduca_sexta.jpg'
        WHEN 144 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/81/Lymantria_dispar.jpg'
        WHEN 145 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9a/Argema_mittrei.jpg'
        WHEN 146 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/ad/Tineola_bisselliella.jpg'
        WHEN 147 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/76/Plutella_xylostella.jpg'
        WHEN 148 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/44/Spodoptera_frugiperda.jpg'
        WHEN 149 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5e/Galleria_mellonella.jpg'
        WHEN 150 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/2b/Cydia_pomonella.jpg'
        WHEN 151 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/18/Trigona_spinipes.jpg'
        WHEN 152 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/a8/Eulaema_nigrita.jpg'
        WHEN 153 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/af/Megachile_rotundata.jpg'
        WHEN 154 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/32/Osmia_bicornis.jpg'
        WHEN 155 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/38/Augochlora_pura.jpg'
        WHEN 156 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/ce/Nomada_flava.jpg'
        WHEN 157 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/c6/Camponotus_pennsylvanicus.jpg'
        WHEN 158 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/eb/Oecophylla_smaragdina.jpg'
        WHEN 159 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/bd/Anoplolepis_gracilipes.jpg'
        WHEN 160 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/18/Myrmecocystus_mexicanus.jpg'
        WHEN 161 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/c0/Monomorium_pharaonis.jpg'
        WHEN 162 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/a8/Atta_sexdens.jpg'
        WHEN 163 THEN 'https://upload.wikimedia.org/wikipedia/commons/d/da/Myrmecia_gulosa.jpg'
        WHEN 164 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/be/Formica_rufa.jpg'
        WHEN 165 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/81/Mystrium_camillae.jpg'
        WHEN 166 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/cb/Polybia_paulista.jpg'
        WHEN 167 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9a/Vespa_crabro.jpg'
        WHEN 168 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/f2/Blastophaga_psenes.jpg'
        WHEN 169 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/84/Cotesia_glomerata.jpg'
        WHEN 170 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/66/Sirex_noctilio.jpg'
        WHEN 171 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/f5/Megarhyssa_atrata.jpg'
        WHEN 172 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/98/Pantala_flavescens.jpg'
        WHEN 173 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7b/Aeshna_cyanea.jpg'
        WHEN 174 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3c/Ischnura_elegans.jpg'
        WHEN 175 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Megaloprepus_caerulatus.jpg'
        WHEN 176 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/96/Perla_bipunctata.jpg'
        WHEN 177 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/71/Limnephilus_rhombicus.jpg'
        WHEN 178 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/2d/Panorpa_communis.jpg'
        WHEN 179 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/81/Xenopsylla_cheopis.jpg'
        WHEN 180 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6d/Pthirus_pubis.jpg'
        WHEN 181 THEN 'https://upload.wikimedia.org/wikipedia/commons/d/d2/Empusa_pennata.jpg'
        WHEN 182 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/ed/Creobroter_gemmatus.jpg'
        WHEN 183 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/1b/Deroplatys_dessicata.jpg'
        WHEN 184 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/af/Phobaeticus_chani.jpg'
        WHEN 185 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/e9/Phyllium_giganteum.jpg'
        WHEN 186 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/b0/Gryllus_campestris.jpg'
        WHEN 187 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/48/Romalea_microptera.jpg'
        WHEN 188 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/56/Tropidacris_collaris.jpg'
        WHEN 189 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/8c/Pterophylla_camellifolia.jpg'
        WHEN 190 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7d/Nasutitermes_corniger.jpg'
        WHEN 191 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/27/Macrotermes_bellicosus.jpg'
        WHEN 192 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/bb/Cornitermes_cumulans.jpg'
        WHEN 193 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/39/Periplaneta_australasiae.jpg'
        WHEN 194 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/53/Lethocerus_indicus.jpg'
        WHEN 195 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/56/Halyomorpha_halys.jpg'
        WHEN 196 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/53/Notonecta_glauca.jpg'
        WHEN 197 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/15/Gerris_lacustris.jpg'
        WHEN 198 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/54/Nepa_cinerea.jpg'
        WHEN 199 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/af/Pyrrhocoris_apterus.jpg'
        WHEN 200 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/62/Leptoglossus_occidentalis.jpg'
        WHEN 201 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/66/Fulgora_laternaria.jpg'
        WHEN 202 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/e6/Umbonia_spinosa.jpg'
        WHEN 203 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9b/Cicada_orni.jpg'
        WHEN 204 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0c/Anthrenus_verbasci.jpg'
        WHEN 205 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/2b/Lampyris_noctiluca.jpg'
        WHEN 206 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/c6/Cerambyx_cerdo.jpg'
        WHEN 207 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/bf/Dermestes_lardarius.jpg'
        WHEN 208 THEN 'https://upload.wikimedia.org/wikipedia/commons/d/da/Tribolium_castaneum.jpg'
        WHEN 209 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/e1/Rhynchophorus_ferrugineus.jpg'
        WHEN 210 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/61/Anthonomus_grandis.jpg'
        WHEN 211 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/af/Leptinotarsa_decemlineata.jpg'
        WHEN 212 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6a/Diabrotica_speciosa.jpg'
        WHEN 213 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/46/Meloe_proscarabaeus.jpg'
        WHEN 214 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Paederus_fuscipes.jpg'
        WHEN 215 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/a9/Ocypus_olens.jpg'
        WHEN 216 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/aa/Agrilus_planipennis.jpg'
        WHEN 217 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/fb/Sternocera_aequisignata.jpg'
        WHEN 218 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/fe/Eupholus_magnificus.jpg'
        WHEN 219 THEN 'https://upload.wikimedia.org/wikipedia/commons/d/d2/Hydrophilus_piceus.jpg'
        WHEN 220 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/b3/Gyrinus_natator.jpg'
        WHEN 221 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5b/Macrodontia_cervicornis.jpg'
        WHEN 222 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/b7/Mantispa_styriaca.jpg'
        WHEN 223 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/f7/Labidura_riparia.jpg'
        WHEN 224 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/e0/Thermobia_domestica.jpg'
        WHEN 225 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7f/Adalia_bipunctata.jpg'
        WHEN 226 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/1b/Psyllobora_vigintiduopunctata.jpg'
        WHEN 227 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/48/Geotrupes_stercorarius.jpg'
        WHEN 228 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6a/Xestobium_rufovillosum.jpg'
        WHEN 229 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7d/Acanthoscelides_obtectus.jpg'
        WHEN 230 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/30/Sitophilus_oryzae.jpg'
        WHEN 231 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/ba/Lasioderma_serricorne.jpg'
        WHEN 232 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/23/Goliathus_regius.jpg'
        WHEN 233 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/e6/Dynastes_neptunus.jpg'
        WHEN 234 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/65/Strategus_aloeus.jpg'
        WHEN 235 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5a/Onthophagus_taurus.jpg'
        WHEN 236 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6e/Phanaeus_vindex.jpg'
        WHEN 237 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/e3/Dendroctonus_ponderosae.jpg'
        WHEN 238 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/79/Ips_typographus.jpg'
        WHEN 239 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/cb/Hypothenemus_hampei.jpg'
        WHEN 240 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0e/Leucoptera_coffeella.jpg'
        WHEN 241 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/2d/Alphitobius_diaperinus.jpg'
        WHEN 242 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/87/Pyrearinus_termitilluminans.jpg'
        WHEN 243 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5d/Alaus_oculatus.jpg'
        WHEN 244 THEN 'https://upload.wikimedia.org/wikipedia/commons/d/df/Trypoxylus_dichotomus.jpg'
        WHEN 245 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6e/Phoracantha_semipunctata.jpg'
        WHEN 246 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/72/Charidotella_sexpunctata.jpg'
        WHEN 247 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/1e/Thanasimus_formicarius.jpg'
        WHEN 248 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/72/Photinus_carolinus.jpg'
        WHEN 249 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/b6/Odontotaenius_disjunctus.jpg'
        WHEN 250 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/8c/Grammostola_rosea.jpg'
        WHEN 251 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/8d/Theraphosa_blondi.jpg'
        WHEN 252 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/eb/Brachypelma_smithi.jpg'
        WHEN 253 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/f1/Latrodectus_mactans.jpg'
        WHEN 254 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/ea/Loxosceles_reclusa.jpg'
        WHEN 255 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/99/Phoneutria_nigriventer.jpg'
        WHEN 256 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5a/Salticus_scenicus.jpg'
        WHEN 257 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7a/Dolomedes_tenebrosus.jpg'
        WHEN 258 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/fd/Lycosa_tarantula.jpg'
        WHEN 259 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/15/Misumena_vatia.jpg'
        WHEN 260 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/24/Tityus_serrulatus.jpg'
        WHEN 261 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/f4/Pandinus_imperator.jpg'
        WHEN 262 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/42/Tityus_bahiensis.jpg'
        WHEN 263 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/ce/Leiurus_quinquestriatus.jpg'
        WHEN 264 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/85/Hadrurus_arizonensis.jpg'
        WHEN 265 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/fc/Amblyomma_cajennense.jpg'
        WHEN 266 THEN 'https://upload.wikimedia.org/wikipedia/commons/d/d4/Rhipicephalus_microplus.jpg'
        WHEN 267 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/f2/Dermatophagoides_pteronyssinus.jpg'
        WHEN 268 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/12/Sarcoptes_scabiei.jpg'
        WHEN 269 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/1c/Trombidium_holosericeum.jpg'
        WHEN 270 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/fc/Phalangium_opilio.jpg'
        WHEN 271 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/a1/Acanthopachylus_aculeatus.jpg'
        WHEN 272 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/94/Gongylobelus.jpg'
        WHEN 273 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/71/Vonones_sayi.jpg'
        WHEN 274 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/1e/Acanthophrynus_coronatus.jpg'
        WHEN 275 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0b/Phrynus_marginemaculatus.jpg'
        WHEN 276 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9b/Galeodes_arabs.jpg'
        WHEN 277 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/63/Mastigoproctus_giganteus.jpg'
        WHEN 278 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9f/Atrax_robustus.jpg'
        WHEN 279 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/b2/Cyriopagopus_lividus.jpg'
        WHEN 280 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/60/Poecilotheria_metallica.jpg'
        WHEN 281 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/f7/Gasteracantha_cancriformis.jpg'
        WHEN 282 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/aa/Argiope_aurantia.jpg'
        WHEN 283 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/70/Pelinobius_muticus.jpg'
        WHEN 284 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/07/Androctonus_australis.jpg'
        WHEN 285 THEN 'https://upload.wikimedia.org/wikipedia/commons/d/d8/Centruroides_sculpturatus.jpg'
        WHEN 286 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/2d/Chelifer_cancroides.jpg'
        WHEN 287 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Eukoenenia_mirabilis.jpg'
        WHEN 288 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/47/Ixodes_scapularis.jpg'
        WHEN 289 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/37/Tetranychus_urticae.jpg'
        WHEN 290 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/a8/Ricinoides_atewa.jpg'
        WHEN 291 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/bf/Eremobates_pallipes.jpg'
        WHEN 292 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0d/Dysdera_crocata.jpg'
        WHEN 293 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/74/Scytodes_thoracica.jpg'
        WHEN 294 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/47/Poecilotheria_tigrinawesseli.jpg'
        WHEN 295 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/b9/Centruroides_vittatus.jpg'
        WHEN 296 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3f/Grammostola_pulchra.jpg'
        WHEN 297 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/1e/Ephebopus_murinus.jpg'
        WHEN 298 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/80/Acanthoscurria_geniculata.jpg'
        WHEN 299 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/08/Leiobunum_rotundum.jpg'
        WHEN 300 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/8d/Demodex_folliculorum.jpg'
        WHEN 301 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7a/Argas_persicus.jpg'
        WHEN 302 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/ba/Trogulus_tricarinatus.jpg'
        WHEN 303 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6e/Argyroneta_aquatica.jpg'
        WHEN 304 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/2f/Peucetia_viridans.jpg'
        WHEN 305 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/50/Heteropoda_venatoria.jpg'
        WHEN 306 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/53/Deinopis_subrufa.jpg'
        WHEN 307 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/f3/Typhlochactas_mitchelli.jpg'
        WHEN 308 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/fa/Charinus_cavernicolus.jpg'
        WHEN 309 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/15/Solpuga_venosa.jpg'
        WHEN 310 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/34/Eresus_sandaliatus.jpg'
        WHEN 311 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/89/Tityus_stigmurus.jpg'
        WHEN 312 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/45/Tityus_costatus.jpg'
        WHEN 313 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/66/Parabuthus_transvaalicus.jpg'
        WHEN 314 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/68/Hadogenes_troglodytes.jpg'
        WHEN 315 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Heterometrus_spinifer.jpg'
        WHEN 316 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/f6/Hadrurus_spadix.jpg'
        WHEN 317 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/f6/Centruroides_exilicauda.jpg'
        WHEN 318 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/97/Centruroides_limpidus.jpg'
        WHEN 319 THEN 'https://upload.wikimedia.org/wikipedia/commons/d/d1/Hottentotta_tamulus.jpg'
        WHEN 320 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/c5/Opistophthalmus_carinatus.jpg'
        WHEN 321 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/81/Rhipicephalus_sanguineus.jpg'
        WHEN 322 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/54/Dermacentor_nitens.jpg'
        WHEN 323 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/fe/Argas_reflexus.jpg'
        WHEN 324 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/91/Amblyomma_dissimile.jpg'
        WHEN 325 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/46/Amblyomma_rotundatum.jpg'
        WHEN 326 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/ea/Acarus_siro.jpg'
        WHEN 327 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/45/Varroa_destructor.jpg'
        WHEN 328 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/65/Oribatida.jpg'
        WHEN 329 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/cc/Phytoseiulus_persimilis.jpg'
        WHEN 330 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/01/Dermanyssus_gallinae.jpg'
        WHEN 331 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/29/Phalangodidae.jpg'
        WHEN 332 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/73/Opiliones.jpg'
        WHEN 333 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/02/Dicranopalpus_ramosus.jpg'
        WHEN 334 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Hydrozetes_lacustris.jpg'
        WHEN 335 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/62/Discocyrtus.jpg'
        WHEN 336 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/8b/Charinus_brasilianus.jpg'
        WHEN 337 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/37/Sarax.jpg'
        WHEN 338 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/2c/Schizomus.jpg'
        WHEN 339 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/eb/Mastigoproctus_baracoensis.jpg'
        WHEN 340 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/fb/Galeodes_granti.jpg'
        WHEN 341 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/11/Eremobates_durangonus.jpg'
        WHEN 342 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/02/Lamprochernes_nodosus.jpg'
        WHEN 343 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/98/Garypus_californicus.jpg'
        WHEN 344 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/ad/Chthonius_ischnocheles.jpg'
        WHEN 345 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/16/Koenenia.jpg'
        WHEN 346 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/a8/Cryptocellus.jpg'
        WHEN 347 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6b/Pterinopelma_sazimai.jpg'
        WHEN 348 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/a7/Acanthoscurria_brocklehursti.jpg'
        WHEN 349 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/bb/Lasiodora_klugi.jpg'
        WHEN 350 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9b/Vitalius_wacketi.jpg'
        WHEN 351 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/c1/Brachypelma_auratum.jpg'
        WHEN 352 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/91/Brachypelma_emilia.jpg'
        WHEN 353 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9f/Aphonopelma_moderatum.jpg'
        WHEN 354 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/21/Aphonopelma_chalcodes.jpg'
        WHEN 355 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/80/Ceratogyrus_brachycephalus.jpg'
        WHEN 356 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/be/Poecilotheria_formosa.jpg'
        WHEN 357 THEN 'https://upload.wikimedia.org/wikipedia/commons/d/d5/Poecilotheria_ornata.jpg'
        WHEN 358 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/70/Pelinobius_muticus.jpg'
        WHEN 359 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/b2/Cyriopagopus_lividus.jpg'
        WHEN 360 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/4d/Brachypelma_vagans.jpg'
        WHEN 361 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/8d/Trichonephila_edulis.jpg'
        WHEN 362 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/14/Trichonephila_pilipes.jpg'
        WHEN 363 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/c3/Argiope_trifasciata.jpg'
        WHEN 364 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/2c/Mastophora_cornigera.jpg'
        WHEN 365 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/11/Micrathena_sagittata.jpg'
        WHEN 366 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/47/Neoscona_crucifera.jpg'
        WHEN 367 THEN 'https://upload.wikimedia.org/wikipedia/commons/d/d5/Neriene_radiata.jpg'
        WHEN 368 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6c/Phonognatha_graeffei.jpg'
        WHEN 369 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9e/Menemerus_bivittatus.jpg'
        WHEN 370 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/e9/Plexippus_paykulli.jpg'
        WHEN 371 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/88/Mopsus_mormon.jpg'
        WHEN 372 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5a/Synemosyna_formica.jpg'
        WHEN 373 THEN 'https://upload.wikimedia.org/wikipedia/commons/d/d3/Hasarius_adansoni.jpg'
        WHEN 374 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/56/Hogna_carolinensis.jpg'
        WHEN 375 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/ee/Arctosa_perita.jpg'
        WHEN 376 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/af/Trochosa_ruricola.jpg'
        WHEN 377 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/04/Selenops_radiatus.jpg'
        WHEN 378 THEN 'https://upload.wikimedia.org/wikipedia/commons/d/df/Sparassidae.jpg'
        WHEN 379 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/c6/Misumenoides_formosipes.jpg'
        WHEN 380 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/bb/Ozyptila_praticola.jpg'
        WHEN 381 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/93/Bothriocyrtum_californicum.jpg'
        WHEN 382 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/96/Actinopus.jpg'
        WHEN 383 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/95/Physocyclus_globosus.jpg'
        WHEN 384 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7d/Scytodes_fusca.jpg'
        WHEN 385 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/e5/Cheiracanthium_punctorium.jpg'
        WHEN 386 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Segestria_florentina.jpg'
        WHEN 387 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/b6/Hippasa_holmerae.jpg'
        WHEN 388 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/8e/Ancylometes_rufus.jpg'
        WHEN 389 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6b/Dolomedes_scriptus.jpg'
        WHEN 390 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/91/Arctosa_littoralis.jpg'
        WHEN 391 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9b/Kukulcania_hibernalis.jpg'
        WHEN 392 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/79/Parasteatoda_tepidariorum.jpg'
        WHEN 393 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/05/Latrodectus_hasselti.jpg'
        WHEN 394 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/62/Latrodectus_geometricus.jpg'
        WHEN 395 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/17/Loxosceles_rufescens.jpg'
        WHEN 396 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/30/Phoneutria_fera.jpg'
        WHEN 397 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/11/Phoneutria_keyserlingi.jpg'
        WHEN 398 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/53/Deinopis_longipes.jpg'
        WHEN 399 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/42/Atrax_sydneyensis.jpg'
        WHEN 400 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/b2/Cyclosa_conica.jpg'
        WHEN 401 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/52/Eriophora_fuliginea.jpg'
        WHEN 402 THEN 'https://upload.wikimedia.org/wikipedia/commons/d/dd/Habronattus_coecatus.jpg'
        WHEN 403 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/60/Lyssomanes_viridis.jpg'
        WHEN 404 THEN 'https://upload.wikimedia.org/wikipedia/commons/d/dd/Alopecosa_pulverulenta.jpg'
        WHEN 405 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/ed/Diaea_dorsata.jpg'
        WHEN 406 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0b/Cheiracanthium_mildei.jpg'
        WHEN 407 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/b9/Agelenopsis_naevia.jpg'
        WHEN 408 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/8c/Tegenaria_domestica.jpg'
        WHEN 409 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/88/Cyclocosmia_truncata.jpg'
        WHEN 410 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/99/Trichonephila_senegalensis.jpg'
        WHEN 411 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/90/Lasiodora_cristata.jpg'
        WHEN 412 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/ba/Lasiodora_difficilis.jpg'
        WHEN 413 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/13/Vitalius_sorocabae.jpg'
        WHEN 414 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/39/Grammostola_actaeon.jpg'
        WHEN 415 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/00/Lasiodora_parahybana.jpg'
        WHEN 416 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7d/Chromatopelma_cyaneopubescens.jpg'
        WHEN 417 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/c1/Brachypelma_auratum.jpg'
        WHEN 418 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/01/Aphonopelma_anax.jpg'
        WHEN 419 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/21/Aphonopelma_chalcodes.jpg'
        WHEN 420 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/a4/Ceratogyrus_marshalli.jpg'
        WHEN 421 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/60/Poecilotheria_metallica.jpg'
        WHEN 422 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/55/Poecilotheria_vittata.jpg'
        WHEN 423 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/52/Poecilotheria_rufilata.jpg'
        WHEN 424 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/88/Ceratogyrus_darlingi.jpg'
        WHEN 425 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/cd/Pterinochilus_chordatus.jpg'
        WHEN 426 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6b/Pterinopelma_sazimai.jpg'
        WHEN 427 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/20/Poecilotheria_miranda.jpg'
        WHEN 428 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/29/Aphonopelma_hentzi.jpg'
        WHEN 429 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/b3/Brachypelma_albiceps.jpg'
        WHEN 430 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/45/Aphonopelma_iodius.jpg'
        WHEN 431 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/05/Latrodectus_hasselti.jpg'
        WHEN 432 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/f1/Latrodectus_mactans.jpg'
        WHEN 433 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/bb/Latrodectus_hesperus.jpg'
        WHEN 434 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/62/Latrodectus_geometricus.jpg'
        WHEN 435 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/a8/Latrodectus_bishopi.jpg'
        WHEN 436 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/4a/Steatoda_nobilis.jpg'
        WHEN 437 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/af/Steatoda_triangulosa.jpg'
        WHEN 438 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0c/Loxosceles_intermedia.jpg'
        WHEN 439 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/00/Loxosceles_laeta.jpg'
        WHEN 440 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/ea/Loxosceles_reclusa.jpg'
        WHEN 441 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7e/Sicarius_terrosus.jpg'
        WHEN 442 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/99/Phoneutria_nigriventer.jpg'
        WHEN 443 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/30/Phoneutria_fera.jpg'
        WHEN 444 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/11/Phoneutria_keyserlingi.jpg'
        WHEN 445 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5a/Salticus_scenicus.jpg'
        WHEN 446 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/4f/Phidippus_regius.jpg'
        WHEN 447 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/22/Phidippus_audax.jpg'
        WHEN 448 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/eb/Maratus_speciosus.jpg'
        WHEN 449 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/81/Myrmarachne_plataleoides.jpg'
        WHEN 450 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/60/Lyssomanes_viridis.jpg'
        WHEN 451 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0d/Lycosa_singoriensis.jpg'
        WHEN 452 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/21/Rabidosa_rabida.jpg'
        WHEN 453 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/ee/Arctosa_perita.jpg'
        WHEN 454 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/39/Trochosa_terricola.jpg'
        WHEN 455 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/54/Dolomedes_vittatus.jpg'
        WHEN 456 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7a/Dolomedes_tenebrosus.jpg'
        WHEN 457 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/15/Misumena_vatia.jpg'
        WHEN 458 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/c6/Misumenoides_formosipes.jpg'
        WHEN 459 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/49/Xysticus_ferrugineus.jpg'
        WHEN 460 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/e6/Trichonephila_clavipes.jpg'
        WHEN 461 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/14/Trichonephila_pilipes.jpg'
        WHEN 462 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7d/Araneus_diadematus.jpg'
        WHEN 463 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/e5/Argiope_argentata.jpg'
        WHEN 464 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/aa/Argiope_aurantia.jpg'
        WHEN 465 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/f7/Gasteracantha_cancriformis.jpg'
        WHEN 466 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/11/Micrathena_sagittata.jpg'
        WHEN 467 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/c0/Mastophora_hutchinsoni.jpg'
        WHEN 468 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/53/Deinopis_subrufa.jpg'
        WHEN 469 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/42/Heteropoda_maxima.jpg'
        WHEN 470 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/50/Heteropoda_venatoria.jpg'
        WHEN 471 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/f3/Beregama_aurea.jpg'
        WHEN 472 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/93/Bothriocyrtum_californicum.jpg'
        WHEN 473 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/21/Ummidia_audouini.jpg'
        WHEN 474 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9f/Atrax_robustus.jpg'
        WHEN 475 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/48/Hadronyche_cerberea.jpg'
        WHEN 476 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/72/Missulena_bradleyi.jpg'
        WHEN 477 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/19/Actinopus_crassipes.jpg'
        WHEN 478 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Anelosimus_eximius.jpg'
        WHEN 479 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/72/Uloborus_plumipes.jpg'
        WHEN 480 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/62/Mimetus_puritanus.jpg'
        WHEN 481 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/75/Cheiracanthium_inclusum.jpg'
        WHEN 482 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/40/Pholcus_phalangioides.jpg'
        WHEN 483 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/95/Physocyclus_globosus.jpg'
        WHEN 484 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/74/Scytodes_thoracica.jpg'
        WHEN 485 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0d/Dysdera_crocata.jpg'
        WHEN 486 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Segestria_florentina.jpg'
        WHEN 487 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9b/Kukulcania_hibernalis.jpg'
        WHEN 488 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/34/Eresus_sandaliatus.jpg'
        WHEN 489 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/24/Tityus_serrulatus.jpg'
        WHEN 490 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/42/Tityus_bahiensis.jpg'
        WHEN 491 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/89/Tityus_stigmurus.jpg'
        WHEN 492 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/f4/Pandinus_imperator.jpg'
        WHEN 493 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Heterometrus_spinifer.jpg'
        WHEN 494 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/ce/Leiurus_quinquestriatus.jpg'
        WHEN 495 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/07/Androctonus_australis.jpg'
        WHEN 496 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/85/Hadrurus_arizonensis.jpg'
        WHEN 497 THEN 'https://upload.wikimedia.org/wikipedia/commons/d/d8/Centruroides_sculpturatus.jpg'
        WHEN 498 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/ce/Latrodectus.jpg'
        WHEN 499 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/ce/Latrodectus.jpg'
        WHEN 500 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3b/Cornu_aspersum.jpg'
        WHEN 501 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/09/Lissachatina_fulica.jpg'
        WHEN 502 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/77/Octopus_vulgaris.jpg'
        WHEN 503 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/02/Mesonychoteuthis_hamiltoni.jpg'
        WHEN 504 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/8d/Architeuthis_dux.jpg'
        WHEN 505 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/10/Crassostrea_gigas.jpg'
        WHEN 506 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/ae/Limnoperna_fortunei.jpg'
        WHEN 507 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/73/Nautilus_pompilius.jpg'
        WHEN 508 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/27/Sepia_officinalis.jpg'
        WHEN 509 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9b/Hapalochlaena_maculosa.jpg'
        WHEN 510 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/49/Thaumoctopus_mimicus.jpg'
        WHEN 511 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3a/Grimpoteuthis.jpg'
        WHEN 512 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/fb/Glaucus_atlanticus.jpg'
        WHEN 513 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/76/Hexabranchus_sanguineus.jpg'
        WHEN 514 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/c1/Limax_maximus.jpg'
        WHEN 515 THEN 'https://upload.wikimedia.org/wikipedia/commons/d/de/Conus_geographus.jpg'
        WHEN 516 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/64/Vampyroteuthis_infernalis.jpg'
        WHEN 517 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/e6/Mytilus_edulis.jpg'
        WHEN 518 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/c1/Pecten_maximus.jpg'
        WHEN 519 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/41/Pinctada_margaritifera.jpg'
        WHEN 520 THEN 'https://upload.wikimedia.org/wikipedia/commons/d/df/Cerastoderma_edule.jpg'
        WHEN 521 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/88/Charonia_tritonis.jpg'
        WHEN 522 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/24/Amphioctopus_marginatus.jpg'
        WHEN 523 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/02/Megalobulimus_ovatus.jpg'
        WHEN 524 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/ef/Pomacea_maculata.jpg'
        WHEN 525 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0f/Costasiella_kuroshimae.jpg'
        WHEN 526 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/51/Todarodes_pacificus.jpg'
        WHEN 527 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0e/Metasepia_pfefferi.jpg'
        WHEN 528 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/49/Bulla_striata_01.JPG'
        WHEN 529 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/4c/Neritina_natalensis.jpg'
        WHEN 530 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/a1/Argonauta_argo_Merculiano.jpg'
        WHEN 531 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/13/Pu_-_Cranchia_scabra_-_2.jpg'
        WHEN 532 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/15/Chiton_tuberculatus.jpg'
        WHEN 533 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/cd/Thecacera_pacifica.jpg'
        WHEN 534 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/11/Giant_clam_or_Tridacna_gigas.jpg'
        WHEN 535 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/32/Ensis_directus.jpg'
        WHEN 536 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/b5/Banana_Slug-1.jpg'
        WHEN 537 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/97/Anentome_helena.jpg'
        WHEN 538 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3a/Crassostrea_rhizophorae.jpg'
        WHEN 539 THEN 'https://upload.wikimedia.org/wikipedia/commons/d/d4/Platymma_tweediei.jpg'
        WHEN 540 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/23/Octopus_wolfi.jpg'
        WHEN 541 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/77/Watasenia_scintillans.jpg'
        WHEN 542 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/03/Aporrhais_pes_pelecani.jpg'
        WHEN 543 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/e1/Polinices_tumidus.jpg'
        WHEN 544 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/31/Elysia_crispata_1.jpg'
        WHEN 545 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/68/Antalis_vulgaris.jpg'
        WHEN 546 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/22/Tremoctopus_violaceus.jpg'
        WHEN 547 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/4e/Sepia_pharaonis.jpg'
        WHEN 548 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/99/Otala_lactea.jpg'
        WHEN 549 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/12/Spondylus_americanus.jpg'
        WHEN 550 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/92/Dosidicus_gigas.jpg'
        WHEN 551 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/10/Nassarius.jpg'
        WHEN 552 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/ca/Cypraea_tigris.jpg'
        WHEN 553 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/a0/Vulcanoctopus_hydrothermalis.jpg'
        WHEN 554 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/e0/Dreissena_polymorpha.jpg'
        WHEN 555 THEN 'https://upload.wikimedia.org/wikipedia/commons/d/de/Deroceras_reticulatum.JPG'
        WHEN 556 THEN 'https://upload.wikimedia.org/wikipedia/commons/d/d0/Chromodoris_quadricolor.jpg'
        WHEN 557 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5e/Liguus_fasciatus.jpg'
        WHEN 558 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5b/Teredo_navalis.jpg'
        WHEN 559 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/78/Clione_limacina_by_NOAA.jpg'
        WHEN 560 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/53/Physa_acuta_001.JPG'
        WHEN 561 THEN 'https://upload.wikimedia.org/wikipedia/commons/d/d0/Malleus_malleus.jpg'
        WHEN 562 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/94/Tonna_galea.jpg'
        WHEN 563 THEN 'https://upload.wikimedia.org/wikipedia/commons/b/b5/Haliphron_atlanticus.jpg'
        WHEN 564 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/1b/Spirula_spirula.jpg'
        WHEN 565 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/63/Perna_viridis.jpg'
        WHEN 566 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/cb/Crassostrea_virginica.jpg'
        WHEN 567 THEN 'https://upload.wikimedia.org/wikipedia/commons/d/df/Cepaea_nemoralis.jpg'
        WHEN 568 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/31/Peltodoris_nobilis.jpg'
        WHEN 569 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/c6/Idiosepius_paradoxus.jpg'
        WHEN 570 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/4d/Fusinus_colus.jpg'
        WHEN 571 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/a2/Lima_lima.jpg'
        WHEN 572 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/61/Melanoides_tuberculata.jpg'
        WHEN 573 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/17/Callistoctopus_macropus.jpg'
        WHEN 574 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/62/Thysanoteuthis_rhombus.jpg'
        WHEN 575 THEN 'https://upload.wikimedia.org/wikipedia/commons/d/d4/Harpa_major.jpg'
        WHEN 576 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0b/Spondylus_princeps.jpg'
        WHEN 577 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/f5/Nudibranch_chromodorididae.jpg'
        WHEN 578 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/58/Cassis_cornuta.jpg'
        WHEN 579 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0d/Corculum_cardissa.jpg'
        WHEN 580 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/16/Euprymna_scolopes.jpg'
        WHEN 581 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/28/Turbo_setosus.jpg'
        WHEN 582 THEN 'https://upload.wikimedia.org/wikipedia/commons/c/ce/Anodonta_cygnea.jpg'
        WHEN 583 THEN 'https://upload.wikimedia.org/wikipedia/commons/d/d4/Chromodoris_annae.jpg'
        WHEN 584 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/8c/Lambis_lambis.jpg'
        WHEN 585 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/a8/Octopus_briareus.jpg'
        WHEN 586 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/57/Bankia_gouldi.jpg'
        WHEN 587 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/a2/Pomacea_diffusa.jpg'
        WHEN 588 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/79/Sepioteuthis_sepioidea.jpg'
        WHEN 589 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Ruditapes_philippinarum.jpg'
        WHEN 590 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/37/Flabellinopsis_iodinea.jpg'
        WHEN 591 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/1a/Conus_marmoreus.jpg'
        WHEN 592 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9c/Anadara_granosa.jpg'
        WHEN 593 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/f0/Charonia_variegata.jpg'
        WHEN 594 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/36/Benthoctopus.jpg'
        WHEN 595 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/69/Sepioteuthis_lessoniana.jpg'
        WHEN 596 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/51/Thaumastus.jpg'
        WHEN 597 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9e/Ostreidae_shell.jpg'
        WHEN 598 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/85/Arion_vulgaris.jpg'
        WHEN 599 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/ef/Nerita_peloronta.jpg'
        WHEN 600 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/e8/Busycon_carica.jpg'
    ELSE foto_insetos
END
WHERE id_insetos BETWEEN 1 AND 600;
