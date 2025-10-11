#let lab_report(
  title: "LAPORAN PRAKTIKUM",
  course: "DASAR PEMOGRAMAN",
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
    #image("logo.png", width: 18em)
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

  set page(
    numbering: "1",
    number-align: right,
  )
  
  body
}

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
  deskripsi: (),
  pertanyaan: ()
)) = {
  text[
    = Praktikum

    #indent[
      #for item in data [
        == #item.subbab
  
        #indent[
          #for point in item.deskripsi [
            + #point
            
          ]
        ]
  
        #colbreak()
        #text(weight: "bold", size: 16pt, "Pertanyaan")
  
        #indent[
          #for (point, answer) in item.pertanyaan [
            + #point

            #indent[- #answer]
            
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

#let Tugas

// Usage example - delete this section when using the template
#show: lab_report.with(
  title: "LAPORAN PRAKTIKUM",
  course: "DASAR PEMOGRAMAN",
  subtitle: "(JOBSHEET 5)",
  name: "Masando Fami Ramadhan",
  nim: "254107060011",
  class: "1B",
  absent: "14",
  study_program: "PROGRAM STUDI SISTEM INFORMASI BISNIS",
  department: "JURUSAN TEKNOLOGI INFORMASI",
  institution: "POLITEKNIK NEGERI MALANG",
  year: "2025",
)

#tujuan(data: (
  "Mahasiswa mampu menyelesaikan permasalahan/studi kasus menggunakan sintaks pemilihan sederhana dan pemilihan bersarang.",
  "Mahasiswa mampu menerapkan sintaks pemilihan sederhana dan pemilihan bersarang ke dalam program Java."
))

#praktikum(data: (
  (
    subbab: "Percobaan 2: Penerapan IF dan IF-ELSE untuk Mencetak KRS",
    deskripsi: (
      [Masih dengan repo yang sama, buat folder baru bernamakan "Jobsheet5". Buat file baru di dalam folder tersebut dengan nama `ifCetakKRS{NoAbsen}.java`.],
      [Tambahkan kode berikut:
      ```java
      import java.util.Scanner;
      
      public class ifCetakKRS14 {
          public static void main(String[] args) {
              Scanner input = new Scanner(System.in);
              
              System.out.print("Apakah UKT sudah lunas? (true/false): ");
              boolean uktLunas = input.nextBoolean();
              
              if (uktLunas) {
                  System.out.println("Registrasi berhasil!");
                  System.out.println("Silahkan cetak KRS");
              }
          }
      }
      ```],
      [_Compile_ dan _run_ program tersebut.],
      [_Commit_ dan _push_ perubahan tersebut "Percobaan 1"]
    ),
    pertanyaan: (
      (
        "Mengapa pengecekan pada struktur IF tersebut tidak melibatkan kondisi dengan operator relasional?",
        [Karena pada variabel `uktLunas`, dia sudah bertipe boolean, sehingga kita tidak perlu mengecek lagi apakah itu `true` atau `false`]
      ),
      (
        "Saat program dijalankan, kemudian Anda mengisikan nilai false, bagaimana hasilnya?",
        "Program tersebut akan langsung berhenti tanpa mencetak nilai apapun setelah itu."
      ),  
      (
        [Sistem perlu memberikan informasi apabila pengguna memasukkan nilai `false`?],
        "Modifikasi dengan menambahkan struktur ELSE."
      ),    
    )
  ),
  (
    subbab: "Percobaan 1: Nyobak AE",
    deskripsi: (
      [Masih dengan repo yang sama, buat folder baru bernamakan "Jobsheet5". Buat file baru di dalam folder tersebut dengan nama `ifCetakKRS{NoAbsen}.java`.],
      [Tambahkan kode berikut:
      ```java
      import java.util.Scanner;
      
      public class ifCetakKRS14 {
          public static void main(String[] args) {
              Scanner input = new Scanner(System.in);
              
              System.out.print("Apakah UKT sudah lunas? (true/false): ");
              boolean uktLunas = input.nextBoolean();
              
              if (uktLunas) {
                  System.out.println("Registrasi berhasil!");
                  System.out.println("Silahkan cetak KRS");
              }
          }
      }
      ```],
      [_Compile_ dan _run_ program tersebut.],
      [_Commit_ dan _push_ perubahan tersebut "Percobaan 1"]
    ),
    pertanyaan: (
      (
        "Mengapa pengecekan pada struktur IF tersebut tidak melibatkan kondisi dengan operator relasional?",
        [Karena pada variabel `uktLunas`, dia sudah bertipe boolean, sehingga kita tidak perlu mengecek lagi apakah itu `true` atau `false`]
      ),
      (
        "Saat program dijalankan, kemudian Anda mengisikan nilai false, bagaimana hasilnya?",
        "Program tersebut akan langsung berhenti tanpa mencetak nilai apapun setelah itu."
      ),  
      (
        [Sistem perlu memberikan informasi apabila pengguna memasukkan nilai `false`?],
        "Modifikasi dengan menambahkan struktur ELSE."
      ),    
    )
  ),
))

#tugas(data: (
  (
    subbab: "Tugas 1",
    konten: [
      etst
    ]
  ),
))

// #indent[
//   == Percobaan 1: Penerapan IF dan IF-ELSE untuk Mencetak KRS

//   #indent[
//     
//   ]

  
  
  

//   #colbreak()
//   == Percobaan 2: SWITCH-CASE untuk Mencetak KRS
// ]

// #colbreak()
// = Tugas

// #indent[
//   == Tugas 1
  
//   Buka kembali file `IfCetakKRSNoPresensi.java`, tambahkan baris baru di dalam fungsi main untuk melakukan transformasi program cetak KRS hasil modifikasi menggunakan struktur IF-ELSE yang telah dibuat ke dalam bentuk Ternary Operator!
  
//   == Tugas 2
  
//   Implementasikan flowchart tersebut ke dalam kode program Java dengan struktur pemilihan IF-ELSE!
// ]


// #v(2em)

// *Link Praktikum:* #link("https://github.com/fami0110/Praktikum_Daspro")