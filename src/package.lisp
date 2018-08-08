(cl:in-package :cl-user)

(defpackage cl-metaheuristics
  (:nicknames :metah)
  (:use :cl :iterate)
  (:export :problem :annealer
           :solve :move
           :evaluate :tmax :tmin :max-steps :state :state-copier :goal-value))

