#!/usr/bin/env bash
# Auditor de marcas de escritura IA.
# Uso:  auditar.sh archivo.md       |  cat texto | auditar.sh
# Salida: línea:columna + patrón encontrado, agrupado por categoría.

set -uo pipefail

if [ $# -ge 1 ]; then SRC="$1"; else SRC="/dev/stdin"; fi
TXT=$(cat "$SRC")
HITS=0

scan() { # scan "Categoría" "regex extendida"
  local label="$1" rx="$2" out
  out=$(printf '%s' "$TXT" | grep -n -i -E -o ".{0,40}${rx}.{0,40}" 2>/dev/null)
  if [ -n "$out" ]; then
    printf '\n== %s ==\n%s\n' "$label" "$out"
    HITS=$((HITS + $(printf '%s\n' "$out" | wc -l | tr -d ' ')))
  fi
}

scan "Vocabulario IA (es)" \
'\b(crucial(es)?|pivotal|meticulos[oa]s?|robust[oa]s?|vibrante|holístic[oa]|integral(es)?|transformador|revolucionari[oa]|tapiz|panorama|pilar(es)?|hito|profundiza[rn]|sumergirse|fomenta(r|ndo)?|impulsa(r|ndo)?|potencia(r|ndo)?|enriquece|subraya|resalta|empodera|aprovecha(r|ndo)|abordar|alinea(r|do|ndo))\b'

scan "Vocabulario IA (en)" \
'\b(delve|crucial|pivotal|underscore[sd]?|showcas(e|es|ing)|foster(s|ing)?|enhanc(e|es|ing)|tapestry|landscape|testament|robust|vibrant|meticulous|boasts|garner|intricate|interplay|bolstered)\b'

scan "Grandilocuencia / legado" \
'((es|un) testimonio de|marc[óo] un (hito|antes)|papel (crucial|clave|fundamental)|huella imborrable|sent[óo] las bases|punto de inflexi[óo]n|en constante evoluci[óo]n|tendencia m[áa]s amplia|stands as|serves as|is a testament|played a (crucial|pivotal|key) role)'

scan "Tono folleto / promocional" \
'(cuenta con|enclavad[oa]|en el coraz[óo]n de|amplia (variedad|gama)|compromiso con|belleza natural|nestled|in the heart of|diverse array)'

scan "Análisis pegado con gerundio" \
',\s*(destacando|garantizando|reflejando|fomentando|contribuyendo|consolidando|permitiendo|subrayando|highlighting|ensuring|reflecting|contributing|fostering|emphasizing)'

scan "Atribución fantasma" \
'(los expertos (señalan|coinciden|argumentan)|algunos cr[íi]ticos|diversas fuentes|informes de la industria|observadores|experts (say|argue)|some critics|industry reports)'

scan "Paralelismo negativo" \
'(no solo[^.]{1,60}sino|no s[óo]lo[^.]{1,60}sino|no se trata de[^.]{1,60}se trata|no es[^.]{1,40}, es |not (only|just)[^.]{1,60}but)'

scan "Muletillas de apertura / cierre" \
'(^|\n|[.;:!?]\s+)(Adem[áa]s|Asimismo|Por otro lado|Cabe (destacar|mencionar|señalar)|Es importante (destacar|señalar|recordar)|En resumen|En conclusi[óo]n|En definitiva|En general|Additionally|Moreover|In summary|In conclusion|Overall)\b'

scan "Cópula evitada" \
'(sirve como|se erige como|funciona como|constituye un|representa un|alberga|se refiere a|serves as|functions as|represents a|refers to)'

scan "Conexión vaga" \
'(vinculad[oa] (a|con)|asociad[oa] (a|con)|en relaci[óo]n con|associated with|connected (to|with)|in connection with)'

scan "Restos de chatbot" \
'(oaicite|contentReference|citeturn|turn[0-9]search|attributableIndex|\[cite: ?[0-9]|start_span|end_span|grok_render|grok-card|【[0-9]+†|\[attached_file:|\[web:[0-9]|:::writing|utm_source=(chatgpt|openai|copilot)|referrer=grok)'

scan "Charla con el usuario" \
'(¡?Por supuesto!|Espero que (esto )?te (sirva|ayude)|Aqu[íi] tienes|¿Quieres que|av[íi]same si|Certainly!|I hope this helps|Let me know if|Would you like)'

scan "Descargo de conocimiento" \
'(hasta mi [úu]ltima actualizaci[óo]n|seg[úu]n la informaci[óo]n disponible|no est[áa] ampliamente documentad|mantiene un perfil bajo|as of my last|based on available information|not widely documented)'

scan "Placeholders" \
'(\[[A-ZÁÉÍÓÚÑ][^]]{2,40}\]|\(añade aqu[íi]|20[0-9][0-9]-[xX]{2}-[xX]{2}|TODO:|XXXX)'

scan "Formato delator" \
'(^|\n)\s*[-*•–]\s*\*\*[^*]{2,40}\*\*\s*:|(^|\n)#{1,6} |(^|\n)---+\s*$| — '

scan "Emoji decorando lista/encabezado" \
'(^|\n)\s*(#{1,6} ?)?[-*•]?\s*[\x{1F300}-\x{1FAFF}\x{2600}-\x{27BF}]'

printf '\n──────────────────────────────\n'
if [ "$HITS" -eq 0 ]; then
  echo "Sin marcas automáticas. Falta la revisión manual: regla de tres, ritmo"
  echo "uniforme, variación elegante, párrafos del mismo largo, fuentes inventadas."
else
  echo "$HITS coincidencias. Revisa cada una antes de entregar."
fi
