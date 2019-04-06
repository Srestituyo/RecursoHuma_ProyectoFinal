
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/05/2019 17:44:43
-- Generated from EDMX file: C:\Users\Victor\Desktop\RecursoHuma_ProyectoFinal-master\RecursoHumano_ProyectoFinal\RecursoHumano_ProyectoFinal\Models\RecursoHumano.edmx
-- --------------------------------------------------

create database RecursoHumano
SET QUOTED_IDENTIFIER OFF;
GO
USE [RecursoHumano];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_DepartamentosEmpleados]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Empleados] DROP CONSTRAINT [FK_DepartamentosEmpleados];
GO
IF OBJECT_ID(N'[dbo].[FK_CargosEmpleados]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Empleados] DROP CONSTRAINT [FK_CargosEmpleados];
GO
IF OBJECT_ID(N'[dbo].[FK_EmpleadosVacaciones]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Vacaciones] DROP CONSTRAINT [FK_EmpleadosVacaciones];
GO
IF OBJECT_ID(N'[dbo].[FK_EmpleadosLicencias]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Licencias] DROP CONSTRAINT [FK_EmpleadosLicencias];
GO
IF OBJECT_ID(N'[dbo].[FK_EmpleadosCal_Nomina]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Cal_Nomina] DROP CONSTRAINT [FK_EmpleadosCal_Nomina];
GO
IF OBJECT_ID(N'[dbo].[FK_EmpleadosSalida_Empleados]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Salida_Empleados] DROP CONSTRAINT [FK_EmpleadosSalida_Empleados];
GO
IF OBJECT_ID(N'[dbo].[FK_EmpleadosPermisos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Permisos] DROP CONSTRAINT [FK_EmpleadosPermisos];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Empleados]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Empleados];
GO
IF OBJECT_ID(N'[dbo].[Departamentos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Departamentos];
GO
IF OBJECT_ID(N'[dbo].[Cargos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cargos];
GO
IF OBJECT_ID(N'[dbo].[Vacaciones]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Vacaciones];
GO
IF OBJECT_ID(N'[dbo].[Licencias]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Licencias];
GO
IF OBJECT_ID(N'[dbo].[Cal_Nomina]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cal_Nomina];
GO
IF OBJECT_ID(N'[dbo].[Salida_Empleados]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Salida_Empleados];
GO
IF OBJECT_ID(N'[dbo].[Permisos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Permisos];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Empleados'
CREATE TABLE [dbo].[Empleados] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Codigo_Empleado] int  NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Apellido] nvarchar(max)  NOT NULL,
    [Telefono] nvarchar(max)  NOT NULL,
    [Fecha_Ingreso] datetime  NOT NULL,
    [Salario] float  NOT NULL,
    [Estatus] bit  NOT NULL,
    [DepartamentosId] int  NOT NULL,
    [CargosId] int  NOT NULL
);
GO

-- Creating table 'Departamentos'
CREATE TABLE [dbo].[Departamentos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Codigo_Departamento] int  NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Cargos'
CREATE TABLE [dbo].[Cargos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Cargo] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Vacaciones'
CREATE TABLE [dbo].[Vacaciones] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [EmpleadosId] int  NOT NULL,
    [Desde] datetime  NOT NULL,
    [Hasta] datetime  NOT NULL,
    [Ano_Corres] datetime  NOT NULL,
    [Comentario] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Licencias'
CREATE TABLE [dbo].[Licencias] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [EmpleadosId] int  NOT NULL,
    [Desde] datetime  NOT NULL,
    [Hasta] datetime  NOT NULL,
    [Motivo] nvarchar(max)  NOT NULL,
    [Comentario] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Cal_Nomina'
CREATE TABLE [dbo].[Cal_Nomina] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Ano] datetime  NOT NULL,
    [Mes] datetime  NOT NULL,
    [Monto_Total] float  NOT NULL,
    [EmpleadosId] int  NOT NULL
);
GO

-- Creating table 'Salida_Empleados'
CREATE TABLE [dbo].[Salida_Empleados] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [EmpleadosId] int  NOT NULL,
    [Tipo_Salida] nvarchar(max)  NOT NULL,
    [Motivo] nvarchar(max)  NOT NULL,
    [Fecha_Salida] datetime  NOT NULL
);
GO

-- Creating table 'Permisos'
CREATE TABLE [dbo].[Permisos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [EmpleadosId] int  NOT NULL,
    [Desde] datetime  NOT NULL,
    [Hasta] datetime  NOT NULL,
    [Comentario] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Empleados'
ALTER TABLE [dbo].[Empleados]
ADD CONSTRAINT [PK_Empleados]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Departamentos'
ALTER TABLE [dbo].[Departamentos]
ADD CONSTRAINT [PK_Departamentos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Cargos'
ALTER TABLE [dbo].[Cargos]
ADD CONSTRAINT [PK_Cargos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Vacaciones'
ALTER TABLE [dbo].[Vacaciones]
ADD CONSTRAINT [PK_Vacaciones]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Licencias'
ALTER TABLE [dbo].[Licencias]
ADD CONSTRAINT [PK_Licencias]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Cal_Nomina'
ALTER TABLE [dbo].[Cal_Nomina]
ADD CONSTRAINT [PK_Cal_Nomina]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Salida_Empleados'
ALTER TABLE [dbo].[Salida_Empleados]
ADD CONSTRAINT [PK_Salida_Empleados]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Permisos'
ALTER TABLE [dbo].[Permisos]
ADD CONSTRAINT [PK_Permisos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [DepartamentosId] in table 'Empleados'
ALTER TABLE [dbo].[Empleados]
ADD CONSTRAINT [FK_DepartamentosEmpleados]
    FOREIGN KEY ([DepartamentosId])
    REFERENCES [dbo].[Departamentos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DepartamentosEmpleados'
CREATE INDEX [IX_FK_DepartamentosEmpleados]
ON [dbo].[Empleados]
    ([DepartamentosId]);
GO

-- Creating foreign key on [CargosId] in table 'Empleados'
ALTER TABLE [dbo].[Empleados]
ADD CONSTRAINT [FK_CargosEmpleados]
    FOREIGN KEY ([CargosId])
    REFERENCES [dbo].[Cargos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CargosEmpleados'
CREATE INDEX [IX_FK_CargosEmpleados]
ON [dbo].[Empleados]
    ([CargosId]);
GO

-- Creating foreign key on [EmpleadosId] in table 'Vacaciones'
ALTER TABLE [dbo].[Vacaciones]
ADD CONSTRAINT [FK_EmpleadosVacaciones]
    FOREIGN KEY ([EmpleadosId])
    REFERENCES [dbo].[Empleados]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmpleadosVacaciones'
CREATE INDEX [IX_FK_EmpleadosVacaciones]
ON [dbo].[Vacaciones]
    ([EmpleadosId]);
GO

-- Creating foreign key on [EmpleadosId] in table 'Licencias'
ALTER TABLE [dbo].[Licencias]
ADD CONSTRAINT [FK_EmpleadosLicencias]
    FOREIGN KEY ([EmpleadosId])
    REFERENCES [dbo].[Empleados]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmpleadosLicencias'
CREATE INDEX [IX_FK_EmpleadosLicencias]
ON [dbo].[Licencias]
    ([EmpleadosId]);
GO

-- Creating foreign key on [EmpleadosId] in table 'Cal_Nomina'
ALTER TABLE [dbo].[Cal_Nomina]
ADD CONSTRAINT [FK_EmpleadosCal_Nomina]
    FOREIGN KEY ([EmpleadosId])
    REFERENCES [dbo].[Empleados]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmpleadosCal_Nomina'
CREATE INDEX [IX_FK_EmpleadosCal_Nomina]
ON [dbo].[Cal_Nomina]
    ([EmpleadosId]);
GO

-- Creating foreign key on [EmpleadosId] in table 'Salida_Empleados'
ALTER TABLE [dbo].[Salida_Empleados]
ADD CONSTRAINT [FK_EmpleadosSalida_Empleados]
    FOREIGN KEY ([EmpleadosId])
    REFERENCES [dbo].[Empleados]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmpleadosSalida_Empleados'
CREATE INDEX [IX_FK_EmpleadosSalida_Empleados]
ON [dbo].[Salida_Empleados]
    ([EmpleadosId]);
GO

-- Creating foreign key on [EmpleadosId] in table 'Permisos'
ALTER TABLE [dbo].[Permisos]
ADD CONSTRAINT [FK_EmpleadosPermisos]
    FOREIGN KEY ([EmpleadosId])
    REFERENCES [dbo].[Empleados]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmpleadosPermisos'
CREATE INDEX [IX_FK_EmpleadosPermisos]
ON [dbo].[Permisos]
    ([EmpleadosId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------