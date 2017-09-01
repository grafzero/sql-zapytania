create or replace PROCEDURE ZAPELNIJ_AGR_EFEKTY_EKO2
AS
BEGIN
  INSERT
  INTO AGR_EFEKTY_EKO2
    (SELECT te."Wartosc",
        se."jm",
        te."Id_Ekologiczne" AS "TE_ID",
        se."ID_Ekologiczne" AS "SE_ID",
        se."opis"           AS "efekt",
        te."Etapy_Id",
        tu."StatusUmowy_ID",
        tu."NumerUmowyNF",
        sd."Nazwa" AS "departament",
        sd."ID_Departamenty",
        SNE.ID AS "AGREGAT_ID",
        SNE.NAZWA,
        tu."RzeczDataPotwierdzeniaEfekEko",
        tu."DataUmowy",
        sw."ID_Wojewodztwa",
        tup."programy_id",
        tpp."Opis",
        tpp."Opis",
        tu."NazwaProjektu_z_Umowy",
        tp."NazwaSkrocona",
        so."Imie",
        SO."Nazwisko"
      FROM TMP_UMOWYPROGRAMY tup
      JOIN SL_PROGRAMYPRIORYTETOWE tpp
      ON (tpp."ID_ProgramyPriorytetowe" = tup."programy_id")
      JOIN TAB_UMOWY tu
      ON (tu."ID_Umowy" = tup."umowy_id")
      JOIN TAB_EKOLOGICZNE te
      ON (te."Dokument_Id" = tup."PierwszaWersja_ID")
      JOIN sl_ekologiczne se
      ON (te."SL_Ekologiczne_ID" = se."ID_Ekologiczne")
      JOIN XREF_OBSZARREALIZACJI xor
      ON (xor."ID_ObszarRealizacji" = tu."ObszarRealizacji_ID")
      JOIN SL_WOJEWODZTWA sw
      ON (sw."ID_Wojewodztwa" = xor."Wojewodztwa_ID")
      JOIN SL_DEPARTAMENTY sd
      ON (sd."ID_Departamenty" = tu."Departamenty_ID")
      JOIN XREF_EKOL_NADPOD XEN
      ON (SE."ID_Ekologiczne" = XEN.SL_EKOLOGICZNE_ID)
      JOIN SL_NADRZED_EKOLOGICZNE SNE
      ON (SNE.ID = XEN.SL_NADRZ_EKO_ID)
      JOIN tab_podmioty tp
      ON (tp."ID_Podmioty" = tu."Beneficjent0_ID")
      JOIN SL_OSOBY SO
      ON (TU."Osoby_ID" = SO.ID_OSOBY)
    );
END ZAPELNIJ_AGR_EFEKTY_EKO2;