#lang racket
(require 2htdp/image)
(require "Swordfish.rkt")

(define cage1
  (overlay/align "center" "top"
  (overlay
  (overlay/align/offset
   "left" "top"
   (rectangle 80 10 "solid" "black")
   0 0
   (rectangle 10 80 "solid" "black")
   )

  (overlay/align/offset
   "right" "bottom"
   (rectangle 80 10 "solid" "black")
   0 0
   (rectangle 10 80 "solid" "black")
   )
  )
  (rectangle 10 80 "solid" "black")
  )
)

(define cage2
  (overlay/align "center" "top"
  (overlay
  (overlay/align/offset
   "left" "top"
   (rectangle 80 10 "solid" "black")
   0 0
   (rectangle 10 80 "solid" "black")
   )

  (overlay/align/offset
   "right" "bottom"
   (rectangle 80 10 "solid" "black")
   0 0
   (rectangle 10 80 "solid" "black")
   )
  )
  (rectangle 10 80 "solid" "black")
  )
)

(define cage3
  (overlay/align "center" "top"
  (overlay
  (overlay/align/offset
   "left" "top"
   (rectangle 80 10 "solid" "black")
   0 0
   (rectangle 10 80 "solid" "black")
   )

  (overlay/align/offset
   "right" "bottom"
   (rectangle 80 10 "solid" "black")
   0 0
   (rectangle 10 80 "solid" "black")
   )
  )
  (rectangle 10 80 "solid" "black")
  )
)

(define cage4
  (overlay/align "center" "top"
  (overlay
  (overlay/align/offset
   "left" "top"
   (rectangle 80 10 "solid" "black")
   0 0
   (rectangle 10 80 "solid" "black")
   )

  (overlay/align/offset
   "right" "bottom"
   (rectangle 80 10 "solid" "black")
   0 0
   (rectangle 10 80 "solid" "black")
   )
  )
  (rectangle 10 80 "solid" "black")
  )
)


                   