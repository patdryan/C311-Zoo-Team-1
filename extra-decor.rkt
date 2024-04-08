#lang racket

(require 2htdp/image)

(provide draw-tree)
(provide draw-bush)
(provide bamboo)
(provide rock)

(define (draw-tree n)
  (let* ([largeleaf (circle n "solid" "dark green")]
         [smallleaf (circle (* .75 n) "solid" "dark green")]
         [leaves (overlay/offset
                  (overlay/offset
                  (overlay/offset largeleaf
                                  (* 2 n) 0
                                  largeleaf)
                  0 (- 0 n)
                  (overlay/offset smallleaf (* 2 n) 0 smallleaf))
                  0 (- 0 n) largeleaf)]
         [trunk (rectangle (* n .5) (* n 4) "solid" "brown")]
         [branch (rectangle (* .25 n) (* 1.5 n) "solid" "brown")]
         [trunk-branch (overlay/align/offset "middle" "middle" trunk (* .5 n) (- 0 n) (rotate 330 branch))])
    (underlay/align/offset "middle" "top" leaves (* .35 n) (* 1.5 n) trunk-branch)
    
  ))

(define (draw-bush n)
  (let* ([leaf (circle (* .75 n) "solid" "dark green")]
         [leaves (overlay/offset
                  (overlay/offset
                   (overlay/offset leaf
                                   (* 2.5 n) 0
                                   leaf)
                   0 (- 0 n)
                   (overlay/offset leaf n 0 leaf))
                  0 (* .5 n) (rectangle (* 2 n) (* 1.5 n) "solid" "dark green"))])
    leaves))

(define (bamboo n)
  (let* ([segment (overlay (rectangle (* .5 n) n "outline" "white")(rectangle (* .5 n) n "solid" "Olive Drab"))]
         [leaf (rotate 45 (overlay (ellipse (* .25 n) n "outline" "white")(ellipse (* .25 n) n "solid" "Olive Drab")))])
    (overlay/offset leaf (* .65 n) n (above segment (above segment (above segment (above segment segment)))))))

(define (rock n)
  (overlay/align "left" "bottom" (rotate 120 (ellipse (* 3 n) (* n 5) "solid" "gray")) (ellipse (* n 5) (* 3 n) "solid" "gray")))





    
