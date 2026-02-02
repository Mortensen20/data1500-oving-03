Skriv SQL-spørringer som besvarer følgende spørsmål:

1. **Hent alle studenter som ikke har noen emneregistreringer**
--    Vis student_id, fornavn og etternavn
      SELECT s.student_id, s.fornavn, s.etternavn
--      Connect (LEFT JOIN for å også vise studenter som ikke er i begge tabeller) studenter med emneregistreringer med PK s.student_id og FK er.student_id.
        FROM studenter s LEFT JOIN emneregistreringer er ON s.student_id = er.student_id
--      Bare studentene som ikke er i emneregistrerings tabellen
        WHERE er.student_id IS NULL;

2. **Hent alle emner som ingen studenter er registrert på**
    SELECT e.emne_kode, e.emne_navn
        FROM emner e LEFT JOIN emneregistreringer er ON e.emne_id = er.emne_id
        WHERE er.student_id IS NULL;

3. **Hent studentene med høyeste karakter per emne**
    SELECT e.emne_kode, s.student_id, s.fornavn, s.etternavn, er.karakter
        FROM emneregistreringer er
        JOIN studenter s ON er.student_id = s.student_id
        JOIN emner e ON er.emne_id = e.emne_id
        WHERE

4. **Lag en rapport som viser hver student, deres program, og antall emner de er registrert på**
5. **Hent alle studenter som er registrert på både DATA1500 og DATA1100**
