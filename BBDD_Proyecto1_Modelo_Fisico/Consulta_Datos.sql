/*=======================================================================================*/
/* Consulta que muestra los campos de los documentos de registro civil de matrimonio:    */
/*=======================================================================================*/


SELECT rm.registro_civil_matrinomio_id "Identificador del RCM", r.indicativo_serial_rc "Indicativo serial del RCM",
		-- Para los datos de la oficina de expedición
		toe.tipo_oficina_expedicion "Tipo de oficina de registro", o.numero_notaria "Número de notaría de registro",
        o.codigo_oe "Código de oficina de registro", pa.nombre_pais "País de oficina de registro",
        d.nombre_departamento "Departamento de oficina de registro", m.nombre_municipio "Municipio de oficina de registro",
		-- Para los datos del matrimonio
        pa_celeb.nombre_pais "País de celebración", d_celeb.nombre_departamento "Departamento de celebración",
        m_celeb.nombre_municipio "Municipio de celebración", rm.fecha_celebracion "Fecha de celebración",
        tm.tipo_matrimonio "Tipo de matrimonio", 
		-- Para los datos del documento de acreditación
		tda.tipo_documento_acreditacion "Tipo de documento de acreditación",
        toe_acredita.tipo_oficina_expedicion "Tipo de oficina de acreditación",
		o_acredita.codigo_oe "Código de oficina de acreditación",
		-- Para los datos de los contrayentes
		p_cont.nombres "Nombres del contrayente", p_cont.apellidos "Apellidos del contrayente",
		td_cont.tipo_documento "Tipo de documento del contrayente", p_cont.numero_documento "Número de documento del contrayente",
		-- Para los datos del denunciante
		p_denun.nombres "Nombres del denunciante", p_denun.apellidos "Apellidos del denunciante",
		td_denun.tipo_documento "Tipo de documento del denunciante", p_denun.numero_documento "Número de documento del denunciante",
		f_denun.url_firma_persona "Firma del denunciante", 
		-- Para los datos del funcionario que autoriza
		p_func.nombres "Nombres del funcionario que autoriza",
		p_func.apellidos "Apellidos del funcionario que autoriza", f_func.url_firma_persona "Firma del funcionario que autoriza",
        -- Para los datos de la oficina de la escritura de capitulaciones matrimoniales
		r.fecha_expedicion "Fecha de inscripción", pa_capi.nombre_pais "País de las capitulaciones",
        d_capi.nombre_departamento "Departamento de las capitulaciones", m_capi.nombre_municipio "Municipio de las capitulaciones",
        o_capi.codigo_oe "Código de notaría de las capitualciones", o_capi.numero_notaria "Número de notaría de las capitulaciones",
        rm.numero_escritura_capitulaciones "Número de escritura de las capitulaciones",
        rm.fecha_otorgamiento_escritura_ca "Fecha de las capitulaciones",
		-- Para los datos de los hijos legitimados
        p_hijo.nombres "Nombres del hijo legitimado", p_hijo.apellidos "Apellidos del hijo legitimado",
        td_hijo.tipo_documento "Tipo de documento del hijo legitimado", 
		p_hijo.numero_documento "Número de documento del hijo legitimado",
		ind.indi_serial_inscrito "Indicativo serial del hijo legitimado"
		
FROM registro_civil_matrimonio rm 
INNER JOIN registro_civil r ON rm.registro_civil_id = r.registro_civil_id
-- Para los datos de la oficina de expedición
INNER JOIN oficina_expedicion o ON r.oficina_expedicion_id = o.oficina_expedicion_id
INNER JOIN tipo_oficina_expedicion toe ON o.tipo_oficina_expedicion_id = toe.tipo_oficina_expedicion_id
INNER JOIN municipio m ON o.municipio_id = m.municipio_id
INNER JOIN departamento d ON m.departamento_id = d.departamento_id
INNER JOIN pais pa ON d.pais_id = pa.pais_id
-- Para los datos del matrimonio
INNER JOIN municipio m_celeb ON rm.municipio_id = m_celeb.municipio_id
INNER JOIN departamento d_celeb ON m_celeb.departamento_id = d_celeb.departamento_id
INNER JOIN pais pa_celeb ON d_celeb.pais_id = pa_celeb.pais_id
INNER JOIN tipo_matrimonio tm ON rm.tipo_matrimonio_id = tm.tipo_matrimonio_id
-- Para los datos del documento de acreditación
INNER JOIN documento_acreditacion da ON rm.documento_acreditacion_id = da.documento_acreditacion_id
INNER JOIN tipo_documento_acreditacion tda ON da.tipo_documento_acreditacion_id = tda.tipo_documento_acreditacion_id
INNER JOIN oficina_expedicion o_acredita ON da.oficina_expedicion_id = o_acredita.oficina_expedicion_id
INNER JOIN tipo_oficina_expedicion toe_acredita ON o_acredita.tipo_oficina_expedicion_id = toe_acredita.tipo_oficina_expedicion_id
-- Para los datos de los contrayentes
LEFT JOIN persona_rcm prm_cont ON rm.registro_civil_matrinomio_id = prm_cont.registro_civil_matrinomio_id 
			AND prm_cont.rol_persona_rcm_id = 1
LEFT JOIN persona p_cont ON prm_cont.persona_id = p_cont.persona_id
LEFT JOIN tipo_documento td_cont ON p_cont.tipo_documento_id = td_cont.tipo_documento_id
-- Para los datos del denunciante
LEFT JOIN persona_rcm prm_denun ON rm.registro_civil_matrinomio_id = prm_denun.registro_civil_matrinomio_id
			AND prm_denun.rol_persona_rcm_id = 2
LEFT JOIN persona p_denun ON prm_denun.persona_id = p_denun.persona_id
LEFT JOIN tipo_documento td_denun ON p_denun.tipo_documento_id = td_denun.tipo_documento_id
LEFT JOIN firma_persona f_denun ON p_denun.persona_id = f_denun.persona_id 
-- Para los datos del funcionario que autoriza
LEFT JOIN persona_rcm prm_func ON rm.registro_civil_matrinomio_id = prm_func.registro_civil_matrinomio_id
			AND prm_func.rol_persona_rcm_id = 3
LEFT JOIN persona p_func ON prm_func.persona_id = p_func.persona_id
LEFT JOIN firma_persona f_func ON p_func.persona_id = f_func.persona_id 
-- Para los datos de la oficina de la escritura de capitulaciones matrimoniales
LEFT JOIN oficina_expedicion o_capi ON rm.oficina_expedicion_id = o_capi.oficina_expedicion_id
LEFT JOIN municipio m_capi ON o_capi.municipio_id = m_capi.municipio_id
LEFT JOIN departamento d_capi ON m_capi.departamento_id = d_capi.departamento_id
LEFT JOIN pais pa_capi ON d_capi.pais_id = pa_capi.pais_id
-- Para los datos de los hijos legitimados
LEFT JOIN hijo_legitimado h ON rm.registro_civil_matrinomio_id = h.registro_civil_matrinomio_id
LEFT JOIN persona p_hijo ON h.persona_id = p_hijo.persona_id
LEFT JOIN tipo_documento td_hijo ON p_hijo.tipo_documento_id = td_hijo.tipo_documento_id
LEFT JOIN (SELECT rc.indicativo_serial_rc indi_serial_inscrito, prn.persona_id inscrito_id
            FROM registro_civil_nacimiento rn 
            LEFT JOIN registro_civil rc ON rn.registro_civil_id = rc.registro_civil_id
            LEFT JOIN persona_rcn prn ON rn.registro_civil_nacimiento_id = prn.registro_civil_nacimiento_id
			LEFT JOIN rol_persona_rcn rrn ON prn.rol_persona_rcn_id = rrn.rol_persona_rcn_id
           	WHERE rrn.rol_persona_rcn_id = 1) ind ON ind.inscrito_id = h.persona_id
ORDER BY rm.registro_civil_matrinomio_id;






/*=======================================================================================*/
/* Consulta que muestra los campos de los documentos de registro civil de nacimiento:    */
/*=======================================================================================*/


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
left join firma_persona as firma_funcionario_reconoce on funcionario_reconoce.persona_id = firma_funcionario_reconoce.persona_id;
