/*==============================================================*/
/* Table: PROFESION                                             */
/*==============================================================*/
create table PROFESION (
   IDPROFESION          SERIAL               not null,
   DESCRIPCION_PROFESION CHAR(40)             not null,
   constraint PK_PROFESION primary key (IDPROFESION)
);

/*==============================================================*/
/*  Creacion de tablas                      			 */
/*==============================================================*/
/*  Tabla Docente                 			 */

create table DOCENTE (
   IDDOCENTE            SERIAL                not null,
   IDPROFESION          INT4                 null,
   NOMBRE_DOCENTE       CHAR(50)             not null,
   APELLIDO_DOCENTE     CHAR(50)             not null,
   CEDULA_DOCENTE       NUMERIC(11)          not null,
   TELEFONO_DOCENTE     NUMERIC(13)          not null,
   CORREO_DOCENTE       CHAR(50)             not null,
   constraint PK_DOCENTE primary key (IDDOCENTE),
   constraint FK_DOCENTE_PROFESION_PROFESIO foreign key (IDPROFESION)
      references PROFESION (IDPROFESION)
      on delete restrict on update restrict
);
/*==============================================================*/
/* Table: FACULTAD                                              */
/*==============================================================*/
create table FACULTAD (
   IDFACULTAD           SERIAL                not null,
   DESCRIPCION_FACULTAD CHAR(40)             not null,
   constraint PK_FACULTAD primary key (IDFACULTAD)
);
/*==============================================================*/
/* Table: NIVEL                                                 */
/*==============================================================*/
create table NIVEL (
   IDNIVEL              SERIAL                 not null,
   DESCRIPCION_NIVEL    CHAR(10)             not null,
   constraint PK_NIVEL primary key (IDNIVEL)
);
/*==============================================================*/
/* Table: CARRERA                                               */
/*==============================================================*/
create table CARRERA (
   IDCARRERA            SERIAL                 not null,
   IDFACULTAD           INT4                 not null,
   DESCRIPCION_CARRERA  CHAR(40)             not null,
   constraint PK_CARRERA primary key (IDCARRERA),
   constraint FK_CARRERA_POSEE_VAR_FACULTAD foreign key (IDFACULTAD)
      references FACULTAD (IDFACULTAD)
      on delete restrict on update restrict
);
/*==============================================================*/
/* Table: ESTUDIANTE                                            */
/*==============================================================*/
create table ESTUDIANTE (
   IDESTUDIANTE         SERIAL               not null,
   IDCARRERA            INT4                 not null,
   NOMBRE_ESTUDIANTE    CHAR(50)             not null,
   APELLIDOS_ESTUDIANTE CHAR(50)             not null,
   TELEFONO_ESTUDIANTE  NUMERIC(20)          not null,
   CEDULA_ESTUDIANTE    NUMERIC(11)          not null,
   CORREO_ESTUDIANTE    CHAR(50)             not null,
   constraint PK_ESTUDIANTE primary key (IDESTUDIANTE),
   constraint FK_ESTUDIAN_CUENTA_CO_CARRERA foreign key (IDCARRERA)
      references CARRERA (IDCARRERA)
      on delete restrict on update restrict
   
);
/*==============================================================*/
/* Table: ASIGNATURA                                            */
/*==============================================================*/
create table ASIGNATURA (
   IDASIGNATURA         SERIAL                not null,
   IDNIVEL              INT4                 not null,
   DESCRIPCION_ASIGNATURA CHAR(40)             not null,
   constraint PK_ASIGNATURA primary key (IDASIGNATURA),
   constraint FK_ASIGNATU_TIENE_MUC_NIVEL foreign key (IDNIVEL)
      references NIVEL (IDNIVEL)
      on delete restrict on update restrict
   
);
/*==============================================================*/
/* Table: INSCRIPCION                                           */
/*==============================================================*/
create table INSCRIPCION (
   IDINSCRIPCION        SERIAL                 not null,
   IDASIGNATURA         INT4                 not null,
   IDESTUDIANTE         INT4                 not null,
   constraint PK_INSCRIPCION primary key (IDINSCRIPCION),
   constraint FK_INSCRIPC_ES_INSCRI_ASIGNATU foreign key (IDASIGNATURA)
      references ASIGNATURA (IDASIGNATURA)
      on delete restrict on update restrict,
      constraint FK_INSCRIPC_SE_INCRIB_ESTUDIAN foreign key (IDESTUDIANTE)
      references ESTUDIANTE (IDESTUDIANTE)
      on delete restrict on update restrict
      
);
/*==============================================================*/
/* Table: CARRERADOCENTE                                        */
/*==============================================================*/
create table CARRERADOCENTE (
   IDCARRERA_DOCENTE    SERIAL                not null,
   IDDOCENTE            INT4                 not null,
   IDCARRERA            INT4                 not null,
   constraint PK_CARRERADOCENTE primary key (IDCARRERA_DOCENTE),
   constraint FK_CARRERAD_CUENTA_CO_CARRERA foreign key (IDCARRERA)
      references CARRERA (IDCARRERA)
      on delete restrict on update restrict,
      constraint FK_CARRERAD_PUEDE_TEN_DOCENTE foreign key (IDDOCENTE)
      references DOCENTE (IDDOCENTE)
      on delete restrict on update restrict
      

);
/*==============================================================*/
/* Table: IMPARTIRASIGNATURA                                    */
/*==============================================================*/
create table IMPARTIRASIGNATURA (
   IDIMPARTIR           SERIAL                not null,
   IDDOCENTE            INT4                 not null,
   IDASIGNATURA         INT4                 not null,
   constraint PK_IMPARTIRASIGNATURA primary key (IDIMPARTIR),
   constraint FK_IMPARTIR_ES_IMPART_ASIGNATU foreign key (IDASIGNATURA)
      references ASIGNATURA (IDASIGNATURA)
      on delete restrict on update restrict,
      constraint FK_IMPARTIR_IMPARTE_M_DOCENTE foreign key (IDDOCENTE)
      references DOCENTE (IDDOCENTE)
      on delete restrict on update restrict
);
/*==============================================================*/
/* Table: TUTORIA                                               */
/*==============================================================*/
create table TUTORIA (
   IDTUTORIA            SERIAL                 not null,
   IDESTUDIANTE         INT4                 not null,
   IDDOCENTE            INT4                 not null,
   FECHA_TUTORIA        DATE                 not null,
   HORARIO_TUTORIA      TIME                 not null,
   MEDIO_TUTORIA        CHAR(35)             not null,
   ENLACE_TUTORIA       CHAR(500)            not null,
   constraint PK_TUTORIA primary key (IDTUTORIA),
   constraint FK_TUTORIA_DA_MUCHAS_DOCENTE foreign key (IDDOCENTE)
      references DOCENTE (IDDOCENTE)
      on delete restrict on update restrict,
      constraint FK_TUTORIA_VE_MUCHAS_ESTUDIAN foreign key (IDESTUDIANTE)
      references ESTUDIANTE (IDESTUDIANTE)
      on delete restrict on update restrict

);
/*==============================================================*/
/* Table: DETALLE_TUTORIA                                       */
/*==============================================================*/
create table DETALLE_TUTORIA (
   IDDETALLE_TUTORIA    SERIAL              not null,
   IDTUTORIA            INT4                 not null,
   TEMA_TUTORIA         CHAR(300)            not null,
   RECOMENDACIONES_TUTORIA CHAR(300)            not null,
   constraint PK_DETALLE_TUTORIA primary key (IDDETALLE_TUTORIA),
   constraint FK_DETALLE__POSEE_MUC_TUTORIA foreign key (IDTUTORIA)
      references TUTORIA (IDTUTORIA)
      on delete restrict on update restrict
   
);