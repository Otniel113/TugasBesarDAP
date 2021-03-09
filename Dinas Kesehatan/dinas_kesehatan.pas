program dinas_kesehatan;
{Program ini meminta user untuk mengisi tabel tentang dinas kesehatan yang masih kosong. User menginput nama dinas kesehatan,
banyaknya pasien/lansia/balita dan banyaknya tenaga kesehatan. Lalu program akan mencari nilai terbesar pasien/lansia/balita,
rata-rata tenaga kesehatan, dan mengurutkan tabel menurut prioritas berdasarkan rasio tenaga kesehatan dengan pasien/lansia/balita.}

type kesehatan = record
  nama : string;
  asuhan, tenaga_kesehatan : integer;
  rasio : real;
end;

type tabelDinkes = record
  tab : array [1..10] of kesehatan;
  N : integer;
end;

var
  Dinkes : tabelDinkes;
  rata2 : real;
  cari : string;

procedure cetak_judul();
begin
  writeln('______ _                   _   __               _           _        ');      
  writeln('|  _  (_)                 | | / /              | |         | |             ');
  writeln('| | | |_ _ __   __ _ ___  | |/ /  ___  ___  ___| |__   __ _| |_ __ _ _ __  ');
  writeln('| | | | |  _ \ / _` / __| |    \ / _ \/ __|/ _ \  _ \ / _` | __/ _` |  _ \ ');
  writeln('| |/ /| | | | | (_| \__ \ | |\  \  __/\__ \  __/ | | | (_| | || (_| | | | |');
  writeln('|___/ |_|_| |_|\__,_|___/ \_| \_/\___||___/\___|_| |_|\__,_|\__\__,_|_| |_|');
  writeln;
end;

procedure masukkan_id (var ArrDinkes : tabelDinkes );
{I.S. Tabel kosong
 F.S. Tabel berisi nama, banyak pasien, banyak tenaga kesehatan, atau rasio (jika perlu) }
var
  count : integer;

begin
  write('Masukkan banyak dinas kesehatan : ');
  readln(ArrDinkes.N);
  count:=0;
  if (ArrDinkes.N<=0) or (ArrDinkes.N>10) then
    begin
      repeat
        write('Tolong Masukkan banyaknya Dinas Kesehatan dari 1 sampai 10 : ');
        readln(ArrDinkes.N);
      until (ArrDinkes.N>0) and (ArrDinkes.N<11);
    end;
  repeat
    count:=count+1;
    write('Masukkan ID dinas kesehatan yang ke-',count,' : ');
    readln(ArrDinkes.tab[count].nama);
    write('Masukkan banyak balita/lansia/pasien : ');
    readln(ArrDinkes.tab[count].asuhan);
    write('Masukkan tenaga kesehatan : ');
    readln(ArrDinkes.tab[count].tenaga_kesehatan);
    writeln;
  until (count = ArrDinkes.N );
end;

procedure mencari(var ArrDinkes : tabelDinkes; x : string);
{I.S. Menerima tabel berisi dan x sebagai nama yang akan dicari
 F.S. Mencari data tersebut dan mengembalikan nama, pasien, tenaga kesehatan jika ada}
var
  count : integer;
  ketemu : boolean;

begin
  count:=0;
  ketemu:=false;
  repeat
    count:=count+1;
    if (ArrDinkes.tab[count].nama = x) then
      begin
      write(ArrDinkes.tab[count].nama,' ditemukan. Memiliki ',ArrDinkes.tab[count].asuhan);
      writeln(' pasien/lansia/balita dan ',ArrDinkes.tab[count].tenaga_kesehatan,' tenaga kesehatan.');
      ketemu:=true;
      end;
  until (count = ArrDinkes.N);
  if ketemu=false then
    writeln('Data tidak ditemukan');
  writeln;
end;

procedure cetak_tabel (var ArrDinkes : tabelDinkes);
{I.S. Tabel Sudah Berisi
 F.S. Mencetak Tabel tersebut}
var
  count, count2, panjang, banyak_spasi1, banyak_spasi2, banyak_spasi3 : integer;

begin
  count:=0;
  write(' DINAS KESEHATAN | PASIEN | MEDIS | RASIO |');
  writeln;
  repeat
    count:=count+1;
    panjang:=length(ArrDinkes.tab[count].nama);
    banyak_spasi1:=19-panjang;
    write(ArrDinkes.tab[count].nama);
    count2:=0;
    repeat
      count2:=count2+1;
      write(' ');
    until (count2 = banyak_spasi1);
    write(ArrDinkes.tab[count].asuhan);
    banyak_spasi2:=ArrDinkes.tab[count].asuhan div 10;
    case banyak_spasi2 of
      0      : write('        ');
      1..9   : write('       ');
      10..99 : write('      ');
      else write('      ');
    end;
    write(ArrDinkes.tab[count].tenaga_kesehatan);
    banyak_spasi3:=ArrDinkes.tab[count].tenaga_kesehatan div 10;
    case banyak_spasi3 of
      0      : write('       ');
      1..9   : write('      ');
      10..99 : write('     ');
      else write('     ');
    end;
    if (ArrDinkes.tab[count].rasio>0) then
      write(ArrDinkes.tab[count].rasio:0:2);
    writeln;
  until (count = ArrDinkes.N);
  writeln;
end;

procedure terbanyak_asuhan(var ArrDinkes : tabelDinkes);
{I.S. Menerima masukkan berupa banyaknya pasien/lansia/balita setiap dinas kesehatan
 F.S. Mencari nilai tertinggi dari banyaknya pasien/lansia/balita tersebut}
var
  count, maks : integer;

begin
  count:=0;
  maks:=2;
  repeat
    count:=count+1;
    if (ArrDinkes.tab[count].asuhan >= ArrDinkes.tab[maks].asuhan) then
      maks:=count;
  until (count = ArrDinkes.N);
  writeln(ArrDinkes.tab[maks].nama,' memiliki balita/lansia/pasien terbanyak, yaitu  ',ArrDinkes.tab[maks].asuhan);
end;

function mean_TenagaKesehatan(ArrDinkes : tabelDinkes) : real;
{I.S. Menerima masukkan berupa banyaknya tenaga kesehatan
 F.S. Mencari rata-rata tenaga kesehatan}
var
  count, sum, tambah : integer;

begin
  count:=0;
  sum:=0;
  repeat
    count:=count+1;
    tambah:=ArrDinkes.tab[count].tenaga_kesehatan;
    sum:=sum+tambah;
  until (count = ArrDinkes.N);
  mean_TenagaKesehatan:=sum/ArrDinkes.N;
end;

procedure prioritas(var ArrDinkes : tabelDinkes);
{I.S. Menerima input berupa tabel yang berisi
 F.S. Mengurutkan tabel tersebut berdasarkan prioritas.
      Prioritas semakin tinggi apabila rasio semakin rendah
      Rasio adalah perbandingan tenaga kesehatan dengan banyak pasien/lansia/balita }
var
  count, indeks1, indeks2, min, temp3, temp4 : integer;
  temp1 : real;
  temp2 : string;


begin
  writeln;
  writeln('========================================================================================');
  count:=0;
  repeat
    count:=count+1;
    ArrDinkes.tab[count].rasio:=ArrDinkes.tab[count].tenaga_kesehatan/ArrDinkes.tab[count].asuhan;
  until (count = ArrDinkes.N);
  indeks1:=0;
  writeln('Berikut telah diurutkan prioritas Dinas Kesehatan berasarkan rasio');
  writeln('(Rasio adalah perbandingan tenaga kesehatan dengan pasien/lansia/balita)');
  writeln;
  repeat;
    indeks1:=indeks1+1;
    min:=indeks1;
    indeks2:=indeks1;
    repeat
      indeks2:=indeks2+1;
      if (ArrDinkes.tab[indeks2].rasio < ArrDinkes.tab[min].rasio) then
        min:=indeks2;
      until (indeks2=ArrDinkes.N);
    temp1:=ArrDinkes.tab[min].rasio;
    ArrDinkes.tab[min].rasio:=ArrDinkes.tab[indeks1].rasio;
    ArrDinkes.tab[indeks1].rasio:=temp1;
    temp2:=ArrDinkes.tab[min].nama;
    ArrDinkes.tab[min].nama:=ArrDinkes.tab[indeks1].nama;
    ArrDinkes.tab[indeks1].nama:=temp2;
    temp3:=ArrDinkes.tab[min].asuhan;
    ArrDinkes.tab[min].asuhan:=ArrDinkes.tab[indeks1].asuhan;
    ArrDinkes.tab[indeks1].asuhan:=temp3;
    temp4:=ArrDinkes.tab[min].tenaga_kesehatan;
    ArrDinkes.tab[min].tenaga_kesehatan:=ArrDinkes.tab[indeks1].tenaga_kesehatan;
    ArrDinkes.tab[indeks1].tenaga_kesehatan:=temp4;
  until (indeks1 = ArrDinkes.N-1);
end;

procedure t_kesehatan_terkecil (var ArrDinkes : tabelDinkes);
{I.S. Menerima input berupa tabel yang berisi
 F.S. Mengurutkan tabel tersebut berdasarkan banyak tenaga kesehatan}
var
  indeks1, indeks2, min, temp3, temp4 : integer;
  temp1 : real;
  temp2 : string;

begin
  writeln;
  writeln('========================================================================================');
  indeks1:=0;
  writeln('Berikut telah diurutkan prioritas Dinas Kesehatan berasarkan banyaknya tenaga kesehatan : ');
  writeln;
  repeat;
    indeks1:=indeks1+1;
    min:=indeks1;
    indeks2:=indeks1;
    repeat
      indeks2:=indeks2+1;
      if (ArrDinkes.tab[indeks2].tenaga_kesehatan < ArrDinkes.tab[min].tenaga_kesehatan) then
        min:=indeks2;
      until (indeks2=ArrDinkes.N);
    temp1:=ArrDinkes.tab[min].rasio;
    ArrDinkes.tab[min].rasio:=ArrDinkes.tab[indeks1].rasio;
    ArrDinkes.tab[indeks1].rasio:=temp1;
    temp2:=ArrDinkes.tab[min].nama;
    ArrDinkes.tab[min].nama:=ArrDinkes.tab[indeks1].nama;
    ArrDinkes.tab[indeks1].nama:=temp2;
    temp3:=ArrDinkes.tab[min].asuhan;
    ArrDinkes.tab[min].asuhan:=ArrDinkes.tab[indeks1].asuhan;
    ArrDinkes.tab[indeks1].asuhan:=temp3;
    temp4:=ArrDinkes.tab[min].tenaga_kesehatan;
    ArrDinkes.tab[min].tenaga_kesehatan:=ArrDinkes.tab[indeks1].tenaga_kesehatan;
    ArrDinkes.tab[indeks1].tenaga_kesehatan:=temp4;
  until (indeks1 = ArrDinkes.N-1); 
end;

begin
  cetak_judul();
  masukkan_id(Dinkes);
  cetak_tabel(Dinkes);
  writeln;
  write('Masukkan nama Dinas Kesehatan yang ingin dicari : ');
  readln(cari);
  mencari(Dinkes,cari);
  terbanyak_asuhan(Dinkes);
  rata2:=mean_TenagaKesehatan(Dinkes);
  writeln('Rata-rata jumlah tenaga kesehatan adalah : ',rata2:0:2);
  prioritas(Dinkes);
  cetak_tabel(Dinkes);
  t_kesehatan_terkecil(Dinkes);
  cetak_tabel(Dinkes);
end.
