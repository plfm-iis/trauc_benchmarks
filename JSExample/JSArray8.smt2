(declare-fun i1 () String)
(declare-fun i2 () String)
(declare-fun len1 () Int)
(declare-fun len2 () Int)
(declare-fun len3 () Int)
(declare-const emptyArray (Array String Int))
(declare-fun x1 () (Array String Int))
(declare-fun x2 () (Array String Int))
(declare-fun x3 () (Array String Int))
(declare-fun x4 () (Array String Int))
(declare-fun x5 () (Array String Int))

;
; function resetArray(arr) {
;   for(var i = 0; i < arr.length; i++) {
;     arr[i] = 0
;   }
; }
;
(define-fun-rec resetArray ((len Int)) (Array String Int)
  (
    ite (> len 0)
      (store (resetArray (- len 1)) (int.to.str len) len )
      (store emptyArray (int.to.str len) 0)
  )
)

;
; returns the largest of a and b
;
(define-fun-rec max ((x Int) (y Int)) Int
  (
    ite (> (- x y) 0)
      x
      y
  )
)

(assert (< (str.to.int i1) 10 ))
(assert (> (str.to.int i2) (str.to.int i1) ) )

;x = [0, 1, 2, 3, 4, 5]
(assert (= x1 (store (store (store (store (store (store emptyArray "0" 0) "1" 1) "2" 2) "3" 3) "4" 4) "5" 5)))
(assert (= len1 6))

; resetArray(x)
(assert (= x2 (resetArray len1)))

; x["3"] = 5
(assert (= len2 (ite (< (str.to.int i1) 0) len1 (max len1 (+ (str.to.int i1) 1)))))
(assert (= x3 (store x2 i1 5)))

; x["12"] = 7
(assert (= len3 (ite (< (str.to.int i2) 0) len2 (max len2 (+ (str.to.int i2) 1)))))
(assert (= x4 (store x3 i2 7)))

; resetArray(x)
(assert (= x5 (resetArray len3)))

(check-sat)
(get-model)

