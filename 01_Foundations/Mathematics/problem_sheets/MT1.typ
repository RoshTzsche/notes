// ==========================================
// TEMPLATE DEFINITION
// ==========================================
#let assignment(
  title: "",
  course: "",
  author: "",
  ta: "",
  date: datetime.today().display(),
  body
) = {
  // Document Metadata
  set document(author: author, title: title)
  
  // Page Configuration (Updated to modern `context` syntax)
  set page(
    paper: "a4",
    margin: (x: .9in, y: 0.7in),
    header: context {
      if counter(page).get().first() > 1 {
        align(right)[#text(size: 8pt, fill: luma(120))[#course -- #title]]
      }
    },
    numbering: "1",
  )

  // Global Typography
  set text(font: "New Computer Modern", size: 12pt)
  set par(justify: true, leading: 0.8em)
  show heading: set block(above: 1.5em, below: 1em)
  set math.equation()

  // Title Block (Fixed argument syntax)
  align(center)[
    #block(text(weight: "bold", size: 1.5em)[#title])
    #v(0.5em)
    #grid(
      columns: (1fr, 1fr),
      align: (center, center),
      [*Author:* #author \ *TA:* #ta],
      [*Course:* #course \ *Date:* #date]
    )
  ]
  
  // Minimalist Divider
  v(1em)
  line(length: 100%, stroke: 1pt + luma(200))
  v(1.5em)

  body
}

// ==========================================
// CUSTOM ENVIRONMENTS
// ==========================================
#let problem(num, body) = block(above: 1.5em, below: 1.5em)[
  -- *Problem #num:* \
  #body
]

#let solution(body) = block(above: 1em, below: 1.5em)[
  ----- *_Solution:_* \
  #body
]

// ==========================================
// DOCUMENT CONTENT
// ==========================================
#show: assignment.with(
  title: "Problem Sheet #1",
  course: "Measure Theory",
  author: "Rosh Guadiana",
  ta: "Ronny Morales"
)

#problem("1")[
  If $A$ and $B$ are sets, show that $A subset.eq B$ if and only if $A inter B = A$.
]

#solution[
  We proceed by mutual implication.

  *Forward Direction* ($==>$): Assume $A subset.eq B$. We must show $A inter B = A$.
  First, let $x in A inter B$. By the definition of intersection, $x in A$ and $x in B$. Thus, $x in A$, which implies $A inter B subset.eq A$. 
  Second, let $x in A$. Since $A subset.eq B$, it follows that $x in B$. Because $x in A$ and $x in B$, we have $x in A inter B$. Thus, $A subset.eq A inter B$. 
  By mutual inclusion, $A inter B = A$.

  *Reverse Direction* ($<==$): Assume $A inter B = A$. We know by that $A inter B subset.eq B$, using our assumption we conclude that $A subset.eq B$
  #align(right)[Q.E.D.]
]

#problem("2")[
  If $A$ is a set and $cal(B) = {B_i : i in I}$ is any family of sets, show that:
  $ A inter union.big_(i in I)B_i = union.big_(i in I)(A inter B_i) "and" A union inter.big_(i in I)B_i =  inter.big_(i in I)(A union B_i) $
]

#solution[
  _First part._ 
  
  *Forward Direction* ($==>$): Let $x in (A inter union.big_(i in I)B_i)$. 
  \ By definition of intersection we have $x in A and exists j in I "such that" x in B_j $, so we have that $x in A inter B_j$, if this element is in the intersection of a sole set of the family, is also true that is in the union of all sets in the family, therefore $x in union.big_(i in I)(A inter B_i)$  
  
  *Reverse Direction* ($<==$): Let $x in union.big_(i in I)(A inter B_i)$  \ We know that $exists j in I "such that "x in B_j inter A$, this is $x in A and x in B_j$, because $x$ is in any set of the family of sets, is also true that is in the union of the family, therefore $x in union.big_(i in I) B_i and x in A$, so we have that $x in A inter union.big_(i in I)B_i$


  _Second part._

  *Forward Direction* ($==>$): Let $x in A union inter.big_(i in I)B_i$
  \ So $x in A space or space forall j in I, space x in B_j$ this is $x in A union B_j$, for this we know that $forall j in I, space x in A union B_j$, this is $inter.big_(i in I)(A union B_i)$

  *Reverse Direction* ($<==$): Let $x in inter.big_(i in I)(A union B_i)$
  \ so $forall j in I, space x in A union B_j$, so if $forall j in I, space x in A or x in B_j$,by Law of excluded middle we divide this in two cases:
  + $x in.not A$
    - If this is the case, then $x in B_j, forall j in I$ must be true, but this is trivially $x in A union inter.big_(i in I)B_i$
  + $x in A$
    - This is trivially $x in A or forall j in I, space x in B_j$ therefore $x in A union inter.big_(i in I)B_i$
#align(right)[Q.E.D.]
]
#problem("3")[
Let $B$ be any set. Show that $(A inter B) union C = A inter(B union C) <==> C ⊆A.$
]

#solution[
*Forward Direction* ($==>$):  Assume $(A inter B) union C = A inter(B union C)$.

Let $x in C$, by the definition of the union it follows that $x in (A inter B) union C$, we know by assumption that this is equall to $x in A inter (B union C)$, so $x in A and x in (B union C)$, for this expresion hold true we strictly require $x in A$, therefore $x in C => x in A$ thus $C subset.eq A$

 *Reverse Direction* ($<==$): Assume $C subset.eq A$.
 - *Forward inclusion*: $(A inter B) union C subset.eq A inter(B union C)$ 
  - Let $x in (A inter B) union C$, this is $x in A inter B or x in C$.
    - Case 1: $x in A inter B$, we have that $x in A and x in B$, and for definition of union it holds that $x in B union C$, therefore $x in A inter(B union C)$
    - Case 2: $x in C$, for our assumption we know that this implies $x in A$, also we know for definition of union $x in B union C$, so $x in A and x in B union C$, therefore $x in A inter (B union C)$

 - *Backward inclusion*: $(A inter B) union C supset.eq A inter(B union C)$ 
  - Let $x in A inter (B union C)$, this is $x in A and x in B union C$
    - Case 1: $x in B$, we know that $x in A$, this means $x in A inter B$, and for the definition of union $x in (A inter B) union C$ holds true
    - Case 2: $x in.not B$, therefore $x in C$, so by definition of union $x in (A inter B) union C$ 
#align(right)[Q.E.D.]
  ]
#problem("4")[
The symmetric difference of two sets $A$ and $B$ is the set $D$ of all elements that belong to either $A$ or $B$
but not both, symbolically, $ D equiv A Delta B = (A union B) - (A inter B) $ 
\ Represent $D$ with a diagram and show that $D = (A - B) union (B - A)$.\ Furthermore, show that
\ i) $A subset.eq A Delta B union A$,
\ ii) $A subset.eq A Delta B union B$,
\ iii) $B subset.eq A Delta B union A$,
\ iv) $B subset.eq A Delta B union B$.
]
#solution[
Show that $D = (A - B) union (B - A)$:
\ Let $x in D$, this is $x in (A union B) - (A inter B)$,
so we have $ x in A union B and x in.not A inter B ==> x in A union B and x in A^c union B^c $
this is $ (x in A and x in A^c) or (x in B and x in A^c) and.big (x in A and x in B^c) or (x in B and x in B^c) $
In the right side \ $(x in A and x in A^c) or (x in B and x in A^c) <==> "FALSE" or  (x in B and x in A^c) $
$<==> x in B and x in A^c$
$<==> x in B and x in.not A <==> x in (B - A)$
\ In the left side \ $(x in A and x in B^c) or (x in B and x in B^c) <==> (x in A and x in B^c) or "FALSE" <==> x in A and x in B^c$
$<==> x in A and x in.not B <==> x in (A - B)$
\ joining both sides we got $  (A - B) union (B - A) $
\ \ 
\ i) $A subset.eq A Delta B union A$, \ Let $x in A$, for the definition of union $x in A Delta B union A$
\ ii) $A subset.eq A Delta B union B$, \ Let $x in A$, thus $x in A union B$ by definition of union. We have two cases.
\ Case 1: $x in B$ therefore $x in A Delta B union B$, by the definition of union.
\ Case 2: $x in.not B$, we can't go directly as first case, instead we denote $x in A and x in.not B <==> x in A - B$ therefore by the first demonstration we got that $ x in (A - B) union (B - A) <==> x in A Delta B ==> x in A Delta B union B$
\ iii) $B subset.eq A Delta B union A$, \ We procceed like in ii), let $x in B$
\ iv) $B subset.eq A Delta B union B$. \ We procceed like in i) letting $x in B$
#align(right)[Q.E.D.]
]
#pagebreak()
#problem("5")[
  Show that if $f:A -> B "and" E,F subset.eq A$ then $f(E union F)=f(E) union f(F)$ and $f(E inter F) subset.eq f(E) inter f(F).$
]
#solution[
  _First part:_
  
*Forward Direction ($==>$):*  Let $y in f(E union F)$, by the definition of the function we have $exists x in E union F$ such that $f(x) = y$ thus $x in E or x in F$, 
  \ Case 1: $x in E => f(x) in f(E) <==> y in f(E) $
  \ Case 2: $x in F => f(x) in f(F) <==> y in f(F)$
  \ For this we have that $y in f(E) or y in f(F) ==> y in f(E) union f(F)$ thus $f(E union F) subset.eq f(E) union f(F)$
  
*Backward Direction ($<==$):* Let $y in f(E) union f(F) <==> y in f(E) or y in f(F)$ thus:
\ Case 1: 

Let $y in f(E) => exists x_E in E "such that" f(x_E) = y$
by definition of union $x_E in E union F $ therefore $f(x_E) in f(E union F) <==> y in f(E union F)$
\ Case 2: 

Let $y in f(F) space  exists x_F in F$ such that $f(x_F) = y ==> x_F in E union F$ therefore $f(x_F) in f(E union F) <==> y in f(E union F)$
\ so we know that $f(E) union f(F) subset.eq f(E union F)$ 
\ So we demonstrate that $f(E union F)=f(E) union f(F)$

_Second part:_

Let $y in f(E inter F)$ for definition of function $exists x in E inter F$ such that $f(x) = y$ thus $ x in E and x in F$ 
we know that for $x in E => f(x) in f(E) and x in F => f(x) in f(F)$
therefore $f(x) in f(E) inter f(F) <=> y in f(E) inter f(F)$
so we conclude that $f(E inter F) subset.eq f(E) inter f(F)$
#align(right)[Q.E.D.]
]
#problem("6")[Show that if $f : A -> B$ and $G, H$ are subset of $B$,  
then $f^(−1)(G ∪H) = f^(−1)(G) ∪ f^(−1)(H) $ and 
$ f^(−1)(G ∩H) = f^(−1)(G) ∩ f^(-1)(H)$

]
#solution[
_First part:_
  Let $a in f^(-1)(G union H) ==> f(a) in G union H$
  \ Case 1: $f(a) in G <==> a in f^(-1) (G)$
  \ Case 2: $f(a) in H <==> a in f^(-1) (H)$
  \ Thus $a in f^(-1)(G) or a in f^(-1)(H) <==> a in f^(-1)(G) union f^(-1)(H)$ 
  \  $therefore f^(−1)(G ∪H) subset.eq f^(−1)(G) ∪ f^(−1)(H)$
  \ Let $a in f^(-1)(G) union f^(-1)(H) <==>  a in f^(-1)(G) or f^(-1)(H)<==> f(a) in G or f(a) in H $
  \ Case 1: $f(a) in G <==> f(a) in G union H$ by definition of union, thus $a in f^(-1)(G union H)$
  \ Case 2: $f(a) in H <==> f(a) in G union H$ by definition of union, thus $a in f^(-1)(G union H)$
\ $therefore f^(−1)(G) union f^(-1)(H) subset.eq f^(−1)(G union H)$
\ So we got: $ f^(−1)(G) union f^(-1)(H) = f^(−1)(G union H)$

_Second part:_

Let $a in f^(-1)(G inter H)$ for definition of preimage we got 
\ $f(a) in G inter H <==> f(a) in G and f(a) in H$ 
aplying again definition of preimage we got 
\ $a in f^(-1)(G) and a in f^(-1)(H) <==> a in f^(-1)(G) inter f^(-1)(H) $
\ $therefore f^(−1)(G ∩H) subset.eq f^(−1)(G) ∩ f^(-1)(H)$

Let $a in f^(-1)(G) inter f^(-1)(H) <==> a in  f^(-1)(G) and a in f^(-1)(H) $
\ by definition of preimage $f(a) in G and f(a) in H <==> f(a) in G inter H $ thus $a in f^(-1)(G inter H) $
\ $therefore f^(−1)(G ∩H) supset.eq f^(−1)(G) ∩ f^(-1)(H)$
\ So $f^(−1)(G ∩H) = f^(−1)(G) ∩ f^(-1)(H)$
#align(right)[Q.E.D]
] 

#problem("7")[
  Show that if $f : A -> B$ is injective and $E ⊆A$ [respectively, surjective and $H ⊆ B$], then $f^(-1)(f(E)) = E$
[respectively, $f(f^(-1)(H)) = H$].
]

#solution[
_First part:_\
  Let $x in E ==> f(x) in f(E)$ and by definition of preimage $x in f^(-1)(f(E)) $ so we conclude that $E subset.eq f^(-1)(f(E)) $
\ Let $x in f^(-1)(f(E)) $, this implies $f(x) in f(E)$ thus $exists y in E $ such that $f(y) = f(x)$ \ 
recall the definition of injectiveness, $f(x_1) = f(x_2) ==> x_1 = x_2 $
so if $f(y)=f(x) ==> x = y, $ therefore $f(y) in f(E) ==> y in E <==> x in E $

_Second part:_\
Let $y in f(f^(-1)(H)) $ by definition of image $exists x in f^(-1)(H) $ such that $y = f(x)$, 
by definition of preimage it follows $f(x) in H$, 
and this implies $y in H$ therefore $f(f^(-1)(H)) subset.eq H$

Let $y in H$, because $H subset.eq B$, we know that $y$ is in the codomain, an using 
the definition of surjectivity we know that $forall y in H, space exists x in A$ such that $y = f(x)$, thus we have $y in H <=> f(x) in H$ and aplying definition of preimage $x in f^(-1)(H) $, this implies by image definition that $f(x) in f(f^(-1)(H)) <==> y in f(f^(-1)(H)) $
#align(right)[Q.E.D]
]

#problem("8")[
  Show that if $f$ is a bijection from $A$ onto $B$, then $f^(-1) $ is a bijection of $B$ onto $A$. Moreover, if $g$ is a
bijection of $B$ onto $C$, then the composite function $g ◦f$ is a bijection of $A$ onto $C$.
]
#solution[]
