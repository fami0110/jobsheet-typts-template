#let lab_report(
  title: "LAPORAN PRAKTIKUM",
  course: "PRAKTIKUM DASAR PEMOGRAMAN",
  subtitle: "(JOBSHEET 1)",
  name: "Nama Mahasiswa",
  nim: "000000000000",
  class: "1A",
  absent: "00",
  study_program: "PROGRAM STUDI SISTEM INFORMASI BISNIS",
  department: "JURUSAN TEKNOLOGI INFORMASI",
  institution: "POLITEKNIK NEGERI MALANG",
  year: "2025",
  body
) = {
  
  // Document Settings
  set document(title: title, author: name)
  set page(paper: "a4")
  set text(font: "Arial", size: 12pt, lang: "id")
  set text(font: "Arial", size: 12pt, lang: "id")
  set par(justify: true, leading: 1em, spacing: 1.5em)

  // List Style
  set list(marker: "-", body-indent: 0.8em)

  // link style
  show link: it => {
    set text(blue)
    underline(it)
  }
  
  // Heading Styles
  set heading(numbering: "1.")
  show heading.where(level: 1): it => {
    set text(size: 14pt, weight: "bold")
    set block(spacing: 1.5em)
    it
  }
  show heading.where(level: 2): it => {
    set text(size: 12pt, weight: "bold")
    set block(spacing: 1.2em)
    it
  }
  
  show heading.where(level: 3): it => {
    set heading(numbering: none)
    set text(size: 12pt, weight: "bold")
    set block(spacing: 1em)
    it
  }
  
  // Code block styling
  show raw.where(block: true): it => {
    set block(
      fill: rgb("#f5f5f5"),
      stroke: 1pt + rgb("#e0e0e0"),
      radius: 5pt,
      inset: 10pt,
      width: 100%
    )
    set text(size: 10pt, font: "DejaVu Sans Mono")
    it
  }
  show raw.where(block: false): it => {
    set text(font: "DejaVu Sans Mono", size: 10pt, weight: "bold", white)
    h(5pt)
    box(
      fill: rgb("#2b2c30"),
      outset: 5pt,
      radius: 2pt,
      it
    )
    h(5pt)
  }
  
  // Cover page
  align(center)[
    #v(2cm)
    #text(size: 16pt, weight: "bold")[#title]
    #linebreak()
    #text(size: 14pt, weight: "bold")[#subtitle]

    #v(1cm)
    #image("assets/logo.png", width: 18em)
    #v(1cm)
    
    #text(size: 12pt, weight: "bold")[Disusun Oleh:]
    
    #v(1cm)
    
    #table(
      columns: (auto, auto, auto),
      stroke: none,
      align: left,
      
      [Nama], [:], [#name],
      [NIM], [:], [#nim],
      [Kelas], [:], [#class],
      [No. Absen], [:], [#absent],
    )
    #v(2cm)
    
    #text(size: 12pt, weight: "bold")[
      #study_program \
      #department \
      #institution \
      #year
    ]
  ]
  
  pagebreak()

  // Table of contents
  
  align(center)[
    #text(size: 20pt, weight: "bold", "Daftar Isi")
  ]
  
  {
    show outline.entry.where(level: 1): it => {
      v(20pt, weak: true)
      strong(it)
    }
    outline(title: "", indent: 1.5em)
  }
  
  pagebreak()
  
  // Main content

  let title_case(text: "") = {
    text.split(" ")
      .map(word => word.slice(0, 1).at(0) + lower(word.slice(1)))
      .join(" ")
  }

  set page(
    footer: context [
      #title_case(text: course) -- #title_case(text: subtitle.replace("(", "").replace(")", ""))
      #h(1fr)
      #counter(page).display("1")
    ]
  )
  
  
  body
}

// Templates

#let indent(body) = {
  pad(left: 2em, body)
}

#let tujuan(data: ()) = {
  text[
    = Tujuan

    #indent[
      #for item in data [
        - #item

      ]
    ]
  ]
}

#let praktikum(data: (
  subbab: "Percobaan 1",
  deskripsi: [],
  langkah: (),
  pertanyaan: ()
)) = {
  text[
    = Praktikum

    #indent[
      #for item in data [
        == #item.subbab

        #indent[

          #item.deskripsi

          #for point in item.langkah [
            + #point
            
          ]
        ]

        #if item.pertanyaan.len() != 0 [
          #colbreak()
          #text(weight: "bold", size: 16pt, "Pertanyaan")
    
          #indent[
            #for (i, (point, answer)) in item.pertanyaan.enumerate() [
              #enum(numbering: "1.", start: (i+1))[#point]

              #indent[- #answer]

            ]
          ]
        ]
  
        #colbreak()
      ]
    ]
  ]
}

#let tugas(data: (
  subbab: "Studi Kasus 1",
  konten: [],
)) = {
  text[
    #colbreak()

    = Tugas

    #indent[
      #for item in data [
        == #item.subbab

        #indent[#item.konten]

        #colbreak()
      ]
    ]
  ]
}
