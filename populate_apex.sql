create or replace PROCEDURE "POPULATE_APEX_TABLES" 
IS
rowCountPoiis number;
rowCountApex number;
err_code varchar2(255);
      err_msg varchar2(255);


BEGIN

SAVEPOINT apex_sp;

/* 
************************************************
Wyczysc i zape³nij tmp_umowyprogramy
************************************************
*/ 


select count (*) into rowCountApex from tmp_umowyprogramy;
execute immediate 'truncate table tmp_umowyprogramy';
INSERT INTO tmp_umowyprogramy 
SELECT  *
FROM    dbo.TMP_UmowyProgramy@LIVE_POIS;

select count (*) into rowCountPoiis from dbo.TMP_UmowyProgramy@LIVE_POIS;

INSERT INTO POIS_LOG 
VALUES
(
seq_procedure.nextval,
'Pobrano ' || to_char(rowCountPoiis) || ' rekordów, usunieto: ' || to_char(rowCountApex) || ' rekordów.',
'populate_apex_tables',
CURRENT_TIMESTAMP,
'dbo.TMP_UmowyProgramy',
'tmp_umowyprogramy'
);

/* 
************************************************
Wyczysc i zape³nij SL_CECHY NIEAKYWNE
************************************************
 
select count (*) into rowCountApex from sl_cechy;
execute immediate 'truncate table sl_cechy';
INSERT INTO sl_cechy 
SELECT  *
FROM    dbo.SL_cechy@LIVE_POIS;

select count (*) into rowCountPoiis from dbo.SL_Cechy@LIVE_POIS;

INSERT INTO POIS_LOG
VALUES
(
seq_procedure.nextval,
'Pobrano '|| to_char(rowCountPoiis) || ' rekordów, usunieto: ' || to_char(rowCountApex) || ' rekordów.',
'populate_apex_tables',
CURRENT_TIMESTAMP,
'dbo.SL_cechy',
'sl_cechy'
);
*/

/* 
************************************************
Wyczysc i zape³nij TAB_CECHY_PROJEKTU
************************************************
*/ 
select count (*) into rowCountApex from tab_cechyprojektu;
execute immediate 'truncate table tab_cechyprojektu';
INSERT INTO tab_cechyprojektu
SELECT  *
FROM    dbo.TAB_cechyprojektu@LIVE_POIS;

select count (*) into rowCountPoiis from dbo.TAB_cechyprojektu@LIVE_POIS;

INSERT INTO POIS_LOG
VALUES
(
seq_procedure.nextval,
'Pobrano '|| to_char(rowCountPoiis) || ' rekordów, usunieto: ' || to_char(rowCountApex) || ' rekordów.',
'populate_apex_tables',
CURRENT_TIMESTAMP,
'dbo.TAB_cechy_projektu',
'tab_cechyprojektu'
);





/* 
************************************************
Wyczysc i zape³nij SL_DEPARTAMENTY
************************************************
*/ 



select count (*) into rowCountApex from sl_departamenty;
execute immediate 'truncate table sl_departamenty';
INSERT INTO sl_departamenty 
SELECT  *
FROM    dbo.SL_departamenty@LIVE_POIS;

select count (*) into rowCountPoiis from dbo.SL_Departamenty@LIVE_POIS;

INSERT INTO POIS_LOG
VALUES
(
seq_procedure.nextval,
'Pobrano '|| to_char(rowCountPoiis) || ' rekordów, usunieto: ' || to_char(rowCountApex) || ' rekordów.',
'populate_apex_tables',
CURRENT_TIMESTAMP,
'dbo.SL_departamenty',
'sl_departamenty'
);




/* 
************************************************
Wyczysc i zape³nij SL_EKOLOGICZNE
************************************************
*/ 
select count (*) into rowCountApex from sl_ekologiczne;
execute immediate 'truncate table sl_ekologiczne';
INSERT INTO sl_ekologiczne
SELECT  *
FROM    dbo.SL_ekologiczne@LIVE_POIS;

select count (*) into rowCountPoiis from dbo.SL_ekologiczne@LIVE_POIS;

INSERT INTO POIS_LOG
VALUES
(
seq_procedure.nextval,
'Pobrano '|| to_char(rowCountPoiis) || ' rekordów, usunieto: ' || to_char(rowCountApex) || ' rekordów.',
'populate_apex_tables',
CURRENT_TIMESTAMP,
'dbo.SL_ekologiczne',
'sl_ekologiczne'
);



/* 
************************************************
Wyczysc i zape³nij SL_GMINY
************************************************
*/ 

select count (*) into rowCountApex from sl_gminy;
execute immediate 'truncate table sl_gminy';
INSERT INTO sl_gminy
SELECT  *
FROM    dbo.SL_departamenty@LIVE_POIS;

select count (*) into rowCountPoiis from dbo.SL_Departamenty@LIVE_POIS;

INSERT INTO POIS_LOG
VALUES
(
seq_procedure.nextval,
'Pobrano '|| to_char(rowCountPoiis) || ' rekordów, usunieto: ' || to_char(rowCountApex) || ' rekordów.',
'populate_apex_tables',
CURRENT_TIMESTAMP,
'dbo.SL_departamenty',
'sl_departamenty'
);





/* 
************************************************
Wyczysc i zape³nij SL_OSOBY
************************************************
*/ 
select count (*) into rowCountApex from sl_osoby;
execute immediate 'truncate table sl_osoby';
INSERT INTO sl_osoby
SELECT  
"ID_Osoby" 
      ,"Imie" 
      ,"Nazwisko" 
      ,"Login" 
      ,"Funkcje_ID"
      ,"Zaleznosc" 
      ,"Departamenty_ID" 
FROM    dbo.SL_osoby@LIVE_POIS;

select count (*) into rowCountPoiis from dbo.SL_Osoby@LIVE_POIS;

INSERT INTO POIS_LOG
VALUES
(
seq_procedure.nextval,
'Pobrano '|| to_char(rowCountPoiis) || ' rekordów, usunieto: ' || to_char(rowCountApex) || ' rekordów.',
'populate_apex_tables',
CURRENT_TIMESTAMP,
'dbo.SL_osoby',
'sl_osoby'
);


/* 
************************************************
Wyczysc i zape³nij SL_POWIATY
************************************************
*/ 

select count (*) into rowCountApex from sl_powiaty;
execute immediate 'truncate table sl_powiaty';
INSERT INTO sl_powiaty
SELECT  
*
FROM    dbo.SL_powiaty@LIVE_POIS;

select count (*) into rowCountPoiis from dbo.SL_powiaty@LIVE_POIS;

INSERT INTO POIS_LOG
VALUES
(
seq_procedure.nextval,
'Pobrano '|| to_char(rowCountPoiis) || ' rekordów, usunieto: ' || to_char(rowCountApex) || ' rekordów.',
'populate_apex_tables',
CURRENT_TIMESTAMP,
'dbo.SL_powiaty',
'sl_powiaty'
);






/* 
************************************************
Wyczysc i zape³nij SL_RZECZOWE
************************************************
*/ 

select count (*) into rowCountApex from sl_rzeczowe;
execute immediate 'truncate table sl_rzeczowe';
INSERT INTO sl_rzeczowe
SELECT  
*
FROM    dbo.SL_rzeczowe@LIVE_POIS;

select count (*) into rowCountPoiis from dbo.SL_rzeczowe@LIVE_POIS;

INSERT INTO POIS_LOG
VALUES
(
seq_procedure.nextval,
'Pobrano '|| to_char(rowCountPoiis) || ' rekordów, usunieto: ' || to_char(rowCountApex) || ' rekordów.',
'populate_apex_tables',
CURRENT_TIMESTAMP,
'efekw.SL_rzeczowe',
'sl_rzeczowe'
);



/* 
************************************************
Wyczysc i zape³nij SL_WOJEWODZTWA
************************************************
*/ 

select count (*) into rowCountApex from sl_wojewodztwa;
execute immediate 'truncate table sl_wojewodztwa';
INSERT INTO sl_wojewodztwa
SELECT  
*
FROM    dbo.SL_wojewodztwa@LIVE_POIS;

select count (*) into rowCountPoiis from dbo.SL_wojewodztwa@LIVE_POIS;

INSERT INTO POIS_LOG
VALUES
(
seq_procedure.nextval,
'Pobrano '|| to_char(rowCountPoiis) || ' rekordów, usunieto: ' || to_char(rowCountApex) || ' rekordów.',
'populate_apex_tables',
CURRENT_TIMESTAMP,
'dbo.SL_wojewodztwa',
'sl_wojewodztwa'
);



/* 
************************************************
Wyczysc i zape³nij SL_WYDZIALY
************************************************
*/ 

select count (*) into rowCountApex from sl_wydzialy;
execute immediate 'truncate table sl_wydzialy';
INSERT INTO sl_wydzialy
SELECT  
*
FROM    dbo.SL_wydzialy@LIVE_POIS;

select count (*) into rowCountPoiis from dbo.SL_wydzialy@LIVE_POIS;

INSERT INTO POIS_LOG
VALUES
(
seq_procedure.nextval,
'Pobrano '|| to_char(rowCountPoiis) || ' rekordów, usunieto: ' || to_char(rowCountApex) || ' rekordów.',
'populate_apex_tables',
CURRENT_TIMESTAMP,
'dbo.SL_wydzialy',
'sl_wydzialy'
);





/* 
************************************************
Wyczysc i zape³nij TAB_EKOLOGICZNE
************************************************
*/ 

select count (*) into rowCountApex from tab_ekologiczne;
execute immediate 'truncate table tab_ekologiczne';
INSERT INTO tab_ekologiczne
SELECT  
*
FROM    dbo.tab_ekologiczne@LIVE_POIS;

select count (*) into rowCountPoiis from dbo.tab_ekologiczne@LIVE_POIS;

INSERT INTO POIS_LOG
VALUES
(
seq_procedure.nextval,
'Pobrano '|| to_char(rowCountPoiis) || ' rekordów, usunieto: ' || to_char(rowCountApex) || ' rekordów.',
'populate_apex_tables',
CURRENT_TIMESTAMP,
'dbo.tab_ekologiczne',
'tab_ekologiczne'
);



/* 
************************************************
Wyczysc i zape³nij TAB_PODMIOTY
************************************************
*/ 
select count (*) into rowCountApex from tab_podmioty;
execute immediate 'truncate table tab_podmioty';
INSERT INTO tab_podmioty
SELECT  
*
FROM    dbo.tab_podmioty@LIVE_POIS;

select count (*) into rowCountPoiis from dbo.tab_podmioty@LIVE_POIS;

INSERT INTO POIS_LOG
VALUES
(
seq_procedure.nextval,
'Pobrano '|| to_char(rowCountPoiis) || ' rekordów, usunieto: ' || to_char(rowCountApex) || ' rekordów.',
'populate_apex_tables',
CURRENT_TIMESTAMP,
'dbo.tab_podmioty',
'tab_podmioty'
);



/* 
************************************************
Wyczysc i zape³nij TAB_UMOWY
************************************************
*/ 

execute immediate 'truncate table tab_umowy';
INSERT INTO TAB_UMOWY
SELECT * FROM dbo.tab_umowy@LIVE_POIS;



/* 
************************************************
Wyczysc i zape³nij TAB_RZECZOWE
************************************************
*/ 
select count (*) into rowCountApex from tab_rzeczowe;
execute immediate 'truncate table tab_rzeczowe';
INSERT INTO tab_rzeczowe
SELECT  
*
FROM    dbo.tab_rzeczowe@LIVE_POIS;

select count (*) into rowCountPoiis from dbo.tab_rzeczowe@LIVE_POIS;

INSERT INTO POIS_LOG
VALUES
(
seq_procedure.nextval,
'Pobrano '|| to_char(rowCountPoiis) || ' rekordów, usunieto: ' || to_char(rowCountApex) || ' rekordów.',
'populate_apex_tables',
CURRENT_TIMESTAMP,
'dbo.tab_rzeczowe',
'tab_rzeczowe'
);



/* 
************************************************
Wyczysc i zape³nij TAB_PROJEKTY; 
************************************************
*/ 

select count (*) into rowCountApex from tab_projekty;
execute immediate 'truncate table tab_projekty';
INSERT INTO tab_projekty
SELECT  
*
FROM    dbo.tab_projekty@LIVE_POIS;



/* 
************************************************
Wyczysc i zape³nij XREF_OBSZARY
************************************************
*/ 

select count (*) into rowCountApex from xref_obszarrealizacji;
execute immediate 'truncate table xref_obszarrealizacji';
INSERT INTO xref_obszarrealizacji
SELECT  
*
FROM    dbo.xref_obszarrealizacji@LIVE_POIS;

select count (*) into rowCountPoiis from dbo.xref_obszarrealizacji@LIVE_POIS;

INSERT INTO POIS_LOG
VALUES
(
seq_procedure.nextval,
'Pobrano '|| to_char(rowCountPoiis) || ' rekordów, usunieto: ' || to_char(rowCountApex) || ' rekordów.',
'populate_apex_tables',
CURRENT_TIMESTAMP,
'dbo.xref_obszarrealizacji',
'xref_obszarrealizacji'
);

/* 
************************************************
Wyczysc i zape³nij SL_STANRZECZOWY
************************************************
*/ 
select count (*) into rowCountApex from sl_stanrzeczowy;
execute immediate 'truncate table sl_stanrzeczowy';
INSERT INTO sl_stanrzeczowy
SELECT  
*
FROM    dbo.sl_stanrzeczowy@LIVE_POIS;

select count (*) into rowCountPoiis from dbo.sl_stanrzeczowy@LIVE_POIS;

INSERT INTO POIS_LOG
VALUES
(
seq_procedure.nextval,
'Pobrano '|| to_char(rowCountPoiis) || ' rekordów, usunieto: ' || to_char(rowCountApex) || ' rekordów.',
'populate_apex_tables',
CURRENT_TIMESTAMP,
'dbo.sl_stanrzeczowy',
'sl_stanrzeczowy'
);

/* 
************************************************
Wyczysc i zape³nij Sl_STATUSUMOWY
************************************************
*/ 
select count (*) into rowCountApex from sl_statusumowy;
execute immediate 'truncate table sl_statusumowy';
INSERT INTO sl_statusumowy
SELECT  
*
FROM    dbo.sl_statusumowy@LIVE_POIS;

select count (*) into rowCountPoiis from dbo.sl_statusumowy@LIVE_POIS;

INSERT INTO POIS_LOG
VALUES
(
seq_procedure.nextval,
'Pobrano '|| to_char(rowCountPoiis) || ' rekordów, usunieto: ' || to_char(rowCountApex) || ' rekordów.',
'populate_apex_tables',
CURRENT_TIMESTAMP,
'dbo.sl_statusumowy',
'sl_statusumowy'
);

/* 
************************************************
Wyczysc i zape³nij Sl_STANEKOLOGICZNY
************************************************
*/ 
select count (*) into rowCountApex from sl_stanekologiczny;
execute immediate 'truncate table sl_stanekologiczny';
INSERT INTO sl_stanekologiczny
SELECT  
*
FROM    dbo.sl_stanekologiczny@LIVE_POIS;

select count (*) into rowCountPoiis from dbo.sl_stanekologiczny@LIVE_POIS;

INSERT INTO POIS_LOG
VALUES
(
seq_procedure.nextval,
'Pobrano '|| to_char(rowCountPoiis) || ' rekordów, usunieto: ' || to_char(rowCountApex) || ' rekordów.',
'populate_apex_tables',
CURRENT_TIMESTAMP,
'dbo.sl_stanekologiczny',
'sl_stanekologiczny'
);

/* 
************************************************
Wyczysc i zape³nij Sl_PROGRAMYPRIORYTETOWE
************************************************
*/ 

select count (*) into rowCountApex from sl_programypriorytetowe;
execute immediate 'truncate table sl_programypriorytetowe';
INSERT INTO sl_programypriorytetowe
SELECT  
*
FROM    dbo.sl_programypriorytetowe@LIVE_POIS;

select count (*) into rowCountPoiis from dbo.sl_programypriorytetowe@LIVE_POIS;

INSERT INTO POIS_LOG
VALUES
(
seq_procedure.nextval,
'Pobrano '|| to_char(rowCountPoiis) || ' rekordów, usunieto: ' || to_char(rowCountApex) || ' rekordów.',
'populate_apex_tables',
CURRENT_TIMESTAMP,
'dbo.sl_programypriorytetowe',
'sl_programypriorytetowe'
);


/* 
************************************************
USUN BLEDNE UMOWY
************************************************
*/ 
KASUJ_IGNOROWANE_UMOWY;

/* 
************************************************
DODAJ EFEKTY EKOLOGICZNE DLA UMOW BEZ EFEKTOW
************************************************
*/ 
DODAJ_EF_EKO_STAREUM;

/* 
************************************************
TODO: DODAJ EFEKTY RZECZOWE DLA UMOW BEZ EFEKTOW
************************************************
*/ 




/* 
************************************************
ZAPELNIJ AGR_EFEKTY_EKO2
************************************************
*/ 
execute immediate 'truncate table AGR_EFEKTY_EKO2';
ZAPELNIJ_AGR_EFEKTY_EKO2;

/* 
************************************************
ZAPELNIJ AGR_EFEKTY_RZECZ
************************************************
*/ 
execute immediate 'truncate table AGR_EFEKTY_RZECZ';
ZAPELNIJ_AGR_EFEKTY_RZECZ;
/* 
************************************************
SCAL ZDUBLOWANE JEDNOSTKI DLA EKOLOGICZNYCH
************************************************
*/ 

SCAL_JEDNOSTKI;

    
END populate_apex_tables;