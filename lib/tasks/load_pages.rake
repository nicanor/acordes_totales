namespace :load do
  task pages: :environment do

    about_content = 'h2. <i class="fa fa-info-circle"></i>¿Qué es *Acordes TOTALES*?

*Acordes TOTALES* es un sitio web de *acordes y tablaturas* para guitarra, bajo, piano, armónica y para cualquier otro instrumento musical, cuyo objetivo es generar un espacio para que músicos, tanto expertos como principiantes, puedan encontrar y compartir *acordes y tablaturas* de sus artistas favoritos.

h2. <i class="fa fa-heart"></i> Filosofía

*Acordes TOTALES* es acerca de compartir. Y *compartir* es un acto de amor. *Acordes TOTALES* fue construida con la esperanza de crear un lugar en el cual las personas puedan ayudarse y colaborar mutuamente con sus transcripciones. El lema de *Acordes TOTALES* es _*"Por favor copia y comparte nuestras tablaturas"*_.

Acordes TOTALES es una zona libre de prejuicios como el racismo, sexismo, heterosexismo, capacitismo y especismo. Por favor, ayuda a mantenerlo de esa forma.

h2. <i class="fa fa-pencil"></i> Diseño y arquitectura

Acordes TOTALES intenta ser un sitio web simple, rápido y fácil de utilizar. Apunta a tener sólo la información necesaria, y a poder llegar a la misma con el menor esfuerzo posible. Hace énfasis en la velocidad y confiabilidad, y es optimizado constantemente.

<h2 id="por_que_registrarme"><i class="fa fa-question-circle"></i> ¿Por qué registrarme?</h2>

* Podrás *compartir* tus propias tablaturas!
* Tendrás accesos rápidos a tus artistas y canciones favoritos.
* Podrás crear un perfil público y conocer a otras personas como tú.
* Es fácil y es gratis!'

    Page.create(title: 'Acerca de AcordesTOTALES'       , slug: 'acerca-de'                , old_slug: 'acerca_de'       , content: about_content, protected: true)
    Page.create(title: '¿Cómo buscar una tablatura?'    , slug: 'como-buscar'              , old_slug: 'como_buscar'     , content: 'No Content', protected: true)
    Page.create(title: '¿Cómo compartir tus tablaturas?', slug: 'como-compartir-tablaturas', old_slug: 'subir_tablaturas', content: 'No Content', protected: true)
    Page.create(title: '¿Cómo compartir tus videos?'    , slug: 'como-compartir-videos'    , old_slug: 'compartir_video' , content: 'No Content', protected: true)

  end
end