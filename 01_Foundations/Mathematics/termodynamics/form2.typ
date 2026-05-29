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
  title: "Thermodynamics Formulary",
  course: "Thermodynamics",
  author: "Rosh Guadiana",
  ta: "Dr. Felipe Córdova Lozano"
)
= First Law 
$ w = -P_("ext") Delta V $
= Second Law
Entropy originates here; it allows us to determine the direction of a reaction.

$ Delta S = q_("rev")/T $
$Delta S_("universe") > 0 $ then the process is non reversible, i.e. irreversible, spontaneous
\ $Delta S_("universe")=0 $ the process is reversible
\where $Delta S_("universe")= Delta S_("syst.") + Delta S_("surr.") $
$"Irreversible isothermal:" Delta S_("surr.")= -q_("sys") / T space Delta u = 0 space -w = q $
== General Entropy Changes
For any reversible process of an ideal gas, derived from $d U = T d S - P d V$:

Simultaneous change of Volume and Temperature:
$ Delta S = n C_(v,m) ln(T_f / T_i) + n R ln(V_f / V_i) $

Simultaneous change of Pressure and Temperature:
$ Delta S = n C_(p,m) ln(T_f / T_i) - n R ln(P_f / P_i) $

=== A gas expands isothermally
The reversible work in an *isothermal expansion* is $w_("rev") = -n R T ln(V_f/V_i)$, hence because for this isothermal process of a perfect gas $q = -w$, we have:
$ Delta S = n R ln(V_f/V_i) $

Here the change is isothermal so we could use $P_i V_i = P_f V_f$.
\ We could also use Hess's law to calculate the entropy $Delta S$.
\ Enthalpy in physical process: $Delta H = n C_(p,m)$

\ If expansion is irreversible (spontaneous) then $Delta S_("universe") > 0$ where $Delta S_("universe") = Delta S_("system") + Delta S_("surroundings")$.

==== Change in entropy by heating
$ Delta S = n C_(p,m) ln(T_2 / T_1) $ where $T_2 > T_1$.
\ Also $ Delta S = m SS ln(T_2 / T_1) $ where $T_2 > T_1$
=== Adiabatic process $q = 0$ 
Work of reversible adiabatic expansion:
$ w_("ad") = n C_(v,m) Delta T = Delta U $

\ In a monoatomic gas $C_v = 3/2 R$ and $C_p = 5/2 R$. In a diatomic gas $C_v = 5/2 R$ and $C_p = 7/2 R$.

\ Temperature change, reversible adiabatic expansion:
$ T_f = T_i (V_i/V_f)^(1/c) $ where $c = C_(v,m) / R$

\ Pressure change, reversible adiabatic expansion:
$ P_f V_f^gamma = P_i V_i^gamma $ where $gamma = C_(p,m) / C_(v,m)$
$ T_i V_i^(gamma - 1) = T_f V_f^(gamma - 1) $

==== Avogadro's Principle / Entropy of Mixing
When two ideal gases mix isothermally and isobarically, the process is spontaneous, driven entirely by an increase in entropy.
Using mole fractions for a mixture of gas A and B: $X_A = n_A / (n_A + n_B)$ and $X_B = n_B / (n_A + n_B)$.

$ Delta S_("mix") = -R (n_A ln(X_A) + n_B ln(X_B)) $
Because a mole fraction ($X$) is always between 0 and 1, its natural logarithm is negative. Multiplying by $-R$ guarantees that $Delta S_("mix") > 0$.
#pagebreak()
== Carnot Cycle
We have 4 processes, four reversible stages in which a gas (the working substance) is either expanded or compressed in a particular sequence of ways.
$ Delta U_("cycle")= Delta S_("cycle")=Delta H_("cycle")= 0 $
=== Efficiency $e$
The efficiency is always positive:
$ e = 1 + q_3 / q_1 $
$ e = 1 - T_C / T_H $
$ e = -w_("total") / q_1 $

=== Solving for Carnot (Explicit Steps)
- *Stage 1: Isothermal Reversible Expansion* (at $T_H$)
  Heat is transferred from a hot source to the gas.
  $ Delta U_1 = 0 $
  $ q_1 = -w_1 = n R T_H ln(V_2/V_1) $
  $ Delta S_1 = q_1 / T_H = n R ln(V_2/V_1) $
  
- *Stage 2: Adiabatic Reversible Expansion* ($T_H$ to $T_C$)
  The temperature falls from $T_H$ to $T_C$.
  $ q_2 = 0 $
  $ Delta U_2 = w_2 = n C_(v,m) (T_C - T_H) $
  $ Delta S_2 = 0 $
  
- *Stage 3: Isothermal Reversible Compression* (at $T_C$)
  Energy as heat is transferred from the gas to a cold sink.
  $ Delta U_3 = 0 $
  $ q_3 = -w_3 = n R T_C ln(V_4/V_3) $
  $ Delta S_3 = q_3 / T_C = n R ln(V_4/V_3) $
  
- *Stage 4: Adiabatic Reversible Compression* ($T_C$ to $T_H$)
  Restores the system to its initial state.
  $ q_4 = 0 $
  $ Delta U_4 = w_4 = n C_(v,m) (T_H - T_C) $
  $ Delta S_4 = 0 $

*Total Cycle Outcomes:*
Because the cycle returns to its initial state, all state functions have a net change of zero:
$ Delta U_("total") = Delta U_1 + Delta U_2 + Delta U_3 + Delta U_4 = 0 $
$ Delta S_("total") = Delta S_1 + Delta S_2 + Delta S_3 + Delta S_4 = 0 $
$ w_("total") = w_1 + w_2 + w_3 + w_4 $

=== Stages of a reaction
i.e. argon changes temp and volume, we could calculate the entropy of each step separately.
When volume changes: $ Delta S = n R ln(V_f / V_i) $
When temp changes: $ Delta S = n C_(v,m) ln(T_f / T_i) $

\ Temperature exchange of two substances: 
We calculate $T_("equilibrium")$ and then we know $Delta S = Delta S_1 + Delta S_2$, we sum both changes.

==== Phase changes in a reaction
For example, vaporization of water. This is a reversible process.
Assuming *constant pressure*, we know $q = Delta H_("vap")$.
Thus:
$ Delta S = q / T = (Delta H_("vap")) / T $
This assumption is useful in reactions, when pressure is constant
$ Delta S = (Delta H)/T $
#pagebreak()
= Unit Conversions
== Pressure
$ 1 "atm" = 101325 "Pa" = 101.325 "kPa" = 1.01325 "bar" $
$ 1 "atm" = 760 "Torr" = 760 "mmHg" $
$ 1 "bar" = 10^5 "Pa" = 0.986923 "atm" $

== Energy & Work
$ 1 "J" = 1 "kg" dot "m"^2 / "s"^2 = 1 "V" dot "C" $
$ 1 "cal" = 4.184 "J" ("Thermochemical calorie") $
$ 1 "L" dot "atm" = 101.325 "J" $
$ 1 "eV" approx 1.602176634 times 10^(-19) "J" $

== Temperature
$ T(K) = T^circle.small C + 273.15 $
$ T^circle.small C = (T^circle.small F - 32) times 5/9 $
$ T^circle.small R = T^circle.small F + 459.67 ("Rankine, absolute scale") $
$ T^circle.small R = 9/5 T(K) $

== Volume
$ 1 "m"^3 = 1000 "L" = 10^6 "cm"^3 $
$ 1000 "cm"^3 = 1 L $
$ 1 "L" = 1 "dm"^3 = 1000 "mL" = 1000 "cm"^3 $
= Fundamental Constants
#table(
  columns: (auto, auto, 1fr),
  align: (left, left, left),
  [*Constant*], [*Symbol*], [*Value*],
  [Universal Gas Constant], [$R$], [$8.314462618 "J" / ("mol" dot "K")$ \ $0.082057366 "L" dot "atm" / ("mol" dot "K")$ \ $1.987204258 "cal" / ("mol" dot "K")$],
  [Avogadro's Number], [$N_A$], [$6.02214076 times 10^23 "mol"^(-1)$],
  [Standard Atm Pressure], [$P_"atm"$], [$101325 "Pa"$]
)
