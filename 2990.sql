select empregados.cpf, empregados.enome, departamentos.dnome 
from empregados 
inner join departamentos 
on empregados.dnumero = departamentos.dnumero 
where empregados.cpf_supervisor is null order by empregados.cpf;
