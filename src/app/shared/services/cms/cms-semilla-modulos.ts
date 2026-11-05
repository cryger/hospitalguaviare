/* Datos migrados del portal anterior (esehospitalguaviare.gov.co) para el modo local.
 * Mismo contenido que api/migraciones/003-vacantes.sql, 004 y 005. */
import { Vacante } from '../../models/trabaja-nosotros/trabaja-nosotros/trabaja-nosotros-module';
import { Cotizacion } from '../../models/cotizacion/cotizacion/cotizacion-module';

export const VACANTES_SEMILLA: Omit<Vacante, 'id'>[] = [
  {
    "titulo": "Bacteriólogo (Laboratorio Clínico)",
    "tipoContrato": "Prestación de servicios",
    "vacantes": 2,
    "salario": "$4.000.000",
    "horario": "Turnos rotativos (192 horas al mes)",
    "ubicacion": "Laboratorio Clínico. ESE Hospital San José del Guaviare.",
    "descripcion": "La ESE Hospital San José del Guaviare se complace en extender la invitación a participar de la convocatoria de las dos (02) vacantes disponibles para el área de Laboratorio Clínico. Para su postulación, tenga en cuenta las condiciones del contrato.",
    "requisitos": [
      "Profesional en Bacteriología.",
      "Consulte los requisitos completos en el documento de la convocatoria."
    ],
    "imagenUrl": "https://esehospitalguaviare.gov.co/resourses/imgTrabajos/7.png",
    "documentoUrl": "https://esehospitalguaviare.gov.co/resourses/archivos/pdf/REQUISITOS%20PROFESIONAL%20EN%20BACTERIOLOG%C3%8DA.pdf",
    "fechaPublicacion": "2025-01-07T12:00:00.000Z",
    "estado": "cerrada",
    "migradoDe": "esehospitalguaviare.gov.co/trabaja-con-nosotros"
  },
  {
    "titulo": "Provisión transitoria por encargo – Presupuesto (Técnico Administrativo)",
    "tipoContrato": "Vinculación en planta de personal (encargo)",
    "vacantes": 1,
    "salario": "$4.179.600",
    "horario": "De oficina",
    "ubicacion": "Presupuesto. ESE Hospital San José del Guaviare.",
    "descripcion": "El área de Talento Humano invita a los servidores públicos inscritos en carrera administrativa, con nombramiento en propiedad adscritos a la planta global de la E.S.E. Hospital San José del Guaviare, que consideren que cumplen con los requisitos exigidos en los artículos 24 y 25 de la Ley 909 de 2004, el Decreto 1083 de 2015 y la Ley 1960 de 2019, a participar del proceso de provisión transitoria de un empleo de carrera a través de encargo.",
    "requisitos": [
      "Servidor público inscrito en carrera administrativa, con nombramiento en propiedad en la planta global de la E.S.E.",
      "Cumplir los requisitos de los artículos 24 y 25 de la Ley 909 de 2004, el Decreto 1083 de 2015 y la Ley 1960 de 2019.",
      "Consulte el comunicado y las funciones del cargo en el documento adjunto."
    ],
    "imagenUrl": "https://esehospitalguaviare.gov.co/resourses/imgTrabajos/1111.png",
    "documentoUrl": "https://esehospitalguaviare.gov.co/resourses/archivos/pdf/COMUNICADO%20INTERNO%2004%20TECNICO%20ADMINISTRATIVO%20Y%20FUNCIONES%20DEL%20CARGO.pdf",
    "fechaPublicacion": "2023-10-04T12:00:00.000Z",
    "estado": "cerrada",
    "migradoDe": "esehospitalguaviare.gov.co/trabaja-con-nosotros"
  },
  {
    "titulo": "Promotor/a de la salud (líder comunitario)",
    "tipoContrato": "Prestación de servicios",
    "vacantes": 1,
    "salario": "$2.226.590 mensual",
    "horario": "Prestación de servicios",
    "ubicacion": "ESE Hospital San José del Guaviare. Departamento del Guaviare.",
    "descripcion": "La ESE Hospital San José del Guaviare, dentro de la implementación de la ESTRATEGIA DE REHABILITACIÓN PSICOSOCIAL COMUNITARIA PARA LA CONVIVENCIA Y NO REPETICIÓN asignada a esta institución por el Ministerio de Salud y Protección Social mediante la Resolución 1275 de 2024, extiende invitación a participar de la convocatoria para la contratación de un promotor/a de la salud (líder/esa comunitario/a).",
    "requisitos": [
      "Líder o lideresa comunitario/a.",
      "Consulte los requisitos completos en el documento de la convocatoria."
    ],
    "imagenUrl": "https://esehospitalguaviare.gov.co/resourses/imgTrabajos/2%20(2).png",
    "documentoUrl": "https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Promotora%20de%20Salud_12312123.pdf",
    "fechaPublicacion": "2024-10-02T12:00:00.000Z",
    "estado": "cerrada",
    "migradoDe": "esehospitalguaviare.gov.co/trabaja-con-nosotros"
  },
  {
    "titulo": "Profesionales psicosociales",
    "tipoContrato": "Prestación de servicios",
    "vacantes": 3,
    "salario": "$4.807.985 mensual",
    "horario": "Prestación de servicios",
    "ubicacion": "ESE Hospital San José del Guaviare. Departamento del Guaviare.",
    "descripcion": "La ESE Hospital San José del Guaviare, dentro de la implementación de la ESTRATEGIA DE REHABILITACIÓN PSICOSOCIAL COMUNITARIA PARA LA CONVIVENCIA Y NO REPETICIÓN asignada a esta institución por el Ministerio de Salud y Protección Social mediante la Resolución 1275 de 2024, extiende invitación a participar de la convocatoria para la contratación de tres profesionales psicosociales (profesionales en el área de las ciencias sociales y humanas: trabajo social, sociología, antropología, entre otras indicadas en el documento de la convocatoria).",
    "requisitos": [
      "Profesional en el área de las ciencias sociales y humanas: trabajo social, sociología, antropología, entre otras indicadas en el documento de la convocatoria.",
      "Consulte los requisitos completos en el documento de la convocatoria."
    ],
    "imagenUrl": "/assets/vacantes/profesionales-psicosociales.jpg",
    "documentoUrl": "https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Profesionales%20Psicosociales_34242342.pdf",
    "fechaPublicacion": "2024-10-02T12:00:00.000Z",
    "estado": "cerrada",
    "migradoDe": "esehospitalguaviare.gov.co/trabaja-con-nosotros"
  },
  {
    "titulo": "Profesional para la coordinación general",
    "tipoContrato": "Prestación de servicios",
    "vacantes": 1,
    "salario": "$5.139.972 mensual",
    "horario": "Prestación de servicios",
    "ubicacion": "ESE Hospital San José del Guaviare. Departamento del Guaviare.",
    "descripcion": "La ESE Hospital San José del Guaviare, dentro de la implementación de la ESTRATEGIA DE REHABILITACIÓN PSICOSOCIAL COMUNITARIA PARA LA CONVIVENCIA Y NO REPETICIÓN asignada a esta institución por el Ministerio de Salud y Protección Social mediante la Resolución 1275 de 2024, extiende invitación a participar de la convocatoria para la contratación de un profesional para la coordinación general.",
    "requisitos": [
      "Profesional en Ciencias Sociales y Humanas, u otras áreas indicadas en el documento de la convocatoria.",
      "Consulte los requisitos completos en el documento de la convocatoria."
    ],
    "imagenUrl": "/assets/vacantes/coordinacion-general.jpg",
    "documentoUrl": "https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Profesional%20Coordinaci%C3%B3n%20General_2431312%20.pdf",
    "fechaPublicacion": "2024-10-02T12:00:00.000Z",
    "estado": "cerrada",
    "migradoDe": "esehospitalguaviare.gov.co/trabaja-con-nosotros"
  },
  {
    "titulo": "Profesional administrativo y financiero",
    "tipoContrato": "Prestación de servicios",
    "vacantes": 1,
    "salario": "$5.139.972 mensual",
    "horario": "Prestación de servicios",
    "ubicacion": "ESE Hospital San José del Guaviare. Departamento del Guaviare.",
    "descripcion": "La ESE Hospital San José del Guaviare, dentro de la implementación de la ESTRATEGIA DE REHABILITACIÓN PSICOSOCIAL COMUNITARIA PARA LA CONVIVENCIA Y NO REPETICIÓN asignada a esta institución por el Ministerio de Salud y Protección Social mediante la Resolución 1275 de 2024, extiende invitación a participar de la convocatoria para la contratación de un profesional administrativo y financiero (profesionales en el área de conocimiento economía, administración, contaduría y afines).",
    "requisitos": [
      "Profesional en el área de conocimiento economía, administración, contaduría y afines.",
      "Consulte los requisitos completos en el documento de la convocatoria."
    ],
    "imagenUrl": "/assets/vacantes/administrativo-financiero.jpg",
    "documentoUrl": "https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Profesional%20Administrativo%20y%20Financiero_342342342.pdf",
    "fechaPublicacion": "2024-10-02T12:00:00.000Z",
    "estado": "cerrada",
    "migradoDe": "esehospitalguaviare.gov.co/trabaja-con-nosotros"
  }
];

export const COTIZACIONES_SEMILLA: Omit<Cotizacion, 'id'>[] = [
  {
    "titulo": "Mantenimiento preventivo y correctivo al instrumental quirúrgico del servicio de cirugía y la central de esterilización",
    "descripcion": "La E.S.E. Hospital San José del Guaviare requiere contratar el servicio de mantenimiento preventivo y correctivo al instrumental quirúrgico del servicio de cirugía y la central de esterilización. Consulte en el documento las especificaciones técnicas, los requisitos habilitantes y las condiciones para presentar su cotización.",
    "dependencia": "Subgerencia Administrativa y Financiera",
    "documentoUrl": "https://esehospitalguaviare.gov.co/resourses/archivos/pdf/inv%20mto%20quirurgico.pdf",
    "documentoNombre": "Invitación a presentar cotización - Mantenimiento instrumental quirúrgico.pdf",
    "fechaPublicacion": "2026-10-08T12:00:00.000Z",
    "estado": "publicada",
    "migradoDe": "esehospitalguaviare.gov.co/invitaciones-a-presentar-propuestas-cotizacion"
  },
  {
    "titulo": "Servicio de transporte asistencial básico y medicalizado terrestre para el proceso de referencia y contrarreferencia",
    "descripcion": "La E.S.E. Hospital San José del Guaviare requiere contratar el servicio de transporte asistencial básico y transporte asistencial medicalizado terrestre para apoyar y fortalecer el proceso de referencia y contrarreferencia. Consulte en el documento las condiciones para presentar su cotización.",
    "dependencia": "Subgerencia Administrativa y Financiera",
    "documentoUrl": "https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INVITACION%20A%20PRESENTAR%20COTIZACION%20PRESTACION%20DE%20SERVICIOS%20DE%20TRANSPORTE%20ASISTENCIAL%20BASICO,%20ASISTENCIAL%20MEDICALIZADO%20TERRESTRE,%20PARA%20APOYAR%20Y%20FORTALECER%20EL%20PROCESO%20DE%20REFERENCIA%20Y%20CONTRARE.pdf",
    "documentoNombre": "Invitación a presentar cotización - Transporte asistencial.pdf",
    "fechaPublicacion": "2026-10-05T12:00:00.000Z",
    "estado": "publicada",
    "migradoDe": "esehospitalguaviare.gov.co/invitaciones-a-presentar-propuestas-cotizacion"
  },
  {
    "titulo": "Suministro de materiales y reactivos para laboratorio clínico y servicio de gestión pretransfusional",
    "descripcion": "La E.S.E. Hospital San José del Guaviare requiere contratar el suministro de materiales y reactivos para el laboratorio clínico y el servicio de gestión pretransfusional, con apoyo tecnológico y software de gestión. Consulte en el documento las condiciones para presentar su cotización.",
    "dependencia": "Subgerencia Administrativa y Financiera",
    "documentoUrl": "https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INVITACION%20A%20COTIZAR%20DE%20MATERIAL%20DE%20LABORATORIO.pdf",
    "documentoNombre": "Invitación a cotizar - Material de laboratorio.pdf",
    "fechaPublicacion": "2026-09-25T12:00:00.000Z",
    "estado": "publicada",
    "migradoDe": "esehospitalguaviare.gov.co/invitaciones-a-presentar-propuestas-cotizacion"
  }
];
