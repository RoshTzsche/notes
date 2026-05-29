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
  title: "Formulario Termo",
  course: "Termodinámica",
  author: "Rosh Guadiana",
  ta: "dr. Felipe Córdova Lozano"
)

=== Adiabatic procces $q = 0$ 
Work of reversible adiabatic expansion
$ w_("ad") = n #overline[C]_v Δ T = Delta u $
\ In a monoatomic gas $C_v = 3/2 R$ and $C_p = 5/2 R$, in a diatomic gas
$C_v = 5/2 R$ and $C_p = 7/2 R$,
\
Temperature change, reversible adiabatic expansion
$ T_f = T_i (V_i/V_f) ^(1/c) $ where $c = C_(v , m) / R$
\ Pressure change, reversible adiabatic expansion
$ V_i T_i^c = V_f T_f^c $
\ Pressure change
$ P_f V^gamma _f = P_i V^gamma _i $
where $gamma = C_(p,n) / C_(v,n)$
$ T_i V_i ^(gamma - 1) =  T_f V_f ^(gamma - 1) $


= Segunda Ley
La entropía viene de aquí, nos permite conocer la dirección de la reacción

$ Delta S = q_("rev")/T $
=== A gas expands isothermally \
The reversible work in an *isothermal expansion* 
is $w_("rev") = −n R T ln(V_f/V_i)$, 
hence because for this isothermal process of a perfect gas q = −w,
we have:
$   Delta S = n R ln(V_f/V_i) $
here the change is isothermal so we could use $P_i V_i = P_f V_f$
\ We could alos use hess law to calculate the entropy $Delta S$
\ Entalpy in physical procces $Delta H = n C_(p,n)$

\ If expansion is irreversible (spontaneous) then $Delta S _("universe") > 0$ where $Delta S_("univerese") = Delta S _("system") + Delta S _("wall")$

==== Avogadros principle
here the entropyof a gas mix steps to calculate it, with formulas and explicilty explainin each one, 
with $X_a = n_a /(n_a = n_b) $ and how this 
translates to the diff in entropy
$Delta S = -R (n_a ln(X_a) + n_b ln(X_b))$ the entropy of a mix will be positive
==== change in entropy by heating
$ Delta S = n C_(p,n) ln(T_2 / T_1) $ where $T_2 > T_1$
== Carnot Cycle
We have 4 procceses four reversible stages in which a gas (the 
working substance) is either expanded or compressed in a par-
ticular sequence of ways (Fig. 3A.8). In stage 1 heat is trans-
ferred from a hot source to the gas, and in stage 3 energy as heat 
is transferred from the gas to a cold sink. Stage 1 is the 
isothermal reversible expansion at the temperature Th. Stage 2 is 
a reversible adiabatic expansion in which the temperature falls 
from Th to Tc. Stage 3 is an isothermal reversible compression at Tc. 
Stage 4 is an adiabatic reversible compression, which restores the 
system to its initial state.
\ ADD  $ Delta S = q_1 + q_2 + q_3 + q_4 = q_1 + q_3 $
where $q_1 > 0$ and $q_3 < 0$
for a perfect gas the entropy change is zero

STEPS TO CSLCULATE A WHOLE CARNOT Cycle
=== Eficiency $e$
The eficiency is always positive and is $ e = 1 + q_1 / q_3 $
also $ e = 1 - T_("low") / T_("high") $
$ e = -w / q $
=== Solving for carnot
- Step 1 isothermal
$ q_1 = -w_1 = n R T_("high") ln(V_2/V_1)$
- Step 2 adiabatic 
$w_2 = n C_(v,n) Delta T $ where $Delta T = T_L - T_H$
\ $q_2 = 0$
- Step 3 isothermal
complete
- Step 4 adiabatic (formulas above of Temp, pressure and volume )
complete 
$Delta T = T_H - T_L$

Steps to solve
\ $Delta u_("total") = Delta u_1 + Delta u_2 + Delta u_3 + Delta u_4$
\ $Delta w_("total") = Delta w_1 + Delta w_2 + Delta w_3 + Delta w_4$
which formulas use in each step is above

=== stages of a reaction
ie argon changes temp and volume, we could calculate entropy 
of each step separately
when volume changes $Delta S = n R ln(V_f / V_i) $
when temp changes $  Delta S = n C_(v,n) ln(T_f / T_i) $

\ temp exchange of two substances
we calculate T equilibrium
\ and then we know $Delta S = Delta S_1 + Delta S_2$ we sum both changues 
==== phase changes in a reaction
for example vaporization of water
this is a rev procces 
and assuming constant pressure we know
$q = Delta H_("vaporization") $
thus $ Delta S = q / T = (Delta H )/ T $
