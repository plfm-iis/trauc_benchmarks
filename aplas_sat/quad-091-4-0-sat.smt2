(set-logic QF_S)

( declare-fun  x1 () String )
 ( declare-fun  x2 () String )
 ( declare-fun  z1 () String )
 ( declare-fun  z2 () String )
 ( assert ( =( str.++( str.++( str.++ "ab"  z1  ) ( str.++( str.++ x1  "abdc"  )  x2  )  ) ( str.++ "cd"  z2  )  ) ( str.++( str.++( str.++ z1  "ba"  ) ( str.++( str.++ x2  "dcba"  )  x1  )  ) ( str.++ z2  "dc"  )  )  ) )
 ( check-sat )
 