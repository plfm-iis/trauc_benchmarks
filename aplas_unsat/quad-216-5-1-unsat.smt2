(set-logic QF_S)

( declare-fun  x1 () String )
 ( declare-fun  x2 () String )
 ( declare-fun  z1 () String )
 ( declare-fun  z2 () String )
 ( declare-fun  z3 () String )
 ( declare-fun  t1 () String )
 ( assert ( =( str.++( str.++( str.++( str.++ x1  "abdf"  )  x2  ) ( str.++( str.++ z1  t1  )  z2  )  ) ( str.++ "nm"  z3  )  ) ( str.++( str.++( str.++( str.++ x2  "dcab"  )  x1  ) ( str.++( str.++ z2  "fe"  )  z1  )  ) ( str.++ z3  "mn"  )  )  ) )
 ( check-sat )
 