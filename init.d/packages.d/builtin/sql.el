(use-package sql
  :custom
  (sql-mysql-program "~/SQLEngine/build/bin/mysql")
  (sql-mysql-options '("-b" "-c"))
  (sql-postgres-program "~/postgresql/bin/psql")
  (sql-product 'mysql)
  (sql-connection-alist
   '(("mysql-main"
      (sql-product 'mysql)
      (sql-user "root")
      (sql-database "test")
      (sql-port 8306)
      (sql-server "127.0.0.1"))
     ("mysql-13"
       (sql-product 'mysql)
       (sql-user "root")
       (sql-database "test")
       (sql-port 8406)
       (sql-server "127.0.0.1")))))
