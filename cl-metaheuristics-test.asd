#|
  This file is a part of cl-metaheuristics project.
  Copyright (c) 2018 Hugo I.
|#

(defsystem "cl-metaheuristics-test"
  :author "Hugo I."
  :license "MIT"
  :depends-on ("cl-metaheuristics"
               "cl-metaheuristics-examples"
               "fiveam")
  :components ((:module "tests"
                :components
                ((:file "cl-metaheuristics-test"))))
  :description "Test system for cl-metaheuristics"

  :perform (test-op (op c)
                    (uiop:symbol-call :fiveam :run! :cl-metaheuristics-suite)))
