predicates
 pria(symbol) - nondeterm (o)
 wanita(symbol) - nondeterm (o)
 istri(symbol,symbol) - nondeterm (o,o)
 anak(symbol,symbol) - nondeterm (o,o)
 usia(symbol,integer) - nondeterm (o,o)
 %cucu(symbol,symbol) - nondeterm (o,o)
 %ibu(symbol,symbol) - nondeterm (o,o)
 adik(symbol,symbol) - nondeterm (o,o)
 %kakek(symbol,symbol) - nondeterm (o,o)
  
clauses

 ibu(A,B):- wanita(A), anak(B,A); wanita(A), istri(A,C), anak(B,C).  


 pria(john).
 pria(james).
 pria(peter).
 
 wanita(mary).
 wanita(sue).
 wanita(ann).
 
 usia(john,10).
 usia(sue,13).
 
 istri(mary, peter).
 istri(ann, james).
 
 anak(john, james).
 anak(sue, ann).
 anak(james, peter).
 
goal
 ibu(ann).