select name, cast((EXTRACT(DAY FROM payday)) as int) as day from loan;
