parent(rahman,hira).
parent(rahman,helen).
parent(rahman,salma).
parent(rahman,kanchon).
parent(anowara,hira).
parent(anowara,helen).
parent(anowara,salma).
parent(anowara,kanchon).

parent(rofiqul,ratul).
parent(rofiqul,raka).
parent(hira,ratul).
parent(hira,raka).

parent(amin,prapti).
parent(helen,prapti).

parent(kayes,anika).
parent(salma,anika).

parent(kanchon,upoma).
parent(najma,upoma).

parent(rafi,junairah).
parent(raka,junairah).

parent(ratul,ilaaf).
parent(faria,ilaaf).

parent(saikat,iram).
parent(upoma,iram).


parent(junairah,karim).
parent(himel,karim).

parent(iram,maria).
parent(sumaiya,maria).



grandparent(X,Z):-
    parent(X,Y),parent(Y,Z).

grandchild(X,Z):-
    grandparent(Z,X).
sibling(X,Y):-
    parent(Z,X),parent(Z,Y),Y\=X.
auntoruncle(X,W):-
    sibling(X,Y),parent(Y,W).
cousin(X,Y):-
    parent(Z,X),auntoruncle(Z,Y),Y\=X.
child(Y,X):-
    parent(Y,X).

firstcousin(X,Y):-
    grandparent(Z,X),grandparent(Z,Y),not(sibling(X,Y)),Y\=X,
    format("~w is first cousin of ~w.",[X,Y]).
secondcousin(X,Y):-
    grandparent(Z,X),grandparent(W,Y),not(sibling(X,Y)),sibling(Z,W),Y\=X,
    format("~w is second cousin of ~w.",[X,Y]).
thirdcousin(X,Y):-
    grandparent(A,X),grandparent(B,Y),cousin(A,B),not(sibling(X,Y)),Y\=X,
     format("~w --> third cousin --> ~w.",[X,Y]).

cousinonceremoved(X,Y):-
    cousin(X,Z),child(Z,Y),
    format("~w  **first cousin once removed** ~w.",[X,Y]).
cousintwiceremoved(X,Y):-
    cousin(X,Z),grandchild(Y,Z),
    format("~w  **first cousin twice removed** ~w.",[X,Y]).


