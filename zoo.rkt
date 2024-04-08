#lang racket
(require 2htdp/image)
(require "giraffe.rkt")
(require "panda.rkt")
(require "fish.rkt")
(require "extra-decor.rkt")

(define (welcome n)
  (define message (text/font "  WELCOME\nTO OUR ZOO!" (* 1 n) "black"
                             "Gill Sans" 'swiss 'normal 'bold #f))
  (define board (overlay (overlay message (rectangle (* 10 n) (* 4 n) "solid" "brown")) (rectangle (* 10.25 n) (* 4.25 n) "solid" "black")))
  (above board (overlay/offset (rectangle n (* 7 n) "solid" "brown") (* 6 n) 0 (rectangle n (* 7 n) "solid" "brown"))))

(define (giraffe-plot n)
  (define outline (ellipse (* 12.5 n) (* 15.5 n) "solid" "dark green"))
  (define inside (ellipse (* 12 n) (* 15 n) "solid" "medium green"))
  (define plot (rotate 230 (overlay inside outline)))
  (define giraffes (beside (overlay/align/offset "right" "top" (make-giraffe (* .5 n)) (* -.5 n) (* 3.5 n) (make-giraffe (* .75 n))) (make-giraffe (* .6 n))))
  (overlay giraffes (overlay/align "left" "top" (draw-tree n) (overlay/align/offset "right" "middle" (draw-tree (* 1.25 n)) 0 n plot))))
  

(define (lion-plot n)
  (define outline (ellipse (* 16.5 n) (* 10.5 n) "solid" "dark green"))
  (define inside (ellipse (* 16 n) (* 10 n) "solid" "medium green"))
  (define plot (rotate 340 (overlay inside outline)))
  (overlay/align/offset "left" "middle" (rock n) (* -2 n) 0 (overlay/align/offset "right" "top" (draw-bush (* .75 n)) (* 6 n) 0
                                                                                  (overlay/align/offset "right" "bottom" (draw-bush (* .6 n)) (* 2 n) n plot))))

(define (panda-plot n)
  (define outline (ellipse (* 10.5 n) (* 13.5 n) "solid" "dark green"))
  (define inside (ellipse (* 10 n) (* 13 n) "solid" "medium green"))
  (define plot (rotate 150 (overlay inside outline)))
  (define pandas(beside (overlay/align/offset "right" "top" (panda (* .5 n)) (* -2 n) (* 4 n) (panda (* .5 n))) (panda (* .6 n))))
 (overlay pandas (overlay/align/offset "right" "top" (bamboo n) (* 2 n) (* .15 n) (overlay/align/offset "left" "middle" (bamboo (* .75 n)) (* -.5 n) 0
                                                                                                        (overlay/align/offset "middle" "bottom" (bamboo (* .6 n)) 0 n plot)))))

(define (swordfish-plot n)
  (define outline (ellipse (* 15.5 n) (* 9.5 n) "solid" "dark blue"))
  (define inside (ellipse (* 15 n) (* 9 n) "solid" "medium blue"))
  (define plot (rotate 10(overlay inside outline)))
  (define fish (overlay/align/offset "right" "top" (rotate 320 (swordfish (* 2 n))) (* -3 n) (* 2 n) (overlay/align/offset "left" "bottom" (rotate 330 (swordfish (* 2.5 n))) (* 4 n) (* 2 n)
                                                                                                              (overlay/align/offset "left" "top" (rotate 10 (swordfish (* 1.5 n))) n (* 3 n) (rotate 30 (swordfish (* 3 n)))))))
  (overlay fish plot))


(define (zoo n)
  (let* ([base (overlay/align "middle" "bottom" (welcome n) (rectangle (* 40 n) (* 25 n) "solid" "khaki"))]
         [withgiraffe (overlay/align/offset "right" "bottom" (giraffe-plot n) 0 n base)]
         [withpanda (overlay/align/offset "left" "bottom" (panda-plot n) (- 0 n) n withgiraffe)]
         [withfish (overlay/align/offset "right" "top" (swordfish-plot n) n 0 withpanda)]
         [withlion (overlay/align/offset "left" "top" (lion-plot n) (* -3 n) 0 withfish)]
         )
    withlion))

(zoo 20)


