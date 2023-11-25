--SECUENCIA/FACTURA_GUIA

--Creacion de secuencia
create sequence seqID_Factura
start with 100001
increment by 1
minvalue 1
maxvalue 999999

--Insercción de datos 
use veterinaria;
Insert into Facturas(ID_Factura, ID_Venta, ID_Paciente, Fecha, Total)
values (next value for seqID_Factura, 1, 1,cast(getdate() as date), 50.25)

--Eliminar secuencia
drop sequence seqID_Factura;

--Consultar 
select * from Facturas;

--Consultar el siguiente valor 
Select next value for seqID_Factura as next_value;

--Consultar el valor actual.
select current_value  from sys.sequences
where name = 'seqID_Factura';

