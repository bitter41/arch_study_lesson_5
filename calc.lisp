
(defvar expression)

(defun expression-to-lexemes-list(expression)
    (with-input-from-string (s expression)
        (let ((r nil))
            (do ((line (read s nil 'eof)
                       (read s nil 'eof)))
                ((eql line 'eof))
                (push line r))
            (reverse r)
        )
    )
)

(defun calc-reverse-polish-expression()
    (princ "Enter expression: ")
    (terpri)
    (setq expression (read-line))
    (terpri)
    (write (expression-to-lexemes-list expression))
    (terpri)

)

(calc-reverse-polish-expression)
