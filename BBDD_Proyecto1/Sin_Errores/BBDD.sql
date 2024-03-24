/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     24/03/2024 3:54:58 p.�m.                     */
/*==============================================================*/


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
'identificador unico del departamento.';

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
   DOCUMENTO_ACREDITACION_ID SERIAL               not null,
   TIPO_DOCUMENTO_ACREDITACION_ID INT4                 not null,
   constraint PK_DOCUMENTO_ACREDITACION primary key (DOCUMENTO_ACREDITACION_ID)
);

comment on table DOCUMENTO_ACREDITACION is
'Entidad que almacena la informacion de los documentos de acreditacion para un matrimonio.';

comment on column DOCUMENTO_ACREDITACION.DOCUMENTO_ACREDITACION_ID is
'identificador unico de la entidad documento de acreditacion.';

comment on column DOCUMENTO_ACREDITACION.TIPO_DOCUMENTO_ACREDITACION_ID is
'identificador del tipo de documento de acreditacion del matrimonio';

/*==============================================================*/
/* Index: DOCUMENTO_ACREDITACION_PK                             */
/*==============================================================*/
create unique index DOCUMENTO_ACREDITACION_PK on DOCUMENTO_ACREDITACION (
DOCUMENTO_ACREDITACION_ID
);

/*==============================================================*/
/* Index: DOCUMETO_ACREDITACION___TIPO_DO                       */
/*==============================================================*/
create  index DOCUMETO_ACREDITACION___TIPO_DO on DOCUMENTO_ACREDITACION (
TIPO_DOCUMENTO_ACREDITACION_ID
);

/*==============================================================*/
/* Table: FACTOR_RH_RECIEN_NACIDO                               */
/*==============================================================*/
create table FACTOR_RH_RECIEN_NACIDO (
   FACTOR_RH_ID         SERIAL               not null,
   FACTOR_RH            VARCHAR(1)           not null,
   constraint PK_FACTOR_RH_RECIEN_NACIDO primary key (FACTOR_RH_ID)
);

comment on table FACTOR_RH_RECIEN_NACIDO is
'Almacena las posibles opciones para el factor RH del nacido al que se le expide el registro civil de nacimiento.';

comment on column FACTOR_RH_RECIEN_NACIDO.FACTOR_RH_ID is
'identificador unico para el factor RH del recien nacido.';

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
   FIRMA_ID             SERIAL               not null,
   PERSONA_ID           INT4                 not null,
   URL_FIRMA_PERSONA    VARCHAR(300)         not null,
   constraint PK_FIRMA_PERSONA primary key (FIRMA_ID)
);

comment on table FIRMA_PERSONA is
'Almacen las firmas de las personas involucradas en el registro civil.';

comment on column FIRMA_PERSONA.FIRMA_ID is
'identificador unico para la firma de una persona.';

comment on column FIRMA_PERSONA.PERSONA_ID is
'identificador unico de la persona involucrada en la creacion del registro civil.';

comment on column FIRMA_PERSONA.URL_FIRMA_PERSONA is
'url asociado a una firma digital almacena de manera externa.';

/*==============================================================*/
/* Index: FIRMA_PERSONA_PK                                      */
/*==============================================================*/
create unique index FIRMA_PERSONA_PK on FIRMA_PERSONA (
FIRMA_ID
);

/*==============================================================*/
/* Index: PERSONA_FIRMA_PERSONA_FK                              */
/*==============================================================*/
create  index PERSONA_FIRMA_PERSONA_FK on FIRMA_PERSONA (
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
'Almacena las posibles opciones para el grupo sanguineo del nacido al que se le expide el registro civil de nacimiento.';

comment on column GRUPO_SANGUINEO_RECIEN_NACIDO.GRUPO_SANGUINEO_ID is
'identificador unico de la entidad grupo sanguineo.';

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
   HIJOS_LEGITIMADO_ID  SERIAL               not null,
   REGISTRO_CIVIL_MATRINOMIO_ID INT4                 not null,
   PERSONA_ID           INT4                 not null,
   constraint PK_HIJO_LEGITIMADO primary key (HIJOS_LEGITIMADO_ID)
);

comment on table HIJO_LEGITIMADO is
'Almacena informacion acerca de los hijos que se hayan tenido antes del matrimonio. Esta informacion hace parte del registro civil de matrimonio.';

comment on column HIJO_LEGITIMADO.HIJOS_LEGITIMADO_ID is
'identificador unico de los hijos legitimados en un matrimonio.';

comment on column HIJO_LEGITIMADO.REGISTRO_CIVIL_MATRINOMIO_ID is
'identificador unico para la entidad registro civil de matriminio';

comment on column HIJO_LEGITIMADO.PERSONA_ID is
'identificador unico de la persona involucrada en la creacion del registro civil.';

/*==============================================================*/
/* Index: HIJO_LEGITIMADO_PK                                    */
/*==============================================================*/
create unique index HIJO_LEGITIMADO_PK on HIJO_LEGITIMADO (
HIJOS_LEGITIMADO_ID
);

/*==============================================================*/
/* Index: REGISTRO_CIVIL_MATRIMONIO___HIJ                       */
/*==============================================================*/
create  index REGISTRO_CIVIL_MATRIMONIO___HIJ on HIJO_LEGITIMADO (
REGISTRO_CIVIL_MATRINOMIO_ID
);

/*==============================================================*/
/* Index: PERSONA___HIJO_LEGITIMADO_FK                          */
/*==============================================================*/
create  index PERSONA___HIJO_LEGITIMADO_FK on HIJO_LEGITIMADO (
PERSONA_ID
);

/*==============================================================*/
/* Table: LUGAR                                                 */
/*==============================================================*/
create table LUGAR (
   LUGAR_ID             SERIAL               not null,
   DEPARTAMENTO_ID      INT4                 not null,
   PAIS_ID              INT4                 not null,
   MUNICIPIO_ID         INT4                 not null,
   constraint PK_LUGAR primary key (LUGAR_ID)
);

comment on table LUGAR is
'Contiene registros que son una combinacion de pais, departamento y municipio, esta combinacion es usada en diferentes entidades para especificar lugares de expedicion, nacimiento, celebracion, etc.';

comment on column LUGAR.LUGAR_ID is
'identificador unico para la entidad lugar.';

comment on column LUGAR.DEPARTAMENTO_ID is
'identificador unico del departamento.';

comment on column LUGAR.PAIS_ID is
'identificador unico para la entidad pais.';

comment on column LUGAR.MUNICIPIO_ID is
'identificador unico del municipio.';

/*==============================================================*/
/* Index: LUGAR_PK                                              */
/*==============================================================*/
create unique index LUGAR_PK on LUGAR (
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
   MUNICIPIO_ID         SERIAL               not null,
   NOMBRE_MUNICIPIO     VARCHAR(50)          not null,
   constraint PK_MUNICIPIO primary key (MUNICIPIO_ID)
);

comment on table MUNICIPIO is
'Almacena los posibles valores de municipios en lo que puede ocurrir un evento.';

comment on column MUNICIPIO.MUNICIPIO_ID is
'identificador unico del municipio.';

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
'identificador unico para la entidad nacionalidad.
';

comment on column NACIONALIDAD_PERSONA.NACIONALIDAD is
'gentilicio del pais de nacimiento de la persona.';

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
   OFICINA_EXPEDICION_ID SERIAL               not null,
   TIPO_OFICINA_EXPEDICION_ID INT4                 not null,
   LUGAR_ID             INT4                 not null,
   CODIGO_OE            INT4                 not null,
   NUMERO_NOTARIA       INT4                 null,
   constraint PK_OFICINA_EXPEDICION primary key (OFICINA_EXPEDICION_ID)
);

comment on table OFICINA_EXPEDICION is
'Lugar de expedicion del registro civil o documento de acreditacion del matrimonio (solo aplica para el registro civil de matrimonio), una oficina de expedicion puede expedir multiples registros civiles o documentos de acreditacion. Para registro civil la oficina puede variar dependiendo del lugar donde se realiza el registro: puede ser una registraduria, una notaria, un consulado, oficina de policia o un corregimiento. Para registro civil de matrimonio puede ser parroquia, juzagado u otros.';

comment on column OFICINA_EXPEDICION.OFICINA_EXPEDICION_ID is
'identificador unico para la entidad Oficina de Expedicion.';

comment on column OFICINA_EXPEDICION.TIPO_OFICINA_EXPEDICION_ID is
'identificador unico del tipo de oficina de expedicion.';

comment on column OFICINA_EXPEDICION.LUGAR_ID is
'identificador unico para la entidad lugar.';

comment on column OFICINA_EXPEDICION.CODIGO_OE is
'codigo unico de identificacion de la oficina.';

comment on column OFICINA_EXPEDICION.NUMERO_NOTARIA is
'numero especifico que se requiere si la oficina es una notaria, para el registro civil de nacimiento.';

/*==============================================================*/
/* Index: OFICINA_EXPEDICION_PK                                 */
/*==============================================================*/
create unique index OFICINA_EXPEDICION_PK on OFICINA_EXPEDICION (
OFICINA_EXPEDICION_ID
);

/*==============================================================*/
/* Index: LUGAR___OFICINA_EXPEDICION_FK                         */
/*==============================================================*/
create  index LUGAR___OFICINA_EXPEDICION_FK on OFICINA_EXPEDICION (
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
'identificador unico para la entidad pais.';

comment on column PAIS.NOMBRE_PAIS is
'nombre del pais.';

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
   PERSONA_ID           SERIAL               not null,
   TIPO_DOCUMENTO_ID    INT4                 not null,
   NACIONALIDAD_ID      INT4                 null,
   NUIP                 INT4                 not null,
   NOMBRES              CHAR(40)             not null,
   APELLIDOS            CHAR(40)             not null,
   constraint PK_PERSONA primary key (PERSONA_ID)
);

comment on table PERSONA is
'Almacena la informacion de todas las personas que se ven involucradas en la creacion de un registro civil. Contiene el NUIP, nombre, apellido y en caso de ser necesario la nacionalidad y la firma de la persona.
';

comment on column PERSONA.PERSONA_ID is
'identificador unico de la persona involucrada en la creacion del registro civil.';

comment on column PERSONA.TIPO_DOCUMENTO_ID is
'identificador unico para el tipo de documento.';

comment on column PERSONA.NACIONALIDAD_ID is
'identificador unico para la entidad nacionalidad.
';

comment on column PERSONA.NUIP is
'numero de documento de la persona involucrada en el tramite.';

comment on column PERSONA.NOMBRES is
'nombre de la persona involucrada en la creacion del registro civil.';

comment on column PERSONA.APELLIDOS is
'apellidos de la persona involucrada en la creacion del registro civil.';

/*==============================================================*/
/* Index: PERSONA_PK                                            */
/*==============================================================*/
create unique index PERSONA_PK on PERSONA (
PERSONA_ID
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
/* Table: PERSONA_RCM                                           */
/*==============================================================*/
create table PERSONA_RCM (
   PERSONA_RCM_ID       SERIAL               not null,
   ROL_PERSONA_RCM_ID   INT4                 not null,
   PERSONA_ID           INT4                 not null,
   REGISTRO_CIVIL_MATRINOMIO_ID INT4                 not null,
   constraint PK_PERSONA_RCM primary key (PERSONA_RCM_ID)
);

comment on table PERSONA_RCM is
'Es la entidad intermedia que resuelve la relacion de muchos a muchos entre el registro civil de matrimonio y la entidad persona; de modo que esta relaciona a las personas del registro civil de matrimonio con sus roles.';

comment on column PERSONA_RCM.PERSONA_RCM_ID is
'identificador unico para la entidad persona rcm.';

comment on column PERSONA_RCM.ROL_PERSONA_RCM_ID is
'identificador unico para la entidad rol persona.';

comment on column PERSONA_RCM.PERSONA_ID is
'identificador unico de la persona involucrada en la creacion del registro civil.';

comment on column PERSONA_RCM.REGISTRO_CIVIL_MATRINOMIO_ID is
'identificador unico para la entidad registro civil de matriminio';

/*==============================================================*/
/* Index: PERSONA_RCM_PK                                        */
/*==============================================================*/
create unique index PERSONA_RCM_PK on PERSONA_RCM (
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
REGISTRO_CIVIL_MATRINOMIO_ID
);

/*==============================================================*/
/* Index: PERSONA___PERSONA_RCM_FK                              */
/*==============================================================*/
create  index PERSONA___PERSONA_RCM_FK on PERSONA_RCM (
PERSONA_ID
);

/*==============================================================*/
/* Table: PERSONA_RCN                                           */
/*==============================================================*/
create table PERSONA_RCN (
   PERSONA_RCN_ID       SERIAL               not null,
   ROL_PERSONA_RCN_ID   INT4                 not null,
   REGISTRO_CIVIL_NACIMIENTO_ID INT4                 not null,
   PERSONA_ID           INT4                 not null,
   constraint PK_PERSONA_RCN primary key (PERSONA_RCN_ID)
);

comment on table PERSONA_RCN is
'Es la entidad intermedia que resuelve la relacion de muchos a muchos entre el registro civil de nacimiento y la entidad persona; de modo que esta relaciona a las personas del registro civil de nacimiento con sus roles.';

comment on column PERSONA_RCN.PERSONA_RCN_ID is
'identificador unico para la entidad persona rcn.';

comment on column PERSONA_RCN.ROL_PERSONA_RCN_ID is
'identificador unico para la entidad rol persona rcn.';

comment on column PERSONA_RCN.REGISTRO_CIVIL_NACIMIENTO_ID is
'identificador unico para la entidad registro civil de nacimiento.';

comment on column PERSONA_RCN.PERSONA_ID is
'identificador unico de la persona involucrada en la creacion del registro civil.';

/*==============================================================*/
/* Index: PERSONA_RCN_PK                                        */
/*==============================================================*/
create unique index PERSONA_RCN_PK on PERSONA_RCN (
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
REGISTRO_CIVIL_NACIMIENTO_ID
);

/*==============================================================*/
/* Index: PERSONA___PERSONA_RCN_FK                              */
/*==============================================================*/
create  index PERSONA___PERSONA_RCN_FK on PERSONA_RCN (
PERSONA_ID
);

/*==============================================================*/
/* Table: REGISTRO_CIVIL                                        */
/*==============================================================*/
create table REGISTRO_CIVIL (
   REGISTRO_CIVIL_ID    SERIAL               not null,
   OFICINA_EXPEDICION_ID INT4                 not null,
   INDICATIVO_SERIAL_RC INT4                 not null,
   FECHA_EXPEDICION     DATE                 not null,
   constraint PK_REGISTRO_CIVIL primary key (REGISTRO_CIVIL_ID)
);

comment on table REGISTRO_CIVIL is
'Documento que puede ser de un solo tipo, ya sea registro civil de matrimonio o registro civil de nacimiento. Almacena informacion que ambos tipos de registros civiles tienen en comun, como lo son la oficina de expedicion y la fecha de expedicion del registro civil. Posee un indicativo serial unico.';

comment on column REGISTRO_CIVIL.REGISTRO_CIVIL_ID is
'identificador unico para la entidad Registro Civil.';

comment on column REGISTRO_CIVIL.OFICINA_EXPEDICION_ID is
'identificador unico para la entidad Oficina de Expedicion.';

comment on column REGISTRO_CIVIL.INDICATIVO_SERIAL_RC is
'identifica de manera unica al registro civil que se esta diligenciando. Esta compuesto por 12 digitos numericos.';

comment on column REGISTRO_CIVIL.FECHA_EXPEDICION is
'fecha de expedicion del registro civil de matrimonio.';

/*==============================================================*/
/* Index: REGISTRO_CIVIL_PK                                     */
/*==============================================================*/
create unique index REGISTRO_CIVIL_PK on REGISTRO_CIVIL (
REGISTRO_CIVIL_ID
);

/*==============================================================*/
/* Index: REGISTRO_CIVIL_NACIMIENTO___OFI                       */
/*==============================================================*/
create  index REGISTRO_CIVIL_NACIMIENTO___OFI on REGISTRO_CIVIL (
OFICINA_EXPEDICION_ID
);

/*==============================================================*/
/* Table: REGISTRO_CIVIL_MATRIMONIO                             */
/*==============================================================*/
create table REGISTRO_CIVIL_MATRIMONIO (
   REGISTRO_CIVIL_MATRINOMIO_ID SERIAL               not null,
   TIPO_MATRIMONIO_ID   INT4                 not null,
   LUGAR_ID             INT4                 not null,
   REGISTRO_CIVIL_ID    INT4                 not null,
   DOCUMENTO_ACREDITACION_ID INT4                 not null,
   OFICINA_EXPEDICION_ID INT4                 null,
   INDICATIVO_SERIAL_RCM3 INT4                 not null,
   FECHA_CELEBRACION    DATE                 not null,
   FECHA_OTORGAMIENTO_ESCRITURA_CA DATE                 null,
   NUMERO_ESCRITURA_CAPITULACIONES INT4                 null,
   constraint PK_REGISTRO_CIVIL_MATRIMONIO primary key (REGISTRO_CIVIL_MATRINOMIO_ID)
);

comment on table REGISTRO_CIVIL_MATRIMONIO is
'Almacena datos del matrimonio que es llevado a cabo: datos de los contrayentes, datos del denunciante y datos del funcionario que certifica el registro. Posee un indicativo serial unico que lo diferencia de cualquier otro registro civil. Puede llegar a tener datos de los hijos legitimados, si existian hijos previos al matrimonio.';

comment on column REGISTRO_CIVIL_MATRIMONIO.REGISTRO_CIVIL_MATRINOMIO_ID is
'identificador unico para la entidad registro civil de matriminio';

comment on column REGISTRO_CIVIL_MATRIMONIO.TIPO_MATRIMONIO_ID is
'identificador unico de la entidad tipo matrinomio.';

comment on column REGISTRO_CIVIL_MATRIMONIO.LUGAR_ID is
'identificador unico para la entidad lugar.';

comment on column REGISTRO_CIVIL_MATRIMONIO.REGISTRO_CIVIL_ID is
'identificador unico para la entidad Registro Civil.';

comment on column REGISTRO_CIVIL_MATRIMONIO.DOCUMENTO_ACREDITACION_ID is
'identificador unico de la entidad documento de acreditacion.';

comment on column REGISTRO_CIVIL_MATRIMONIO.OFICINA_EXPEDICION_ID is
'identificador unico para la entidad Oficina de Expedicion.';

comment on column REGISTRO_CIVIL_MATRIMONIO.INDICATIVO_SERIAL_RCM3 is
'codigo unico que identifica al registro civil.';

comment on column REGISTRO_CIVIL_MATRIMONIO.FECHA_CELEBRACION is
'se refiere a la fecha en la que se lleva a cabo un evento o ceremonia especifica, como puede ser un matrimonio, una celebracion religiosa, una conferencia, entre otros. Esta fecha representa el dia en el que se realiza el evento o la accion principal que se esta registrando.';

comment on column REGISTRO_CIVIL_MATRIMONIO.FECHA_OTORGAMIENTO_ESCRITURA_CA is
'indica la fecha en la cual se otorga la escritura de capitulaciones matrimoniales. Estas escrituras son documentos legales que establecen el regimen economico del matrimonio, definiendo los derechos y obligaciones de los conyuges en relacion con sus bienes durante el matrimonio y en caso de divorcio o fallecimiento.';

comment on column REGISTRO_CIVIL_MATRIMONIO.NUMERO_ESCRITURA_CAPITULACIONES is
'indica el numero identificador asignado a la escritura de las capitulaciones matrimoniales.';

/*==============================================================*/
/* Index: REGISTRO_CIVIL_MATRIMONIO_PK                          */
/*==============================================================*/
create unique index REGISTRO_CIVIL_MATRIMONIO_PK on REGISTRO_CIVIL_MATRIMONIO (
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
LUGAR_ID
);

/*==============================================================*/
/* Index: REGISTRO_CIVIL_MATRIMONIO___DOC                       */
/*==============================================================*/
create  index REGISTRO_CIVIL_MATRIMONIO___DOC on REGISTRO_CIVIL_MATRIMONIO (
DOCUMENTO_ACREDITACION_ID
);

/*==============================================================*/
/* Index: REGISTRO_CIVIL_MATRIMONIO___OFI                       */
/*==============================================================*/
create  index REGISTRO_CIVIL_MATRIMONIO___OFI on REGISTRO_CIVIL_MATRIMONIO (
OFICINA_EXPEDICION_ID
);

/*==============================================================*/
/* Table: REGISTRO_CIVIL_NACIMIENTO                             */
/*==============================================================*/
create table REGISTRO_CIVIL_NACIMIENTO (
   REGISTRO_CIVIL_NACIMIENTO_ID SERIAL               not null,
   GRUPO_SANGUINEO_ID   INT4                 not null,
   SEXO_ID              INT4                 not null,
   LUGAR_ID             INT4                 not null,
   REGISTRO_CIVIL_ID    INT4                 not null,
   FACTOR_RH_ID         INT4                 not null,
   INDICATIVO_SERIAL_RCN INT4                 not null,
   NACIDO_VIVO          VARCHAR(12)          not null,
   FECHA_DE_NACIMIENTO  DATE                 not null,
   NOTAS                VARCHAR(1000)        null,
   constraint PK_REGISTRO_CIVIL_NACIMIENTO primary key (REGISTRO_CIVIL_NACIMIENTO_ID)
);

comment on table REGISTRO_CIVIL_NACIMIENTO is
'Almacena un indicativo serial unico que lo diferencia de cualquier otro registro civil, un certificado de nacido vivo, la fecha de nacimiento y asigna el NUIP al recien nacido.';

comment on column REGISTRO_CIVIL_NACIMIENTO.REGISTRO_CIVIL_NACIMIENTO_ID is
'identificador unico para la entidad registro civil de nacimiento.';

comment on column REGISTRO_CIVIL_NACIMIENTO.GRUPO_SANGUINEO_ID is
'identificador unico de la entidad grupo sanguineo.';

comment on column REGISTRO_CIVIL_NACIMIENTO.SEXO_ID is
'identificador unico para la entidad sexo.';

comment on column REGISTRO_CIVIL_NACIMIENTO.LUGAR_ID is
'identificador unico para la entidad lugar.';

comment on column REGISTRO_CIVIL_NACIMIENTO.REGISTRO_CIVIL_ID is
'identificador unico para la entidad Registro Civil.';

comment on column REGISTRO_CIVIL_NACIMIENTO.FACTOR_RH_ID is
'identificador unico para el factor RH del recien nacido.';

comment on column REGISTRO_CIVIL_NACIMIENTO.INDICATIVO_SERIAL_RCN is
'cdigo unico que identifica al registro civil.';

comment on column REGISTRO_CIVIL_NACIMIENTO.NACIDO_VIVO is
'suministra informacion basica acerca del recien nacido, confirmando que el bebe nacio vivo y ofreciendo un certificado valido de la relacion entre la criatura y su madre. ';

comment on column REGISTRO_CIVIL_NACIMIENTO.FECHA_DE_NACIMIENTO is
'fecha de nacimiento del recien nacido.';

comment on column REGISTRO_CIVIL_NACIMIENTO.NOTAS is
'espacio para notas reservado para casos especiales en los que se necesite dejar constancia de una situacion.';

/*==============================================================*/
/* Index: REGISTRO_CIVIL_NACIMIENTO_PK                          */
/*==============================================================*/
create unique index REGISTRO_CIVIL_NACIMIENTO_PK on REGISTRO_CIVIL_NACIMIENTO (
REGISTRO_CIVIL_NACIMIENTO_ID
);

/*==============================================================*/
/* Index: REGISTRO_CIVIL_NACIMIENTO___LUG                       */
/*==============================================================*/
create  index REGISTRO_CIVIL_NACIMIENTO___LUG on REGISTRO_CIVIL_NACIMIENTO (
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
'identificador unico para la entidad rol persona.';

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
'identificador unico para la entidad rol persona rcn.';

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
'identificador unico para la entidad sexo.';

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
'Asgina un tipo de documento (cedula de ciudadania, cedula de extranjeria, tarjeta de identidad o pasaporte) a una persona relacionada con la expedicion del registro civil.';

comment on column TIPO_DOCUMENTO.TIPO_DOCUMENTO_ID is
'identificador unico para el tipo de documento.';

comment on column TIPO_DOCUMENTO.TIPO_DOCUMENTO is
'el tipo de documento puede ser cedula de ciudadania, cedula de extranjeria, pasaporte o tarjeta de identidad.';

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
'Contiene los diferentes tipos del documento de acreditacion para el registro civil de matrimonio.
';

comment on column TIPO_DOCUMENTO_ACREDITACION.TIPO_DOCUMENTO_ACREDITACION_ID is
'identificador del tipo de documento de acreditacion del matrimonio';

comment on column TIPO_DOCUMENTO_ACREDITACION.TIPO_DOCUMENTO_ACREDITACION is
'se refiere al tipo de documento utilizado para acreditar el matrimonio. En este contexto, puede ser de dos tipos: Acta Religiosa (se refiere al documento emitido por una autoridad religiosa que certifica la realizacion del matrimonio segun los ritos y ceremonias de una determinada religion) o escritura de protocolizacion (es un documento legal emitido por un notario publico que certifica el matrimonio y lo protocoliza oficialmente).';

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
   TIPO_MATRIMINIO      VARCHAR(25)          not null,
   constraint PK_TIPO_MATRIMONIO primary key (TIPO_MATRIMONIO_ID)
);

comment on table TIPO_MATRIMONIO is
'Asigna una categoria al matrimonio la cual puede ser matrimonio religioso o civil.';

comment on column TIPO_MATRIMONIO.TIPO_MATRIMONIO_ID is
'identificador unico de la entidad tipo matrinomio.';

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
'Contiene los diferentes tipos de la oficina de expedicion para un Registro Civil o un Documento de Acreditacion para el Registro Civil de Matrimonio.';

comment on column TIPO_OFICINA_EXPEDICION.TIPO_OFICINA_EXPEDICION_ID is
'identificador unico del tipo de oficina de expedicion.';

comment on column TIPO_OFICINA_EXPEDICION.TIPO_OFICINA_EXPEDICION is
'tipo de la oficina de expedicion del registro civil o documento de acreditacion (RCM).';

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

alter table FIRMA_PERSONA
   add constraint FK_FIRMA_PE_PERSONA_F_PERSONA foreign key (PERSONA_ID)
      references PERSONA (PERSONA_ID)
      on delete restrict on update restrict;

alter table HIJO_LEGITIMADO
   add constraint FK_HIJO_LEG_PERSONA___PERSONA foreign key (PERSONA_ID)
      references PERSONA (PERSONA_ID)
      on delete restrict on update restrict;

alter table HIJO_LEGITIMADO
   add constraint FK_HIJO_LEG_REGISTRO__REGISTRO foreign key (REGISTRO_CIVIL_MATRINOMIO_ID)
      references REGISTRO_CIVIL_MATRIMONIO (REGISTRO_CIVIL_MATRINOMIO_ID)
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
   add constraint FK_OFICINA__LUGAR___O_LUGAR foreign key (LUGAR_ID)
      references LUGAR (LUGAR_ID)
      on delete restrict on update restrict;

alter table OFICINA_EXPEDICION
   add constraint FK_OFICINA__OFICINA_E_TIPO_OFI foreign key (TIPO_OFICINA_EXPEDICION_ID)
      references TIPO_OFICINA_EXPEDICION (TIPO_OFICINA_EXPEDICION_ID)
      on delete restrict on update restrict;

alter table PERSONA
   add constraint FK_PERSONA_PERSONA_T_TIPO_DOC foreign key (TIPO_DOCUMENTO_ID)
      references TIPO_DOCUMENTO (TIPO_DOCUMENTO_ID)
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
   add constraint FK_PERSONA__PERSONA___PERSONA foreign key (PERSONA_ID)
      references PERSONA (PERSONA_ID)
      on delete restrict on update restrict;

alter table PERSONA_RCM
   add constraint FK_PERSONA__REGISTRO__REGISTRO foreign key (REGISTRO_CIVIL_MATRINOMIO_ID)
      references REGISTRO_CIVIL_MATRIMONIO (REGISTRO_CIVIL_MATRINOMIO_ID)
      on delete restrict on update restrict;

alter table PERSONA_RCN
   add constraint FK_PERSONA__PERSONA_R_ROL_PERS foreign key (ROL_PERSONA_RCN_ID)
      references ROL_PERSONA_RCN (ROL_PERSONA_RCN_ID)
      on delete restrict on update restrict;

alter table PERSONA_RCN
   add constraint FK_PERSONA__PERSONA___PERSONA foreign key (PERSONA_ID)
      references PERSONA (PERSONA_ID)
      on delete restrict on update restrict;

alter table PERSONA_RCN
   add constraint FK_PERSONA__REGISTRO__REGISTRO foreign key (REGISTRO_CIVIL_NACIMIENTO_ID)
      references REGISTRO_CIVIL_NACIMIENTO (REGISTRO_CIVIL_NACIMIENTO_ID)
      on delete restrict on update restrict;

alter table REGISTRO_CIVIL
   add constraint FK_REGISTRO_REGISTRO__OFICINA_ foreign key (OFICINA_EXPEDICION_ID)
      references OFICINA_EXPEDICION (OFICINA_EXPEDICION_ID)
      on delete restrict on update restrict;

alter table REGISTRO_CIVIL_MATRIMONIO
   add constraint FK_REGISTRO_REGISTRO__DOCUMENT foreign key (DOCUMENTO_ACREDITACION_ID)
      references DOCUMENTO_ACREDITACION (DOCUMENTO_ACREDITACION_ID)
      on delete restrict on update restrict;

alter table REGISTRO_CIVIL_MATRIMONIO
   add constraint FK_REGISTRO_REGISTRO__LUGAR foreign key (LUGAR_ID)
      references LUGAR (LUGAR_ID)
      on delete restrict on update restrict;

alter table REGISTRO_CIVIL_MATRIMONIO
   add constraint FK_REGISTRO_REGISTRO__OFICINA_ foreign key (OFICINA_EXPEDICION_ID)
      references OFICINA_EXPEDICION (OFICINA_EXPEDICION_ID)
      on delete restrict on update restrict;

alter table REGISTRO_CIVIL_MATRIMONIO
   add constraint FK_REGISTRO_REGISTRO__TIPO_MAT foreign key (TIPO_MATRIMONIO_ID)
      references TIPO_MATRIMONIO (TIPO_MATRIMONIO_ID)
      on delete restrict on update restrict;

alter table REGISTRO_CIVIL_MATRIMONIO
   add constraint FK_REGISTRO_REGISTRO__REGISTRO foreign key (REGISTRO_CIVIL_ID)
      references REGISTRO_CIVIL (REGISTRO_CIVIL_ID)
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
   add constraint FK_REGISTRO_REGISTRO__LUGAR foreign key (LUGAR_ID)
      references LUGAR (LUGAR_ID)
      on delete restrict on update restrict;

alter table REGISTRO_CIVIL_NACIMIENTO
   add constraint FK_REGISTRO_REGISTRO__SEXO_REC foreign key (SEXO_ID)
      references SEXO_RECIEN_NACIDO (SEXO_ID)
      on delete restrict on update restrict;

alter table REGISTRO_CIVIL_NACIMIENTO
   add constraint FK_REGISTRO_REGISTRO__REGISTRO foreign key (REGISTRO_CIVIL_ID)
      references REGISTRO_CIVIL (REGISTRO_CIVIL_ID)
      on delete restrict on update restrict;

