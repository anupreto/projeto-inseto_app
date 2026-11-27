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
('Mosca sirfídea', 'Episyrphus balteatus', 'insetos', 'Syrphidae', 'Nectarívoro', 'Imita o padrão listrado das vespas para se proteger, mesmo sem possuir ferrão.'),
('Mutuca', 'Tabanus bovinus', 'insetos', 'Tabanidae', 'Hematófago', 'As fêmeas cortam a pele com peças bucais em forma de lâmina para sugar o sangue.'),
('Pernilongo comum', 'Culex pipiens', 'insetos', 'Culicidae', 'Hematófago', 'Põe os ovos agrupados em jangadas flutuantes sobre a água parada.'),
('Barbeiro', 'Triatoma infestans', 'insetos', 'Reduviidae', 'Hematófago', 'Principal transmissor do Trypanosoma cruzi, causador da doença de Chagas.'),
('Cochonilha-do-carmim', 'Dactylopius coccus', 'insetos', 'Dactylopiidae', 'Herbívoro', 'Fornece o corante vermelho carmim, usado há séculos em tecidos, alimentos e cosméticos.'),
('Pulgão verde do pessegueiro', 'Myzus persicae', 'insetos', 'Aphididae', 'Herbívoro', 'Reproduz-se rapidamente por partenogênese e transmite diversos vírus de plantas.'),
('Cigarrinha-das-pastagens', 'Philaenus spumarius', 'insetos', 'Aphrophoridae', 'Herbívoro', 'Suas ninfas se protegem dentro de uma espuma que produzem sobre as plantas.'),
('Percevejo-assassino', 'Zelus renardii', 'insetos', 'Reduviidae', 'Carnívoro', 'Usa substâncias pegajosas nas patas para segurar presas e injeta enzimas digestivas.'),
('Besouro-veado', 'Lucanus cervus', 'insetos', 'Lucanidae', 'Detritívoro', 'Os machos possuem mandíbulas enormes em forma de galhada, usadas em lutas.'),
('Tenébrio', 'Tenebrio molitor', 'insetos', 'Tenebrionidae', 'Onívoro', 'Suas larvas, chamadas de bichos-da-farinha, são estudadas como fonte alternativa de proteína.'),
('Gorgulho do milho', 'Sitophilus zeamais', 'insetos', 'Curculionidae', 'Herbívoro', 'Perfura grãos armazenados para depositar ovos, causando grandes perdas pós-colheita.'),
('Cantárida', 'Lytta vesicatoria', 'insetos', 'Meloidae', 'Herbívoro', 'Produz cantaridina, substância tóxica que provoca bolhas na pele.'),
('Pirilampo tuco-tuco', 'Pyrophorus noctilucus', 'insetos', 'Elateridae', 'Herbívoro', 'Emite uma intensa luz verde pelo tórax, uma das mais brilhantes entre os insetos.'),
('Besouro Titã', 'Titanus giganteus', 'insetos', 'Cerambycidae', 'Xilófago', 'Um dos maiores besouros do mundo, com mandíbulas capazes de cortar um lápis.'),
('Besouro arlequim', 'Acrocinus longimanus', 'insetos', 'Cerambycidae', 'Xilófago', 'Possui patas dianteiras muito longas e um padrão colorido que lembra um arlequim.'),
('Besouro mergulhador', 'Dytiscus marginalis', 'insetos', 'Dytiscidae', 'Carnívoro', 'Carrega uma bolha de ar sob os élitros para respirar enquanto caça debaixo d''água.'),
('Besouro japonês', 'Popillia japonica', 'insetos', 'Scarabaeidae', 'Herbívoro', 'Praga agrícola que devora folhas e flores de centenas de espécies de plantas.'),
('Besouro-enterrador', 'Nicrophorus vespilloides', 'insetos', 'Silphidae', 'Necrófago', 'Enterra pequenos cadáveres e cuida das larvas, algo raro entre os besouros.'),
('Traça-dos-livros', 'Lepisma saccharina', 'insetos', 'Lepismatidae', 'Detritívoro', 'Inseto primitivo e sem asas que se alimenta de papel, cola e outros materiais com amido.'),
('Tripes-das-flores', 'Frankliniella occidentalis', 'insetos', 'Thripidae', 'Herbívoro', 'Minúsculo inseto de asas franjadas que causa danos a flores e hortaliças.'),
('Borboleta-coruja', 'Caligo eurilochus', 'insetos', 'Nymphalidae', 'Frugívoro', 'Tem manchas nas asas que lembram olhos de coruja para assustar predadores.'),
('Mosca-soldado-negra', 'Hermetia illucens', 'insetos', 'Stratiomyidae', 'Detritívoro', 'Suas larvas decompõem resíduos orgânicos rapidamente e são usadas como ração animal.'),
('Mosca-do-estábulo', 'Stomoxys calcitrans', 'insetos', 'Muscidae', 'Hematófago', 'Parece uma mosca doméstica, mas pica de verdade o gado e outros animais.'),
('Mosca-da-carne', 'Sarcophaga carnaria', 'insetos', 'Sarcophagidae', 'Detritívoro', 'A fêmea deposita larvas vivas, em vez de ovos, sobre a matéria em decomposição.'),
('Mosquito-anófele', 'Anopheles gambiae', 'insetos', 'Culicidae', 'Hematófago', 'É o principal transmissor da malária na África.'),
('Maruim', 'Culicoides impunctatus', 'insetos', 'Ceratopogonidae', 'Hematófago', 'Minúsculo, atravessa telas comuns e provoca picadas muito irritantes.'),
('Borrachudo', 'Simulium damnosum', 'insetos', 'Simuliidae', 'Hematófago', 'Suas larvas vivem em rios de correnteza e dependem de água limpa e oxigenada.'),
('Mosquito-tigre-asiático', 'Aedes albopictus', 'insetos', 'Culicidae', 'Hematófago', 'Reconhecido pelas listras brancas no corpo e nas patas, espalhou-se por vários continentes.'),
('Mosca-ladrão', 'Asilus crabroniformis', 'insetos', 'Asilidae', 'Carnívoro', 'Captura outros insetos em pleno voo e os paralisa com saliva tóxica.'),
('Mosca-abelha', 'Bombylius major', 'insetos', 'Bombyliidae', 'Nectarívoro', 'Paira no ar como um beija-flor enquanto alcança o néctar com sua longa probóscide.'),
('Pernilongo-gigante', 'Tipula paludosa', 'insetos', 'Tipulidae', 'Herbívoro', 'Apesar de parecer um mosquito enorme, é inofensivo e não pica.'),
('Borboleta-zebra', 'Heliconius charithonia', 'insetos', 'Nymphalidae', 'Nectarívoro', 'Também se alimenta de pólen, o que lhe permite viver muito mais que a maioria das borboletas.'),
('Borboleta-almirante', 'Vanessa atalanta', 'insetos', 'Nymphalidae', 'Frugívoro', 'Gosta de frutas fermentadas e é capaz de migrar por longas distâncias.'),
('Borboleta-pavão', 'Aglais io', 'insetos', 'Nymphalidae', 'Nectarívoro', 'Suas asas têm grandes manchas semelhantes a olhos que assustam predadores.'),
('Borboleta-rainha-alexandra', 'Ornithoptera alexandrae', 'insetos', 'Papilionidae', 'Nectarívoro', 'É a maior borboleta do mundo e vive somente em florestas de Papua-Nova Guiné.'),
('Borboleta-limão', 'Gonepteryx rhamni', 'insetos', 'Pieridae', 'Nectarívoro', 'Hiberna na fase adulta e, de asas fechadas, lembra uma folha amarelada.'),
('Borboleta-da-couve', 'Pieris brassicae', 'insetos', 'Pieridae', 'Herbívoro', 'Suas lagartas são pragas de plantações de couve e de outras crucíferas.'),
('Borboleta-folha-seca', 'Kallima inachus', 'insetos', 'Nymphalidae', 'Frugívoro', 'Com as asas fechadas, imita com perfeição uma folha seca, inclusive as nervuras.'),
('Borboleta-de-vidro', 'Greta oto', 'insetos', 'Nymphalidae', 'Nectarívoro', 'Suas asas são transparentes porque quase não possuem escamas coloridas.'),
('Borboleta-oitenta-e-oito', 'Diaethria clymena', 'insetos', 'Nymphalidae', 'Frugívoro', 'Tem na face inferior das asas um desenho que lembra o número oitenta e oito.'),
('Mariposa-atlas', 'Attacus atlas', 'insetos', 'Saturniidae', 'Herbívoro', 'Está entre as maiores mariposas do mundo, e as pontas de suas asas lembram cabeças de serpente.'),
('Mariposa-beija-flor', 'Macroglossum stellatarum', 'insetos', 'Sphingidae', 'Nectarívoro', 'Paira diante das flores batendo as asas rapidamente, como um beija-flor.'),
('Mariposa-do-tabaco', 'Manduca sexta', 'insetos', 'Sphingidae', 'Herbívoro', 'É muito usada em pesquisas sobre voo e neurobiologia de insetos.'),
('Mariposa-cigana', 'Lymantria dispar', 'insetos', 'Erebidae', 'Herbívoro', 'Suas lagartas podem desfolhar florestas inteiras durante surtos populacionais.'),
('Mariposa-cometa', 'Argema mittrei', 'insetos', 'Saturniidae', 'Herbívoro', 'Possui caudas longuíssimas nas asas posteriores e vive em Madagascar.'),
('Traça-da-roupa', 'Tineola bisselliella', 'insetos', 'Tineidae', 'Detritívoro', 'Suas larvas digerem queratina, por isso estragam lã, penas e peles.'),
('Traça-das-crucíferas', 'Plutella xylostella', 'insetos', 'Plutellidae', 'Herbívoro', 'Desenvolveu resistência a muitos inseticidas e é praga mundial de hortaliças.'),
('Lagarta-do-cartucho', 'Spodoptera frugiperda', 'insetos', 'Noctuidae', 'Herbívoro', 'Ataca milho e outras culturas e se espalhou das Américas para outros continentes.'),
('Traça-da-cera', 'Galleria mellonella', 'insetos', 'Pyralidae', 'Detritívoro', 'Suas larvas vivem em colmeias e conseguem digerir a cera das abelhas.'),
('Bicho-da-maçã', 'Cydia pomonella', 'insetos', 'Tortricidae', 'Herbívoro', 'A larva penetra no fruto e se alimenta dele de dentro para fora.'),
('Arapuá', 'Trigona spinipes', 'insetos', 'Apidae', 'Nectarívoro', 'Abelha sem ferrão que constrói grandes ninhos expostos nos galhos das árvores.'),
('Mamangaba-das-orquídeas', 'Eulaema nigrita', 'insetos', 'Apidae', 'Nectarívoro', 'Os machos coletam fragrâncias de orquídeas e as usam para atrair fêmeas.'),
('Abelha-cortadeira-de-folhas', 'Megachile rotundata', 'insetos', 'Megachilidae', 'Nectarívoro', 'Corta pedaços circulares de folhas para forrar as células do ninho e é usada na polinização da alfafa.'),
('Abelha-pedreira', 'Osmia bicornis', 'insetos', 'Megachilidae', 'Nectarívoro', 'Faz ninho em cavidades e separa cada câmara com barro.'),
('Abelha-do-suor-verde', 'Augochlora pura', 'insetos', 'Halictidae', 'Nectarívoro', 'Tem brilho verde metálico e é atraída pelo suor humano.'),
('Abelha-cuco', 'Nomada flava', 'insetos', 'Apidae', 'Nectarívoro', 'Põe ovos em ninhos de outras abelhas, e sua larva consome o alimento do hospedeiro.'),
('Formiga-carpinteira', 'Camponotus pennsylvanicus', 'insetos', 'Formicidae', 'Onívoro', 'Escava galerias na madeira para fazer o ninho, mas não se alimenta dela.'),
('Formiga-tecelã', 'Oecophylla smaragdina', 'insetos', 'Formicidae', 'Onívoro', 'Costura folhas umas às outras usando a seda produzida pelas próprias larvas.'),
('Formiga-louca', 'Anoplolepis gracilipes', 'insetos', 'Formicidae', 'Onívoro', 'Espécie invasora que forma supercolônias e ameaça a fauna nativa de ilhas.'),
('Formiga-de-mel', 'Myrmecocystus mexicanus', 'insetos', 'Formicidae', 'Onívoro', 'Algumas operárias, chamadas repletas, armazenam néctar em um abdome muito inchado.'),
('Formiga-faraó', 'Monomorium pharaonis', 'insetos', 'Formicidae', 'Onívoro', 'Minúscula, forma colônias com várias rainhas e é comum em prédios e hospitais.'),
('Saúva', 'Atta sexdens', 'insetos', 'Formicidae', 'Herbívoro', 'Pode desfolhar plantações rapidamente, e seus formigueiros têm câmaras subterrâneas enormes.'),
('Formiga-buldogue', 'Myrmecia gulosa', 'insetos', 'Formicidae', 'Carnívoro', 'Possui visão apurada, mandíbulas longas e um ferrão muito potente.'),
('Formiga-pastora', 'Formica rufa', 'insetos', 'Formicidae', 'Onívoro', 'Constrói grandes montes de gravetos e protege pulgões em troca da secreção açucarada deles.'),
('Formiga-drácula', 'Mystrium camillae', 'insetos', 'Formicidae', 'Carnívoro', 'Fecha as mandíbulas com um estalo extremamente veloz, entre os movimentos mais rápidos do reino animal.'),
('Marimbondo-caboclo', 'Polybia paulista', 'insetos', 'Vespidae', 'Carnívoro', 'Constrói ninhos de papel, e seu veneno é estudado por propriedades contra células tumorais.'),
('Vespão-europeu', 'Vespa crabro', 'insetos', 'Vespidae', 'Carnívoro', 'É a maior vespa social da Europa e, apesar da fama, costuma ser relativamente dócil.'),
('Vespa-do-figo', 'Blastophaga psenes', 'insetos', 'Agaonidae', 'Herbívoro', 'Entra nos figos para pôr ovos e é essencial para a polinização das figueiras.'),
('Vespa-parasita-da-couve', 'Cotesia glomerata', 'insetos', 'Braconidae', 'Parasita', 'Põe ovos dentro de lagartas e é usada no controle biológico de pragas.'),
('Vespa-da-madeira', 'Sirex noctilio', 'insetos', 'Siricidae', 'Xilófago', 'Suas larvas perfuram troncos de pinheiros com ajuda de um fungo que auxilia na digestão da madeira.'),
('Vespa-ichneumon-gigante', 'Megarhyssa atrata', 'insetos', 'Ichneumonidae', 'Parasita', 'Perfura troncos com um ovipositor longuíssimo para alcançar larvas escondidas na madeira.'),
('Libélula-vagabunda', 'Pantala flavescens', 'insetos', 'Libellulidae', 'Carnívoro', 'Realiza migrações sobre os oceanos, entre as mais longas já registradas para insetos.'),
('Libélula-azul-caçadora', 'Aeshna cyanea', 'insetos', 'Aeshnidae', 'Carnívoro', 'O macho patrulha seu território e é frequente em jardins com lagos.'),
('Donzelinha-azul', 'Ischnura elegans', 'insetos', 'Coenagrionidae', 'Carnívoro', 'Pousa com as asas dobradas sobre o corpo, ao contrário das libélulas verdadeiras.'),
('Libélula-gigante-da-floresta', 'Megaloprepus caerulatus', 'insetos', 'Pseudostigmatidae', 'Carnívoro', 'Tem a maior envergadura entre as libélulas-agulha e captura aranhas direto de suas teias.'),
('Plecóptero', 'Perla bipunctata', 'insetos', 'Perlidae', 'Carnívoro', 'Suas ninfas vivem em rios limpos e servem como indicadores da qualidade da água.'),
('Tricóptero', 'Limnephilus rhombicus', 'insetos', 'Limnephilidae', 'Onívoro', 'A larva constrói um estojo protetor com gravetos e grãos de areia.'),
('Mosca-escorpião', 'Panorpa communis', 'insetos', 'Panorpidae', 'Onívoro', 'O macho tem o abdome curvado como a cauda de um escorpião, mas é totalmente inofensivo.'),
('Pulga-do-rato', 'Xenopsylla cheopis', 'insetos', 'Pulicidae', 'Hematófago', 'Foi a principal transmissora da bactéria da peste bubônica em epidemias históricas.'),
('Chato', 'Pthirus pubis', 'insetos', 'Pthiridae', 'Hematófago', 'Prefere pelos mais grossos e se fixa a eles com garras largas.'),
('Louva-a-deus-empusa', 'Empusa pennata', 'insetos', 'Empusidae', 'Carnívoro', 'Tem uma crista pontuda na cabeça e um corpo fino que imita galhos secos.'),
('Louva-a-deus-flor', 'Creobroter gemmatus', 'insetos', 'Hymenopodidae', 'Carnívoro', 'Assemelha-se a uma flor e espera suas presas imóvel em meio à vegetação.'),
('Louva-a-deus-folha-morta', 'Deroplatys dessicata', 'insetos', 'Mantidae', 'Carnívoro', 'Imita uma folha seca e, quando ameaçado, abre as asas para parecer maior.'),
('Bicho-pau-gigante', 'Phobaeticus chani', 'insetos', 'Phasmatidae', 'Herbívoro', 'Está entre os insetos mais compridos já registrados no mundo.'),
('Inseto-folha-gigante', 'Phyllium giganteum', 'insetos', 'Phylliidae', 'Herbívoro', 'As fêmeas são largas e achatadas, imitando folhas até na cor e nas nervuras.'),
('Grilo-de-campo', 'Gryllus campestris', 'insetos', 'Gryllidae', 'Onívoro', 'O macho defende uma toca e canta na entrada dela para atrair as fêmeas.'),
('Gafanhoto-lubber', 'Romalea microptera', 'insetos', 'Romaleidae', 'Herbívoro', 'Exibe cores vivas de aviso e libera uma secreção espumosa e tóxica ao ser atacado.'),
('Gafanhoto-gigante-sul-americano', 'Tropidacris collaris', 'insetos', 'Romaleidae', 'Herbívoro', 'Está entre os maiores gafanhotos das Américas e possui asas coloridas.'),
('Esperança-katydid', 'Pterophylla camellifolia', 'insetos', 'Tettigoniidae', 'Herbívoro', 'O canto noturno dos machos é característico das florestas no verão.'),
('Cupim-arborícola', 'Nasutitermes corniger', 'insetos', 'Termitidae', 'Xilófago', 'Os soldados disparam uma secreção pegajosa pela cabeça em forma de bico.'),
('Cupim-cultivador', 'Macrotermes bellicosus', 'insetos', 'Termitidae', 'Fungívoro', 'Cultiva fungos em jardins dentro do cupinzeiro, que também ajuda a regular a temperatura.'),
('Cupim-de-montículo', 'Cornitermes cumulans', 'insetos', 'Termitidae', 'Detritívoro', 'Constrói grandes montículos de terra, muito comuns em pastagens brasileiras.'),
('Barata-australiana', 'Periplaneta australasiae', 'insetos', 'Blattidae', 'Onívoro', 'Tem faixas amareladas nas asas e prefere ambientes quentes e úmidos.'),
('Barata-d''água-gigante', 'Lethocerus indicus', 'insetos', 'Belostomatidae', 'Carnívoro', 'Captura peixes e anfíbios e é consumida como iguaria em países do sudeste asiático.'),
('Percevejo-fedorento-marmorizado', 'Halyomorpha halys', 'insetos', 'Pentatomidae', 'Herbívoro', 'Entra em casas para hibernar e libera um odor desagradável quando incomodado.'),
('Notonecta', 'Notonecta glauca', 'insetos', 'Notonectidae', 'Carnívoro', 'Nada de barriga para cima, logo abaixo da superfície da água.'),
('Patinador-de-lagoa', 'Gerris lacustris', 'insetos', 'Gerridae', 'Carnívoro', 'Desliza sobre a água graças à tensão superficial e aos pelos que repelem água nas patas.'),
('Escorpião-d''água', 'Nepa cinerea', 'insetos', 'Nepidae', 'Carnívoro', 'Respira por um tubo no fim do abdome que funciona como um snorkel.'),
('Percevejo-de-fogo', 'Pyrrhocoris apterus', 'insetos', 'Pyrrhocoridae', 'Herbívoro', 'Vive em grandes grupos, e a coloração vermelha e preta serve de aviso aos predadores.'),
('Percevejo-do-pinheiro', 'Leptoglossus occidentalis', 'insetos', 'Coreidae', 'Herbívoro', 'Suas patas traseiras possuem expansões em forma de folha.'),
('Jequitiranaboia', 'Fulgora laternaria', 'insetos', 'Fulgoridae', 'Herbívoro', 'Tem a cabeça alongada e de aspecto curioso, que inspirou muitas lendas populares.'),
('Membracídeo-espinhoso', 'Umbonia spinosa', 'insetos', 'Membracidae', 'Herbívoro', 'As mães protegem grupos de ninfas nos galhos contra predadores.'),
('Cigarra-do-mediterrâneo', 'Cicada orni', 'insetos', 'Cicadidae', 'Herbívoro', 'Seu canto forte é um símbolo do verão em regiões do Mediterrâneo.'),
('Besouro-tapete', 'Anthrenus verbasci', 'insetos', 'Dermestidae', 'Detritívoro', 'Suas larvas peludas danificam tapetes, couros e coleções de museus.'),
('Pirilampo-europeu', 'Lampyris noctiluca', 'insetos', 'Lampyridae', 'Carnívoro', 'As fêmeas não têm asas e emitem luz do chão para atrair os machos.'),
('Besouro-capricórnio', 'Cerambyx cerdo', 'insetos', 'Cerambycidae', 'Xilófago', 'Suas larvas perfuram carvalhos antigos durante vários anos até completar o desenvolvimento.'),
('Besouro-dermestídeo', 'Dermestes lardarius', 'insetos', 'Dermestidae', 'Necrófago', 'É usado em museus para limpar esqueletos de animais sem danificar os ossos.'),
('Besouro-da-farinha-vermelho', 'Tribolium castaneum', 'insetos', 'Tenebrionidae', 'Detritívoro', 'É praga de farinhas armazenadas e também organismo-modelo em pesquisas genéticas.'),
('Bicudo-da-palmeira', 'Rhynchophorus ferrugineus', 'insetos', 'Curculionidae', 'Herbívoro', 'Suas larvas destroem o interior das palmeiras e podem matá-las.'),
('Bicudo-do-algodoeiro', 'Anthonomus grandis', 'insetos', 'Curculionidae', 'Herbívoro', 'Foi uma das piores pragas da cultura do algodão nas Américas.'),
('Besouro-da-batata', 'Leptinotarsa decemlineata', 'insetos', 'Chrysomelidae', 'Herbívoro', 'Desenvolveu resistência a muitos inseticidas e devora as folhas da batateira.'),
('Vaquinha', 'Diabrotica speciosa', 'insetos', 'Chrysomelidae', 'Herbívoro', 'Os adultos comem folhas, e as larvas atacam as raízes de várias culturas.'),
('Besouro-meloe', 'Meloe proscarabaeus', 'insetos', 'Meloidae', 'Herbívoro', 'Libera hemolinfa com cantaridina, e suas larvas se prendem a abelhas para chegar aos ninhos.'),
('Potó', 'Paederus fuscipes', 'insetos', 'Staphylinidae', 'Carnívoro', 'O contato com a pele esmagada provoca dermatite por causa de uma substância tóxica.'),
('Estafilinídeo-fedorento', 'Ocypus olens', 'insetos', 'Staphylinidae', 'Carnívoro', 'Ergue o abdome como um escorpião e libera odor desagradável quando ameaçado.'),
('Broca-esmeralda', 'Agrilus planipennis', 'insetos', 'Buprestidae', 'Xilófago', 'Praga invasora que já matou milhões de freixos na América do Norte.'),
('Besouro-joia', 'Sternocera aequisignata', 'insetos', 'Buprestidae', 'Herbívoro', 'Seus élitros iridescentes são usados em artesanato em países do sudeste asiático.'),
('Gorgulho-magnífico', 'Eupholus magnificus', 'insetos', 'Curculionidae', 'Herbívoro', 'Exibe cores azuis e verdes metálicas muito vivas e vive na Nova Guiné.'),
('Besouro-aquático-gigante', 'Hydrophilus piceus', 'insetos', 'Hydrophilidae', 'Onívoro', 'Respira com uma camada de ar presa ao corpo, que renova na superfície.'),
('Besouro-girino', 'Gyrinus natator', 'insetos', 'Gyrinidae', 'Carnívoro', 'Gira em círculos na superfície da água e tem olhos divididos para enxergar acima e abaixo dela.'),
('Besouro-serra-pau', 'Macrodontia cervicornis', 'insetos', 'Cerambycidae', 'Xilófago', 'Está entre os maiores besouros do mundo e possui mandíbulas enormes.'),
('Mantispa', 'Mantispa styriaca', 'insetos', 'Mantispidae', 'Carnívoro', 'Parece um louva-a-deus, mas na verdade é parente das crisopas.'),
('Tesourinha-da-praia', 'Labidura riparia', 'insetos', 'Anisolabididae', 'Carnívoro', 'Predadora noturna que escava galerias em solos arenosos.'),
('Peixinho-de-prata-doméstico', 'Thermobia domestica', 'insetos', 'Lepismatidae', 'Detritívoro', 'Prefere locais quentes, como atrás de fornos, e se alimenta de materiais com amido.'),
('Joaninha-de-dois-pontos', 'Adalia bipunctata', 'insetos', 'Coccinellidae', 'Carnívoro', 'Pode ser vermelha com pontos pretos ou preta com manchas vermelhas, conforme a população.'),
('Joaninha-do-oídio', 'Psyllobora vigintiduopunctata', 'insetos', 'Coccinellidae', 'Fungívoro', 'Ao contrário da maioria das joaninhas, se alimenta de fungos que causam o oídio nas plantas.'),
('Besouro-esterqueiro', 'Geotrupes stercorarius', 'insetos', 'Geotrupidae', 'Coprófago', 'Cava túneis sob o esterco e enterra porções do material para alimentar as larvas.'),
('Besouro-relógio-da-morte', 'Xestobium rufovillosum', 'insetos', 'Ptinidae', 'Xilófago', 'Bate a cabeça contra a madeira para atrair parceiros, e o ruído já foi tido como mau presságio.'),
('Caruncho-do-feijão', 'Acanthoscelides obtectus', 'insetos', 'Chrysomelidae', 'Herbívoro', 'Suas larvas se desenvolvem dentro dos grãos de feijão armazenados.'),
('Gorgulho-do-arroz', 'Sitophilus oryzae', 'insetos', 'Curculionidae', 'Herbívoro', 'A fêmea faz um pequeno furo no grão, deposita o ovo e fecha a abertura com uma secreção.'),
('Besouro-do-fumo', 'Lasioderma serricorne', 'insetos', 'Ptinidae', 'Herbívoro', 'Praga de fumo, especiarias e outros produtos armazenados em depósitos.'),
('Golias-real', 'Goliathus regius', 'insetos', 'Scarabaeidae', 'Detritívoro', 'Tem um desenho branco e preto nos élitros e vive em florestas da África Ocidental.'),
('Besouro-netuno', 'Dynastes neptunus', 'insetos', 'Scarabaeidae', 'Detritívoro', 'Os machos têm dois chifres que funcionam como uma pinça ao disputar fêmeas.'),
('Besouro-boi', 'Strategus aloeus', 'insetos', 'Scarabaeidae', 'Detritívoro', 'Os machos possuem chifres na cabeça e no tórax, e as larvas se desenvolvem em matéria vegetal em decomposição.'),
('Besouro-rola-bosta-touro', 'Onthophagus taurus', 'insetos', 'Scarabaeidae', 'Coprófago', 'O tamanho dos chifres do macho depende da quantidade de alimento que a larva recebeu.'),
('Besouro-esterqueiro-metálico', 'Phanaeus vindex', 'insetos', 'Scarabaeidae', 'Coprófago', 'Tem brilho metálico verde e cobre, e os machos exibem um chifre curvo na cabeça.'),
('Besouro-do-pinheiro-ponderosa', 'Dendroctonus ponderosae', 'insetos', 'Curculionidae', 'Xilófago', 'Seus surtos já devastaram grandes áreas de florestas de pinheiros na América do Norte.'),
('Besouro-tipógrafo', 'Ips typographus', 'insetos', 'Curculionidae', 'Xilófago', 'Escava galerias sob a casca de abetos, formando desenhos que lembram letras.'),
('Broca-do-café', 'Hypothenemus hampei', 'insetos', 'Curculionidae', 'Herbívoro', 'A fêmea perfura o grão de café para botar ovos, e as larvas se alimentam da semente.'),
('Bicho-mineiro-do-café', 'Leucoptera coffeella', 'insetos', 'Lyonetiidae', 'Herbívoro', 'Suas lagartas escavam galerias dentro das folhas do cafeeiro.'),
('Cascudinho', 'Alphitobius diaperinus', 'insetos', 'Tenebrionidae', 'Onívoro', 'É muito comum em aviários, onde vive na cama e nos restos de ração.'),
('Besouro-lanterna-do-cerrado', 'Pyrearinus termitilluminans', 'insetos', 'Elateridae', 'Carnívoro', 'Suas larvas brilham nos cupinzeiros do Cerrado para atrair insetos voadores.'),
('Besouro-estalador-de-olhos', 'Alaus oculatus', 'insetos', 'Elateridae', 'Carnívoro', 'Possui manchas semelhantes a olhos e salta com um estalo quando virado de costas.'),
('Besouro-rinoceronte-japonês', 'Trypoxylus dichotomus', 'insetos', 'Scarabaeidae', 'Herbívoro', 'É muito popular como animal de estimação no Japão, onde é chamado de kabutomushi.'),
('Besouro-longicórnio-do-eucalipto', 'Phoracantha semipunctata', 'insetos', 'Cerambycidae', 'Xilófago', 'Suas larvas perfuram o tronco de eucaliptos enfraquecidos e causam prejuízos florestais.'),
('Besouro-tartaruga-dourado', 'Charidotella sexpunctata', 'insetos', 'Chrysomelidae', 'Herbívoro', 'Pode alternar entre dourado e avermelhado, mudando de cor conforme o estresse.'),
('Besouro-formigueiro', 'Thanasimus formicarius', 'insetos', 'Cleridae', 'Carnívoro', 'Caça besouros-da-casca e é considerado um aliado no controle de pragas florestais.'),
('Vaga-lume-sincrônico', 'Photinus carolinus', 'insetos', 'Lampyridae', 'Carnívoro', 'Os machos piscam em sincronia, criando espetáculos luminosos nas florestas dos Apalaches.'),
('Besouro-passalídeo', 'Odontotaenius disjunctus', 'insetos', 'Passalidae', 'Xilófago', 'Vive em troncos podres e produz sons para se comunicar com os outros membros da colônia.'),





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
('Caranguejeira-Goiaba', 'Lasiodora klugi', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Espécie brasileira robusta comum em matas e bordas.'),
('Caranguejeira-do-Cerrado', 'Vitalius wacketi', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Habita áreas abertas e matas do Sudeste e Sul do Brasil.'),
('Tarântula-de-Joelhos-Laranja', 'Brachypelma auratum', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Tem marcações laranja-avermelhadas vivas nas pernas.'),
('Tarântula-Redonda-Mexicana', 'Brachypelma emilia', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Exibe um triângulo escuro bem nítido no cefalotórax.'),
('Tarântula-de-Listras-Vermelhas', 'Aphonopelma moderatum', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Cava tocas profundas e costuma ficar calma quando manuseada.'),
('Tarântula-do-Deserto-Americano', 'Aphonopelma chalcodes', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Os machos adultos saem em caminhadas no outono para achar parceiras.'),
('Tarântula-de-Chifre-de-Búfalo', 'Ceratogyrus brachycephalus', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Apresenta elevação cônica no dorso do cefalotórax.'),
('Tarântula-Ornamental-Indiana', 'Poecilotheria formosa', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Tem desenhos geométricos claros e escuros na face ventral.'),
('Tarântula-Ornamental-do-Sri-Lanka', 'Poecilotheria ornata', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Aranha arborícola ágil com listras amarelas nas pernas.'),
('Tarântula-Rei-Baboon', 'Pelinobius muticus', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Emite som raspando as quelíceras quando se sente ameaçada.'),
('Tarântula-de-Cobalto-Azul', 'Haplopelma lividum', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Escava galerias sinuosas e forradas de seda no solo.'),
('Tarântula-de-Fogo-da-Costa-Rica', 'Brachypelma vagans', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Tem corpo escuro com cerdas avermelhadas no abdômen.'),
('Aranha-de-Teia-de-Seda-Dourada', 'Trichonephila edulis', 'Aracnídeos', 'Araneidae', 'Carnívoro', 'Tece grandes teias verticais entre árvores e arbustos.'),
('Aranha-de-Teia-Circular-Gigante', 'Trichonephila pilipes', 'Aracnídeos', 'Araneidae', 'Carnívoro', 'Produz teias amplas que chegam a resistir a presas maiores.'),
('Aranha-de-Jardim-Listrada', 'Argiope trifasciata', 'Aracnídeos', 'Araneidae', 'Carnívoro', 'Tem faixas prateadas e amarelas no abdômen alongado.'),
('Aranha-de-Bola-Australiana', 'Mastophora cornigera', 'Aracnídeos', 'Araneidae', 'Carnívoro', 'Atrai mariposas imitando feromônios sexuais femininos.'),
('Aranha-Espinhosa-de-Dois-Espinhos', 'Micrathena sagittata', 'Aracnídeos', 'Araneidae', 'Carnívoro', 'Possui projeções rígidas na parte posterior do abdômen.'),
('Aranha-de-Teia-Espiralada', 'Neoscona crucifera', 'Aracnídeos', 'Araneidae', 'Carnívoro', 'Costuma refazer sua teia circular quase todas as noites.'),
('Aranha-de-Cúpula', 'Neriene radiata', 'Aracnídeos', 'Linyphiidae', 'Carnívoro', 'Tece uma estrutura em forma de cúpula sobre a vegetação.'),
('Aranha-de-Folha-Dobrada', 'Phonognatha graeffei', 'Aracnídeos', 'Araneidae', 'Carnívoro', 'Usa uma folha seca enrolada como abrigo no centro da teia.'),
('Aranha-Saltadora-de-Fita', 'Menemerus bivittatus', 'Aracnídeos', 'Salticidae', 'Carnívoro', 'Frequente em muros e paredes externas de casas.'),
('Aranha-Saltadora-de-Peito-Branco', 'Plexippus paykulli', 'Aracnídeos', 'Salticidae', 'Carnívoro', 'Caça à luz do dia com saltos curtos e precisos.'),
('Aranha-Saltadora-Verde', 'Mopsus mormon', 'Aracnídeos', 'Salticidae', 'Carnívoro', 'Tem corpo esverdeado e grandes olhos frontais.'),
('Aranha-Saltadora-de-Formiga', 'Synemosyna formica', 'Aracnídeos', 'Salticidae', 'Carnívoro', 'Tem cintura estreita que lembra o corpo de uma formiga.'),
('Aranha-Saltadora-de-Bigode', 'Hasarius adansoni', 'Aracnídeos', 'Salticidae', 'Carnívoro', 'Comum em áreas urbanas e jardins em regiões quentes.'),
('Aranha-Lobo-de-Jardim', 'Hogna carolinensis', 'Aracnídeos', 'Lycosidae', 'Carnívoro', 'É uma das maiores aranhas-lobo da América do Norte.'),
('Aranha-Lobo-de-Areia', 'Arctosa perita', 'Aracnídeos', 'Lycosidae', 'Carnívoro', 'Camufla-se perfeitamente sobre areia e cascalho.'),
('Aranha-Lobo-de-Mata', 'Trochosa ruricola', 'Aracnídeos', 'Lycosidae', 'Carnívoro', 'Vive sob troncos, pedras e folhas caídas.'),
('Aranha-Caçadora-de-Paredes', 'Selenops radiatus', 'Aracnídeos', 'Selenopidae', 'Carnívoro', 'Corpo superachatado ideal para frestas estreitas.'),
('Aranha-Caçadora-de-Troncos', 'Sparassidae sp.', 'Aracnídeos', 'Sparassidae', 'Carnívoro', 'Desloca-se lateralmente com facilidade em cascas de árvores.'),
('Aranha-Caranguejo-de-Pino', 'Misumenoides formosipes', 'Aracnídeos', 'Thomisidae', 'Carnívoro', 'Espera presas polinizadoras sobre inflorescências.'),
('Aranha-Caranguejo-de-Solo', 'Ozyptila praticola', 'Aracnídeos', 'Thomisidae', 'Carnívoro', 'Vive entre folhas mortas e musgo em áreas sombreadas.'),
('Aranha-de-Alçapão-de-Costa', 'Bothriocyrtum californicum', 'Aracnídeos', 'Halonoproctidae', 'Carnívoro', 'Disfarça a tampa da toca com terra e detritos locais.'),
('Aranha-de-Toca-Sul-Americana', 'Actinopus sp.', 'Aracnídeos', 'Actinopodidae', 'Carnívoro', 'Cava galerias verticais com porta camuflada no solo.'),
('Aranha-de-Porão-Curta', 'Physocyclus globosus', 'Aracnídeos', 'Pholcidae', 'Carnívoro', 'Tem abdômen globoso e teia irregular em cantos secos.'),
('Aranha-Cuspidora-Marrom', 'Scytodes fusca', 'Aracnídeos', 'Scytodidae', 'Carnívoro', 'Expele um líquido que solidifica rápido sobre a presa.'),
('Aranha-de-Saco-Verde', 'Cheiracanthium punctorium', 'Aracnídeos', 'Cheiracanthiidae', 'Carnívoro', 'Encontra-se frequentemente em gramíneas e arbustos altos.'),
('Aranha-de-Tubo', 'Segestria florentina', 'Aracnídeos', 'Segestriidae', 'Carnívoro', 'Constrói um túnel de seda em fendas com fios de alerta.'),
('Aranha-de-Teia-de-Folha', 'Hippasa holmerae', 'Aracnídeos', 'Lycosidae', 'Carnívoro', 'Tece teias em formato de lençol sobre a vegetação baixa.'),
('Aranha-de-Água-Sul-Americana', 'Ancylometes rufus', 'Aracnídeos', 'Ctenidae', 'Carnívoro', 'Grande, vive perto de rios e córregos e pode andar na água.'),
('Aranha-Pescadora-Listrada', 'Dolomedes scriptus', 'Aracnídeos', 'Pisauridae', 'Carnívoro', 'Sente vibrações na água para localizar girinos e insetos.'),
('Aranha-de-Areia-da-Praia', 'Arctosa littoralis', 'Aracnídeos', 'Lycosidae', 'Carnívoro', 'Habita faixas arenosas próximas a praias e margens.'),
('Aranha-de-Fenda', 'Kukulcania hibernalis', 'Aracnídeos', 'Filistatidae', 'Carnívoro', 'Deixa teias emaranhadas azuladas ao redor de frestas de muros.'),
('Aranha-de-Teia-Irregular-Doméstica', 'Parasteatoda tepidariorum', 'Aracnídeos', 'Theridiidae', 'Carnívoro', 'Muito comum em beirais, janelas e cantos de paredes.'),
('Aranha-Viúva-de-Dorso-Vermelho', 'Latrodectus hasselti', 'Aracnídeos', 'Theridiidae', 'Carnívoro', 'Reconhecida pela faixa avermelhada no dorso do abdômen.'),
('Aranha-Viúva-Marrom-Australiana', 'Latrodectus geometricus', 'Aracnídeos', 'Theridiidae', 'Carnívoro', 'Frequente em estruturas artificiais em áreas urbanas.'),
('Aranha-Marrom-Mediterrânea', 'Loxosceles rufescens', 'Aracnídeos', 'Sicariidae', 'Carnívoro', 'Esconde-se em frestas secas, pedras e atrás de móveis.'),
('Aranha-Armadeira-de-Floresta', 'Phoneutria fera', 'Aracnídeos', 'Ctenidae', 'Carnívoro', 'Predadora noturna ágil de florestas tropicais.'),
('Aranha-Armadeira-de-Chave', 'Phoneutria keyserlingi', 'Aracnídeos', 'Ctenidae', 'Carnívoro', 'Encontrada em áreas de mata e vegetação densa.'),
('Aranha-Gladiadora-de-Olhos-Grandes', 'Deinopis longipes', 'Aracnídeos', 'Deinopidae', 'Carnívoro', 'Estica uma pequena teia entre as pernas para laçar presas.'),
('Aranha-de-Teia-de-Funil-de-Floresta', 'Atrax sydneyensis', 'Aracnídeos', 'Atracidae', 'Carnívoro', 'Constrói toca tubular com fios de disparo ao redor.'),
('Aranha-de-Teia-Circular-de-Lagoa', 'Cyclosa conica', 'Aracnídeos', 'Araneidae', 'Carnívoro', 'Acumula restos de presas no centro da teia para camuflagem.'),
('Aranha-de-Teia-de-Orbe-Noturna', 'Eriophora fuliginea', 'Aracnídeos', 'Araneidae', 'Carnívoro', 'Ativa à noite, tece grandes teias circulares em matas.'),
('Aranha-Saltadora-de-Cílios', 'Habronattus coecatus', 'Aracnídeos', 'Salticidae', 'Carnívoro', 'Machos exibem adornos faciais durante a corte visual.'),
('Aranha-Saltadora-de-Folha', 'Lyssomanes viridis', 'Aracnídeos', 'Salticidae', 'Carnívoro', 'Corpo verde-claro translúcido comum em arbustos.'),
('Aranha-Lobo-de-Listras-Claras', 'Alopecosa pulverulenta', 'Aracnídeos', 'Lycosidae', 'Carnívoro', 'Frequente em campos abertos, prados e clareiras.'),
('Aranha-Caranguejo-de-Flores-Brancas', 'Diaea dorsata', 'Aracnídeos', 'Thomisidae', 'Carnívoro', 'Caça insetos visitantes em flores de árvores e arbustos.'),
('Aranha-de-Saco-Doméstica', 'Cheiracanthium mildei', 'Aracnídeos', 'Cheiracanthiidae', 'Carnívoro', 'Pode ser encontrada dentro de casas e sobre plantas.'),
('Aranha-de-Teia-de-Lençol', 'Agelenopsis naevia', 'Aracnídeos', 'Agelenidae', 'Carnívoro', 'Tece um lençol de seda que termina em um funil de abrigo.'),
('Aranha-de-Teia-de-Funil-Doméstica', 'Tegenaria domestica', 'Aracnídeos', 'Agelenidae', 'Carnívoro', 'Comum em porões, garagens e construções antigas.'),
('Aranha-de-Alçapão-de-Floresta', 'Cyclocosmia truncata', 'Aracnídeos', 'Halonoproctidae', 'Carnívoro', 'Tem o fim do abdômen endurecido como um disco para tampar a toca.'),
('Aranha-de-Seda-de-Orbe-Dourada', 'Trichonephila senegalensis', 'Aracnídeos', 'Araneidae', 'Carnívoro', 'Produz fios de seda fortes e de tonalidade dourada.'),
('Caranguejeira-Prateada-Brasileira', 'Lasiodora cristata', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Apresenta reflexos prateados na carapaça e porte robusto.'),
('Caranguejeira-Goiaba-Rosa', 'Lasiodora difficilis', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Espécie terrestre brasileira com cerdas avermelhadas no abdômen.'),
('Caranguejeira-de-Toca-Paulista', 'Vitalius sorocabae', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Habita áreas de mata e bordas no interior paulista.'),
('Caranguejeira-Negra-do-Cerrado', 'Grammostola actaeon', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Tem corpo escuro com pelos avermelhados nas pernas.'),
('Caranguejeira-de-Patas-Rosadas', 'Lasiodora parahybana', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Cresce rápido e possui cerdas urticantes no dorso.'),
('Tarântula-Azul-Elétrica', 'Chromatopelma cyaneopubescens', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Produz teias densas em arbustos secos e pedras.'),
('Tarântula-de-Joelhos-Laranja-Mexicana', 'Brachypelma auratum', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Exibe faixas alaranjadas vivas nas articulações das pernas.'),
('Tarântula-de-Cabeça-Preta', 'Aphonopelma anax', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Espécie grande e robusta encontrada no sul do Texas.'),
('Tarântula-do-Deserto-de-Sonora', 'Aphonopelma chalcodes', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Adapta-se bem a solos secos e pedregosos.'),
('Tarântula-de-Chifre-Central', 'Ceratogyrus marshalli', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Possui projeção cônica no dorso do cefalotórax.'),
('Tarântula-Ornamental-de-Listras-Azuis', 'Poecilotheria metallica', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Aranha arborícola de coloração azul-metálica marcante.'),
('Tarântula-Ornamental-de-Fantasmas', 'Poecilotheria vittata', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Tem desenhos claros e escuros que ajudam na camuflagem em troncos.'),
('Tarântula-Ornamental-de-Ruanda', 'Poecilotheria rufilata', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Apresenta detalhes avermelhados nas pernas e hábitos arborícolas.'),
('Tarântula-Baboon-de-Chifre', 'Ceratogyrus darlingi', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Usa o chifre cefalotorácico em posturas defensivas.'),
('Tarântula-Baboon-Marrom', 'Pterinochilus chordatus', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Constrói abrigos tubulares em fendas e solos secos.'),
('Tarântula-de-Teia-Azul', 'Pterinopelma sazimai', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Destaca-se pelo brilho azulado sob iluminação natural.'),
('Tarântula-de-Toca-Indiana', 'Poecilotheria miranda', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Aranha arborícola ágil com padrões geométricos no dorso.'),
('Tarântula-de-Listras-Amarelas', 'Aphonopelma hentzi', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Comum em pradarias e campos abertos da América do Norte.'),
('Tarântula-de-Patas-Douradas', 'Brachypelma albiceps', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Combina cefalotórax dourado-claro com pernas escuras.'),
('Tarântula-de-Veludo-Escuro', 'Aphonopelma iodius', 'Aracnídeos', 'Theraphosidae', 'Carnívoro', 'Espécie terrestre de aparência discreta e movimentos lentos.'),
('Viúva-Negra-Australiana', 'Latrodectus hasselti', 'Aracnídeos', 'Theridiidae', 'Carnívoro', 'Constrói teias irregulares próximas ao solo e em frestas.'),
('Viúva-Negra-do-Sul', 'Latrodectus mactans', 'Aracnídeos', 'Theridiidae', 'Carnívoro', 'Apresenta marca avermelhada na face ventral do abdômen.'),
('Viúva-Negra-do-Oeste', 'Latrodectus hesperus', 'Aracnídeos', 'Theridiidae', 'Carnívoro', 'Comum em áreas secas, arbustos e construções.'),
('Viúva-Marrom-Urbana', 'Latrodectus geometricus', 'Aracnídeos', 'Theridiidae', 'Carnívoro', 'Frequente em muros, janelas e áreas externas de casas.'),
('Viúva-Vermelha-da-Flórida', 'Latrodectus bishopi', 'Aracnídeos', 'Theridiidae', 'Carnívoro', 'Vive em teias ligadas a folhas de palmeiras anãs.'),
('Falsa-Viúva-Nobre', 'Steatoda nobilis', 'Aracnídeos', 'Theridiidae', 'Carnívoro', 'Tem marcações claras no dorso do abdômen e teia irregular.'),
('Falsa-Viúva-de-Barriga-Branca', 'Steatoda triangulosa', 'Aracnídeos', 'Theridiidae', 'Carnívoro', 'Pequena aranha doméstica com fileira de manchas claras.'),
('Aranha-Marrom-do-Sul', 'Loxosceles intermedia', 'Aracnídeos', 'Sicariidae', 'Carnívoro', 'Esconde-se em frestas, pilhas de materiais e atrás de móveis.'),
('Aranha-Marrom-Chilena', 'Loxosceles laeta', 'Aracnídeos', 'Sicariidae', 'Carnívoro', 'Habita abrigos secos e protegidos, inclusive dentro de residências.'),
('Aranha-Marrom-Americana', 'Loxosceles reclusa', 'Aracnídeos', 'Sicariidae', 'Carnívoro', 'Possui marca escura em formato de violino no cefalotórax.'),
('Aranha-de-Areia-Seis-Olhos', 'Sicarius terrosus', 'Aracnídeos', 'Sicariidae', 'Carnívoro', 'Cobre o corpo com grãos de areia para camuflagem.'),
('Aranha-Armadeira-Paulista', 'Phoneutria nigriventer', 'Aracnídeos', 'Ctenidae', 'Carnívoro', 'Tem hábitos noturnos e postura defensiva erguendo as pernas.'),
('Aranha-Armadeira-da-Amazônia', 'Phoneutria fera', 'Aracnídeos', 'Ctenidae', 'Carnívoro', 'Ativa à noite na vegetação e serrapilheira florestal.'),
('Aranha-Armadeira-de-Pernas-Claras', 'Phoneutria keyserlingi', 'Aracnídeos', 'Ctenidae', 'Carnívoro', 'Ocorre em áreas de floresta e bordas de mata.'),
('Aranha-Saltadora-Zebra-Comum', 'Salticus scenicus', 'Aracnídeos', 'Salticidae', 'Carnívoro', 'Tem listras brancas e pretas e caça durante o dia.'),
('Aranha-Saltadora-Real-do-Sul', 'Phidippus regius', 'Aracnídeos', 'Salticidae', 'Carnívoro', 'Possui excelente acuidade visual e caça sem usar teia.'),
('Aranha-Saltadora-Ousada-Americana', 'Phidippus audax', 'Aracnídeos', 'Salticidae', 'Carnívoro', 'Exibe mancha clara no dorso e quelíceras esverdeadas.'),
('Aranha-Saltadora-Pavão-Azul', 'Maratus speciosus', 'Aracnídeos', 'Salticidae', 'Carnívoro', 'O macho levanta uma aba abdominal colorida na corte.'),
('Aranha-Saltadora-Formiga', 'Myrmarachne plataleoides', 'Aracnídeos', 'Salticidae', 'Carnívoro', 'Imita formigas tecelãs no formato do corpo e no andar.'),
('Aranha-Saltadora-de-Folhas-Verdes', 'Lyssomanes viridis', 'Aracnídeos', 'Salticidae', 'Carnívoro', 'Tem corpo verde-translúcido adaptado a folhas e arbustos.'),
('Aranha-Lobo-de-Jardim-Europeia', 'Lycosa singoriensis', 'Aracnídeos', 'Lycosidae', 'Carnívoro', 'Cava tocas verticais no solo e caça à espreita ou correndo.'),
('Aranha-Lobo-Rabidosa-Noturna', 'Rabidosa rabida', 'Aracnídeos', 'Lycosidae', 'Carnívoro', 'A fêmea carrega a ooteca e os filhotes sobre o abdômen.'),
('Aranha-Lobo-de-Praia', 'Arctosa perita', 'Aracnídeos', 'Lycosidae', 'Carnívoro', 'Apresenta coloração acinzentada e amarronzada sobre areia.'),
('Aranha-Lobo-de-Mata-Úmida', 'Trochosa terricola', 'Aracnídeos', 'Lycosidae', 'Carnívoro', 'Vive sob pedras, troncos caídos e serrapilheira.'),
('Aranha-Pescadora-de-Riacho', 'Dolomedes vittatus', 'Aracnídeos', 'Pisauridae', 'Carnívoro', 'Fica junto às margens de água e captura pequenos animais aquáticos.'),
('Aranha-Pescadora-Escura', 'Dolomedes tenebrosus', 'Aracnídeos', 'Pisauridae', 'Carnívoro', 'Aranha grande que caça na superfície da água e em troncos.'),
('Aranha-Caranguejo-das-Flores', 'Misumena vatia', 'Aracnídeos', 'Thomisidae', 'Carnívoro', 'Altera a coloração lentamente para combinar com flores.'),
('Aranha-Caranguejo-de-Pinos', 'Misumenoides formosipes', 'Aracnídeos', 'Thomisidae', 'Carnívoro', 'Aguarda insetos visitantes sobre flores abertas.'),
('Aranha-Caranguejo-de-Solo-Escura', 'Xysticus ferrugineus', 'Aracnídeos', 'Thomisidae', 'Carnívoro', 'Caça de emboscada entre folhas secas e vegetação rasteira.'),
('Aranha-de-Teia-Circular-Dourada-Maior', 'Trichonephila clavipes', 'Aracnídeos', 'Araneidae', 'Carnívoro', 'Tece teias grandes entre árvores e arbustos em áreas abertas e matas.'),
('Aranha-de-Teia-Circular-de-Lagoa-Maior', 'Trichonephila pilipes', 'Aracnídeos', 'Araneidae', 'Carnívoro', 'Produz teias amplas com fios resistentes de brilho dourado.'),
('Aranha-de-Jardim-de-Cruz', 'Araneus diadematus', 'Aracnídeos', 'Araneidae', 'Carnívoro', 'Apresenta manchas claras no dorso que formam um desenho em cruz.'),
('Aranha-de-Jardim-Prateada', 'Argiope argentata', 'Aracnídeos', 'Araneidae', 'Carnívoro', 'Tem cefalotórax prateado e teia com faixa de seda em ziguezague.'),
('Aranha-de-Jardim-Listrada-de-Amarelo', 'Argiope aurantia', 'Aracnídeos', 'Araneidae', 'Carnívoro', 'Possui abdômen com faixas amarelas e pretas e teia vertical.'),
('Aranha-Espinhosa-Estrela', 'Gasteracantha cancriformis', 'Aracnídeos', 'Araneidae', 'Carnívoro', 'Tem abdômen rígido com espinhos bem marcados.'),
('Aranha-Espinhosa-de-Dois-Espinhos-Maior', 'Micrathena sagittata', 'Aracnídeos', 'Araneidae', 'Carnívoro', 'Exibe projeções cônicas na parte posterior do abdômen.'),
('Aranha-de-Bola-Noturna', 'Mastophora hutchinsoni', 'Aracnídeos', 'Araneidae', 'Carnívoro', 'Usa um fio com gota adesiva para capturar mariposas no escuro.'),
('Aranha-Gladiadora-de-Olhos-Escuros', 'Deinopis subrufa', 'Aracnídeos', 'Deinopidae', 'Carnívoro', 'Estica uma pequena teia entre as pernas para laçar presas.'),
('Aranha-Caçadora-Gigante-de-Caverna', 'Heteropoda maxima', 'Aracnídeos', 'Sparassidae', 'Carnívoro', 'Destaca-se pela longa envergadura das pernas.'),
('Aranha-Caçadora-Marrom-Doméstica', 'Heteropoda venatoria', 'Aracnídeos', 'Sparassidae', 'Carnívoro', 'Move-se rapidamente por paredes, troncos e abrigos.'),
('Aranha-Caçadora-Dourada-Australiana', 'Beregama aurea', 'Aracnídeos', 'Sparassidae', 'Carnívoro', 'Espécie grande e ágil encontrada em troncos e folhagens.'),
('Aranha-de-Alçapão-de-Costa-Californiana', 'Bothriocyrtum californicum', 'Aracnídeos', 'Halonoproctidae', 'Carnívoro', 'Fecha a entrada da toca com tampa articulada de terra e seda.'),
('Aranha-de-Alçapão-de-Tampa-Espessa', 'Ummidia audouini', 'Aracnídeos', 'Halonoproctidae', 'Carnívoro', 'Constrói galerias revestidas de seda com tampa camuflada.'),
('Aranha-Funil-de-Sydney', 'Atrax robustus', 'Aracnídeos', 'Atracidae', 'Carnívoro', 'Abriga-se em tocas tubulares com fios de disparo ao redor.'),
('Aranha-Funil-de-Árvore-Australiana', 'Hadronyche cerberea', 'Aracnídeos', 'Atracidae', 'Carnívoro', 'Habita ocos de árvores e troncos úmidos.'),
('Aranha-Rato-de-Cabeça-Larga', 'Missulena bradleyi', 'Aracnídeos', 'Actinopodidae', 'Carnívoro', 'Cava tocas profundas com tampa discreta no solo.'),
('Aranha-de-Toca-Sul-Americana-Maior', 'Actinopus crassipes', 'Aracnídeos', 'Actinopodidae', 'Carnívoro', 'Vive em galerias subterrâneas com entrada camuflada.'),
('Aranha-Tecelã-Social-de-Floresta', 'Anelosimus eximius', 'Aracnídeos', 'Theridiidae', 'Carnívoro', 'Forma grandes teias comunitárias onde vários indivíduos caçam juntos.'),
('Aranha-de-Seda-Lanosa-Sem-Veneno', 'Uloborus plumipes', 'Aracnídeos', 'Uloboridae', 'Carnívoro', 'Envolve presas em seda e não possui glândulas de veneno.'),
('Aranha-Pirata-de-Teias', 'Mimetus puritanus', 'Aracnídeos', 'Mimetidae', 'Carnívoro', 'Preda outras aranhas dentro das teias delas.'),
('Aranha-de-Saco-Amarelo-de-Folhas', 'Cheiracanthium inclusum', 'Aracnídeos', 'Cheiracanthiidae', 'Carnívoro', 'Abriga-se durante o dia em câmaras de seda dobradas em folhas.'),
('Aranha-de-Porão-de-Pernas-Longas', 'Pholcus phalangioides', 'Aracnídeos', 'Pholcidae', 'Carnívoro', 'Vibra rapidamente na teia quando perturbada.'),
('Aranha-de-Porão-Globosa', 'Physocyclus globosus', 'Aracnídeos', 'Pholcidae', 'Carnívoro', 'Comum em cantos secos de paredes, tetos e abrigos.'),
('Aranha-Cuspidora-Pintada', 'Scytodes thoracica', 'Aracnídeos', 'Scytodidae', 'Carnívoro', 'Lança jatos de seda pegajosa para imobilizar presas.'),
('Aranha-Espadachim-de-Tatuzinhos', 'Dysdera crocata', 'Aracnídeos', 'Dysderidae', 'Carnívoro', 'Tem quelíceras robustas adaptadas a presas de carapaça dura.'),
('Aranha-de-Tubo-de-Fendas', 'Segestria florentina', 'Aracnídeos', 'Segestriidae', 'Carnívoro', 'Constrói túneis de seda em muros e fendas com fios radiais.'),
('Aranha-de-Fenda-Americana', 'Kukulcania hibernalis', 'Aracnídeos', 'Filistatidae', 'Carnívoro', 'Tece teias densas e azuladas ao redor de aberturas.'),
('Aranha-de-Pelúcia-Europeia', 'Eresus sandaliatus', 'Aracnídeos', 'Eresidae', 'Carnívoro', 'O macho apresenta dorso avermelhado com manchas escuras.'),
('Escorpião-Amarelo-Brasileiro', 'Tityus serrulatus', 'Aracnídeos', 'Buthidae', 'Carnívoro', 'Apresenta serrilhas na cauda e reprodução partenogenética.'),
('Escorpião-Negro-do-Sudeste', 'Tityus bahiensis', 'Aracnídeos', 'Buthidae', 'Carnívoro', 'Tem corpo escuro e pernas alaranjadas ou amareladas.'),
('Escorpião-de-Barriga-Preta-Nordestino', 'Tityus stigmurus', 'Aracnídeos', 'Buthidae', 'Carnívoro', 'Exibe manchas escuras na região ventral e cauda serrilhada.'),
('Escorpião-Imperador-Africano', 'Pandinus imperator', 'Aracnídeos', 'Scorpionidae', 'Carnívoro', 'Possui pedipalpos largos e robustos e coloração escura.'),
('Escorpião-de-Floresta-Asiático', 'Heterometrus spinifer', 'Aracnídeos', 'Scorpionidae', 'Carnívoro', 'Espécie grande e escura com pinças largas.'),
('Escorpião-Dourado-do-Oriente-Médio', 'Leiurus quinquestriatus', 'Aracnídeos', 'Buthidae', 'Carnívoro', 'Tem coloração amarelada e cauda esbelta.'),
('Escorpião-de-Cauda-Grossa-Norte-Africano', 'Androctonus australis', 'Aracnídeos', 'Buthidae', 'Carnívoro', 'Habita áreas áridas e pedregosas com cauda espessa.'),
('Escorpião-do-Deserto-Gigante', 'Hadrurus arizonensis', 'Aracnídeos', 'Caraboctonidae', 'Carnívoro', 'Um dos maiores escorpiões da América do Norte.'),
('Escorpião-de-Casca-do-Deserto', 'Centruroides sculpturatus', 'Aracnídeos', 'Buthidae', 'Carnívoro', 'Tem corpo fino e amarelado e escala superfícies com facilidade.'),
('Viúva Florestal', 'Latrodectus florestalensis', 'Aracnídeos', 'Theridiidae', 'Carnívoro', 'Constrói teias irregulares resistentes em frestas e arbustos. Exemplar associado a ambiente florestal.'),
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
('Caracol Trompa', 'Busycon carica', 'Moluscos', 'Busyconidae', 'Carnívoro', 'Usa a borda da concha para abrir bivalves.'),
('Bivalve Surf', 'Spisula solidissima', 'Moluscos', 'Mactridae', 'Filtrador', 'Enterra-se rapidamente na areia com o pé musculoso.'),
('Polvo de Estufa', 'Octopus joubini', 'Moluscos', 'Octopodidae', 'Carnívoro', 'Espécie pequena de águas rasas do Atlântico.'),
('Lula de Profundidade', 'Mastigoteuthis flammea', 'Moluscos', 'Mastigoteuthidae', 'Carnívoro', 'Possui tentáculos muito longos e finos.'),
('Caramujo Espiral de Marfim', 'Babylonia spirata', 'Moluscos', 'Babyloniidae', 'Carnívoro', 'Concha clara com manchas castanhas em espiral.'),
('Ostra de Pérola Akoya', 'Pinctada fucata', 'Moluscos', 'Pteriidae', 'Filtrador', 'Tradicional no cultivo de pérolas redondas.'),
('Lesma do Mar Verde Folha', 'Oxynoe viridis', 'Moluscos', 'Oxynoidae', 'Herbívoro', 'Associa-se a algas verdes do gênero Caulerpa.'),
('Caracol Olho de Vidro', 'Littorina littorea', 'Moluscos', 'Littorinidae', 'Herbívoro', 'Muito comum em pedras da zona entremarés.'),
('Mexilhão Azul do Pacífico', 'Mytilus trossulus', 'Moluscos', 'Mytilidae', 'Filtrador', 'Forma bancos densos em costas rochosas frias.'),
('Lula de Cauda Chicote', 'Chiroteuthis veranyi', 'Moluscos', 'Chiroteuthidae', 'Carnívoro', 'Tem cauda alongada com fotóforos nas pontas.'),
('Caramujo Pagode', 'Pagodula', 'Moluscos', 'Muricidae', 'Carnívoro', 'Concha com cristas que lembram um telhado em camadas.'),
('Bivalve Navio Gigante', 'Kuphus polythalamia', 'Moluscos', 'Teredinidae', 'Detritívoro', 'Forma um tubo calcário longo e espesso no lodo.'),
('Polvo de Algas', 'Macrotritopus defilippi', 'Moluscos', 'Octopodidae', 'Carnívoro', 'Larvas e juvenis imitam a aparência de algas flutuantes.'),
('Caracol Concha de Olho', 'Conus textile', 'Moluscos', 'Conidae', 'Carnívoro', 'Conhecido como caracol-pano pelo padrão triangular.'),
('Lesma do Mar Dourada', 'Halgerda', 'Moluscos', 'Discodorididae', 'Carnívoro', 'Superfície com saliências e padrões geométricos.'),
('Bivalve Amêijoa Branca', 'Meretrix lyrata', 'Moluscos', 'Veneridae', 'Filtrador', 'Comum em fundos arenosos e estuários.'),
('Caramujo Estrela de Mar', 'Thais haemastoma', 'Moluscos', 'Muricidae', 'Carnívoro', 'Predador de cracas e moluscos em costões.'),
('Lula de Recifes de Coral', 'Loligo vulgaris', 'Moluscos', 'Loliginidae', 'Carnívoro', 'Nadadora ágil com nadadeiras em forma de diamante.'),
('Caracol de Jardim Branco', 'Theba pisana', 'Moluscos', 'Helicidae', 'Herbívoro', 'Costuma subir em plantas para fugir do calor intenso.'),
('Ostra de Água Doce', 'Margaratifera margaritifera', 'Moluscos', 'Margaritiferidae', 'Filtrador', 'Pode viver por várias décadas em rios limpos.'),
('Lesma do Mar Violeta', 'Janthina janthina', 'Moluscos', 'Janthinidae', 'Carnívoro', 'Flutua na superfície usando uma balsa de bolhas.'),
('Caramujo Cônico Imperial', 'Conus imperialis', 'Moluscos', 'Conidae', 'Carnívoro', 'Possui faixas escuras e manchas brancas bem definidas.'),
('Bivalve Castanha de Mar', 'Glycymeris glycymeris', 'Moluscos', 'Glycymerididae', 'Filtrador', 'Concha quase circular e espessa.'),
('Polvo de Pontos Azuis', 'Octopus cyanea', 'Moluscos', 'Octopodidae', 'Carnívoro', 'Ativo durante o dia em recifes de coral.'),
('Lula de Manto Curto', 'Alloteuthis subulata', 'Moluscos', 'Loliginidae', 'Carnívoro', 'Pequena e frequente em águas costeiras.'),
('Caracol de Terra Listado', 'Polymita picta', 'Moluscos', 'Camaenidae', 'Herbívoro', 'Famoso pelas cores vivas e variadas da concha.'),
('Bivalve Penacho', 'Pinna nobilis', 'Moluscos', 'Pinnidae', 'Filtrador', 'Concha grande e triangular fixada no sedimento.'),
('Lesma do Mar Azul Cobalto', 'Hypselodoris', 'Moluscos', 'Chromodorididae', 'Carnívoro', 'Apresenta tons intensos de azul e amarelo.'),
('Caramujo Buzina', 'Cymatium', 'Moluscos', 'Cymatiidae', 'Carnívoro', 'Concha com saliências espirais e abertura espessa.'),
('Mexilhão de Rio Sul Americano', 'Diplodon', 'Moluscos', 'Hyriidae', 'Filtrador', 'Bivalve nativo de rios e lagoas da América do Sul.'),
('Lula de Olhos Grandes', 'Histioteuthis reversa', 'Moluscos', 'Histioteuthidae', 'Carnívoro', 'Um olho é bem maior que o outro para enxergar acima e abaixo.'),
('Caracol de Areia Rosa', 'Polinices mammilla', 'Moluscos', 'Naticidae', 'Carnívoro', 'Concha lisa e arredondada que escava a areia.'),
('Ostra de Fundo Arenoso', 'Ostrea edulis', 'Moluscos', 'Ostreidae', 'Filtrador', 'Espécie tradicional de ostra europeia.'),
('Lesma do Mar Peluda', 'Doto coronata', 'Moluscos', 'Dotidae', 'Carnívoro', 'Possui projeções em formato de clava nas costas.'),
('Caramujo Concha de Concha', 'Xenophora conchyliophora', 'Moluscos', 'Xenophoridae', 'Detritívoro', 'Cola outras conchas e pedrinhas na própria concha.'),
('Bivalve Marisco Faca', 'Solen marginatus', 'Moluscos', 'Solenidae', 'Filtrador', 'Concha estreita e alongada que cava na vertical.'),
('Polvo de Cabeça Grande', 'Bathypolypus arcticus', 'Moluscos', 'Octopodidae', 'Carnívoro', 'Adapta-se a águas frias e profundas.'),
('Lula de Nadadeira Redonda', 'Rossia macrosoma', 'Moluscos', 'Sepiolidae', 'Carnívoro', 'Corpo compacto com nadadeiras arredondadas.'),
('Caracol de Jardim Alemão', 'Arianta arbustorum', 'Moluscos', 'Helicidae', 'Herbívoro', 'Concha moteada em tons de marrom e amarelo.'),
('Bivalve Estrela', 'Pecten jacobaeus', 'Moluscos', 'Pectinidae', 'Filtrador', 'Concha com costelas radiais marcadas.'),
('Lesma do Mar Laranja', 'Triopha catalinae', 'Moluscos', 'Polyceridae', 'Carnívoro', 'Corpo claro com projeções alaranjadas.'),
('Caramujo de Água Doce Ampulária', 'Pomacea canaliculata', 'Moluscos', 'Ampullariidae', 'Herbívoro', 'Forte apetite por plantas aquáticas e arrozais.'),
('Lula de Braços Curtos', 'Sepiola atlantica', 'Moluscos', 'Sepiolidae', 'Carnívoro', 'Enterra-se na areia deixando apenas os olhos à mostra.'),
('Caracol Concha de Tigre', 'Cypraecassis rufa', 'Moluscos', 'Cassidae', 'Carnívoro', 'Concha alaranjada e densa usada em entalhes.'),
('Bivalve Espinho de Mar', 'Spondylus gaederopus', 'Moluscos', 'Spondylidae', 'Filtrador', 'Coberto de espinhos que ajudam na proteção.'),
('Polvo de Pele Lisa', 'Eledone cirrhosa', 'Moluscos', 'Eledoneidae', 'Carnívoro', 'Possui uma única fileira de ventosas em cada braço.'),
('Caramujo de Mangue', 'Littoraria angulifera', 'Moluscos', 'Littorinidae', 'Herbívoro', 'Sobe em troncos e raízes de manguezais.'),
('Lesma do Mar Branca', 'Diaulula sandiegensis', 'Moluscos', 'Discodorididae', 'Carnívoro', 'Corpo claro com anéis ou manchas escuras.'),
('Bivalve Coração de Boi', 'Isocardia', 'Moluscos', 'Glossidae', 'Filtrador', 'Concha bojuda e curvada de águas profundas.'),
('Caracol de Jardim Francês', 'Cornu', 'Moluscos', 'Helicidae', 'Herbívoro', 'Gênero bastante conhecido em jardins e hortas.'),
('Lula de Luz Azul', 'Abraliopsis', 'Moluscos', 'Enoploteuthidae', 'Carnívoro', 'Emite luz azulada na parte inferior para camuflagem.'),
('Caramujo Concha de Sino', 'Turbinella pyrum', 'Moluscos', 'Turbinellidae', 'Carnívoro', 'Concha pesada e alongada usada como instrumento de sopro.'),
('Bivalve Pérola de Rio', 'Unio pictorum', 'Moluscos', 'Unionidae', 'Filtrador', 'Vive enterrado no fundo de rios e lagos.'),
('Lesma do Mar Vermelha', 'Hexabranchus', 'Moluscos', 'Hexabranchidae', 'Carnívoro', 'Gênero famoso pelos movimentos amplos na água.'),
('Caracol de Rocha Escuro', 'Nucella lapillus', 'Moluscos', 'Muricidae', 'Carnívoro', 'Perfura conchas de outros moluscos com sua rádula.'),
('Polvo de Anéis Roxos', 'Hapalochlaena lunulata', 'Moluscos', 'Octopodidae', 'Carnívoro', 'Exibe anéis brilhantes quando se sente ameaçado.'),
('Lula de Cauda Longa', 'Lolliguncula brevis', 'Moluscos', 'Loliginidae', 'Carnívoro', 'Tolera variações maiores de salinidade em águas costeiras.'),
('Caramujo de Jardim Amarelo', 'Cepaea hortensis', 'Moluscos', 'Helicidae', 'Herbívoro', 'Concha de coloração clara em ambientes temperados.'),
('Bivalve Concha de Leque', 'Chlamys islandica', 'Moluscos', 'Pectinidae', 'Filtrador', 'Habita águas frias do Atlântico Norte.'),
('Lesma do Mar Zebra', 'Hypselodoris zebra', 'Moluscos', 'Chromodorididae', 'Carnívoro', 'Listras azuis e amarelas bem contrastantes.'),
('Caramujo Cônico Marfim', 'Conus eburneus', 'Moluscos', 'Conidae', 'Carnívoro', 'Concha branca com pequenas manchas escuras.'),
('Bivalve Marisco Gigante', 'Panopea generosa', 'Moluscos', 'Hiatellidae', 'Filtrador', 'Tem sifão bem longo e pode viver mais de 100 anos.'),
('Polvo de Fundo Arenoso', 'Octopus bimaculoides', 'Moluscos', 'Octopodidae', 'Carnívoro', 'Tem manchas escuras marcantes perto dos olhos.'),
('Lula de Profundidade Média', 'Gonatus fabricii', 'Moluscos', 'Gonatidae', 'Carnívoro', 'Muito comum em águas frias e de meia-profundidade.'),
('Caramujo de Terra Tropical', 'Orthostylus', 'Moluscos', 'Bradybaenidae', 'Herbívoro', 'Espécies terrestres de regiões tropicais.'),
('Bivalve Ostra de Cavalo', 'Atrina rigida', 'Moluscos', 'Pinnidae', 'Filtrador', 'Fixa-se no substrato por filamentos resistentes.'),
('Lesma do Mar Pintada', 'Peltodoris', 'Moluscos', 'Discodorididae', 'Carnívoro', 'Apresenta manchas irregulares sobre o dorso.'),
('Caramujo Buzina do Pacífico', 'Charonia tritonis', 'Moluscos', 'Charoniidae', 'Carnívoro', 'Grande predador de recifes de coral tropicais.'),
('Mexilhão de Água Salobra', 'Mytilopsis leucophaeata', 'Moluscos', 'Mytilidae', 'Filtrador', 'Adapta-se a ambientes onde água doce e salgada se misturam.'),
('Lula de Tentáculos Curtos', 'Sepioloidea lineolata', 'Moluscos', 'Sepiolidae', 'Carnívoro', 'Corpo arredondado com listras escuras e claras.'),
('Caracol Concha de Espinho', 'Murex pecten', 'Moluscos', 'Muricidae', 'Carnívoro', 'Conhecido pela quantidade de espinhos finos.'),
('Bivalve Amêijoa do Mar', 'Ruditapes decussatus', 'Moluscos', 'Veneridae', 'Filtrador', 'Enterra-se em sedimentos arenosos e lodosos.'),
('Polvo de Estufa Comum', 'Octopus vulgaris', 'Moluscos', 'Octopodidae', 'Carnívoro', 'Distribuição ampla em águas temperadas e tropicais.'),
('Caramujo de Jardim Marrom', 'Eobania vermiculata', 'Moluscos', 'Helicidae', 'Herbívoro', 'Concha com faixas amarronzadas e abertura clara.'),
('Lesma do Mar Verde Esmeralda', 'Elysia chlorotica', 'Moluscos', 'Plakobranchidae', 'Herbívoro', 'Mantém cloroplastos funcionais por longos períodos.'),
('Bivalve Concha de Placa', 'Placopecten magellanicus', 'Moluscos', 'Pectinidae', 'Filtrador', 'Bivalve relevante na pesca do Atlântico Noroeste.'),
('Caramujo Cônico Leopardo', 'Conus leopardus', 'Moluscos', 'Conidae', 'Carnívoro', 'Concha grande e pesada com pintas escuras.'),
('Lula de Recifes Tropicais', 'Sepioteuthis', 'Moluscos', 'Loliginidae', 'Carnívoro', 'Gênero de lulas costeiras muito ativas.'),
('Caramujo de Terra Pequeno', 'Zonitoides arboreus', 'Moluscos', 'Gastrodontidae', 'Detritívoro', 'Caracol diminuto comum em solo úmido e madeira em decomposição.'),
('Bivalve Marisco Comum', 'Cerastoderma', 'Moluscos', 'Cardiidae', 'Filtrador', 'Gênero frequente em praias e bancos de areia.'),
('Polvo de Pele Rugosa', 'Octopus maya', 'Moluscos', 'Octopodidae', 'Carnívoro', 'Endêmico da região da península de Yucatán.'),
('Caramujo Buzina Pequeno', 'Nassarius vibex', 'Moluscos', 'Nassariidae', 'Detritívoro', 'Rastreia matéria orgânica no fundo arenoso.'),
('Lesma do Mar Listrada', 'Chromodoris', 'Moluscos', 'Chromodorididae', 'Carnívoro', 'Gênero rico em espécies coloridas de recifes.'),
('Bivalve Ostra de Manguezal', 'Crassostrea gasar', 'Moluscos', 'Ostreidae', 'Filtrador', 'Comum em estuários e raízes de mangue.'),
('Caramujo Concha de Cone', 'Conus', 'Moluscos', 'Conidae', 'Carnívoro', 'Gênero amplo de gastrópodes marinhos predadores.'),
('Lula de Profundidade Escura', 'Vampyroteuthis', 'Moluscos', 'Vampyroteuthidae', 'Detritívoro', 'Habita zonas de mínimo oxigênio no oceano profundo.'),
('Caramujo de Jardim Cinza', 'Helicigona lapicida', 'Moluscos', 'Helicidae', 'Herbívoro', 'Concha achatada com quilha marcante na borda.'),
('Bivalve Concha de Vela', 'Pecten', 'Moluscos', 'Pectinidae', 'Filtrador', 'Gênero clássico de vieiras.'),
('Lesma do Mar Azul Turquesa', 'Felimare', 'Moluscos', 'Chromodorididae', 'Carnívoro', 'Apresenta tons vibrantes de azul e linhas marcadas.'),
('Caramujo de Água Doce Pequeno', 'Planorbarius corneus', 'Moluscos', 'Planorbidae', 'Herbívoro', 'Concha enrolada no mesmo plano, como uma espiral plana.'),
('Bivalve Marisco de Areia', 'Mya arenaria', 'Moluscos', 'Myaidae', 'Filtrador', 'Vive enterrado fundo na areia ou lama costeira.'),
('Polvo de Braços Longos', 'Abdopus aculeatus', 'Moluscos', 'Octopodidae', 'Carnívoro', 'Habita planícies de maré com algas e ervas marinhas.'),
('Caramujo Concha de Pérola', 'Turbo', 'Moluscos', 'Turbinidae', 'Herbívoro', 'Concha robusta e brilhante por dentro.'),
('Lula de Olhos Telescópicos', 'Bathothauma lyromma', 'Moluscos', 'Cranchiidae', 'Carnívoro', 'Olhos voltados para cima em formato alongado.'),
('Caramujo de Terra de Folhiço', 'Discus rotundatus', 'Moluscos', 'Discidae', 'Detritívoro', 'Concha achatada e listrada encontrada sob folhas.'),
('Bivalve Mexilhão de Rocha', 'Perna perna', 'Moluscos', 'Mytilidae', 'Filtrador', 'Muito presente em costões rochosos.'),
('Lesma do Mar Rosada', 'Flabellinopsis', 'Moluscos', 'Coryphellidae', 'Carnívoro', 'Nudibrânquio de cores vivas associado a hidrozoários.'),
('Caramujo Buzina de Areia', 'Polinices hepaticus', 'Moluscos', 'Naticidae', 'Carnívoro', 'Predador que caça outros moluscos no sedimento.'),
('Bivalve Concha de Leque Gigante', 'Amusium pleuronectes', 'Moluscos', 'Pectinidae', 'Filtrador', 'Concha fina e leve capaz de nadar com facilidade.'),
('Polvo de Profundidade Tropical', 'Grimpoteuthis bathynectes', 'Moluscos', 'Opisthoteuthidae', 'Carnívoro', 'Vive em grandes profundidades oceânicas.'),
('Nudibrânquio Espanhol', 'Flabellina affinis', 'Moluscos', 'Flabellinidae', 'Carnívoro', 'Apresenta ceratas violetas e corpo translúcido em recifes.'),
('Lesma do Mar Arco Íris', 'Dendronotus iris', 'Moluscos', 'Dendronotidae', 'Carnívoro', 'Nada com movimentos laterais rápidos usando o corpo.'),
('Nudibrânquio Tigre', 'Felimare tricolor', 'Moluscos', 'Chromodorididae', 'Carnívoro', 'Exibe faixas longitudinais azuis, brancas e amarelas.'),
('Lesma do Mar Coroa', 'Hermissenda crassicornis', 'Moluscos', 'Facelinidae', 'Carnívoro', 'Tem ceratas coloridas e é muito estudada em neurobiologia.'),
('Nudibrânquio Peludo', 'Aeolidia papillosa', 'Moluscos', 'Aeolidiidae', 'Carnívoro', 'Alimenta-se de anêmonas e reaproveita nematocistos para defesa.'),
('Lesma do Mar Folha', 'Phyllidia varicosa', 'Moluscos', 'Phyllidiidae', 'Carnívoro', 'Possui tubérculos rígidos e não possui brânquia dorsal externa.'),
('Nudibrânquio Azul Elétrico', 'Hypselodoris kanga', 'Moluscos', 'Chromodorididae', 'Carnívoro', 'Destaca-se pelo azul intenso com manchas amarelas.'),
('Lesma do Mar Mancha Roxa', 'Diaulula odonoghuei', 'Moluscos', 'Discodorididae', 'Carnívoro', 'Corpo amarelado com manchas escuras discretas.'),
('Nudibrânquio Pálido', 'Archidoris pseudoargus', 'Moluscos', 'Dorididae', 'Carnívoro', 'Dorso coberto por pequenos tubérculos sensoriais.'),
('Lesma do Mar Cristal', 'Hypselodoris jacksonianae', 'Moluscos', 'Chromodorididae', 'Carnívoro', 'Apresenta bordas claras e listras longitudinais vivas.'),
('Nudibrânquio Estrela Azul', 'Chromodoris willani', 'Moluscos', 'Chromodorididae', 'Carnívoro', 'Comum em recifes do Indo-Pacífico com tons azuis e pretos.'),
('Lesma do Mar Coral', 'Goniobranchus kuniei', 'Moluscos', 'Chromodorididae', 'Carnívoro', 'Exibe manchas alaranjadas e borda roxa chamativa.'),
('Nudibrânquio Flamejante', 'Goniobranchus coi', 'Moluscos', 'Chromodorididae', 'Carnívoro', 'Combina tons de rosa, branco e alaranjado nos recifes.'),
('Lesma do Mar Pérola', 'Goniobranchus geminus', 'Moluscos', 'Chromodorididae', 'Carnívoro', 'Possui pontuações claras em fundo escuro.'),
('Nudibrânquio Veludo', 'Doriprismatica atromarginata', 'Moluscos', 'Chromodorididae', 'Carnívoro', 'Corpo amarelo-claro com margem escura bem definida.'),
('Lesma do Mar Flor', 'Glossodoris rufomarginata', 'Moluscos', 'Chromodorididae', 'Carnívoro', 'Margem avermelhada contrasta com o corpo claro.'),
('Nudibrânquio Sol', 'Mexichromis multituberculata', 'Moluscos', 'Chromodorididae', 'Carnívoro', 'Pequeno e colorido, vive em fundos rochosos e recifais.'),
('Lesma do Mar Esponja', 'Rostanga pulchra', 'Moluscos', 'Rostangidae', 'Carnívoro', 'Possui coloração avermelhada que se camufla em esponjas.'),
('Nudibrânquio Pluma', 'Melibe leonina', 'Moluscos', 'Tethydidae', 'Carnívoro', 'Tem capuz bucal largo que funciona como rede para capturar presas.'),
('Lesma do Mar Fantasma', 'Melibe viridis', 'Moluscos', 'Tethydidae', 'Carnívoro', 'Corpo semiesverdeado translúcido com apêndices ramificados.'),
('Nudibrânquio Dragão Anão', 'Pteraeolidia ianthina', 'Moluscos', 'Facelinidae', 'Carnívoro', 'Mantém algas simbióticas em suas ceratas alongadas.'),
('Lesma do Mar Renda', 'Trapania reticulata', 'Moluscos', 'Goniodorididae', 'Carnívoro', 'Apresenta rede escura sobre fundo claro.'),
('Nudibrânquio Chifre', 'Okenia elegans', 'Moluscos', 'Goniodorididae', 'Carnívoro', 'Possui projeções finas e alongadas ao redor do corpo.'),
('Lesma do Mar Bolha', 'Hydatina physis', 'Moluscos', 'Aplustridae', 'Carnívoro', 'Concha fina e listrada que abriga o corpo mole.'),
('Bolha do Mar Pintada', 'Micromelo undatus', 'Moluscos', 'Aplustridae', 'Carnívoro', 'Concha translúcida com linhas escuras onduladas.'),
('Lesma Cabeça de Martelo', 'Navanax inermis', 'Moluscos', 'Aglajidae', 'Carnívoro', 'Segue rastros de muco de outras lesmas marinhas para caçar.'),
('Lesma do Mar Sapato', 'Phidiana lynceus', 'Moluscos', 'Facelinidae', 'Carnívoro', 'Exibe linha branca na cabeça e ceratas alaranjadas.'),
('Lesma do Mar Brilho', 'Cuthona fulgens', 'Moluscos', 'Tergipedidae', 'Carnívoro', 'Pequena e colorida, associa-se a colônias de hidrozoários.'),
('Lesma do Mar Coral Rosa', 'Phidiana hiltoni', 'Moluscos', 'Facelinidae', 'Carnívoro', 'Comum em zonas entremarés e poças de maré.'),
('Lesma do Mar Fita', 'Pleurobranchaea maculata', 'Moluscos', 'Pleurobranchaeidae', 'Carnívoro', 'Possui brânquia lateral e dieta predadora variada.'),
('Caracol Cone Geográfico', 'Conus striatus', 'Moluscos', 'Conidae', 'Carnívoro', 'Caça peixes utilizando dardos com neurotoxinas.'),
('Caracol Cone Letrado', 'Conus litteratus', 'Moluscos', 'Conidae', 'Carnívoro', 'Concha branca com fileiras de pontos escuros.'),
('Caracol Cone Príncipe', 'Conus princeps', 'Moluscos', 'Conidae', 'Carnívoro', 'Concha com listras longitudinais escuras.'),
('Caracol Cone Rainha', 'Conus regius', 'Moluscos', 'Conidae', 'Carnívoro', 'Habita recifes tropicais e áreas rochosas.'),
('Caracol Cone Betulinus', 'Conus betulinus', 'Moluscos', 'Conidae', 'Carnívoro', 'Concha robusta e amarelada com manchas espirais.'),
('Caracol Cone Virgem', 'Conus virgo', 'Moluscos', 'Conidae', 'Carnívoro', 'Concha clara com base escura característica.'),
('Caracol Cone General', 'Conus generalis', 'Moluscos', 'Conidae', 'Carnívoro', 'Apresenta faixas coloridas e concha cônica alongada.'),
('Caracol Cone Capitão', 'Conus capitaneus', 'Moluscos', 'Conidae', 'Carnívoro', 'Concha esverdeada ou amarronzada com faixas claras.'),
('Caracol Cone Marmoreado', 'Conus caracteristicus', 'Moluscos', 'Conidae', 'Carnívoro', 'Padrão reticulado escuro sobre fundo claro.'),
('Caracol Cone Bandido', 'Conus vexillum', 'Moluscos', 'Conidae', 'Carnívoro', 'Concha grande e pesada de recifes do Indo-Pacífico.'),
('Búzio de Porcelana', 'Cypraea arabica', 'Moluscos', 'Cypraeidae', 'Onívoro', 'Concha brilhante com desenhos que lembram escrita.'),
('Búzio Moeda', 'Monetaria moneta', 'Moluscos', 'Cypraeidae', 'Herbívoro', 'Historicamente usado como moeda em trocas comerciais.'),
('Búzio Anel', 'Monetaria annulus', 'Moluscos', 'Cypraeidae', 'Herbívoro', 'Apresenta um anel claro marcante no dorso.'),
('Búzio Cervinho', 'Cypraea cervus', 'Moluscos', 'Cypraeidae', 'Onívoro', 'Uma das maiores espécies de cipreídeos, com pintas claras.'),
('Búzio Mapa', 'Leporicypraea mappa', 'Moluscos', 'Cypraeidae', 'Onívoro', 'Concha com linhas finas que lembram um mapa.'),
('Búzio Talpa', 'Talparia talpa', 'Moluscos', 'Cypraeidae', 'Carnívoro', 'Concha alongada com faixas castanhas.'),
('Búzio Maurício', 'Mauritia mauritiana', 'Moluscos', 'Cypraeidae', 'Onívoro', 'Base escura e dorso marrom com manchas claras.'),
('Búzio Carneiro', 'Cypraea zebra', 'Moluscos', 'Cypraeidae', 'Onívoro', 'Concha alongada com manchas claras em fundo escuro.'),
('Murex Espinhoso', 'Murex tribulus', 'Moluscos', 'Muricidae', 'Carnívoro', 'Concha coberta de espinhos finos e alongados.'),
('Murex Tintura', 'Bolinus brandaris', 'Moluscos', 'Muricidae', 'Carnívoro', 'Relacionado historicamente à obtenção de pigmento púrpura.'),





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
('Água viva do pacífico', 'Chrysaora fuscescens', 'Cnidário', 'Pelagiidae', 'Carnívoro', 'Apresenta um sino marrom-dourado e tentáculos longos e finos muito comuns na costa do Pacífico.'),
('Coral cérebro comum', 'Diploria labyrinthiformis', 'Cnidário', 'Faviidae', 'Carnívoro', 'Forma colônias arredondadas com sulcos profundos e tortuosos que lembram a superfície cerebral.'),
('Anêmona de maré vermelha', 'Actinia tenebrosa', 'Cnidário', 'Actiniidae', 'Carnívoro', 'Espécie de coloração vermelho-escura intensa, frequente em fendas e rochas de zonas entremarés.'),
('Água viva borboleta', 'Porpita porpita', 'Cnidário', 'Porpitidae', 'Carnívoro', 'Colônia flutuante em forma de disco dourado ou azulado circundada por tentáculos curtos.'),
('Coral chifre de veado ramificado', 'Acropora cervicornis', 'Cnidário', 'Acroporidae', 'Carnívoro', 'Cresce em ramos cilíndricos alongados que formam emaranhados importantes nos recifes rasos.'),
('Anêmona estrela do golfo', 'Bunodosoma cavernata', 'Cnidário', 'Actiniidae', 'Carnívoro', 'Possui coluna coberta por verrugas adesivas que ajudam a fixar grãos de areia e fragmentos.'),
('Água viva lunar', 'Aurelia labiata', 'Cnidário', 'Ulmaridae', 'Carnívoro', 'Medusa translúcida com quatro estruturas em formato de ferradura ou anel visíveis no centro do sino.'),
('Coral couve-flor de recife', 'Pocillopora meandrina', 'Cnidário', 'Pocilloporidae', 'Carnívoro', 'Colônia robusta de ramos curtos e arredondados que suporta bem ondas fortes.'),
('Anêmona do fundo arenoso', 'Cerianthus lloydii', 'Cnidário', 'Cerianthidae', 'Carnívoro', 'Habita fundos moles construindo um tubo protetor de muco e sedimento de onde estende os tentáculos.'),
('Água viva de sino transparente', 'Clytia hemisphaerica', 'Cnidário', 'Campanulariidae', 'Carnívoro', 'Pequena hidromedusa transparente muito utilizada em estudos de desenvolvimento e biologia celular.'),
('Coral cérebro liso', 'Diploria clivosa', 'Cnidário', 'Faviidae', 'Carnívoro', 'Apresenta relevo ondulado mais suave em comparação a outras espécies de corais-cérebro.'),
('Anêmona verde de recife', 'Stichodactyla mertensii', 'Cnidário', 'Stichodactylidae', 'Carnívoro', 'Grande anêmona de disco largo com verrugas na face inferior e associação frequente com peixes-palhaço.'),
('Água viva bola de fogo', 'Chrysaora colorata', 'Cnidário', 'Pelagiidae', 'Carnívoro', 'Destaca-se por listras radiais marcantes e tons alaranjados ou arroxeados no sino.'),
('Coral dedo de luva', 'Alcyonium glomeratum', 'Cnidário', 'Alcyoniidae', 'Carnívoro', 'Coral mole de águas frias com projeções lobadas avermelhadas ou rosadas.'),
('Anêmona de rocha costeira', 'Anthopleura artemisia', 'Cnidário', 'Actiniidae', 'Carnívoro', 'Costuma viver parcialmente enterrada na areia junto a rochas, exibindo tentáculos listrados ou pontuados.'),
('Água viva lanterna do abismo', 'Atolla vanhoeffeni', 'Cnidário', 'Atollidae', 'Carnívoro', 'Medusa de águas profundas com sulco coronal pronunciado e emissão de luz azul em padrão circular.'),
('Coral prato de recife', 'Agaricia agaricites', 'Cnidário', 'Agariciidae', 'Carnívoro', 'Forma placas ou lâminas foliáceas finas com pequenas cristas paralelas onde se alojam os pólipos.'),
('Anêmona de tentáculos curtos', 'Phymanthus pulcher', 'Cnidário', 'Phymanthidae', 'Carnívoro', 'Apresenta borda repleta de tentáculos pequenos e disco oral decorado com padrões variados.'),
('Água viva guarda-chuva azul', 'Cyanea capillata', 'Cnidário', 'Cyaneidae', 'Carnívoro', 'Variante de grande porte com tons azulados e longos tentáculos especializados na captura de presas.'),
('Coral estrela grande', 'Montastraea cavernosa', 'Cnidário', 'Faviidae', 'Carnívoro', 'Possui coralitos grandes e salientes, sendo comum em diferentes profundidades de recifes tropicais.'),
('Anêmona do manguezal', 'Aiptasia pallida', 'Cnidário', 'Aiptasiidae', 'Carnívoro', 'Espécie resistente que se propaga com facilidade por divisão longitudinal e laceração pedal.'),
('Água viva de cauda longa', 'Chrysaora achlyos', 'Cnidário', 'Pelagiidae', 'Carnívoro', 'Medusa de grandes dimensões e coloração escura, com apêndices orais extensos e ondulados.'),
('Coral mesa gigante', 'Acropora cytherea', 'Cnidário', 'Acroporidae', 'Carnívoro', 'Constrói mesas largas e horizontais formadas por uma rede densa de ramificações finas.'),
('Anêmona de maré rochosa', 'Actinia equina', 'Cnidário', 'Actiniidae', 'Carnívoro', 'Encontrada em costões rochosos, fecha-se como uma bolha compacta quando exposta ao ar.'),
('Água viva capacete profundo', 'Periphylla periphylla', 'Cnidário', 'Periphyllidae', 'Carnívoro', 'Habita grandes profundidades oceânicas, apresentando sino alto e pigmentação escura protetora.'),
('Coral chifre de alce tropical', 'Acropora palmata', 'Cnidário', 'Acroporidae', 'Carnívoro', 'Possui ramos largos e achatados que lembram galhadas e absorvem grande energia das ondas.'),
('Anêmona tapete do pacífico', 'Stichodactyla haddoni', 'Cnidário', 'Stichodactylidae', 'Carnívoro', 'Espécie de disco espesso e pegajoso que serve de abrigo para diversas espécies de peixes-palhaço.'),
('Água viva disco dourado', 'Chrysaora fuscescens', 'Cnidário', 'Pelagiidae', 'Carnívoro', 'Comum em águas costeiras temperadas, apresenta sino acastanhado e braços orais elaborados.'),
('Coral cérebro sulcado', 'Pseudodiploria clivosa', 'Cnidário', 'Faviidae', 'Carnívoro', 'Forma colônias resistentes com canais sinuosos que ajudam na estruturação do recife.'),
('Anêmona solitária da areia', 'Edwardsia sipunculoides', 'Cnidário', 'Edwardsiidae', 'Carnívoro', 'Vive enterrada em sedimentos finos e estende os tentáculos para capturar pequenos invertebrados.'),
('Água viva sino de cristal', 'Aequorea victoria', 'Cnidário', 'Aequoreidae', 'Carnívoro', 'Hidromedusa transparente conhecida pela presença de fotoproteínas e proteína verde fluorescente.'),
('Coral leque roxo', 'Gorgonia ventalina', 'Cnidário', 'Gorgoniidae', 'Carnívoro', 'Forma uma rede ramificada e achatada, geralmente em tons de roxo ou lilás, em recifes rasos.'),
('Anêmona de poça de maré', 'Anthopleura xanthogrammica', 'Cnidário', 'Actiniidae', 'Carnívoro', 'Exibe disco oral largo e tentáculos que adquirem tom verde intenso graças às microalgas simbióticas.'),
('Água viva de coroa escura', 'Atolla wyvillei', 'Cnidário', 'Atollidae', 'Carnívoro', 'Espécie batipelágica que utiliza flashes luminosos como mecanismo de defesa contra predadores.'),
('Coral bolha translúcido', 'Plerogyra sinuosa', 'Cnidário', 'Euphylliidae', 'Carnívoro', 'Desenvolve estruturas globosas túrgidas que protegem os pólipos durante o período diurno.'),
('Anêmona tubo de areia', 'Cerianthus membranaceus', 'Cnidário', 'Cerianthidae', 'Carnívoro', 'Mantém o corpo protegido dentro de um tubo fibroso enterrado no fundo marinho.'),
('Água viva flor de cera', 'Cassiopea frondosa', 'Cnidário', 'Cassiopeidae', 'Carnívoro', 'Medusa bentônica que repousa invertida no fundo, expondo apêndices ricos em algas simbióticas.'),
('Coral martelo verde', 'Euphyllia ancora', 'Cnidário', 'Euphylliidae', 'Carnívoro', 'Exibe pólipos com extremidades em forma de âncora que frequentemente apresentam fluorescência verde.'),
('Anêmona de recife vermelha', 'Condylactis gigantea', 'Cnidário', 'Actiniidae', 'Carnívoro', 'Apresenta coluna robusta e tentáculos longos com pontas contrastantes em recifes tropicais.'),
('Água viva cometa vermelha', 'Tiburonia granrojo', 'Cnidário', 'Ulmaridae', 'Carnívoro', 'Medusa de águas profundas sem tentáculos filamentosos, com corpo espesso de tom avermelhado.'),
('Coral dedo de recife', 'Porites porites', 'Cnidário', 'Poritidae', 'Carnívoro', 'Cresce em ramos curtos e arredondados que formam moitas compactas em áreas protegidas.'),
('Anêmona listrada branca e verde', 'Diadumene lineata', 'Cnidário', 'Haliplanellidae', 'Carnívoro', 'Pequena anêmona de ampla distribuição costeira, reconhecida pelas faixas longitudinais claras e escuras.'),
('Água viva véu de noiva tropical', 'Olindias sambaquiensis', 'Cnidário', 'Olindiidae', 'Carnívoro', 'Hidromedusa delicada com tentáculos marginados por nematocistos dispostos em anéis.'),
('Coral cérebro maciço', 'Colpophyllia natans', 'Cnidário', 'Faviidae', 'Carnívoro', 'Forma domos calcários volumosos com vales largos e sinuosos na superfície da colônia.'),
('Anêmona de rocha pegajosa', 'Bunodosoma caissorum', 'Cnidário', 'Actiniidae', 'Carnívoro', 'Comum em costões do Atlântico Sul, apresenta verrugas que retêm detritos e fragmentos de conchas.'),
('Água viva balão azul', 'Catostylus mosaicus', 'Cnidário', 'Catostylidae', 'Carnívoro', 'Medusa robusta de águas costeiras e estuarinas com sino firme e tons variáveis.'),
('Coral couve-flor ramificado', 'Pocillopora damicornis', 'Cnidário', 'Pocilloporidae', 'Carnívoro', 'Forma colônias densas e ramificadas que oferecem refúgio para peixes e crustáceos.'),
('Anêmona de fogo tropical', 'Actinodendron arboreum', 'Cnidário', 'Actinodendridae', 'Carnívoro', 'Possui tentáculos muito ramificados, semelhantes a pequenas árvores, com potentes células urticantes.'),
('Água viva cauda de cavalo atlântica', 'Dactylometra quinquecirrha', 'Cnidário', 'Pelagiidae', 'Carnívoro', 'Apresenta sino com manchas radiais e longos tentáculos que causam irritação intensa ao contato.'),
('Coral folha de alface', 'Undaria tenuifolia', 'Cnidário', 'Agariciidae', 'Carnívoro', 'Desenvolve lâminas delgadas e onduladas que se sobrepõem formando estruturas foliáceas.'),
('Anêmona de vidro translúcida', 'Exaiptasia diaphana', 'Cnidário', 'Aiptasiidae', 'Carnívoro', 'Corpo semies透明 e alongado, bastante empregado em pesquisas sobre simbiose com zooxantelas.'),
('Água viva púrpura do mar', 'Chrysaora hysosella', 'Cnidário', 'Pelagiidae', 'Carnívoro', 'Exibe marcas em formato de V no sino e tentáculos longos adaptados à captura de zooplâncton.'),
('Coral bambu de profundidade', 'Isidis hippuris', 'Cnidário', 'Isididae', 'Carnívoro', 'Possui esqueleto articulado composto por segmentos calcários alternados com material proteico flexível.'),
('Anêmona plumosa gigante', 'Metridium senile', 'Cnidário', 'Metridiidae', 'Carnívoro', 'Pode atingir grande porte em águas frias, exibindo coroa densa de tentáculos finos como penas.'),
('Coral prato ondulado', 'Mycedium elephantotus', 'Cnidário', 'Agariciidae', 'Carnívoro', 'Forma grandes lâminas ou pratos calcários com superfície rugosa e bordas recortadas.'),
('Água viva sino adesivo', 'Gonionemus vertens', 'Cnidário', 'Olindiidae', 'Carnívoro', 'Pequena hidromedusa capaz de aderir a superfícies submersas usando estruturas adesivas nos tentáculos.'),
('Coral estrela de recife', 'Montastraea annularis', 'Cnidário', 'Faviidae', 'Carnívoro', 'Constrói colônias em forma de colunas ou lóbulos arredondados que compõem a estrutura do recife.'),
('Anêmona morango de águas frias', 'Corynactis californica', 'Cnidário', 'Corallimorphidae', 'Carnívoro', 'Forma densas colônias coloridas em paredões rochosos, com pontas dos tentáculos esféricas.'),
('Água viva fantasma abissal', 'Stygiomedusa gigantea', 'Cnidário', 'Ulmaridae', 'Carnívoro', 'Medusa rara de grandes profundidades dotada de braços orais longos e achatados semelhantes a fitas.'),
('Coral chifre de veado colorido', 'Acropora millepora', 'Cnidário', 'Acroporidae', 'Carnívoro', 'Forma colônias ramificadas compactas com variação cromática expressiva em recifes tropicais.'),
('Anêmona dourada de recife', 'Condylactis gigantea aurea', 'Cnidário', 'Actiniidae', 'Carnívoro', 'Apresenta tentáculos alongados de coloração amarelada ou dourada em ambientes recifais.'),
('Água viva flor de lótus manchada', 'Mastigias albipunctatus', 'Cnidário', 'Mastigiidae', 'Carnívoro', 'Caracteriza-se por manchas claras na superfície do sino e relação simbiótica com algas fotossintéticas.'),
('Coral cérebro estriado', 'Pseudodiploria strigosa', 'Cnidário', 'Faviidae', 'Carnívoro', 'Apresenta cristas e sulcos marcantes que conferem resistência mecânica em recifes tropicais.'),
('Anêmona de maré estuarina', 'Nematostella vectensis', 'Cnidário', 'Edwardsiidae', 'Carnívoro', 'Habita poças salobras e estuários, sendo um importante modelo experimental em biologia evolutiva.'),
('Água viva guarda-sol pelágica', 'Rhizostoma luteum', 'Cnidário', 'Rhizostomatidae', 'Carnívoro', 'Medusa oceânica de porte considerável com braços orais ramificados e sem tentáculos na borda do sino.'),
('Coral couve em placas', 'Montipora capricornis', 'Cnidário', 'Acroporidae', 'Carnívoro', 'Cresce formando placas ou espirais sobrepostas, sendo comum em recifes e sistemas marinhos.'),
('Anêmona incubadora', 'Epiactis prolifera', 'Cnidário', 'Actiniidae', 'Carnívoro', 'Retém seus filhotes fixos à parede externa do corpo até atingirem estágio mais avançado.'),
('Água viva bolha translúcida', 'Chrysaora pacifica', 'Cnidário', 'Pelagiidae', 'Carnívoro', 'Possui sino translúcido com padrão radial discreto e tentáculos filamentosos alongados.'),
('Coral cérebro labirinto profundo', 'Diploria labyrinthiformis', 'Cnidário', 'Faviidae', 'Carnívoro', 'Desenvolve esqueletos calcários densos com sulcos contínuos em recifes tropicais e subtropicais.'),
('Anêmona joia colorida', 'Corynactis viridis', 'Cnidário', 'Corallimorphidae', 'Carnívoro', 'Espécie colonial pequena de cores vivas que forra rochas submersas em locais de menor incidência de luz.'),
('Água viva cristalina', 'Aequorea forskalea', 'Cnidário', 'Aequoreidae', 'Carnívoro', 'Apresenta sino transparente em forma de campânula com canais radiais bem nítidos.'),
('Coral orelha de recife', 'Mycedium elephantotus', 'Cnidário', 'Agariciidae', 'Carnívoro', 'Forma lâminas largas e onduladas com pólipos dispostos de modo a acompanhar o crescimento da borda.'),
('Anêmona cravo ornamental', 'Phymanthus crucifer', 'Cnidário', 'Phymanthidae', 'Carnívoro', 'Destaca-se pelo disco oral colorido com desenhos geométricos e tentáculos curtos marginais.'),
('Água viva cometa abissal', 'Tiburonia granrojo', 'Cnidário', 'Ulmaridae', 'Carnívoro', 'Habita grandes profundidades oceânicas, exibindo coloração vermelho-escura intensa e estrutura robusta.'),
('Coral cérebro comum de recife', 'Pseudodiploria strigosa', 'Cnidário', 'Faviidae', 'Carnívoro', 'Espécie construtora de recifes com sulcos sinuosos bem definidos e alta tolerância ambiental.'),
('Anêmona do mangue de bojos', 'Bunodeopsis globulifera', 'Cnidário', 'Boloceroididae', 'Carnívoro', 'Pequena anêmona associada a raízes de mangue e áreas costeiras abrigadas com projeções arredondadas.'),
('Água viva sino de alga', 'Gonionemus vertens', 'Cnidário', 'Olindiidae', 'Carnívoro', 'Pequena medusa costeira que se prende a vegetação submersa por meio de ventosas tentaculares.'),
('Coral flor de pedra anguloso', 'Mussa angulosa', 'Cnidário', 'Mussidae', 'Carnívoro', 'Apresenta pólipos grandes e carnosos sobre esqueletos angulosos em recifes tropicais.'),
('Anêmona de poça verde', 'Anthopleura sola', 'Cnidário', 'Actiniidae', 'Carnívoro', 'Habita poças de maré rochosas, exibindo tentáculos grossos e coloração esverdeada.'),
('Água viva guarda-sol grande', 'Rhizostoma luteum', 'Cnidário', 'Rhizostomatidae', 'Carnívoro', 'Medusa de grande porte em águas abertas, com braços orais ramificados e filtração de pequenas presas.'),
('Coral pedra-cérebro', 'Colpophyllia natans', 'Cnidário', 'Faviidae', 'Carnívoro', 'Forma grandes massas calcárias arredondadas com sulcos profundos que contribuem para o recife.'),
('Anêmona estrela de estuário', 'Nematostella vectensis', 'Cnidário', 'Edwardsiidae', 'Carnívoro', 'Tolera amplas variações de salinidade e temperatura em ambientes costeiros rasos.'),
('Água viva bolha do pacífico', 'Chrysaora pacifica', 'Cnidário', 'Pelagiidae', 'Carnívoro', 'Apresenta sino claro com marcas radiais suaves e tentáculos longos e finos.'),
('Coral couve verde em lâminas', 'Montipora capricornis', 'Cnidário', 'Acroporidae', 'Carnívoro', 'Forma lâminas ou espirais sobrepostas com superfície porosa característica do gênero.'),
('Anêmona flamejante de águas frias', 'Epiactis prolifera', 'Cnidário', 'Actiniidae', 'Carnívoro', 'Protege os jovens mantendo-os aderidos à coluna externa do corpo durante o desenvolvimento inicial.'),
('Água viva véu de noiva costeiro', 'Olindias sambaquiensis', 'Cnidário', 'Olindiidae', 'Carnívoro', 'Hidromedusa translúcida de águas rasas e estuários com tentáculos finos e sensíveis.'),
('Coral cérebro estrelado grande', 'Montastraea annularis', 'Cnidário', 'Faviidae', 'Carnívoro', 'Forma colônias colunares ou lobadas que ajudam a sustentar a estrutura tridimensional dos recifes.'),
('Anêmona rosa de costão', 'Actinia equina rosea', 'Cnidário', 'Actiniidae', 'Carnívoro', 'Variedade de tom rosado intenso que retrai os tentáculos quando exposta na maré baixa.'),
('Água viva fantasma de profundidade', 'Stygiomedusa gigantea', 'Cnidário', 'Ulmaridae', 'Carnívoro', 'Espécie de águas profundas com longos apêndices orais em formato de fita.'),
('Coral chifre de veado azulado', 'Acropora millepora', 'Cnidário', 'Acroporidae', 'Carnívoro', 'Forma colônias ramificadas densas que podem apresentar tons azulados, verdes ou alaranjados.'),
('Anêmona dourada de recife tropical', 'Condylactis gigantea aurea', 'Cnidário', 'Actiniidae', 'Carnívoro', 'Exibe tentáculos longos em tons de amarelo ou dourado com extremidades contrastantes.'),
('Água viva flor de lótus tropical', 'Mastigias albipunctatus', 'Cnidário', 'Mastigiidae', 'Carnívoro', 'Possui manchas brancas no sino e obtém parte de sua energia por meio de algas simbióticas.'),
('Coral cérebro rugoso de recife', 'Diploria clivosa', 'Cnidário', 'Faviidae', 'Carnívoro', 'Forma colônias maciças ou incrustantes de superfície ondulada em áreas de correnteza.'),
('Anêmona de tentáculo longo da areia', 'Macrodactyla doreensis', 'Cnidário', 'Actiniidae', 'Carnívoro', 'Vive em fundos arenosos ou lodosos e estende tentáculos compridos de ponta levemente arredondada.'),
('Água viva lunar do atlântico', 'Aurelia aurita', 'Cnidário', 'Ulmaridae', 'Carnívoro', 'Medusa translúcida com quatro anéis gonadais visíveis e margem bordada por tentáculos curtos.'),
('Coral cérebro sinuoso', 'Diploria labyrinthiformis', 'Cnidário', 'Faviidae', 'Carnívoro', 'Constrói esqueletos calcários duros com sulcos profundos e contínuos em recifes tropicais.'),
('Anêmona vermelha de costão', 'Actinia equina', 'Cnidário', 'Actiniidae', 'Carnívoro', 'Fixa-se em rochas costeiras e recolhe os tentáculos quando a maré baixa.'),
('Água viva juba de leão gigante', 'Cyanea capillata', 'Cnidário', 'Cyaneidae', 'Carnívoro', 'Uma das maiores medusas do mundo, com sino largo e grande quantidade de tentáculos longos.'),
('Coral cérebro de recife', 'Meandrina meandrites', 'Cnidário', 'Meandrinidae', 'Carnívoro', 'Forma colônias com sulcos sinuosos marcantes que lembram a superfície de um cérebro.'),
('Vespa-do-mar tropical', 'Chironex fleckeri', 'Cnidário', 'Chirodropidae', 'Carnívoro', 'Cubozoário de águas tropicais do Indo-Pacífico conhecido por sua potente peçonha.'),
('Hidra verde de água doce', 'Hydra viridissima', 'Cnidário', 'Hydridae', 'Carnívoro', 'Pequeno pólipo de água doce fixo à vegetação aquática, com coloração esverdeada por algas simbióticas.'),
('Coral chifre de alce', 'Acropora palmata', 'Cnidário', 'Acroporidae', 'Carnívoro', 'Coral ramificado de grande importância ecológica na proteção costeira contra ondas fortes.'),
('Anêmona gigante de carpete', 'Stichodactyla gigantea', 'Cnidário', 'Stichodactylidae', 'Carnívoro', 'Abriga peixes-palhaço em relação de mutualismo em recifes rasos.'),
('Água viva comum', 'Aurelia alba', 'Cnidário', 'Ulmaridae', 'Carnívoro', 'Medusa pelágica com sino translúcido, canais radiais visíveis e tentáculos marginais adaptados à captura de presas. Apresenta nematocistos especializados para imobilizar pequenas presas.'),
('Coral azulada', 'Acropora australis', 'Cnidário', 'Acroporidae', 'Carnívoro', 'Coral construtor de recifes com esqueleto calcário ramificado que abriga diversidade marinha em águas tropicais. Desenvolve-se em águas bem oxigenadas com movimentação constante da água.'),
('Anêmona noturna', 'Actinia simplex', 'Cnidário', 'Actiniidae', 'Carnívoro', 'Pólipo solitário de costão rochoso que fixa sua base ao substrato e recolhe os tentáculos na maré baixa. Possui simetria radial característica do filo e respostas rápidas a estímulos.'),
('Água viva ondulada', 'Chrysaora profunda', 'Cnidário', 'Pelagiidae', 'Carnívoro', 'Medusa costeira de sino ornamentado e tentáculos longos que atuam na defesa e captura de zooplâncton. Contribui para a dinâmica trófica local ao alimentar-se de organismos planctônicos.'),
('Coral atlântica', 'Montipora viridis', 'Cnidário', 'Acroporidae', 'Carnívoro', 'Coral de crescimento incrustante, laminar ou ramificado com coralitos pequenos em superfície porosa. Apresenta nematocistos especializados para imobilizar pequenas presas.'),
('Anêmona rara', 'Anthopleura parva', 'Cnidário', 'Actiniidae', 'Carnívoro', 'Anêmona de zonas entremarés que frequentemente mantém simbiose com microalgas fotossintéticas nos tecidos. Desenvolve-se em águas bem oxigenadas com movimentação constante da água.'),
('Água viva tropical', 'Cyanea striata', 'Cnidário', 'Cyaneidae', 'Carnívoro', 'Medusa de grande porte com sino achatado e densa coroa de tentáculos filamentosos longos. Possui simetria radial característica do filo e respostas rápidas a estímulos.'),
('Coral esmeralda', 'Porites nigra', 'Cnidário', 'Poritidae', 'Carnívoro', 'Coral resistente de esqueleto poroso, comum em formas maciças, colunares ou ramificadas em recifes. Contribui para a dinâmica trófica local ao alimentar-se de organismos planctônicos.'),
('Anêmona colonial', 'Condylactis aurea', 'Cnidário', 'Actiniidae', 'Carnívoro', 'Anêmona recifal de coluna robusta e tentáculos longos que exibem coloração variada e pontas contrastantes. Apresenta nematocistos especializados para imobilizar pequenas presas.'),
('Coral brilhante', 'Favia tenuis', 'Cnidário', 'Faviidae', 'Carnívoro', 'Coral pétreo de colônias arredondadas ou hemisféricas com coralitos bem demarcados na superfície. Desenvolve-se em águas bem oxigenadas com movimentação constante da água.'),
('Água viva índica', 'Rhizostoma lineata', 'Cnidário', 'Rhizostomatidae', 'Carnívoro', 'Medusa de sino firme e braços orais ramificados sem tentáculos marginais, filtrando pequenas partículas e presas. Possui simetria radial característica do filo e respostas rápidas a estímulos.'),
('Anêmona silenciosa', 'Stichodactyla argentea', 'Cnidário', 'Stichodactylidae', 'Carnívoro', 'Anêmona de disco largo e tentáculos curtos abundantes, frequentemente associada a peixes-palhaço. Contribui para a dinâmica trófica local ao alimentar-se de organismos planctônicos.'),
('Coral translúcida', 'Pocillopora abyssalis', 'Cnidário', 'Pocilloporidae', 'Carnívoro', 'Coral ramificado compacto com ramos curtos e verrugosos que suporta bem áreas de correnteza. Apresenta nematocistos especializados para imobilizar pequenas presas.'),
('Água viva recifal', 'Atolla formosa', 'Cnidário', 'Atollidae', 'Carnívoro', 'Medusa de águas profundas com sulco coronal distinto e bioluminescência defensiva em padrão circular. Desenvolve-se em águas bem oxigenadas com movimentação constante da água.'),
('Anêmona laminar', 'Cerianthus ornata', 'Cnidário', 'Cerianthidae', 'Carnívoro', 'Anêmona tubular que habita fundos moles construindo um tubo fibroso protetor de onde estende os tentáculos. Possui simetria radial característica do filo e respostas rápidas a estímulos.'),
('Coral robusta', 'Agaricia micans', 'Cnidário', 'Agariciidae', 'Carnívoro', 'Coral foliáceo ou laminar de superfície ondulada, adaptado a diferentes níveis de luminosidade no recife. Contribui para a dinâmica trófica local ao alimentar-se de organismos planctônicos.'),
('Água viva setentrional', 'Periphylla occidentalis', 'Cnidário', 'Periphyllidae', 'Carnívoro', 'Medusa de águas profundas com sino cônico ou alto e pigmentação escura protetora. Apresenta nematocistos especializados para imobilizar pequenas presas.'),
('Anêmona ancorada', 'Edwardsia gracilis', 'Cnidário', 'Edwardsiidae', 'Carnívoro', 'Anêmona alongada que vive enterrada em areia ou lama, deixando apenas a coroa tentacular exposta. Desenvolve-se em águas bem oxigenadas com movimentação constante da água.'),
('Coral prateada', 'Euphyllia agilis', 'Cnidário', 'Euphylliidae', 'Carnívoro', 'Coral de pólipos carnudos e tentáculos alongados com extremidades expandidas que oscilam na correnteza. Possui simetria radial característica do filo e respostas rápidas a estímulos.'),
('Água viva bentônica', 'Gonionemus alba', 'Cnidário', 'Olindiidae', 'Carnívoro', 'Pequena hidromedusa costeira com tentáculos providos de estruturas adesivas para fixação em algas. Contribui para a dinâmica trófica local ao alimentar-se de organismos planctônicos.'),
('Gorgônia veludosa', 'Gorgonia minor', 'Cnidário', 'Gorgoniidae', 'Carnívoro', 'Colônia ramificada em formato de leque ou arbusto com esqueleto flexível e pólipos distribuídos nos ramos. Apresenta nematocistos especializados para imobilizar pequenas presas.'),
('Coral mole profunda', 'Alcyonium complexa', 'Cnidário', 'Alcyoniidae', 'Carnívoro', 'Colônia carnuda sem esqueleto calcário maciço, formando lóbulos ou dedos em águas temperadas e frias. Desenvolve-se em águas bem oxigenadas com movimentação constante da água.'),
('Anêmona nativa', 'Bunodosoma flava', 'Cnidário', 'Actiniidae', 'Carnívoro', 'Anêmona de costão com verrugas na coluna que auxiliam na adesão de areia e fragmentos de conchas. Possui simetria radial característica do filo e respostas rápidas a estímulos.'),
('Água viva costeira', 'Aequorea rubra', 'Cnidário', 'Aequoreidae', 'Carnívoro', 'Hidromedusa transparente em forma de sino com canais radiais definidos e margem repleta de tentáculos. Contribui para a dinâmica trófica local ao alimentar-se de organismos planctônicos.'),
('Coral rubra', 'Madracis parva', 'Cnidário', 'Pocilloporidae', 'Carnívoro', 'Coral colonial de ramos finos ou crostas que ocorre desde águas rasas até zonas mais profundas. Apresenta nematocistos especializados para imobilizar pequenas presas.'),
('Anêmona solitária', 'Aiptasia maculata', 'Cnidário', 'Aiptasiidae', 'Carnívoro', 'Anêmona delgada e translúcida com alta capacidade de propagação assexuada em ambientes costeiros e aquários. Desenvolve-se em águas bem oxigenadas com movimentação constante da água.'),
('Água viva cristalina', 'Cassiopea rosea', 'Cnidário', 'Cassiopeidae', 'Carnívoro', 'Medusa bentônica que costuma repousar invertida no fundo raso, expondo apêndices ricos em algas simbióticas. Possui simetria radial característica do filo e respostas rápidas a estímulos.'),
('Coral pacífica', 'Scolymia marina', 'Cnidário', 'Mussidae', 'Carnívoro', 'Coral solitário de pólipo grande e carnoso sobre cálice circular, comum em ambientes recifais. Contribui para a dinâmica trófica local ao alimentar-se de organismos planctônicos.'),
('Hidra vistosa', 'Hydra crassa', 'Cnidário', 'Hydridae', 'Carnívoro', 'Pólipo de água doce de corpo cilíndrico e tentáculos ao redor da boca, fixo a plantas e superfícies submersas. Apresenta nematocistos especializados para imobilizar pequenas presas.'),
('Coral abissal', 'Tubastraea lineata', 'Cnidário', 'Dendrophylliidae', 'Carnívoro', 'Coral azooxantelado de pólipos vistosos que se estendem para capturar alimento em áreas sombreadas ou noturnas. Desenvolve-se em águas bem oxigenadas com movimentação constante da água.'),
('Água viva recifal do norte', 'Aurelia hyalina', 'Cnidário', 'Ulmaridae', 'Carnívoro', 'Medusa pelágica com sino translúcido, canais radiais visíveis e tentáculos marginais adaptados à captura de presas. Possui simetria radial característica do filo e respostas rápidas a estímulos.'),
('Coral laminar', 'Acropora littoralis', 'Cnidário', 'Acroporidae', 'Carnívoro', 'Coral construtor de recifes com esqueleto calcário ramificado que abriga diversidade marinha em águas tropicais. Contribui para a dinâmica trófica local ao alimentar-se de organismos planctônicos.'),
('Anêmona robusta', 'Actinia speciosa', 'Cnidário', 'Actiniidae', 'Carnívoro', 'Pólipo solitário de costão rochoso que fixa sua base ao substrato e recolhe os tentáculos na maré baixa. Apresenta nematocistos especializados para imobilizar pequenas presas.'),
('Água viva setentrional de superfície', 'Chrysaora decora', 'Cnidário', 'Pelagiidae', 'Carnívoro', 'Medusa costeira de sino ornamentado e tentáculos longos que atuam na defesa e captura de zooplâncton. Desenvolve-se em águas bem oxigenadas com movimentação constante da água.'),
('Coral ancorada', 'Montipora micans', 'Cnidário', 'Acroporidae', 'Carnívoro', 'Coral de crescimento incrustante, laminar ou ramificado com coralitos pequenos em superfície porosa. Possui simetria radial característica do filo e respostas rápidas a estímulos.'),
('Anêmona prateada', 'Anthopleura borealis', 'Cnidário', 'Actiniidae', 'Carnívoro', 'Anêmona de zonas entremarés que frequentemente mantém simbiose com microalgas fotossintéticas nos tecidos. Contribui para a dinâmica trófica local ao alimentar-se de organismos planctônicos.'),
('Água viva bentônica do norte', 'Cyanea robusta', 'Cnidário', 'Cyaneidae', 'Carnívoro', 'Medusa de grande porte com sino achatado e densa coroa de tentáculos filamentosos longos. Apresenta nematocistos especializados para imobilizar pequenas presas.'),
('Coral veludosa', 'Porites celer', 'Cnidário', 'Poritidae', 'Carnívoro', 'Coral resistente de esqueleto poroso, comum em formas maciças, colunares ou ramificadas em recifes. Desenvolve-se em águas bem oxigenadas com movimentação constante da água.'),
('Anêmona profunda', 'Condylactis caerulea', 'Cnidário', 'Actiniidae', 'Carnívoro', 'Anêmona recifal de coluna robusta e tentáculos longos que exibem coloração variada e pontas contrastantes. Possui simetria radial característica do filo e respostas rápidas a estímulos.'),
('Coral nativa', 'Favia minor', 'Cnidário', 'Faviidae', 'Carnívoro', 'Coral pétreo de colônias arredondadas ou hemisféricas com coralitos bem demarcados na superfície. Contribui para a dinâmica trófica local ao alimentar-se de organismos planctônicos.'),
('Água viva costeira de recife', 'Rhizostoma undata', 'Cnidário', 'Rhizostomatidae', 'Carnívoro', 'Medusa de sino firme e braços orais ramificados sem tentáculos marginais, filtrando pequenas partículas e presas. Apresenta nematocistos especializados para imobilizar pequenas presas.'),
('Anêmona rubra', 'Stichodactyla fusca', 'Cnidário', 'Stichodactylidae', 'Carnívoro', 'Anêmona de disco largo e tentáculos curtos abundantes, frequentemente associada a peixes-palhaço. Desenvolve-se em águas bem oxigenadas com movimentação constante da água.'),
('Coral solitária', 'Pocillopora nivea', 'Cnidário', 'Pocilloporidae', 'Carnívoro', 'Coral ramificado compacto com ramos curtos e verrugosos que suporta bem áreas de correnteza. Possui simetria radial característica do filo e respostas rápidas a estímulos.'),
('Água viva cristalina do sul', 'Atolla magna', 'Cnidário', 'Atollidae', 'Carnívoro', 'Medusa de águas profundas com sulco coronal distinto e bioluminescência defensiva em padrão circular. Contribui para a dinâmica trófica local ao alimentar-se de organismos planctônicos.'),
('Anêmona pacífica', 'Cerianthus maculata', 'Cnidário', 'Cerianthidae', 'Carnívoro', 'Anêmona tubular que habita fundos moles construindo um tubo fibroso protetor de onde estende os tentáculos. Apresenta nematocistos especializados para imobilizar pequenas presas.'),
('Coral vistosa', 'Agaricia violacea', 'Cnidário', 'Agariciidae', 'Carnívoro', 'Coral foliáceo ou laminar de superfície ondulada, adaptado a diferentes níveis de luminosidade no recife. Desenvolve-se em águas bem oxigenadas com movimentação constante da água.'),
('Água viva abissal', 'Periphylla pelagica', 'Cnidário', 'Periphyllidae', 'Carnívoro', 'Medusa de águas profundas com sino cônico ou alto e pigmentação escura protetora. Possui simetria radial característica do filo e respostas rápidas a estímulos.'),





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
('Estrela do mar espinhosa', 'Marthasterias glacialis', 'Equinodermo', 'Asteriidae', 'Carnívoro', 'Predadora de moluscos e crustáceos em fundos rochosos e arenosos do Atlântico.'),
('Estrela do mar vermelha', 'Echinaster sepositus', 'Equinodermo', 'Echinasteridae', 'Carnívoro', 'Comum no Mediterrâneo e Atlântico oriental, apresenta coloração vermelho-alaranjada vibrante.'),
('Estrela do mar de recife azul', 'Linckia laevigata', 'Equinodermo', 'Ophidiasteridae', 'Carnívoro', 'Espécie tropical de cor azul intensa que habita recifes de coral rasos.'),
('Estrela do mar de braços curtos', 'Patiria pectinifera', 'Equinodermo', 'Asterinidae', 'Detritívoro', 'Estrela achatada e colorida que se alimenta de algas, detritos e pequenos organismos.'),
('Estrela do mar gigante', 'Pycnopodia helianthoides', 'Equinodermo', 'Asteriidae', 'Carnívoro', 'Predadora ativa e veloz que se alimenta de ouriços, moluscos e outros equinodermos.'),
('Estrela do mar de areia', 'Astropecten articulatus', 'Equinodermo', 'Astropectinidae', 'Carnívoro', 'Habita fundos arenosos rasos e captura pequenas presas enterradas no substrato.'),
('Estrela do mar almofada vermelha', 'Pentaceraster mammillatus', 'Equinodermo', 'Oreasteridae', 'Carnívoro', 'Corpo espesso e firme com nódulos salientes sobre os braços e o disco central.'),
('Estrela do mar de sol', 'Solaster endeca', 'Equinodermo', 'Solasteridae', 'Carnívoro', 'Possui cerca de sete a treze braços e é conhecida por predar outras estrelas-do-mar.'),
('Estrela do mar de poça', 'Asterina phylactica', 'Equinodermo', 'Asterinidae', 'Detritívoro', 'Pequena estrela adaptada a poças de maré e áreas costeiras rasas.'),
('Estrela do mar de fundo', 'Ceramaster granularis', 'Equinodermo', 'Goniasteridae', 'Carnívoro', 'Apresenta contorno pentagonal com placas marginais bem definidas em águas mais profundas.'),
('Estrela do mar de chifre', 'Protoreaster nodosus', 'Equinodermo', 'Oreasteridae', 'Carnívoro', 'Destaca-se pelos tubérculos cônicos proeminentes e escuros sobre o corpo claro.'),
('Estrela do mar de coral', 'Culcita novaeguineae', 'Equinodermo', 'Oreasteridae', 'Carnívoro', 'Possui formato quase pentagonal e inflado, assemelhando-se a uma almofada em recifes.'),
('Estrela do mar de espinhos brancos', 'Coscinasterias tenuispina', 'Equinodermo', 'Asteriidae', 'Carnívoro', 'Frequentemente apresenta número variável de braços devido à fissão e regeneração.'),
('Estrela do mar de lodo', 'Ctenodiscus crispatus', 'Equinodermo', 'Ctenodiscidae', 'Detritívoro', 'Habita fundos lodosos frios e ingere sedimentos ricos em matéria orgânica.'),
('Estrela do mar de recife rochoso', 'Leptasterias hexactis', 'Equinodermo', 'Asteriidae', 'Carnívoro', 'Pequena estrela de seis braços comum na zona entremarés rochosa.'),
('Estrela do mar de bico', 'Porania pulvillus', 'Equinodermo', 'Poraniidae', 'Carnívoro', 'Corpo arredondado e macio com textura lisa e coloração avermelhada ou rosada.'),
('Estrela do mar de profundidade', 'Hymenaster membranaceus', 'Equinodermo', 'Pterasteridae', 'Carnívoro', 'Adaptação abissal com membrana dorsal que forma uma câmara de incubação.'),
('Estrela do mar de areia branca', 'Luidia senegalensis', 'Equinodermo', 'Luidiidae', 'Carnívoro', 'Comum em fundos arenosos tropicais, possui braços longos e delgados.'),
('Estrela do mar de pedra', 'Henricia sanguinolenta', 'Equinodermo', 'Echinasteridae', 'Detritívoro', 'Apresenta tons avermelhados em superfícies rochosas de águas frias.'),
('Estrela do mar de recife tropical', 'Choriaster granulatus', 'Equinodermo', 'Oreasteridae', 'Carnívoro', 'Estrela grande e robusta associada a recifes de coral do Indo-Pacífico.'),
('Oriço do mar negro de espinhos longos', 'Diadema setosum', 'Equinodermo', 'Diadematidae', 'Herbívoro', 'Possui espinhos longos, finos e ocos, além de um anel alaranjado na região anal.'),
('Oriço do mar verde do atlântico', 'Lytechinus variegatus', 'Equinodermo', 'Toxopneustidae', 'Herbívoro', 'Alimenta-se de algas e gramas marinhas em águas costeiras rasas.'),
('Oriço do mar de espinhos curtos vermelho', 'Strongylocentrotus purpuratus', 'Equinodermo', 'Strongylocentrotidae', 'Herbívoro', 'Escava cavidades em rochas para se proteger das ondas e pastoreia algas.'),
('Oriço do mar de recife', 'Echinometra mathaei', 'Equinodermo', 'Echinometridae', 'Herbívoro', 'Muito comum em recifes tropicais, onde abriga-se em fendas e cavidades calcárias.'),
('Oriço do mar de lápis vermelho', 'Heterocentrotus trigonarius', 'Equinodermo', 'Echinometridae', 'Herbívoro', 'Espinhos primários espessos e angulosos adaptados a ambientes de forte hidrodinamismo.'),
('Oriço do mar de coração comum', 'Echinocardium cordatum', 'Equinodermo', 'Loveniidae', 'Detritívoro', 'Escava galerias na areia usando espinhos especializados e mantém contato com a superfície.'),
('Oriço do mar de prato achatado', 'Clypeaster subdepressus', 'Equinodermo', 'Clypeasteridae', 'Detritívoro', 'Carapaça larga e achatada que vive em fundos arenosos costeiros.'),
('Oriço do mar de espinhos finos', 'Arbacia punctulata', 'Equinodermo', 'Arbaciidae', 'Herbívoro', 'Comum no Atlântico ocidental, apresenta coloração escura e alimenta-se de algas e invertebrados.'),
('Oriço do mar de recife profundo', 'Cidaris cidaris', 'Equinodermo', 'Cidaridae', 'Carnívoro', 'Habita fundos rochosos e arenosos mais profundos, com espinhos robustos e espaçados.'),
('Oriço do mar de botão branco', 'Tripneustes ventricosus', 'Equinodermo', 'Toxopneustidae', 'Herbívoro', 'Frequentemente cobre a carapaça com fragmentos de algas e conchas em águas tropicais.'),
('Oriço do mar de fogo tropical', 'Asthenosoma ijimai', 'Equinodermo', 'Echinothuriidae', 'Herbívoro', 'Possui carapaça flexível e espinhos dotados de glândulas de veneno.'),
('Oriço do mar de pedra azul', 'Paracentrotus lividus', 'Equinodermo', 'Echinidae', 'Herbívoro', 'Espécie chave na manutenção de fundos rochosos livres de excesso de macroalgas.'),
('Oriço do mar de areia oval', 'Spatangus purpureus', 'Equinodermo', 'Spatangidae', 'Detritívoro', 'Apresenta coloração arroxeada e vive enterrado em sedimentos arenosos e cascalhentos.'),
('Oriço do mar de espinhos negros', 'Centrostephanus longispinus', 'Equinodermo', 'Diadematidae', 'Herbívoro', 'Habita fundos rochosos e corais de profundidade moderada com espinhos alongados.'),
('Oriço do mar de recife claro', 'Echinostrephus molaris', 'Equinodermo', 'Echinometridae', 'Herbívoro', 'Perfura rochas calcárias em zonas de ondas intensas para formar abrigos.'),
('Pepino do mar de areia negra', 'Holothuria atra', 'Equinodermo', 'Holothuriidae', 'Detritívoro', 'Comum em recifes e bancos de areia, auxilia na limpeza e reciclagem de nutrientes.'),
('Pepino do mar de recife espinhoso', 'Stichopus chloronotus', 'Equinodermo', 'Stichopodidae', 'Detritívoro', 'Corpo alongado e firme com fileiras de papilas na superfície dorsal.'),
('Pepino do mar de água fria', 'Cucumaria frondosa', 'Equinodermo', 'Cucumariidae', 'Suspensívoro', 'Filtra partículas orgânicas da água com seus tentáculos ramificados em águas frias.'),
('Pepino do mar de recife vermelho', 'Actinopyga echinites', 'Equinodermo', 'Holothuriidae', 'Detritívoro', 'Corpo marrom-avermelhado robusto encontrado em áreas rasas de recifes e areia.'),
('Pepino do mar de fundo arenoso', 'Holothuria impatiens', 'Equinodermo', 'Holothuriidae', 'Detritívoro', 'Apresenta corpo afilado e rugoso, vivendo sob pedras ou em sedimentos arenosos.'),
('Pepino do mar de tentáculos longos', 'Synapta maculata', 'Equinodermo', 'Synaptidae', 'Detritívoro', 'Corpo muito alongado e flexível que se desloca por contrações musculares no substrato.'),
('Pepino do mar de recife escuro', 'Holothuria edulis', 'Equinodermo', 'Holothuriidae', 'Detritívoro', 'Exibe dorso escuro e ventre rosado ou avermelhado em recifes tropicais.'),
('Pepino do mar de sedimento', 'Molpadia musculus', 'Equinodermo', 'Molpadiidae', 'Detritívoro', 'Vive enterrado em lamas profundas, contribuindo para a mistura de camadas do sedimento.'),
('Pepino do mar de recife amarelo', 'Colochirus quadrangularis', 'Equinodermo', 'Cucumariidae', 'Suspensívoro', 'Possui corpo anguloso e coloração viva, filtrando partículas na correnteza.'),
('Pepino do mar de águas profundas', 'Psychropotes longicauda', 'Equinodermo', 'Psychropotidae', 'Detritívoro', 'Espécie abissal com projeção caudal característica que se alimenta de detritos do fundo.'),
('Pepino do mar de recife pintado', 'Bohadschia vitiensis', 'Equinodermo', 'Holothuriidae', 'Detritívoro', 'Corpo cilíndrico com manchas discretas, comum em fundos arenosos próximos a recifes.'),
('Pepino do mar de lodo costeiro', 'Thyonella gemmata', 'Equinodermo', 'Sclerodactylidae', 'Suspensívoro', 'Enterra-se em sedimentos costeiros e estende tentáculos para capturar alimento em suspensão.'),
('Pepino do mar de espinhos macios', 'Stichopus monotuberculatus', 'Equinodermo', 'Stichopodidae', 'Detritívoro', 'Corpo macio e alongado com papilas dispersas sobre a superfície.'),
('Pepino do mar de recife claro', 'Holothuria hilla', 'Equinodermo', 'Holothuriidae', 'Detritívoro', 'De coloração castanha clara, é comum sob rochas e detritos de coral em águas rasas.'),
('Pepino do mar de profundidade abissal', 'Deima validum', 'Equinodermo', 'Deimatidae', 'Detritívoro', 'Pepino abissal de corpo achatado e pés ambulacrários espessos para caminhar no lodo.'),
('Ofiúro de braços longos e finos', 'Amphiura chiajei', 'Equinodermo', 'Amphiuridae', 'Detritívoro', 'Vive enterrado em fundos lodosos e estende os braços para coletar detritos.'),
('Ofiúro de recife com anéis', 'Ophiocoma echinata', 'Equinodermo', 'Ophiocomidae', 'Detritívoro', 'Comum em recifes tropicais, abriga-se em fendas e estende os braços à noite.'),
('Ofiúro de disco ornamentado', 'Ophioderma longicaudum', 'Equinodermo', 'Ophiodermatidae', 'Carnívoro', 'Disco bem definido e braços longos, ativo principalmente durante a noite.'),
('Ofiúro de águas frias', 'Ophiura sarsii', 'Equinodermo', 'Ophiuridae', 'Carnívoro', 'Habita fundos arenosos e lodosos frios, alimentando-se de pequenos organismos e detritos.'),
('Ofiúro de recife frágil', 'Ophiothrix angulata', 'Equinodermo', 'Ophiotrichidae', 'Suspensívoro', 'Muito comum em esponjas e recifes rasos, possui espinhos serrilhados nos braços.'),
('Ofiúro de braços ramificados', 'Astrophyton muricatum', 'Equinodermo', 'Gorgonocephalidae', 'Suspensívoro', 'Forma uma densa rede de braços ramificados à noite para capturar plâncton.'),
('Ofiúro de fenda rochosa', 'Ophiactis virens', 'Equinodermo', 'Ophiactidae', 'Detritívoro', 'Pequeno ofiúro que ocupa fendas, algas e esponjas em áreas costeiras.'),
('Ofiúro de fundo arenoso', 'Ophiura ophiura', 'Equinodermo', 'Ophiuridae', 'Carnívoro', 'Comum em fundos arenosos costeiros, desloca-se rapidamente com movimentos serpentiformes.'),
('Ofiúro de recife tropical', 'Ophiarachna incrassata', 'Equinodermo', 'Ophiomyxidae', 'Carnívoro', 'Ofiúro de grande porte com braços grossos, ativo à noite em recifes de coral.'),
('Ofiúro de disco liso escuro', 'Ophiura albida', 'Equinodermo', 'Ophiuridae', 'Carnívoro', 'Predador de pequenos invertebrados bentônicos em sedimentos costeiros.'),
('Ofiúro de espinhos alongados', 'Ophiothrix suensonii', 'Equinodermo', 'Ophiotrichidae', 'Suspensívoro', 'Frequentemente associado a esponjas e gorgônias, onde filtra partículas da água.'),
('Ofiúro de recife colorido', 'Ophiolepis cincta', 'Equinodermo', 'Ophiolepididae', 'Detritívoro', 'Exibe padrões contrastantes no disco e braços segmentados em recifes rasos.'),
('Ofiúro de profundidade', 'Ophiacantha bidentata', 'Equinodermo', 'Ophiacanthidae', 'Carnívoro', 'Espécie de águas mais profundas com espinhos proeminentes nos braços.'),
('Ofiúro de areia fina', 'Amphipholis squamata', 'Equinodermo', 'Amphiuridae', 'Detritívoro', 'Pequeno e amplamente distribuído, atua na reciclagem de matéria orgânica no sedimento.'),
('Ofiúro de recife sombreado', 'Ophiocoma pumila', 'Equinodermo', 'Ophiocomidae', 'Detritívoro', 'Habita áreas protegidas e sombreadas de recifes, alimentando-se de detritos.'),
('Lírio do mar de plumas tropicais', 'Comanthina schlegelii', 'Equinodermo', 'Comasteridae', 'Suspensívoro', 'Crinoide colorido que expõe seus braços plumosos às correntes em recifes.'),
('Lírio do mar de braços numerosos', 'Stephanometra indica', 'Equinodermo', 'Mariametridae', 'Suspensívoro', 'Possui dezenas de braços articulados que capturam partículas em suspensão.'),
('Lírio do mar de recife raso', 'Lamprometra palmata', 'Equinodermo', 'Mariametridae', 'Suspensívoro', 'Abre seus braços em leque sobre corais e rochas para filtrar plâncton.'),
('Lírio do mar de correnteza', 'Tropiometra afra', 'Equinodermo', 'Tropometridae', 'Suspensívoro', 'Fixa-se em substratos duros em zonas de corrente moderada a forte.'),
('Lírio do mar de águas profundas', 'Bathycrinus gracilis', 'Equinodermo', 'Bathycrinidae', 'Suspensívoro', 'Crinoide pedunculado de grandes profundidades adaptado a ambientes calmos.'),
('Lírio do mar de recife escuro', 'Capillaster multiradiatus', 'Equinodermo', 'Comasteridae', 'Suspensívoro', 'Apresenta coloração escura ou avermelhada e múltiplos braços plumosos.'),
('Lírio do mar de braços curtos', 'Colobometra perspinosa', 'Equinodermo', 'Colobometridae', 'Suspensívoro', 'Comum em recifes tropicais, filtra partículas suspensas na coluna d’água.'),
('Lírio do mar de plumas finas', 'Oxycomanthus japonicus', 'Equinodermo', 'Comasteridae', 'Suspensívoro', 'Crinoide de braços delicados que se estendem em busca de alimento na correnteza.'),
('Lírio do mar de fundo rochoso', 'Antedon petasus', 'Equinodermo', 'Antedonidae', 'Suspensívoro', 'Espécie de águas frias que se prende a rochas e algas em correntes.'),
('Lírio do mar de recife indo-pacífico', 'Cenometra bella', 'Equinodermo', 'Colobometridae', 'Suspensívoro', 'Frequentemente encontrado em gorgônias, onde estende seus braços filtradores.'),
('Bolacha da praia de cinco furos', 'Mellita quinquiesperforata', 'Equinodermo', 'Mellitidae', 'Detritívoro', 'Vive semi-enterrada na areia fina e coleta partículas orgânicas entre os espinhos.'),
('Bolacha da praia de seis furos', 'Leodia sexiesperforata', 'Equinodermo', 'Mellitidae', 'Detritívoro', 'Apresenta seis aberturas características na carapaça achatada em praias tropicais.'),
('Bolacha da praia de entalhes', 'Encope emarginata', 'Equinodermo', 'Mellitidae', 'Detritívoro', 'Carapaça achatada com recortes marginais que auxiliam na estabilidade e alimentação.'),
('Bolacha da praia do pacífico', 'Dendraster excentricus', 'Equinodermo', 'Dendrasteridae', 'Detritívoro', 'Pode inclinar-se na areia para capturar partículas transportadas pelas ondas.'),
('Bolacha da praia de areia rasa', 'Echinarachnius parma', 'Equinodermo', 'Scutellidae', 'Detritívoro', 'Forma aglomerados em fundos arenosos frios a temperados.'),
('Bolacha da praia de borda lisa', 'Clypeaster ravenelii', 'Equinodermo', 'Clypeasteridae', 'Detritívoro', 'Carapaça espessa e arredondada adaptada à vida em fundos arenosos.'),
('Bolacha da praia de fendas alongadas', 'Encope grandis', 'Equinodermo', 'Mellitidae', 'Detritívoro', 'Habita fundos arenosos rasos, alimentando-se de detritos microscópicos.'),
('Bolacha da praia de fundo arenoso', 'Mellita tenuis', 'Equinodermo', 'Mellitidae', 'Detritívoro', 'Comum em praias arenosas, auxilia na movimentação superficial do sedimento.'),
('Bolacha da praia de água temperada', 'Echinarachnius tenuis', 'Equinodermo', 'Scutellidae', 'Detritívoro', 'Vive enterrada em areia fina, filtrando grãos e matéria orgânica.'),
('Bolacha da praia de recife arenoso', 'Leodia sexiesperforata', 'Equinodermo', 'Mellitidae', 'Detritívoro', 'Adaptação achatada para resistir à ação das ondas em zonas arenosas rasas.'),
('Estrela do mar de braços múltiplos', 'Crossaster papposus', 'Equinodermo', 'Solasteridae', 'Carnívoro', 'Estrela vistosa de vários braços que predam outros invertebrados marinhos.'),
('Estrela do mar de areia profunda', 'Astropecten americanus', 'Equinodermo', 'Astropectinidae', 'Carnívoro', 'Habita fundos arenosos e lodosos, caçando pequenas presas bentônicas.'),
('Estrela do mar de recife com espinhos', 'Acanthaster brevispinus', 'Equinodermo', 'Acanthasteridae', 'Carnívoro', 'Parente próxima da coroa-de-espinhos, encontrada em fundos mais profundos.'),
('Estrela do mar de poça rochosa', 'Patiria miniata', 'Equinodermo', 'Asterinidae', 'Detritívoro', 'Espécie resistente de ampla variação de cor em costas rochosas.'),
('Estrela do mar de fundo arenoso', 'Luidia alternata', 'Equinodermo', 'Luidiidae', 'Carnívoro', 'Estrela de braços alongados com padrão marcante que habita fundos arenosos.'),
('Oriço do mar de espinhos curtos escuros', 'Arbacia lixula', 'Equinodermo', 'Arbaciidae', 'Herbívoro', 'Comum em costas rochosas, raspa algas calcárias e incrustantes.'),
('Oriço do mar de recife tropical', 'Echinometra lucunter', 'Equinodermo', 'Echinometridae', 'Herbívoro', 'Adapta-se a zonas batidas por ondas utilizando abrigos escavados na rocha.'),
('Oriço do mar de areia branca', 'Clypeaster rosaceus', 'Equinodermo', 'Clypeasteridae', 'Detritívoro', 'Carapaça alta e robusta que se cobre com detritos em fundos arenosos.'),
('Oriço do mar de espinhos finos escuros', 'Diadema antillarum', 'Equinodermo', 'Diadematidae', 'Herbívoro', 'Herbívoro importante que controla o crescimento de algas em recifes tropicais.'),
('Oriço do mar de pedra', 'Strongylocentrotus droebachiensis', 'Equinodermo', 'Strongylocentrotidae', 'Herbívoro', 'Habita águas frias e pode formar frentes de pastejo sobre florestas de kelp.'),
('Pepino do mar de areia fina', 'Holothuria grisea', 'Equinodermo', 'Holothuriidae', 'Detritívoro', 'Processa grandes volumes de areia, contribuindo para a saúde do sedimento.'),
('Pepino do mar de recife liso', 'Bohadschia argus', 'Equinodermo', 'Holothuriidae', 'Detritívoro', 'Espécie robusta de recifes tropicais que ingere sedimentos ricos em matéria orgânica.'),
('Pepino do mar de água profunda', 'Peniagone diaphana', 'Equinodermo', 'Elpidiidae', 'Detritívoro', 'Corpo translúcido e leve adaptado à vida próxima ao fundo oceânico profundo.'),
('Pepino do mar de tentáculos curtos', 'Thelenota ananas', 'Equinodermo', 'Stichopodidae', 'Detritívoro', 'Grande pepino do mar com projeções salientes em áreas de recife e areia.'),
('Pepino do mar de fundo marinho', 'Australostichopus mollis', 'Equinodermo', 'Stichopodidae', 'Detritívoro', 'Recicla matéria orgânica do sedimento em águas costeiras.'),
('Ofiúro de braços longos e lisos', 'Ophioderma brevispinum', 'Equinodermo', 'Ophiodermatidae', 'Detritívoro', 'Ofiúro de movimentos ágeis que habita fundos arenosos, lodosos e algas.'),
('Ofiúro de recife com espinhos', 'Ophiothrix fragilis', 'Equinodermo', 'Ophiotrichidae', 'Detritívoro', 'Pode formar grandes aglomerações em fundos rochosos e correntes.'),
('Ofiúro de fenda coralina', 'Ophiolepis paucispina', 'Equinodermo', 'Ophiolepididae', 'Detritívoro', 'Pequeno e discreto, vive protegido em fendas de recifes de coral.'),
('Ofiúro de águas profundas', 'Gorgonocephalus eucnemis', 'Equinodermo', 'Gorgonocephalidae', 'Suspensívoro', 'Estende braços ramificados para capturar presas planctônicas na correnteza.'),
('Ofiúro de fundo lodoso', 'Amphiura filiformis', 'Equinodermo', 'Amphiuridae', 'Suspensívoro', 'Filtra partículas orgânicas da água enquanto mantém o disco enterrado no lodo.'),
('Estrela do mar espinhosa do norte', 'Asterias amurensis', 'Equinodermo', 'Asteriidae', 'Carnívoro', 'Espécie de grande porte originária do noroeste do Pacífico, predadora de moluscos e crustáceos.'),
('Estrela do mar do pacífico norte', 'Evasterias troschelii', 'Equinodermo', 'Asteriidae', 'Carnívoro', 'Estrela de braços longos e disco pequeno encontrada em zonas entremarés e subtidais.'),
('Estrela do mar espinhosa de seis braços', 'Leptasterias aequalis', 'Equinodermo', 'Asteriidae', 'Carnívoro', 'Pequena estrela que incuba ovos e vive em costas rochosas do Pacífico.'),
('Estrela do mar de sangue do pacífico', 'Henricia tumida', 'Equinodermo', 'Echinasteridae', 'Carnívoro', 'Apresenta coloração avermelhada e habita superfícies rochosas de águas frias.'),
('Estrela do mar de recife vermelha', 'Echinaster luzonicus', 'Equinodermo', 'Echinasteridae', 'Carnívoro', 'Frequentemente apresenta número irregular de braços devido à divisão assexuada.'),
('Estrela do mar almofada granulado', 'Choriaster granulatus', 'Equinodermo', 'Oreasteridae', 'Carnívoro', 'Corpo abaulado e firme com superfície granulada em recifes do Indo-Pacífico.'),
('Estrela do mar de chifres duplos', 'Pentaceraster regulus', 'Equinodermo', 'Oreasteridae', 'Carnívoro', 'Possui nódulos robustos e contorno pentagonal marcado em fundos arenosos e recifes.'),
('Estrela do mar de recife de coral', 'Fromia milleporella', 'Equinodermo', 'Ophidiasteridae', 'Carnívoro', 'Pequena estrela avermelhada com poros escuros distribuídos pelos braços.'),
('Estrela do mar de recife laranja', 'Fromia monilis', 'Equinodermo', 'Ophidiasteridae', 'Carnívoro', 'Apresenta placas contrastantes e vive em recifes de coral tropicais.'),
('Estrela do mar de areia cinza', 'Astropecten polyacanthus', 'Equinodermo', 'Astropectinidae', 'Carnívoro', 'Estrela de fundo arenoso com espinhos marginais evidentes e hábitos noturnos.'),
('Estrela do mar de areia listrada', 'Astropecten articulatus', 'Equinodermo', 'Astropectinidae', 'Carnívoro', 'Comum em fundos arenosos rasos, caça pequenos moluscos e vermes.'),
('Estrela do mar pente do atlântico', 'Astropecten cingulatus', 'Equinodermo', 'Astropectinidae', 'Carnívoro', 'Vive em fundos arenosos e lodosos, enterrando-se rapidamente quando perturbada.'),
('Estrela do mar de braços finos', 'Luidia foliolata', 'Equinodermo', 'Luidiidae', 'Carnívoro', 'Estrela de braços longos e flexíveis que habita fundos arenosos e lodosos.'),
('Estrela do mar de fundo lodoso', 'Luidia sarsi', 'Equinodermo', 'Luidiidae', 'Carnívoro', 'Habita águas temperadas a frias e alimenta-se de pequenos invertebrados.'),
('Estrela do mar de disco largo', 'Goniaster tessellatus', 'Equinodermo', 'Goniasteridae', 'Carnívoro', 'Possui placas marginais largas e bem demarcadas em recifes e fundos rochosos.'),
('Estrela do mar de placas', 'Mediaster aequalis', 'Equinodermo', 'Goniasteridae', 'Carnívoro', 'Estrela vermelha de contorno pentagonal bem definido em águas frias do Pacífico.'),
('Estrela do mar de profundidade abissal', 'Freyella elegans', 'Equinodermo', 'Freyellidae', 'Suspensívoro', 'Estrela abissal de múltiplos braços delicados adaptada a grandes profundidades.'),
('Estrela do mar de recife escuro', 'Nardoa novaecaledoniae', 'Equinodermo', 'Ophidiasteridae', 'Carnívoro', 'Apresenta braços cilíndricos com faixas escuras em recifes tropicais.'),
('Estrela do mar de espinhos curtos', 'Orthasterias koehleri', 'Equinodermo', 'Asteriidae', 'Carnívoro', 'Estrela rosada ou avermelhada com linhas de espinhos ao longo dos braços.'),
('Estrela do mar de poça fria', 'Leptasterias hexactis', 'Equinodermo', 'Asteriidae', 'Carnívoro', 'Pequena estrela que ocorre em poças de maré e fundos rochosos.'),
('Estrela do mar de recife de areia', 'Archaster angulatus', 'Equinodermo', 'Archasteridae', 'Detritívoro', 'Vive semi-enterrada em areia rasa e recicla matéria orgânica.'),
('Estrela do mar de fundo arenoso escuro', 'Astropecten brasiliensis', 'Equinodermo', 'Astropectinidae', 'Carnívoro', 'Comum em fundos arenosos costeiros, caça presas enterradas no substrato.'),
('Estrela do mar de braços curtos e largos', 'Patiria miniata', 'Equinodermo', 'Asterinidae', 'Detritívoro', 'Estrela compacta de cores variadas que ocorre em costas rochosas.'),
('Estrela do mar de águas profundas frias', 'Solaster stimpsoni', 'Equinodermo', 'Solasteridae', 'Carnívoro', 'Possui cerca de dez braços e alimenta-se de outras estrelas-do-mar e pepinos-do-mar.'),
('Estrela do mar de recife de coral azul', 'Linckia columbiae', 'Equinodermo', 'Ophidiasteridae', 'Carnívoro', 'Pequena estrela de tons azulados ou acinzentados em recifes e costas rochosas.'),
('Oriço do mar de espinhos finos do caribe', 'Eucidaris tribuloides', 'Equinodermo', 'Cidaridae', 'Herbívoro', 'Habita recifes e fundos rochosos com espinhos primários grossos e rombudos.'),
('Oriço do mar de recife rochoso', 'Arbacia dufresnii', 'Equinodermo', 'Arbaciidae', 'Herbívoro', 'Ocorre em águas frias e temperadas, raspando algas e incrustações.'),
('Oriço do mar de espinhos longos claros', 'Diadema savignyi', 'Equinodermo', 'Diadematidae', 'Herbívoro', 'Possui espinhos finos e longos que ajudam a manter recifes livres de algas.'),
('Oriço do mar de recife de coral', 'Echinometra mathaei', 'Equinodermo', 'Echinometridae', 'Herbívoro', 'Escava cavidades em rochas calcárias e pastoreia algas em recifes.'),
('Oriço do mar de espinhos curtos do norte', 'Strongylocentrotus droebachiensis', 'Equinodermo', 'Strongylocentrotidae', 'Herbívoro', 'Habita águas frias e alimenta-se de algas kelp e detritos.'),
('Oriço do mar de botão tropical', 'Lytechinus variegatus', 'Equinodermo', 'Toxopneustidae', 'Herbívoro', 'Comum em pradarias marinhas, cobre-se com algas e fragmentos de conchas.'),
('Oriço do mar de carapaça alta', 'Tripneustes gratilla', 'Equinodermo', 'Toxopneustidae', 'Herbívoro', 'Espécie tropical de grande porte que controla o crescimento de algas.'),
('Oriço do mar de espinhos venenosos', 'Toxopneustes roseus', 'Equinodermo', 'Toxopneustidae', 'Herbívoro', 'Encontrado no Pacífico tropical, possui pedicelárias ativas e pastoreia algas.'),
('Oriço do mar de lápis escuros', 'Heterocentrotus mammillatus', 'Equinodermo', 'Echinometridae', 'Herbívoro', 'Espinhos grossos e pesados adaptados a áreas de ondas fortes.'),
('Oriço do mar de pedra do mediterrâneo', 'Paracentrotus lividus', 'Equinodermo', 'Echinidae', 'Herbívoro', 'Escava abrigos na rocha e alimenta-se de algas bentônicas.'),
('Oriço do mar de areia profundo', 'Echinocardium flavescens', 'Equinodermo', 'Loveniidae', 'Detritívoro', 'Vive enterrado em sedimentos arenosos e lodosos, abrindo canais respiratórios.'),
('Oriço do mar de coração do pacífico', 'Brisaster latifrons', 'Equinodermo', 'Brissidae', 'Detritívoro', 'Habita fundos lodosos mais profundos e ingere sedimentos ricos em matéria orgânica.'),
('Oriço do mar de prato tropical', 'Clypeaster rosaceus', 'Equinodermo', 'Clypeasteridae', 'Detritívoro', 'Carapaça espessa e ovalada adaptada a fundos arenosos tropicais.'),
('Oriço do mar de prato liso', 'Clypeaster subdepressus', 'Equinodermo', 'Clypeasteridae', 'Detritívoro', 'Carapaça achatada e alongada que vive em fundos arenosos costeiros.'),
('Oriço do mar de recife profundo escuro', 'Centrostephanus coronatus', 'Equinodermo', 'Diadematidae', 'Herbívoro', 'Habita fendas rochosas e recifes com espinhos longos e escuros.'),
('Oriço do mar de carapaça flexível', 'Asthenosoma varium', 'Equinodermo', 'Echinothuriidae', 'Herbívoro', 'Possui carapaça maleável e espinhos ocos associados a glândulas de veneno.'),
('Oriço do mar de águas profundas', 'Sperosoma grimaldii', 'Equinodermo', 'Echinothuriidae', 'Detritívoro', 'Ouriço de carapaça flexível encontrado em maiores profundidades.'),
('Pepino do mar de abacaxi gigante', 'Thelenota anax', 'Equinodermo', 'Stichopodidae', 'Detritívoro', 'Grande pepino do mar de fundos arenosos profundos e recifes.'),
('Pepino do mar de recife espinhento', 'Thelenota ananas', 'Equinodermo', 'Stichopodidae', 'Detritívoro', 'Possui projeções salientes que lembram um abacaxi em recifes tropicais.'),
('Pepino do mar de recife preto', 'Actinopyga mauritiana', 'Equinodermo', 'Holothuriidae', 'Detritívoro', 'Vive em zonas de ondas fortes em recifes, alimentando-se de detritos.'),
('Pepino do mar de fundo marinho', 'Australostichopus mollis', 'Equinodermo', 'Stichopodidae', 'Detritívoro', 'Recicla matéria orgânica do sedimento em águas costeiras.');





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
        WHEN 601 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/e5/Spisula_solidissima.jpg'
        WHEN 602 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0a/Octopus_joubini.jpg'
        WHEN 603 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Mastigoteuthis_flammea.jpg'
        WHEN 604 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5d/Babylonia_spirata.jpg'
        WHEN 605 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/88/Pinctada_fucata.jpg'
        WHEN 606 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/a2/Oxynoe_viridis.jpg'
        WHEN 607 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/06/Littorina_littorea.jpg'
        WHEN 608 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/45/Mytilus_trossulus.jpg'
        WHEN 609 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/84/Chiroteuthis_veranyi.jpg'
        WHEN 610 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/56/Pagodula_robusta.jpg'
        WHEN 611 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Kuphus_polythalamia.jpg'
        WHEN 612 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/51/Macrotritopus_defilippi.jpg'
        WHEN 613 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/2d/Conus_textile.jpg'
        WHEN 614 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7d/Halgerda_batangas.jpg'
        WHEN 615 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/45/Meretrix_lyrata.jpg'
        WHEN 616 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/8f/Stramonita_haemastoma.jpg'
        WHEN 617 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/29/Loligo_vulgaris.jpg'
        WHEN 618 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/64/Theba_pisana.jpg'
        WHEN 619 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/55/Margaritifera_margaritifera.jpg'
        WHEN 620 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/68/Janthina_janthina.jpg'
        WHEN 621 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/8e/Conus_imperialis.jpg'
        WHEN 622 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/4a/Glycymeris_glycymeris.jpg'
        WHEN 623 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/19/Octopus_cyanea.jpg'
        WHEN 624 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/54/Alloteuthis_subulata.jpg'
        WHEN 625 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0a/Polymita_picta.jpg'
        WHEN 626 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/12/Pinna_nobilis.jpg'
        WHEN 627 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9e/Hypselodoris_kanga.jpg'
        WHEN 628 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/8e/Cymatium_parthenopeum.jpg'
        WHEN 629 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/2c/Diplodon_delodontus.jpg'
        WHEN 630 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/4f/Histioteuthis_reversa.jpg'
        WHEN 631 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0d/Polinices_mammilla.jpg'
        WHEN 632 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/17/Ostrea_edulis.jpg'
        WHEN 633 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Doto_coronata.jpg'
        WHEN 634 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6d/Xenophora_conchyliophora.jpg'
        WHEN 635 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/58/Solen_marginatus.jpg'
        WHEN 636 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/82/Bathypolypus_arcticus.jpg'
        WHEN 637 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/87/Rossia_macrosoma.jpg'
        WHEN 638 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/23/Arianta_arbustorum.jpg'
        WHEN 639 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9d/Pecten_jacobaeus.jpg'
        WHEN 640 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/2e/Triopha_catalinae.jpg'
        WHEN 641 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Pomacea_canaliculata.jpg'
        WHEN 642 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9b/Sepiola_atlantica.jpg'
        WHEN 643 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/24/Cypraecassis_rufa.jpg'
        WHEN 644 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/59/Spondylus_gaederopus.jpg'
        WHEN 645 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/a7/Eledone_cirrhosa.jpg'
        WHEN 646 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/23/Littoraria_angulifera.jpg'
        WHEN 647 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/2a/Diaulula_sandiegensis.jpg'
        WHEN 648 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/1e/Glossus_humanus.jpg'
        WHEN 649 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/89/Cornu_aspersum.jpg'
        WHEN 650 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/96/Abraliopsis_morisii.jpg'
        WHEN 651 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/83/Turbinella_pyrum.jpg'
        WHEN 652 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6b/Unio_pictorum.jpg'
        WHEN 653 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3d/Hexabranchus_sanguineus.jpg'
        WHEN 654 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/4e/Nucella_lapillus.jpg'
        WHEN 655 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/15/Hapalochlaena_lunulata.jpg'
        WHEN 656 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Lolliguncula_brevis.jpg'
        WHEN 657 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/08/Cepaea_hortensis.jpg'
        WHEN 658 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/51/Chlamys_islandica.jpg'
        WHEN 659 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7a/Hypselodoris_zebra.jpg'
        WHEN 660 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/06/Conus_eburneus.jpg'
        WHEN 661 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/45/Panopea_generosa.jpg'
        WHEN 662 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/36/Octopus_bimaculoides.jpg'
        WHEN 663 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/22/Gonatus_fabricii.jpg'
        WHEN 664 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/63/Orthostylus.jpg'
        WHEN 665 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7d/Atrina_rigida.jpg'
        WHEN 666 THEN 'https://upload.wikimedia.org/wikipedia/commons/f/f9/Peltodoris_nobilis.jpg'
        WHEN 667 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/34/Charonia_tritonis.jpg'
        WHEN 668 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/92/Mytilopsis_leucophaeata.jpg'
        WHEN 669 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/4c/Sepioloidea_lineolata.jpg'
        WHEN 670 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/2e/Murex_pecten.jpg'
        WHEN 671 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/76/Ruditapes_decussatus.jpg'
        WHEN 672 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/57/Octopus_vulgaris.jpg'
        WHEN 673 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/4a/Eobania_vermiculata.jpg'
        WHEN 674 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/55/Elysia_chlorotica.jpg'
        WHEN 675 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/76/Placopecten_magellanicus.jpg'
        WHEN 676 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5e/Conus_leopardus.jpg'
        WHEN 677 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/88/Sepioteuthis_sepioidea.jpg'
        WHEN 678 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/35/Zonitoides_arboreus.jpg'
        WHEN 679 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/86/Cerastoderma_edule.jpg'
        WHEN 680 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/27/Octopus_maya.jpg'
        WHEN 681 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5a/Nassarius_vibex.jpg'
        WHEN 682 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/49/Chromodoris_quadricolor.jpg'
        WHEN 683 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/63/Crassostrea_gasar.jpg'
        WHEN 684 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/2d/Conus_textile.jpg'
        WHEN 685 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3d/Vampyroteuthis_infernalis.jpg'
        WHEN 686 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/14/Helicigona_lapicida.jpg'
        WHEN 687 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9d/Pecten_jacobaeus.jpg'
        WHEN 688 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6c/Felimare_tricolor.jpg'
        WHEN 689 THEN 'https://upload.wikimedia.org/wikipedia/commons/a/a3/Planorbarius_corneus.jpg'
        WHEN 690 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/33/Mya_arenaria.jpg'
        WHEN 691 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Abdopus_aculeatus.jpg'
        WHEN 692 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/e5/Turbo_setosus.jpg'
        WHEN 693 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/26/Bathothauma_lyromma.jpg'
        WHEN 694 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6c/Discus_rotundatus.jpg'
        WHEN 695 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5b/Perna_perna.jpg'
        WHEN 696 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/62/Flabellinopsis_iodinea.jpg'
        WHEN 697 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/26/Polinices_tumidus.jpg'
        WHEN 698 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0a/Amusium_pleuronectes.jpg'
        WHEN 699 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/87/Grimpoteuthis.jpg'
        WHEN 700 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9c/Flabellina_affinis.jpg'
        WHEN 701 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/64/Dendronotus_iris.jpg'
        WHEN 702 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6c/Felimare_tricolor.jpg'
        WHEN 703 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/73/Hermissenda_crassicornis.jpg'
        WHEN 704 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/45/Aeolidia_papillosa.jpg'
        WHEN 705 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9e/Phyllidia_varicosa.jpg'
        WHEN 706 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9e/Hypselodoris_kanga.jpg'
        WHEN 707 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/2a/Diaulula_sandiegensis.jpg'
        WHEN 708 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/36/Archidoris_pseudoargus.jpg'
        WHEN 709 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7a/Hypselodoris_zebra.jpg'
        WHEN 710 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/49/Chromodoris_quadricolor.jpg'
        WHEN 711 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0a/Goniobranchus_kuniei.jpg'
        WHEN 712 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/8b/Goniobranchus_coi.jpg'
        WHEN 713 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0a/Goniobranchus_kuniei.jpg'
        WHEN 714 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/1c/Doriprismatica_atromarginata.jpg'
        WHEN 715 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/45/Nudibranch_chromodorididae.jpg'
        WHEN 716 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Mexichromis_multituberculata.jpg'
        WHEN 717 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5d/Rostanga_pulchra.jpg'
        WHEN 718 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/8b/Melibe_leonina.jpg'
        WHEN 719 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/64/Melibe_viridis.jpg'
        WHEN 720 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/96/Pteraeolidia_ianthina.jpg'
        WHEN 721 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Doto_coronata.jpg'
        WHEN 722 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9c/Flabellina_affinis.jpg'
        WHEN 723 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/43/Hydatina_physis.jpg'
        WHEN 724 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7f/Micromelo_undatus.jpg'
        WHEN 725 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/23/Navanax_inermis.jpg'
        WHEN 726 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/96/Pteraeolidia_ianthina.jpg'
        WHEN 727 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/62/Flabellinopsis_iodinea.jpg'
        WHEN 728 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9c/Flabellina_affinis.jpg'
        WHEN 729 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/23/Navanax_inermis.jpg'
        WHEN 730 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6f/Conus_striatus.jpg'
        WHEN 731 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Conus_litteratus.jpg'
        WHEN 732 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/2d/Conus_textile.jpg'
        WHEN 733 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/8e/Conus_imperialis.jpg'
        WHEN 734 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5e/Conus_leopardus.jpg'
        WHEN 735 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/06/Conus_eburneus.jpg'
        WHEN 736 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5e/Conus_leopardus.jpg'
        WHEN 737 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/8e/Conus_imperialis.jpg'
        WHEN 738 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7a/Conus_marmoreus.jpg'
        WHEN 739 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6f/Conus_striatus.jpg'
        WHEN 740 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/78/Cypraea_arabica.jpg'
        WHEN 741 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/87/Monetaria_moneta.jpg'
        WHEN 742 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/12/Monetaria_annulus.jpg'
        WHEN 743 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5a/Cypraea_tigris.jpg'
        WHEN 744 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/78/Cypraea_arabica.jpg'
        WHEN 745 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/12/Monetaria_annulus.jpg'
        WHEN 746 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5a/Cypraea_tigris.jpg'
        WHEN 747 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5a/Cypraea_tigris.jpg'
        WHEN 748 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/2e/Murex_pecten.jpg'
        WHEN 749 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/2e/Murex_pecten.jpg'
        WHEN 750 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0f/Aurelia_aurita_-_1.jpg'
        WHEN 751 THEN 'https://upload.wikimedia.org/wikipedia/commons/e/e5/Physalia_physalis.jpg'
        WHEN 752 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/24/Actinia_equina.jpg'
        WHEN 753 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9e/Cyanea_capillata.jpg'
        WHEN 754 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Brain_coral.jpg'
        WHEN 755 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/1d/Chironex_fleckeri.jpg'
        WHEN 756 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/93/Hydra_viridis.jpg'
        WHEN 757 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/82/Acropora_palmata.jpg'
        WHEN 758 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/78/Stichodactyla_gigantea.jpg'
        WHEN 759 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/45/Rhizostoma_pulmo.jpg'
        WHEN 760 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3b/Millepora_alcicornis.jpg'
        WHEN 761 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6d/Pelagia_noctiluca.jpg'
        WHEN 762 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/53/Pennatula_phosphorea.jpg'
        WHEN 763 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/55/Tubastraea_coccinea.jpg'
        WHEN 764 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6c/Condylactis_gigantea.jpg'
        WHEN 765 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Turritopsis_dohrnii.jpg'
        WHEN 766 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/48/Alcyonium_digitatum.jpg'
        WHEN 767 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Velella_velella.jpg'
        WHEN 768 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Cerianthus_membranaceus.jpg'
        WHEN 769 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/21/Fungia_fungites.jpg'
        WHEN 770 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/1d/Chironex_fleckeri.jpg'
        WHEN 771 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/26/Black_coral.jpg'
        WHEN 772 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/96/Anthopleura_xanthogrammica.jpg'
        WHEN 773 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/8a/Mastigias_papua.jpg'
        WHEN 774 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3b/Millepora_alcicornis.jpg'
        WHEN 775 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/24/Actinia_equina.jpg'
        WHEN 776 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/8a/Nemopilema_nomurai.jpg'
        WHEN 777 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7a/Montastraea_cavernosa.jpg'
        WHEN 778 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/65/Anthopleura_elegantissima.jpg'
        WHEN 779 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/2f/Haliclystus_auricula.jpg'
        WHEN 780 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/55/Tubastraea_coccinea.jpg'
        WHEN 781 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/24/Actinia_equina.jpg'
        WHEN 782 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5b/Periphylla_periphylla.jpg'
        WHEN 783 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/52/Acropora_cervicornis.jpg'
        WHEN 784 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/8e/Exaiptasia_diaphana.jpg'
        WHEN 785 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/1d/Chironex_fleckeri.jpg'
        WHEN 786 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3d/Pocillopora_damicornis.jpg'
        WHEN 787 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6c/Condylactis_gigantea.jpg'
        WHEN 788 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/21/Atolla_wyvillei.jpg'
        WHEN 789 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0a/Gorgonia_ventalina.jpg'
        WHEN 790 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/49/Heteractis_magnifica.jpg'
        WHEN 791 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9e/Cyanea_capillata.jpg'
        WHEN 792 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Porites_astreoides.jpg'
        WHEN 793 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/65/Anthopleura_elegantissima.jpg'
        WHEN 794 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/45/Rhizostoma_pulmo.jpg'
        WHEN 795 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Porites_astreoides.jpg'
        WHEN 796 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6c/Condylactis_gigantea.jpg'
        WHEN 797 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/2f/Haliclystus_auricula.jpg'
        WHEN 798 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3d/Pocillopora_damicornis.jpg'
        WHEN 799 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/8e/Exaiptasia_diaphana.jpg'
        WHEN 800 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6c/Aequorea_victoria.jpg'
        WHEN 801 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/48/Alcyonium_digitatum.jpg'
        WHEN 802 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/78/Stichodactyla_gigantea.jpg'
        WHEN 803 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6d/Pelagia_noctiluca.jpg'
        WHEN 804 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/21/Fungia_fungites.jpg'
        WHEN 805 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Cerianthus_membranaceus.jpg'
        WHEN 806 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0f/Aurelia_aurita_-_1.jpg'
        WHEN 807 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Brain_coral.jpg'
        WHEN 808 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/8e/Exaiptasia_diaphana.jpg'
        WHEN 809 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6d/Pelagia_noctiluca.jpg'
        WHEN 810 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0a/Gorgonia_ventalina.jpg'
        WHEN 811 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6d/Pelagia_noctiluca.jpg'
        WHEN 812 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/82/Acropora_palmata.jpg'
        WHEN 813 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/96/Anthopleura_xanthogrammica.jpg'
        WHEN 814 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/45/Rhizostoma_pulmo.jpg'
        WHEN 815 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Brain_coral.jpg'
        WHEN 816 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/24/Actinia_equina.jpg'
        WHEN 817 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/1d/Chironex_fleckeri.jpg'
        WHEN 818 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7a/Montastraea_cavernosa.jpg'
        WHEN 819 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Cerianthus_membranaceus.jpg'
        WHEN 820 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/8a/Mastigias_papua.jpg'
        WHEN 821 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Brain_coral.jpg'
        WHEN 822 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/49/Heteractis_magnifica.jpg'
        WHEN 823 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5b/Periphylla_periphylla.jpg'
        WHEN 824 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/52/Acropora_cervicornis.jpg'
        WHEN 825 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6c/Condylactis_gigantea.jpg'
        WHEN 826 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6c/Aequorea_victoria.jpg'
        WHEN 827 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/21/Fungia_fungites.jpg'
        WHEN 828 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/65/Anthopleura_elegantissima.jpg'
        WHEN 829 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/21/Atolla_wyvillei.jpg'
        WHEN 830 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7a/Montastraea_cavernosa.jpg'
        WHEN 831 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/8e/Exaiptasia_diaphana.jpg'
        WHEN 832 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6c/Aequorea_victoria.jpg'
        WHEN 833 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/55/Tubastraea_coccinea.jpg'
        WHEN 834 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/96/Anthopleura_xanthogrammica.jpg'
        WHEN 835 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/45/Rhizostoma_pulmo.jpg'
        WHEN 836 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Brain_coral.jpg'
        WHEN 837 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Cerianthus_membranaceus.jpg'
        WHEN 838 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6d/Pelagia_noctiluca.jpg'
        WHEN 839 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3d/Pocillopora_damicornis.jpg'
        WHEN 840 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/24/Actinia_equina.jpg'
        WHEN 841 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0f/Aurelia_aurita_-_1.jpg'
        WHEN 842 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7a/Montastraea_cavernosa.jpg'
        WHEN 843 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/24/Actinia_equina.jpg'
        WHEN 844 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9e/Cyanea_capillata.jpg'
        WHEN 845 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/82/Acropora_palmata.jpg'
        WHEN 846 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6c/Condylactis_gigantea.jpg'
        WHEN 847 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/8a/Mastigias_papua.jpg'
        WHEN 848 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Brain_coral.jpg'
        WHEN 849 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/49/Heteractis_magnifica.jpg'
        WHEN 850 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6d/Pelagia_noctiluca.jpg'
        WHEN 851 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Brain_coral.jpg'
        WHEN 852 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/24/Actinia_equina.jpg'
        WHEN 853 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Velella_velella.jpg'
        WHEN 854 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/52/Acropora_cervicornis.jpg'
        WHEN 855 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/65/Anthopleura_elegantissima.jpg'
        WHEN 856 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0f/Aurelia_aurita_-_1.jpg'
        WHEN 857 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3d/Pocillopora_damicornis.jpg'
        WHEN 858 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Cerianthus_membranaceus.jpg'
        WHEN 859 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6c/Aequorea_victoria.jpg'
        WHEN 860 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Brain_coral.jpg'
        WHEN 861 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/78/Stichodactyla_gigantea.jpg'
        WHEN 862 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6d/Pelagia_noctiluca.jpg'
        WHEN 863 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/48/Alcyonium_digitatum.jpg'
        WHEN 864 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/96/Anthopleura_xanthogrammica.jpg'
        WHEN 865 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/21/Atolla_wyvillei.jpg'
        WHEN 866 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/21/Fungia_fungites.jpg'
        WHEN 867 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/49/Heteractis_magnifica.jpg'
        WHEN 868 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9e/Cyanea_capillata.jpg'
        WHEN 869 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7a/Montastraea_cavernosa.jpg'
        WHEN 870 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/8e/Exaiptasia_diaphana.jpg'
        WHEN 871 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6d/Pelagia_noctiluca.jpg'
        WHEN 872 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/82/Acropora_palmata.jpg'
        WHEN 873 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/24/Actinia_equina.jpg'
        WHEN 874 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5b/Periphylla_periphylla.jpg'
        WHEN 875 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/82/Acropora_palmata.jpg'
        WHEN 876 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/78/Stichodactyla_gigantea.jpg'
        WHEN 877 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6d/Pelagia_noctiluca.jpg'
        WHEN 878 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Brain_coral.jpg'
        WHEN 879 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Cerianthus_membranaceus.jpg'
        WHEN 880 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6c/Aequorea_victoria.jpg'
        WHEN 881 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0a/Gorgonia_ventalina.jpg'
        WHEN 882 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/96/Anthopleura_xanthogrammica.jpg'
        WHEN 883 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/21/Atolla_wyvillei.jpg'
        WHEN 884 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Brain_coral.jpg'
        WHEN 885 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Cerianthus_membranaceus.jpg'
        WHEN 886 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/8a/Mastigias_papua.jpg'
        WHEN 887 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7a/Montastraea_cavernosa.jpg'
        WHEN 888 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6c/Condylactis_gigantea.jpg'
        WHEN 889 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/21/Atolla_wyvillei.jpg'
        WHEN 890 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Porites_astreoides.jpg'
        WHEN 891 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/8e/Exaiptasia_diaphana.jpg'
        WHEN 892 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0f/Aurelia_aurita_-_1.jpg'
        WHEN 893 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Brain_coral.jpg'
        WHEN 894 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/24/Actinia_equina.jpg'
        WHEN 895 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/45/Rhizostoma_pulmo.jpg'
        WHEN 896 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3d/Pocillopora_damicornis.jpg'
        WHEN 897 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6c/Condylactis_gigantea.jpg'
        WHEN 898 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6d/Pelagia_noctiluca.jpg'
        WHEN 899 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Brain_coral.jpg'
        WHEN 900 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/8e/Exaiptasia_diaphana.jpg'
       WHEN 901 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6d/Pelagia_noctiluca.jpg'
        WHEN 902 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0a/Gorgonia_ventalina.jpg'
        WHEN 903 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/96/Anthopleura_xanthogrammica.jpg'
        WHEN 904 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/21/Fungia_fungites.jpg'
        WHEN 905 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6c/Aequorea_victoria.jpg'
        WHEN 906 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7a/Montastraea_cavernosa.jpg'
        WHEN 907 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/24/Actinia_equina.jpg'
        WHEN 908 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9e/Cyanea_capillata.jpg'
        WHEN 909 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/82/Acropora_palmata.jpg'
        WHEN 910 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6c/Condylactis_gigantea.jpg'
        WHEN 911 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/8a/Mastigias_papua.jpg'
        WHEN 912 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7a/Montastraea_cavernosa.jpg'
        WHEN 913 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Cerianthus_membranaceus.jpg'
        WHEN 914 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/45/Rhizostoma_pulmo.jpg'
        WHEN 915 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3d/Pocillopora_damicornis.jpg'
        WHEN 916 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/24/Actinia_equina.jpg'
        WHEN 917 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6d/Pelagia_noctiluca.jpg'
        WHEN 918 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Brain_coral.jpg'
        WHEN 919 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/49/Heteractis_magnifica.jpg'
        WHEN 920 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6c/Aequorea_victoria.jpg'
        WHEN 921 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/21/Fungia_fungites.jpg'
        WHEN 922 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/65/Anthopleura_elegantissima.jpg'
        WHEN 923 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/21/Atolla_wyvillei.jpg'
        WHEN 924 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7a/Montastraea_cavernosa.jpg'
        WHEN 925 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/8e/Exaiptasia_diaphana.jpg'
        WHEN 926 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6c/Aequorea_victoria.jpg'
        WHEN 927 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/55/Tubastraea_coccinea.jpg'
        WHEN 928 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/96/Anthopleura_xanthogrammica.jpg'
        WHEN 929 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/45/Rhizostoma_pulmo.jpg'
        WHEN 930 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Brain_coral.jpg'
        WHEN 931 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Cerianthus_membranaceus.jpg'
        WHEN 932 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6d/Pelagia_noctiluca.jpg'
        WHEN 933 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3d/Pocillopora_damicornis.jpg'
        WHEN 934 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/24/Actinia_equina.jpg'
        WHEN 935 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0f/Aurelia_aurita_-_1.jpg'
        WHEN 936 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7a/Montastraea_cavernosa.jpg'
        WHEN 937 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/24/Actinia_equina.jpg'
        WHEN 938 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9e/Cyanea_capillata.jpg'
        WHEN 939 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/82/Acropora_palmata.jpg'
        WHEN 940 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6c/Condylactis_gigantea.jpg'
        WHEN 941 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/8a/Mastigias_papua.jpg'
        WHEN 942 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Brain_coral.jpg'
        WHEN 943 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/49/Heteractis_magnifica.jpg'
        WHEN 944 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0f/Aurelia_aurita_-_1.jpg'
        WHEN 945 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Brain_coral.jpg'
        WHEN 946 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/24/Actinia_equina.jpg'
        WHEN 947 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9e/Cyanea_capillata.jpg'
        WHEN 948 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Brain_coral.jpg'
        WHEN 949 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/1d/Chironex_fleckeri.jpg'
        WHEN 950 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/93/Hydra_viridis.jpg'
        WHEN 951 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/82/Acropora_palmata.jpg'
        WHEN 952 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/78/Stichodactyla_gigantea.jpg'
        WHEN 953 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0f/Aurelia_aurita_-_1.jpg'
        WHEN 954 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/82/Acropora_palmata.jpg'
        WHEN 955 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/24/Actinia_equina.jpg'
        WHEN 956 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6d/Pelagia_noctiluca.jpg'
        WHEN 957 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3d/Pocillopora_damicornis.jpg'
        WHEN 958 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/96/Anthopleura_xanthogrammica.jpg'
        WHEN 959 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9e/Cyanea_capillata.jpg'
        WHEN 960 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Porites_astreoides.jpg'
        WHEN 961 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6c/Condylactis_gigantea.jpg'
        WHEN 962 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7a/Montastraea_cavernosa.jpg'
        WHEN 963 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/45/Rhizostoma_pulmo.jpg'
        WHEN 964 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/78/Stichodactyla_gigantea.jpg'
        WHEN 965 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3d/Pocillopora_damicornis.jpg'
        WHEN 966 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/21/Atolla_wyvillei.jpg'
        WHEN 967 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Cerianthus_membranaceus.jpg'
        WHEN 968 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/21/Fungia_fungites.jpg'
        WHEN 969 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5b/Periphylla_periphylla.jpg'
        WHEN 970 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Cerianthus_membranaceus.jpg'
        WHEN 971 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7a/Montastraea_cavernosa.jpg'
        WHEN 972 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6c/Aequorea_victoria.jpg'
        WHEN 973 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0a/Gorgonia_ventalina.jpg'
        WHEN 974 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/48/Alcyonium_digitatum.jpg'
        WHEN 975 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/24/Actinia_equina.jpg'
        WHEN 976 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6c/Aequorea_victoria.jpg'
        WHEN 977 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3d/Pocillopora_damicornis.jpg'
        WHEN 978 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/8e/Exaiptasia_diaphana.jpg'
        WHEN 979 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/8a/Mastigias_papua.jpg'
        WHEN 980 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/21/Fungia_fungites.jpg'
        WHEN 981 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/93/Hydra_viridis.jpg'
        WHEN 982 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/55/Tubastraea_coccinea.jpg'
        WHEN 983 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0f/Aurelia_aurita_-_1.jpg'
        WHEN 984 THEN 'https://upload.wikimedia.org/wikipedia/commons/8/82/Acropora_palmata.jpg'
        WHEN 985 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/24/Actinia_equina.jpg'
        WHEN 986 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6d/Pelagia_noctiluca.jpg'
        WHEN 987 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3d/Pocillopora_damicornis.jpg'
        WHEN 988 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/96/Anthopleura_xanthogrammica.jpg'
        WHEN 989 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9e/Cyanea_capillata.jpg'
        WHEN 990 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Porites_astreoides.jpg'
        WHEN 991 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6c/Condylactis_gigantea.jpg'
        WHEN 992 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7a/Montastraea_cavernosa.jpg'
        WHEN 993 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/45/Rhizostoma_pulmo.jpg'
        WHEN 994 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/78/Stichodactyla_gigantea.jpg'
        WHEN 995 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3d/Pocillopora_damicornis.jpg'
        WHEN 996 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/21/Atolla_wyvillei.jpg'
        WHEN 997 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Cerianthus_membranaceus.jpg'
        WHEN 998 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/21/Fungia_fungites.jpg'
        WHEN 999 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5b/Periphylla_periphylla.jpg'
        WHEN 1000 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/73/Asterias_rubens.jpg'
        WHEN 1001 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/59/Strongylocentrotus_purpuratus.jpg'
        WHEN 1002 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/64/Holothuria_tubulosa.jpg'
        WHEN 1003 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3f/Acanthaster_planci.jpg'
        WHEN 1004 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/2d/Diadema_antillarum.jpg'
        WHEN 1005 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6e/Linckia_laevigata.jpg'
        WHEN 1006 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/29/Ophiothrix_fragilis.jpg'
        WHEN 1007 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9b/Antedon_bifida.jpg'
        WHEN 1008 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/28/Echinarachnius_parma.jpg'
        WHEN 1009 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/45/Pycnopodia_helianthoides.jpg'
        WHEN 1010 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/19/Bohadschia_argus.jpg'
        WHEN 1011 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/93/Heterocentrotus_mammillatus.jpg'
        WHEN 1012 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6b/Oreaster_reticulatus.jpg'
        WHEN 1013 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/41/Gorgonocephalus_eucnemis.jpg'
        WHEN 1014 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0a/Thelenota_ananas.jpg'
        WHEN 1015 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6b/Strongylocentrotus_droebachiensis.jpg'
        WHEN 1016 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/15/Henricia_leviuscula.jpg'
        WHEN 1017 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3b/Toxopneustes_pileolus.jpg'
        WHEN 1018 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/93/Patiria_miniata.jpg'
        WHEN 1019 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/4a/Apostichopus_californicus.jpg'
        WHEN 1020 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/29/Ophiothrix_fragilis.jpg'
        WHEN 1021 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9e/Tripneustes_gratilla.jpg'
        WHEN 1022 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/25/Archaster_typicus.jpg'
        WHEN 1023 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/51/Holothuria_atra.jpg'
        WHEN 1024 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Paracentrotus_lividus.jpg'
        WHEN 1025 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6e/Linckia_laevigata.jpg'
        WHEN 1026 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/29/Ophiothrix_fragilis.jpg'
        WHEN 1027 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9b/Antedon_bifida.jpg'
        WHEN 1028 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/28/Echinarachnius_parma.jpg'
        WHEN 1029 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/29/Ophiothrix_fragilis.jpg'
        WHEN 1030 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/64/Holothuria_tubulosa.jpg'
        WHEN 1031 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/28/Echinarachnius_parma.jpg'
        WHEN 1032 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/73/Asterias_rubens.jpg'
        WHEN 1033 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/4a/Apostichopus_californicus.jpg'
        WHEN 1034 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/29/Ophiothrix_fragilis.jpg'
        WHEN 1035 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/2d/Diadema_antillarum.jpg'
        WHEN 1036 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6b/Oreaster_reticulatus.jpg'
        WHEN 1037 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/51/Holothuria_atra.jpg'
        WHEN 1038 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9b/Antedon_bifida.jpg'
        WHEN 1039 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3b/Toxopneustes_pileolus.jpg'
        WHEN 1040 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/73/Asterias_rubens.jpg'
        WHEN 1041 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/19/Bohadschia_argus.jpg'
        WHEN 1042 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6b/Strongylocentrotus_droebachiensis.jpg'
        WHEN 1043 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6e/Linckia_laevigata.jpg'
        WHEN 1044 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/29/Ophiothrix_fragilis.jpg'
        WHEN 1045 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/64/Holothuria_tubulosa.jpg'
        WHEN 1046 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Paracentrotus_lividus.jpg'
        WHEN 1047 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/73/Asterias_rubens.jpg'
        WHEN 1048 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9b/Antedon_bifida.jpg'
        WHEN 1049 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/64/Holothuria_tubulosa.jpg'
        WHEN 1050 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/59/Strongylocentrotus_purpuratus.jpg'
        WHEN 1051 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/15/Henricia_leviuscula.jpg'
        WHEN 1052 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/51/Holothuria_atra.jpg'
        WHEN 1053 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/29/Ophiothrix_fragilis.jpg'
        WHEN 1054 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9e/Tripneustes_gratilla.jpg'
        WHEN 1055 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/45/Pycnopodia_helianthoides.jpg'
        WHEN 1056 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/51/Holothuria_atra.jpg'
        WHEN 1057 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Paracentrotus_lividus.jpg'
        WHEN 1058 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/25/Archaster_typicus.jpg'
        WHEN 1059 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/29/Ophiothrix_fragilis.jpg'
        WHEN 1060 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9b/Antedon_bifida.jpg'
        WHEN 1061 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/73/Asterias_rubens.jpg'
        WHEN 1062 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/45/Pycnopodia_helianthoides.jpg'
        WHEN 1063 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/73/Asterias_rubens.jpg'
        WHEN 1064 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6e/Linckia_laevigata.jpg'
        WHEN 1065 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/93/Patiria_miniata.jpg'
        WHEN 1066 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/15/Henricia_leviuscula.jpg'
        WHEN 1067 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/25/Archaster_typicus.jpg'
        WHEN 1068 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/25/Archaster_typicus.jpg'
        WHEN 1069 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6e/Linckia_laevigata.jpg'
        WHEN 1070 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6b/Oreaster_reticulatus.jpg'
        WHEN 1071 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/59/Strongylocentrotus_purpuratus.jpg'
        WHEN 1072 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/2d/Diadema_antillarum.jpg'
        WHEN 1073 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6b/Strongylocentrotus_droebachiensis.jpg'
        WHEN 1074 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9e/Tripneustes_gratilla.jpg'
        WHEN 1075 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6b/Strongylocentrotus_droebachiensis.jpg'
        WHEN 1076 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/28/Echinarachnius_parma.jpg'
        WHEN 1077 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/28/Echinarachnius_parma.jpg'
        WHEN 1078 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/93/Heterocentrotus_mammillatus.jpg'
        WHEN 1079 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/64/Holothuria_tubulosa.jpg'
        WHEN 1080 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/64/Holothuria_tubulosa.jpg'
        WHEN 1081 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/19/Bohadschia_argus.jpg'
        WHEN 1082 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0a/Thelenota_ananas.jpg'
        WHEN 1083 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/51/Holothuria_atra.jpg'
        WHEN 1084 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/4a/Apostichopus_californicus.jpg'
        WHEN 1085 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0a/Thelenota_ananas.jpg'
        WHEN 1086 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/4a/Apostichopus_californicus.jpg'
        WHEN 1087 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/29/Ophiothrix_fragilis.jpg'
        WHEN 1088 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/41/Gorgonocephalus_eucnemis.jpg'
        WHEN 1089 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/29/Ophiothrix_fragilis.jpg'
        WHEN 1090 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/29/Ophiothrix_fragilis.jpg'
        WHEN 1091 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/41/Gorgonocephalus_eucnemis.jpg'
        WHEN 1092 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/41/Gorgonocephalus_eucnemis.jpg'
        WHEN 1093 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9b/Antedon_bifida.jpg'
        WHEN 1094 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9b/Antedon_bifida.jpg'
        WHEN 1095 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9b/Antedon_bifida.jpg'
        WHEN 1096 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9b/Antedon_bifida.jpg'
        WHEN 1097 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/28/Echinarachnius_parma.jpg'
        WHEN 1098 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/28/Echinarachnius_parma.jpg'
        WHEN 1099 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/28/Echinarachnius_parma.jpg'
        WHEN 1100 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/73/Asterias_rubens.jpg'
        WHEN 1101 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/15/Henricia_leviuscula.jpg'
        WHEN 1102 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6e/Linckia_laevigata.jpg'
        WHEN 1103 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/93/Patiria_miniata.jpg'
        WHEN 1104 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/45/Pycnopodia_helianthoides.jpg'
        WHEN 1105 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/25/Archaster_typicus.jpg'
        WHEN 1106 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6b/Oreaster_reticulatus.jpg'
        WHEN 1107 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/45/Pycnopodia_helianthoides.jpg'
        WHEN 1108 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/93/Patiria_miniata.jpg'
        WHEN 1109 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6b/Oreaster_reticulatus.jpg'
        WHEN 1110 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6b/Oreaster_reticulatus.jpg'
        WHEN 1111 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3f/Acanthaster_planci.jpg'
        WHEN 1112 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/73/Asterias_rubens.jpg'
        WHEN 1113 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/25/Archaster_typicus.jpg'
        WHEN 1114 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/73/Asterias_rubens.jpg'
        WHEN 1115 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/93/Patiria_miniata.jpg'
        WHEN 1116 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/15/Henricia_leviuscula.jpg'
        WHEN 1117 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/25/Archaster_typicus.jpg'
        WHEN 1118 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/15/Henricia_leviuscula.jpg'
        WHEN 1119 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6b/Oreaster_reticulatus.jpg'
        WHEN 1120 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/2d/Diadema_antillarum.jpg'
        WHEN 1121 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9e/Tripneustes_gratilla.jpg'
        WHEN 1122 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/59/Strongylocentrotus_purpuratus.jpg'
        WHEN 1123 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Paracentrotus_lividus.jpg'
        WHEN 1124 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/93/Heterocentrotus_mammillatus.jpg'
        WHEN 1125 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/28/Echinarachnius_parma.jpg'
        WHEN 1126 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/28/Echinarachnius_parma.jpg'
        WHEN 1127 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/59/Strongylocentrotus_purpuratus.jpg'
        WHEN 1128 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/93/Heterocentrotus_mammillatus.jpg'
        WHEN 1129 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9e/Tripneustes_gratilla.jpg'
        WHEN 1130 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3b/Toxopneustes_pileolus.jpg'
        WHEN 1131 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Paracentrotus_lividus.jpg'
        WHEN 1132 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/28/Echinarachnius_parma.jpg'
        WHEN 1133 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/2d/Diadema_antillarum.jpg'
        WHEN 1134 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6b/Strongylocentrotus_droebachiensis.jpg'
        WHEN 1135 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/51/Holothuria_atra.jpg'
        WHEN 1136 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0a/Thelenota_ananas.jpg'
        WHEN 1137 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/64/Holothuria_tubulosa.jpg'
        WHEN 1138 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/4a/Apostichopus_californicus.jpg'
        WHEN 1139 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/64/Holothuria_tubulosa.jpg'
        WHEN 1140 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/19/Bohadschia_argus.jpg'
        WHEN 1141 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/51/Holothuria_atra.jpg'
        WHEN 1142 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/64/Holothuria_tubulosa.jpg'
        WHEN 1143 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/19/Bohadschia_argus.jpg'
        WHEN 1144 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/51/Holothuria_atra.jpg'
        WHEN 1145 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/19/Bohadschia_argus.jpg'
        WHEN 1146 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/64/Holothuria_tubulosa.jpg'
        WHEN 1147 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0a/Thelenota_ananas.jpg'
        WHEN 1148 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/64/Holothuria_tubulosa.jpg'
        WHEN 1149 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/51/Holothuria_atra.jpg'
        WHEN 1150 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/29/Ophiothrix_fragilis.jpg'
        WHEN 1151 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/29/Ophiothrix_fragilis.jpg'
        WHEN 1152 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/41/Gorgonocephalus_eucnemis.jpg'
        WHEN 1153 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/29/Ophiothrix_fragilis.jpg'
        WHEN 1154 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/29/Ophiothrix_fragilis.jpg'
        WHEN 1155 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/41/Gorgonocephalus_eucnemis.jpg'
        WHEN 1156 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/29/Ophiothrix_fragilis.jpg'
        WHEN 1157 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/29/Ophiothrix_fragilis.jpg'
        WHEN 1158 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/41/Gorgonocephalus_eucnemis.jpg'
        WHEN 1159 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/29/Ophiothrix_fragilis.jpg'
        WHEN 1160 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/29/Ophiothrix_fragilis.jpg'
        WHEN 1161 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/41/Gorgonocephalus_eucnemis.jpg'
        WHEN 1162 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/29/Ophiothrix_fragilis.jpg'
        WHEN 1163 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/29/Ophiothrix_fragilis.jpg'
        WHEN 1164 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/29/Ophiothrix_fragilis.jpg'
        WHEN 1165 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9b/Antedon_bifida.jpg'
        WHEN 1166 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9b/Antedon_bifida.jpg'
        WHEN 1167 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9b/Antedon_bifida.jpg'
        WHEN 1168 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9b/Antedon_bifida.jpg'
        WHEN 1169 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9b/Antedon_bifida.jpg'
        WHEN 1170 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9b/Antedon_bifida.jpg'
        WHEN 1171 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9b/Antedon_bifida.jpg'
        WHEN 1172 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9b/Antedon_bifida.jpg'
        WHEN 1173 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9b/Antedon_bifida.jpg'
        WHEN 1174 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9b/Antedon_bifida.jpg'
        WHEN 1175 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/28/Echinarachnius_parma.jpg'
        WHEN 1176 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/28/Echinarachnius_parma.jpg'
        WHEN 1177 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/28/Echinarachnius_parma.jpg'
        WHEN 1178 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/28/Echinarachnius_parma.jpg'
        WHEN 1179 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/28/Echinarachnius_parma.jpg'
        WHEN 1180 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/28/Echinarachnius_parma.jpg'
        WHEN 1181 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/28/Echinarachnius_parma.jpg'
        WHEN 1182 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/28/Echinarachnius_parma.jpg'
        WHEN 1183 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/28/Echinarachnius_parma.jpg'
        WHEN 1184 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/28/Echinarachnius_parma.jpg'
        WHEN 1185 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/45/Pycnopodia_helianthoides.jpg'
        WHEN 1186 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/25/Archaster_typicus.jpg'
        WHEN 1187 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3f/Acanthaster_planci.jpg'
        WHEN 1188 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/93/Patiria_miniata.jpg'
        WHEN 1189 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/25/Archaster_typicus.jpg'
        WHEN 1190 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/59/Strongylocentrotus_purpuratus.jpg'
        WHEN 1191 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6b/Strongylocentrotus_droebachiensis.jpg'
        WHEN 1192 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/28/Echinarachnius_parma.jpg'
        WHEN 1193 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/2d/Diadema_antillarum.jpg'
        WHEN 1194 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6b/Strongylocentrotus_droebachiensis.jpg'
        WHEN 1195 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/64/Holothuria_tubulosa.jpg'
        WHEN 1196 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/19/Bohadschia_argus.jpg'
        WHEN 1197 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/51/Holothuria_atra.jpg'
        WHEN 1198 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0a/Thelenota_ananas.jpg'
        WHEN 1199 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/4a/Apostichopus_californicus.jpg'
        WHEN 1200 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/29/Ophiothrix_fragilis.jpg'
        WHEN 1201 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/29/Ophiothrix_fragilis.jpg'
        WHEN 1202 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/29/Ophiothrix_fragilis.jpg'
        WHEN 1203 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/41/Gorgonocephalus_eucnemis.jpg'
        WHEN 1204 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/29/Ophiothrix_fragilis.jpg'
        WHEN 1205 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/73/Asterias_rubens.jpg'
        WHEN 1206 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/73/Asterias_rubens.jpg'
        WHEN 1207 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/93/Patiria_miniata.jpg'
        WHEN 1208 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/15/Henricia_leviuscula.jpg'
        WHEN 1209 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/15/Henricia_leviuscula.jpg'
        WHEN 1210 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6b/Oreaster_reticulatus.jpg'
        WHEN 1211 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6b/Oreaster_reticulatus.jpg'
        WHEN 1212 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6e/Linckia_laevigata.jpg'
        WHEN 1213 THEN 'https://upload.wikimedia.org/wikipedia/commons/1/15/Henricia_leviuscula.jpg'
        WHEN 1214 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/25/Archaster_typicus.jpg'
        WHEN 1215 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/25/Archaster_typicus.jpg'
        WHEN 1216 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/25/Archaster_typicus.jpg'
        WHEN 1217 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/25/Archaster_typicus.jpg'
        WHEN 1218 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/25/Archaster_typicus.jpg'
        WHEN 1219 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6b/Oreaster_reticulatus.jpg'
        WHEN 1220 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/93/Patiria_miniata.jpg'
        WHEN 1221 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/45/Pycnopodia_helianthoides.jpg'
        WHEN 1222 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6e/Linckia_laevigata.jpg'
        WHEN 1223 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/73/Asterias_rubens.jpg'
        WHEN 1224 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/93/Patiria_miniata.jpg'
        WHEN 1225 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/25/Archaster_typicus.jpg'
        WHEN 1226 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/25/Archaster_typicus.jpg'
        WHEN 1227 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/93/Patiria_miniata.jpg'
        WHEN 1228 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/45/Pycnopodia_helianthoides.jpg'
        WHEN 1229 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6e/Linckia_laevigata.jpg'
        WHEN 1230 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/93/Heterocentrotus_mammillatus.jpg'
        WHEN 1231 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Paracentrotus_lividus.jpg'
        WHEN 1232 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/2d/Diadema_antillarum.jpg'
        WHEN 1233 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Paracentrotus_lividus.jpg'
        WHEN 1234 THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6b/Strongylocentrotus_droebachiensis.jpg'
        WHEN 1235 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9e/Tripneustes_gratilla.jpg'
        WHEN 1236 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/9e/Tripneustes_gratilla.jpg'
        WHEN 1237 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3b/Toxopneustes_pileolus.jpg'
        WHEN 1238 THEN 'https://upload.wikimedia.org/wikipedia/commons/9/93/Heterocentrotus_mammillatus.jpg'
        WHEN 1239 THEN 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Paracentrotus_lividus.jpg'
        WHEN 1240 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/28/Echinarachnius_parma.jpg'
        WHEN 1241 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/28/Echinarachnius_parma.jpg'
        WHEN 1242 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/28/Echinarachnius_parma.jpg'
        WHEN 1243 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/28/Echinarachnius_parma.jpg'
        WHEN 1244 THEN 'https://upload.wikimedia.org/wikipedia/commons/2/2d/Diadema_antillarum.jpg'
        WHEN 1245 THEN 'https://upload.wikimedia.org/wikipedia/commons/3/3b/Toxopneustes_pileolus.jpg'
        WHEN 1246 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/59/Strongylocentrotus_purpuratus.jpg'
        WHEN 1247 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0a/Thelenota_ananas.jpg'
        WHEN 1248 THEN 'https://upload.wikimedia.org/wikipedia/commons/0/0a/Thelenota_ananas.jpg'
        WHEN 1249 THEN 'https://upload.wikimedia.org/wikipedia/commons/5/51/Holothuria_atra.jpg'
        WHEN 1250 THEN 'https://upload.wikimedia.org/wikipedia/commons/4/4a/Apostichopus_californicus.jpg'
        ELSE foto_insetos
    END
WHERE id_insetos BETWEEN 1 AND 1250;
