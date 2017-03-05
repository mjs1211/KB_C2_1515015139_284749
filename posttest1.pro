/*********************************************************************************

			Post-test #1 Project
		
Written by 	: Muhammad Jodi Saputra
NIM		: 1515015139
Kelas		: C2 2015
Mata Kuliah	: Kecerdasan Buatan

*********************************************************************************/

PREDICATES
 ayah(STRING,STRING)
 putra(STRING,STRING)
 
 
 kakek(STRING,STRING)
 cucu(STRING,STRING)
 kakekBuyut(STRING,STRING)
 cicit(STRING,STRING)
 
CLAUSES
 putra("Eriq","Aldera").
 putra("Aldera","Nanda").
 putra("Nanda","Anjas").
 putra("Anjas","Nugrah").
 putra("Nugrah","Tito").
 
 ayah(A,B):-putra(B,A).
 kakek(A,B):-ayah(A,C),ayah(C,B).
 kakekBuyut(A,B):-kakek(A,C),ayah(C,B),ayah(A,D),kakek(D,B).
 cucu(A,B):-putra(A,C),ayah(B,C).
 cicit(A,B):-cucu(A,C),ayah(B,C),kakek(B,D),ayah(C,D).
 
GOAL
 cicit("Aldera",Cicit).