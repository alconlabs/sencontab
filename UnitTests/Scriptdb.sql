CREATE TABLE APLICACIONES (
       CD_APLICACION        char(10) NOT NULL,
       DS_APLICACION        char(50) NULL,
       PRIMARY KEY NONCLUSTERED (CD_APLICACION)
)
go

CREATE TABLE APL_VERSIONES (
       CD_APLICACION        char(10) NOT NULL,
       DBVERSION            CHAR(5) NOT NULL,
       SCRIPT               text NULL,
       PRIMARY KEY NONCLUSTERED (CD_APLICACION, DBVERSION)
)
go

CREATE INDEX XIF38APL_VERSIONES ON APL_VERSIONES
(
       CD_APLICACION
)
go

CREATE TABLE CONTADORES (
       CD_CONTADOR          CHAR(8) NOT NULL,
       DS_CONTADOR          CHAR(50) NOT NULL,
       SEMILLA              INT NOT NULL,
       DIGITOS              INT NOT NULL,
       TABLA                CHAR(50) NOT NULL,
       COLUMNA              CHAR(50) NOT NULL,
       RELLENADO            char(1) NOT NULL,
       CARACTER             char(1) NULL,
       PRIMARY KEY NONCLUSTERED (CD_CONTADOR)
)
go

CREATE TABLE DELEGACIONES (
       CD_DELEGACION        char(2) NOT NULL,
       DS_DELEGACION        char(50) NULL,
       PROVINCIA            char(50) NULL,
       POBLACION            char(50) NULL,
       CODIGO_POSTAL        char(10) NULL,
       FAX                  char(15) NULL,
       TELEFONO1            char(15) NULL,
       DIRECCION2           char(50) NULL,
       DIRECCION1           char(50) NULL,
       EMAIL                char(100) NULL,
       PRIMARY KEY NONCLUSTERED (CD_DELEGACION)
)
go

CREATE TABLE DEPARTAMENTOS (
       CD_DEPARTAMENTO      char(10) NOT NULL,
       DS_DEPARTAMENTO      char(50) NULL,
       PRIMARY KEY NONCLUSTERED (CD_DEPARTAMENTO)
)
go


CREATE TABLE FORMS_APLICACION (
       CD_APLICACION        char(10) NOT NULL,
       CD_FORMULARIO        CHAR(50) NOT NULL,
       DS_FORMULARIO        CHAR(80) NOT NULL,
       PRIMARY KEY NONCLUSTERED (CD_APLICACION, CD_FORMULARIO)
)
go

CREATE INDEX XIF102FORMS_APLICACION ON FORMS_APLICACION
(
       CD_APLICACION
)
go

CREATE TABLE IMAGENES_USUARIO (
       CD_USUARIO           char(25) NOT NULL,
       DS_IMAGEN            char(25) NOT NULL,
       IMAGEN               image NOT NULL,
       PRIMARY KEY NONCLUSTERED (CD_USUARIO, DS_IMAGEN)
)
go

CREATE INDEX XIF64IMAGENES_USUARIO ON IMAGENES_USUARIO
(
       CD_USUARIO
)
go

CREATE TABLE OPCIONES_MENU (
       CD_APLICACION        char(10) NOT NULL,
       CD_OPCIONMENU        CHAR(50) NOT NULL,
       DS_OPCIONMENU        CHAR(80) NOT NULL,
       PRIMARY KEY NONCLUSTERED (CD_APLICACION, CD_OPCIONMENU)
)
go

CREATE INDEX XIF101OPCIONES_MENU ON OPCIONES_MENU
(
       CD_APLICACION
)
go

CREATE TABLE TIPOUSUARIO (
       CD_TIPOUSUARIO       char(3) NOT NULL,
       ROLUSUARIO           char(50) NOT NULL,
       DS_TIPOUSUARIO       char(25) NULL,
       PRIMARY KEY NONCLUSTERED (CD_TIPOUSUARIO)
)
go

CREATE TABLE USUARIOS (
       CD_USUARIO           char(25) NOT NULL,
       DS_USUARIO           char(50) NULL,
       EMAIL                char(100) NULL,
       CD_TIPOUSUARIO       char(3) NULL,
       PASSWORD             char(25) NOT NULL,
       TELEFONO_MOVIL       char(15) NULL,
       TELEFONO_DIRECTO     char(15) NULL,
       CD_DEPARTAMENTO      char(10) NULL,
       CD_DELEGACION        char(2) NULL,
       TELEFONO_MEMORIA     CHAR(5) NULL,
       TELEFONO_EXTENSION   CHAR(5) NULL,
       ROLUSUARIO           CHAR(50) NULL,
       PRIMARY KEY NONCLUSTERED (CD_USUARIO)
)
go

CREATE INDEX XIF24USUARIOS ON USUARIOS
(
       CD_DEPARTAMENTO
)
go

CREATE INDEX XIF27USUARIOS ON USUARIOS
(
       CD_DELEGACION
)
go

CREATE INDEX XIF4USUARIOS ON USUARIOS
(
       CD_TIPOUSUARIO
)
go


CREATE TABLE USUARIOS_APLICACIONES (
       CD_APLICACION        char(10) NOT NULL,
       CD_USUARIO           char(25) NOT NULL,
       PRIMARY KEY NONCLUSTERED (CD_APLICACION, CD_USUARIO)
)
go

CREATE INDEX XIF25USUARIOS_APLICACIONES ON USUARIOS_APLICACIONES
(
       CD_APLICACION
)
go

CREATE INDEX XIF26USUARIOS_APLICACIONES ON USUARIOS_APLICACIONES
(
       CD_USUARIO
)
go

CREATE TABLE USUARIOS_FORMS (
       CD_APLICACION        char(10) NOT NULL,
       CD_FORMULARIO        CHAR(50) NOT NULL,
       CD_USUARIO           char(25) NOT NULL,
       INFORMES             CHAR(1) NOT NULL,
       EDICION              CHAR(1) NOT NULL,
       ALTAS                CHAR(1) NOT NULL,
       BAJAS                CHAR(1) NOT NULL,
       PROCESOS             CHAR(1) NOT NULL,
       PRIMARY KEY NONCLUSTERED (CD_APLICACION, CD_FORMULARIO,
              CD_USUARIO)
)
go

CREATE INDEX XIF108USUARIOS_FORMS ON USUARIOS_FORMS
(
       CD_APLICACION,
       CD_FORMULARIO
)
go

CREATE INDEX XIF109USUARIOS_FORMS ON USUARIOS_FORMS
(
       CD_USUARIO
)
go

CREATE TABLE USUARIOS_MENUS (
       CD_APLICACION        char(10) NOT NULL,
       CD_OPCIONMENU        CHAR(50) NOT NULL,
       CD_USUARIO           char(25) NOT NULL,
       PRIMARY KEY NONCLUSTERED (CD_APLICACION, CD_OPCIONMENU,
              CD_USUARIO)
)
go

CREATE INDEX XIF105USUARIOS_MENUS ON USUARIOS_MENUS
(
       CD_APLICACION,
       CD_OPCIONMENU
)
go

CREATE INDEX XIF106USUARIOS_MENUS ON USUARIOS_MENUS
(
       CD_USUARIO
)
go

ALTER TABLE USUARIOS_FORMS
       ADD FOREIGN KEY (CD_APLICACION, CD_FORMULARIO)
                             REFERENCES FORMS_APLICACION
go

ALTER TABLE USUARIOS_MENUS
       ADD FOREIGN KEY (CD_APLICACION, CD_OPCIONMENU)
                             REFERENCES OPCIONES_MENU
go


CREATE TABLE BUGS (
       CD_APLICACION        char(10) NOT NULL,
       BUG_ID               CHAR(5) NOT NULL,
       DS_BUG               CHAR(150) NOT NULL,
       FC_NOTIFICACION      datetime NOT NULL,
       CD_USUARIO           char(25) NULL,
       TIPO                 char(15) NOT NULL,
       SEVERIDAD            CHAR(15) NOT NULL,
       ESTADO               CHAR(15) NULL,
       PROGRAMADOR          CHAR(25) NULL,
       FC_CORRECCION        datetime NULL,
       COSTE_HORAS          INT NULL,
       FASE_CREACION_BUG    CHAR(15) NULL,
       FASE_DETECCION_BUG   CHAR(15) NULL,
       PRIMARY KEY NONCLUSTERED (CD_APLICACION, BUG_ID)
)
go

CREATE INDEX XIF32BUGS ON BUGS
(
       CD_APLICACION
)
go

CREATE INDEX XIF34BUGS ON BUGS
(
       CD_USUARIO
)
go


CREATE TABLE TAREAS (
       CD_APLICACION        char(10) NOT NULL,
       ID_TAREA             CHAR(5) NOT NULL,
       DS_TAREA             char(50) NULL,
       BRANCH               char(10) NULL,
       VERSION_BASE         char(3) NULL,
       PRIORIDAD            char(1) NULL,
       REVISION_BASE        char(2) NULL,
       TIEMPO_REAL          int NULL,
       ORIGEN               char(15) NULL,
       TIPO                 char(15) NULL,
       PROGRESO             INT NULL,
       ESTADO               char(15) NULL,
       CD_USU_ASIGN         CHAR(25) NULL,
       TIEMPO_ESTIMADO      INT NULL,
       BUG_ID               CHAR(5) NULL,
       PRIMARY KEY NONCLUSTERED (CD_APLICACION, ID_TAREA)
)
go

CREATE INDEX XIF36TAREAS ON TAREAS
(
       CD_APLICACION,
       BUG_ID
)
go

CREATE INDEX XIF39TAREAS ON TAREAS
(
       CD_APLICACION
)
go


CREATE TABLE TEXTOS_BUGS (
       CD_APLICACION        char(10) NOT NULL,
       BUG_ID               CHAR(5) NOT NULL,
       EXPLICACION          text NULL,
       SOLUCION             text NULL,
       NOTAS                text NULL,
       PRIMARY KEY NONCLUSTERED (CD_APLICACION, BUG_ID)
)
go


CREATE TABLE TEXTOS_TAREAS (
       CD_APLICACION        char(10) NOT NULL,
       ID_TAREA             CHAR(5) NOT NULL,
       EXPLICACION          text NULL,
       SCRIPT_SQL           text NULL,
       DOCUMENTACION        text NULL,
       EJECUCION            text NULL,
       PRIMARY KEY NONCLUSTERED (CD_APLICACION, ID_TAREA)
)
go


ALTER TABLE TAREAS
       ADD FOREIGN KEY (CD_APLICACION, BUG_ID)
                             REFERENCES BUGS
go


ALTER TABLE TEXTOS_BUGS
       ADD FOREIGN KEY (CD_APLICACION, BUG_ID)
                             REFERENCES BUGS
go




CREATE TABLE RPT_CARPETAS (
       CD_CARPETA           char(3) NOT NULL,
       DS_CARPETA           char(60) NULL,
       COLOCACION           int NULL,
       TEXTO                text NULL,
       PRIMARY KEY NONCLUSTERED (CD_CARPETA)
)
go

CREATE INDEX XIE1RPT_CARPETAS ON RPT_CARPETAS
(
       COLOCACION
)
go


CREATE TABLE RPT_GRUPOS (
       CD_APLICACION        char(10) NOT NULL,
       CD_GRUPO             char(3) NOT NULL,
       DS_GRUPO             char(60) NOT NULL,
       PRIMARY KEY NONCLUSTERED (CD_APLICACION, CD_GRUPO)
)
go

CREATE INDEX XIF28RPT_GRUPOS ON RPT_GRUPOS
(
       CD_APLICACION
)
go


CREATE TABLE RPT_LISTADOS (
       CD_LISTADO           char(3) NOT NULL,
       DS_LISTADO           char(60) NOT NULL,
       CD_CARPETA           char(3) NOT NULL,
       COLOCACION           INT NULL,
       LISTADO              image NULL,
       TEXTO                text NULL,
       MODIFICADO           datetime NULL,
       PRIMARY KEY NONCLUSTERED (CD_LISTADO)
)
go

CREATE INDEX XIF79RPT_LISTADOS ON RPT_LISTADOS
(
       CD_CARPETA
)
go

CREATE INDEX XIE1RPT_LISTADOS ON RPT_LISTADOS
(
       CD_CARPETA,
       COLOCACION
)
go


CREATE TABLE RPT_LISTADOS_GRUPO (
       CD_APLICACION        char(10) NOT NULL,
       CD_GRUPO             char(3) NOT NULL,
       CD_LISTADO           char(3) NOT NULL,
       COLOCACION           INT NULL,
       PRIMARY KEY NONCLUSTERED (CD_APLICACION, CD_GRUPO, CD_LISTADO)
)
go

CREATE INDEX XIF105RPT_LISTADOS_GRUPO ON RPT_LISTADOS_GRUPO
(
       CD_LISTADO
)
go

CREATE INDEX XIF106RPT_LISTADOS_GRUPO ON RPT_LISTADOS_GRUPO
(
       CD_GRUPO,
       CD_APLICACION
)
go


CREATE TABLE CLIENTES (
       CD_CLIENTE           char(4) NOT NULL,
       CD_GRUPO             CHAR(6) NULL,
       DS_CLIENTE           char(50) NULL,
       DS_COMERCIAL         CHAR(50) NULL,
       DIRECCION2           char(50) NULL,
       DIRECCION1           char(50) NULL,
       FAX                  char(15) NULL,
       CODIGO_POSTAL        char(10) NULL,
       TELEFONO1            char(15) NULL,
       PROVINCIA            char(50) NULL,
       POBLACION            char(50) NULL,
       PAIS                 CHAR(50) NULL,
       NIF_CIF              CHAR(25) NULL,
       PAGINAWEB            CHAR(100) NULL,
       PRIMARY KEY NONCLUSTERED (CD_CLIENTE)
)
go


CREATE TABLE DATOS_RIESGO (
       CD_CLIENTE           char(4) NOT NULL,
       CODIGO_DEUDOR        char(15) NULL,
       IMP_CUBIERTO         numeric(10,2) NULL,
       ESTADO               char(1) NULL,
       IMP_CUBIERTO_ANTERIOR numeric(10,2) NULL,
       IMP_SOLICITADO       numeric(10,2) NULL,
       FC_CLASIF_ANTERIOR   datetime NULL,
       FC_CLASIFICACION     datetime NULL,
       CD_FORMAPAGO         CHAR(3) NULL,
       FC_SOLICITUD         datetime NULL,
       PRIMARY KEY NONCLUSTERED (CD_CLIENTE)
)
go

CREATE INDEX XIF50DATOS_RIESGO ON DATOS_RIESGO
(
       CD_FORMAPAGO
)
go


CREATE TABLE FICHAS (
       CD_FICHA             CHAR(38) NOT NULL,
       CD_PLANTILLA         CHAR(15) NULL,
       DS_FICHA             CHAR(80) NOT NULL,
       PRIMARY KEY NONCLUSTERED (CD_FICHA)
)
go

CREATE INDEX XIF63FICHAS ON FICHAS
(
       CD_PLANTILLA
)
go


CREATE TABLE FICHAS_CLIENTES (
       CD_CLIENTE           char(4) NOT NULL,
       CD_FICHA             CHAR(38) NOT NULL,
       PRIMARY KEY NONCLUSTERED (CD_CLIENTE, CD_FICHA)
)
go

CREATE INDEX XIF60FICHAS_CLIENTES ON FICHAS_CLIENTES
(
       CD_CLIENTE
)
go

CREATE INDEX XIF61FICHAS_CLIENTES ON FICHAS_CLIENTES
(
       CD_FICHA
)
go


CREATE TABLE FICHAS_OBRAS (
       CD_FICHA             CHAR(38) NOT NULL,
       CD_CLIENTE           char(4) NOT NULL,
       CD_OBRACLIENTE       char(3) NOT NULL,
       PRIMARY KEY NONCLUSTERED (CD_FICHA, CD_CLIENTE, CD_OBRACLIENTE)
)
go

CREATE INDEX XIF58FICHAS_OBRAS ON FICHAS_OBRAS
(
       CD_FICHA
)
go

CREATE INDEX XIF59FICHAS_OBRAS ON FICHAS_OBRAS
(
       CD_CLIENTE,
       CD_OBRACLIENTE
)
go


CREATE TABLE OBRASCLIENTE (
       CD_CLIENTE           char(4) NOT NULL,
       CD_OBRACLIENTE       char(3) NOT NULL,
       PROVINCIA            char(50) NULL,
       POBLACION            char(50) NULL,
       CODIGO_POSTAL        char(10) NULL,
       DIRECCION2           char(50) NULL,
       DIRECCION1           char(50) NULL,
       FAX                  char(15) NULL,
       TELEFONO1            char(15) NULL,
       FECHA_ALTA           datetime NOT NULL,
       DS_OBRA              char(100) NULL,
       PAIS                 CHAR(50) NULL,
       CD_DELEGACION        char(2) NULL,
       PRIMARY KEY NONCLUSTERED (CD_CLIENTE, CD_OBRACLIENTE)
)
go

CREATE INDEX XIF24OBRASCLIENTE ON OBRASCLIENTE
(
       CD_DELEGACION
)
go

CREATE INDEX XIF8OBRASCLIENTE ON OBRASCLIENTE
(
       CD_CLIENTE
)
go


CREATE TABLE PLANTILLAS (
       CD_PLANTILLA         CHAR(15) NOT NULL,
       DS_PLANTILLA         CHAR(80) NOT NULL,
       PRIMARY KEY NONCLUSTERED (CD_PLANTILLA)
)
go


CREATE TABLE VARIABLES (
       CD_FICHA             CHAR(38) NOT NULL,
       CD_VARIABLE          CHAR(20) NOT NULL,
       DS_VARIABLE          CHAR(50) NULL,
       POSICION             INT NOT NULL,
       TIPO                 CHAR(4) NOT NULL,
       LONGITUD             int NOT NULL,
       OBLIGATORIO          CHAR(1) NOT NULL,
       VALOR                varchar(250) NULL,
       PRIMARY KEY NONCLUSTERED (CD_FICHA, CD_VARIABLE)
)
go

CREATE INDEX XIF57VARIABLES ON VARIABLES
(
       CD_FICHA
)
go

CREATE INDEX XIE1VARIABLES ON VARIABLES
(
       CD_FICHA,
       POSICION
)
go


CREATE TABLE VARIABLES_PLANTILLA (
       CD_PLANTILLA         CHAR(15) NOT NULL,
       CD_VARIABLE          CHAR(20) NOT NULL,
       DS_VARIABLE          CHAR(50) NOT NULL,
       POSICION             INT NOT NULL,
       TIPO                 CHAR(4) NOT NULL,
       LONGITUD             INT NULL,
       OBLIGATORIO          CHAR(1) NOT NULL,
       PORDEFECTO           varchar(250) NULL,
       PRIMARY KEY NONCLUSTERED (CD_PLANTILLA, CD_VARIABLE)
)
go

CREATE INDEX XIF62VARIABLES_PLANTILLA ON VARIABLES_PLANTILLA
(
       CD_PLANTILLA
)
go

CREATE INDEX XIE1VARIABLES_PLANTILLA ON VARIABLES_PLANTILLA
(
       CD_PLANTILLA,
       POSICION
)
go


ALTER TABLE FICHAS
       ADD FOREIGN KEY (CD_PLANTILLA)
                             REFERENCES PLANTILLAS
go


ALTER TABLE FICHAS_CLIENTES
       ADD FOREIGN KEY (CD_FICHA)
                             REFERENCES FICHAS
go


ALTER TABLE FICHAS_OBRAS
       ADD FOREIGN KEY (CD_FICHA)
                             REFERENCES FICHAS
go


ALTER TABLE VARIABLES
       ADD FOREIGN KEY (CD_FICHA)
                             REFERENCES FICHAS
go


ALTER TABLE VARIABLES_PLANTILLA
       ADD FOREIGN KEY (CD_PLANTILLA)
                             REFERENCES PLANTILLAS
go


CREATE TABLE CONCEPTOS_OBRA (
       CD_CONCEPTO          char(3) NOT NULL,
       DS_CONCEPTO          char(30) NULL,
       PRC_REPASOS          NUMERIC(10,2) NULL,
       PRC_MERMAS           NUMERIC(10,2) NULL,
       PROD_COMERCIAL       CHAR(1) NOT NULL,
       PRIMARY KEY NONCLUSTERED (CD_CONCEPTO)
)
go

CREATE TABLE DOCUMENTACION_OBRA (
       CD_CLIENTE           char(4) NOT NULL,
       CD_OBRA              CHAR(3) NOT NULL,
       NM_LINEA             INT NOT NULL,
       CD_TIPODOCUMENTO     char(3) NOT NULL,
       FC_INSERCION         datetime NOT NULL,
       REF_DOCUMENTO        CHAR(50) NOT NULL,
       FC_CADUCIDAD         datetime NULL,
       NOTAS                text NULL,
       PRIMARY KEY NONCLUSTERED (CD_CLIENTE, CD_OBRA, NM_LINEA)
)
go

CREATE INDEX XIF17DOCUMENTACION_OBRA ON DOCUMENTACION_OBRA
(
       CD_TIPODOCUMENTO
)
go

CREATE INDEX XIF18DOCUMENTACION_OBRA ON DOCUMENTACION_OBRA
(
       CD_CLIENTE,
       CD_OBRA
)
go


CREATE TABLE DOCUMENTOS_OBRA (
       CD_CLIENTE           char(4) NOT NULL,
       CD_OBRA              CHAR(3) NOT NULL,
       NM_LINEA             INT NOT NULL,
       DOCUMENTO            image NOT NULL,
       PRIMARY KEY NONCLUSTERED (CD_CLIENTE, CD_OBRA, NM_LINEA)
)
go


CREATE TABLE FAMILIAS (
       CD_FAMILIA           char(3) NOT NULL,
       DS_FAMILIA           char(40) NOT NULL,
       PRIMARY KEY NONCLUSTERED (CD_FAMILIA)
)
go


CREATE TABLE FICHAS_OBRA (
       CD_CLIENTE           char(4) NOT NULL,
       CD_OBRA              CHAR(3) NOT NULL,
       CD_CONCEPTO          char(3) NOT NULL,
       IMP_COLOCACION       numeric(10,2) NULL,
       IMP_CONTRATO         numeric(10,2) NULL,
       IMP_REPASOS          numeric(10,2) NULL,
       IMP_MERMAS           numeric(10,2) NULL,
       IMP_MATERIALES       numeric(10,2) NULL,
       BLOQUEADA            CHAR(1) NOT NULL,
       FC_ENTRADA           datetime NOT NULL,
       PRC_FACT_COLOCACION  numeric(10,2) NULL,
       PRC_FACT_CARPINTERIA numeric(10,2) NULL,
       PRC_FACT_CRECIBIR    numeric(10,2) NULL,
       PRC_RETENCION        numeric(10,2) NULL,
       PRC_AVALADO          numeric(10,2) NULL,
       AVAL                 CHAR(1) NULL,
       PRIMARY KEY NONCLUSTERED (CD_CLIENTE, CD_OBRA, CD_CONCEPTO)
)
go

CREATE INDEX XIF14FICHAS_OBRA ON FICHAS_OBRA
(
       CD_CLIENTE,
       CD_OBRA
)
go

CREATE INDEX XIF15FICHAS_OBRA ON FICHAS_OBRA
(
       CD_CONCEPTO
)
go


CREATE TABLE FORMA_PAGO (
       CD_FORMAPAGO         CHAR(3) NOT NULL,
       DS_FORMAPAGO         CHAR(50) NULL,
       PRIMARY KEY NONCLUSTERED (CD_FORMAPAGO)
)
go


CREATE TABLE IMPUTACIONES_OBRA (
       CD_CLIENTE           char(4) NOT NULL,
       CD_OBRA              CHAR(3) NOT NULL,
       NM_LINEA             int NOT NULL,
       CD_TIPOIMPUTACION    char(3) NULL,
       IMP_IMPUTACION       numeric(10,2) NULL,
       DESCRIPCION          char(100) NULL,
       FC_DOCUMENTO         datetime NULL,
       FC_IMPUTACION        datetime NULL,
       REFERENCIA           CHAR(15) NULL,
       PRIMARY KEY NONCLUSTERED (CD_CLIENTE, CD_OBRA, NM_LINEA)
)
go

CREATE INDEX XIF16IMPUTACIONES_OBRA ON IMPUTACIONES_OBRA
(
       CD_TIPOIMPUTACION
)
go

CREATE INDEX XIF19IMPUTACIONES_OBRA ON IMPUTACIONES_OBRA
(
       CD_CLIENTE,
       CD_OBRA
)
go


CREATE TABLE MADERAS (
       CD_MADERA            char(3) NOT NULL,
       DS_MADERA            char(30) NOT NULL,
       PRIMARY KEY NONCLUSTERED (CD_MADERA)
)
go


CREATE TABLE OBRAS (
       CD_CLIENTE           char(4) NOT NULL,
       CD_OBRA              CHAR(3) NOT NULL,
       NM_VIVIENDAS         numeric(10) NULL,
       FC_ADJUDICACION      datetime NULL,
       DS_OBRA              CHAR(100) NOT NULL,
       CD_DELEGACION        char(2) NULL,
       EMAIL                CHAR(100) NULL,
       FAX                  CHAR(15) NULL,
       CD_JEFEOBRAJHER      char(25) NULL,
       PRIMARY KEY NONCLUSTERED (CD_CLIENTE, CD_OBRA)
)
go

CREATE UNIQUE INDEX XAK1OBRAS ON OBRAS
(
       CD_CLIENTE,
       CD_OBRA,
       FC_ADJUDICACION
)
go

CREATE INDEX XIF111OBRAS ON OBRAS
(
       CD_JEFEOBRAJHER
)
go

CREATE INDEX XIF25OBRAS ON OBRAS
(
       CD_DELEGACION
)
go

CREATE INDEX XIF32OBRAS ON OBRAS
(
       CD_CLIENTE
)
go

CREATE TABLE PLAN_OBRA (
       CD_CLIENTE           char(4) NOT NULL,
       CD_OBRA              CHAR(3) NOT NULL,
       FASE                 int NOT NULL,
       NM_VIVIENDAS         INT NOT NULL,
       CERRADA              CHAR(1) NOT NULL,
       FC_ENTRADA           datetime NOT NULL,
       FC_SUMIN_CRECIBIR    datetime NULL,
       IMP_A_LA_COLOC_PROD_COMERC NUMERIC(10,2) NULL,
       FC_SUMIN_PROD_COMERC datetime NULL,
       FC_SUMIN_CARPINTERIA datetime NULL,
       IMP_AL_SUMIN_PROD_COMERC NUMERIC(10,2) NULL,
       IMP_A_LA_COLOCACION  NUMERIC(10,2) NULL,
       IMP_AL_SUMINISTRO    NUMERIC(10,2) NULL,
       IMP_A_LOS_CRECIBIR   NUMERIC(10,2) NULL,
       NOTAS                TEXT NULL,
       FC_FIN_COLOC_PROD_COMERC datetime NULL,
       FC_INI_COLOC_PROD_COMERC datetime NULL,
       FC_FIN_COLOC_CARPINTERIA datetime NULL,
       FC_INI_COLOC_CARPINTERIA datetime NULL,
       PRIMARY KEY NONCLUSTERED (CD_CLIENTE, CD_OBRA, FASE)
)
go

CREATE INDEX XIF39PLAN_OBRA ON PLAN_OBRA
(
       CD_OBRA,
       CD_CLIENTE
)
go


CREATE TABLE PRODUCTOS (
       CD_MODELO            char(12) NOT NULL,
       DS_MODELO            char(80) NULL,
       CD_FAMILIA           char(3) NULL,
       PRIMARY KEY NONCLUSTERED (CD_MODELO)
)
go

CREATE INDEX XIF13PRODUCTOS ON PRODUCTOS
(
       CD_FAMILIA
)
go


CREATE TABLE PRODUCTOS_ADJ (
       CD_CLIENTE           char(4) NOT NULL,
       CD_OBRA              CHAR(3) NOT NULL,
       CD_FAMILIA           char(3) NOT NULL,
       CD_MADERA            char(3) NOT NULL,
       NM_LINEA             int NULL,
       CANTIDAD             int NOT NULL,
       PRIMARY KEY NONCLUSTERED (CD_CLIENTE, CD_OBRA, CD_FAMILIA, 
              CD_MADERA)
)
go

CREATE INDEX XIF15PRODUCTOS_ADJ ON PRODUCTOS_ADJ
(
       CD_CLIENTE,
       CD_OBRA
)
go

CREATE INDEX XIF16PRODUCTOS_ADJ ON PRODUCTOS_ADJ
(
       CD_MADERA
)
go

CREATE INDEX XIF37PRODUCTOS_ADJ ON PRODUCTOS_ADJ
(
       CD_FAMILIA
)
go


CREATE TABLE PRODUCTOS_FASE (
       CD_CLIENTE           char(4) NOT NULL,
       CD_OBRA              CHAR(3) NOT NULL,
       CD_MADERA            char(3) NOT NULL,
       CD_FAMILIA           char(3) NOT NULL,
       FASE                 int NOT NULL,
       CANTIDAD             INT NOT NULL,
       PRIMARY KEY NONCLUSTERED (CD_CLIENTE, CD_OBRA, CD_MADERA, 
              CD_FAMILIA, FASE)
)
go

CREATE INDEX XIF60PRODUCTOS_FASE ON PRODUCTOS_FASE
(
       CD_CLIENTE,
       CD_OBRA,
       FASE
)
go

CREATE INDEX XIF63PRODUCTOS_FASE ON PRODUCTOS_FASE
(
       CD_MADERA,
       CD_FAMILIA,
       CD_CLIENTE,
       CD_OBRA
)
go


CREATE TABLE TIPO_DOCUMENTO (
       CD_TIPODOCUMENTO     char(3) NOT NULL,
       DS_TIPODOCUMENTO     char(30) NULL,
       PLANTILLA            IMAGE NULL,
       PRIMARY KEY NONCLUSTERED (CD_TIPODOCUMENTO)
)
go


CREATE TABLE TIPO_IMPUTACION (
       CD_TIPOIMPUTACION    char(3) NOT NULL,
       DS_TIPOIMPUTACION    char(30) NULL,
       PRIMARY KEY NONCLUSTERED (CD_TIPOIMPUTACION)
)
go






