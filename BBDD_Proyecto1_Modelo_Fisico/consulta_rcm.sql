-- Consulta que muestra los campos de los documentos de registro civil de matrimonio:

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
