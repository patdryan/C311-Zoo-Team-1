#lang racket

;Kayla Kerckhove
(require 2htdp/image)
(require lang/posn)

(provide make-giraffe)

;function to put all main parts of giraffe together
(define (make-giraffe n)
  (let* ([head (make-head n)]
         [neck (make-neck n)]
         [body (taillegs n)])
    (overlay/align/offset "left" "top"
                    head
                    n (* 1.5 n)
                    (underlay/align/offset "left" "top"
                                          neck
                                          n (* n 3)  
                                          body))))

;function to add all elements to head
(define (make-head n)
   (let* ([head (overlay(ellipse (* n 1.35) (* n 2) "outline" "brown")(ellipse (* n 1.35) (* n 2) "solid" "Light Orange"))]
          [eyes (overlay/offset (make-eye n) (* .5 n) 0 (make-eye n))]
          [nostrils (overlay/offset (circle (* .1 n) "solid" "black") (* .5 n) 0 (circle (* .1 n) "solid" "black"))]
          [nose (overlay (ellipse (* 1.25 n) (* .90 n) "outline" "brown") (overlay nostrils (ellipse (* 1.25 n) (* .90 n) "solid" "lightbrown")))]
          [head-eyes (overlay/align/offset "middle" "middle" eyes 0 (* .15 n) head)]
          [head-nose (underlay/align "middle" "bottom" head-eyes nose)]
          [antenna (make-antenna n)]
          [ear (make-ear n)]
          [h-n-e (underlay/align "middle" "top" ear head-nose)]
          [h-n-a-e (underlay/align/offset "middle" "top" antenna 0 (* .45 n) h-n-e)]
          )
     h-n-a-e
  )
)

;function to make eye w/ white spot
(define (make-eye n)
  (overlay/align "left" "top" (circle (* .075 n) "solid" "white") (ellipse (* .25 n) (* .45 n) "solid" "black")))

;function to make anntenna
(define (make-antenna n)
  (define ann (above (circle (* .1 n) "solid" "brown")
         (overlay (rectangle (* .15 n) (* n .35) "outline" "brown") (rectangle (* .15 n) (* .35 n) "solid" "Light Orange"))))
  (overlay/offset
   ann
   (* .5 n) 0
   ann))

;function to make ears
(define (make-ear n)
  (define ear (underlay (overlay (ellipse (* .95 n) (* .5 n) "outline" "brown") (ellipse (* .95 n) (* .5 n) "solid" "Light Orange")) (ellipse (* .75 n) (* .3 n) "solid" "brown")))
  (overlay/offset
   (rotate 330 ear)
   (* 1.5 n) 0
   (rotate 30 ear)))

;function to create giraffe neck
(define (make-neck n)
  (define rectangle-width (exact-round (* n 0.75)))
  (define rectangle-height (exact-round (* n 4)))

  (define spot-count 10) ; Always 10 spots (although they may not all fit on neck)
  (define spot-radius (/ rectangle-height 10)) ; Relative size of spots to rectangle height

  (define half-rect-height (exact-round (* 0.5 rectangle-height)))
  (define spots
    (for/list ([i (in-range spot-count)])
      (regular-polygon spot-radius 6 "solid" "brown"))) ;make spots not perfect circles

  (define spacing (+ spot-radius spot-radius)) ; Adjust the spacing between spots

  (define positions
    (for/list ([i (in-range spot-count)])
      (make-posn (if (even? i) (exact-round (/ rectangle-width 1.4)) (exact-round (/ rectangle-width 4))) ;make the spots "zig-zag" on neck
                 (+ half-rect-height (- (* spacing i) (* spot-radius (- spot-count 1))))))) ; Evenly spaced along the vertical axis
  
  ;place spots on neck
  (rotate 15 (place-images
   spots
   positions
   (overlay (rectangle rectangle-width rectangle-height "outline" "brown")(rectangle rectangle-width rectangle-height "solid" "Light Orange"))))) ;place spots onto rectangle


;function to create body
(define (make-body n)
  (define ellipse-width (exact-round (* n 4.5)))
  (define ellipse-height (exact-round (* n 2.25)))
  (define body (overlay (ellipse ellipse-width ellipse-height "outline" "brown") (ellipse ellipse-width ellipse-height "solid" "Light Orange")))
  (define spot-radius (/ ellipse-height 4.5))                   ; spot size relative to body size
  (define spot  (regular-polygon spot-radius 6 "solid" "brown"))

  ;manually place spots on body to keep placement consistent
  (let* ([b1 (underlay/align "left" "middle" body spot)]
         [b2 (underlay/align "right" "middle" b1 spot)]
         [b3 (underlay/align "middle" "middle" b2 spot)]
         [b4 (underlay/align/offset "middle" "top" b3 (* .85 n) (* .15 n) spot)]
         [b5 (underlay/align/offset "middle" "top" b4 (* -.85 n) (* .15 n) spot)])
    b5))
  
;function to add tail and legs to body
(define (taillegs n)
  (let* ([body (make-body n)]
         [leg (above (overlay (rectangle (* .5 n) (* 2 n) "outline" "brown")(rectangle (* .5 n) (* 2 n) "solid" "light Orange")) (rectangle(* .5 n) (* .5 n) "solid" "brown"))]
         [legs (overlay/offset leg (* 3.25 n) 0 leg)]
         [body-legs (overlay/align/offset "left" "bottom" body (* .35 n) (* 2 n) legs)]
         [tail (rotate 35 (underlay/align/offset "middle" "bottom" (overlay (rectangle (* .15 n) (* 2.5 n) "outline" "brown") (rectangle (* .15 n) (* 2.5 n) "solid" "light orange")) 0 0 (regular-polygon (* .35 n) 3 "solid" "brown")))])
    (overlay/align/offset "right" "middle" body-legs (* n 1.25) (* -.45 n) tail)
    )
  )

(make-giraffe 50)



