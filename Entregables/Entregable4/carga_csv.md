    DROP TABLE IF EXISTS Entrevista;
    DROP TABLE IF EXISTS Solicitud_Empleo;
    DROP TABLE IF EXISTS Vacante;
    DROP TABLE IF EXISTS Perfil;
    DROP TABLE IF EXISTS Candidato;
    DROP TABLE IF EXISTS Curriculum;
    DROP TABLE IF EXISTS Experiencia_Laboral;
    DROP TABLE IF EXISTS Certificados;
    DROP TABLE IF EXISTS Evaluacion;
    DROP TABLE IF EXISTS Reunion;
    DROP TABLE IF EXISTS Retroalimentacion;
    DROP TABLE IF EXISTS Reporte;
    DROP TABLE IF EXISTS Respuesta_Cuestionario;
    DROP TABLE IF EXISTS Cuestionario_Empleado;
    DROP TABLE IF EXISTS Pregunta_Cuestionario;
    DROP TABLE IF EXISTS Cuestionario;
    DROP TABLE IF EXISTS Tipo_Respuesta;
    DROP TABLE IF EXISTS Tipo_Cuestionario;
    DROP TABLE IF EXISTS Tipo_Estado;
    DROP TABLE IF EXISTS Asistencia;
    DROP TABLE IF EXISTS Licencia;
    DROP TABLE IF EXISTS Permiso;
    DROP TABLE IF EXISTS Evaluacion_Empleado;
    DROP TABLE IF EXISTS Evaluacion_Sesion;
    DROP TABLE IF EXISTS Evaluacion_Capacitacion;
    DROP TABLE IF EXISTS Empleado_Sesion;
    DROP TABLE IF EXISTS Sesion;
    DROP TABLE IF EXISTS Lista_Matricula;
    DROP TABLE IF EXISTS Programa_Capacitador;
    DROP TABLE IF EXISTS Beneficios_Cese;
    DROP TABLE IF EXISTS Tipo_Cese;
    DROP TABLE IF EXISTS Respuesta_Salida;
    DROP TABLE IF EXISTS Pregunta_Salida;
    DROP TABLE IF EXISTS Cuestionario_Salida;
    DROP TABLE IF EXISTS Cese;
    DROP TABLE IF EXISTS Supervisor;
    DROP TABLE IF EXISTS Nomina;
    DROP TABLE IF EXISTS Pago_Total;
    DROP TABLE IF EXISTS Sueldo;
    DROP TABLE IF EXISTS Modificacion;
    DROP TABLE IF EXISTS Cuenta_Bancaria;
    DROP TABLE IF EXISTS Empleado;
    DROP TABLE IF EXISTS Departamento;
    DROP TABLE IF EXISTS Cargo;

    
    
    CREATE TABLE Cargo (
    	ID_Cargo INTEGER PRIMARY KEY,
    	Nombre VARCHAR(64) UNIQUE NOT NULL, 
    	Descripcion VARCHAR(264) NOT NULL
    );
    
    CREATE TABLE Departamento (
    	ID_Departamento INTEGER PRIMARY KEY,
    	Nombre_Departamento VARCHAR(64) UNIQUE NOT NULL
    );
    
    CREATE TABLE Empleado ( 
    	ID_Empleado INTEGER PRIMARY KEY, 
    	Nombre_Empleado VARCHAR(32) NOT NULL, 
    	Apellido_Empleado VARCHAR(32) NOT NULL, 
    	Telefono VARCHAR(15) NOT NULL, 
    	Direccion VARCHAR(64) NOT NULL, 
    	Correo VARCHAR(32) UNIQUE NOT NULL, 
    	Fecha_Nacimiento DATE NOT NULL, 
    	Cant_Hijos INTEGER DEFAULT 0 NOT NULL, 
    	Estado_Civil VARCHAR(16) NOT NULL, 
    	DNI CHAR(8) NOT NULL, 
    	Fecha_Ingreso DATE NOT NULL, 
    	ID_Departamento INTEGER NOT NULL, 
    	ID_Cargo INTEGER NOT NULL,
    	FOREIGN KEY (ID_Departamento) REFERENCES Departamento(ID_Departamento), 
    	FOREIGN KEY (ID_Cargo) REFERENCES Cargo(ID_Cargo)
    );
    
    CREATE TABLE Cuenta_Bancaria(
    	id_cuenta_b INTEGER PRIMARY KEY,
    	numero_cuenta VARCHAR(32) NOT NULL,
    	nombre_banco VARCHAR(32) NOT NULL,
    	tipo_cuenta VARCHAR(32) NOT NULL,
    	moneda VARCHAR(10) NOT NULL,
    	id_empleado INTEGER NOT NULL,
    	FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
    );
    
    CREATE TABLE Modificacion(
    	id_modificacion INTEGER PRIMARY KEY,
    	monto_modificacion DECIMAL(10, 2) NOT NULL,
    	tipo_modificacion VARCHAR(32) NOT NULL
    );
    
    CREATE TABLE Sueldo(
    	id_sueldo INTEGER PRIMARY KEY,
    	monto_salario_bruto DECIMAL(10, 2) NOT NULL
    );
    
    CREATE TABLE Pago_Total(
    	id_pago_total INTEGER PRIMARY KEY,
    	monto_pagar DECIMAL(10, 2) NOT NULL,
    	id_sueldo INTEGER NOT NULL,
    	id_modificacion INTEGER NOT NULL,
    	FOREIGN KEY (id_sueldo) REFERENCES Sueldo(id_sueldo),
    	FOREIGN KEY (id_modificacion) REFERENCES Modificacion(id_modificacion)
    );
    
    CREATE TABLE Nomina(
    	id_nomina INTEGER PRIMARY KEY,
    	fecha_emision DATE NOT NULL,
    	periodo_pago VARCHAR(10) NOT NULL,
    	id_empleado INTEGER NOT NULL,
    	id_pago_total INTEGER NOT NULL,
    	FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado),
    	FOREIGN KEY (id_pago_total) REFERENCES Pago_Total(id_pago_total)
    );
    
    CREATE TABLE Supervisor(
    	id_supervisor INTEGER PRIMARY KEY,
    	id_empleado INTEGER NOT NULL,
    	FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
    );
    
    CREATE TABLE Cese(
    	id_cese INTEGER PRIMARY KEY,
    	estado_cese VARCHAR(32) NOT NULL,
    	fecha_inicio_cese DATE NOT NULL,
    	id_empleado INTEGER NOT NULL,
    	FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
    );
    
    CREATE TABLE Cuestionario_Salida(
    	id_cuestionario INTEGER PRIMARY KEY,
    	id_supervisor INTEGER NOT NULL,
    	id_cese INTEGER NOT NULL,
    	fecha_cuestionario DATE NOT NULL,
    	FOREIGN KEY (id_supervisor) REFERENCES Supervisor(id_supervisor),
    	FOREIGN KEY (id_cese) REFERENCES Cese(id_cese)
    );
    
    CREATE TABLE Pregunta_Salida(
    	id_pregunta INTEGER PRIMARY KEY,
    	pregunta_salida VARCHAR(256) NOT NULL,
    	respuesta_salida VARCHAR(256) NOT NULL,
    	id_cuestionario INTEGER NOT NULL,
    	FOREIGN KEY (id_cuestionario) REFERENCES Cuestionario_Salida(id_cuestionario)
    );
    
    CREATE TABLE Beneficios_Cese(
    	id_beneficios INTEGER PRIMARY KEY,
    	tipo VARCHAR(32) NOT NULL,
    	monto DECIMAL(10, 2) NOT NULL,
    	id_cese INTEGER NOT NULL,
    	FOREIGN KEY (id_cese) REFERENCES Cese(id_cese)
    );
    
    CREATE TABLE Programa_Capacitador(
    	id_programa_c INTEGER PRIMARY KEY,
    	fecha_inicio DATE NOT NULL,
    	fecha_fin DATE NOT NULL,
    	motivo VARCHAR(256) NOT NULL,
    	id_departamento INTEGER NOT NULL,
    	FOREIGN KEY(id_departamento) REFERENCES Departamento(id_departamento)
    );
    
    CREATE TABLE Lista_Matricula(
    	id_programa_c INTEGER NOT NULL,
    	id_empleado INTEGER NOT NULL,
    	estado_matricula VARCHAR(256) NOT NULL,
    	FOREIGN KEY(id_programa_c) REFERENCES Programa_Capacitador(id_programa_c),
    	FOREIGN KEY(id_empleado) REFERENCES Empleado(id_empleado)
    );
    
    CREATE TABLE Sesion(
    	id_sesion INTEGER PRIMARY KEY,
    	estado VARCHAR(64) NOT NULL,
    	fecha DATE NOT NULL,
    	hora TIME NOT NULL,
    	id_programa_c INTEGER NOT NULL,
    	FOREIGN KEY(id_programa_c) REFERENCES Programa_Capacitador(id_programa_c)
    );
    
    CREATE TABLE Empleado_Sesion(
    	id_sesion INTEGER NOT NULL,
    	id_empleado INTEGER NOT NULL,
    	asistencia VARCHAR(64) NOT NULL,
    	FOREIGN KEY(id_sesion) REFERENCES Sesion(id_sesion),
    	FOREIGN KEY(id_empleado) REFERENCES Empleado(id_empleado)
    );
    
    CREATE TABLE Evaluacion_Capacitacion(
    	id_evaluacion INTEGER PRIMARY KEY,
    	duracion_evaluacion INTEGER NOT NULL,
    	hora TIME NOT NULL,
    	id_instructor INTEGER NOT NULL,
    	FOREIGN KEY(id_instructor) REFERENCES Empleado(id_empleado)
    );
    
    CREATE TABLE Evaluacion_Sesion(
    	ID_Evaluacion INTEGER NOT NULL,
    	ID_Sesion INTEGER NOT NULL,
    	Resultado VARCHAR(64) NOT NULL,
    	FOREIGN KEY(ID_Sesion) REFERENCES Sesion(ID_Sesion),
    	FOREIGN KEY(ID_Evaluacion) REFERENCES Evaluacion_Capacitacion(ID_Evaluacion)
    );
    
    CREATE TABLE Evaluacion_Empleado(
    	ID_Evaluacion INTEGER NOT NULL,
    	ID_Empleado INTEGER NOT NULL,
    	Resultado VARCHAR(64) NOT NULL,
    	FOREIGN KEY(ID_Empleado) REFERENCES Empleado(ID_Empleado),
    	FOREIGN KEY(ID_Evaluacion) REFERENCES Evaluacion_Capacitacion(ID_Evaluacion)
    );
    
    CREATE TABLE Permiso(
    	ID_Permiso INTEGER PRIMARY KEY,
    	ID_Empleado INTEGER NOT NULL,
    	ID_Supervisor INTEGER NOT NULL,
    	Tipo VARCHAR(64) NOT NULL,
    	Motivo VARCHAR(128) NOT NULL,
    	Duracion VARCHAR(64) NOT NULL,
    	Estado VARCHAR(64) NOT NULL,
    	FOREIGN KEY(ID_Empleado) REFERENCES Empleado(ID_Empleado),
    	FOREIGN KEY(ID_Supervisor) REFERENCES Supervisor(ID_Supervisor)
    );
    
    CREATE TABLE Licencia(
    	ID_Licencia INTEGER PRIMARY KEY,
    	ID_Empleado INTEGER NOT NULL,
    	ID_Supervisor INTEGER NOT NULL,
    	Tipo VARCHAR(64) NOT NULL,
    	Fecha_Inicio DATE NOT NULL,
    	Fecha_Fin DATE NOT NULL,
    	Estado VARCHAR(64) NOT NULL,
    	FOREIGN KEY(ID_Empleado) REFERENCES Empleado(ID_Empleado),
    	FOREIGN KEY(ID_Supervisor) REFERENCES Supervisor(ID_Supervisor)
    );
    
    CREATE TABLE Asistencia(
    	ID_Asistencia INTEGER PRIMARY KEY,
    	ID_Empleado INTEGER NOT NULL,
    	Estado VARCHAR(64) NOT NULL,
    	Observacion VARCHAR(128) NOT NULL,
    	Fecha DATE NOT NULL,
    	Hora_Entrada TIME NOT NULL,
    	Hora_Salida TIME NOT NULL,
    	FOREIGN KEY(ID_Empleado) REFERENCES Empleado(ID_Empleado)
    );
    
	CREATE TABLE Tipo_Estado(
		ID_Tipo_Estado INTEGER NOT NULL primary key,
		Tipo Varchar(12) NOT NULL		
	);
	
	CREATE TABLE Tipo_Cuestionario(
		ID_Tipo_Cuestionario INTEGER NOT NULL primary key,
		Tipo Varchar(12) NOT NULL		
	);
	
	CREATE TABLE Tipo_Respuesta(
		ID_Tipo_Respuesta INTEGER NOT NULL primary key,
		Tipo Varchar(12) NOT NULL		
	);
		
	CREATE TABLE Cuestionario(
		ID_Cuestionario INTEGER primary key,
		ID_Especialista_Relaciones_Laborales INTEGER NOT NULL,
		ID_Tipo_Cuestionario INTEGER NOT NULL UNIQUE,
		Fecha_Creacion DATE NOT NULL,
		Hora_Creacion TIME NOT NULL,
		ID_Estado_Envio INTEGER NOT NULL,
		Fecha_Envio_Gerencia DATE,
		Hora_Envio_Gerencia TIME,
		ID_Gerente INTEGER NOT NULL,
		ID_Estado_Aprobacion INT NOT NULL,
		Fecha_Revision DATE,
		Hora_Revision TIME,
		FOREIGN KEY(ID_Tipo_Cuestionario) REFERENCES Tipo_Cuestionario(ID_Tipo_Cuestionario),
		FOREIGN KEY(ID_Especialista_Relaciones_Laborales) REFERENCES Empleado(ID_Empleado),
		FOREIGN KEY(ID_Estado_Envio) REFERENCES Tipo_Estado(ID_Tipo_Estado),
		FOREIGN KEY(ID_Gerente) REFERENCES Empleado(ID_Empleado),
		FOREIGN KEY(ID_Estado_Aprobacion) REFERENCES Tipo_Estado(ID_Tipo_Estado)
	);
	
	CREATE TABLE Pregunta_Cuestionario(
		ID_Pregunta INTEGER primary key,
		ID_Cuestionario INTEGER NOT NULL,
		Enunciado_Pregunta VARCHAR(256) NOT NULL UNIQUE,
		FOREIGN KEY(ID_Cuestionario) REFERENCES Cuestionario(ID_Cuestionario)
	);
	
	CREATE TABLE Cuestionario_Empleado(
		ID_Cuestionario_Empleado INTEGER primary key,
		ID_Empleado INTEGER NOT NULL UNIQUE,
		ID_Cuestionario INTEGER NOT NULL,
		Fecha_Rellenado DATE NOT NULL,
		Hora_Rellenado TIME NOT NULL,
		FOREIGN KEY(ID_Empleado) REFERENCES Empleado(ID_Empleado),
		FOREIGN KEY(ID_Cuestionario) REFERENCES Cuestionario(ID_Cuestionario)
	);
	
	CREATE TABLE Respuesta_Cuestionario(
		ID_Respuesta Integer primary key,
		ID_Pregunta INTEGER NOT NULL,
		ID_Cuestionario_Empleado INTEGER NOT NULL,
		Id_Tipo_Respuesta INTEGER NOT NULL,
		FOREIGN KEY(ID_Pregunta) REFERENCES Pregunta_Cuestionario(ID_Pregunta),
		FOREIGN KEY(ID_Cuestionario_Empleado) REFERENCES Cuestionario_Empleado(ID_Cuestionario_Empleado),
		FOREIGN KEY(ID_Tipo_Respuesta) REFERENCES Tipo_Respuesta(ID_Tipo_Respuesta)
	);
	
	CREATE TABLE Reporte(
		ID_Reporte INTEGER primary key,
		ID_Cuestionario_Empleado INTEGER NOT NULL UNIQUE,
		Fecha_Ingreso_Empleado DATE NOT NULL,
		Calificacion_Empleado INTEGER NOT NULL,
		FOREIGN KEY (ID_Cuestionario_Empleado) REFERENCES Cuestionario_Empleado(ID_Cuestionario_Empleado),
		FOREIGN KEY(Calificacion_Empleado) REFERENCES Tipo_Respuesta(ID_Tipo_Respuesta)
	);
	
	CREATE TABLE Retroalimentacion(
		ID_Retroalimentacion INTEGER primary key,
		ID_Reporte INTEGER NOT NULL,
		Enunciado_Retroalimentacion VARCHAR(256) NOT NULL,
		ID_Evaluador INTEGER NOT NULL,
		Fecha_Retroalimentacion DATE NOT NULL,
		Hora_Retroalimentacion TIME NOT NULL,
		FOREIGN KEY(ID_Reporte) REFERENCES Reporte(ID_Reporte),
		FOREIGN KEY(ID_Evaluador) REFERENCES Empleado(Id_Empleado)
	);
	
	CREATE TABLE Reunion(
		ID_Reunion INTEGER primary key,
		ID_Organizador INTEGER NOT NULL,
		Asunto_Reunion VARCHAR(256) NOT NULL,
		Fecha_Reunion DATE NOT NULL,
		Hora_Reunion TIME NOT NULL,
		FOREIGN KEY (ID_Organizador) REFERENCES Empleado(ID_Empleado) 		
	);
    
    CREATE TABLE Evaluacion (
    	ID_Evaluacion INTEGER PRIMARY KEY,
    	Competencias_Evaluadas VARCHAR(255) NOT NULL,
    	Result_Evaluacion VARCHAR(255) NOT NULL,
    	Duracion_Evaluacion INTEGER NOT NULL,
    	Estado_evaluacion VARCHAR(64) NOT NULL
    );
    
    
    CREATE TABLE Certificados (
    	ID_Certificado INTEGER PRIMARY KEY,
    	Curso_Certificado VARCHAR(255) NOT NULL,
    	Nivel_Certificado VARCHAR(255) NOT NULL
    );
    
    CREATE TABLE Experiencia_Laboral (
    	ID_Experiencia INTEGER PRIMARY KEY,
    	Nombre_Lugar VARCHAR(255) NOT NULL,
    	Cargo_Ejercido VARCHAR(255) NOT NULL,
    	Tiempo_Ejercido VARCHAR(255) NOT NULL
    );
    
    CREATE TABLE Curriculum (
    	ID_Curriculum INTEGER PRIMARY KEY,
    	Grado_Educacion VARCHAR(255) NOT NULL,
    	ID_Experiencia INTEGER NOT NULL,
    	ID_Certificado INTEGER NOT NULL,
    	FOREIGN KEY (ID_Experiencia) REFERENCES Experiencia_Laboral(ID_Experiencia),
    	FOREIGN KEY (ID_Certificado) REFERENCES Certificados(ID_Certificado)
    );
    
    CREATE TABLE Candidato (
    	ID_Cand INTEGER PRIMARY KEY,
    	Nombre_Cand VARCHAR(255) NOT NULL,
    	Apell_Cand VARCHAR(255) NOT NULL,
    	Fecha_Nac_Cand DATE NOT NULL,
    	Direccion_Cand VARCHAR(255) NOT NULL,
    	Correo_Cand VARCHAR(255) NOT NULL UNIQUE,
    	Num_Telefono VARCHAR(20) NOT NULL,
    	Id_Curriculum INTEGER NOT NULL,
    	FOREIGN KEY (Id_Curriculum ) REFERENCES Curriculum (Id_Curriculum )
    );
    
    
    CREATE TABLE Perfil (
    	ID_Perfil INTEGER PRIMARY KEY,
    	Conocimiento_Req VARCHAR(255) NOT NULL,
    	Años_Exp INTEGER NOT NULL,
    	Titulo_Requerido VARCHAR(255) NOT NULL
    );
    
    CREATE TABLE Vacante (
    	ID_Vac VARCHAR(8) PRIMARY KEY,
    	ID_Departamento INTEGER NOT NULL,
    	ID_Cargo INTEGER NOT NULL,
    	ID_Perfil INTEGER NOT NULL,
    	Ubicacion VARCHAR(255) NOT NULL,
    	Beneficio VARCHAR(255) NOT NULL,
    	Salario DECIMAL(8, 2) NOT NULL,
    	Horario VARCHAR(255) NOT NULL,
    	FOREIGN KEY (ID_Departamento) REFERENCES Departamento(ID_Departamento),
    	FOREIGN KEY (ID_Cargo) REFERENCES Cargo(ID_Cargo),
    	FOREIGN KEY (ID_Perfil) REFERENCES Perfil(ID_Perfil)
    );
    
    CREATE TABLE Solicitud_Empleo (
    	ID_Solicitud VARCHAR(8) PRIMARY KEY,
    	ID_Vacante VARCHAR(8) NOT NULL,
    	Est_Solicitud VARCHAR(50) NOT NULL,
    	Horario_Disponible VARCHAR(255) NOT NULL,
    	Fecha_Aplicacion DATE NOT NULL,
    	ID_Cand INTEGER NOT NULL,
    	ID_Curriculum INTEGER,
    	FOREIGN KEY (ID_Vacante) REFERENCES Vacante(ID_Vac),
    	FOREIGN KEY (ID_Cand) REFERENCES Candidato(ID_Cand),
    	FOREIGN KEY (ID_Curriculum) REFERENCES Curriculum(ID_Curriculum)
    );
    
    CREATE TABLE Entrevista (
    	ID_Entrevista INTEGER PRIMARY KEY,
    	Fecha_Eva DATE NOT NULL,
    	Hora_Entrevista TIME NOT NULL,
    	Resp_Eva VARCHAR(255),
    	Resultado_Eva VARCHAR(50),
    	ID_Solicitud VARCHAR(8) NOT NULL,
    	ID_Evaluacion INTEGER NOT NULL,
    	ID_Empleado INTEGER NOT NULL,
    	FOREIGN KEY (ID_Solicitud) REFERENCES Solicitud_Empleo(ID_Solicitud),
    	FOREIGN KEY (ID_Evaluacion) REFERENCES Evaluacion(ID_Evaluacion),
    	FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado)
    );
    
    COPY Cargo FROM 'D:\CSV_Inserts\Cargo.csv' DELIMITER ',' CSV HEADER;
    COPY Departamento FROM 'D:\CSV_Inserts\Departamento.csv' DELIMITER ',' CSV HEADER;
    COPY Empleado FROM 'D:\CSV_Inserts\Empleados.csv' DELIMITER ',' CSV HEADER;
    COPY Programa_Capacitador FROM 'D:\CSV_Inserts\Programa_Capacitador.csv' DELIMITER ',' CSV HEADER;
    COPY Sesion FROM 'D:\CSV_Inserts\Sesion.csv' DELIMITER ',' CSV HEADER;
    COPY Lista_Matricula FROM 'D:\CSV_Inserts\Lista_Matricula.csv' DELIMITER ',' CSV HEADER;
    COPY Evaluacion_Capacitacion FROM 'D:\CSV_Inserts\Evaluacion_Capacitacion.csv' DELIMITER ',' CSV HEADER;
    COPY Empleado_Sesion FROM 'D:\CSV_Inserts\Empleado_Sesion.csv' DELIMITER ',' CSV HEADER;
    COPY Evaluacion_Sesion FROM 'D:\CSV_Inserts\Evaluacion_Sesion.csv' DELIMITER ',' CSV HEADER;
    COPY Evaluacion_Empleado FROM 'D:\CSV_Inserts\Evaluacion_Empleado.csv' DELIMITER ',' CSV HEADER;
    COPY Cuenta_Bancaria FROM 'D:\CSV_Inserts\Cuenta_Bancaria.csv' DELIMITER ',' CSV HEADER;
    COPY Sueldo FROM 'D:\CSV_Inserts\Sueldo.csv' DELIMITER ',' CSV HEADER;
    COPY Modificacion FROM 'D:\CSV_Inserts\Modificacion.csv' DELIMITER ',' CSV HEADER;
    COPY Pago_Total FROM 'D:\CSV_Inserts\Pago_Total.csv' DELIMITER ',' CSV HEADER;
    COPY Nomina FROM 'D:\CSV_Inserts\Nomina.csv' DELIMITER ',' CSV HEADER;
    COPY Supervisor FROM 'D:\CSV_Inserts\Supervisor.csv' DELIMITER ',' CSV HEADER;
    COPY Tipo_Cuestionario to 'D:\CSV_Inserts\Cuestionario.csv' DELIMITER ',' CSV HEADER;
    COPY Tipo_Respuesta to 'D:\CSV_Inserts\Tipo_Respuesta.csv' DELIMITER ',' CSV HEADER;
    COPY Cuestionario to 'D:\CSV_Inserts\Cuestionario.csv' DELIMITER ',' CSV HEADER;
    COPY Pregunta_Cuestionario to 'D:\CSV_Inserts\Pregunta_Cuestionario.csv' DELIMITER ',' CSV HEADER;
    COPY Cuestionario_Empleado to 'D:\CSV_Inserts\Cuestionario_Empleado.csv' DELIMITER ',' CSV HEADER;
    COPY Respuesta_Cuestionario to 'D:\CSV_Inserts\Respuesta_Cuestionario.csv' DELIMITER ',' CSV HEADER;
    COPY Reporte to 'D:\CSV_Inserts\Reporte.csv' DELIMITER ',' CSV HEADER;
    COPY Retroalimentacion to 'D:\CSV_Inserts\Retroalimentacion.csv' DELIMITER ',' CSV HEADER;
    COPY Reunion to 'D:\CSV_Inserts\Reunion.csv' DELIMITER ',' CSV HEADER;
    
    /*
    COPY Empleado to 'D:\CSV_Inserts\Empleados.csv' DELIMITER ',' CSV HEADER;
    COPY Cargo to 'D:\CSV_Inserts\Cargo.csv' DELIMITER ',' CSV HEADER;
    COPY Departamento to 'D:\CSV_Inserts\Departamento.csv' DELIMITER ',' CSV HEADER;
    COPY Programa_Capacitador to 'D:\CSV_Inserts\Programa_Capacitador.csv' DELIMITER ',' CSV HEADER;
    COPY Sesion to 'D:\CSV_Inserts\Sesion.csv' DELIMITER ',' CSV HEADER;
    COPY Lista_Matricula to 'D:\CSV_Inserts\Lista_Matricula.csv' DELIMITER ',' CSV HEADER;
    COPY Empleado_Sesion to 'D:\CSV_Inserts\Empleado_Sesion.csv' DELIMITER ',' CSV HEADER;
    COPY Evaluacion_Sesion to 'D:\CSV_Inserts\Evaluacion_Sesion.csv' DELIMITER ',' CSV HEADER;
    COPY Evaluacion_Empleado to 'D:\CSV_Inserts\Evaluacion_Empleado.csv' DELIMITER ',' CSV HEADER;
    COPY Evaluacion_Capacitacion to 'D:\CSV_Inserts\Evaluacion_Capacitacion.csv' DELIMITER ',' CSV HEADER;
    COPY Asistencia to 'D:\CSV_Inserts\Asistencia.csv' DELIMITER ',' CSV HEADER;
    COPY Beneficios_Cese to 'D:\CSV_Inserts\Beneficio_Cese.csv' DELIMITER ',' CSV HEADER;
    COPY Candidato to 'D:\CSV_Inserts\Candidato.csv' DELIMITER ',' CSV HEADER;
    COPY Certificados to 'D:\CSV_Inserts\Certificado.csv' DELIMITER ',' CSV HEADER;
    COPY Cese to 'D:\CSV_Inserts\Cese.csv' DELIMITER ',' CSV HEADER;
    COPY Cuenta_Bancaria to 'D:\CSV_Inserts\Cuenta_Bancaria.csv' DELIMITER ',' CSV HEADER;
    COPY Cuestionario_Salida to 'D:\CSV_Inserts\Cuestionario_Salida.csv' DELIMITER ',' CSV HEADER;
    COPY Curriculum to 'D:\CSV_Inserts\Curriculum.csv' DELIMITER ',' CSV HEADER;
    COPY Entrevista to 'D:\CSV_Inserts\Entrevista.csv' DELIMITER ',' CSV HEADER;
    COPY Evaluacion to 'D:\CSV_Inserts\Evaluacion.csv' DELIMITER ',' CSV HEADER;
    COPY Experiencia_Laboral to 'D:\CSV_Inserts\Experiencia_Laboral.csv' DELIMITER ',' CSV HEADER;
    COPY Licencia to 'D:\CSV_Inserts\Licencia.csv' DELIMITER ',' CSV HEADER;
    COPY Modificacion to 'D:\CSV_Inserts\Modificacion.csv' DELIMITER ',' CSV HEADER;
    COPY Nomina to 'D:\CSV_Inserts\Nomina.csv' DELIMITER ',' CSV HEADER;
    COPY Pago_Total to 'D:\CSV_Inserts\Pago_Total.csv' DELIMITER ',' CSV HEADER;
    COPY Perfil to 'D:\CSV_Inserts\Perfil.csv' DELIMITER ',' CSV HEADER;
    COPY Permiso to 'D:\CSV_Inserts\Permiso.csv' DELIMITER ',' CSV HEADER;
    COPY Pregunta_Salida to 'D:\CSV_Inserts\Pregunta_Salida.csv' DELIMITER ',' CSV HEADER;
    COPY Solicitud_Empleo to 'D:\CSV_Inserts\Solicitud_Empleo.csv' DELIMITER ',' CSV HEADER;
    COPY Sueldo to 'D:\CSV_Inserts\Sueldo.csv' DELIMITER ',' CSV HEADER;
    COPY Supervisor to 'D:\CSV_Inserts\Supervisor.csv' DELIMITER ',' CSV HEADER;
    COPY Vacante to 'D:\CSV_Inserts\Vacante.csv' DELIMITER ',' CSV HEADER;
    */
