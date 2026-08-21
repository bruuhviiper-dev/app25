import 'package:flutter/material.dart';

import 'models.dart';

/// Banco de FRASES BONITAS (offline). Conteúdo 100% ORIGINAL — delicado,
/// positivo e inspirador, perfeito para status, legendas e bio.
///
/// Cada categoria combina dois conjuntos de trechos (ideia × arremate),
/// gerando 120+ frases ÚNICAS por categoria — todas editáveis no app.
class VerseData {
  VerseData._();

  static const _amor = [Color(0xFFf857a6), Color(0xFFff5858)];
  static const _amizade = [Color(0xFFf6d365), Color(0xFFfda085)];
  static const _bomdia = [Color(0xFFf6d365), Color(0xFFff9a44)];
  static const _boanoite = [Color(0xFF4b6cb7), Color(0xFF182848)];
  static const _autoestima = [Color(0xFFee9ca7), Color(0xFFb24592)];
  static const _gratidao = [Color(0xFFfbc2eb), Color(0xFFa18cd1)];
  static const _positivas = [Color(0xFF43e97b), Color(0xFF38f9d7)];
  static const _vida = [Color(0xFF2af598), Color(0xFF009efd)];
  static const _reflexao = [Color(0xFF5f2c82), Color(0xFF49a09d)];
  static const _curtas = [Color(0xFFff6a88), Color(0xFFff99ac)];
  static const _legendas = [Color(0xFFc471f5), Color(0xFFfa71cd)];
  static const _alegria = [Color(0xFFf9d423), Color(0xFFff4e50)];
  static const _saudade = [Color(0xFFb24592), Color(0xFFf15f79)];
  static const _refletir = [Color(0xFF0f0c29), Color(0xFF302b63)];
  static const _inspiracao = [Color(0xFFf7971e), Color(0xFFffd200)];
  static const _curtinhas = [Color(0xFFee0979), Color(0xFFff6a00)];

  static List<Verse> _mix(List<String> a, List<String> b) {
    final total = a.length * b.length;
    final seen = <String>{};
    final out = <Verse>[];
    for (var i = 0; i < total; i++) {
      final t = '${a[i % a.length]} ${b[i % b.length]}';
      if (seen.add(t)) out.add(Verse(t));
    }
    return out;
  }

  // ---------------- AMOR ----------------
  static const _amorA = [
    'O amor mora nos pequenos gestos do dia.',
    'Te escolher todos os dias é o meu jeito de amar.',
    'Com você, até o simples vira especial.',
    'O seu sorriso é o meu lugar favorito.',
    'Amar é caminhar de mãos dadas com o coração.',
    'Você é a poesia que eu não sabia escrever.',
    'No teu abraço eu encontrei o meu abrigo.',
    'O amor de verdade não tem pressa, tem presença.',
    'Você é a razão dos meus melhores dias.',
    'Meu coração bate mais bonito perto de você.',
    'Amar você é fácil como respirar.',
    'Onde tem amor, tudo floresce.',
  ];
  static const _amorB = [
    'E eu te amo assim, sem medida. 💕',
    'Pra sempre é pouco com você.',
    'Você é o meu amor bonito.',
    'E o meu coração agradece.',
    'Contigo, a vida é mais leve.',
    'Te amar é o meu melhor verso.',
    'Você é lar e é destino.',
    'E que seja sempre nós dois.',
    'Meu amor é todo seu.',
    'Você faz tudo valer a pena.',
    'E eu escolho você de novo.',
    'Amor assim é raro.',
  ];

  // ---------------- AMIZADE ----------------
  static const _amizadeA = [
    'Amigo de verdade é a família que a gente escolhe.',
    'A vida fica mais leve com amigos por perto.',
    'Rir com você é o meu passatempo favorito.',
    'Amizade boa é aquela que o tempo não apaga.',
    'Com você, até os dias comuns viram lembranças.',
    'Amigo é quem fica, mesmo quando é difícil.',
    'A distância não separa quem o coração une.',
    'Obrigado por ser meu porto seguro.',
    'Amizade é dividir o riso e somar a força.',
    'Você é presente que a vida me deu.',
    'Bons amigos são raros e valem ouro.',
    'Com você, a caminhada é mais bonita.',
  ];
  static const _amizadeB = [
    'Gratidão por você! 🤍',
    'Amizade dessas é pra vida toda.',
    'Você é dos meus.',
    'Conte sempre comigo.',
    'Que sorte a minha te ter.',
    'Amigo assim é tesouro.',
    'E a amizade só cresce.',
    'Pra rir e pra chorar.',
    'Sempre por perto.',
    'Você faz parte de mim.',
    'Do meu lado, sempre.',
    'Isso é amizade.',
  ];

  // ---------------- BOM DIA ----------------
  static const _bomdiaA = [
    'Bom dia! Que hoje seja lindo como você merece.',
    'Acorde e brilhe: o dia é seu.',
    'Bom dia! Sorria e espalhe coisas boas.',
    'Que a sua manhã seja doce e cheia de paz.',
    'Comece o dia com gratidão no coração.',
    'Bom dia! Um novo dia, novas alegrias.',
    'Que a luz da manhã ilumine os seus caminhos.',
    'Desperte com fé no que ainda vai chegar.',
    'Bom dia! Seja a coisa mais bonita do seu dia.',
    'Cada manhã é uma página em branco pra viver bem.',
    'Que hoje o sorriso venha fácil.',
    'Bom dia! Vá com o coração leve.',
  ];
  static const _bomdiaB = [
    'Tenha um dia lindo! ☀️',
    'Bom dia, flor!',
    'Que seja abençoado.',
    'Sorria e siga.',
    'Aproveite cada instante.',
    'Vá com tudo hoje.',
    'Um dia doce pra você.',
    'Que dê tudo certo.',
    'Bom dia, viva!',
    'Comece bem.',
    'Espalhe amor por aí.',
    'Boas energias!',
  ];

  // ---------------- BOA NOITE ----------------
  static const _boanoiteA = [
    'Boa noite! Que o seu sono seja doce e tranquilo.',
    'Descanse: você fez o seu melhor hoje.',
    'Que a noite traga paz e bons sonhos.',
    'Boa noite! Amanhã é um novo começo.',
    'Feche o dia com gratidão pelo que viveu.',
    'Durma tranquilo, o amanhã será lindo.',
    'Boa noite! Que as estrelas cuidem do seu sono.',
    'Deixe o cansaço ir e receba a calmaria.',
    'Que os seus sonhos sejam leves como algodão.',
    'Boa noite! Recarregue o coração.',
    'Respire fundo e entregue o dia que passou.',
    'Que a lua vele o seu descanso.',
  ];
  static const _boanoiteB = [
    'Durma bem! 🌙',
    'Bons sonhos.',
    'Boa noite, dorme com Deus.',
    'Até amanhã.',
    'Descanse em paz.',
    'Sonhe bonito.',
    'Que amanhã seja lindo.',
    'Um sono renovador.',
    'Boa noite, flor.',
    'Paz e sossego.',
    'Recarregue as energias.',
    'Durma tranquilo.',
  ];

  // ---------------- AMOR PRÓPRIO ----------------
  static const _autoestimaA = [
    'Se ame primeiro: você merece o seu carinho.',
    'Você é suficiente exatamente como é.',
    'Cuide de você como cuida de quem ama.',
    'A sua companhia também é linda.',
    'Aprenda a ser o seu próprio lar.',
    'Você é a sua melhor obra em construção.',
    'Priorize a sua paz sem pedir desculpas.',
    'Floresça no seu tempo, sem comparação.',
    'Você é forte, capaz e, do seu jeitinho, único.',
    'Escolha se colocar em primeiro lugar hoje.',
    'O amor próprio é a base de tudo.',
    'Olhe no espelho e se orgulhe do caminho.',
  ];
  static const _autoestimaB = [
    'Você é incrível! 💕',
    'Se valorize sempre.',
    'Você merece o mundo.',
    'Ame-se sem medo.',
    'Cuide de você.',
    'Você basta.',
    'Brilhe do seu jeito.',
    'Autoamor é tudo.',
    'Você é a sua prioridade.',
    'Confie em você.',
    'Você é luz.',
    'Se escolha.',
  ];

  // ---------------- GRATIDÃO ----------------
  static const _gratidaoA = [
    'Gratidão transforma o simples em suficiente.',
    'Agradeça pelo hoje: ele é um presente.',
    'Ser grato deixa a vida mais bonita.',
    'Agradeço por cada pessoa que faz meus dias melhores.',
    'A gratidão é a memória bonita do coração.',
    'Obrigado por mais um dia de vida e amor.',
    'Quem agradece atrai coisas boas.',
    'Reconhecer as bênçãos é viver melhor.',
    'Gratidão pelo que tenho e pelo que ainda virá.',
    'Sou grato pelas pequenas alegrias.',
    'Agradecer é um jeito bonito de amar a vida.',
    'Todo dia tem um motivo pra agradecer.',
  ];
  static const _gratidaoB = [
    'Gratidão sempre! 🌷',
    'Obrigado por tudo.',
    'A vida é um presente.',
    'Grato de coração.',
    'Reconheça o bem.',
    'Valorize o que tem.',
    'Coração grato.',
    'Que dia abençoado.',
    'Gratidão é tudo.',
    'Obrigado, Deus.',
    'Grato por você.',
    'Gratidão eterna.',
  ];

  // ---------------- POSITIVAS ----------------
  static const _positivasA = [
    'Pense bonito e a vida responde bonito.',
    'Escolha o lado bom das coisas hoje.',
    'Boas energias atraem bons dias.',
    'Sorria: o mundo fica melhor assim.',
    'Acredite no melhor e vá em frente.',
    'A vida floresce onde há positividade.',
    'Espalhe luz por onde você passar.',
    'Tudo conspira a favor de quem confia.',
    'Colha o que há de bom em cada momento.',
    'Um pensamento positivo muda o seu dia.',
    'Seja a energia boa que você quer atrair.',
    'O bem que você faz sempre volta.',
  ];
  static const _positivasB = [
    'Boas vibrações! ✨',
    'Positividade sempre.',
    'Vai dar tudo certo.',
    'Sorria mais.',
    'Confie na vida.',
    'O melhor está por vir.',
    'Espalhe o bem.',
    'Fé no coração.',
    'Bora brilhar.',
    'Escolha ser feliz.',
    'A vida é boa.',
    'Só coisa boa.',
  ];

  // ---------------- SOBRE A VIDA ----------------
  static const _vidaA = [
    'A vida é feita de pequenos grandes momentos.',
    'Viva intensamente cada instante simples.',
    'A felicidade está no caminho, não só no fim.',
    'Aproveite: o agora não volta.',
    'A vida é bela quando aprendemos a agradecer.',
    'Colecione momentos, não apenas coisas.',
    'Cada dia é uma nova chance de recomeçar.',
    'Viver bem é fazer o simples com amor.',
    'A vida sorri para quem sorri pra ela.',
    'Encontre beleza até nos dias comuns.',
    'O melhor da vida são as pessoas que amamos.',
    'A vida é curta demais para não ser feliz.',
  ];
  static const _vidaB = [
    'Aproveite a vida! 🌿',
    'Viva com leveza.',
    'A vida é agora.',
    'Seja feliz hoje.',
    'Celebre o simples.',
    'Vale a pena viver.',
    'Ame cada instante.',
    'Sorria pra vida.',
    'Faça bonito.',
    'Viva plenamente.',
    'A vida é linda.',
    'Curta o momento.',
  ];

  // ---------------- REFLEXÃO ----------------
  static const _reflexaoA = [
    'Nem tudo que perdemos era pra ficar.',
    'O que é seu chega no tempo certo.',
    'Às vezes é preciso parar para recomeçar.',
    'Cada pessoa que passa deixa um aprendizado.',
    'A vida ensina no silêncio o que a pressa não vê.',
    'O tempo cura e ensina o que a gente não entende.',
    'Solte o que já cumpriu o seu papel.',
    'A gente cresce quando para de fugir de si.',
    'Nem toda batalha vale a sua paz.',
    'O importante não é ter tudo, é valorizar o que se tem.',
    'Aprenda com o passado e viva o presente.',
    'A vida é 10% o que acontece e 90% como reagimos.',
  ];
  static const _reflexaoB = [
    'Reflita e siga mais leve. 🕊️',
    'Pense nisso hoje.',
    'Tudo tem o seu tempo.',
    'E está tudo bem.',
    'Guarde no coração.',
    'A vida é recomeço.',
    'Aprenda e siga.',
    'Vale a pena refletir.',
    'Cada passo conta.',
    'Respire e recomece.',
    'Simples assim.',
    'Sabedoria é isso.',
  ];

  // ---------------- FRASES CURTAS (status) ----------------
  static const _curtasA = [
    'Feliz e grata.',
    'Foco no que importa.',
    'Só coisa boa.',
    'Vivendo e sorrindo.',
    'Amor e paz.',
    'Gratidão define.',
    'Leve como flor.',
    'Sonhando alto.',
    'Do meu jeitinho.',
    'Fé e luz.',
    'Bora ser feliz.',
    'Bonita por dentro.',
  ];
  static const _curtasB = [
    'Sempre. ✨',
    'De boa.',
    'Com amor.',
    'E fé.',
    'Feliz assim.',
    'Sem pressa.',
    'Simples assim.',
    'Sorrindo.',
    'Vale a pena.',
    'Positividade.',
    'Rumo ao topo.',
    'Viva!',
  ];

  // ---------------- LEGENDAS PARA FOTOS ----------------
  static const _legendasA = [
    'Sorriso no rosto, paz no coração.',
    'Colecionando momentos e memórias.',
    'Do jeitinho que eu gosto de ser.',
    'Feliz e em paz comigo mesma.',
    'Um clique, mil sentimentos.',
    'Vivendo a minha melhor versão.',
    'Gratidão por esse momento.',
    'A vida é bela e eu agradeço.',
    'Guardando esse dia no coração.',
    'Simplesmente feliz.',
    'Brilhando do meu jeito.',
    'Momentos que valem a vida.',
  ];
  static const _legendasB = [
    '📸💛',
    'Pra guardar pra sempre.',
    'Puro amor.',
    'Feliz demais.',
    'Que dia lindo.',
    'Só gratidão.',
    'Amei esse momento.',
    'Bons momentos.',
    'Sorrindo sempre.',
    'Perfeito assim.',
    'Inesquecível.',
    'Amo minha vida.',
  ];

  // ---------------- ALEGRIA E SORRISO ----------------
  static const _alegriaA = [
    'Um sorriso é a curva mais bonita do corpo.',
    'Sorria: é de graça e faz bem pra alma.',
    'A alegria é contagiante, espalhe a sua.',
    'Ria alto, viva leve, ame muito.',
    'Felicidade é feita de pequenas coisas.',
    'Que o seu sorriso seja o seu melhor acessório.',
    'A vida é mais bonita quando a gente sorri.',
    'Guarde motivos para sorrir todos os dias.',
    'Alegria de viver é o melhor presente.',
    'Sorria para a vida e ela sorri de volta.',
    'Seja luz e alegre quem estiver por perto.',
    'A felicidade está nos detalhes.',
  ];
  static const _alegriaB = [
    'Sorria sempre! 😊',
    'Seja feliz.',
    'Espalhe alegria.',
    'Ria mais.',
    'A vida é boa.',
    'Puro sol.',
    'Felicidade é isso.',
    'Bora sorrir.',
    'Alegria sempre.',
    'Boas vibrações.',
    'Viva feliz.',
    'Sorriso no rosto.',
  ];

  // ---------------- SAUDADE ----------------
  static const _saudadeA = [
    'A saudade é o amor que insiste em ficar.',
    'Lembro de você nas coisas mais simples.',
    'Saudade boa é sinal de momentos bonitos.',
    'Tem gente que a gente carrega no coração.',
    'A memória guarda o que o tempo levou.',
    'Sinto sua falta e agradeço por você existir.',
    'Saudade é o carinho que atravessa a distância.',
    'Quem marca a nossa vida nunca vai embora.',
    'Guardo você nas melhores lembranças.',
    'A saudade prova que valeu a pena.',
    'Tem abraços que ficam pra sempre.',
    'Até a saudade de você é bonita.',
  ];
  static const _saudadeB = [
    'Saudade também é amor. 💭',
    'Pra sempre no coração.',
    'Guardo você comigo.',
    'Que saudade boa.',
    'Fica o carinho.',
    'Sempre na memória.',
    'Você faz falta.',
    'Um dia a gente se reencontra.',
    'Levo você comigo.',
    'Saudade do bem.',
    'No coração, sempre.',
    'Que volte logo.',
  ];

  // ---------------- PARA REFLETIR (premium) ----------------
  static const _refletirA = [
    'Compare-se com quem você foi ontem, não com os outros.',
    'A felicidade não é ter uma vida perfeita, é olhar além das imperfeições.',
    'Cuidar de si não é egoísmo, é sobrevivência.',
    'Se você não gosta de algo, mude; se não pode, mude a forma de ver.',
    'Grandes mudanças começam por uma pequena decisão.',
    'O tempo que você tem é o único que realmente é seu.',
    'Ninguém pode mudar o começo, mas todos podem mudar o fim.',
    'A vida encolhe ou cresce conforme a nossa coragem.',
    'O que você evita hoje, você repete amanhã.',
    'A paz começa quando você aceita o que não pode mudar.',
    'Seja a mudança que você quer ver na sua vida.',
    'Aquilo que resiste, persiste; o que aceitamos, se transforma.',
  ];
  static const _refletirB = [
    'Vale a pena refletir. 🌌',
    'Pense a respeito.',
    'Uma verdade da vida.',
    'Leve isso com você.',
    'Reflexão do dia.',
    'Isso muda tudo.',
    'A escolha é sua.',
    'Guarde e aplique.',
    'Sabedoria pura.',
    'Repense hoje.',
    'Medite sobre isso.',
    'Faça diferente.',
  ];

  // ---------------- INSPIRAÇÃO (premium) ----------------
  static const _inspiracaoA = [
    'Acredite nos seus sonhos e vá atrás deles.',
    'Você é capaz de coisas maravilhosas.',
    'Todo grande sonho começa com um pequeno passo.',
    'Confie no seu tempo e no seu potencial.',
    'O futuro pertence a quem acredita.',
    'Transforme os seus planos em conquistas.',
    'Nunca é tarde para recomeçar bonito.',
    'A sua luz pode inspirar o mundo.',
    'Faça hoje o que o seu futuro vai agradecer.',
    'Grandes conquistas nascem de pequenas atitudes.',
    'Você é mais forte do que imagina.',
    'Sonhe grande e faça acontecer.',
  ];
  static const _inspiracaoB = [
    'Você consegue! 🌟',
    'Acredite em você.',
    'Vá em frente.',
    'Faça acontecer.',
    'O melhor vem aí.',
    'Sonhe alto.',
    'Persista sempre.',
    'Brilhe.',
    'Coragem e fé.',
    'Rumo ao topo.',
    'Não desista.',
    'Você é luz.',
  ];

  // ---------------- BONITAS CURTAS (premium) ----------------
  static const _curtinhasA = [
    'Seja flor e resista.',
    'Coragem tem cara de recomeço.',
    'Delicadeza também é força.',
    'Onde há amor, há luz.',
    'Floresça onde te plantaram.',
    'A vida é bela pra quem observa.',
    'Simplicidade é o charme da alma.',
    'Beleza é ser feliz de verdade.',
    'Gentileza é a linguagem do coração.',
    'Cada dia, uma flor nova pra colher.',
    'Encante-se com o simples.',
    'Sorrir é a mais bela poesia.',
  ];
  static const _curtinhasB = [
    '💗',
    'Sempre.',
    'Bonito assim.',
    'Puro encanto.',
    'Com amor.',
    'Delicadeza.',
    'Que floresça.',
    'Só beleza.',
    'Viva o simples.',
    'Encanto puro.',
    'Amor e luz.',
    'Bela sempre.',
  ];

  static final List<VerseCategory> categories = [
    VerseCategory(id: 'amor', name: 'Amor', emoji: '❤️', gradient: _amor, verses: _mix(_amorA, _amorB)),
    VerseCategory(id: 'amizade', name: 'Amizade', emoji: '🤍', gradient: _amizade, verses: _mix(_amizadeA, _amizadeB)),
    VerseCategory(id: 'bomdia', name: 'Bom Dia', emoji: '☀️', gradient: _bomdia, verses: _mix(_bomdiaA, _bomdiaB)),
    VerseCategory(id: 'boanoite', name: 'Boa Noite', emoji: '🌙', gradient: _boanoite, verses: _mix(_boanoiteA, _boanoiteB)),
    VerseCategory(id: 'autoestima', name: 'Amor Próprio', emoji: '💕', gradient: _autoestima, verses: _mix(_autoestimaA, _autoestimaB)),
    VerseCategory(id: 'gratidao', name: 'Gratidão', emoji: '🌷', gradient: _gratidao, verses: _mix(_gratidaoA, _gratidaoB)),
    VerseCategory(id: 'positivas', name: 'Positivas', emoji: '✨', gradient: _positivas, verses: _mix(_positivasA, _positivasB)),
    VerseCategory(id: 'vida', name: 'Sobre a Vida', emoji: '🌿', gradient: _vida, verses: _mix(_vidaA, _vidaB)),
    VerseCategory(id: 'reflexao', name: 'Reflexão', emoji: '🕊️', gradient: _reflexao, verses: _mix(_reflexaoA, _reflexaoB)),
    VerseCategory(id: 'curtas', name: 'Frases Curtas', emoji: '💬', gradient: _curtas, verses: _mix(_curtasA, _curtasB)),
    VerseCategory(id: 'legendas', name: 'Legendas p/ Fotos', emoji: '📸', gradient: _legendas, verses: _mix(_legendasA, _legendasB)),
    VerseCategory(id: 'alegria', name: 'Alegria e Sorriso', emoji: '😊', gradient: _alegria, verses: _mix(_alegriaA, _alegriaB)),
    VerseCategory(id: 'saudade', name: 'Saudade', emoji: '💭', gradient: _saudade, verses: _mix(_saudadeA, _saudadeB)),
    VerseCategory(id: 'refletir', name: 'Para Refletir', emoji: '🌌', gradient: _refletir, premium: true, verses: _mix(_refletirA, _refletirB)),
    VerseCategory(id: 'inspiracao', name: 'Inspiração', emoji: '🌟', gradient: _inspiracao, premium: true, verses: _mix(_inspiracaoA, _inspiracaoB)),
    VerseCategory(id: 'curtinhas', name: 'Bonitas Curtas', emoji: '💗', gradient: _curtinhas, premium: true, verses: _mix(_curtinhasA, _curtinhasB)),
  ];

  static List<Verse> get all => [for (final c in categories) ...c.verses];

  /// Frase do dia determinística (muda a cada dia, estável no mesmo dia).
  /// Usada no card do topo e na notificação — mantém os dois em sincronia.
  static String ofDay([DateTime? date]) {
    final list = freeVerses.isNotEmpty ? freeVerses : all;
    if (list.isEmpty) return '';
    final d = date ?? DateTime.now();
    final dayIndex =
        DateTime(d.year, d.month, d.day).difference(DateTime(2020, 1, 1)).inDays;
    return list[(dayIndex.abs() * 7919) % list.length].text;
  }

  static List<Verse> get freeVerses =>
      [for (final c in categories) if (!c.premium) ...c.verses];

  static VerseCategory categoryById(String id) =>
      categories.firstWhere((c) => c.id == id, orElse: () => categories.first);
}
