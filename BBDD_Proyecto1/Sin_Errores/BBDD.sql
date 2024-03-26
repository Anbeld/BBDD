/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     25/03/2024 5:39:58 p.�m.                     */
/*==============================================================*/


/*==============================================================*/
/* Table: DEPARTAMENTO                                          */
/*==============================================================*/
create table DEPARTAMENTO (
   DEPARTAMENTO_ID      SERIAL               not null,
   PAIS_ID              INT4                 not null,
   NOMBRE_DEPARTAMENTO  CHAR(30)             not null unique,
   constraint PK_DEPARTAMENTO primary key (DEPARTAMENTO_ID)
);

comment on table DEPARTAMENTO is
'Almacena los posibles valores de departamentos en lo que puede ocurrir un evento.';

comment on column DEPARTAMENTO.DEPARTAMENTO_ID is
'identificador unico del departamento.';

comment on column DEPARTAMENTO.PAIS_ID is
'identificador unico para la entidad pais.';

comment on column DEPARTAMENTO.NOMBRE_DEPARTAMENTO is
'nombre del departamento.';


/*==============================================================*/
/* Table: DOCUMENTO_ACREDITACION                                */
/*==============================================================*/
create table DOCUMENTO_ACREDITACION (
   DOCUMENTO_ACREDITACION_ID SERIAL               not null,
   OFICINA_EXPEDICION_ID INT4                 not null,
   TIPO_DOCUMENTO_ACREDITACION_ID INT4                 not null,
   constraint PK_DOCUMENTO_ACREDITACION primary key (DOCUMENTO_ACREDITACION_ID)
);

comment on table DOCUMENTO_ACREDITACION is
'Entidad que almacena la informacion de los documentos de acreditacion para un matrimonio.';

comment on column DOCUMENTO_ACREDITACION.DOCUMENTO_ACREDITACION_ID is
'identificador unico de la entidad documento de acreditacion.';

comment on column DOCUMENTO_ACREDITACION.OFICINA_EXPEDICION_ID is
'identificador unico para la entidad Oficina de Expedicion.';

comment on column DOCUMENTO_ACREDITACION.TIPO_DOCUMENTO_ACREDITACION_ID is
'identificador del tipo de documento de acreditacion del matrimonio';



/*==============================================================*/
/* Table: FACTOR_RH_RECIEN_NACIDO                               */
/*==============================================================*/
create table FACTOR_RH_RECIEN_NACIDO (
   FACTOR_RH_ID         SERIAL               not null,
   FACTOR_RH            VARCHAR(1)           not null unique,
   constraint PK_FACTOR_RH_RECIEN_NACIDO primary key (FACTOR_RH_ID)
);

comment on table FACTOR_RH_RECIEN_NACIDO is
'Almacena las posibles opciones para el factor RH del nacido al que se le expide el registro civil de nacimiento.';

comment on column FACTOR_RH_RECIEN_NACIDO.FACTOR_RH_ID is
'identificador unico para el factor RH del recien nacido.';

comment on column FACTOR_RH_RECIEN_NACIDO.FACTOR_RH is
'este atributo hace referencia al RH del recien nacido, el cual puede ser positivo o negativo.';


/*==============================================================*/
/* Table: FIRMA_PERSONA                                         */
/*==============================================================*/
create table FIRMA_PERSONA (
   FIRMA_ID             SERIAL               not null,
   PERSONA_ID           INT4                 not null unique,
   URL_FIRMA_PERSONA    VARCHAR(300)         not null unique,
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
/* Table: GRUPO_SANGUINEO_RECIEN_NACIDO                         */
/*==============================================================*/
create table GRUPO_SANGUINEO_RECIEN_NACIDO (
   GRUPO_SANGUINEO_ID   SERIAL               not null,
   GRUPO_SANGUINEO      VARCHAR(2)           not null unique,
   constraint PK_GRUPO_SANGUINEO_RECIEN_NACI primary key (GRUPO_SANGUINEO_ID)
);

comment on table GRUPO_SANGUINEO_RECIEN_NACIDO is
'Almacena las posibles opciones para el grupo sanguineo del nacido al que se le expide el registro civil de nacimiento.';

comment on column GRUPO_SANGUINEO_RECIEN_NACIDO.GRUPO_SANGUINEO_ID is
'identificador unico de la entidad grupo sanguineo.';

comment on column GRUPO_SANGUINEO_RECIEN_NACIDO.GRUPO_SANGUINEO is
'este atributo hace referencia al grupo sanguineo del recien nacido, el cual puede ser A, B, AB o O.';


/*==============================================================*/
/* Table: HIJO_LEGITIMADO                                       */
/*==============================================================*/
create table HIJO_LEGITIMADO (
   HIJOS_LEGITIMADO_ID  SERIAL               not null,
   REGISTRO_CIVIL_MATRINOMIO_ID INT4                 not null,
   PERSONA_ID           INT4                 not null unique,
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
/* Table: MUNICIPO                                              */
/*==============================================================*/
create table MUNICIPO (
   MUNICIPIO_ID         SERIAL               not null,
   DEPARTAMENTO_ID      INT4                 not null,
   MUNICIPIO            VARCHAR(50)          not null unique,
   constraint PK_MUNICIPO primary key (MUNICIPIO_ID)
);

comment on table MUNICIPO is
'Almacena los posibles valores de municipios en lo que puede ocurrir un evento.';

comment on column MUNICIPO.MUNICIPIO_ID is
'identificador unico del municipio.';

comment on column MUNICIPO.DEPARTAMENTO_ID is
'identificador unico del departamento.';

comment on column MUNICIPO.MUNICIPIO is
'nombre del municipio';


/*==============================================================*/
/* Table: NACIONALIDAD_PERSONA                                  */
/*==============================================================*/
create table NACIONALIDAD_PERSONA (
   NACIONALIDAD_ID      SERIAL               not null,
   NACIONALIDAD         VARCHAR(50)          not null unique,
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
/* Table: OFICINA_EXPEDICION                                    */
/*==============================================================*/
create table OFICINA_EXPEDICION (
   OFICINA_EXPEDICION_ID SERIAL               not null,
   TIPO_OFICINA_EXPEDICION_ID INT4                 not null,
   MUNICIPIO_ID         INT4                 not null,
   CODIGO_OE            INT4                 not null unique,
   NUMERO_NOTARIA       INT4                 null,
   constraint PK_OFICINA_EXPEDICION primary key (OFICINA_EXPEDICION_ID)
);

comment on table OFICINA_EXPEDICION is
'Lugar de expedicion del registro civil o documento de acreditacion del matrimonio (solo aplica para el registro civil de matrimonio), una oficina de expedicion puede expedir multiples registros civiles o documentos de acreditacion. Para registro civil la oficina puede variar dependiendo del lugar donde se realiza el registro: puede ser una registraduria, una notaria, un consulado, oficina de policia o un corregimiento. Para registro civil de matrimonio puede ser parroquia, juzagado u otros.';

comment on column OFICINA_EXPEDICION.OFICINA_EXPEDICION_ID is
'identificador unico para la entidad Oficina de Expedicion.';

comment on column OFICINA_EXPEDICION.TIPO_OFICINA_EXPEDICION_ID is
'identificador unico del tipo de oficina de expedicion.';

comment on column OFICINA_EXPEDICION.MUNICIPIO_ID is
'identificador unico del municipio.';

comment on column OFICINA_EXPEDICION.CODIGO_OE is
'codigo unico de identificacion de la oficina.';

comment on column OFICINA_EXPEDICION.NUMERO_NOTARIA is
'numero especifico que se requiere si la oficina es una notaria, para el registro civil de nacimiento.';



/*==============================================================*/
/* Table: PAIS                                                  */
/*==============================================================*/
create table PAIS (
   PAIS_ID              SERIAL               not null,
   NOMBRE_PAIS          VARCHAR(50)          not null unique,
   constraint PK_PAIS primary key (PAIS_ID)
);

comment on table PAIS is
'Almacena los posibles valores de paises en lo que puede ocurrir un evento.';

comment on column PAIS.PAIS_ID is
'identificador unico para la entidad pais.';

comment on column PAIS.NOMBRE_PAIS is
'nombre del pais.';



/*==============================================================*/
/* Table: PERSONA                                               */
/*==============================================================*/
create table PERSONA (
   PERSONA_ID           SERIAL               not null,
   TIPO_DOCUMENTO_ID    INT4                 not null,
   NUMERO_DOCUMENTO     INT4                 not null,
   NACIONALIDAD_ID      INT4                 null,
   NUIP                 INT4                 not null unique,
   NOMBRES              CHAR(40)             not null,
   APELLIDOS            CHAR(40)             not null,
   constraint PK_PERSONA primary key (PERSONA_ID),
   CONSTRAINT UQ_NUMERO_TIPO_DOCUMENTO UNIQUE (NUMERO_DOCUMENTO, TIPO_DOCUMENTO_ID)
);

comment on table PERSONA is
'Almacena la informacion de todas las personas que se ven involucradas en la creaci�n de un registro civil. Contiene el NUIP, nombre, apellido y en caso de ser necesario la nacionalidad y la firma de la persona.
';

comment on column PERSONA.PERSONA_ID is
'identificador unico de la persona involucrada en la creacion del registro civil.';

comment on column PERSONA.TIPO_DOCUMENTO_ID is
'identificador unico para el tipo de documento.';

comment on column PERSONA.NUMERO_DOCUMENTO is
'numero de documento de identidad de la persona.';

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
/* Table: REGISTRO_CIVIL                                        */
/*==============================================================*/
create table REGISTRO_CIVIL (
   REGISTRO_CIVIL_ID    SERIAL               not null,
   OFICINA_EXPEDICION_ID INT4                 not null,
   INDICATIVO_SERIAL_RC INT8                 not null
      constraint CKC_INDICATIVO_SERIAL_REGISTRO check (INDICATIVO_SERIAL_RC between 100000000000 and 999999999999),
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
'identifica de manera unica al registro civil que se esta diligenciando. Esta compuesto por 12 d�gitos numericos.';

comment on column REGISTRO_CIVIL.FECHA_EXPEDICION is
'fecha de expedicion del registro civil de matrimonio.';



/*==============================================================*/
/* Table: REGISTRO_CIVIL_MATRIMONIO                             */
/*==============================================================*/
create table REGISTRO_CIVIL_MATRIMONIO (
   REGISTRO_CIVIL_MATRINOMIO_ID SERIAL               not null,
   TIPO_MATRIMONIO_ID   INT4                 not null,
   MUNICIPIO_ID         INT4                 not null,
   REGISTRO_CIVIL_ID    INT4                 not null unique,
   DOCUMENTO_ACREDITACION_ID INT4                 not null unique,
   OFICINA_EXPEDICION_ID INT4                 null,
   FECHA_CELEBRACION    DATE                 not null,
   FECHA_OTORGAMIENTO_ESCRITURA_CA DATE                 null,
   NUMERO_ESCRITURA_CAPITULACIONES INT4                 null unique,
   constraint PK_REGISTRO_CIVIL_MATRIMONIO primary key (REGISTRO_CIVIL_MATRINOMIO_ID)
);

comment on table REGISTRO_CIVIL_MATRIMONIO is
'Almacena datos del matrimonio que es llevado a cabo: datos de los contrayentes, datos del denunciante y datos del funcionario que certifica el registro. Posee un indicativo serial unico que lo diferencia de cualquier otro registro civil. Puede llegar a tener datos de los hijos legitimados, si existian hijos previos al matrimonio.';

comment on column REGISTRO_CIVIL_MATRIMONIO.REGISTRO_CIVIL_MATRINOMIO_ID is
'identificador unico para la entidad registro civil de matriminio';

comment on column REGISTRO_CIVIL_MATRIMONIO.TIPO_MATRIMONIO_ID is
'identificador unico de la entidad tipo matrinomio.';

comment on column REGISTRO_CIVIL_MATRIMONIO.MUNICIPIO_ID is
'identificador unico del municipio.';

comment on column REGISTRO_CIVIL_MATRIMONIO.REGISTRO_CIVIL_ID is
'identificador unico para la entidad Registro Civil.';

comment on column REGISTRO_CIVIL_MATRIMONIO.DOCUMENTO_ACREDITACION_ID is
'identificador unico de la entidad documento de acreditacion.';

comment on column REGISTRO_CIVIL_MATRIMONIO.OFICINA_EXPEDICION_ID is
'identificador unico para la entidad Oficina de Expedicion.';

comment on column REGISTRO_CIVIL_MATRIMONIO.FECHA_CELEBRACION is
'se refiere a la fecha en la que se lleva a cabo un evento o ceremonia especifica, como puede ser un matrimonio, una celebracion religiosa, una conferencia, entre otros. Esta fecha representa el dia en el que se realiza el evento o la accion principal que se esta registrando.';

comment on column REGISTRO_CIVIL_MATRIMONIO.FECHA_OTORGAMIENTO_ESCRITURA_CA is
'indica la fecha en la cual se otorga la escritura de capitulaciones matrimoniales. Estas escrituras son documentos legales que establecen el r�gimen economico del matrimonio, definiendo los derechos y obligaciones de los conyuges en relaci�n con sus bienes durante el matrimonio y en caso de divorcio o fallecimiento.';

comment on column REGISTRO_CIVIL_MATRIMONIO.NUMERO_ESCRITURA_CAPITULACIONES is
'indica el numero identificador asignado a la escritura de las capitulaciones matrimoniales.';



/*==============================================================*/
/* Table: REGISTRO_CIVIL_NACIMIENTO                             */
/*==============================================================*/
create table REGISTRO_CIVIL_NACIMIENTO (
   REGISTRO_CIVIL_NACIMIENTO_ID SERIAL               not null,
   GRUPO_SANGUINEO_ID   INT4                 not null,
   SEXO_ID              INT4                 not null,
   MUNICIPIO_ID         INT4                 not null,
   REGISTRO_CIVIL_ID    INT4                 not null unique,
   FACTOR_RH_ID         INT4                 not null,
   NACIDO_VIVO          VARCHAR(12)          not null unique,
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

comment on column REGISTRO_CIVIL_NACIMIENTO.MUNICIPIO_ID is
'identificador unico del municipio.';

comment on column REGISTRO_CIVIL_NACIMIENTO.REGISTRO_CIVIL_ID is
'identificador unico para la entidad Registro Civil.';

comment on column REGISTRO_CIVIL_NACIMIENTO.FACTOR_RH_ID is
'identificador unico para el factor RH del recien nacido.';

comment on column REGISTRO_CIVIL_NACIMIENTO.NACIDO_VIVO is
'suministra informacion basica acerca del recien nacido, confirmando que el bebe nacio vivo y ofreciendo un certificado valido de la relacion entre la criatura y su madre. ';

comment on column REGISTRO_CIVIL_NACIMIENTO.FECHA_DE_NACIMIENTO is
'fecha de nacimiento del recien nacido.';

comment on column REGISTRO_CIVIL_NACIMIENTO.NOTAS is
'espacio para notas reservado para casos especiales en los que se necesite dejar constancia de una situacion.';



/*==============================================================*/
/* Table: ROL_PERSONA_RCM                                       */
/*==============================================================*/
create table ROL_PERSONA_RCM (
   ROL_PERSONA_RCM_ID   SERIAL               not null,
   ROL_PERSONA_RCM      VARCHAR(50)          not null unique,
   constraint PK_ROL_PERSONA_RCM primary key (ROL_PERSONA_RCM_ID)
);

comment on table ROL_PERSONA_RCM is
'Esta entidad almacena los posibles roles que una persona puede tener en el registro civil de matrimonio, sin incluir al rol "hijo legitimado".';

comment on column ROL_PERSONA_RCM.ROL_PERSONA_RCM_ID is
'identificador unico para la entidad rol persona.';

comment on column ROL_PERSONA_RCM.ROL_PERSONA_RCM is
'rol que caracteriza a la persona en el registro civil de matrimonio.';


/*==============================================================*/
/* Table: ROL_PERSONA_RCN                                       */
/*==============================================================*/
create table ROL_PERSONA_RCN (
   ROL_PERSONA_RCN_ID   SERIAL               not null,
   ROL_PERSONA_RCN      VARCHAR(50)          not null unique,
   constraint PK_ROL_PERSONA_RCN primary key (ROL_PERSONA_RCN_ID)
);

comment on table ROL_PERSONA_RCN is
'La entidad se utiliza para categorizar los distintos roles que pueden desempe�ar las personas en el proceso de registro civil de nacimiento. ';

comment on column ROL_PERSONA_RCN.ROL_PERSONA_RCN_ID is
'identificador unico para la entidad rol persona rcn.';

comment on column ROL_PERSONA_RCN.ROL_PERSONA_RCN is
'rol que caracteriza a la persona en el registro civil de nacimiento.';


/*==============================================================*/
/* Table: SEXO_RECIEN_NACIDO                                    */
/*==============================================================*/
create table SEXO_RECIEN_NACIDO (
   SEXO_ID              SERIAL               not null,
   SEXO                 VARCHAR(1)           not null unique,
   constraint PK_SEXO_RECIEN_NACIDO primary key (SEXO_ID)
);

comment on table SEXO_RECIEN_NACIDO is
'Contiene los diferentes sexos posibles para un Registro Civil de Nacimiento';

comment on column SEXO_RECIEN_NACIDO.SEXO_ID is
'identificador unico para la entidad sexo.';

comment on column SEXO_RECIEN_NACIDO.SEXO is
'sexo del recien nacido, tiene dos posibles sexos: masculino y femenino.';



/*==============================================================*/
/* Table: TIPO_DOCUMENTO                                        */
/*==============================================================*/
create table TIPO_DOCUMENTO (
   TIPO_DOCUMENTO_ID    SERIAL               not null,
   TIPO_DOCUMENTO       VARCHAR(50)          not null unique,
   constraint PK_TIPO_DOCUMENTO primary key (TIPO_DOCUMENTO_ID)
);

comment on table TIPO_DOCUMENTO is
'Asgina un tipo de documento (cedula de ciudadania, cedula de extranjeria, tarjeta de identidad o pasaporte) a una persona relacionada con la expedicion del registro civil.';

comment on column TIPO_DOCUMENTO.TIPO_DOCUMENTO_ID is
'identificador unico para el tipo de documento.';

comment on column TIPO_DOCUMENTO.TIPO_DOCUMENTO is
'el tipo de documento puede ser cedula de ciudadania, cedula de extranjeria, pasaporte o tarjeta de identidad.';



/*==============================================================*/
/* Table: TIPO_DOCUMENTO_ACREDITACION                           */
/*==============================================================*/
create table TIPO_DOCUMENTO_ACREDITACION (
   TIPO_DOCUMENTO_ACREDITACION_ID SERIAL               not null,
   TIPO_DOCUMENTO_ACREDITACION VARCHAR(30)          not null unique,
   constraint PK_TIPO_DOCUMENTO_ACREDITACION primary key (TIPO_DOCUMENTO_ACREDITACION_ID)
);

comment on table TIPO_DOCUMENTO_ACREDITACION is
'Contiene los diferentes tipos del documento de acreditacion para el registro civil de matrimonio.
';

comment on column TIPO_DOCUMENTO_ACREDITACION.TIPO_DOCUMENTO_ACREDITACION_ID is
'identificador del tipo de documento de acreditacion del matrimonio';

comment on column TIPO_DOCUMENTO_ACREDITACION.TIPO_DOCUMENTO_ACREDITACION is
'se refiere al tipo de documento utilizado para acreditar el matrimonio. En este contexto, puede ser de dos tipos: Acta Religiosa (se refiere al documento emitido por una autoridad religiosa que certifica la realizaci�n del matrimonio seg�n los ritos y ceremonias de una determinada religi�n) o escritura de protocolizaci�n (es un documento legal emitido por un notario p�blico que certifica el matrimonio y lo protocoliza oficialmente).';



/*==============================================================*/
/* Table: TIPO_MATRIMONIO                                       */
/*==============================================================*/
create table TIPO_MATRIMONIO (
   TIPO_MATRIMONIO_ID   SERIAL               not null,
   TIPO_MATRIMONIO      VARCHAR(25)          not null unique,
   constraint PK_TIPO_MATRIMONIO primary key (TIPO_MATRIMONIO_ID)
);

comment on table TIPO_MATRIMONIO is
'Asigna una categoria al matrimonio la cual puede ser matrimonio religioso o civil.';

comment on column TIPO_MATRIMONIO.TIPO_MATRIMONIO_ID is
'identificador unico de la entidad tipo matrinomio.';

comment on column TIPO_MATRIMONIO.TIPO_MATRIMINIO is
'tipo de matrimonio por el que se llevo a cabo el proceso, puede ser civil o religioso.';


/*==============================================================*/
/* Table: TIPO_OFICINA_EXPEDICION                               */
/*==============================================================*/
create table TIPO_OFICINA_EXPEDICION (
   TIPO_OFICINA_EXPEDICION_ID SERIAL               not null,
   TIPO_OFICINA_EXPEDICION VARCHAR(25)          not null unique,
   constraint PK_TIPO_OFICINA_EXPEDICION primary key (TIPO_OFICINA_EXPEDICION_ID)
);

comment on table TIPO_OFICINA_EXPEDICION is
'Contiene los diferentes tipos de la oficina de expedicion para un Registro Civil o un Documento de Acreditacion para el Registro Civil de Matrimonio.';

comment on column TIPO_OFICINA_EXPEDICION.TIPO_OFICINA_EXPEDICION_ID is
'identificador unico del tipo de oficina de expedicion.';

comment on column TIPO_OFICINA_EXPEDICION.TIPO_OFICINA_EXPEDICION is
'tipo de la oficina de expedicion del registro civil o documento de acreditacion (RCM).';



alter table DEPARTAMENTO
   add constraint FK_DEPARTAM_DEPARTAME_PAIS foreign key (PAIS_ID)
      references PAIS (PAIS_ID)
      on delete restrict on update restrict;

alter table DOCUMENTO_ACREDITACION
   add constraint FK_DOCUMENT_DOCUMENTO_OFICINA_ foreign key (OFICINA_EXPEDICION_ID)
      references OFICINA_EXPEDICION (OFICINA_EXPEDICION_ID)
      on delete restrict on update restrict;

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

alter table MUNICIPO
   add constraint FK_MUNICIPO_MUNICIPIO_DEPARTAM foreign key (DEPARTAMENTO_ID)
      references DEPARTAMENTO (DEPARTAMENTO_ID)
      on delete restrict on update restrict;

alter table OFICINA_EXPEDICION
   add constraint FK_OFICINA__MUNICIPIO_MUNICIPO foreign key (MUNICIPIO_ID)
      references MUNICIPO (MUNICIPIO_ID)
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
   add constraint FK_PERSONA_RCM__PERSONA_R_ROL_PERS foreign key (ROL_PERSONA_RCM_ID)
      references ROL_PERSONA_RCM (ROL_PERSONA_RCM_ID)
      on delete restrict on update restrict;

alter table PERSONA_RCM
   add constraint FK_PERSONA__RCM___PERSONA foreign key (PERSONA_ID)
      references PERSONA (PERSONA_ID)
      on delete restrict on update restrict;

alter table PERSONA_RCM
   add constraint FK_PERSONA_RCM__REGISTRO__REGISTRO foreign key (REGISTRO_CIVIL_MATRINOMIO_ID)
      references REGISTRO_CIVIL_MATRIMONIO (REGISTRO_CIVIL_MATRINOMIO_ID)
      on delete restrict on update restrict;

alter table PERSONA_RCN
   add constraint FK_PERSONA_RCN__PERSONA_R_ROL_PERS foreign key (ROL_PERSONA_RCN_ID)
      references ROL_PERSONA_RCN (ROL_PERSONA_RCN_ID)
      on delete restrict on update restrict;

alter table PERSONA_RCN
   add constraint FK_PERSONA__RCN___PERSONA foreign key (PERSONA_ID)
      references PERSONA (PERSONA_ID)
      on delete restrict on update restrict;

alter table PERSONA_RCN
   add constraint FK_PERSONA_RCN__REGISTRO__REGISTRO foreign key (REGISTRO_CIVIL_NACIMIENTO_ID)
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
   add constraint FK_REGISTRO_REGISTRO__MUNICIPO foreign key (MUNICIPIO_ID)
      references MUNICIPO (MUNICIPIO_ID)
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
   add constraint FK_REGISTRO_MAT__REGISTRO foreign key (REGISTRO_CIVIL_ID)
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
   add constraint FK_REGISTRO_REGISTRO__MUNICIPO foreign key (MUNICIPIO_ID)
      references MUNICIPO (MUNICIPIO_ID)
      on delete restrict on update restrict;

alter table REGISTRO_CIVIL_NACIMIENTO
   add constraint FK_REGISTRO_REGISTRO__SEXO_REC foreign key (SEXO_ID)
      references SEXO_RECIEN_NACIDO (SEXO_ID)
      on delete restrict on update restrict;

alter table REGISTRO_CIVIL_NACIMIENTO
   add constraint FK_REGISTRO_NAC__REGISTRO foreign key (REGISTRO_CIVIL_ID)
      references REGISTRO_CIVIL (REGISTRO_CIVIL_ID)
      on delete restrict on update restrict;

