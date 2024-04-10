#lang racket
;Katelynn Salisbury
(require 2htdp/image)
(provide tiger)

(define (tiger n)
  (scale n
  ;Tail
  (add-curve(add-curve
  ;Inner Legs
  (underlay/xy(overlay/offset (ellipse 40 100 "solid" "dark orange")110 0 (ellipse 40 100 "solid" "dark orange"))-55 -150
  (underlay/xy(overlay/offset (ellipse 30 100 "solid" "Linen")110 0 (ellipse 30 100 "solid" "Linen"))-60 -140
  (underlay/xy(overlay/offset (ellipse 40 100 "outline" (pen "black" 7 "dot-dash" "round" "miter"))110 0 (ellipse 40 100 "outline" (pen "black" 7 "dot-dash" "round" "miter")))-55 -150
  ;Tiger body
  (underlay/xy(crop/align "center" "center" 200 120 (circle 100 "solid" "dark orange"))-55 -80(underlay/xy(crop/align "center" "center" 200 120 (circle 99 "outline" (pen "black" 7 "dot-dash" "round" "miter")))-55 -80
  (underlay/xy(crop/align "center" "center" 200 120 (circle 75 "outline" (pen "black" 7 "dot-dash" "round" "miter")))-55 -80 (underlay/xy(crop/align "center" "center" 200 120 (circle 50 "outline" (pen "black" 7 "dot-dash" "round" "miter"))) -55 -80
  ;Outer Legs
  (underlay/xy(overlay/offset (ellipse 40 100 "solid" "dark orange")130 0 (ellipse 40 100 "solid" "dark orange")) -90 -170(underlay/xy (overlay/offset (ellipse 40 100 "outline" (pen "black" 7 "dot-dash" "round" "miter"))130 0 (ellipse 40 100 "outline" (pen "black" 7 "dot-dash" "round" "miter")))-90 -170 
  ;Face Stripes
  (place-image/align(rotate 180(pulled-regular-polygon 62 5 1/2 -10 "outline" (pen "black" 7 "dot-dash" "round" "miter")))70 80 "center" "center"
  ;Eyes and Eyebrows
  (overlay/xy(overlay/offset (rotate 315(ellipse 10 20 "solid" "white"))45 0 (rotate 315(ellipse 10 20 "solid" "white")))-36 -46(overlay/xy(overlay/offset(circle 14 "solid" "black") 45 0 (circle 14 "solid" "black"))-35 -44(overlay/xy(overlay/offset(circle 10 "solid" "ivory") 35 0 (circle 10 "solid" "ivory"))-44 -35
  ;Forehead fix
  (overlay/xy (ellipse 105 40 "solid" "dark orange") -17 -28
  ;Ears
  (overlay/xy(overlay/offset (rotate -50 (pulled-regular-polygon 28 5 1/2 -15 "solid" "ivory")) 90 0 (rotate 50 (pulled-regular-polygon 28 5 1/2 -15 "solid" "ivory"))) -2 -5(underlay/xy(overlay/offset (rotate -50 (pulled-regular-polygon 30 5 1/2 -15 "solid" "black")) 90 0 (rotate 50 (pulled-regular-polygon 30 5 1/2 -15 "solid" "black")))10 20
  ;Chin
  (overlay/xy(ellipse 50 40 "solid" "Linen") -35 -78
  ;Mouth and Muzzle
  (place-image/align(overlay/xy(overlay/offset (rotate 45(ellipse 10 20 "solid" "black"))10 0 (rotate 315(ellipse 10 20 "solid" "black")))-7 -4
  (place-image/align(pulled-regular-polygon 50 5 1/3 120 "outline" "black")20 85 "center" "bottom"(circle 20 "solid" "Linen")))60 72 "center" "center"
  ;Cheeks and Face base
  (place-image/align(circle 50 "solid" "dark orange")60 -12 "center" "top" (overlay/xy(overlay/offset (rotate -50 (ellipse 80 60 "solid" "Linen")) 51 0 (rotate 50 (ellipse 80 60 "solid" "Linen")))0 -35(pulled-regular-polygon 60 6 1/2 -10 "solid" "dark orange")))))))))))))))))))))
  ;Tail
   310 0 0 1
   240 90 0 0
  (make-pen "black" 12 "solid" "round" "round"))
   310 5 0 1
   250 90 0 0
  (make-pen "dark orange" 12 "dot-dash" "round" "miter")))
  )

