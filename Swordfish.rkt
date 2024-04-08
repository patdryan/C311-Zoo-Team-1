#lang racket
(require 2htdp/image)


(define (swordfish sz)
  (let* ([swordfish-body (ellipse 130 60 "solid" "silver")]
         [swordfish-fin (rotate 45 (triangle (* sz 0.3) "solid" "silver"))]
         [swordfish-eye (circle (* sz 0.05) "solid" "black")]
         [swordfish-sword (rectangle (* sz 0.6) (* sz 0.05) "solid" "silver")]
         [body-and-fin (overlay/xy swordfish-body -25 25 swordfish-fin)]
         [body-fin-and-sword (overlay/xy body-and-fin 140 20 swordfish-sword)]
       )
    (underlay/xy body-fin-and-sword 130 5 swordfish-eye)
  )
  
)
(provide swordfish)


