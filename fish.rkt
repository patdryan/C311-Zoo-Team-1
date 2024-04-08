#lang racket
(require 2htdp/image)
(provide swordfish)

(define (swordfish sz)
  (let* ([swordfish-body (overlay (ellipse sz (* .5 sz) "outline" "black")(ellipse sz (* .5 sz) "solid" "silver"))]
         [swordfish-fin (rotate 45 (overlay (triangle (* sz 0.3) "outline" "black")(triangle (* sz 0.3) "solid" "silver")))]
         [swordfish-eye (circle (* sz 0.05) "solid" "black")]
         [swordfish-sword (overlay (rectangle (* sz 0.6) (* sz 0.05) "outline" "black") (rectangle (* sz 0.6) (* sz 0.05) "solid" "silver"))]
         [bodywithfin (overlay/align "middle" "bottom" (rotate 170 (overlay (triangle (* sz .3) "outline" "black") (triangle (* sz .3) "solid" "silver"))) swordfish-body)]
         [body-and-fin (overlay/xy bodywithfin (* -.25 sz) (* .15 sz) swordfish-fin)] 
         [body-fin-and-sword (overlay/xy body-and-fin sz (* .25 sz) swordfish-sword)]
       )
    (underlay/xy body-fin-and-sword (* 1.05 sz) (* .15 sz) swordfish-eye)
  )
)





