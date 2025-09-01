## second.pl

parent(tom,bob). /* Tom is a parent of Bob*/
parent(pam,bob). /* Pam is a parent of Bob*/
parent(tom,liz). /* Tom is a parent of Liz*/
parent(bob,ann). /* Bob is a parent of Ann*/
parent(pat,jim). /* Pat is a parent of Jim*/
parent(bob,pat). /* Bob is a parent of Pat*/

female(pam).
female(liz).
female(pat).
female(ann).

male(tom).
male(bob).
male(jin).

mother(X,Y):- parent(X,Y),female(X).
father(X,Y):- parent(X,Y),male(X).
sister(X,Y):- parent(Z,X),parent(Z,Y),female(X),X\==Y.
brother(X,Y):- parent(Z,X),parent(Z,Y),male(X),X\==Y.

grandparent(X,Y):- parent(X,Z),parent(Z,Y).
grandmother(X,Y):- parent(X,Y),parent(Z,Y),female(X).
grandfather(X,Y):- parent(X,Y),parent(Z,Y),male(X).
grandfather(X,Y):- grandparent(X,Y),male(X).
grandchild(X,Y):- parent(Y,Z),parent(Z,X).

grandson(X,Y):- parent(Y,Z),parent(Z,X),male(X).
granddaughter(X,Y):- parent(Y,Z), parent(Z,X), female(X).

happy(X):- parent(X,_).
two_children(X):-parent(X,Y),parent(X,Z), sister(Y,Z).

aunt(X,Y):- parent(Z,Y),sister(X,Z).
uncle(X,Y):- parent(Z,Y),brother(X,Z).

-------------------------------------------------------------------
//Questions (exercise.pl)

01)Is bob parent of Tom?
-parent(bob,tom).
false.

02)Is Tom parent of Bob?
-parent(tom,bob).
true .

03)Who is the parent of Pat?
- parent(X,pat).
X = bob.

04)Is Liz parent of Pat?
- parent(liz,pat).
false.

05)Is Tom parent of Ben?
- parent(tom,ben).
false.

06)Who are the parents of Bob?
- parent(X,bob).
X = tom ;
X = pam.

07) Who is parent of whom? 
- parent(X,Y).
X = tom,
Y = bob ;
X = pam,
Y = bob ;
X = tom,
Y = liz ;
X = bob,
Y = ann ;
X = pat,
Y = jim ;
X = bob,
Y = pat.

08) Who is grandparent of Jim?
- parent(X,Y),parent(Y,jim).
X = bob,
Y = pat.

09) Who are tom's grand children?
- parent(tom,X),parent(X,Y).
X = bob,
Y = ann ;
X = bob,
Y = pat ;
false.

10) Do Ann and Pat have a common parent?
- parent(X,ann),parent(X,pat).
X = bob.

11) Do Ann and Tom have a common parent?
- parent(X,ann),parent(X,tom).
false.

12) Who is Pat's parent?
- parent(X,pat).
X = bob.

13) Does Liz  have a child?
-  parent(liz,X).
false.

14) Who is Pat's grandparent?
- parent(X,Y),parent(Y,pat).
X = tom,
Y = bob ;
X = pam,
Y = bob ;
false.

-------------------------------------------------------------------------

// Write prolog answers for following queries.

15)  parent(jim,X).
false.

16)  parent(X,jim).
X = pat.

17)  parent(pam,X),parent(X,pat).
X = bob.

18) parent(pam,X),parent(Y,jim).
X = bob,
Y = pat.

-------------------------------------------------------------------------

female --> pam,liz,pat,ann
male --> tom,bob,jin

//Define the relation mother using parent and female
//Define the relation father using parent and male
//Define the relation sister using parent and female
//Define the relation brother using parent and male
//Define the relation grandparent using parent
//Define the relation grandfather using parent and male.
//Define the relation grandmother using parent and female
//Define the relation grandchild using parent
//Define the relation grandson using parnet and male
//Define the relation granddaughter using parent and female
//Everybody who has a child is happy
//For all X,if X has a child who has a sister then X has 2 children
//Define the relation aunt (X,Y) in terms of the relations parent and sister
//Define the relation uncle using the appropriate relations

 
 
