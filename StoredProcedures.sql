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
exec InsertPaciente 'Carlos', 'Perez', 'Suchitepequez', '19940401', 'Masculino', 3, '20190101', 'Soltero', 44312310 
exec InsertPaciente 'Juan', 'Perez', 'Guastatoya, El Progreso', '20000505', 'Masculino', 3, '20220101', 'Soltero', 55641021 


CREATE PROCEDURE InsertHabitacion @Departamento int, @Bloque varchar(80), @Descripcion varchar(150), @Tel int
AS
	INSERT INTO TB_Habitaciones (CodDepar, Bloque, Descripcion, CodTelf)
	VALUES (@Departamento, @Bloque, @Descripcion, @Tel)


exec InsertHabitacion 1, '5', 'ALA SUR', 1057
exec InsertHabitacion 1, '5', 'ALA NORTE', 1058

CREATE PROCEDURE InsertCita @Paciente int, @Habitacion int, @Empleado int, @FechaHora datetime,
@FecEspSalida date, @FecSalida date
AS
	INSERT INTO TB_Cita (CodPac, CodHab, CodEmp, FecHorCita, FecEspSAlida, FecSalida)
	VALUES (@Paciente, @Habitacion, @Empleado, @FechaHora, @FecEspSalida, @FecSalida)


	exec InsertCita 3,1,3, '2019-01-10T00:00:00', '2019-01-10', '2019-01-31'
	exec InsertCita 4,1,2, '2019-12-25T00:00:00', '2019-12-25', '2019-12-31'
	exec InsertCita 5,1,2, '2021-12-25T00:00:00', '2021-12-25', '2021-12-31'

CREATE PROCEDURE InsertCama @Habitacion int
AS
	INSERT INTO TB_Camas (CodHab) VALUES (@Habitacion)

	exec InsertCama '1'

CREATE PROCEDURE InsertTipoProducto @Tipo varchar(100)
AS
	INSERT INTO TB_TipoProducto (Tipo) VALUES (@Tipo)

	exec InsertTipoProducto 'Anestesias'
	exec InsertTipoProducto 'Sueros'
	exec InsertTipoProducto 'Pastillas'

CREATE PROCEDURE InsertProveedor @Nombre varchar(100), @Descripcion varchar(150), @Telefono int
AS
	INSERT INTO TB_Proveedores (Nombre, Descripcion, CodTelf)
	VALUES (@Nombre, @Descripcion, @Telefono)

	exec InsertProveedor 'Pfizer', 'Casa Pfizer', 24001010
	exec InsertProveedor 'Bayer', 'Casa Bayer', 23302101

CREATE PROCEDURE InsertProducto @Nombre varchar(100), @Descripcion varchar(150), @Tipo int, @Proveedor int
AS
	INSERT INTO TB_Producto (Nombre, Descripcion, CodTipo, CodProve)
	VALUES (@Nombre, @Descripcion, @Tipo, @Proveedor)

	exec InsertProducto 'Aspirinas', 'Aspirinas Bayer', 3, 2

CREATE PROCEDURE InsertNivel @Nivel varchar(100)
AS
	INSERT INTO TB_Almacen_Nivel (Nivel) VALUES (@Nivel)

	exec InsertNivel '2'

CREATE PROCEDURE InsertProductoAlmacen @Producto int, @Nivel int, @Cantidad int, @CostoUnitario money
AS
	INSERT INTO TB_Producto_Almacen (CodProd, CodNivel, Cantidad, CostoUnitario)
	VALUES (@Producto, @Nivel, @Cantidad, @CostoUnitario)

	exec InsertProductoAlmacen 1, 1, 250, '25.50'

CREATE PROCEDURE InsertMedicacion @Paciente int, @Camas int, @Producto int, @UnidadesDiarias int,
@FechaInicio date, @FechaFin date
AS
	INSERT INTO TB_Medicacion (CodPac, CodCamas, CodProd, UnidadesDiarias, FecInic, FecFin)
	VALUES (@Paciente, @Camas, @Producto, @UnidadesDiarias, @FechaInicio, @FechaFin)

	exec InsertMedicacion 5, 1, 1, 3, '2022-10-12', '2022-10-01'

	select * from TB_Medicacion