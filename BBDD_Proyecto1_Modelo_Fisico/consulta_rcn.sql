select registro_civil.indicativo_serial_rc as "Indicativo serial",
tipo_oficina_expedicion.tipo_oficina_expedicion as "Tipo de oficina",
oficina_expedicion.codigo_oe as "Código de oficina",
pais_expedicion.nombre_pais as "País de expedición",
departamento_expedicion.nombre_departamento as "Departamento de expedición",
municipio_expedicion.nombre_municipio as "Municipio de expedición",
inscrito.apellidos as "Apellidos del inscrito",
inscrito.nombres as "Nombres del inscrito",
registro_civil_nacimiento.fecha_de_nacimiento as "Fecha de nacimiento",
sexo_recien_nacido.sexo as "Sexo",
grupo_sanguineo_recien_nacido.grupo_sanguineo as "Grupo sanguineo",
factor_rh_recien_nacido.factor_rh as "Factor RH",
pais_nacimiento.nombre_pais as "País de nacimiento",
departamento_nacimiento.nombre_departamento as "Departamento de nacimiento",
municipio_nacimiento.nombre_municipio as "Municipio de nacimiento",
registro_civil_nacimiento.nacido_vivo as "Certificado de nacido vivo",

madre.apellidos as "Apellidos de la madre",
madre.nombres as "Nombres de la madre",
tipo_documento_madre.tipo_documento as "Tipo de documento de la madre",
madre.numero_documento as "Número de documento de la madre",

padre.apellidos as "Apellidos del padre",
padre.nombres as "Nombres del padre",
tipo_documento_padre.tipo_documento as "Tipo de documento del padre",
padre.numero_documento as "Número de documento del padre",

declarante.apellidos as "Apellidos del declarante",
declarante.nombres as "Nombres del declarante",
tipo_documento_declarante.tipo_documento as "Tipo de documento del declarante",
declarante.numero_documento as "Número de documento del declarante",

testigos.apellidos as "Apellidos de los testigos",
testigos.nombres as "Nombres de los testigos",
tipo_documento_testigos.tipo_documento as "Tipo de documento de los testigos",
testigos.numero_documento as "Número de documento de los testigos",

funcionario_autoriza.apellidos as "Apellidos del funcionario que autoriza",
funcionario_autoriza.nombres as "Nombres del funcionario que autoriza",
firma_funcionario_autoriza.url_firma_persona as "Firma del funcionario que autoriza",

firma_padre.url_firma_persona as "Reconocimiento paterno (firma del padre)",

funcionario_reconoce.apellidos as "Apellidos del funcionario que hace el reconocimiento",
funcionario_reconoce.nombres as "Nombres del funcionario que hace el reconocimiento",
firma_funcionario_reconoce.url_firma_persona as "Firma del funcionario que hace el reconocimiento",

registro_civil.fecha_expedicion as "Fecha de inscripción",
registro_civil_nacimiento.notas as "Notas"

from registro_civil

--oficina
inner join oficina_expedicion on registro_civil.oficina_expedicion_id = oficina_expedicion.oficina_expedicion_id
inner join tipo_oficina_expedicion on oficina_expedicion.tipo_oficina_expedicion_id = tipo_oficina_expedicion.tipo_oficina_expedicion_id
inner join municipio as municipio_expedicion on oficina_expedicion.municipio_id = municipio_expedicion.municipio_id
inner join departamento as departamento_expedicion on municipio_expedicion.departamento_id = departamento_expedicion.departamento_id
inner join pais as pais_expedicion on departamento_expedicion.pais_id = pais_expedicion.pais_id
--inscrito
inner join registro_civil_nacimiento on registro_civil.registro_civil_id = registro_civil_nacimiento.registro_civil_nacimiento_id

left join persona_rcn on registro_civil_nacimiento.registro_civil_nacimiento_id = persona_rcn.registro_civil_nacimiento_id and persona_rcn.rol_persona_rcn_id = 1
left join persona as inscrito on persona_rcn.persona_id = inscrito.persona_id

inner join sexo_recien_nacido on registro_civil_nacimiento.sexo_id = sexo_recien_nacido.sexo_id
inner join grupo_sanguineo_recien_nacido on registro_civil_nacimiento.grupo_sanguineo_id = grupo_sanguineo_recien_nacido.grupo_sanguineo_id
inner join factor_rh_recien_nacido on registro_civil_nacimiento.factor_rh_id = factor_rh_recien_nacido.factor_rh_id
inner join municipio as municipio_nacimiento on registro_civil_nacimiento.municipio_id = municipio_nacimiento.municipio_id
inner join departamento as departamento_nacimiento on municipio_nacimiento.departamento_id = departamento_nacimiento.departamento_id
inner join pais as pais_nacimiento on departamento_nacimiento.pais_id = pais_nacimiento.pais_id
--madre
left join persona_rcn as roles_madre on registro_civil_nacimiento.registro_civil_nacimiento_id = roles_madre.registro_civil_nacimiento_id and roles_madre.rol_persona_rcn_id = 2
left join persona as madre on roles_madre.persona_id = madre.persona_id
left join tipo_documento as tipo_documento_madre on madre.tipo_documento_id = tipo_documento_madre.tipo_documento_id
--padre
left join persona_rcn as roles_padre on registro_civil_nacimiento.registro_civil_nacimiento_id = roles_padre.registro_civil_nacimiento_id and roles_padre.rol_persona_rcn_id = 3
left join persona as padre on roles_padre.persona_id = padre.persona_id
left join tipo_documento as tipo_documento_padre on padre.tipo_documento_id = tipo_documento_padre.tipo_documento_id
left join firma_persona as firma_padre on padre.persona_id = firma_padre.persona_id
--declarante
left join persona_rcn as roles_declarante on registro_civil_nacimiento.registro_civil_nacimiento_id = roles_declarante.registro_civil_nacimiento_id and roles_declarante.rol_persona_rcn_id = 4
left join persona as declarante on roles_declarante.persona_id = declarante.persona_id
left join tipo_documento as tipo_documento_declarante on declarante.tipo_documento_id = tipo_documento_declarante.tipo_documento_id
--testigos
left join persona_rcn as roles_testigos on registro_civil_nacimiento.registro_civil_nacimiento_id = roles_testigos.registro_civil_nacimiento_id and roles_testigos.rol_persona_rcn_id = 5
left join persona as testigos on roles_testigos.persona_id = testigos.persona_id
left join tipo_documento as tipo_documento_testigos on testigos.tipo_documento_id = tipo_documento_testigos.tipo_documento_id
--funcionario que autoriza
left join persona_rcn as roles_funcionario_autoriza on registro_civil_nacimiento.registro_civil_nacimiento_id = roles_funcionario_autoriza.registro_civil_nacimiento_id and roles_funcionario_autoriza.rol_persona_rcn_id = 6
left join persona as funcionario_autoriza on roles_funcionario_autoriza.persona_id = funcionario_autoriza.persona_id
left join tipo_documento as tipo_documento_funcionario_autoriza on funcionario_autoriza.tipo_documento_id = tipo_documento_funcionario_autoriza.tipo_documento_id
left join firma_persona as firma_funcionario_autoriza on funcionario_autoriza.persona_id = firma_funcionario_autoriza.persona_id
--funcionario que reconoce
left join persona_rcn as roles_funcionario_reconoce on registro_civil_nacimiento.registro_civil_nacimiento_id = roles_funcionario_reconoce.registro_civil_nacimiento_id and roles_funcionario_reconoce.rol_persona_rcn_id = 7
left join persona as funcionario_reconoce on roles_funcionario_reconoce.persona_id = funcionario_reconoce.persona_id
left join tipo_documento as tipo_documento_funcionario_reconoce on funcionario_reconoce.tipo_documento_id = tipo_documento_funcionario_reconoce.tipo_documento_id
left join firma_persona as firma_funcionario_reconoce on funcionario_reconoce.persona_id = firma_funcionario_reconoce.persona_id
;