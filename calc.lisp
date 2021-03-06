
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
    (let ((stack nil))
        (loop for lexeme in (expression-to-lexemes-list expression) do 
            (cond 
                ((numberp lexeme)
                    (push lexeme stack)
                )
                ((symbolp lexeme)
                    (push (eval (cons lexeme (reverse (list (pop stack) (pop stack))))) stack)
                )
            )
        )
        (if (> (list-length stack) 1)
            (error "Something wrong: found more then one result in stack")
        )

        (princ "Result: ")
        (write (pop stack))
    )
)

(setq expression "")
(loop do
    (terpri)
    (princ "Enter expression or type '/exit':")
    (terpri)
    (setq expression (read-line))
    (terpri)
    (if (string= expression "/exit") (return-from nil nil))
    (handler-case (calc-reverse-polish-expression)
        (t (c)
            (format t "[ERROR] ~a~%" c)
        )
    )
    (terpri)
    (princ "======================")
    (terpri)
)
