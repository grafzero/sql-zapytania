create or replace PROCEDURE ZAPELNIJ_AGR_EFEKTY_RZECZ
AS
BEGIN
  INSERT
  INTO AGR_EFEKTY_RZECZ
    (SELECT
        tr."Wartosc1",
        tr."Wartosc2",
        tr."Wartosc3",
        tr."Id_Rzeczowe",
        sr."ID_Rzeczowe",
        sr."opis",
        tr."Etapy_Id",
        tu."StatusUmowy_ID",
        tu."NumerUmowyNF",
        sd."Nazwa",
        sd."ID_Departamenty",
        tu."RzeczDataZakonczeniaRealizac",
        tu."DataUmowy",
        sr."jm1",
        sr."jm2",
        sr."jm3",
        sw."ID_Wojewodztwa",
        SDO.OPIS,
        tpp."Opis",
        tu."NazwaProjektu_z_Umowy",
        tp."NazwaSkrocona",
        so."Imie",
        SO."Nazwisko",
        TR."Dokument_Id"
        
      FROM TMP_UMOWYPROGRAMY tup
      JOIN SL_PROGRAMYPRIORYTETOWE tpp ON (tpp."ID_ProgramyPriorytetowe" = tup."programy_id")
      JOIN TAB_RZECZOWE tr ON (tr."Dokument_Id" = tup."PierwszaWersja_ID")      
      JOIN sl_rzeczowe sr ON (tr."SL_Rzeczowe_Id" = sr."ID_Rzeczowe")
      JOIN TAB_UMOWY tu ON (tu."ID_Umowy" = tup."umowy_id")
      join XREF_OBSZARREALIZACJI xor on (xor."ID_ObszarRealizacji" = tu."ObszarRealizacji_ID")
      join SL_WOJEWODZTWA sw on (sw."ID_Wojewodztwa" = xor."Wojewodztwa_ID")
      LEFT OUTER JOIN SL_formadofinansowania SDO ON (SDO."ID_FORMADOFINANSOWANIA" = TU."FormaDofinans_ID")
      JOIN SL_DEPARTAMENTY sd ON (sd."ID_Departamenty" = tu."Departamenty_ID")
      JOIN tab_podmioty tp ON (tp."ID_Podmioty" = tu."Beneficjent0_ID")
      JOIN SL_OSOBY SO ON (TU."Osoby_ID" = SO.ID_OSOBY)
      
    ) ;
    
    DELETE FROM AGR_EFEKTY_RZECZ
    WHERE AGR_EFEKTY_RZECZ."ID_Rzeczowe" IN (SELECT * FROM TAB_IGNOROWANE_RZECZ);
    
END ZAPELNIJ_AGR_EFEKTY_RZECZ;