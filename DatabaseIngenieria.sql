-- Database: ingeneria

-- DROP DATABASE ingeneria;

CREATE DATABASE ingeneria
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
    
    
    Create Table Profesionista{
    correo VARCHAR (90),
    carrera VARCHAR(90),
    nacionalidad VARCHAR(90),
    contrasena VARCHAR(90),
    telefono INTEGER ,
    nombre VARCHAR(90),
    empresa_laboral VARCHAR(90),
    cargo_laboral VARCHAR(90),
    periodo_laboral DATE ,
    colegio VARCHAR(90),
    grado VARCHAR(90),
    periodo VARCHAR(90),
    nombre_skils VARCHAR(90),
    grado_skils VARCHAR(90),
    puesto VARCHAR(90),
    CONSTRAINT Profesionista_pkey PRIMARY KEY (correo),
    CONSTRAINT Profesionista_Vacante_fkey FOREIGN KEY (puesto)
        REFERENCES Vacante (puesto) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
    }
    
    Create Table Postular{
    correo VARCHAR(90),
    puesto VARCHAR(90)
    CONSTRAINT Postular_Profesionista_fkey FOREIGN KEY (correo),
    CONSTRAINT Postular_Vacante_fkey FOREIGN KEY (puesto)
        REFERENCES Profesionista (correo) MATCH SIMPLE
        REFERENCES Vacante (puesto) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
    }
    
    
    Create Table Vacante{
    descripcion VARCHAR(90),
    puesto VARCHAR(90),
    horario VARCHAR(90),
    lugar VARCHAR(90),
    salario VARCHAR(90),
    actividades VARCHAR(90),
    correo VARCHAR(90),
    CONSTRAINT Vacante_pkey PRIMARY KEY (puesto)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
    }
    
    Create Table Tener{
    puesto VARCHAR(90),
    nombre VARCHAR(90)
    CONSTRAINT Tener_Vacante_fkey FOREIGN KEY (puesto),
    CONSTRAINT Tener_Empresa_fkey FOREIGN KEY (nombre),
    REFERENCES Vacante (puesto) MATCH SIMPLE
    REFERENCES Empresa (nombre) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
    }
    
    Create Table Empresa{
    nombre VARCHAR(90),
    oficinas VARCHAR(90),
    fundacion VARCHAR(90),
    numeroEmpleados INTEGER ,
    presidente VARCHAR(90),
    contacto VARCHAR(90)
    CONSTRAINT Empresa_pkey PRIMARY KEY (nombre)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
    }