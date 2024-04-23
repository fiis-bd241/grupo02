# Creación de tablas
## Código de creación
### Entidad: Cargo
``CREATE TABLE Cargo(
    ID_Cargo INTEGER primary key,
    Nombre VARCHAR(64),
    Descripcion VARCHAR(264)
);``

### Entidad: Departamento
``CREATE TABLE Departamento(
ID_Departamento INTEGER primary key,
Nombre_Departamento VARCHAR(64)
);``

### Entidad: Empleado
``CREATE TABLE Empleado(
ID_Empleado INTEGER primary key,
Nombre_Empleado VARCHAR(32),
Apellido_Empleado VARCHAR(32),
Telefono INTEGER,
Direccion VARCHAR(64),
Correo VARCHAR(32),
Fecha_Nacimiento DATE,
Cant_Hijos INTEGER,
Estado_Civil VARCHAR(16),
ID_Departamento INTEGER,
ID_Cargo INTEGER,
FOREIGN KEY (ID_Departamento) REFERENCES Departamento(ID_Departamento),
FOREIGN KEY (ID_Cargo) REFERENCES Cargo(ID_Cargo)
);``

## Llenado de datos


