/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     17/12/2020 14:59:24                          */
/*==============================================================*/


drop index UN_NIVEL__MUCHAS_ASIGNATURAS_FK;

drop index ASIGNATURA_PK;

drop table ASIGNATURA;

drop index FACULTAD_MUCHAS_CARRERAS_FK;

drop index CARRERA_PK;

drop table CARRERA;

drop index ENSENA_EN_FK;

drop index TIENE_MUCHOS_DOCENTES_FK;

drop index CARRERADOCENTE_PK;

drop table CARRERADOCENTE;

drop index DETALLE_FK;

drop index DETALLE_TUTORIA_PK;

drop table DETALLE_TUTORIA;

drop index DOCENTE_PK;

drop table DOCENTE;

drop index CARRERA_MUCHOS_ESTUDIANTES_FK;

drop index ESTUDIANTE_PK;

drop table ESTUDIANTE;

drop index FACULTAD_PK;

drop table FACULTAD;

drop index MUCHOS_DOCENTES_FK;

drop index MUCHAS_ASIGNATURAS_FK;

drop index IMPARTIRASIGNATURA_PK;

drop table IMPARTIRASIGNATURA;

drop index SE_INSCRIBEN_FK;

drop index INSCRITO_MUCAS_ASIGNATURAS_FK;

drop index INCRIPCION_PK;

drop table INCRIPCION;

drop index NIVEL_PK;

drop table NIVEL;

drop index DOCENTE_BRINDA_FK;

drop index RELATIONSHIP_10_FK;

drop index TUTORIA_PK;

drop table TUTORIA;

/*==============================================================*/
/* Table: ASIGNATURA                                            */
/*==============================================================*/
create table ASIGNATURA (
   IDASIGNATURA         INT4                 not null,
   IDNIVEL              INT4                 null,
   DESCRIPCION          CHAR(40)             not null,
   ASNIVELID            INT4                 not null,
   constraint PK_ASIGNATURA primary key (IDASIGNATURA)
);

/*==============================================================*/
/* Index: ASIGNATURA_PK                                         */
/*==============================================================*/
create unique index ASIGNATURA_PK on ASIGNATURA (
IDASIGNATURA
);

/*==============================================================*/
/* Index: UN_NIVEL__MUCHAS_ASIGNATURAS_FK                       */
/*==============================================================*/
create  index UN_NIVEL__MUCHAS_ASIGNATURAS_FK on ASIGNATURA (
IDNIVEL
);

/*==============================================================*/
/* Table: CARRERA                                               */
/*==============================================================*/
create table CARRERA (
   IDCARRERA            INT4                 not null,
   IDFACULTAD           INT4                 null,
   DESCRIPCION          CHAR(40)             not null,
   FACULTADID           INT4                 not null,
   constraint PK_CARRERA primary key (IDCARRERA)
);

/*==============================================================*/
/* Index: CARRERA_PK                                            */
/*==============================================================*/
create unique index CARRERA_PK on CARRERA (
IDCARRERA
);

/*==============================================================*/
/* Index: FACULTAD_MUCHAS_CARRERAS_FK                           */
/*==============================================================*/
create  index FACULTAD_MUCHAS_CARRERAS_FK on CARRERA (
IDFACULTAD
);

/*==============================================================*/
/* Table: CARRERADOCENTE                                        */
/*==============================================================*/
create table CARRERADOCENTE (
   IDCARRERADOCENTE     INT4                 not null,
   IDCARRERA            INT4                 null,
   IDDOCENTE            INT4                 null,
   IMCARRERAID          INT4                 not null,
   DOCENTE_ID           INT4                 not null,
   constraint PK_CARRERADOCENTE primary key (IDCARRERADOCENTE)
);

/*==============================================================*/
/* Index: CARRERADOCENTE_PK                                     */
/*==============================================================*/
create unique index CARRERADOCENTE_PK on CARRERADOCENTE (
IDCARRERADOCENTE
);

/*==============================================================*/
/* Index: TIENE_MUCHOS_DOCENTES_FK                              */
/*==============================================================*/
create  index TIENE_MUCHOS_DOCENTES_FK on CARRERADOCENTE (
IDCARRERA
);

/*==============================================================*/
/* Index: ENSENA_EN_FK                                          */
/*==============================================================*/
create  index ENSENA_EN_FK on CARRERADOCENTE (
IDDOCENTE
);

/*==============================================================*/
/* Table: DETALLE_TUTORIA                                       */
/*==============================================================*/
create table DETALLE_TUTORIA (
   IDREGISTRO           INT4                 not null,
   IDTUTORIA            INT4                 null,
   TEMA                 CHAR(300)            null,
   TUTORIAID            INT4                 not null,
   constraint PK_DETALLE_TUTORIA primary key (IDREGISTRO)
);

/*==============================================================*/
/* Index: DETALLE_TUTORIA_PK                                    */
/*==============================================================*/
create unique index DETALLE_TUTORIA_PK on DETALLE_TUTORIA (
IDREGISTRO
);

/*==============================================================*/
/* Index: DETALLE_FK                                            */
/*==============================================================*/
create  index DETALLE_FK on DETALLE_TUTORIA (
IDTUTORIA
);

/*==============================================================*/
/* Table: DOCENTE                                               */
/*==============================================================*/
create table DOCENTE (
   IDDOCENTE            INT4                 not null,
   NOMBRE               CHAR(50)             not null,
   APELLIDOS_           CHAR(50)             not null,
   PROFESION            CHAR(50)             not null,
   CEDULA               NUMERIC(11)          not null,
   constraint PK_DOCENTE primary key (IDDOCENTE)
);

/*==============================================================*/
/* Index: DOCENTE_PK                                            */
/*==============================================================*/
create unique index DOCENTE_PK on DOCENTE (
IDDOCENTE
);

/*==============================================================*/
/* Table: ESTUDIANTE                                            */
/*==============================================================*/
create table ESTUDIANTE (
   IDESTUDIANTE         INT4                 not null,
   IDCARRERA            INT4                 null,
   NOMBRES              CHAR(50)             not null,
   APELLIDOS_           CHAR(50)             not null,
   TELEFONO             NUMERIC(20)          not null,
   CEDULA               NUMERIC(11)          not null,
   IMCARRERAID          INT4                 not null,
   constraint PK_ESTUDIANTE primary key (IDESTUDIANTE)
);

/*==============================================================*/
/* Index: ESTUDIANTE_PK                                         */
/*==============================================================*/
create unique index ESTUDIANTE_PK on ESTUDIANTE (
IDESTUDIANTE
);

/*==============================================================*/
/* Index: CARRERA_MUCHOS_ESTUDIANTES_FK                         */
/*==============================================================*/
create  index CARRERA_MUCHOS_ESTUDIANTES_FK on ESTUDIANTE (
IDCARRERA
);

/*==============================================================*/
/* Table: FACULTAD                                              */
/*==============================================================*/
create table FACULTAD (
   IDFACULTAD           INT4                 not null,
   DESCRIPCION          CHAR(40)             not null,
   constraint PK_FACULTAD primary key (IDFACULTAD)
);

/*==============================================================*/
/* Index: FACULTAD_PK                                           */
/*==============================================================*/
create unique index FACULTAD_PK on FACULTAD (
IDFACULTAD
);

/*==============================================================*/
/* Table: IMPARTIRASIGNATURA                                    */
/*==============================================================*/
create table IMPARTIRASIGNATURA (
   IDIMPARTIR           INT4                 not null,
   IDASIGNATURA         INT4                 null,
   IDDOCENTE            INT4                 null,
   DOCENTE_ID           INT4                 not null,
   IMASIGNATURAID       INT4                 not null,
   constraint PK_IMPARTIRASIGNATURA primary key (IDIMPARTIR)
);

/*==============================================================*/
/* Index: IMPARTIRASIGNATURA_PK                                 */
/*==============================================================*/
create unique index IMPARTIRASIGNATURA_PK on IMPARTIRASIGNATURA (
IDIMPARTIR
);

/*==============================================================*/
/* Index: MUCHAS_ASIGNATURAS_FK                                 */
/*==============================================================*/
create  index MUCHAS_ASIGNATURAS_FK on IMPARTIRASIGNATURA (
IDDOCENTE
);

/*==============================================================*/
/* Index: MUCHOS_DOCENTES_FK                                    */
/*==============================================================*/
create  index MUCHOS_DOCENTES_FK on IMPARTIRASIGNATURA (
IDASIGNATURA
);

/*==============================================================*/
/* Table: INCRIPCION                                            */
/*==============================================================*/
create table INCRIPCION (
   IDINCRIPCION         INT4                 not null,
   IDASIGNATURA         INT4                 null,
   IDESTUDIANTE         INT4                 null,
   INESTUDIANTEID       INT4                 not null,
   INASIGNATURAID       INT4                 not null,
   constraint PK_INCRIPCION primary key (IDINCRIPCION)
);

/*==============================================================*/
/* Index: INCRIPCION_PK                                         */
/*==============================================================*/
create unique index INCRIPCION_PK on INCRIPCION (
IDINCRIPCION
);

/*==============================================================*/
/* Index: INSCRITO_MUCAS_ASIGNATURAS_FK                         */
/*==============================================================*/
create  index INSCRITO_MUCAS_ASIGNATURAS_FK on INCRIPCION (
IDESTUDIANTE
);

/*==============================================================*/
/* Index: SE_INSCRIBEN_FK                                       */
/*==============================================================*/
create  index SE_INSCRIBEN_FK on INCRIPCION (
IDASIGNATURA
);

/*==============================================================*/
/* Table: NIVEL                                                 */
/*==============================================================*/
create table NIVEL (
   IDNIVEL              INT4                 not null,
   DESCRIPCION          CHAR(40)             not null,
   constraint PK_NIVEL primary key (IDNIVEL)
);

/*==============================================================*/
/* Index: NIVEL_PK                                              */
/*==============================================================*/
create unique index NIVEL_PK on NIVEL (
IDNIVEL
);

/*==============================================================*/
/* Table: TUTORIA                                               */
/*==============================================================*/
create table TUTORIA (
   IDTUTORIA            INT4                 not null,
   IDDOCENTE            INT4                 null,
   IDESTUDIANTE         INT4                 null,
   FECHA                DATE                 not null,
   HORARIO              DATE                 not null,
   MEDIO                CHAR(70)             not null,
   ENLACEE              CHAR(300)            not null,
   DOCENTE_ID           INT4                 not null,
   INESTUDIANTEID       INT4                 not null,
   constraint PK_TUTORIA primary key (IDTUTORIA)
);

/*==============================================================*/
/* Index: TUTORIA_PK                                            */
/*==============================================================*/
create unique index TUTORIA_PK on TUTORIA (
IDTUTORIA
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_10_FK on TUTORIA (
IDESTUDIANTE
);

/*==============================================================*/
/* Index: DOCENTE_BRINDA_FK                                     */
/*==============================================================*/
create  index DOCENTE_BRINDA_FK on TUTORIA (
IDDOCENTE
);

alter table ASIGNATURA
   add constraint FK_ASIGNATU_UN_NIVEL__NIVEL foreign key (IDNIVEL)
      references NIVEL (IDNIVEL)
      on delete restrict on update restrict;

alter table CARRERA
   add constraint FK_CARRERA_FACULTAD__FACULTAD foreign key (IDFACULTAD)
      references FACULTAD (IDFACULTAD)
      on delete restrict on update restrict;

alter table CARRERADOCENTE
   add constraint FK_CARRERAD_ENSENA_EN_DOCENTE foreign key (IDDOCENTE)
      references DOCENTE (IDDOCENTE)
      on delete restrict on update restrict;

alter table CARRERADOCENTE
   add constraint FK_CARRERAD_TIENE_MUC_CARRERA foreign key (IDCARRERA)
      references CARRERA (IDCARRERA)
      on delete restrict on update restrict;

alter table DETALLE_TUTORIA
   add constraint FK_DETALLE__DETALLE_TUTORIA foreign key (IDTUTORIA)
      references TUTORIA (IDTUTORIA)
      on delete restrict on update restrict;

alter table ESTUDIANTE
   add constraint FK_ESTUDIAN_CARRERA_M_CARRERA foreign key (IDCARRERA)
      references CARRERA (IDCARRERA)
      on delete restrict on update restrict;

alter table IMPARTIRASIGNATURA
   add constraint FK_IMPARTIR_MUCHAS_AS_DOCENTE foreign key (IDDOCENTE)
      references DOCENTE (IDDOCENTE)
      on delete restrict on update restrict;

alter table IMPARTIRASIGNATURA
   add constraint FK_IMPARTIR_MUCHOS_DO_ASIGNATU foreign key (IDASIGNATURA)
      references ASIGNATURA (IDASIGNATURA)
      on delete restrict on update restrict;

alter table INCRIPCION
   add constraint FK_INCRIPCI_INSCRITO__ESTUDIAN foreign key (IDESTUDIANTE)
      references ESTUDIANTE (IDESTUDIANTE)
      on delete restrict on update restrict;

alter table INCRIPCION
   add constraint FK_INCRIPCI_SE_INSCRI_ASIGNATU foreign key (IDASIGNATURA)
      references ASIGNATURA (IDASIGNATURA)
      on delete restrict on update restrict;

alter table TUTORIA
   add constraint FK_TUTORIA_DOCENTE_B_DOCENTE foreign key (IDDOCENTE)
      references DOCENTE (IDDOCENTE)
      on delete restrict on update restrict;

alter table TUTORIA
   add constraint FK_TUTORIA_RELATIONS_ESTUDIAN foreign key (IDESTUDIANTE)
      references ESTUDIANTE (IDESTUDIANTE)
      on delete restrict on update restrict;

