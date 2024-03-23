/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     23/03/2024 6:03:18 p. m.                     */
/*==============================================================*/


drop index DEPARTAMENTO_PK;

drop table DEPARTAMENTO;

drop index REGISTRO_CIVIL_MATRIMONIO___DOC;

drop index DOCUMETO_ACREDITACION___TIPO_DO;

drop index DOCUMENTO_ACREDITACION_PK;

drop table DOCUMENTO_ACREDITACION;

drop index FACTOR_RH_RECIEN_NACIDO_PK;

drop table FACTOR_RH_RECIEN_NACIDO;

drop index PERSONA_FIRMA_PERSONA_FK;

drop index FIRMA_PERSONA_PK;

drop table FIRMA_PERSONA;

drop index GRUPO_SANGUINEO_RECIEN_NACIDO_P;

drop table GRUPO_SANGUINEO_RECIEN_NACIDO;

drop index PERSONA___HIJO_LEGITIMADO2_FK;

drop index REGISTRO_CIVIL_MATRIMONIO___HIJ;

drop index HIJO_LEGITIMADO_PK;

drop table HIJO_LEGITIMADO;

drop index LUGAR_DEPARTAMENTO_FK;

drop index LUGAR___MUNICIPIO_FK;

drop index LUGAR___PAIS_FK;

drop index LUGAR_PK;

drop table LUGAR;

drop index MUNICIPIO_PK;

drop table MUNICIPIO;

drop index NACIONALIDAD_PERSONA_PK;

drop table NACIONALIDAD_PERSONA;

drop index OFICINA_EXPEDICION___TIPO_OFICI;

drop index LUGAR___OFICINA_EXPEDICION_FK;

drop index OFICINA_EXPEDICION_PK;

drop table OFICINA_EXPEDICION;

drop index PAIS_PK;

drop table PAIS;

drop index PERSONA_FIRMA_PERSONA2_FK;

drop index PERSONA_TIPO_DOCUMENTO_FK;

drop index PERSONA___NACIONALIDAD_PERSONA_;

drop index PERSONA___HIJO_LEGITIMADO_FK;

drop index PERSONA_PK;

drop table PERSONA;

drop index PERSONA___PERSONA_RCM_FK;

drop index REGISTRO_CIVIL_MATRIMONIO___PER;

drop index PERSONA_RCM___ROL_PERSONA_RCM_F;

drop index PERSONA_RCM_PK;

drop table PERSONA_RCM;

drop index PERSONA___PERSONA_RCN_FK;

drop index REGISTRO_CIVIL_NACIMIENTO___PER;

drop index PERSONA_RCN___ROL_PERSONA_RCN_F;

drop index PERSONA_RCN_PK;

drop table PERSONA_RCN;

drop index REGISTRO_CIVIL___REGISTRO_CIVIL;

drop index REGISTRO_CIVIL_NACIMIENTO___OFI;

drop index REGISTRO_CIVIL___REGISTRO_CIVIL;

drop index REGISTRO_CIVIL_PK;

drop table REGISTRO_CIVIL;

drop index REGISTRO_CIVIL___REGISTRO_CIVIL;

drop index REGISTRO_CIVIL_MATRIMONIO___OFI;

drop index REGISTRO_CIVIL_MATRIMONIO___DOC;

drop index REGISTRO_CIVIL_MATRIMONIO___LUG;

drop index REGISTRO_CIVIL_MATRIMONIO___TIP;

drop index REGISTRO_CIVIL_MATRIMONIO_PK;

drop table REGISTRO_CIVIL_MATRIMONIO;

drop index REGISTRO_CIVIL_NACIMIENTO___FAC;

drop index REGISTRO_CIVIL_NACIMIENTO___SEX;

drop index REGISTRO_CIVIL_NACIMIENTO___GRU;

drop index REGISTRO_CIVIL_NACIMIENTO___LUG;

drop index REGISTRO_CIVIL___REGISTRO_CIVIL;

drop index REGISTRO_CIVIL_NACIMIENTO_PK;

drop table REGISTRO_CIVIL_NACIMIENTO;

drop index ROL_PERSONA_RCM_PK;

drop table ROL_PERSONA_RCM;

drop index ROL_PERSONA_RCN_PK;

drop table ROL_PERSONA_RCN;

drop index SEXO_RECIEN_NACIDO_PK;

drop table SEXO_RECIEN_NACIDO;

drop index TIPO_DOCUMENTO_PK;

drop table TIPO_DOCUMENTO;

drop index TIPO_DOCUMENTO_ACREDITACION_PK;

drop table TIPO_DOCUMENTO_ACREDITACION;

drop index TIPO_MATRIMONIO_PK;

drop table TIPO_MATRIMONIO;

drop index TIPO_OFICINA_EXPEDICION_PK;

drop table TIPO_OFICINA_EXPEDICION;

/*==============================================================*/
/* Table: DEPARTAMENTO                                          */
/*==============================================================*/
create table DEPARTAMENTO (
   DEPARTAMENTO_ID      SERIAL               not null,
   NOMBRE_DEPARTAMENTO  CHAR(30)             not null,
   constraint PK_DEPARTAMENTO primary key (DEPARTAMENTO_ID)
);

comment on table DEPARTAMENTO is
'Almacena los posibles valores de departamentos en lo que puede ocurrir un evento.';

comment on column DEPARTAMENTO.DEPARTAMENTO_ID is
'identificador único del departamento.';

comment on column DEPARTAMENTO.NOMBRE_DEPARTAMENTO is
'nombre del departamento.';

/*==============================================================*/
/* Index: DEPARTAMENTO_PK                                       */
/*==============================================================*/
create unique index DEPARTAMENTO_PK on DEPARTAMENTO (
DEPARTAMENTO_ID
);

/*==============================================================*/
/* Table: DOCUMENTO_ACREDITACION                                */
/*==============================================================*/
create table DOCUMENTO_ACREDITACION (
   TIPO_DOCUMENTO_ACREDITACION_ID INT4                 not null,
   DOCUMENTO_ACREDITACION_ID SERIAL               not null,
   TIPO_MATRIMONIO_ID   INT4                 null,
   REG_OFI_PAIS_ID      INT4                 null,
   REG_OFI_MUNICIPIO_ID CHAR(20)             null,
   REG_OFI_DEPARTAMENTO_ID INT4                 null,
   REG_OFI_LUGAR_ID     INT4                 null,
   PAIS_ID              INT4                 null,
   MUNICIPIO_ID         CHAR(20)             null,
   DEPARTAMENTO_ID      INT4                 null,
   LUGAR_ID             INT4                 null,
   REG_TIPO_DOCUMENTO_ACREDITACION INT4                 null,
   REG_DOCUMENTO_ACREDITACION_ID INT4                 null,
   REG_TIPO_OFICINA_EXPEDICION_ID INT4                 null,
   REG_OFICINA_EXPEDICION_ID INT4                 null,
   REGISTRO_CIVIL_ID    INT4                 null,
   REGISTRO_CIVIL_MATRINOMIO_ID INT4                 null,
   constraint PK_DOCUMENTO_ACREDITACION primary key (TIPO_DOCUMENTO_ACREDITACION_ID, DOCUMENTO_ACREDITACION_ID)
);

comment on table DOCUMENTO_ACREDITACION is
'Entidad que almacena la información de los documentos de acreditación para un matrimonio.';

comment on column DOCUMENTO_ACREDITACION.TIPO_DOCUMENTO_ACREDITACION_ID is
'identificador del tipo de documento de acreditación del matrimonio';

comment on column DOCUMENTO_ACREDITACION.DOCUMENTO_ACREDITACION_ID is
'identificador único de la entidad documento de acreditación.';

comment on column DOCUMENTO_ACREDITACION.TIPO_MATRIMONIO_ID is
'identificador único de la entidad tipo matrinomio.';

comment on column DOCUMENTO_ACREDITACION.REG_OFI_PAIS_ID is
'identificador único para la entidad país.';

comment on column DOCUMENTO_ACREDITACION.REG_OFI_MUNICIPIO_ID is
'identificador único del municipio.';

comment on column DOCUMENTO_ACREDITACION.REG_OFI_DEPARTAMENTO_ID is
'identificador único del departamento.';

comment on column DOCUMENTO_ACREDITACION.REG_OFI_LUGAR_ID is
'identificador único para la entidad lugar.';

comment on column DOCUMENTO_ACREDITACION.PAIS_ID is
'identificador único para la entidad país.';

comment on column DOCUMENTO_ACREDITACION.MUNICIPIO_ID is
'identificador único del municipio.';

comment on column DOCUMENTO_ACREDITACION.DEPARTAMENTO_ID is
'identificador único del departamento.';

comment on column DOCUMENTO_ACREDITACION.LUGAR_ID is
'identificador único para la entidad lugar.';

comment on column DOCUMENTO_ACREDITACION.REG_TIPO_DOCUMENTO_ACREDITACION is
'identificador del tipo de documento de acreditación del matrimonio';

comment on column DOCUMENTO_ACREDITACION.REG_DOCUMENTO_ACREDITACION_ID is
'identificador único de la entidad documento de acreditación.';

comment on column DOCUMENTO_ACREDITACION.REG_TIPO_OFICINA_EXPEDICION_ID is
'identificador único del tipo de oficina de expedición.';

comment on column DOCUMENTO_ACREDITACION.REG_OFICINA_EXPEDICION_ID is
'identificador único para la entidad Oficina de Expedición.';

comment on column DOCUMENTO_ACREDITACION.REGISTRO_CIVIL_ID is
'identificador único para la entidad Registro Civil.';

comment on column DOCUMENTO_ACREDITACION.REGISTRO_CIVIL_MATRINOMIO_ID is
'identificador único para la entidad registro civil de matriminio';

/*==============================================================*/
/* Index: DOCUMENTO_ACREDITACION_PK                             */
/*==============================================================*/
create unique index DOCUMENTO_ACREDITACION_PK on DOCUMENTO_ACREDITACION (
TIPO_DOCUMENTO_ACREDITACION_ID,
DOCUMENTO_ACREDITACION_ID
);

/*==============================================================*/
/* Index: DOCUMETO_ACREDITACION___TIPO_DO                       */
/*==============================================================*/
create  index DOCUMETO_ACREDITACION___TIPO_DO on DOCUMENTO_ACREDITACION (
TIPO_DOCUMENTO_ACREDITACION_ID
);

/*==============================================================*/
/* Index: REGISTRO_CIVIL_MATRIMONIO___DOC                       */
/*==============================================================*/
create  index REGISTRO_CIVIL_MATRIMONIO___DOC on DOCUMENTO_ACREDITACION (
TIPO_MATRIMONIO_ID,
REG_OFI_PAIS_ID,
REG_OFI_MUNICIPIO_ID,
REG_OFI_DEPARTAMENTO_ID,
REG_OFI_LUGAR_ID,
PAIS_ID,
MUNICIPIO_ID,
DEPARTAMENTO_ID,
LUGAR_ID,
REG_TIPO_DOCUMENTO_ACREDITACION,
REG_DOCUMENTO_ACREDITACION_ID,
REG_TIPO_OFICINA_EXPEDICION_ID,
REG_OFICINA_EXPEDICION_ID,
REGISTRO_CIVIL_ID,
REGISTRO_CIVIL_MATRINOMIO_ID
);

/*==============================================================*/
/* Table: FACTOR_RH_RECIEN_NACIDO                               */
/*==============================================================*/
create table FACTOR_RH_RECIEN_NACIDO (
   FACTOR_RH_ID         INT4                 not null,
   FACTOR_RH            VARCHAR(1)           not null,
   constraint PK_FACTOR_RH_RECIEN_NACIDO primary key (FACTOR_RH_ID)
);

comment on table FACTOR_RH_RECIEN_NACIDO is
'Almacena las posibles opciones para el factor RH del nacido al que se le expide el registro civil de nacimiento.';

comment on column FACTOR_RH_RECIEN_NACIDO.FACTOR_RH_ID is
'identificador único para el factor RH del recien nacido.';

comment on column FACTOR_RH_RECIEN_NACIDO.FACTOR_RH is
'este atributo hace referencia al RH del recien nacido, el cual puede ser positivo o negativo.';

/*==============================================================*/
/* Index: FACTOR_RH_RECIEN_NACIDO_PK                            */
/*==============================================================*/
create unique index FACTOR_RH_RECIEN_NACIDO_PK on FACTOR_RH_RECIEN_NACIDO (
FACTOR_RH_ID
);

/*==============================================================*/
/* Table: FIRMA_PERSONA                                         */
/*==============================================================*/
create table FIRMA_PERSONA (
   TIPO_DOCUMENTO_ID    INT4                 not null,
   PERSONA_ID           INT4                 not null,
   FIRMA_ID             SERIAL               not null,
   URL_FIRMA_PERSONA    VARCHAR(300)         not null,
   constraint PK_FIRMA_PERSONA primary key (TIPO_DOCUMENTO_ID, PERSONA_ID, FIRMA_ID)
);

comment on table FIRMA_PERSONA is
'Almacen las firmas de las personas involucradas en el registro civil.';

comment on column FIRMA_PERSONA.TIPO_DOCUMENTO_ID is
'identificador único para el tipo de documento.';

comment on column FIRMA_PERSONA.PERSONA_ID is
'identificador único de la persona involucrada en la creación del registro civil.';

comment on column FIRMA_PERSONA.FIRMA_ID is
'identificador único para la firma de una persona.';

comment on column FIRMA_PERSONA.URL_FIRMA_PERSONA is
'url asociado a una firma digital almacena de manera externa.';

/*==============================================================*/
/* Index: FIRMA_PERSONA_PK                                      */
/*==============================================================*/
create unique index FIRMA_PERSONA_PK on FIRMA_PERSONA (
TIPO_DOCUMENTO_ID,
PERSONA_ID,
FIRMA_ID
);

/*==============================================================*/
/* Index: PERSONA_FIRMA_PERSONA_FK                              */
/*==============================================================*/
create  index PERSONA_FIRMA_PERSONA_FK on FIRMA_PERSONA (
TIPO_DOCUMENTO_ID,
PERSONA_ID
);

/*==============================================================*/
/* Table: GRUPO_SANGUINEO_RECIEN_NACIDO                         */
/*==============================================================*/
create table GRUPO_SANGUINEO_RECIEN_NACIDO (
   GRUPO_SANGUINEO_ID   SERIAL               not null,
   GRUPO_SANGUINEO      VARCHAR(2)           not null,
   constraint PK_GRUPO_SANGUINEO_RECIEN_NACI primary key (GRUPO_SANGUINEO_ID)
);

comment on table GRUPO_SANGUINEO_RECIEN_NACIDO is
'Almacena las posibles opciones para el grupo sanguíneo del nacido al que se le expide el registro civil de nacimiento.';

comment on column GRUPO_SANGUINEO_RECIEN_NACIDO.GRUPO_SANGUINEO_ID is
'identificador único de la entidad grupo sanguineo.';

comment on column GRUPO_SANGUINEO_RECIEN_NACIDO.GRUPO_SANGUINEO is
'este atributo hace referencia al grupo sanguineo del recien nacido, el cual puede ser A, B, AB o O.';

/*==============================================================*/
/* Index: GRUPO_SANGUINEO_RECIEN_NACIDO_P                       */
/*==============================================================*/
create unique index GRUPO_SANGUINEO_RECIEN_NACIDO_P on GRUPO_SANGUINEO_RECIEN_NACIDO (
GRUPO_SANGUINEO_ID
);

/*==============================================================*/
/* Table: HIJO_LEGITIMADO                                       */
/*==============================================================*/
create table HIJO_LEGITIMADO (
   TIPO_MATRIMONIO_ID   INT4                 not null,
   REG_OFI_PAIS_ID      INT4                 not null,
   REG_OFI_MUNICIPIO_ID CHAR(20)             not null,
   REG_OFI_DEPARTAMENTO_ID INT4                 not null,
   REG_OFI_LUGAR_ID     INT4                 not null,
   PAIS_ID              INT4                 not null,
   MUNICIPIO_ID         CHAR(20)             not null,
   DEPARTAMENTO_ID      INT4                 not null,
   LUGAR_ID             INT4                 not null,
   TIPO_DOCUMENTO_ACREDITACION_ID INT4                 not null,
   DOCUMENTO_ACREDITACION_ID INT4                 not null,
   REG_TIPO_OFICINA_EXPEDICION_ID INT4                 not null,
   REG_OFICINA_EXPEDICION_ID INT4                 not null,
   REGISTRO_CIVIL_ID    INT4                 not null,
   REGISTRO_CIVIL_MATRINOMIO_ID INT4                 not null,
   TIPO_DOCUMENTO_ID    INT4                 not null,
   PERSONA_ID           INT4                 not null,
   HIJOS_LEGITIMADO_ID  SERIAL               not null,
   constraint PK_HIJO_LEGITIMADO primary key (TIPO_MATRIMONIO_ID, REG_OFI_PAIS_ID, REG_OFI_MUNICIPIO_ID, REG_OFI_DEPARTAMENTO_ID, REG_OFI_LUGAR_ID, PAIS_ID, MUNICIPIO_ID, DEPARTAMENTO_ID, LUGAR_ID, TIPO_DOCUMENTO_ACREDITACION_ID, DOCUMENTO_ACREDITACION_ID, REG_TIPO_OFICINA_EXPEDICION_ID, REG_OFICINA_EXPEDICION_ID, REGISTRO_CIVIL_ID, REGISTRO_CIVIL_MATRINOMIO_ID, TIPO_DOCUMENTO_ID, PERSONA_ID, HIJOS_LEGITIMADO_ID)
);

comment on table HIJO_LEGITIMADO is
'Almacena información acerca de los hijos que se hayan tenido antes del matrimonio. Esta información hace parte del registro civil de matrimonio.';

comment on column HIJO_LEGITIMADO.TIPO_MATRIMONIO_ID is
'identificador único de la entidad tipo matrinomio.';

comment on column HIJO_LEGITIMADO.REG_OFI_PAIS_ID is
'identificador único para la entidad país.';

comment on column HIJO_LEGITIMADO.REG_OFI_MUNICIPIO_ID is
'identificador único del municipio.';

comment on column HIJO_LEGITIMADO.REG_OFI_DEPARTAMENTO_ID is
'identificador único del departamento.';

comment on column HIJO_LEGITIMADO.REG_OFI_LUGAR_ID is
'identificador único para la entidad lugar.';

comment on column HIJO_LEGITIMADO.PAIS_ID is
'identificador único para la entidad país.';

comment on column HIJO_LEGITIMADO.MUNICIPIO_ID is
'identificador único del municipio.';

comment on column HIJO_LEGITIMADO.DEPARTAMENTO_ID is
'identificador único del departamento.';

comment on column HIJO_LEGITIMADO.LUGAR_ID is
'identificador único para la entidad lugar.';

comment on column HIJO_LEGITIMADO.TIPO_DOCUMENTO_ACREDITACION_ID is
'identificador del tipo de documento de acreditación del matrimonio';

comment on column HIJO_LEGITIMADO.DOCUMENTO_ACREDITACION_ID is
'identificador único de la entidad documento de acreditación.';

comment on column HIJO_LEGITIMADO.REG_TIPO_OFICINA_EXPEDICION_ID is
'identificador único del tipo de oficina de expedición.';

comment on column HIJO_LEGITIMADO.REG_OFICINA_EXPEDICION_ID is
'identificador único para la entidad Oficina de Expedición.';

comment on column HIJO_LEGITIMADO.REGISTRO_CIVIL_ID is
'identificador único para la entidad Registro Civil.';

comment on column HIJO_LEGITIMADO.REGISTRO_CIVIL_MATRINOMIO_ID is
'identificador único para la entidad registro civil de matriminio';

comment on column HIJO_LEGITIMADO.TIPO_DOCUMENTO_ID is
'identificador único para el tipo de documento.';

comment on column HIJO_LEGITIMADO.PERSONA_ID is
'identificador único de la persona involucrada en la creación del registro civil.';

comment on column HIJO_LEGITIMADO.HIJOS_LEGITIMADO_ID is
'identificador único de los hijos legitimados en un matrimonio.';

/*==============================================================*/
/* Index: HIJO_LEGITIMADO_PK                                    */
/*==============================================================*/
create unique index HIJO_LEGITIMADO_PK on HIJO_LEGITIMADO (
TIPO_MATRIMONIO_ID,
REG_OFI_PAIS_ID,
REG_OFI_MUNICIPIO_ID,
REG_OFI_DEPARTAMENTO_ID,
REG_OFI_LUGAR_ID,
PAIS_ID,
MUNICIPIO_ID,
DEPARTAMENTO_ID,
LUGAR_ID,
TIPO_DOCUMENTO_ACREDITACION_ID,
DOCUMENTO_ACREDITACION_ID,
REG_TIPO_OFICINA_EXPEDICION_ID,
REG_OFICINA_EXPEDICION_ID,
REGISTRO_CIVIL_ID,
REGISTRO_CIVIL_MATRINOMIO_ID,
TIPO_DOCUMENTO_ID,
PERSONA_ID,
HIJOS_LEGITIMADO_ID
);

/*==============================================================*/
/* Index: REGISTRO_CIVIL_MATRIMONIO___HIJ                       */
/*==============================================================*/
create  index REGISTRO_CIVIL_MATRIMONIO___HIJ on HIJO_LEGITIMADO (
TIPO_MATRIMONIO_ID,
REG_OFI_PAIS_ID,
REG_OFI_MUNICIPIO_ID,
REG_OFI_DEPARTAMENTO_ID,
REG_OFI_LUGAR_ID,
PAIS_ID,
MUNICIPIO_ID,
DEPARTAMENTO_ID,
LUGAR_ID,
TIPO_DOCUMENTO_ACREDITACION_ID,
DOCUMENTO_ACREDITACION_ID,
REG_TIPO_OFICINA_EXPEDICION_ID,
REG_OFICINA_EXPEDICION_ID,
REGISTRO_CIVIL_ID,
REGISTRO_CIVIL_MATRINOMIO_ID
);

/*==============================================================*/
/* Index: PERSONA___HIJO_LEGITIMADO2_FK                         */
/*==============================================================*/
create  index PERSONA___HIJO_LEGITIMADO2_FK on HIJO_LEGITIMADO (
TIPO_DOCUMENTO_ID,
PERSONA_ID
);

/*==============================================================*/
/* Table: LUGAR                                                 */
/*==============================================================*/
create table LUGAR (
   PAIS_ID              INT4                 not null,
   MUNICIPIO_ID         CHAR(20)             not null,
   DEPARTAMENTO_ID      INT4                 not null,
   LUGAR_ID             SERIAL               not null,
   constraint PK_LUGAR primary key (PAIS_ID, MUNICIPIO_ID, DEPARTAMENTO_ID, LUGAR_ID)
);

comment on table LUGAR is
'Contiene registros que son una combinación de país, departamento y municipio, esta combinación es usada en diferentes entidades para específicar lugares de expedición, nacimiento, celebración, etc.';

comment on column LUGAR.PAIS_ID is
'identificador único para la entidad país.';

comment on column LUGAR.MUNICIPIO_ID is
'identificador único del municipio.';

comment on column LUGAR.DEPARTAMENTO_ID is
'identificador único del departamento.';

comment on column LUGAR.LUGAR_ID is
'identificador único para la entidad lugar.';

/*==============================================================*/
/* Index: LUGAR_PK                                              */
/*==============================================================*/
create unique index LUGAR_PK on LUGAR (
PAIS_ID,
MUNICIPIO_ID,
DEPARTAMENTO_ID,
LUGAR_ID
);

/*==============================================================*/
/* Index: LUGAR___PAIS_FK                                       */
/*==============================================================*/
create  index LUGAR___PAIS_FK on LUGAR (
PAIS_ID
);

/*==============================================================*/
/* Index: LUGAR___MUNICIPIO_FK                                  */
/*==============================================================*/
create  index LUGAR___MUNICIPIO_FK on LUGAR (
MUNICIPIO_ID
);

/*==============================================================*/
/* Index: LUGAR_DEPARTAMENTO_FK                                 */
/*==============================================================*/
create  index LUGAR_DEPARTAMENTO_FK on LUGAR (
DEPARTAMENTO_ID
);

/*==============================================================*/
/* Table: MUNICIPIO                                             */
/*==============================================================*/
create table MUNICIPIO (
   MUNICIPIO_ID         CHAR(20)             not null,
   NOMBRE_MUNICIPIO     VARCHAR(50)          not null,
   constraint PK_MUNICIPIO primary key (MUNICIPIO_ID)
);

comment on table MUNICIPIO is
'Almacena los posibles valores de municipios en lo que puede ocurrir un evento.';

comment on column MUNICIPIO.MUNICIPIO_ID is
'identificador único del municipio.';

comment on column MUNICIPIO.NOMBRE_MUNICIPIO is
'nombre del municipio.';

/*==============================================================*/
/* Index: MUNICIPIO_PK                                          */
/*==============================================================*/
create unique index MUNICIPIO_PK on MUNICIPIO (
MUNICIPIO_ID
);

/*==============================================================*/
/* Table: NACIONALIDAD_PERSONA                                  */
/*==============================================================*/
create table NACIONALIDAD_PERSONA (
   NACIONALIDAD_ID      SERIAL               not null,
   NACIONALIDAD         VARCHAR(50)          not null,
   constraint PK_NACIONALIDAD_PERSONA primary key (NACIONALIDAD_ID)
);

comment on table NACIONALIDAD_PERSONA is
'Hace referencia a la nacionalidad de la una persona.';

comment on column NACIONALIDAD_PERSONA.NACIONALIDAD_ID is
'identificador único para la entidad nacionalidad.
';

comment on column NACIONALIDAD_PERSONA.NACIONALIDAD is
'gentilicio del país de nacimiento de la persona.';

/*==============================================================*/
/* Index: NACIONALIDAD_PERSONA_PK                               */
/*==============================================================*/
create unique index NACIONALIDAD_PERSONA_PK on NACIONALIDAD_PERSONA (
NACIONALIDAD_ID
);

/*==============================================================*/
/* Table: OFICINA_EXPEDICION                                    */
/*==============================================================*/
create table OFICINA_EXPEDICION (
   PAIS_ID              INT4                 not null,
   MUNICIPIO_ID         CHAR(20)             not null,
   DEPARTAMENTO_ID      INT4                 not null,
   LUGAR_ID             INT4                 not null,
   TIPO_OFICINA_EXPEDICION_ID INT4                 not null,
   OFICINA_EXPEDICION_ID SERIAL               not null,
   CODIGO_OE            INT4                 not null,
   constraint PK_OFICINA_EXPEDICION primary key (PAIS_ID, MUNICIPIO_ID, DEPARTAMENTO_ID, LUGAR_ID, TIPO_OFICINA_EXPEDICION_ID, OFICINA_EXPEDICION_ID)
);

comment on table OFICINA_EXPEDICION is
'Lugar de expedición del registro civil o documento de acreditación del matrimonio (solo aplica para el registro civil de matrimonio), una oficina de expedición puede expedir multiples registros civiles o documentos de acreditación. Para registro civil la oficina puede variar dependiendo del lugar donde se realiza el registro: puede ser una registraduría, una notaría, un consulado, oficina de policia o un corregimiento. Para registro civil de matrimonio puede ser parroquia, juzagado u otros.';

comment on column OFICINA_EXPEDICION.PAIS_ID is
'identificador único para la entidad país.';

comment on column OFICINA_EXPEDICION.MUNICIPIO_ID is
'identificador único del municipio.';

comment on column OFICINA_EXPEDICION.DEPARTAMENTO_ID is
'identificador único del departamento.';

comment on column OFICINA_EXPEDICION.LUGAR_ID is
'identificador único para la entidad lugar.';

comment on column OFICINA_EXPEDICION.TIPO_OFICINA_EXPEDICION_ID is
'identificador único del tipo de oficina de expedición.';

comment on column OFICINA_EXPEDICION.OFICINA_EXPEDICION_ID is
'identificador único para la entidad Oficina de Expedición.';

comment on column OFICINA_EXPEDICION.CODIGO_OE is
'código único de identificación de la oficina.';

/*==============================================================*/
/* Index: OFICINA_EXPEDICION_PK                                 */
/*==============================================================*/
create unique index OFICINA_EXPEDICION_PK on OFICINA_EXPEDICION (
PAIS_ID,
MUNICIPIO_ID,
DEPARTAMENTO_ID,
LUGAR_ID,
TIPO_OFICINA_EXPEDICION_ID,
OFICINA_EXPEDICION_ID
);

/*==============================================================*/
/* Index: LUGAR___OFICINA_EXPEDICION_FK                         */
/*==============================================================*/
create  index LUGAR___OFICINA_EXPEDICION_FK on OFICINA_EXPEDICION (
PAIS_ID,
MUNICIPIO_ID,
DEPARTAMENTO_ID,
LUGAR_ID
);

/*==============================================================*/
/* Index: OFICINA_EXPEDICION___TIPO_OFICI                       */
/*==============================================================*/
create  index OFICINA_EXPEDICION___TIPO_OFICI on OFICINA_EXPEDICION (
TIPO_OFICINA_EXPEDICION_ID
);

/*==============================================================*/
/* Table: PAIS                                                  */
/*==============================================================*/
create table PAIS (
   PAIS_ID              SERIAL               not null,
   NOMBRE_PAIS          VARCHAR(50)          not null,
   constraint PK_PAIS primary key (PAIS_ID)
);

comment on table PAIS is
'Almacena los posibles valores de paises en lo que puede ocurrir un evento.';

comment on column PAIS.PAIS_ID is
'identificador único para la entidad país.';

comment on column PAIS.NOMBRE_PAIS is
'nombre del país.';

/*==============================================================*/
/* Index: PAIS_PK                                               */
/*==============================================================*/
create unique index PAIS_PK on PAIS (
PAIS_ID
);

/*==============================================================*/
/* Table: PERSONA                                               */
/*==============================================================*/
create table PERSONA (
   TIPO_DOCUMENTO_ID    INT4                 not null,
   PERSONA_ID           SERIAL               not null,
   FIR_TIPO_DOCUMENTO_ID INT4                 null,
   FIR_PERSONA_ID       INT4                 null,
   FIRMA_ID             INT4                 null,
   NACIONALIDAD_ID      INT4                 null,
   TIPO_MATRIMONIO_ID   INT4                 null,
   REG_OFI_PAIS_ID      INT4                 null,
   REG_OFI_MUNICIPIO_ID CHAR(20)             null,
   REG_OFI_DEPARTAMENTO_ID INT4                 null,
   REG_OFI_LUGAR_ID     INT4                 null,
   PAIS_ID              INT4                 null,
   MUNICIPIO_ID         CHAR(20)             null,
   DEPARTAMENTO_ID      INT4                 null,
   LUGAR_ID             INT4                 null,
   TIPO_DOCUMENTO_ACREDITACION_ID INT4                 null,
   DOCUMENTO_ACREDITACION_ID INT4                 null,
   REG_TIPO_OFICINA_EXPEDICION_ID INT4                 null,
   REG_OFICINA_EXPEDICION_ID INT4                 null,
   REGISTRO_CIVIL_ID    INT4                 null,
   REGISTRO_CIVIL_MATRINOMIO_ID INT4                 null,
   HIJ_TIPO_DOCUMENTO_ID INT4                 null,
   HIJ_PERSONA_ID       INT4                 null,
   HIJOS_LEGITIMADO_ID  INT4                 null,
   NUIP                 INT4                 not null,
   NOMBRES              CHAR(40)             not null,
   APELLIDOS            CHAR(40)             not null,
   constraint PK_PERSONA primary key (TIPO_DOCUMENTO_ID, PERSONA_ID)
);

comment on table PERSONA is
'Almacena la información de todas las personas que se ven involucradas en la creación de un registro civil. Contiene el NUIP, nombre, apellido y en caso de ser necesario la nacionalidad y la firma de la persona.
';

comment on column PERSONA.TIPO_DOCUMENTO_ID is
'identificador único para el tipo de documento.';

comment on column PERSONA.PERSONA_ID is
'identificador único de la persona involucrada en la creación del registro civil.';

comment on column PERSONA.FIR_TIPO_DOCUMENTO_ID is
'identificador único para el tipo de documento.';

comment on column PERSONA.FIR_PERSONA_ID is
'identificador único de la persona involucrada en la creación del registro civil.';

comment on column PERSONA.FIRMA_ID is
'identificador único para la firma de una persona.';

comment on column PERSONA.NACIONALIDAD_ID is
'identificador único para la entidad nacionalidad.
';

comment on column PERSONA.TIPO_MATRIMONIO_ID is
'identificador único de la entidad tipo matrinomio.';

comment on column PERSONA.REG_OFI_PAIS_ID is
'identificador único para la entidad país.';

comment on column PERSONA.REG_OFI_MUNICIPIO_ID is
'identificador único del municipio.';

comment on column PERSONA.REG_OFI_DEPARTAMENTO_ID is
'identificador único del departamento.';

comment on column PERSONA.REG_OFI_LUGAR_ID is
'identificador único para la entidad lugar.';

comment on column PERSONA.PAIS_ID is
'identificador único para la entidad país.';

comment on column PERSONA.MUNICIPIO_ID is
'identificador único del municipio.';

comment on column PERSONA.DEPARTAMENTO_ID is
'identificador único del departamento.';

comment on column PERSONA.LUGAR_ID is
'identificador único para la entidad lugar.';

comment on column PERSONA.TIPO_DOCUMENTO_ACREDITACION_ID is
'identificador del tipo de documento de acreditación del matrimonio';

comment on column PERSONA.DOCUMENTO_ACREDITACION_ID is
'identificador único de la entidad documento de acreditación.';

comment on column PERSONA.REG_TIPO_OFICINA_EXPEDICION_ID is
'identificador único del tipo de oficina de expedición.';

comment on column PERSONA.REG_OFICINA_EXPEDICION_ID is
'identificador único para la entidad Oficina de Expedición.';

comment on column PERSONA.REGISTRO_CIVIL_ID is
'identificador único para la entidad Registro Civil.';

comment on column PERSONA.REGISTRO_CIVIL_MATRINOMIO_ID is
'identificador único para la entidad registro civil de matriminio';

comment on column PERSONA.HIJ_TIPO_DOCUMENTO_ID is
'identificador único para el tipo de documento.';

comment on column PERSONA.HIJ_PERSONA_ID is
'identificador único de la persona involucrada en la creación del registro civil.';

comment on column PERSONA.HIJOS_LEGITIMADO_ID is
'identificador único de los hijos legitimados en un matrimonio.';

comment on column PERSONA.NUIP is
'número de documento de la persona involucrada en el trámite.';

comment on column PERSONA.NOMBRES is
'nombre de la persona involucrada en la creación del registro civil.';

comment on column PERSONA.APELLIDOS is
'apellidos de la persona involucrada en la creación del registro civil.';

/*==============================================================*/
/* Index: PERSONA_PK                                            */
/*==============================================================*/
create unique index PERSONA_PK on PERSONA (
TIPO_DOCUMENTO_ID,
PERSONA_ID
);

/*==============================================================*/
/* Index: PERSONA___HIJO_LEGITIMADO_FK                          */
/*==============================================================*/
create  index PERSONA___HIJO_LEGITIMADO_FK on PERSONA (
TIPO_MATRIMONIO_ID,
REG_OFI_PAIS_ID,
REG_OFI_MUNICIPIO_ID,
REG_OFI_DEPARTAMENTO_ID,
REG_OFI_LUGAR_ID,
PAIS_ID,
MUNICIPIO_ID,
DEPARTAMENTO_ID,
LUGAR_ID,
TIPO_DOCUMENTO_ACREDITACION_ID,
DOCUMENTO_ACREDITACION_ID,
REG_TIPO_OFICINA_EXPEDICION_ID,
REG_OFICINA_EXPEDICION_ID,
REGISTRO_CIVIL_ID,
REGISTRO_CIVIL_MATRINOMIO_ID,
HIJ_TIPO_DOCUMENTO_ID,
HIJ_PERSONA_ID,
HIJOS_LEGITIMADO_ID
);

/*==============================================================*/
/* Index: PERSONA___NACIONALIDAD_PERSONA_                       */
/*==============================================================*/
create  index PERSONA___NACIONALIDAD_PERSONA_ on PERSONA (
NACIONALIDAD_ID
);

/*==============================================================*/
/* Index: PERSONA_TIPO_DOCUMENTO_FK                             */
/*==============================================================*/
create  index PERSONA_TIPO_DOCUMENTO_FK on PERSONA (
TIPO_DOCUMENTO_ID
);

/*==============================================================*/
/* Index: PERSONA_FIRMA_PERSONA2_FK                             */
/*==============================================================*/
create  index PERSONA_FIRMA_PERSONA2_FK on PERSONA (
FIR_TIPO_DOCUMENTO_ID,
FIR_PERSONA_ID,
FIRMA_ID
);

/*==============================================================*/
/* Table: PERSONA_RCM                                           */
/*==============================================================*/
create table PERSONA_RCM (
   ROL_PERSONA_RCM_ID   INT4                 not null,
   TIPO_MATRIMONIO_ID   INT4                 not null,
   REG_OFI_PAIS_ID      INT4                 not null,
   REG_OFI_MUNICIPIO_ID CHAR(20)             not null,
   REG_OFI_DEPARTAMENTO_ID INT4                 not null,
   REG_OFI_LUGAR_ID     INT4                 not null,
   PAIS_ID              INT4                 not null,
   MUNICIPIO_ID         CHAR(20)             not null,
   DEPARTAMENTO_ID      INT4                 not null,
   LUGAR_ID             INT4                 not null,
   TIPO_DOCUMENTO_ACREDITACION_ID INT4                 not null,
   DOCUMENTO_ACREDITACION_ID INT4                 not null,
   REG_TIPO_OFICINA_EXPEDICION_ID INT4                 not null,
   REG_OFICINA_EXPEDICION_ID INT4                 not null,
   REGISTRO_CIVIL_ID    INT4                 not null,
   REGISTRO_CIVIL_MATRINOMIO_ID INT4                 not null,
   TIPO_DOCUMENTO_ID    INT4                 not null,
   PERSONA_ID           INT4                 not null,
   PERSONA_RCM_ID       SERIAL               not null,
   constraint PK_PERSONA_RCM primary key (TIPO_MATRIMONIO_ID, REG_OFI_PAIS_ID, REG_OFI_MUNICIPIO_ID, REG_OFI_DEPARTAMENTO_ID, REG_OFI_LUGAR_ID, PAIS_ID, MUNICIPIO_ID, DEPARTAMENTO_ID, LUGAR_ID, TIPO_DOCUMENTO_ACREDITACION_ID, DOCUMENTO_ACREDITACION_ID, REG_TIPO_OFICINA_EXPEDICION_ID, REG_OFICINA_EXPEDICION_ID, TIPO_DOCUMENTO_ID, REGISTRO_CIVIL_ID, ROL_PERSONA_RCM_ID, REGISTRO_CIVIL_MATRINOMIO_ID, PERSONA_ID, PERSONA_RCM_ID)
);

comment on table PERSONA_RCM is
'Es la entidad intermedia que resuelve la relación de muchos a muchos entre el registro civil de matrimonio y la entidad persona; de modo que esta relaciona a las personas del registro civil de matrimonio con sus roles.';

comment on column PERSONA_RCM.ROL_PERSONA_RCM_ID is
'identificador único para la entidad rol persona.';

comment on column PERSONA_RCM.TIPO_MATRIMONIO_ID is
'identificador único de la entidad tipo matrinomio.';

comment on column PERSONA_RCM.REG_OFI_PAIS_ID is
'identificador único para la entidad país.';

comment on column PERSONA_RCM.REG_OFI_MUNICIPIO_ID is
'identificador único del municipio.';

comment on column PERSONA_RCM.REG_OFI_DEPARTAMENTO_ID is
'identificador único del departamento.';

comment on column PERSONA_RCM.REG_OFI_LUGAR_ID is
'identificador único para la entidad lugar.';

comment on column PERSONA_RCM.PAIS_ID is
'identificador único para la entidad país.';

comment on column PERSONA_RCM.MUNICIPIO_ID is
'identificador único del municipio.';

comment on column PERSONA_RCM.DEPARTAMENTO_ID is
'identificador único del departamento.';

comment on column PERSONA_RCM.LUGAR_ID is
'identificador único para la entidad lugar.';

comment on column PERSONA_RCM.TIPO_DOCUMENTO_ACREDITACION_ID is
'identificador del tipo de documento de acreditación del matrimonio';

comment on column PERSONA_RCM.DOCUMENTO_ACREDITACION_ID is
'identificador único de la entidad documento de acreditación.';

comment on column PERSONA_RCM.REG_TIPO_OFICINA_EXPEDICION_ID is
'identificador único del tipo de oficina de expedición.';

comment on column PERSONA_RCM.REG_OFICINA_EXPEDICION_ID is
'identificador único para la entidad Oficina de Expedición.';

comment on column PERSONA_RCM.REGISTRO_CIVIL_ID is
'identificador único para la entidad Registro Civil.';

comment on column PERSONA_RCM.REGISTRO_CIVIL_MATRINOMIO_ID is
'identificador único para la entidad registro civil de matriminio';

comment on column PERSONA_RCM.TIPO_DOCUMENTO_ID is
'identificador único para el tipo de documento.';

comment on column PERSONA_RCM.PERSONA_ID is
'identificador único de la persona involucrada en la creación del registro civil.';

comment on column PERSONA_RCM.PERSONA_RCM_ID is
'identificador único para la entidad persona rcm.';

/*==============================================================*/
/* Index: PERSONA_RCM_PK                                        */
/*==============================================================*/
create unique index PERSONA_RCM_PK on PERSONA_RCM (
TIPO_MATRIMONIO_ID,
REG_OFI_PAIS_ID,
REG_OFI_MUNICIPIO_ID,
REG_OFI_DEPARTAMENTO_ID,
REG_OFI_LUGAR_ID,
PAIS_ID,
MUNICIPIO_ID,
DEPARTAMENTO_ID,
LUGAR_ID,
TIPO_DOCUMENTO_ACREDITACION_ID,
DOCUMENTO_ACREDITACION_ID,
REG_TIPO_OFICINA_EXPEDICION_ID,
REG_OFICINA_EXPEDICION_ID,
TIPO_DOCUMENTO_ID,
REGISTRO_CIVIL_ID,
ROL_PERSONA_RCM_ID,
REGISTRO_CIVIL_MATRINOMIO_ID,
PERSONA_ID,
PERSONA_RCM_ID
);

/*==============================================================*/
/* Index: PERSONA_RCM___ROL_PERSONA_RCM_F                       */
/*==============================================================*/
create  index PERSONA_RCM___ROL_PERSONA_RCM_F on PERSONA_RCM (
ROL_PERSONA_RCM_ID
);

/*==============================================================*/
/* Index: REGISTRO_CIVIL_MATRIMONIO___PER                       */
/*==============================================================*/
create  index REGISTRO_CIVIL_MATRIMONIO___PER on PERSONA_RCM (
TIPO_MATRIMONIO_ID,
REG_OFI_PAIS_ID,
REG_OFI_MUNICIPIO_ID,
REG_OFI_DEPARTAMENTO_ID,
REG_OFI_LUGAR_ID,
PAIS_ID,
MUNICIPIO_ID,
DEPARTAMENTO_ID,
LUGAR_ID,
TIPO_DOCUMENTO_ACREDITACION_ID,
DOCUMENTO_ACREDITACION_ID,
REG_TIPO_OFICINA_EXPEDICION_ID,
REG_OFICINA_EXPEDICION_ID,
REGISTRO_CIVIL_ID,
REGISTRO_CIVIL_MATRINOMIO_ID
);

/*==============================================================*/
/* Index: PERSONA___PERSONA_RCM_FK                              */
/*==============================================================*/
create  index PERSONA___PERSONA_RCM_FK on PERSONA_RCM (
TIPO_DOCUMENTO_ID,
PERSONA_ID
);

/*==============================================================*/
/* Table: PERSONA_RCN                                           */
/*==============================================================*/
create table PERSONA_RCN (
   ROL_PERSONA_RCN_ID   INT4                 not null,
   OFI_PAIS_ID          INT4                 not null,
   OFI_MUNICIPIO_ID     CHAR(20)             not null,
   OFI_DEPARTAMENTO_ID  INT4                 not null,
   OFI_LUGAR_ID         INT4                 not null,
   TIPO_OFICINA_EXPEDICION_ID INT4                 not null,
   OFICINA_EXPEDICION_ID INT4                 not null,
   REGISTRO_CIVIL_ID    INT4                 not null,
   PAIS_ID              INT4                 not null,
   MUNICIPIO_ID         CHAR(20)             not null,
   DEPARTAMENTO_ID      INT4                 not null,
   LUGAR_ID             INT4                 not null,
   GRUPO_SANGUINEO_ID   INT4                 not null,
   SEXO_ID              INT4                 not null,
   FACTOR_RH_ID         INT4                 not null,
   REGISTRO_CIVIL_NACIMIENTO_ID INT4                 not null,
   TIPO_DOCUMENTO_ID    INT4                 not null,
   PERSONA_ID           INT4                 not null,
   PERSONA_RCN_ID       SERIAL               not null,
   constraint PK_PERSONA_RCN primary key (OFI_PAIS_ID, OFI_MUNICIPIO_ID, OFI_DEPARTAMENTO_ID, OFI_LUGAR_ID, TIPO_OFICINA_EXPEDICION_ID, OFICINA_EXPEDICION_ID, REGISTRO_CIVIL_ID, PAIS_ID, MUNICIPIO_ID, DEPARTAMENTO_ID, LUGAR_ID, GRUPO_SANGUINEO_ID, SEXO_ID, TIPO_DOCUMENTO_ID, FACTOR_RH_ID, ROL_PERSONA_RCN_ID, REGISTRO_CIVIL_NACIMIENTO_ID, PERSONA_ID, PERSONA_RCN_ID)
);

comment on table PERSONA_RCN is
'Es la entidad intermedia que resuelve la relación de muchos a muchos entre el registro civil de nacimiento y la entidad persona; de modo que esta relaciona a las personas del registro civil de nacimiento con sus roles.';

comment on column PERSONA_RCN.ROL_PERSONA_RCN_ID is
'identificador único para la entidad rol persona rcn.';

comment on column PERSONA_RCN.OFI_PAIS_ID is
'identificador único para la entidad país.';

comment on column PERSONA_RCN.OFI_MUNICIPIO_ID is
'identificador único del municipio.';

comment on column PERSONA_RCN.OFI_DEPARTAMENTO_ID is
'identificador único del departamento.';

comment on column PERSONA_RCN.OFI_LUGAR_ID is
'identificador único para la entidad lugar.';

comment on column PERSONA_RCN.TIPO_OFICINA_EXPEDICION_ID is
'identificador único del tipo de oficina de expedición.';

comment on column PERSONA_RCN.OFICINA_EXPEDICION_ID is
'identificador único para la entidad Oficina de Expedición.';

comment on column PERSONA_RCN.REGISTRO_CIVIL_ID is
'identificador único para la entidad Registro Civil.';

comment on column PERSONA_RCN.PAIS_ID is
'identificador único para la entidad país.';

comment on column PERSONA_RCN.MUNICIPIO_ID is
'identificador único del municipio.';

comment on column PERSONA_RCN.DEPARTAMENTO_ID is
'identificador único del departamento.';

comment on column PERSONA_RCN.LUGAR_ID is
'identificador único para la entidad lugar.';

comment on column PERSONA_RCN.GRUPO_SANGUINEO_ID is
'identificador único de la entidad grupo sanguineo.';

comment on column PERSONA_RCN.SEXO_ID is
'identificador único para la entidad sexo.';

comment on column PERSONA_RCN.FACTOR_RH_ID is
'identificador único para el factor RH del recien nacido.';

comment on column PERSONA_RCN.REGISTRO_CIVIL_NACIMIENTO_ID is
'identificador único para la entidad registro civil de nacimiento.';

comment on column PERSONA_RCN.TIPO_DOCUMENTO_ID is
'identificador único para el tipo de documento.';

comment on column PERSONA_RCN.PERSONA_ID is
'identificador único de la persona involucrada en la creación del registro civil.';

comment on column PERSONA_RCN.PERSONA_RCN_ID is
'identificador único para la entidad persona rcn.';

/*==============================================================*/
/* Index: PERSONA_RCN_PK                                        */
/*==============================================================*/
create unique index PERSONA_RCN_PK on PERSONA_RCN (
OFI_PAIS_ID,
OFI_MUNICIPIO_ID,
OFI_DEPARTAMENTO_ID,
OFI_LUGAR_ID,
TIPO_OFICINA_EXPEDICION_ID,
OFICINA_EXPEDICION_ID,
REGISTRO_CIVIL_ID,
PAIS_ID,
MUNICIPIO_ID,
DEPARTAMENTO_ID,
LUGAR_ID,
GRUPO_SANGUINEO_ID,
SEXO_ID,
TIPO_DOCUMENTO_ID,
FACTOR_RH_ID,
ROL_PERSONA_RCN_ID,
REGISTRO_CIVIL_NACIMIENTO_ID,
PERSONA_ID,
PERSONA_RCN_ID
);

/*==============================================================*/
/* Index: PERSONA_RCN___ROL_PERSONA_RCN_F                       */
/*==============================================================*/
create  index PERSONA_RCN___ROL_PERSONA_RCN_F on PERSONA_RCN (
ROL_PERSONA_RCN_ID
);

/*==============================================================*/
/* Index: REGISTRO_CIVIL_NACIMIENTO___PER                       */
/*==============================================================*/
create  index REGISTRO_CIVIL_NACIMIENTO___PER on PERSONA_RCN (
OFI_PAIS_ID,
OFI_MUNICIPIO_ID,
OFI_DEPARTAMENTO_ID,
OFI_LUGAR_ID,
TIPO_OFICINA_EXPEDICION_ID,
OFICINA_EXPEDICION_ID,
REGISTRO_CIVIL_ID,
PAIS_ID,
MUNICIPIO_ID,
DEPARTAMENTO_ID,
LUGAR_ID,
GRUPO_SANGUINEO_ID,
SEXO_ID,
FACTOR_RH_ID,
REGISTRO_CIVIL_NACIMIENTO_ID
);

/*==============================================================*/
/* Index: PERSONA___PERSONA_RCN_FK                              */
/*==============================================================*/
create  index PERSONA___PERSONA_RCN_FK on PERSONA_RCN (
TIPO_DOCUMENTO_ID,
PERSONA_ID
);

/*==============================================================*/
/* Table: REGISTRO_CIVIL                                        */
/*==============================================================*/
create table REGISTRO_CIVIL (
   OFI_PAIS_ID          INT4                 not null,
   OFI_MUNICIPIO_ID     CHAR(20)             not null,
   OFI_DEPARTAMENTO_ID  INT4                 not null,
   OFI_LUGAR_ID         INT4                 not null,
   TIPO_OFICINA_EXPEDICION_ID INT4                 not null,
   OFICINA_EXPEDICION_ID INT4                 not null,
   REGISTRO_CIVIL_ID    SERIAL               not null,
   TIPO_MATRIMONIO_ID   INT4                 null,
   REG_OFI_PAIS_ID      INT4                 null,
   REG_OFI_MUNICIPIO_ID CHAR(20)             null,
   REG_OFI_DEPARTAMENTO_ID INT4                 null,
   REG_OFI_LUGAR_ID     INT4                 null,
   REG_PAIS_ID          INT4                 null,
   REG_MUNICIPIO_ID     CHAR(20)             null,
   REG_DEPARTAMENTO_ID  INT4                 null,
   REG_LUGAR_ID         INT4                 null,
   TIPO_DOCUMENTO_ACREDITACION_ID INT4                 null,
   DOCUMENTO_ACREDITACION_ID INT4                 null,
   REG_TIPO_OFICINA_EXPEDICION_ID INT4                 null,
   REG_OFICINA_EXPEDICION_ID INT4                 null,
   REG_REGISTRO_CIVIL_ID INT4                 null,
   REGISTRO_CIVIL_MATRINOMIO_ID INT4                 null,
   REG_OFI_PAIS_ID2     INT4                 null,
   REG_OFI_MUNICIPIO_ID2 CHAR(20)             null,
   REG_OFI_DEPARTAMENTO_ID2 INT4                 null,
   REG_OFI_LUGAR_ID2    INT4                 null,
   REG_TIPO_OFICINA_EXPEDICION_ID2 INT4                 null,
   REG_OFICINA_EXPEDICION_ID2 INT4                 null,
   REG_REGISTRO_CIVIL_ID2 INT4                 null,
   PAIS_ID              INT4                 null,
   MUNICIPIO_ID         CHAR(20)             null,
   DEPARTAMENTO_ID      INT4                 null,
   LUGAR_ID             INT4                 null,
   GRUPO_SANGUINEO_ID   INT4                 null,
   SEXO_ID              INT4                 null,
   FACTOR_RH_ID         INT4                 null,
   REGISTRO_CIVIL_NACIMIENTO_ID INT4                 null,
   INDICATIVO_SERIAL_RC INT4                 not null,
   FECHA_EXPEDICION     DATE                 not null,
   constraint PK_REGISTRO_CIVIL primary key (OFI_PAIS_ID, OFI_MUNICIPIO_ID, OFI_DEPARTAMENTO_ID, OFI_LUGAR_ID, TIPO_OFICINA_EXPEDICION_ID, OFICINA_EXPEDICION_ID, REGISTRO_CIVIL_ID)
);

comment on table REGISTRO_CIVIL is
'Documento que puede ser de un solo tipo, ya sea registro civil de matrimonio o registro civil de nacimiento. Almacena información que ambos tipos de registros civiles tienen en común, como lo son la oficina de expedición y la fecha de expedición del registro civil. Posee un indicativo serial único.';

comment on column REGISTRO_CIVIL.OFI_PAIS_ID is
'identificador único para la entidad país.';

comment on column REGISTRO_CIVIL.OFI_MUNICIPIO_ID is
'identificador único del municipio.';

comment on column REGISTRO_CIVIL.OFI_DEPARTAMENTO_ID is
'identificador único del departamento.';

comment on column REGISTRO_CIVIL.OFI_LUGAR_ID is
'identificador único para la entidad lugar.';

comment on column REGISTRO_CIVIL.TIPO_OFICINA_EXPEDICION_ID is
'identificador único del tipo de oficina de expedición.';

comment on column REGISTRO_CIVIL.OFICINA_EXPEDICION_ID is
'identificador único para la entidad Oficina de Expedición.';

comment on column REGISTRO_CIVIL.REGISTRO_CIVIL_ID is
'identificador único para la entidad Registro Civil.';

comment on column REGISTRO_CIVIL.TIPO_MATRIMONIO_ID is
'identificador único de la entidad tipo matrinomio.';

comment on column REGISTRO_CIVIL.REG_OFI_PAIS_ID is
'identificador único para la entidad país.';

comment on column REGISTRO_CIVIL.REG_OFI_MUNICIPIO_ID is
'identificador único del municipio.';

comment on column REGISTRO_CIVIL.REG_OFI_DEPARTAMENTO_ID is
'identificador único del departamento.';

comment on column REGISTRO_CIVIL.REG_OFI_LUGAR_ID is
'identificador único para la entidad lugar.';

comment on column REGISTRO_CIVIL.REG_PAIS_ID is
'identificador único para la entidad país.';

comment on column REGISTRO_CIVIL.REG_MUNICIPIO_ID is
'identificador único del municipio.';

comment on column REGISTRO_CIVIL.REG_DEPARTAMENTO_ID is
'identificador único del departamento.';

comment on column REGISTRO_CIVIL.REG_LUGAR_ID is
'identificador único para la entidad lugar.';

comment on column REGISTRO_CIVIL.TIPO_DOCUMENTO_ACREDITACION_ID is
'identificador del tipo de documento de acreditación del matrimonio';

comment on column REGISTRO_CIVIL.DOCUMENTO_ACREDITACION_ID is
'identificador único de la entidad documento de acreditación.';

comment on column REGISTRO_CIVIL.REG_TIPO_OFICINA_EXPEDICION_ID is
'identificador único del tipo de oficina de expedición.';

comment on column REGISTRO_CIVIL.REG_OFICINA_EXPEDICION_ID is
'identificador único para la entidad Oficina de Expedición.';

comment on column REGISTRO_CIVIL.REG_REGISTRO_CIVIL_ID is
'identificador único para la entidad Registro Civil.';

comment on column REGISTRO_CIVIL.REGISTRO_CIVIL_MATRINOMIO_ID is
'identificador único para la entidad registro civil de matriminio';

comment on column REGISTRO_CIVIL.REG_OFI_PAIS_ID2 is
'identificador único para la entidad país.';

comment on column REGISTRO_CIVIL.REG_OFI_MUNICIPIO_ID2 is
'identificador único del municipio.';

comment on column REGISTRO_CIVIL.REG_OFI_DEPARTAMENTO_ID2 is
'identificador único del departamento.';

comment on column REGISTRO_CIVIL.REG_OFI_LUGAR_ID2 is
'identificador único para la entidad lugar.';

comment on column REGISTRO_CIVIL.REG_TIPO_OFICINA_EXPEDICION_ID2 is
'identificador único del tipo de oficina de expedición.';

comment on column REGISTRO_CIVIL.REG_OFICINA_EXPEDICION_ID2 is
'identificador único para la entidad Oficina de Expedición.';

comment on column REGISTRO_CIVIL.REG_REGISTRO_CIVIL_ID2 is
'identificador único para la entidad Registro Civil.';

comment on column REGISTRO_CIVIL.PAIS_ID is
'identificador único para la entidad país.';

comment on column REGISTRO_CIVIL.MUNICIPIO_ID is
'identificador único del municipio.';

comment on column REGISTRO_CIVIL.DEPARTAMENTO_ID is
'identificador único del departamento.';

comment on column REGISTRO_CIVIL.LUGAR_ID is
'identificador único para la entidad lugar.';

comment on column REGISTRO_CIVIL.GRUPO_SANGUINEO_ID is
'identificador único de la entidad grupo sanguineo.';

comment on column REGISTRO_CIVIL.SEXO_ID is
'identificador único para la entidad sexo.';

comment on column REGISTRO_CIVIL.FACTOR_RH_ID is
'identificador único para el factor RH del recien nacido.';

comment on column REGISTRO_CIVIL.REGISTRO_CIVIL_NACIMIENTO_ID is
'identificador único para la entidad registro civil de nacimiento.';

comment on column REGISTRO_CIVIL.INDICATIVO_SERIAL_RC is
'identifica de manera única al registro  civil que se está diligenciando. Está compuesto por 12 dígitos numéricos.';

comment on column REGISTRO_CIVIL.FECHA_EXPEDICION is
'fecha de expedición del registro civil de matrimonio.';

/*==============================================================*/
/* Index: REGISTRO_CIVIL_PK                                     */
/*==============================================================*/
create unique index REGISTRO_CIVIL_PK on REGISTRO_CIVIL (
OFI_PAIS_ID,
OFI_MUNICIPIO_ID,
OFI_DEPARTAMENTO_ID,
OFI_LUGAR_ID,
TIPO_OFICINA_EXPEDICION_ID,
OFICINA_EXPEDICION_ID,
REGISTRO_CIVIL_ID
);

/*==============================================================*/
/* Index: REGISTRO_CIVIL___REGISTRO_CIVIL                       */
/*==============================================================*/
create  index REGISTRO_CIVIL___REGISTRO_CIVIL on REGISTRO_CIVIL (
REG_OFI_PAIS_ID2,
REG_OFI_MUNICIPIO_ID2,
REG_OFI_DEPARTAMENTO_ID2,
REG_OFI_LUGAR_ID2,
REG_TIPO_OFICINA_EXPEDICION_ID2,
REG_OFICINA_EXPEDICION_ID2,
REG_REGISTRO_CIVIL_ID2,
PAIS_ID,
MUNICIPIO_ID,
DEPARTAMENTO_ID,
LUGAR_ID,
GRUPO_SANGUINEO_ID,
SEXO_ID,
FACTOR_RH_ID,
REGISTRO_CIVIL_NACIMIENTO_ID
);

/*==============================================================*/
/* Index: REGISTRO_CIVIL_NACIMIENTO___OFI                       */
/*==============================================================*/
create  index REGISTRO_CIVIL_NACIMIENTO___OFI on REGISTRO_CIVIL (
OFI_PAIS_ID,
OFI_MUNICIPIO_ID,
OFI_DEPARTAMENTO_ID,
OFI_LUGAR_ID,
TIPO_OFICINA_EXPEDICION_ID,
OFICINA_EXPEDICION_ID
);

/*==============================================================*/
/* Index: REGISTRO_CIVIL___REGISTRO_CIVIL                       */
/*==============================================================*/
create  index REGISTRO_CIVIL___REGISTRO_CIVIL on REGISTRO_CIVIL (
TIPO_MATRIMONIO_ID,
REG_OFI_PAIS_ID,
REG_OFI_MUNICIPIO_ID,
REG_OFI_DEPARTAMENTO_ID,
REG_OFI_LUGAR_ID,
REG_PAIS_ID,
REG_MUNICIPIO_ID,
REG_DEPARTAMENTO_ID,
REG_LUGAR_ID,
TIPO_DOCUMENTO_ACREDITACION_ID,
DOCUMENTO_ACREDITACION_ID,
REG_TIPO_OFICINA_EXPEDICION_ID,
REG_OFICINA_EXPEDICION_ID,
REG_REGISTRO_CIVIL_ID,
REGISTRO_CIVIL_MATRINOMIO_ID
);

/*==============================================================*/
/* Table: REGISTRO_CIVIL_MATRIMONIO                             */
/*==============================================================*/
create table REGISTRO_CIVIL_MATRIMONIO (
   TIPO_MATRIMONIO_ID   INT4                 not null,
   REG_OFI_PAIS_ID      INT4                 not null,
   REG_OFI_MUNICIPIO_ID CHAR(20)             not null,
   REG_OFI_DEPARTAMENTO_ID INT4                 not null,
   REG_OFI_LUGAR_ID     INT4                 not null,
   PAIS_ID              INT4                 not null,
   MUNICIPIO_ID         CHAR(20)             not null,
   DEPARTAMENTO_ID      INT4                 not null,
   LUGAR_ID             INT4                 not null,
   TIPO_DOCUMENTO_ACREDITACION_ID INT4                 not null,
   DOCUMENTO_ACREDITACION_ID INT4                 not null,
   REG_TIPO_OFICINA_EXPEDICION_ID INT4                 not null,
   REG_OFICINA_EXPEDICION_ID INT4                 not null,
   REGISTRO_CIVIL_ID    INT4                 not null,
   REGISTRO_CIVIL_MATRINOMIO_ID SERIAL               not null,
   OFI_PAIS_ID          INT4                 null,
   OFI_MUNICIPIO_ID     CHAR(20)             null,
   OFI_DEPARTAMENTO_ID  INT4                 null,
   OFI_LUGAR_ID         INT4                 null,
   TIPO_OFICINA_EXPEDICION_ID INT4                 null,
   OFICINA_EXPEDICION_ID INT4                 null,
   INDICATIVO_SERIAL_RCM3 INT4                 not null,
   FECHA_CELEBRACION    DATE                 not null,
   FECHA_OTORGAMIENTO_ESCRITURA_CA DATE                 null,
   NUMERO_ESCRITURA_CAPITULACIONES INT4                 null,
   constraint PK_REGISTRO_CIVIL_MATRIMONIO primary key (TIPO_MATRIMONIO_ID, REG_OFI_PAIS_ID, REG_OFI_MUNICIPIO_ID, REG_OFI_DEPARTAMENTO_ID, REG_OFI_LUGAR_ID, PAIS_ID, MUNICIPIO_ID, DEPARTAMENTO_ID, LUGAR_ID, TIPO_DOCUMENTO_ACREDITACION_ID, DOCUMENTO_ACREDITACION_ID, REG_TIPO_OFICINA_EXPEDICION_ID, REG_OFICINA_EXPEDICION_ID, REGISTRO_CIVIL_ID, REGISTRO_CIVIL_MATRINOMIO_ID)
);

comment on table REGISTRO_CIVIL_MATRIMONIO is
'Almacena datos del matrimonio que es llevado a cabo: datos de los contrayentes, datos del denunciante y datos del funcionario que certifica el registro. Posee un indicativo serial único que lo diferencia de cualquier otro registro civil. Puede llegar a tener datos de los hijos legitimados, si existian hijos previos al matrimonio.';

comment on column REGISTRO_CIVIL_MATRIMONIO.TIPO_MATRIMONIO_ID is
'identificador único de la entidad tipo matrinomio.';

comment on column REGISTRO_CIVIL_MATRIMONIO.REG_OFI_PAIS_ID is
'identificador único para la entidad país.';

comment on column REGISTRO_CIVIL_MATRIMONIO.REG_OFI_MUNICIPIO_ID is
'identificador único del municipio.';

comment on column REGISTRO_CIVIL_MATRIMONIO.REG_OFI_DEPARTAMENTO_ID is
'identificador único del departamento.';

comment on column REGISTRO_CIVIL_MATRIMONIO.REG_OFI_LUGAR_ID is
'identificador único para la entidad lugar.';

comment on column REGISTRO_CIVIL_MATRIMONIO.PAIS_ID is
'identificador único para la entidad país.';

comment on column REGISTRO_CIVIL_MATRIMONIO.MUNICIPIO_ID is
'identificador único del municipio.';

comment on column REGISTRO_CIVIL_MATRIMONIO.DEPARTAMENTO_ID is
'identificador único del departamento.';

comment on column REGISTRO_CIVIL_MATRIMONIO.LUGAR_ID is
'identificador único para la entidad lugar.';

comment on column REGISTRO_CIVIL_MATRIMONIO.TIPO_DOCUMENTO_ACREDITACION_ID is
'identificador del tipo de documento de acreditación del matrimonio';

comment on column REGISTRO_CIVIL_MATRIMONIO.DOCUMENTO_ACREDITACION_ID is
'identificador único de la entidad documento de acreditación.';

comment on column REGISTRO_CIVIL_MATRIMONIO.REG_TIPO_OFICINA_EXPEDICION_ID is
'identificador único del tipo de oficina de expedición.';

comment on column REGISTRO_CIVIL_MATRIMONIO.REG_OFICINA_EXPEDICION_ID is
'identificador único para la entidad Oficina de Expedición.';

comment on column REGISTRO_CIVIL_MATRIMONIO.REGISTRO_CIVIL_ID is
'identificador único para la entidad Registro Civil.';

comment on column REGISTRO_CIVIL_MATRIMONIO.REGISTRO_CIVIL_MATRINOMIO_ID is
'identificador único para la entidad registro civil de matriminio';

comment on column REGISTRO_CIVIL_MATRIMONIO.OFI_PAIS_ID is
'identificador único para la entidad país.';

comment on column REGISTRO_CIVIL_MATRIMONIO.OFI_MUNICIPIO_ID is
'identificador único del municipio.';

comment on column REGISTRO_CIVIL_MATRIMONIO.OFI_DEPARTAMENTO_ID is
'identificador único del departamento.';

comment on column REGISTRO_CIVIL_MATRIMONIO.OFI_LUGAR_ID is
'identificador único para la entidad lugar.';

comment on column REGISTRO_CIVIL_MATRIMONIO.TIPO_OFICINA_EXPEDICION_ID is
'identificador único del tipo de oficina de expedición.';

comment on column REGISTRO_CIVIL_MATRIMONIO.OFICINA_EXPEDICION_ID is
'identificador único para la entidad Oficina de Expedición.';

comment on column REGISTRO_CIVIL_MATRIMONIO.INDICATIVO_SERIAL_RCM3 is
'código único que identifica al registro civil.';

comment on column REGISTRO_CIVIL_MATRIMONIO.FECHA_CELEBRACION is
'se refiere a la fecha en la que se lleva a cabo un evento o ceremonia específica, como puede ser un matrimonio, una celebración religiosa, una conferencia, entre otros. Esta fecha representa el día en el que se realiza el evento o la acción principal que se está registrando.';

comment on column REGISTRO_CIVIL_MATRIMONIO.FECHA_OTORGAMIENTO_ESCRITURA_CA is
'indica la fecha en la cual se otorga la escritura de capitulaciones matrimoniales. Estas escrituras son documentos legales que establecen el régimen económico del matrimonio, definiendo los derechos y obligaciones de los cónyuges en relación con sus bienes durante el matrimonio y en caso de divorcio o fallecimiento.';

comment on column REGISTRO_CIVIL_MATRIMONIO.NUMERO_ESCRITURA_CAPITULACIONES is
'indica el número identificador asignado a la escritura de las capitulaciones matrimoniales.';

/*==============================================================*/
/* Index: REGISTRO_CIVIL_MATRIMONIO_PK                          */
/*==============================================================*/
create unique index REGISTRO_CIVIL_MATRIMONIO_PK on REGISTRO_CIVIL_MATRIMONIO (
TIPO_MATRIMONIO_ID,
REG_OFI_PAIS_ID,
REG_OFI_MUNICIPIO_ID,
REG_OFI_DEPARTAMENTO_ID,
REG_OFI_LUGAR_ID,
PAIS_ID,
MUNICIPIO_ID,
DEPARTAMENTO_ID,
LUGAR_ID,
TIPO_DOCUMENTO_ACREDITACION_ID,
DOCUMENTO_ACREDITACION_ID,
REG_TIPO_OFICINA_EXPEDICION_ID,
REG_OFICINA_EXPEDICION_ID,
REGISTRO_CIVIL_ID,
REGISTRO_CIVIL_MATRINOMIO_ID
);

/*==============================================================*/
/* Index: REGISTRO_CIVIL_MATRIMONIO___TIP                       */
/*==============================================================*/
create  index REGISTRO_CIVIL_MATRIMONIO___TIP on REGISTRO_CIVIL_MATRIMONIO (
TIPO_MATRIMONIO_ID
);

/*==============================================================*/
/* Index: REGISTRO_CIVIL_MATRIMONIO___LUG                       */
/*==============================================================*/
create  index REGISTRO_CIVIL_MATRIMONIO___LUG on REGISTRO_CIVIL_MATRIMONIO (
PAIS_ID,
MUNICIPIO_ID,
DEPARTAMENTO_ID,
LUGAR_ID
);

/*==============================================================*/
/* Index: REGISTRO_CIVIL_MATRIMONIO___DOC                       */
/*==============================================================*/
create  index REGISTRO_CIVIL_MATRIMONIO___DOC on REGISTRO_CIVIL_MATRIMONIO (
TIPO_DOCUMENTO_ACREDITACION_ID,
DOCUMENTO_ACREDITACION_ID
);

/*==============================================================*/
/* Index: REGISTRO_CIVIL_MATRIMONIO___OFI                       */
/*==============================================================*/
create  index REGISTRO_CIVIL_MATRIMONIO___OFI on REGISTRO_CIVIL_MATRIMONIO (
OFI_PAIS_ID,
OFI_MUNICIPIO_ID,
OFI_DEPARTAMENTO_ID,
OFI_LUGAR_ID,
TIPO_OFICINA_EXPEDICION_ID,
OFICINA_EXPEDICION_ID
);

/*==============================================================*/
/* Index: REGISTRO_CIVIL___REGISTRO_CIVIL                       */
/*==============================================================*/
create  index REGISTRO_CIVIL___REGISTRO_CIVIL on REGISTRO_CIVIL_MATRIMONIO (
REG_OFI_PAIS_ID,
REG_OFI_MUNICIPIO_ID,
REG_OFI_DEPARTAMENTO_ID,
REG_OFI_LUGAR_ID,
REG_TIPO_OFICINA_EXPEDICION_ID,
REG_OFICINA_EXPEDICION_ID,
REGISTRO_CIVIL_ID
);

/*==============================================================*/
/* Table: REGISTRO_CIVIL_NACIMIENTO                             */
/*==============================================================*/
create table REGISTRO_CIVIL_NACIMIENTO (
   OFI_PAIS_ID          INT4                 not null,
   OFI_MUNICIPIO_ID     CHAR(20)             not null,
   OFI_DEPARTAMENTO_ID  INT4                 not null,
   OFI_LUGAR_ID         INT4                 not null,
   TIPO_OFICINA_EXPEDICION_ID INT4                 not null,
   OFICINA_EXPEDICION_ID INT4                 not null,
   REGISTRO_CIVIL_ID    INT4                 not null,
   PAIS_ID              INT4                 not null,
   MUNICIPIO_ID         CHAR(20)             not null,
   DEPARTAMENTO_ID      INT4                 not null,
   LUGAR_ID             INT4                 not null,
   GRUPO_SANGUINEO_ID   INT4                 not null,
   SEXO_ID              INT4                 not null,
   FACTOR_RH_ID         INT4                 not null,
   REGISTRO_CIVIL_NACIMIENTO_ID SERIAL               not null,
   INDICATIVO_SERIAL_RCN INT4                 not null,
   NACIDO_VIVO          VARCHAR(8)           not null,
   FECHA_DE_NACIMIENTO  DATE                 not null,
   NOTAS                VARCHAR(1000)        null,
   constraint PK_REGISTRO_CIVIL_NACIMIENTO primary key (OFI_PAIS_ID, OFI_MUNICIPIO_ID, OFI_DEPARTAMENTO_ID, OFI_LUGAR_ID, TIPO_OFICINA_EXPEDICION_ID, OFICINA_EXPEDICION_ID, REGISTRO_CIVIL_ID, PAIS_ID, MUNICIPIO_ID, DEPARTAMENTO_ID, LUGAR_ID, GRUPO_SANGUINEO_ID, SEXO_ID, FACTOR_RH_ID, REGISTRO_CIVIL_NACIMIENTO_ID)
);

comment on table REGISTRO_CIVIL_NACIMIENTO is
'Almacena un indicativo serial único que lo diferencia de cualquier otro registro civil, un certificado de nacido vivo, la fecha de nacimiento y asigna el NUIP al recien nacido.';

comment on column REGISTRO_CIVIL_NACIMIENTO.OFI_PAIS_ID is
'identificador único para la entidad país.';

comment on column REGISTRO_CIVIL_NACIMIENTO.OFI_MUNICIPIO_ID is
'identificador único del municipio.';

comment on column REGISTRO_CIVIL_NACIMIENTO.OFI_DEPARTAMENTO_ID is
'identificador único del departamento.';

comment on column REGISTRO_CIVIL_NACIMIENTO.OFI_LUGAR_ID is
'identificador único para la entidad lugar.';

comment on column REGISTRO_CIVIL_NACIMIENTO.TIPO_OFICINA_EXPEDICION_ID is
'identificador único del tipo de oficina de expedición.';

comment on column REGISTRO_CIVIL_NACIMIENTO.OFICINA_EXPEDICION_ID is
'identificador único para la entidad Oficina de Expedición.';

comment on column REGISTRO_CIVIL_NACIMIENTO.REGISTRO_CIVIL_ID is
'identificador único para la entidad Registro Civil.';

comment on column REGISTRO_CIVIL_NACIMIENTO.PAIS_ID is
'identificador único para la entidad país.';

comment on column REGISTRO_CIVIL_NACIMIENTO.MUNICIPIO_ID is
'identificador único del municipio.';

comment on column REGISTRO_CIVIL_NACIMIENTO.DEPARTAMENTO_ID is
'identificador único del departamento.';

comment on column REGISTRO_CIVIL_NACIMIENTO.LUGAR_ID is
'identificador único para la entidad lugar.';

comment on column REGISTRO_CIVIL_NACIMIENTO.GRUPO_SANGUINEO_ID is
'identificador único de la entidad grupo sanguineo.';

comment on column REGISTRO_CIVIL_NACIMIENTO.SEXO_ID is
'identificador único para la entidad sexo.';

comment on column REGISTRO_CIVIL_NACIMIENTO.FACTOR_RH_ID is
'identificador único para el factor RH del recien nacido.';

comment on column REGISTRO_CIVIL_NACIMIENTO.REGISTRO_CIVIL_NACIMIENTO_ID is
'identificador único para la entidad registro civil de nacimiento.';

comment on column REGISTRO_CIVIL_NACIMIENTO.INDICATIVO_SERIAL_RCN is
'código único que identifica al registro civil.';

comment on column REGISTRO_CIVIL_NACIMIENTO.NACIDO_VIVO is
'suministra información básica acerca del recien nacido, confirmando que el bebe nació vivo y ofreciendo un certificado valido de la relación entre la criatura y su madre. ';

comment on column REGISTRO_CIVIL_NACIMIENTO.FECHA_DE_NACIMIENTO is
'fecha de nacimiento del recien nacido.';

comment on column REGISTRO_CIVIL_NACIMIENTO.NOTAS is
'espacio para notas reservado para casos especiales en los que se necesite dejar constancia de una situación.';

/*==============================================================*/
/* Index: REGISTRO_CIVIL_NACIMIENTO_PK                          */
/*==============================================================*/
create unique index REGISTRO_CIVIL_NACIMIENTO_PK on REGISTRO_CIVIL_NACIMIENTO (
OFI_PAIS_ID,
OFI_MUNICIPIO_ID,
OFI_DEPARTAMENTO_ID,
OFI_LUGAR_ID,
TIPO_OFICINA_EXPEDICION_ID,
OFICINA_EXPEDICION_ID,
REGISTRO_CIVIL_ID,
PAIS_ID,
MUNICIPIO_ID,
DEPARTAMENTO_ID,
LUGAR_ID,
GRUPO_SANGUINEO_ID,
SEXO_ID,
FACTOR_RH_ID,
REGISTRO_CIVIL_NACIMIENTO_ID
);

/*==============================================================*/
/* Index: REGISTRO_CIVIL___REGISTRO_CIVIL                       */
/*==============================================================*/
create  index REGISTRO_CIVIL___REGISTRO_CIVIL on REGISTRO_CIVIL_NACIMIENTO (
OFI_PAIS_ID,
OFI_MUNICIPIO_ID,
OFI_DEPARTAMENTO_ID,
OFI_LUGAR_ID,
TIPO_OFICINA_EXPEDICION_ID,
OFICINA_EXPEDICION_ID,
REGISTRO_CIVIL_ID
);

/*==============================================================*/
/* Index: REGISTRO_CIVIL_NACIMIENTO___LUG                       */
/*==============================================================*/
create  index REGISTRO_CIVIL_NACIMIENTO___LUG on REGISTRO_CIVIL_NACIMIENTO (
PAIS_ID,
MUNICIPIO_ID,
DEPARTAMENTO_ID,
LUGAR_ID
);

/*==============================================================*/
/* Index: REGISTRO_CIVIL_NACIMIENTO___GRU                       */
/*==============================================================*/
create  index REGISTRO_CIVIL_NACIMIENTO___GRU on REGISTRO_CIVIL_NACIMIENTO (
GRUPO_SANGUINEO_ID
);

/*==============================================================*/
/* Index: REGISTRO_CIVIL_NACIMIENTO___SEX                       */
/*==============================================================*/
create  index REGISTRO_CIVIL_NACIMIENTO___SEX on REGISTRO_CIVIL_NACIMIENTO (
SEXO_ID
);

/*==============================================================*/
/* Index: REGISTRO_CIVIL_NACIMIENTO___FAC                       */
/*==============================================================*/
create  index REGISTRO_CIVIL_NACIMIENTO___FAC on REGISTRO_CIVIL_NACIMIENTO (
FACTOR_RH_ID
);

/*==============================================================*/
/* Table: ROL_PERSONA_RCM                                       */
/*==============================================================*/
create table ROL_PERSONA_RCM (
   ROL_PERSONA_RCM_ID   SERIAL               not null,
   constraint PK_ROL_PERSONA_RCM primary key (ROL_PERSONA_RCM_ID)
);

comment on table ROL_PERSONA_RCM is
'Esta entidad almacena los posibles roles que una persona puede tener en el registro civil de matrimonio, sin incluir al rol "hijo legitimado".';

comment on column ROL_PERSONA_RCM.ROL_PERSONA_RCM_ID is
'identificador único para la entidad rol persona.';

/*==============================================================*/
/* Index: ROL_PERSONA_RCM_PK                                    */
/*==============================================================*/
create unique index ROL_PERSONA_RCM_PK on ROL_PERSONA_RCM (
ROL_PERSONA_RCM_ID
);

/*==============================================================*/
/* Table: ROL_PERSONA_RCN                                       */
/*==============================================================*/
create table ROL_PERSONA_RCN (
   ROL_PERSONA_RCN_ID   SERIAL               not null,
   constraint PK_ROL_PERSONA_RCN primary key (ROL_PERSONA_RCN_ID)
);

comment on table ROL_PERSONA_RCN is
'La entidad se utiliza para categorizar los distintos roles que pueden desempeñar las personas en el proceso de registro civil de nacimiento. ';

comment on column ROL_PERSONA_RCN.ROL_PERSONA_RCN_ID is
'identificador único para la entidad rol persona rcn.';

/*==============================================================*/
/* Index: ROL_PERSONA_RCN_PK                                    */
/*==============================================================*/
create unique index ROL_PERSONA_RCN_PK on ROL_PERSONA_RCN (
ROL_PERSONA_RCN_ID
);

/*==============================================================*/
/* Table: SEXO_RECIEN_NACIDO                                    */
/*==============================================================*/
create table SEXO_RECIEN_NACIDO (
   SEXO_ID              SERIAL               not null,
   SEXO                 VARCHAR(1)           not null,
   constraint PK_SEXO_RECIEN_NACIDO primary key (SEXO_ID)
);

comment on table SEXO_RECIEN_NACIDO is
'Contiene los diferentes sexos posibles para un Registro Civil de Nacimiento';

comment on column SEXO_RECIEN_NACIDO.SEXO_ID is
'identificador único para la entidad sexo.';

comment on column SEXO_RECIEN_NACIDO.SEXO is
'sexo del recien nacido, tiene dos posibles sexos: masculino y femenino.';

/*==============================================================*/
/* Index: SEXO_RECIEN_NACIDO_PK                                 */
/*==============================================================*/
create unique index SEXO_RECIEN_NACIDO_PK on SEXO_RECIEN_NACIDO (
SEXO_ID
);

/*==============================================================*/
/* Table: TIPO_DOCUMENTO                                        */
/*==============================================================*/
create table TIPO_DOCUMENTO (
   TIPO_DOCUMENTO_ID    SERIAL               not null,
   TIPO_DOCUMENTO       VARCHAR(50)          not null,
   constraint PK_TIPO_DOCUMENTO primary key (TIPO_DOCUMENTO_ID)
);

comment on table TIPO_DOCUMENTO is
'Asgina un tipo de documento (cédula de ciudadanía, cédula de extranjería, tarjeta de identidad o pasaporte) a una persona relacionada con la expedición del registro civil.';

comment on column TIPO_DOCUMENTO.TIPO_DOCUMENTO_ID is
'identificador único para el tipo de documento.';

comment on column TIPO_DOCUMENTO.TIPO_DOCUMENTO is
'el tipo de documento puede ser cédula de ciudadania, cédula de extranjeria, pasaporte o tarjeta de identidad.';

/*==============================================================*/
/* Index: TIPO_DOCUMENTO_PK                                     */
/*==============================================================*/
create unique index TIPO_DOCUMENTO_PK on TIPO_DOCUMENTO (
TIPO_DOCUMENTO_ID
);

/*==============================================================*/
/* Table: TIPO_DOCUMENTO_ACREDITACION                           */
/*==============================================================*/
create table TIPO_DOCUMENTO_ACREDITACION (
   TIPO_DOCUMENTO_ACREDITACION_ID SERIAL               not null,
   TIPO_DOCUMENTO_ACREDITACION VARCHAR(30)          not null,
   constraint PK_TIPO_DOCUMENTO_ACREDITACION primary key (TIPO_DOCUMENTO_ACREDITACION_ID)
);

comment on table TIPO_DOCUMENTO_ACREDITACION is
'Contiene los diferentes tipos del documento de acreditación para el registro civil de matrimonio.
';

comment on column TIPO_DOCUMENTO_ACREDITACION.TIPO_DOCUMENTO_ACREDITACION_ID is
'identificador del tipo de documento de acreditación del matrimonio';

comment on column TIPO_DOCUMENTO_ACREDITACION.TIPO_DOCUMENTO_ACREDITACION is
'se refiere al tipo de documento utilizado para acreditar el matrimonio. En este contexto, puede ser de dos tipos: Acta Religiosa (se refiere al documento emitido por una autoridad religiosa que certifica la realización del matrimonio según los ritos y ceremonias de una determinada religión) o escritura de protocolización (es un documento legal emitido por un notario público que certifica el matrimonio y lo protocoliza oficialmente).';

/*==============================================================*/
/* Index: TIPO_DOCUMENTO_ACREDITACION_PK                        */
/*==============================================================*/
create unique index TIPO_DOCUMENTO_ACREDITACION_PK on TIPO_DOCUMENTO_ACREDITACION (
TIPO_DOCUMENTO_ACREDITACION_ID
);

/*==============================================================*/
/* Table: TIPO_MATRIMONIO                                       */
/*==============================================================*/
create table TIPO_MATRIMONIO (
   TIPO_MATRIMONIO_ID   SERIAL               not null,
   TIPO_MATRIMINIO      CHAR(50)             not null,
   constraint PK_TIPO_MATRIMONIO primary key (TIPO_MATRIMONIO_ID)
);

comment on table TIPO_MATRIMONIO is
'Asigna una categoria al matrimonio la cual puede ser matrimonio religioso o civil.';

comment on column TIPO_MATRIMONIO.TIPO_MATRIMONIO_ID is
'identificador único de la entidad tipo matrinomio.';

comment on column TIPO_MATRIMONIO.TIPO_MATRIMINIO is
'tipo de matrimonio por el que se llevo a cabo el proceso, puede ser civil o religioso.';

/*==============================================================*/
/* Index: TIPO_MATRIMONIO_PK                                    */
/*==============================================================*/
create unique index TIPO_MATRIMONIO_PK on TIPO_MATRIMONIO (
TIPO_MATRIMONIO_ID
);

/*==============================================================*/
/* Table: TIPO_OFICINA_EXPEDICION                               */
/*==============================================================*/
create table TIPO_OFICINA_EXPEDICION (
   TIPO_OFICINA_EXPEDICION_ID SERIAL               not null,
   TIPO_OFICINA_EXPEDICION VARCHAR(25)          not null,
   constraint PK_TIPO_OFICINA_EXPEDICION primary key (TIPO_OFICINA_EXPEDICION_ID)
);

comment on table TIPO_OFICINA_EXPEDICION is
'Contiene los diferentes tipos de la oficina de expedición para un Registro Civil o un Documento de Acreditación para el Registro Civil de Matrimonio.';

comment on column TIPO_OFICINA_EXPEDICION.TIPO_OFICINA_EXPEDICION_ID is
'identificador único del tipo de oficina de expedición.';

comment on column TIPO_OFICINA_EXPEDICION.TIPO_OFICINA_EXPEDICION is
'tipo de la oficina de expedición del registro civil o documento de acreditación (RCM).';

/*==============================================================*/
/* Index: TIPO_OFICINA_EXPEDICION_PK                            */
/*==============================================================*/
create unique index TIPO_OFICINA_EXPEDICION_PK on TIPO_OFICINA_EXPEDICION (
TIPO_OFICINA_EXPEDICION_ID
);

alter table DOCUMENTO_ACREDITACION
   add constraint FK_DOCUMENT_DOCUMETO__TIPO_DOC foreign key (TIPO_DOCUMENTO_ACREDITACION_ID)
      references TIPO_DOCUMENTO_ACREDITACION (TIPO_DOCUMENTO_ACREDITACION_ID)
      on delete restrict on update restrict;

alter table DOCUMENTO_ACREDITACION
   add constraint FK_DOCUMENT_REGISTRO__REGISTRO foreign key (TIPO_MATRIMONIO_ID, REG_OFI_PAIS_ID, REG_OFI_MUNICIPIO_ID, REG_OFI_DEPARTAMENTO_ID, REG_OFI_LUGAR_ID, PAIS_ID, MUNICIPIO_ID, DEPARTAMENTO_ID, LUGAR_ID, REG_TIPO_DOCUMENTO_ACREDITACION, REG_DOCUMENTO_ACREDITACION_ID, REG_TIPO_OFICINA_EXPEDICION_ID, REG_OFICINA_EXPEDICION_ID, REGISTRO_CIVIL_ID, REGISTRO_CIVIL_MATRINOMIO_ID)
      references REGISTRO_CIVIL_MATRIMONIO (TIPO_MATRIMONIO_ID, REG_OFI_PAIS_ID, REG_OFI_MUNICIPIO_ID, REG_OFI_DEPARTAMENTO_ID, REG_OFI_LUGAR_ID, PAIS_ID, MUNICIPIO_ID, DEPARTAMENTO_ID, LUGAR_ID, TIPO_DOCUMENTO_ACREDITACION_ID, DOCUMENTO_ACREDITACION_ID, REG_TIPO_OFICINA_EXPEDICION_ID, REG_OFICINA_EXPEDICION_ID, REGISTRO_CIVIL_ID, REGISTRO_CIVIL_MATRINOMIO_ID)
      on delete restrict on update restrict;

alter table FIRMA_PERSONA
   add constraint FK_FIRMA_PE_PERSONA_F_PERSONA foreign key (TIPO_DOCUMENTO_ID, PERSONA_ID)
      references PERSONA (TIPO_DOCUMENTO_ID, PERSONA_ID)
      on delete restrict on update restrict;

alter table HIJO_LEGITIMADO
   add constraint FK_HIJO_LEG_PERSONA___PERSONA foreign key (TIPO_DOCUMENTO_ID, PERSONA_ID)
      references PERSONA (TIPO_DOCUMENTO_ID, PERSONA_ID)
      on delete restrict on update restrict;

alter table HIJO_LEGITIMADO
   add constraint FK_HIJO_LEG_REGISTRO__REGISTRO foreign key (TIPO_MATRIMONIO_ID, REG_OFI_PAIS_ID, REG_OFI_MUNICIPIO_ID, REG_OFI_DEPARTAMENTO_ID, REG_OFI_LUGAR_ID, PAIS_ID, MUNICIPIO_ID, DEPARTAMENTO_ID, LUGAR_ID, TIPO_DOCUMENTO_ACREDITACION_ID, DOCUMENTO_ACREDITACION_ID, REG_TIPO_OFICINA_EXPEDICION_ID, REG_OFICINA_EXPEDICION_ID, REGISTRO_CIVIL_ID, REGISTRO_CIVIL_MATRINOMIO_ID)
      references REGISTRO_CIVIL_MATRIMONIO (TIPO_MATRIMONIO_ID, REG_OFI_PAIS_ID, REG_OFI_MUNICIPIO_ID, REG_OFI_DEPARTAMENTO_ID, REG_OFI_LUGAR_ID, PAIS_ID, MUNICIPIO_ID, DEPARTAMENTO_ID, LUGAR_ID, TIPO_DOCUMENTO_ACREDITACION_ID, DOCUMENTO_ACREDITACION_ID, REG_TIPO_OFICINA_EXPEDICION_ID, REG_OFICINA_EXPEDICION_ID, REGISTRO_CIVIL_ID, REGISTRO_CIVIL_MATRINOMIO_ID)
      on delete restrict on update restrict;

alter table LUGAR
   add constraint FK_LUGAR_LUGAR_DEP_DEPARTAM foreign key (DEPARTAMENTO_ID)
      references DEPARTAMENTO (DEPARTAMENTO_ID)
      on delete restrict on update restrict;

alter table LUGAR
   add constraint FK_LUGAR_LUGAR___M_MUNICIPI foreign key (MUNICIPIO_ID)
      references MUNICIPIO (MUNICIPIO_ID)
      on delete restrict on update restrict;

alter table LUGAR
   add constraint FK_LUGAR_LUGAR___P_PAIS foreign key (PAIS_ID)
      references PAIS (PAIS_ID)
      on delete restrict on update restrict;

alter table OFICINA_EXPEDICION
   add constraint FK_OFICINA__LUGAR___O_LUGAR foreign key (PAIS_ID, MUNICIPIO_ID, DEPARTAMENTO_ID, LUGAR_ID)
      references LUGAR (PAIS_ID, MUNICIPIO_ID, DEPARTAMENTO_ID, LUGAR_ID)
      on delete restrict on update restrict;

alter table OFICINA_EXPEDICION
   add constraint FK_OFICINA__OFICINA_E_TIPO_OFI foreign key (TIPO_OFICINA_EXPEDICION_ID)
      references TIPO_OFICINA_EXPEDICION (TIPO_OFICINA_EXPEDICION_ID)
      on delete restrict on update restrict;

alter table PERSONA
   add constraint FK_PERSONA_PERSONA_F_FIRMA_PE foreign key (FIR_TIPO_DOCUMENTO_ID, FIR_PERSONA_ID, FIRMA_ID)
      references FIRMA_PERSONA (TIPO_DOCUMENTO_ID, PERSONA_ID, FIRMA_ID)
      on delete restrict on update restrict;

alter table PERSONA
   add constraint FK_PERSONA_PERSONA_T_TIPO_DOC foreign key (TIPO_DOCUMENTO_ID)
      references TIPO_DOCUMENTO (TIPO_DOCUMENTO_ID)
      on delete restrict on update restrict;

alter table PERSONA
   add constraint FK_PERSONA_PERSONA___HIJO_LEG foreign key (TIPO_MATRIMONIO_ID, REG_OFI_PAIS_ID, REG_OFI_MUNICIPIO_ID, REG_OFI_DEPARTAMENTO_ID, REG_OFI_LUGAR_ID, PAIS_ID, MUNICIPIO_ID, DEPARTAMENTO_ID, LUGAR_ID, TIPO_DOCUMENTO_ACREDITACION_ID, DOCUMENTO_ACREDITACION_ID, REG_TIPO_OFICINA_EXPEDICION_ID, REG_OFICINA_EXPEDICION_ID, REGISTRO_CIVIL_ID, REGISTRO_CIVIL_MATRINOMIO_ID, HIJ_TIPO_DOCUMENTO_ID, HIJ_PERSONA_ID, HIJOS_LEGITIMADO_ID)
      references HIJO_LEGITIMADO (TIPO_MATRIMONIO_ID, REG_OFI_PAIS_ID, REG_OFI_MUNICIPIO_ID, REG_OFI_DEPARTAMENTO_ID, REG_OFI_LUGAR_ID, PAIS_ID, MUNICIPIO_ID, DEPARTAMENTO_ID, LUGAR_ID, TIPO_DOCUMENTO_ACREDITACION_ID, DOCUMENTO_ACREDITACION_ID, REG_TIPO_OFICINA_EXPEDICION_ID, REG_OFICINA_EXPEDICION_ID, REGISTRO_CIVIL_ID, REGISTRO_CIVIL_MATRINOMIO_ID, TIPO_DOCUMENTO_ID, PERSONA_ID, HIJOS_LEGITIMADO_ID)
      on delete restrict on update restrict;

alter table PERSONA
   add constraint FK_PERSONA_PERSONA___NACIONAL foreign key (NACIONALIDAD_ID)
      references NACIONALIDAD_PERSONA (NACIONALIDAD_ID)
      on delete restrict on update restrict;

alter table PERSONA_RCM
   add constraint FK_PERSONA__PERSONA_R_ROL_PERS foreign key (ROL_PERSONA_RCM_ID)
      references ROL_PERSONA_RCM (ROL_PERSONA_RCM_ID)
      on delete restrict on update restrict;

alter table PERSONA_RCM
   add constraint FK_PERSONA__PERSONA___PERSONA foreign key (TIPO_DOCUMENTO_ID, PERSONA_ID)
      references PERSONA (TIPO_DOCUMENTO_ID, PERSONA_ID)
      on delete restrict on update restrict;

alter table PERSONA_RCM
   add constraint FK_PERSONA__REGISTRO__REGISTRO foreign key (TIPO_MATRIMONIO_ID, REG_OFI_PAIS_ID, REG_OFI_MUNICIPIO_ID, REG_OFI_DEPARTAMENTO_ID, REG_OFI_LUGAR_ID, PAIS_ID, MUNICIPIO_ID, DEPARTAMENTO_ID, LUGAR_ID, TIPO_DOCUMENTO_ACREDITACION_ID, DOCUMENTO_ACREDITACION_ID, REG_TIPO_OFICINA_EXPEDICION_ID, REG_OFICINA_EXPEDICION_ID, REGISTRO_CIVIL_ID, REGISTRO_CIVIL_MATRINOMIO_ID)
      references REGISTRO_CIVIL_MATRIMONIO (TIPO_MATRIMONIO_ID, REG_OFI_PAIS_ID, REG_OFI_MUNICIPIO_ID, REG_OFI_DEPARTAMENTO_ID, REG_OFI_LUGAR_ID, PAIS_ID, MUNICIPIO_ID, DEPARTAMENTO_ID, LUGAR_ID, TIPO_DOCUMENTO_ACREDITACION_ID, DOCUMENTO_ACREDITACION_ID, REG_TIPO_OFICINA_EXPEDICION_ID, REG_OFICINA_EXPEDICION_ID, REGISTRO_CIVIL_ID, REGISTRO_CIVIL_MATRINOMIO_ID)
      on delete restrict on update restrict;

alter table PERSONA_RCN
   add constraint FK_PERSONA__PERSONA_R_ROL_PERS foreign key (ROL_PERSONA_RCN_ID)
      references ROL_PERSONA_RCN (ROL_PERSONA_RCN_ID)
      on delete restrict on update restrict;

alter table PERSONA_RCN
   add constraint FK_PERSONA__PERSONA___PERSONA foreign key (TIPO_DOCUMENTO_ID, PERSONA_ID)
      references PERSONA (TIPO_DOCUMENTO_ID, PERSONA_ID)
      on delete restrict on update restrict;

alter table PERSONA_RCN
   add constraint FK_PERSONA__REGISTRO__REGISTRO foreign key (OFI_PAIS_ID, OFI_MUNICIPIO_ID, OFI_DEPARTAMENTO_ID, OFI_LUGAR_ID, TIPO_OFICINA_EXPEDICION_ID, OFICINA_EXPEDICION_ID, REGISTRO_CIVIL_ID, PAIS_ID, MUNICIPIO_ID, DEPARTAMENTO_ID, LUGAR_ID, GRUPO_SANGUINEO_ID, SEXO_ID, FACTOR_RH_ID, REGISTRO_CIVIL_NACIMIENTO_ID)
      references REGISTRO_CIVIL_NACIMIENTO (OFI_PAIS_ID, OFI_MUNICIPIO_ID, OFI_DEPARTAMENTO_ID, OFI_LUGAR_ID, TIPO_OFICINA_EXPEDICION_ID, OFICINA_EXPEDICION_ID, REGISTRO_CIVIL_ID, PAIS_ID, MUNICIPIO_ID, DEPARTAMENTO_ID, LUGAR_ID, GRUPO_SANGUINEO_ID, SEXO_ID, FACTOR_RH_ID, REGISTRO_CIVIL_NACIMIENTO_ID)
      on delete restrict on update restrict;

alter table REGISTRO_CIVIL
   add constraint FK_REGISTRO_REGISTRO__OFICINA_ foreign key (OFI_PAIS_ID, OFI_MUNICIPIO_ID, OFI_DEPARTAMENTO_ID, OFI_LUGAR_ID, TIPO_OFICINA_EXPEDICION_ID, OFICINA_EXPEDICION_ID)
      references OFICINA_EXPEDICION (PAIS_ID, MUNICIPIO_ID, DEPARTAMENTO_ID, LUGAR_ID, TIPO_OFICINA_EXPEDICION_ID, OFICINA_EXPEDICION_ID)
      on delete restrict on update restrict;

alter table REGISTRO_CIVIL
   add constraint FK_REGISTRO_REGISTRO__REGISTRO foreign key (TIPO_MATRIMONIO_ID, REG_OFI_PAIS_ID, REG_OFI_MUNICIPIO_ID, REG_OFI_DEPARTAMENTO_ID, REG_OFI_LUGAR_ID, REG_PAIS_ID, REG_MUNICIPIO_ID, REG_DEPARTAMENTO_ID, REG_LUGAR_ID, TIPO_DOCUMENTO_ACREDITACION_ID, DOCUMENTO_ACREDITACION_ID, REG_TIPO_OFICINA_EXPEDICION_ID, REG_OFICINA_EXPEDICION_ID, REG_REGISTRO_CIVIL_ID, REGISTRO_CIVIL_MATRINOMIO_ID)
      references REGISTRO_CIVIL_MATRIMONIO (TIPO_MATRIMONIO_ID, REG_OFI_PAIS_ID, REG_OFI_MUNICIPIO_ID, REG_OFI_DEPARTAMENTO_ID, REG_OFI_LUGAR_ID, PAIS_ID, MUNICIPIO_ID, DEPARTAMENTO_ID, LUGAR_ID, TIPO_DOCUMENTO_ACREDITACION_ID, DOCUMENTO_ACREDITACION_ID, REG_TIPO_OFICINA_EXPEDICION_ID, REG_OFICINA_EXPEDICION_ID, REGISTRO_CIVIL_ID, REGISTRO_CIVIL_MATRINOMIO_ID)
      on delete restrict on update restrict;

alter table REGISTRO_CIVIL
   add constraint FK_REGISTRO_REGISTRO__REGISTRO foreign key (REG_OFI_PAIS_ID2, REG_OFI_MUNICIPIO_ID2, REG_OFI_DEPARTAMENTO_ID2, REG_OFI_LUGAR_ID2, REG_TIPO_OFICINA_EXPEDICION_ID2, REG_OFICINA_EXPEDICION_ID2, REG_REGISTRO_CIVIL_ID2, PAIS_ID, MUNICIPIO_ID, DEPARTAMENTO_ID, LUGAR_ID, GRUPO_SANGUINEO_ID, SEXO_ID, FACTOR_RH_ID, REGISTRO_CIVIL_NACIMIENTO_ID)
      references REGISTRO_CIVIL_NACIMIENTO (OFI_PAIS_ID, OFI_MUNICIPIO_ID, OFI_DEPARTAMENTO_ID, OFI_LUGAR_ID, TIPO_OFICINA_EXPEDICION_ID, OFICINA_EXPEDICION_ID, REGISTRO_CIVIL_ID, PAIS_ID, MUNICIPIO_ID, DEPARTAMENTO_ID, LUGAR_ID, GRUPO_SANGUINEO_ID, SEXO_ID, FACTOR_RH_ID, REGISTRO_CIVIL_NACIMIENTO_ID)
      on delete restrict on update restrict;

alter table REGISTRO_CIVIL_MATRIMONIO
   add constraint FK_REGISTRO_REGISTRO__DOCUMENT foreign key (TIPO_DOCUMENTO_ACREDITACION_ID, DOCUMENTO_ACREDITACION_ID)
      references DOCUMENTO_ACREDITACION (TIPO_DOCUMENTO_ACREDITACION_ID, DOCUMENTO_ACREDITACION_ID)
      on delete restrict on update restrict;

alter table REGISTRO_CIVIL_MATRIMONIO
   add constraint FK_REGISTRO_REGISTRO__LUGAR foreign key (PAIS_ID, MUNICIPIO_ID, DEPARTAMENTO_ID, LUGAR_ID)
      references LUGAR (PAIS_ID, MUNICIPIO_ID, DEPARTAMENTO_ID, LUGAR_ID)
      on delete restrict on update restrict;

alter table REGISTRO_CIVIL_MATRIMONIO
   add constraint FK_REGISTRO_REGISTRO__OFICINA_ foreign key (OFI_PAIS_ID, OFI_MUNICIPIO_ID, OFI_DEPARTAMENTO_ID, OFI_LUGAR_ID, TIPO_OFICINA_EXPEDICION_ID, OFICINA_EXPEDICION_ID)
      references OFICINA_EXPEDICION (PAIS_ID, MUNICIPIO_ID, DEPARTAMENTO_ID, LUGAR_ID, TIPO_OFICINA_EXPEDICION_ID, OFICINA_EXPEDICION_ID)
      on delete restrict on update restrict;

alter table REGISTRO_CIVIL_MATRIMONIO
   add constraint FK_REGISTRO_REGISTRO__TIPO_MAT foreign key (TIPO_MATRIMONIO_ID)
      references TIPO_MATRIMONIO (TIPO_MATRIMONIO_ID)
      on delete restrict on update restrict;

alter table REGISTRO_CIVIL_MATRIMONIO
   add constraint FK_REGISTRO_REGISTRO__REGISTRO foreign key (REG_OFI_PAIS_ID, REG_OFI_MUNICIPIO_ID, REG_OFI_DEPARTAMENTO_ID, REG_OFI_LUGAR_ID, REG_TIPO_OFICINA_EXPEDICION_ID, REG_OFICINA_EXPEDICION_ID, REGISTRO_CIVIL_ID)
      references REGISTRO_CIVIL (OFI_PAIS_ID, OFI_MUNICIPIO_ID, OFI_DEPARTAMENTO_ID, OFI_LUGAR_ID, TIPO_OFICINA_EXPEDICION_ID, OFICINA_EXPEDICION_ID, REGISTRO_CIVIL_ID)
      on delete restrict on update restrict;

alter table REGISTRO_CIVIL_NACIMIENTO
   add constraint FK_REGISTRO_REGISTRO__FACTOR_R foreign key (FACTOR_RH_ID)
      references FACTOR_RH_RECIEN_NACIDO (FACTOR_RH_ID)
      on delete restrict on update restrict;

alter table REGISTRO_CIVIL_NACIMIENTO
   add constraint FK_REGISTRO_REGISTRO__GRUPO_SA foreign key (GRUPO_SANGUINEO_ID)
      references GRUPO_SANGUINEO_RECIEN_NACIDO (GRUPO_SANGUINEO_ID)
      on delete restrict on update restrict;

alter table REGISTRO_CIVIL_NACIMIENTO
   add constraint FK_REGISTRO_REGISTRO__LUGAR foreign key (PAIS_ID, MUNICIPIO_ID, DEPARTAMENTO_ID, LUGAR_ID)
      references LUGAR (PAIS_ID, MUNICIPIO_ID, DEPARTAMENTO_ID, LUGAR_ID)
      on delete restrict on update restrict;

alter table REGISTRO_CIVIL_NACIMIENTO
   add constraint FK_REGISTRO_REGISTRO__SEXO_REC foreign key (SEXO_ID)
      references SEXO_RECIEN_NACIDO (SEXO_ID)
      on delete restrict on update restrict;

alter table REGISTRO_CIVIL_NACIMIENTO
   add constraint FK_REGISTRO_REGISTRO__REGISTRO foreign key (OFI_PAIS_ID, OFI_MUNICIPIO_ID, OFI_DEPARTAMENTO_ID, OFI_LUGAR_ID, TIPO_OFICINA_EXPEDICION_ID, OFICINA_EXPEDICION_ID, REGISTRO_CIVIL_ID)
      references REGISTRO_CIVIL (OFI_PAIS_ID, OFI_MUNICIPIO_ID, OFI_DEPARTAMENTO_ID, OFI_LUGAR_ID, TIPO_OFICINA_EXPEDICION_ID, OFICINA_EXPEDICION_ID, REGISTRO_CIVIL_ID)
      on delete restrict on update restrict;

