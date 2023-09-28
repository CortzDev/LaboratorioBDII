use Veterinaria

-- logins
-- Login doctores
DROP LOGIN doctores_login
create login doctores_login
with password = '123' ;

DROP LOGIN contador_login
--Login contador
create login contador_login
with password = '123';

DROP LOGIN JuanPerez_login
--Login RHHH
create login JuanPerez_login
with password = '123';

--Login Proveedor 
DROP LOGIN proveedor_login
create login proveedor_login
with password = '123';

--Login Cita
DROP LOGIN Citas_login
create login Citas_login
with password = '123';

--Login Empleado
DROP LOGIN empleado_login
create login empleado_login
with password = '123';

--login Medicamentos
DROP LOGIN  medicamentos_login
create login medicamentos_login
with password = '123';

--Login Enfermera
DROP LOGIN  enfermera_login
create login enfermera_login
with password = '123';

--Los Usuarios
create user doctor_user
for login doctores_login;

--contador
create user contador_user
for login contador_login;

--RRHH
create user JuanPerez_user
for login JuanPerez_login;

--Empleado
create user empleado_user 
for login empleado_login;

--Enfermera 
create user enfermera_user 
for login enfermera_login;

--Roles
create role Doctores;
create role Contador;
create role RRHH;
create role Empleados;
create role Enfermera;

--Unir miembros
alter role Doctores add member doctor_user;
alter role Contador add member contador_user;
alter role RRHH add member JuanPerez_user;
alter role Empleados add member empleado_user;
alter role Enfermera add member enfermera_user;

--Permisos Doctores
grant select, insert, update on dbo.Medicamentos to Doctores;
grant select, insert, update on dbo.Recetas to Doctores;
grant select, insert, update on dbo.Citas to Doctores;
grant select, insert, update on dbo.Tratamientos to Doctores;
grant select, insert, update on dbo.Pacientes to Doctores;
grant select, insert, update on dbo.Historiales_Medicos to Doctores;

--permisos Contador
grant select, insert, update on dbo.Facturas to Contador;
grant select, insert, update on dbo.Ventas to Contador;

--permisos Recursos Humanos
grant select, insert, update on dbo.Empleados to RRHH;

--permisos empleados
grant insert, select on dbo.Medicamentos to Empleados;

--permisos Enfermera
grant select, insert, update on dbo.Medicamentos to Enfermera;
grant select, insert, update on dbo.Recetas to Enfermera;
grant select, insert, update on dbo.Citas to Enfermera;
grant select, insert, update on dbo.Tratamientos to Enfermera;
grant select, insert, update on dbo.Clientes to Enfermera;
grant select, insert, update on dbo.Historiales_Medicos to Enfermera;





