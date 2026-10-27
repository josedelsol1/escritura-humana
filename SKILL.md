---
name: escritura-humana
description: >
  Reglas de escritura que eliminan los patrones que delatan a un texto generado por IA,
  según el catálogo de Wikipedia:Signs of AI writing. Aplica SIEMPRE que se redacte,
  reescriba, resuma o traduzca prosa destinada a una persona — captions de Instagram,
  copy web, correos, propuestas comerciales, informes, artículos, trabajos académicos,
  guiones, mensajes de WhatsApp, descripciones de producto, posts de foro, README en
  español. Activar aunque el usuario no diga "humanizar": si el resultado es texto que
  alguien va a leer y creer escrito por José, esta skill manda. También al pedir
  explícitamente "que no suene a IA", "humaniza esto", "sácale lo robótico",
  "que pase los detectores".
---

# Escritura humana

Catálogo completo de patrones y su evidencia: `references/patrones-ia.md`.
Auditor automático: `scripts/auditar.sh`.

## Honestidad primero

Estas reglas hacen que el texto **suene escrito por una persona**, que es lo que
importa. No garantizan "pasar un detector": los detectores tienen tasas de error
altas en ambas direcciones, se contradicen entre sí y marcan como IA textos humanos
bien escritos. Si alguien te pide una garantía, dilo así de claro. Lo que sí es
verificable es que el texto no contenga ninguno de los patrones de abajo.

## Las reglas que no se rompen

### 1. Contenido

1. **Nada de grandilocuencia sobre la importancia.** Prohibido "marcó un hito",
   "es un testimonio de", "juega un papel crucial", "dejó una huella imborrable",
   "sentó las bases", "punto de inflexión", "en constante evolución", "refleja una
   tendencia más amplia". Si el dato es importante, el dato lo demuestra solo.
2. **Dato concreto antes que elogio genérico.** "Inventó el primer enganche
   automático de vagones", no "un titán revolucionario de la industria". Ante la
   duda: nombre, cifra, fecha, lugar.
3. **Cero análisis pegado con gerundio.** Nada de "…, destacando su relevancia",
   "…, garantizando la calidad", "…, fomentando la comunidad", "…, reflejando".
   Si la frase termina en gerundio valorativo, se corta ahí.
4. **Cero tono de folleto.** Fuera "cuenta con", "vibrante", "enclavado en el
   corazón de", "amplia variedad de", "compromiso con la excelencia", "innovador".
5. **Nada de atribuciones fantasma.** No "los expertos señalan" ni "diversas
   fuentes": o se nombra a quién, o no se dice.
6. **Sin cierre de "desafíos y perspectivas futuras"**, ni sección "Retos",
   ni "Premios y reconocimientos" salvo que el encargo lo pida por nombre.
7. **Sin resumen final.** Prohibido "En resumen", "En conclusión", "En definitiva",
   "En general". El texto termina cuando termina lo que tenía que decir.

### 2. Lengua

8. **Lista negra de vocabulario.** No usar, salvo que sea el término técnico exacto
   e insustituible: *crucial, clave, fundamental, pilar, hito, panorama, tapiz,
   profundizar, sumergirse, fomentar, impulsar, potenciar, enriquecer, destacar,
   subrayar, resaltar, meticuloso, robusto, vibrante, rico, integral, holístico,
   transformador, revolucionario, abordar, aprovechar, empoderar, alinear,
   garantizando, permitiendo, reflejando, consolidando*. En inglés: *delve,
   crucial, pivotal, underscore, showcase, foster, enhance, tapestry, landscape,
   testament, robust, vibrant, meticulous, boasts, garner, intricate, align with*.
9. **Usa "es", "hay", "tiene".** Nunca "sirve como", "se erige como", "funciona
   como", "constituye", "representa", "alberga", "ofrece", "se refiere a".
10. **Di quién hizo qué.** No "estuvo vinculado a la dirección de la empresa",
    sino "fue gerente de la empresa entre 2017 y 2020".
11. **Prohibido el paralelismo negativo.** Ni "no solo… sino también", ni "no es X,
    es Y", ni "no se trata de…, se trata de…", ni "más que X, Y".
12. **Prohibida la regla de tres.** Nada de tres adjetivos, tres ejemplos, tres
    cláusulas rítmicas. Usa dos, o cuatro, o uno.
13. **"Además" no abre frase.** Ni "Asimismo", ni "Por otro lado" de relleno,
    ni "Cabe destacar que", ni "Es importante señalar que".
14. **Repite la palabra.** Si el sujeto es "el box", en el párrafo siguiente
    también es "el box", no "el recinto" ni "este espacio de entrenamiento".
15. **Verbo llano**: escribió (no "realizó la autoría"), se mudó (no "se relocalizó"),
    usó (no "utilizó"), murió (no "falleció"), empezó (no "dio inicio a").
16. **Ritmo desigual.** Mezcla frases largas con frases de cinco palabras. Párrafos
    de distinto tamaño. Si todos los párrafos miden lo mismo, está mal.
17. **Afirma cuando puedas afirmar.** Superlativos verdaderos sí: "fue el primero",
    "es el único". Y matizadores humanos también: "muy", "casi siempre", "quizá".

### 3. Formato

18. **Negrita solo para lo que de verdad se busca de un vistazo**, nunca para
    resaltar conceptos dentro de un párrafo.
19. **Prohibida la lista de "- **Cabecera**: descripción"**. Si va lista, va sin
    negrita inline; y si son frases completas, va en prosa.
20. **Sin emoji decorando encabezados ni viñetas.** En redes, emoji solo donde José
    ya los usa y como los usa (ver skill `levelup` / voz de canal).
21. **Raya (—) con moderación y sin espacios**, o mejor coma, paréntesis o dos
    puntos.
22. **Encabezados en mayúscula solo la primera letra** ("Cómo entrenar en casa",
    no "Cómo Entrenar En Casa"). Sin repetir el título como primer encabezado.
    Sin encabezados vacíos que solo contienen otros encabezados. Sin `---` entre
    secciones.
23. **Formato del destino, no Markdown por defecto.** Si va a Instagram, WhatsApp,
    un documento o un CMS, nada de `##` ni `**`.

### 4. Restos de chatbot: tolerancia cero

24. **Nada dirigido al lector-usuario dentro del entregable**: "¡Por supuesto!",
    "Espero que te sirva", "Aquí tienes", "¿Quieres que lo adapte?". Eso va en mi
    mensaje, jamás dentro del texto.
25. **Nada de descargos de conocimiento**: "hasta mi última actualización",
    "según la información disponible", "no está ampliamente documentado",
    "mantiene un perfil bajo".
26. **Ningún marcador residual**: `oaicite`, `citeturn0search0`, `[cite: 1]`,
    `【85†L…】`, `[web:1]`, `:::writing{…}`, `utm_source=chatgpt.com`,
    `referrer=grok.com`, `[Nombre aquí]`, fechas `2025-xx-xx`.
27. **Comillas y apóstrofos coherentes** en todo el texto, sin mezclar rectos y
    tipográficos.

### 5. Verdad

28. **No inventar fuentes.** Ni DOI, ni ISBN, ni enlaces, ni citas de página. Si no
    se ha verificado, no se cita; y se dice cuál falta por verificar.
29. **Si el texto es para publicar como propio de José**, el contenido tiene que ser
    suyo: sus datos, su experiencia, sus números. Yo pongo la redacción, no invento
    la vivencia.

## Cómo trabajo con esto

1. Escribo el borrador aplicando las reglas desde el principio (no escribir feo y
   luego limpiar: el resultado se nota).
2. Paso el auditor: `bash ~/.claude/skills/escritura-humana/scripts/auditar.sh archivo.txt`
   — o sobre texto pegado por stdin.
3. Corrijo cada marca. Si una palabra de la lista negra es insustituible (término
   técnico real), la dejo y lo digo.
4. Reviso a mano lo que el grep no ve: regla de tres, ritmo uniforme, gerundios
   valorativos, párrafos clonados, variación elegante.
5. Leo el texto en voz alta mentalmente. Si suena a discurso de inauguración,
   vuelvo al paso 1.

## Voz por canal

Estas reglas quitan lo robótico. El **registro** lo pone el canal: Instagram
personal, LevelUP, CrossBox, correo comercial, foro del diplomado, trabajo
académico. Si existe skill de ese canal (`levelup`, `humanizador-personal`,
`marketing`), se combina: primero la voz del canal, después esta auditoría.
