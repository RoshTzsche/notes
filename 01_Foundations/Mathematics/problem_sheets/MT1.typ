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
    margin: (x: 1.25in, y: 1.25in),
    header: context {
      if counter(page).get().first() > 1 {
        align(right)[#text(size: 8pt, fill: luma(120))[#course -- #title]]
      }
    },
    numbering: "1",
  )

  // Global Typography
  set text(font: "New Computer Modern", size: 11pt)
  set par(justify: true, leading: 0.65em)
  show heading: set block(above: 1.5em, below: 1em)
  set math.equation(numbering: "(1)")

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
  line(length: 100%, stroke: 0.5pt + luma(150))
  v(1.5em)

  body
}

// ==========================================
// CUSTOM ENVIRONMENTS
// ==========================================
#let problem(num, body) = block(above: 1.5em, below: 1.5em)[
  *Problem #num:* \
  #body
]

#let solution(body) = block(above: 1em, below: 1.5em)[
  _Solution:_ \
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
  $ A inter union.big_(i in I)B_i = union.big_(i in I)(A inter B_i) and A union inter.big_(i in I)B_i =  inter.big_(i in I)(A union B_i) $
]

#solution[
  First part. 
  Let $x in (A inter union.big_(i in I)B_i)$, so by definition of intersection we have $x in A and x in cal(B)$
  what is $x in A and x in {B_i:i in I}$, therefore we have $x in A and x in B_j$ being $B_j$ an arbitrary set of $cal(B)$, so we have that $x in A inter B_j$, therefore $union.big_(i in I)(A inter B_i)$  
]
