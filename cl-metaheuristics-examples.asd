
(defsystem :cl-metaheuristics-examples
  :version "0.0.1"
  :author "Hugo I."
  :license "MIT"
  :depends-on (:cl-metaheuristics)
  :serial t
  :components ((:module "examples"
                :components
                ((:file "package")
                 (:file "hypergraph")
                 (:file "roth-problem-sa")))))
