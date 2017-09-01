create or replace PROCEDURE "FIND_ERRORS" 
AS
  opis        VARCHAR2(2000);
  numer_umowy VARCHAR2(200);
  koordynator VARCHAR2(200);
  idbledy     NUMBER;
  rn          NUMBER;
  idumowy     NUMBER;
BEGIN
  EXECUTE immediate 'TRUNCATE TABLE TAB_WYKRYTEBLEDY';
  EXECUTE immediate 'TRUNCATE TABLE TMP_BLEDY_02';
  
  /*******************************************
  BLAD 1
  ********************************************/
  
  
  INSERT
  INTO TMP_BLEDY_02
    (SELECT "ID_BLEDY",
        "id_umowy",
        "Koordynator 1",
        "Numer umowy 1",
        "Opis"
      FROM
        (SELECT
          --te1."Wartosc" as "Wartoœæ efektu 1",
          tu1."NumerUmowyNF" AS "Numer umowy 1",
          tu1."ID_Umowy"     AS "id_umowy",
          --tu2."NumerUmowyNF" as "Wspólna umowa 1", -- umowa wspólna
          --te1."Id_Ekologiczne" as "ID efektu 1",
          --se1."opis" as "Efekt eko. 1",
          --tu1."DataUmowy" as "Data umowy 1",
          --tp1."NazwaSkrocona" as "Beneficjent 1",
          so1."Nazwisko"
          || ' '
          || so1."Imie" AS "Koordynator 1",
          --sd1."Nazwa" as "Departament 1",
          --te2."Wartosc" as "Wartoœæ efektu 2",
          --tu2."NumerUmowyNF" as "Numer umowy 2",
          --tu1."NumerUmowyNF" as "Wspólna umowa 2",-- umowa wspólna
          --te2."Id_Ekologiczne" as "ID efektu 2",
          --se2."opis" as "Efekt eko. 2",
          --tu2."DataUmowy" as "Data umowy 2",
          --tp2."NazwaSkrocona" as "Beneficjent 2",
          --so2."Nazwisko" || ' ' || so2."Imie" as "Koordynator 2",
          --sd2."Nazwa" as "Departament 2",
          2895 AS "ID_BLEDY",
          'Wspolna umowa z '
          || tu2."NumerUmowyNF"
          || ' która jako wspolna ma podana '
          || tu1."NumerUmowyNF" AS "Opis",
          ROW_NUMBER() OVER(PARTITION BY tu1."NumerUmowyNF" ORDER BY tu1."NumerUmowyNF" DESC) rn
        FROM TAB_UMOWY tu1
        JOIN TAB_EKOLOGICZNE te1
        ON (te1."Dokument_Id" = tu1."ID_Umowy")
        JOIN SL_EKOLOGICZNE se1
        ON (se1."ID_Ekologiczne" = te1."SL_Ekologiczne_ID")
        JOIN TAB_PODMIOTY tp1
        ON (tp1."ID_Podmioty" = tu1."Beneficjent0_ID")
        JOIN TAB_PROJEKTY tproj1
        ON (tproj1."ID_Projekty" = tu1."Projekty_ID")
        LEFT OUTER JOIN SL_OSOBY so1
        ON (so1.ID_OSOBY = tu1."Osoby_ID" )
        JOIN SL_DEPARTAMENTY sd1
        ON (sd1."ID_Departamenty" = so1."Departamenty_ID")
        JOIN tab_umowy tu2
        ON (tu2."ID_Umowy" = te1."WspolnaUmowa_Id")
        JOIN TAB_EKOLOGICZNE te2
        ON (te2."Dokument_Id" = tu2."ID_Umowy")
        JOIN SL_EKOLOGICZNE se2
        ON (se2."ID_Ekologiczne" = te2."SL_Ekologiczne_ID")
        JOIN TAB_PODMIOTY tp2
        ON (tp2."ID_Podmioty" = tu2."Beneficjent0_ID")
        JOIN TAB_PROJEKTY tproj2
        ON (tproj2."ID_Projekty" = tu2."Projekty_ID")
        LEFT OUTER JOIN SL_OSOBY so2
        ON (so2.ID_OSOBY = tu2."Osoby_ID" )
        JOIN SL_DEPARTAMENTY sd2
        ON (sd2."ID_Departamenty" = so2."Departamenty_ID")
          --join tab_umowy tu1 on (tu1."ID_Umowy" = te2."WspolnaUmowa_Id")
        WHERE tu1."ID_Umowy" = te2."WspolnaUmowa_Id"
        AND tu2."ID_Umowy"   = te1."WspolnaUmowa_Id"
          --and te1."Wartosc" in (  SELECT "Wartosc" FROM TAB_EKOLOGICZNE GROUP BY "Wartosc" HAVING COUNT (*) > 1)
          --and te1."Wartosc" != 0
          --and tu1."ID_Umowy" = te2."WspolnaUmowa_Id"
          --and tu2."ID_Umowy" = te1."WspolnaUmowa_Id"
          --order BY te1."Wartosc" asc
          --and te2."Wartosc" in (  SELECT "Wartosc" FROM TAB_EKOLOGICZNE GROUP BY "Wartosc" HAVING COUNT (*) > 1)
          --and "Wartosc" != 0
          --order BY te2."Wartosc" asc
        ) a
      WHERE rn = 1
    );
  INSERT
  INTO TAB_WYKRYTEBLEDY
    (
      BLEDY_ID,
      KOORDYNATOR_ID,
      NUMER_UMOWY,
      OPIS,
      UMOWY_ID
    )
  SELECT ID_BLEDY,
    "Koordynator 1",
    "Numer umowy 1",
    "Opis",
    "id_umowy"
  FROM TMP_BLEDY_02;
  -- TRUNCATE
  -- TMP_BLEDY_02
  --
  --
  --
  --
  
    /*******************************************
  BLAD 3
  ********************************************/
  
  
  
  
  EXECUTE immediate 'TRUNCATE TABLE TMP_BLEDY_02';
  INSERT
  INTO TMP_BLEDY_02
    (SELECT "ID_BLEDY",
        "id_umowy",
        "Koordynator 1",
        "Numer umowy 1",
        "Opis"
      FROM
        ( SELECT DISTINCT tu1."NumerUmowyNF" AS "Numer umowy 1",
          tu1."ID_Umowy"                     AS "id_umowy",
          so1."Nazwisko"
          || ' '
          || so1."Imie" AS "Koordynator 1",
          2897          AS "ID_BLEDY",
          'Umowa '
          || tu1."NumerUmowyNF"
          || ' ma okreœlon¹ umowê podrzedn¹ tylko na jednym z etapów (efekty ekologiczne)' AS "Opis",
          ROW_NUMBER() OVER(PARTITION BY tu1."NumerUmowyNF" ORDER BY tu1."NumerUmowyNF" DESC) rn
        FROM tab_umowy tu1
        JOIN tab_umowy tu2
        ON (tu1."NumerUmowyNF" = tu2."NumerUmowyNFKrotki")
        JOIN TAB_EKOLOGICZNE te1
        ON (te1."Dokument_Id" = tu1."ID_Umowy")
        JOIN TAB_EKOLOGICZNE te2
        ON (te2."Dokument_Id" = tu2."ID_Umowy")
        LEFT OUTER JOIN SL_OSOBY so1
        ON (so1.ID_OSOBY         = tu1."Osoby_ID" )
        WHERE tu1."NumerUmowyNF" = tu2."NumerUmowyNF"
        AND tu1."ID_Umowy"      != tu2."ID_Umowy"
          --and te1."Id_Ekologiczne" = te2."Id_Ekologiczne"
        AND te1."WspolnaUmowa_Id" IS NOT NULL
        AND te2."WspolnaUmowa_Id" IS NULL
        AND te1."Etapy_Id"        != te2."Etapy_Id"
        ) a
      WHERE rn = 1
    );
  INSERT
  INTO TAB_WYKRYTEBLEDY
    (
      BLEDY_ID,
      KOORDYNATOR_ID,
      NUMER_UMOWY,
      OPIS,
      UMOWY_ID
    )
  SELECT ID_BLEDY,
    "Koordynator 1",
    "Numer umowy 1",
    "Opis",
    "id_umowy"
  FROM TMP_BLEDY_02;
  
 /*******************************************
  BLAD 7
 ********************************************/
BLAD7;
  
/*******************************************
  BLAD 8
 ********************************************/
BLAD8_RZECZOWE;

/*******************************************
  BLAD 5
 ********************************************/
BLAD5RZECZOWE;

/*******************************************
  BLAD 6
 ********************************************/
BLAD6RZECZOWE;


END FIND_ERRORS;