# TugasBesarDAP

Untuk mata kuliah Dasar Algoritma Pemrograman yang dikerjakan secara individu

## Deskripsi Singkat
tabelDinkes berisi :
1. Array tipe data Kesehatan
2. N yang merupakan nomor ID (default = 1,2,3,dst.) 

Sementara tipe data kesehatan berisi :
1. Nama Dinas Kesehatan :  Bisa rumah sakit, posyandu, puskesmas, dsb
2. Asuhan               :  Banyaknya 'asuhan' dari dinas kesehatan tersebut bisa meliputi pasien, balita, ataupun lansia
3. Tenaga_Kesehatan     :  Banyaknya tenaga kesehatan bisa meliputi dokter, bidan, perawat, dsb.
4. Rasio                :  Perbandingan jumlah tenaga kesehatan / jumlah asuhan

## Overview
1. Pertama-tama User diminta untuk input banyaknya Dinas Kesehatan yang ingin dimasukkan (bilangan yang boleh berkisar mulai dari 1-10)
2. User diminta untuk input nama Dinas Kesehatan, banyak Asuhan, banyak Tenaga Kesehatan masing-masing sebanyak yang telah didefinisikan di atas
3. Program akan mencetak tabel dari hasil inputan user (kolom Rasio masih dibiarkan kosong)
4. Selanjutnya, user memasukkan nama Dinas Kesehatan yang ingin dicari apakah ada pada tabel tersebut. Jika ditemukan, maka program akan menampilkan komponen-komponennya (Nama, Asuhan, Tenaga Kesehatan)
5. Lalu, program mencari Dinas Kesehatan yang memiliki Asuhan terbanyak. Setelah itu, program menampilkan nama Dinas Kesehatan dan banyak Asuhannya
6. Program mencari rata-rata jumlah Tenaga Kesehatan lalu menampilkan hasilnya
7. Program mencari Rasio masing-masing dan mengurutkannya dari rasio yang terkecil (Sorting Ascending). Rasio terkecil adalah prioritas yang tertinggi.
8. Mencetak tabel yang terlah diurutkan
9. Program mengurutkan lagi tabel berdasarkan banyaknya Tenaga Kesehatan dari yang terkecil (Sorting Ascending)
10. Mencetak tabel yang telah diurutkan

## Fitur-fitur
1. Memasukkan data ke Tabel
2. Menampilkan Tabel
3. Pencarian nama Dinas Kesehatan
4. Pencarian Dinas Kesehatan dengan jumlah Asuhan terbesar
5. Menghitung rata-rata Tenaga Kesehatan (jumlah Tenaga Kesehatan/Banyaknya)
6. Menghitung Rasio (jumlah Tenaga Kesehatan/jumlah Asuhan)
7. Mengurutkan Rasio secara meningkat (Ascending)
8. Mengurutkan Tenaga Kesehatan secara meningkat (Ascending)

## Cara Buka
1. Buka folder dinas_kesehatan.exe dengan
```
./tenaga_kesehatan
```
Pastikan pada direktori yabg sama
2. Atau bisa buka file dinas_kesehatan.pas dengan IDE yang kalian punya (untuk ini, saya menggunakan Free Pascal IDE)
