
create database Hospital
go
use Hospital
go
create table TB_Almacen_Nivel(
CodNivel int primary key not null IDENTITY(1,1),
Nivel varchar (100)not null
)
go
Create table TB_TipoProducto(
CodTipo int primary key not null IDENTITY(1,1),
Tipo varchar (100)not null
)
go
Create table TB_Proveedores(
CodProve int primary key not null IDENTITY(1,1),
Nombre varchar (100)not null,
Descripcion varchar (150)not null,
CodTelf int not null
)
go
Create table TB_Departament(
CodDepar int primary key not null IDENTITY(1,1),
NomDepart varchar (150)not null,
Ubicacion varchar(max) not null,
CodTelf int not null
)
go
create table TB_Categoria(
CodCateg int primary key not null IDENTITY(1,1),
Categoria varchar(150) not null
)
go
Create table TB_Horario(
Turno int primary key not null IDENTITY(1,1),
HEntrada time not null,
HSAlida time not null
)
go
create table TB_Pariente(
CodPAr int primary key not null IDENTITY(1,1),
NomPar varchar(100) not null,
ApellPar varchar (100) not null,
DirecPAr varchar(200) not null,
CodTelf int not null
)
go
create table TB_Producto(
CodProd int primary key not null IDENTITY(1,1),
Nombre varchar (100) not null,
Descripcion varchar (150) not null,
CodTipo int not null,
CodProve int not null,
CONSTRAINT	FK_CodTipo
FOREIGN KEY (CodTipo) REFERENCES TB_TipoProducto(CodTipo)
ON UPDATE CASCADE 
ON DELETE CASCADE,
CONSTRAINT FK_CodProve
FOREIGN KEY (CodProve) REFERENCES TB_Proveedores(CodProve)
ON UPDATE CASCADE
ON DELETE CASCADE
)
go
Create table TB_Producto_Almacen(
CodProd int not null,
CodNivel int not null,
Cantidad int not null,
CostoUnitario money not null

CONSTRAINT FK_CodProd 
FOREIGN KEY (CodProd) REFERENCES TB_Producto(CodProd)
ON UPDATE CASCADE
ON DELETE CASCADE,
CONSTRAINT FK_CodNivel
FOREIGN KEY (CodNivel) REFERENCES TB_Almacen_Nivel(CodNivel)
ON UPDATE CASCADE 
ON DELETE CASCADE
)
go
create table TB_Departamento(
CodDepar int not null,
CodProd int not null,
Cantidad int not null

CONSTRAINT FK_CodDepar
FOREIGN KEY (CodDepar) REFERENCES TB_Departament(CodDepar)
ON UPDATE CASCADE
ON DELETE CASCADE,
CONSTRAINT FK_Prod1
FOREIGN KEY (CodProd) REFERENCES TB_Producto(CodProd)
ON UPDATE CASCADE
ON DELETE CASCADE
)
go
create table TB_Medicamen(
CodMedica int primary key not null IDENTITY(1,1),
CodProd int not null,
Especialidad varchar (100)not null,
Dosis varchar(250) not null,
ModAdminis varchar(250) not null,

CONSTRAINT FK_Prod2
FOREIGN KEY (CodProd) REFERENCES TB_Producto(CodProd)
ON UPDATE CASCADE
ON DELETE CASCADE
)
go
create table TB_Habitaciones(
CodHab int primary key not null IDENTITY(1,1),
CodDepar int not null,
Bloque varchar(80) not null,
Descripcion varchar (150) not null,
CodTelf int not null,
CONSTRAINT FK_CodDepar1
FOREIGN KEY (CodDepar) REFERENCES TB_Departament(CodDepar)
ON UPDATE CASCADE
ON DELETE CASCADE
)

create table TB_Camas(
CodCamas int primary key not null IDENTITY(1,1),
CodHab int not null,
CONSTRAINT FK_CodHab
FOREIGN KEY (CodHab) REFERENCES TB_Habitaciones(CodHab)
ON UPDATE CASCADE
ON DELETE CASCADE 
)
go
create table TB_Empleados(
CodEmp int primary key not null IDENTITY(1,1),
CodDepar int not null,
NomEmp varchar (100) not null,
ApelEmp varchar (100)not null,
Direccion varchar(250) not null,
FacNac varchar (50) not null,
SexEmp varchar (50) not null,
DNIEmp bigint not null,
CodCateg int not null,
Turno int not null,
CodTelf int not null,
CONSTRAINT FK_CodDepar2
FOREIGN KEY (CodDepar) REFERENCES TB_Departament(CodDepar)
ON UPDATE CASCADE
ON DELETE CASCADE,
CONSTRAINT FK_CodCateg
FOREIGN KEY (CodCateg) REFERENCES TB_Categoria(CodCateg)
ON UPDATE CASCADE
ON DELETE CASCADE,
CONSTRAINT FK_Turno
FOREIGN KEY (Turno) REFERENCES TB_Horario(Turno)
ON UPDATE CASCADE
ON DELETE CASCADE
)
go
create table TB_Pedido(
CodPedido int primary key not null IDENTITY(1,1),
CodEmp int not null,
CodDepar int not null,
CodProd int not null,
Cantidad int not null,
Fecha date not null,

CONSTRAINT FK_CodEmp
FOREIGN KEY (CodEmp) REFERENCES TB_Empleados(CodEmp)
ON UPDATE CASCADE
ON DELETE CASCADE,

FOREIGN KEY (CodDepar) REFERENCES TB_Departament(CodDepar),

CONSTRAINT FK_Prod3
FOREIGN KEY (CodProd) REFERENCES TB_Producto(CodProd)
ON UPDATE CASCADE
ON DELETE CASCADE
)
go
create table TB_Paciente(
CodPac int primary key not null IDENTITY(1,1),
NomCli varchar (100) not null,
ApelCli varchar (100) not null,
DirecPac varchar(250) not null,
FecNac date not null,
SexoCli varchar (50) not null,
CodEmp int not null,
FecReg date not null,
EstCivil varchar (80) not null,
CodTelf int not null,

CONSTRAINT FK_Empleado
FOREIGN KEY (CodEmp) REFERENCES TB_Empleados(CodEmp)
ON UPDATE CASCADE
ON DELETE CASCADE
)
go
create table TB_Medicacion(
CodMed int primary key not null IDENTITY(1,1),
CodPac int not null,
CodCamas int not null,
CodProd int not null,
UnidadesDiarias int not null,
FecInic date not null,
FecFin date not null,
CONSTRAINT FK_Prod4
FOREIGN KEY (CodProd) REFERENCES TB_Producto(CodProd)
ON UPDATE CASCADE
ON DELETE CASCADE,
CONSTRAINT FK_Pac
FOREIGN KEY (CodPac) REFERENCES TB_Paciente(CodPac)
ON UPDATE CASCADE
ON DELETE CASCADE,
CONSTRAINT FK_Camas
FOREIGN KEY (CodCamas) REFERENCES TB_Camas(CodCamas)
)
go
create table TB_Contrato(
CodContra int primary key not null IDENTITY(1,1),
CodEmp int not null,
TipContra varchar (100) not null,
HorasCont time not null,
Salario money not null,
EscalaSalarial money not null,
FecInc date not null,
FecFin date not null,
CONSTRAINT FK_Empleado1
FOREIGN KEY (CodEmp) REFERENCES TB_Empleados(CodEmp)
ON UPDATE CASCADE
ON DELETE CASCADE
)
go
create table TB_MedicoExterno(
CodMed int primary key not null IDENTITY(1,1),
CodDepar int not null,
NomMed varchar(100)not null,
ApelMed varchar(100)not null,
CodTelf int not null,
CONSTRAINT FK_Depar
FOREIGN KEY (CodDepar) REFERENCES TB_Departament(CodDepar)
ON UPDATE CASCADE
ON DELETE CASCADE
)
go
create table TB_Cualificaciones(
CodCual int primary key not null IDENTITY(1,1),
CodEmp int not null,
FecCuali date not null,
CualiObt varchar(100) not null,
TipoInst varchar (100) not null,
NomInst varchar (100) not null,
CONSTRAINT FK_Empleado2
FOREIGN KEY (CodEmp) REFERENCES TB_Empleados(CodEmp)
ON UPDATE CASCADE
ON DELETE CASCADE
)
go
Create Table TB_Paciente_MedicoExterno(
CodPac int not null,
CodMed int not null,
CONSTRAINT FK_Paciente
FOREIGN KEY (CodPac) REFERENCES TB_Paciente(CodPac)
ON UPDATE CASCADE
ON DELETE CASCADE,
CONSTRAINT FK_Med
FOREIGN KEY (CodMed) REFERENCES TB_MedicoExterno(CodMed)
)
go
create table TB_Cita(
CodCita int primary key not null IDENTITY(1,1),
CodPac int not null,
CodHab int not null,
CodEmp int not null,
FecHorCita datetime not null,
FecEspSAlida date not null,
FecSalida date not null,
CONSTRAINT FK_Pac2
FOREIGN KEY (CodPac) REFERENCES TB_Paciente(CodPac)
ON UPDATE CASCADE
ON DELETE CASCADE,
CONSTRAINT FK_Hab
FOREIGN KEY (CodHab) REFERENCES TB_Habitaciones(CodHab),
CONSTRAINT FK_Empleado3
FOREIGN KEY (CodEmp) REFERENCES TB_Empleados(CodEmp)
)
go
create table TB_PAciente_Pariente(
CodPac int not null,
CodPar int not null,
Relacion varchar (80) not null,
CONSTRAINT FK_Pac3
FOREIGN KEY (CodPac) REFERENCES TB_Paciente(CodPac)
ON UPDATE CASCADE
ON DELETE CASCADE,
CONSTRAINT FK_Par
FOREIGN KEY (CodPar) REFERENCES TB_Pariente(CodPar)
ON UPDATE CASCADE
ON DELETE CASCADE
)
go
create table TB_Experiencia (
CodExpe int primary key not null IDENTITY(1,1),
Posicion varchar(100) not null,
FecInc date not null,
FecFin date not null,
NomInst varchar(150)not null,
CodEmp int not null,
CONSTRAINT FK_Empleado4
FOREIGN KEY (CodEmp) REFERENCES TB_Empleados(CodEmp)
ON UPDATE CASCADE
ON DELETE CASCADE
)
go
PRINT 'Tablas creadas.'	