(set-logic QF_S)

( declare-fun  x1 () String )
 ( declare-fun  x2 () String )
 ( declare-fun  z1 () String )
 ( declare-fun  z2 () String )
 ( declare-fun  t1 () String )
 ( declare-fun  t2 () String )
 ( declare-fun  t3 () String )
 ( declare-fun  t4 () String )
 ( declare-fun  t5 () String )
 ( assert ( =( str.++( str.++( str.++ x1  "dcb"  )  x2  ) ( str.++ z2 ( str.++( str.++ t2  t1  )  z1  )  )  ) ( str.++( str.++( str.++ x2  "btd"  )  x1  ) ( str.++ z1 ( str.++( str.++ t5 ( str.++ t4  t3  )  )  z2  )  )  )  ) )
 ( check-sat )
 