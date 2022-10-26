CREATE PROCEDURE InsertCategory @Categoria varchar(max)
AS
	INSERT INTO TB_Categoria (Categoria) VALUES (@Categoria)
go

exec InsertCategory 'Desarrollador'

CREATE PROCEDURE InsertDepartment @Nombre varchar(150), @Ubicacion varchar(max), @CodeTel int
AS
	INSERT INTO TB_Departament (NomDepart, Ubicacion, CodTelf) VALUES (@Nombre, @Ubicacion, @CodeTel)
go

exec InsertDepartment 'Desarrollo', 'Ala central', 1501

CREATE PROCEDURE InsertHorario @Entrada time, @Salida time
AS
	INSERT INTO TB_Horario (HEntrada, HSAlida) VALUES (@Entrada, @Salida)
go

exec InsertHorario '06:30', '15:30'

CREATE PROCEDURE InsertEmployer @Nombre varchar(100), @Apellido varchar(100), @Direccion varchar(250),
@Nacimiento varchar(50), @Sexo varchar(50), @DNI bigint, @Departamento int, @Categoria int, 
@Turno int, @Telf int
AS
	INSERT INTO TB_Empleados (CodDepar, NomEmp, ApelEmp, Direccion, FacNac, SexEmp, DNIEmp, CodCateg, Turno, CodTelf)
	VALUES (@Departamento, @Nombre, @Apellido, @Direccion, @Nacimiento, @Sexo, @DNI, @Categoria, @Turno, @Telf)


exec InsertEmployer 'Emilio', 'Hernández', 'Zona 9 de Mixco', '07/05/2001', 'Masculino', 3657570390101, 1, 1, 1, 1521
exec InsertEmployer 'Dylan', 'Batzin', 'Patzún, Guatemala', '02/01/2000', 'Masculino', 3213450890102, 1, 1, 1, 1521

CREATE PROCEDURE InsertPaciente @Nombre varchar(100), @Apellido varchar(100), @Direccion varchar(250),
@Nacimiento date, @Sexo varchar(50), @Empleado int, @FechaRegistro date, @EstadoCivil varchar(80), @Telefono int
AS
	INSERT INTO TB_Paciente (NomCli, ApelCli, DirecPac, FecNac, SexoCli, CodEmp, FecReg, EstCivil, CodTelf)
	VALUES (@Nombre, @Apellido, @Direccion, @Nacimiento, @Sexo, @Empleado, @FechaRegistro, @EstadoCivil, @Telefono)


exec InsertPaciente 'María Fernanda', 'Sánchez', 'Antigua Guatemala, Sacatepequez', '20010416', 'Masculino', 2, '20190215', 'Soltera', 35132112 


CREATE PROCEDURE InsertHabitacion @Departamento int, @Bloque varchar(80), @Descripcion varchar(150), @Tel int
AS
	INSERT INTO TB_Habitaciones (CodDepar, Bloque, Descripcion, CodTelf)
	VALUES (@Departamento, @Bloque, @Descripcion, @Tel)


exec InsertHabitacion 1, '5', 'ALA SUR', 1057

CREATE PROCEDURE InsertCita @Paciente int, @Habitacion int, @Empleado int, @FechaHora datetime,
@FecEspSalida date, @FecSalida date
AS
	INSERT INTO TB_Cita (CodPac, CodHab, CodEmp, FecHorCita, FecEspSAlida, FecSalida)
	VALUES (@Paciente, @Habitacion, @Empleado, @FechaHora, @FecEspSalida, @FecSalida)


	exec InsertCita 3,1,3, '2019-01-10T00:00:00', '2019-01-10', '2019-01-31'

	SELECT * FROM TB_Empleados
