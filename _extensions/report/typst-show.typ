// Typst custom formats typically consist of a 'typst-template.typ' (which is
// the source code for a typst template) and a 'typst-show.typ' which calls the
// template's function (forwarding Pandoc metadata values as required)
//
// This is an example 'typst-show.typ' file (based on the default template  
// that ships with Quarto). It calls the typst function named 'article' which 
// is defined in the 'typst-template.typ' file. 
//
// If you are creating or packaging a custom typst template you will likely
// want to replace this file and 'typst-template.typ' entirely. You can find
// documentation on creating typst templates here and some examples here:
//   - https://typst.app/docs/tutorial/making-a-template/
//   - https://github.com/typst/templates

#show: report.with(
$if(title)$
  title: "$title$",
$endif$
$if(institution)$
  institution: "$institution$",
$endif$
$if(datedebut)$
  datedebut: "$datedebut$",
$endif$
$if(datefin)$
  datefin: "$datefin$",
$endif$
$if(ville)$
  ville: "$ville$",
$endif$
$if(toc)$
  toc: "$toc$",
$endif$
$if(remerciements)$
  remerciements: [$remerciements$],
$endif$
$if(toc-title)$
  toc-title: "$toc-title$",
$endif$
$if(toc-depth)$
  toc-depth: $toc-depth$,
$endif$
$if(stagemaster)$
  stagemaster: "$stagemaster$",
$endif$
$if(author)$
author: "$author$" ,
$endif$
$if(index-terms)$
  index-terms: ($for(index-terms)$"$it$"$sep$, $endfor$),
$endif$
)