
-- 1 Lista de empleados orden descendente
SELECT * FROM TB_Empleados ORDER BY CodEmp DESC

-- 2 Listado de pacientes ascendente
SELECT * FROM TB_Paciente ORDER BY CodPac ASC

-- 3 Listado de pacientes ingresados por mes y sexo
SELECT CASE
	WHEN MONTH(FecReg) = 1 THEN 'Enero'
	WHEN MONTH(FecReg) = 2 THEN 'Febrero'
	WHEN MONTH(FecReg) = 3 THEN 'Marzo'
	WHEN MONTH(FecReg) = 4 THEN 'Abril'
	WHEN MONTH(FecReg) = 5 THEN 'Mayo'
	WHEN MONTH(FecReg) = 6 THEN 'Junio'
	WHEN MONTH(FecReg) = 7 THEN 'Julio'
	WHEN MONTH(FecReg) = 8 THEN 'Agosto'
	WHEN MONTH(FecReg) = 9 THEN 'Septiembre'
	WHEN MONTH(FecReg) = 10 THEN 'Octubre'
	WHEN MONTH(FecReg) = 11 THEN 'Noviembre'
	WHEN MONTH(FecReg) = 12 THEN 'Diciembre'
END
as Mes, SexoCli as Sexo, COUNT(*) as Cantidad FROM TB_Paciente GROUP BY SexoCli, MONTH(FecReg)

-- 4 Listado de proveedores y medicamentos 
SELECT * FROM TB_Proveedores PV
INNER JOIN TB_Producto P
ON P.CodProve = PV.CodProve
INNER JOIN TB_Medicamen  M
ON M.CodProd = P.CodProd

-- 5 Listado de todas las camas y que paciente las ocupa durante año 2019
SELECT * FROM TB_Camas C
INNER JOIN TB_Habitaciones H
on H.CodHab = C.CodHab
INNER JOIN TB_Cita CI
on CI.CodHab = C.CodHab
INNER JOIN TB_Paciente P
on CI.CodPac = p.CodPac
WHERE YEAR(FecReg) = 2019

-- 6 Listado de todos los empleados y pedidos realizados durante 2017
SELECT * FROM TB_Empleados E
INNER JOIN TB_Pedido P
ON P.CodEmp = E.CodEmp
WHERE YEAR(Fecha) = 2017

-- 7 Listado de pacientes de habitaciones bloque 5 con descripción ALA SUR
SELECT * FROM TB_Paciente P
INNER JOIN TB_Cita C
ON C.CodPac =P.CodPac
INNER JOIN TB_Habitaciones H
ON C.CodHab = h.CodHab
WHERE H.Bloque = 5 AND H.Descripcion = 'ALA SUR'

-- 8 Seleccionar "Aspirinas" de "Bayer"
SELECT PA.Cantidad, PA.CostoUnitario FROM TB_Producto P
INNER JOIN TB_Proveedores PV
ON PV.CodProve = P.CodProve
INNER JOIN TB_Producto_Almacen PA
ON PA.CodProd = P.CodProd
INNER JOIN  TB_Almacen_Nivel AN
ON AN.CodNivel = PA.CodNivel
WHERE P.Nombre ='Aspirinas' AND PV.Nombre = 'Bayer' 
AND AN.Nivel = 2  

-- 9 Listado de pacientes relacionados con médicos externos orden ASC
SELECT * FROM TB_Paciente P 
INNER JOIN TB_Paciente_MedicoExterno PM
ON PM.CodPac = P.CodPac ORDER BY P.CodPac ASC

-- 10 Promedio de pacientes ingresados en diciembre y medicados con Penicilina
SELECT AVG(COUNT(*)) FROM TB_Medicacion MD
INNER JOIN TB_Paciente PC 
ON MD.CodPac = PC.CodPac
WHERE MONTH(PC.FecReg) = 12

-- 11 Inventario de productos y proveedores que no han tenido pedidos
SELECT * FROM TB_Producto P
INNER JOIN TB_Proveedores PR
ON P.CodProve = PR.CodProve
INNER JOIN TB_Pedido PE
ON PE.CodProd = P.CodProd
WHERE COUNT(PE.Cantidad) < 1

-- 12 Listar empleados con contratos vigentes
SELECT c.EscalaSalarial, c.FecInc, c.FecFin FROM TB_Empleados E
INNER JOIN TB_Contrato C
ON C.CodEmp = E.CodEmp
INNER JOIN TB_Horario H
ON E.Turno = H.Turno
WHERE c.FecFin is null

-- 13 Listar todas las citas que se tienen programadas para el mes de enero del 2019 indicando el paciente a recibir
SELECT C.CodCita, FORMAT(c.FecHorCita, 'dd/MM/yyyy hh:mm') AS Fecha,
CONCAT(P.NomCli, ' ', P.ApelCli) as Paciente FROM TB_Cita C
INNER JOIN TB_Paciente P
ON C.CodPac = P.CodPac
WHERE MONTH(C.FecHorCita) = 1
AND YEAR(C.FecHorCita) = 2019

-- 14 Consultar las citas del señor "Carlos Perez"
SELECT * FROM TB_Cita C
INNER JOIN TB_Paciente P
ON C.CodPac = P.CodPac
WHERE P.NomCli = 'CARLOS' AND P.ApelCli = 'PEREZ' 

-- 15 Listado de todos los empleados donde se vea los años
SELECT CodEmp, CONCAT(NomEmp, ' ', ApelEmp) as NombreCompleto, 
Direccion, CONVERT(VARCHAR(10), FacNac, 105) AS [FechaCumpleaños],
DATEDIFF(YEAR, FacNac, GETDATE()) AS Edad FROM TB_Empleados

-- 16 a) Listado de pacientes los cuales han asistido a más de 10 citas en el año
SELECT P.CodPac, P.NomCli, P.ApelCli, 
COUNT(*) AS Citas  FROM TB_Cita C
INNER JOIN TB_Paciente P
ON C.CodPac = P.CodPac
WHERE YEAR(C.FecHorCita) = 2019
GROUP BY YEAR(C.FecHorCita), P.CodPac,
P.NomCli, P.ApelCli
HAVING COUNT(*) > 10

-- 16 b) Listado de medicamentos entregados al señor Juan Perez en el año 2019

-- 16 c) Listado por paciente y de los parientes que tiene
SELECT P.CodPac, P.NomCli, P.ApelCli FROM TB_Paciente P
INNER JOIN TB_PAciente_Pariente PP
ON PP.CodPac = P.CodPac
GROUP BY P.CodPac, p.NomCli, p.ApelCli

-- 17 

SELECT * FROM TB_Habitaciones

-- 16 a) Listado de medicamentos entregados al señor JUAN PEREZ, en el año 2019
SELECT YEAR(MD.FecInic) as Anio FROM TB_Medicacion MD
INNER JOIN TB_Paciente P
ON MD.CodPac = P.CodPac
INNER JOIN TB_Producto PR
ON MD.CodProd = PR.CodProd
WHERE P.CodPac = (SELECT CodPac FROM TB_Paciente WHERE NomCli = 'JUAN' AND ApelCli='PEREZ')
AND YEAR(MD.FecInic) = 2019
GROUP BY YEAR(MD.FecInic)


