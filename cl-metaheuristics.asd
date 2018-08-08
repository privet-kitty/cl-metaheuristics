#|
  This file is a part of cl-metaheuristics project.
  Copyright (c) 2018 Hugo I.
|#

#|
  library of several kinds of metaheuristic optimization

  Author: Hugo I.
|#

(defsystem :cl-metaheuristics
  :version "0.0.1"
  :author "Hugo I."
  :license "MIT"
  :depends-on (:alexandria :iterate)
  :serial t
  :components ((:module "src"
                :components
                ((:file "package")
                 (:file "simulated-annealing"))))
  :description "library of several kinds of metaheuristic optimization"
  :long-description
  #.(read-file-string
     (subpathname *load-pathname* "README.md"))
  :in-order-to ((test-op (test-op "cl-metaheuristics-test"))))
