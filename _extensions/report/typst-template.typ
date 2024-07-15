
// This is an example typst template (based on the default template that ships
// with Quarto). It defines a typst function named 'article' which provides
// various customization options. This function is called from the 
// 'typst-show.typ' file (which maps Pandoc metadata function arguments)
//
// If you are creating or packaging a custom typst template you will likely
// want to replace this file and 'typst-show.typ' entirely. You can find 
// documentation on creating typst templates and some examples here: 
//   - https://typst.app/docs/tutorial/making-a-template/
//   - https://github.com/typst/templates

#let report(
  // Titre du rapport.
  title: "Titre du rapport",

  // prénom et nom
  author: "Prénom NOM",
  
  // maître de stage
  stagemaster: "Maître de stage",
  
  //date de début et de fin
  datedebut: "date de début",
  datefin: "date de fin",  
  
  // Institution : 
  
  institution : "Institution",
  
  // Ville : 
  
  ville: "Ville",
  
  // Table des matières : 
  
  toc: none,
  toc-title : "Table des matières",
  toc-depth: 3 ,
  
  // Format A4.
  paper-size: "a4",
  
  //Remerciements 
  remerciements: none,
    
  // Chemin vers la biblio
  bibliography-file: none,

  // The paper's content.
  body
) = {
  // Set document metadata.
  set document(title: title, author: author)
  

  // Set the body font.
  set text(font: "~/work/report/Times_New_Roman", size: 12pt)

  

  // Configure equation numbering and spacing.
  set math.equation(numbering: "(1)")
  show math.equation: set block(spacing: 0.65em)
  

  // Configure lists.
  set enum(indent: 10pt, body-indent: 9pt)
  set list(indent: 10pt, body-indent: 9pt)

  // Configure headings.
  set heading(numbering: "1.1.1)")
  show heading.where(level: 1): set text(size: 14pt, weight: "bold")
  show heading.where(level: 2): set text(size: 13pt, weight: "regular", style: "italic")
  show heading.where(level: 3): set text(size: 12pt, weight: "bold")

//Page de présentation 
set page(numbering: none)
//Auteur

  columns(2, gutter: 14pt)[
  #set par(justify: true, first-line-indent: 1em)
  #show par: set block(spacing: 0.65em)
  
  #align(left)[#text(size: 14pt, weight: "bold", author)]
  #colbreak()
  #align(right)[*ENSAE 3ème année* \ *Stage de fin d'études*]]

//Espacement vertical 
box(height: 5cm)[]


  // Titre.
  
  align(center)[
    #box(
        width: 90%,
        stroke: black,
        inset: 10pt
    )[  \
        #text(size: 24pt, title)
    ]]


   
// Institution et date.

  v(53%)
  columns(2, gutter: 14pt)[
  #set par(justify: true, first-line-indent: 1em)
  #show par: set block(spacing: 0.65em)
  
  #align(left)[#text(size: 14pt, weight: "bold", institution) \ #text(size: 14pt, weight: "bold", ville)]
  #colbreak()
  #align(right)[#text(size: 14pt, weight: "bold")[Maître de stage :] \ #text(size: 14pt, weight: "bold", stagemaster) \
 #text(size: 14pt, weight: "bold", datedebut) - #text(size: 14pt, weight: "bold", datefin)]]

// Configure the page.
  set page(
    paper: paper-size,
    numbering: "1",
    // The margins depend on the paper size.
    margin: if paper-size == "a4" {
      (x: 41.5pt, top: 80.51pt, bottom: 89.51pt)
    } else {
      (
        x: (50pt / 216mm) * 100%,
        top: (55pt / 279mm) * 100%,
        bottom: (64pt / 279mm) * 100%,
      )
    }
  )

pagebreak()

  //Remerciements
  
   if remerciements != none [
    #text(size: 14pt, weight: "bold")[Remerciements :]
    #v(2pt)
    #par(justify: true, leading: 1.5em)[
    #set text(size: 12pt, style: "italic") 
    #remerciements]
    #pagebreak()
  ]
  
 
  //Table des matières
  
   outline(title: text(14pt, weight: "bold", toc-title), depth: int(toc-depth), indent: auto)
   
   pagebreak()
   
 
  //Configuration de l'interligne
  
  set par(leading: 1.5em, justify: true)


  // Corps du texte
  body
  
  
  // Display bibliography.
  if bibliography-file != none {
    show bibliography: set text(8pt)
    bibliography(bibliography-file, title: text(10pt)[References], style: "ieee")
  }
}
