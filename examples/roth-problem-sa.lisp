(cl:in-package :cl-metaheuristics-examples)

(defclass roth-problem (annealer)
  ((state :initarg :state :type coloring)
   (graph :initarg :graph :type hypergraph)
   (state-copier :initform #'copy-seq)
   (goal-value :initform nil)))

(defmethod initialize-instance :after ((rp roth-problem) &rest initargs)
  (declare (ignore initargs))
  (unless (slot-boundp rp 'state)
    (setf (slot-value rp 'state)
          (random-coloring (array-dimension (slot-value rp 'graph) 0)))))

(defun random-coloring (n)
  (let ((coloring (make-array n :element-type '(integer -1 1))))
    (dotimes (i n coloring)
      (setf (aref coloring i)
            (- (* 2 (random 2)) 1)))))

(defmethod move ((rp roth-problem))
  (declare (optimize (speed 3) (safety 1)))
  (with-slots (state graph) rp
    (declare (coloring state))
    (let ((idx (random (array-dimension state 0))))
      (setf (aref state idx)
            (* -1 (aref state idx))))))
(defmethod evaluate ((rp roth-problem))
  (with-slots (state graph) rp
    (calc-discrepancy graph state)))


#+sbcl
(defmacro with-profiling (&body body)
  "For devel."
  `(unwind-protect
        (progn (sb-profile:profile "CL-METAHEURISTICS")
               ,@body
               (sb-profile:report :print-no-call-list nil))
     (sb-profile:unprofile "CL-METAHEURISTICS")))

(defmacro time-after-gc (&body body)
  `(progn
     #+sbcl(sb-ext:gc :full t)
     #+ccl(ccl:gc)
     (time ,@body)))

(defun bench-roth-problem (&optional (n 20) (max-steps 100000) (tmin 0.2e0) (tmax 25000e0))
  (let ((graph (make-rothgraph n))
        #+sbcl(*random-state* (sb-ext:seed-random-state 1)))
    (time-after-gc
      (solve (make-instance 'roth-problem
                            :graph graph
                            :max-steps max-steps
                            :tmin tmin
                            :tmax tmax)))))
