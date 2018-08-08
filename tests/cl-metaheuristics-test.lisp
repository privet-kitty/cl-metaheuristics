(defpackage cl-metaheuristics-test
  (:use :cl
   :cl-metaheuristics
   :cl-metaheuristics-examples
   :fiveam))
(in-package :cl-metaheuristics-test)

;; NOTE: To run this test file, execute `(asdf:test-system :cl-metaheuristics)' in your Lisp.

(def-suite :cl-metaheuristics-suite)
(in-suite :cl-metaheuristics-suite)

(test test-sa
  (let ((graph (make-rothgraph 20)))
    (is (equal '(20 554) (array-dimensions graph)))
    (signals type-error
      (make-instance 'roth-problem
                     :graph graph
                     :max-steps 100.0))))
