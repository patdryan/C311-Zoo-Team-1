#lang slideshow
(require 2htdp/image)

(provide panda)

(define (panda n)
  ; face
  (let* ([head (circle (* 1.80 n) "outline" "black")]
         [ear (circle (* .70 n) "solid" "black")]
         [ears (overlay/offset ear (* 3.5 n) 0 ear)]
         [eye (overlay/align "left" "top" (circle (* .25 n) "solid" "white") (circle (* .5 n) "solid" "black"))]
         [eyes (overlay/offset eye (* 1.5 n) 0 eye)]
         [nose (rotate 180 (triangle (* .75 n) "solid" "black"))]
         [face (overlay/offset eyes 0 (* 1 n) nose)]
         [mouth (rhombus (* .75 n) (* 7.5 n) "solid" "black")]
         [face-mouth (overlay/offset face 0 (* 1 n) mouth)]
         [head-face (overlay face-mouth head)]
         [head-face-ears (overlay/offset ears 0 (* 1.5 n) head-face)]

         ; body
         [bodyleg (ellipse (* 2.5 n) (* 4 n) "solid" "transparent")]
         [bodyarm (ellipse (* 2.5 n) (* 4 n) "solid" "white")]
         [body (ellipse (* 2.5 n) (* 4 n) "outline" "black")]
         [arm1 (rotate 20(ellipse  (* 1 n) (* 3.5 n) "solid" "black"))]
         [arm2 (rotate -20(ellipse  (* 1 n) (* 3.5 n) "solid" "black"))]
         [arms(beside/align "middle" arm2 bodyarm arm1)]
         [leg1 (rotate 5(ellipse  (* 1 n) (* 2.5 n) "solid" "black"))]
         [leg2 (rotate -5(ellipse  (* 1 n) (* 2.5 n) "solid" "black"))]
         [unleg1
          (underlay/align/offset "right" "bottom" bodyleg 0 (* 1.5 n) leg1)]
         [unleg2
          (underlay/align/offset "left" "bottom" bodyleg 0 (* 1.5 n) leg2)]
         [bottom (underlay/offset unleg1 (* -.25  n) 0 unleg2)]
         [behind (underlay/align/offset "right" "middle"
                                      (underlay/align/offset "left" "middle"
                                                             bodyarm (* -.8 n) 0 arm2) (* .8 n) 0 arm1)]
         
         [overall (underlay behind bodyarm body)]
         [body-overall (overlay/offset overall 0 (* .90 n) bottom)])

  ; together
  (above head-face-ears body-overall))

  )

(panda 13)