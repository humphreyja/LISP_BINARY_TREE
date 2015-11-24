(defstruct node
  (value nil)
  (right nil)
  (left nil))

(defun m-print-tree (root)
  "Pre-order"
  (if (null root)
    nil
    (format t "~s ~s ~s"
      (m-print-tree (node-left root))
      (node-value root)
      (m-print-tree (node-right root)))))


(defun insert-node (root val)
  (if (> (node-value root) val)
      (if (null (node-left root))
          (setf (node-left root) (make-node :value val))
          (insert-node (node-left root) val))
      (if (null (node-right root))
          (setf (node-right root) (make-node :value val))
          (insert-node (node-right root) val))))

(defun m-tree-node-count (root)
  (if (null root)
      0
      (+ 1
        (m-tree-node-count (node-left root))
        (m-tree-node-count (node-right root)))))

(setf treetest (make-node :value 10))
