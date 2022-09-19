#!/bin/bash
fn='input.txt'
while IFS= read -r line; do
        psql -h $line -p 5432 -U postgres -c "SELECT pg_database.datname as \"database_name\", pg_database_size(pg_database.datname)/1024/1024 AS size_in_mb FROM pg_database ORDER by size_in_mb DESC;";
done < $fn
