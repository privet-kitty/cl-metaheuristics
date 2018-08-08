(cl:in-package :cl-user)

(defpackage cl-metaheuristics-examples
  (:nicknames :metahex)
  (:use :cl :iterate :cl-metaheuristics)
  (:import-from :cl-metaheuristics :positive-fixnum :nonnegative-fixnum)
  (:export :roth-problem :bench-roth-problem
           :make-rothgraph))
