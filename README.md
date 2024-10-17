# MySQL Performance: How To Leverage MySQL Database Indexing

What is Indexing?
Indexing is a powerful structure in MySQL which can be leveraged to get the fastest response times from common queries. MySQL queries achieve efficiency by generating a smaller table, called an index, from a specified column or set of columns. These columns, called a key, can be used to enforce uniqueness. Below is a simple visualization of an example index using two columns as a key.

+------+----------+----------+
| ROW | COLUMN_1 | COLUMN_2 |
+------+----------+----------+
| 1 | data1 | data2 |
+------+----------+----------+
| 2 | data1 | data1 |
+------+----------+----------+
| 3 | data1 | data1 |
+------+----------+----------+
| 4 | data1 | data1 |
+------+----------+----------+
| 5 | data1 | data1 |
+------+----------+----------+
