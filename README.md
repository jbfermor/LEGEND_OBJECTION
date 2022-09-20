# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

*EXPORTAR DATOS A EXCEL

*************************************

HECHO:

* Posibles modelos:
* #Zona
* #Tipo de  comentario
* #Persona


En CONFIGURACION, para poder añadir

Zona {
  id
  name
}

Tipo de comentarios {
  id
  name
}

Tipos: Objecion, Buena práctica

Fuera de configuración.

Persona {
  id
  name
  *zona_id: obligatorio
}


Comentario {
  id
  title
  description
  *tipo
}

Coincidencia
Coincidencia {
  id
  descripcion
  *comentario
  *persona
}

Pagina principal:
  Objeciones
    Lista de objeciones
    Cada una con un numero de objeciones iguales
    Cada una con un un boton para añadir una objecion igual de otra persona (coincidencia)
      Modal: guarda quien hace el comentario y lo suma
        Zona
        Persona
        Mensaje: Si no está, créala antes

  Buenas practicas
    Idem a Objeciones