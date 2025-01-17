(defmacro append-header (name value)
  `(setf (lack.response:response-headers ningle:*response*)
        (append (lack.response:response-headers ningle:*response*)
                (list ,name ,value))))

(defmacro with-json (&body body)
  `(let ((result (progn ,@body)))
     (append-header :content-type "application/json")
     (append-header :access-control-allow-origin "*")
     (append-header :access-control-allow-headres "Content-type, Authorization")
     (to-json* result)))
