class ErrorApi extends Error {
  constructor(status, mensaje) {
    super(mensaje);
    this.status = status;
  }
}

/** Traduce errores (incluidos los de MySQL) a respuestas JSON { mensaje } */
function manejarErrores(err, _req, res, _next) {
  if (err instanceof ErrorApi) return res.status(err.status).json({ mensaje: err.message });

  if (err.code === 'ER_DUP_ENTRY') {
    return res.status(409).json({ mensaje: 'Ya existe un registro con ese slug o identificador.' });
  }
  if (err.code === 'ER_NO_REFERENCED_ROW_2' || err.code === 'ER_NO_REFERENCED_ROW') {
    return res.status(400).json({ mensaje: 'La página, menú o archivo relacionado no existe.' });
  }
  if (err.code === 'ER_BAD_NULL_ERROR') {
    return res.status(400).json({ mensaje: 'Faltan campos obligatorios.' });
  }
  if (err.code === 'WARN_DATA_TRUNCATED' || err.code === 'ER_TRUNCATED_WRONG_VALUE_FOR_FIELD' || err.code === 'ER_DATA_TOO_LONG') {
    return res.status(400).json({ mensaje: 'Algún valor no es válido o es demasiado largo.' });
  }
  if (err.code === 'LIMIT_FILE_SIZE') {
    return res.status(413).json({ mensaje: 'El archivo supera el tamaño máximo permitido.' });
  }
  if (err.message?.startsWith('Origen no permitido')) {
    return res.status(403).json({ mensaje: err.message });
  }
  if (err.status === 404) return res.status(404).json({ mensaje: 'No encontrado.' });

  console.error(err);
  res.status(500).json({ mensaje: 'Error interno del servidor.' });
}

module.exports = { ErrorApi, manejarErrores };
