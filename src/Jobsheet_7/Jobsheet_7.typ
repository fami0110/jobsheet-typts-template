#import "../../tmp.typ": indent, lab_report, praktikum, tugas, tujuan

#lab_report(
  title: "LAPORAN PRAKTIKUM ALGORITMA & STRUKTUR DATA",
  course: "PRAKTIKUM ALGORITMA & STRUKTUR DATA",
  subtitle: "(JOBSHEET 7)",
  name: "Masando Fami Ramadhan",
  nim: "254107060011",
  class: "1B",
  absent: "14",
  study_program: "PROGRAM STUDI SISTEM INFORMASI BISNIS",
  department: "JURUSAN TEKNOLOGI INFORMASI",
  institution: "POLITEKNIK NEGERI MALANG",
  year: "2026",
)[

  #tujuan(data: (
    "Menjelaskan mengenai algoritma Searching.",
    "Membuat dan mendeklarasikan struktur algoritma Searching.",
    "Menerapkan dan mengimplementasikan algoritma Searching."
  ))

  #praktikum(data: (
    (
      subbab: "Percobaan 1: Sequential Search",
      deskripsi: [
        Perhatikan diagram class Mahasiswa di bawah ini. Diagram class ini yang selanjutnya akan dibuat sebagai acuan dalam membuat kode program class Mahasiswa.

        #align(center)[
          #table(
            columns: (auto),
            inset: 8pt,
            align: left,
            align(center)[*Mahasiswa*],
            [
              nim: String \
              nama: String \
              kelas: String \
              ipk: double
            ],
            [
              Mahasiswa() \
              Mahasiswa(nm: String, name: String, kls: String, ip: double) \
              tampilInformasi(): void
            ]
          )
        ]

        #set align(left)
        Berdasarkan class diagram di atas, akan dibuat class Mahasiswa yang berfungsi untuk membuat objek mahasiswa yang akan dimasukan ke dalam sebuah array. Terdapat sebuah konstruktor berparameter dan juga fungsi #raw("tampilInformasi()") untuk menampilkan semua atribut yang ada.

        #align(center)[
          #table(
            columns: (auto),
            inset: 8pt,
            align: left,
            align(center)[*MahasiswaBerprestasi*],
            [
              listMhs: Mahasiswa[5] \
              idx: int
            ],
            [
              tambah(mhs: Mahasiswa): void \
              tampil(): void \
              sequentialSearch(double cari): int \
              tampilPoisisi(double x, int pos): void \
              tampilDataSearch(double x, int pos) : void
            ]
          )
        ]

        #set align(left)
        Selanjutnya class diagram di atas merupakan representasi dari sebuah class yang berfungsi untuk melakukan operasi-operasi dari objek array Mahasiswa, misalkan untuk menambahkan objek mahasiswa, menampilkan semua data mahasiswa, untuk melakukan pencarian berdasarkan IPK menggunakan algoritma Sequential Search, menampilkan posisi dari data yang dicari, serta menampilkan data mahasiswa yang dicari.
      ],
      langkah: (
        // [Buat file baru dengan nama `MahasiswaBerprestasi{NoAbsen}.java`.],
        [Tambahkan fungsi `sequentialSearching`, `tampilPosisi`, dan `tampilDataSearch` di file `MahasiswaBerprestasi{NoAbsen}.java`:
        ```java
        int sequentialSearching(double cari) {
          int posisi = -1;
          for (int j = 0; j < listMhs.length; j++) {
            if (listMhs[j].ipk == cari) {
              posisi = j;
              break;
            }
          }
          return posisi;
        }

        void tampilPosisi(double x, int pos) {
          if (pos != -1) {
            System.out.println("data mahasiswa dengan IPK : " + x + " ditemukan pada indeks " + pos);
          } else {
            System.out.println("data " + x + " tidak ditemukan");
          }
        }

        void tampilDataSearch(double x, int pos) {
          if (pos != -1) {
            System.out.println("nim\t : " + listMhs[pos].nim);
            System.out.println("nama\t : " + listMhs[pos].nama);
            System.out.println("kelas\t : " + listMhs[pos].kelas);
            System.out.println("ipk\t : " + x);
          } else {
            System.out.println("Data mahasiswa dengan IPK " + x + " tidak ditemukan");
          }
        }
        ```],
        [Modifikasi file `MahasiswaDemo{NoAbsen}.java` seperti idxmin:
        ```java
        import java.util.Scanner;

        public class MahasiswaDemo14 {
          public static void main(String[] args) {
            Scanner sc = new Scanner(System.in);
            String nim, nama, kelas;
            double ipk;

            MahasiswaBerprestasi14 list = new MahasiswaBerprestasi14();

            System.out.println("SISTEM MANAJEMEN DATA MAHASISWA BERPRESTASI\n");
            for (int i = 0; i < list.listMhs.length; i++) {
              System.out.println("Masukkan data mahasiswa ke-"+(i+1));
              
              System.out.print("NIM	: ");
              nim = sc.nextLine();
              
              System.out.print("Nama	: ");
              nama = sc.nextLine();
              
              System.out.print("Kelas	: ");
              kelas = sc.nextLine();
              
              System.out.print("IPK	: ");
              ipk = sc.nextDouble();
              sc.nextLine();

              list.tambah(new Mahasiswa14(nim, nama, kelas, ipk));

              System.out.println("------------------");
            }

            System.out.println("Data mahasiswa sebelum sorting: ");
            list.tampil();

            System.out.println("Pencarian data");
            System.out.println("------------------");
            System.out.println("masukkan ipk mahasiswa yang dicari: ");
            System.out.print("IPK: ");
            double cari = sc.nextDouble();

            System.out.println("menggunakan sequential searching");
            double posisi = list.sequentialSearching(cari);
            int pss = (int) posisi;
            list.tampilPosisi(cari, pss);
            list.tampilDataSearch(cari, pss);

            sc.close();
          }
        }
        ```
        #colbreak()
        ],
        [_Compile_ dan _run_ program tersebut.
          #image("1a.png")
          #colbreak()
        ],
      ),
      pertanyaan: (
        (
          [Jelaskan perbedaan method `tampilDataSearch` dan `tampilPosisi` pada class `MahasiswaBerprestasi`!],
          [`tampilPosisi` berfungsi untuk menampilkan *pesan posisi index* sesuai dengan data parameter yang dimasukkan. Sedangkan `tampilDataSearch` berfungsi untuk menampilkan detail data berdasarkan parameter yang dimasukkan. Jika pada parameter pos isinya *-1*, maka kedua fungsi yang menampilkan pesan data tidak ditemukan.]
        ),
        (
          [Jelaskan fungsi `break` pada kode program di bawah ini!
          ```java
          if (listMhs[j].ipk == cari) {
            posisi = j;
            break;
          }
          ```],
          [Break berfungsi untuk menghentikan loop apabila data telah ditemukan.]
        ),
        (
          [Apa fungsi variabel pos atau indeks hasil pencarian dalam program sequential search?],
          [Variabel tersebut berfungsi untuk menyimpan *data indeks* dari hasil _sequential search_. Jika tidak ditemukan, maka nilainya akan diset menjadi *-1*.]
        ),
        (
          [Jika terdapat lebih dari satu data dengan nilai yang sama, hasil pencarian sequential search yang dibuat di atas akan menampilkan data ke berapa? Jelaskan!],
          [Algoritma _sequential search_ akan mencari *kemunculan pertama* dari suatu data apabila data tersebut terdapat lebih 1. Hal ini disebabkan karena _sequential search_ melakukan pencarian secara berurutan (dari indeks 0 sampai index ke $n$)]
        ),
        (
          [Berkaitan dengan pertanyaan nomor 2 di atas, apa yang terjadi jika perintah break dihapus dari kode di atas?],
          [Walaupun data sudah ditemukan, fungsi tersebut akan tetap melakukan pencarian sampai elemen terakhir. Sehingga apabila data yang dicari adalah data duplikat, data indeks yang dikembalikan akan menunjuk ke *kemunculan terakhir* data tersebut.]
        ),
      ),
    ),
    (
      subbab: "Percobaan 1: Sequential Search",
      deskripsi: [
        
      ],
      langkah: (
        [Tambahkan fungsi `findBinarySearch`, pada file `MahasiswaBerprestasi{NoAbsen}.java`:
        ```java
        int findBinarySearch(double cari, int left, int right) {
          int mid;
          if (right >= left) {
            mid = (left + right) / 2;
            if (cari == listMhs[mid].ipk) {
              return (mid);
            } else if (listMhs[mid].ipk > cari) {
              return findBinarySearch(cari, left, mid - 1);
            } else {
              return findBinarySearch(cari, mid + 1, right);
            }
          }
          return -1;
        }
        ```],
        [Tambahkan baris berikut di file `MahasiswaDemo{NoAbsen}.java` seperti idxmin:
        ```java
        System.out.println("------------------");
        System.out.println("Pencarian data");
        System.out.println("------------------");
        System.out.println("masukkan ipk mahasiswa yang dicari: ");
        System.out.print("IPK: ");
        cari = sc.nextDouble();

        System.out.println("menggunakan binary search");
        double posisi2 = list.findBinarySearch(cari, 0, list.listMhs.length-1);
        int pss2 = (int) posisi2;
        list.tampilPosisi(cari, pss2);
        list.tampilDataSearch(cari, pss2);
        ```
        #colbreak()
        ],
        [_Compile_ dan _run_ program tersebut.
          #image("2a.png")
          #colbreak()
        ],
      ),
      pertanyaan: (
        (
          [Tunjukkan pada kode program yang mana proses _divide_ dijalankan!],
          [Proses *divide* terjadi pada baris `mid = (left + right) / 2;`, di mana rentang pencarian dibagi menjadi dua bagian melalui titik tengah.]
        ),
        (
          [Tunjukkan pada kode program yang mana proses _conquer_ dijalankan!],
          [Proses *conquer* terjadi saat pemanggilan rekursif `findBinarySearch(cari, left, mid - 1)` atau `findBinarySearch(cari, mid + 1, right)`, di mana program fokus mencari pada salah satu sub-bagian yang relevan.]
        ),
        (
          [Apa fungsi `left`, `right`, dan `mid`?],
          [
            `left`: Indeks awal rentang pencarian.  \
            `right`: Indeks akhir rentang pencarian.  \
            `mid`: Indeks titik tengah yang digunakan sebagai pembanding dengan data yang dicari.
          ]
        ),
        (
          [Jika data IPK yang dimasukkan tidak urut. Apakah program masih dapat berjalan? Mengapa demikian?],
          [Program tetap berjalan, tetapi hasilnya tidak akurat (salah). Hal ini dikarenakan algoritma *binary search* hanya dapat bekerja dengan syarat data *telah terurut*.]
        ),
        (
          [Jika IPK yang dimasukkan dari IPK terbesar ke terkecil (misal: 3.8, 3.7, 3.5, 3.4, 3.2) dan elemen yang dicari adalah 3.2. Bagaimana hasil dari binary search? Apakah sesuai? Jika tidak sesuai maka ubahlah kode program binary seach agar hasilnya sesuai],
          [
            Hasilnya tidak sesuai karena logika default pada fungsi `findBinarySearch` adalah untuk data yang telah terurut secara _ascending_. Oleh karena itu, kita perlu memanggil fungsi `selectionSort` sebelum fungsi `findBinarySearch` dipanggil:
            ```java
            System.out.println("menggunakan binary search");
            list.selectionSort(); // Sort terlebih dahulu
            double posisi2 = list.findBinarySearch(cari, 0, list.listMhs.length-1);
            int pss2 = (int) posisi2;
            list.tampilPosisi(cari, pss2);
            list.tampilDataSearch(cari, pss2);
            ```
          ]
        ),
        (
          [Jelaskan bagaimana binary search menentukan bahwa data yang dicari tidak ditemukan di dalam array.],
          [Data dianggap tidak ditemukan jika kondisi `right >= left` tidak lagi terpenuhi (indeks `left` melewati indeks `right`), sehingga fungsi keluar dari blok `if` dan mengembalikan nilai `-1`.]
        ),
        (
          [Modifikasi program di atas yang mana jumlah mahasiswa yang diinputkan sesuai dengan masukan dari keyboard.],
          [
            *MahasiswaDemo14.java*
            ```java
            ...
            System.out.println("SISTEM MANAJEMEN DATA MAHASISWA BERPRESTASI\n");
		
            // Input jml sebelum input
            System.out.print("Jumlah mahasiswa: ");
            int jml = sc.nextInt();
            sc.nextLine();

            MahasiswaBerprestasi14 list = new MahasiswaBerprestasi14(jml);
            ...
            ```
            *MahasiswaBerprestasi14.java*
            ```java
            ...
            // Tambah constructor default tanpa parameter & dengan parameter
            MahasiswaBerprestasi14() {
              this.listMhs = new Mahasiswa14[5];
            }

            MahasiswaBerprestasi14(int len) {
              this.listMhs = new Mahasiswa14[len];
            }
            ...
            ```
          ]
        ),
      ),
    ),
  ))

  // #tugas(data: (
  //   (
  //     subbab: "Tugas 1",
  //     konten: [
  //       Perhatikan class diagram dibawah ini:

        
  //       Berdasarkan class diagram diatas buatlah menu dikelas main dengan pilihan menu:
        
  //       #colbreak()

  //       #table(
  //         columns: 1,
  //         [*Dosen14.java*],
  //         [```java
         
  //         ```],
  //       )

  //       #colbreak()

  //     ],
  //   ),
  // ))

  \
  *Link Praktikum:* #link("https://github.com/fami0110/Praktikum_ASD")

]
