(defconst rerun-sqli-buffer-name "*SQL: <mysql-main>*")

(defun rerun-last-input-sql-command()
  "rerun last sql command in SQLi buffer"
  (interactive)
  (with-current-buffer rerun-sqli-buffer-name
    (comint-previous-input 0)
    (comint-send-input)))

(provide 'dev-mysql)
