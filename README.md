# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Posibles modelos:


Comentario

Fuera de configuración.

Comentario {
  id
  title
  description
  *tipo
}

Pagina principal:
  Objeciones
    Lista de objeciones
    Cada una con un numero de objeciones iguales
    Cada una con un un boton para añadir una objecion igual de otra persona
      Modal: guarda quien hace el comentario y lo suma
        Zona
        Persona
        Mensaje: Si no está, créala antes

  Buenas practicas
    Idem a Objeciones

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