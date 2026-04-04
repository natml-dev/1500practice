# Besvarelse: SQL-Analyse

## Oppgave 1: Grunnleggende Spørringer
1.  `SELECT * FROM Vare;`
2.  `SELECT VNr, Betegnelse FROM Vare;`
3.  `SELECT DISTINCT KatNr FROM Vare;`
4.  `SELECT Fornavn, Etternavn, Stilling AS Jobbtittel FROM Ansatt;`

1.  **Forklaring:** query selects all the columns (*) from the table Vare. returns every row and column in the table

2.  **Forklaring:** query selects columns Vnr and Betegnelse from table Vare, returns all the rows, but only with these two columns. 

3.  **Forklaring:** query selects unique values from the column KatNr from the table Vare. DISTINCT keyword ensures that duplicate values are removed and each category number appears only once

4.  **Forklaring:** query selects columns Fornavn, Etternavn and Stilling from the table Ansatt. Keyword AS renames column Stilling into Jobtittel in the result table. the data itself is not changed, only the column name in the output

## Oppgave 2: WHERE-klausulen
1.  `SELECT * FROM Vare WHERE Pris > 500;`
2.  `SELECT * FROM Ansatt WHERE Stilling = 'Salgssjef' AND Årslønn > 600000;`
3.  `SELECT Fornavn, Etternavn FROM Kunde WHERE PostNr = '0001' OR PostNr = '0002';`
4.  `SELECT Betegnelse FROM Vare WHERE NOT KatNr = 1;

1.  **Forklaring:** 
Query selects all the columns from table Vare. Returns only rows where value in the column Pris is greater then 500

2.  **Forklaring:** Query selects all the columns from the Ansatt table. Returns only rows where value in the colums stilling is identical to string "Salgssjef" and value in the column Årslønn is greater then 600000. Keyword AND means that both conditions must be true

3.  **Forklaring:** 
Query selects two columns - Fornavn, Etternavn - from table Kunde, returns only rows where value in the column PostNr is equal either to "0001" or "0002". Keyword OR means that at least on eof the conditions must be true.

4.  **Forklaring:** Query selects column Betegnelse from table Vare. Returns only those rows where column KatNr not equal 1

## Oppgave 3: Gruppering og Sortering
1.  `SELECT * FROM Vare ORDER BY Pris DESC;`
2.  `SELECT KatNr, COUNT(*) FROM Vare GROUP BY KatNr;`
3.  `SELECT Stilling, AVG(Årslønn) FROM Ansatt GROUP BY Stilling;`
4.  `SELECT KatNr, SUM(Antall) FROM Vare GROUP BY KatNr HAVING SUM(Antall) > 500;`

1.  **Forklaring:** ...

2.  **Forklaring:** ...

3.  **Forklaring:** ...

4.  **Forklaring:** ...

## Oppgave 4: Spørringer mot Flere Tabeller
1.  `SELECT V.Betegnelse, K.Navn FROM Vare V JOIN Kategori K ON V.KatNr = K.KatNr;`
2.  `SELECT O.OrdreNr, K.Fornavn, K.Etternavn FROM Ordre O LEFT JOIN Kunde K ON O.KNr = K.KNr;`
3.  `SELECT A1.Fornavn, A2.Fornavn FROM Ansatt A1, Ansatt A2 WHERE A1.PostNr = A2.PostNr AND A1.AnsNr < A2.AnsNr;`
4.  `SELECT V.Betegnelse FROM Vare V WHERE V.VNr NOT IN (SELECT VNr FROM Ordrelinje);`

1.  **Forklaring:** 

This query selects the column "Betegnelse" from the table "Vare" (aliased as V) and the column "Navn" from the table "Kategori" (aliased as K).

It joins the two tables using the condition V.KatNr = K.KatNr.

The query returns rows where the category number (KatNr) in "Vare" matches the category number in "Kategori", combining related data from both tables.

2.  **Forklaring:** 
This query selects column OrderNr from the table Ordre (aliased as O), and columns Fornavn and Etternavn from the table Kunde (aliased as K). It joins two tables using the condition O.KNr = K.KNr. The query returns all the rows from table Ordre and matching rows from the table Ordre. If there is no matching customer, the columns from Kunde will contain NULL values.

3.  **Forklaring:**
 This query selects the first names (Fornavn) of two employees from the table "Ansatt", using two aliases (A1 and A2).

It compares employees from the same table (self join).

The condition A1.PostNr = A2.PostNr ensures that only employees with the same postal code are included.

The condition A1.AnsNr < A2.AnsNr ensures that each pair is listed only once and avoids matching an employee with themselves.

The query returns pairs of employees who live in the same postal code.

4.  **Forklaring:** ...

## Oppgave 5: NULL-verdier og Aggregeringsfunksjoner

Forklar hva følgende SQL-spørringer gjør, og hvorfor resultatene blir som de blir. Vær spesielt oppmerksom på hvordan `NULL` påvirker resultatet.

1.  **Spørring:**
    ```sql
    SELECT COUNT(*), COUNT(Bonus) FROM Ansatt;
    ```
    **Forklaring:**
    *   *... Skriv din forklaring her ...*

2.  **Spørring:**
    ```sql
    SELECT AVG(Bonus) FROM Ansatt;
    ```
    **Forklaring:**
    *   *... Skriv din forklaring her ...*

3.  **Spørring:**
    ```sql
    SELECT Fornavn, Etternavn, COALESCE(Bonus, 0) AS JustertBonus FROM Ansatt;
    ```
    **Forklaring:**
    *   *... Skriv din forklaring her ...*

4.  **Spørring:**
    ```sql
    SELECT Stilling, SUM(Årslønn + Bonus) FROM Ansatt GROUP BY Stilling;
    ```
    **Forklaring:**
    *   *... Skriv din forklaring her ...*

## Oppgave 6: Tre-verdi Logikk (TRUE, FALSE, UNKNOWN)

SQLs logikk er ikke bare `TRUE` eller `FALSE`. Når `NULL` er involvert, får vi en tredje tilstand: `UNKNOWN`. Denne oppgaven utforsker hvordan dette påvirker `WHERE`-klausuler.

### Del 1: Forklar SQL-spørringene

Forklar resultatet av følgende SQL-spørringer. Hvorfor returnerer de det de gjør?

1.  **Spørring:**
    ```sql
    SELECT COUNT(*) FROM Ordre WHERE ErBetalt = TRUE;
    ```
    **Forklaring:**
    *   *... Skriv din forklaring her ...*

2.  **Spørring:**
    ```sql
    SELECT COUNT(*) FROM Ordre WHERE ErBetalt = FALSE;
    ```
    **Forklaring:**
    *   *... Skriv din forklaring her ...*

3.  **Spørring:**
    ```sql
    SELECT COUNT(*) FROM Ordre WHERE ErBetalt = TRUE OR ErBetalt = FALSE;
    ```
    **Forklaring:**
    *   *... Skriv din forklaring her ...*

4.  **Spørring:**
    ```sql
    SELECT COUNT(*) FROM Ordre WHERE ErBetalt IS UNKNOWN;
    ```
    **Forklaring:**
    *   *... Skriv din forklaring her ...*