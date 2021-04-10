final createTable = '''
  CREATE TABLE presente(
    id INTEGER NOT NULL PRIMARY KEY
    ,nome VARCHAR(200) NOT NULL
    ,unidade INTEGER NOT NULL
    ,valorEstimado double NOT NULL
    ,url_avatar VARCHAR(300) NOT NULL 
  )
''';

final insert1 = '''
INSERT INTO presente (nome, unidade, valorEstimado, url_presente)
VALUES ('6 COPOS LIGTHS LONG','1','19.99','https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSyVL25VDSQNcxejiPKH-qwyjwmicSOIhfhv5HqGszqbQ-7Z666CmRdi7X7wb1sQYME8ThCKwUGoA&usqp=CAc')
''';

final insert2 = '''
INSERT INTO presente(nome, unidade, valorEstimado, url_presente)
VALUES ('KIT COOK HOME 9 ARTHI','1', '159.99','https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSdudfFmw69buH8PyhbwUBLgcBioQrrbrln-fLXWV5CdQAS3o3Fdx_hz37J-cr_ztyStpMh_-vwH6c&usqp=CAc')
''';

final insert3 = '''
INSERT INTO presente (nome, unidade, valorEstimado, url_presente)
VALUES ('CJ 2FRIG 16/20 AA CARIBE TRAMONTINA','1','50','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmtjXoA3M_Lgn6tldgH1D5BujERDEsnpqc4koYiqsklKdCsz5yb497O4jPsCzGM-EJYhw&usqp=CAU')
''';
