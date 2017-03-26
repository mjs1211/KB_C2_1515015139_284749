DOMAINS							
 nama,jender,pekerjaan,benda,alasan,zat = symbol 	% pada bagian Domains, tipe data symbol digunakan pada variabel nama, jender, pekerjaan, benda, alasan, serta zat
 umur=integer						% sedangkan variabel umur menggunakan tipe data integer.
 
PREDICATES						% hubungan-hubungan ditentukan dengan pendeklarasian relasi dalam predicates, di mana
 nondeterm orang(nama, umur, jender, pekerjaan)		% orang memiliki hubungan dengan variabel nama, umur, jender, dan pekerjaan
 nondeterm selingkuh(nama, nama)			% selingkuh berhubungan dengan nama dan nama
 terbunuh_dengan(nama, benda)				% terbunuh_dengan terhubung dengan variabel nama dan benda
 terbunuh(nama)						% terbunuh terhubung dengan variabel nama
 nondeterm pembunuh(nama)				% pembunuh terhubung dengan variabel nama
 motif(alasan)						% motif memiliki hubungan dengan variabel alasan
 ternodai(nama, zat)					% ternodai terhubung dengan variabel nama dan benda
 milik(nama, benda)					% relasi milik terhubung dengan variabel nama dan benda
 nondeterm cara_kerja_mirip(benda, benda)		% relasi cara_kerja_mirip terhubung dengan variabel benda dan benda.
 nondeterm kemungkinan_milik(nama, benda)		% relasi kemungkinan_milik terhubung dengan variabel nama dan benda.
 nondeterm dicurigai(nama)				% relasi dicurigai terhubung dengan variabel nama
/* * * Fakta-fakta tentang pembunuhan * * */	
CLAUSES							%pada bagian Clauses, akan dijabarkan mengenai fakta-fakta yang terdapat pada riddle berikut.
 orang(budi,55,m,tukang_kayu).				% Budi merupakan seorang tukang kayu berkelamin laki-laki yang telah berumur 55 tahun
 orang(aldi,25,m,pemain_sepak_bola).			% Aldi merupakan seorang pemain sepak bola berkelamin laki-laki yang berumur 25 tahun
 orang(aldi,25,m,tukang_jagal).				% Selain menjadi pesepakbola, Aldi juga berprofesi sebagai tukang jagal.
 orang(joni,25,m,pencopet).				% Joni merupakan seorang pencopet berkelamin laki-laki berumur 25 tahun
 selingkuh(ina,joni).					% Ina berselingkuh dengan Joni, dan juga Budi
 selingkuh(ina,budi).
 selingkuh(siti,joni).					% Tidak hanya Ina, tapi Siti juga berselingkuh dengan Joni.
 terbunuh_dengan(siti,pentungan).			% Tetapi, terjadi kasus pembunuhan di mana korban dibantai dengan menggunakan benda tumpul
 terbunuh(siti).					% dan korbannya adalah Siti.
 motif(uang).						% Muncul motif dari pembunuhan ini adalah karena uang,
 motif(cemburu).					% kecemburuan, dan
 motif(dendam).						% dendam.
 ternodai(budi, darah).					% Pakaian Budi memiliki noda darah yang kemungkinan
 ternodai(siti, darah).					% berasal dari Siti.
 ternodai(aldi, lumpur).				% Sedangkan pakaian Aldi terkena noda lumpur, 
 ternodai(joni, coklat).				% dan Joni terkena noda coklat.
 ternodai(ina, coklat).					% dan Ina juga terkena noda coklat.
 milik(budi,kaki_palsu).				% Budi memiliki kaki palsu
 milik(joni,pistol).					% Joni memiliki pistol
 
/* * * Basis Pengetahuan * * */				% berdasarkan pengetahuan yang telah ada,
 cara_kerja_mirip(kaki_palsu, pentungan).		% kaki palsu memiliki cara kerja mirip dengan pentungan
 cara_kerja_mirip(balok, pentungan).			% balok juga memiliki cara kerja mirip dengan pentungan
 cara_kerja_mirip(gunting, pisau).			% gunting memiliki cara kerja mirip dengan pisau
 cara_kerja_mirip(sepatu_bola, pentungan).		% sepatu bola memiliki cara kerja mirip dengan pentungan.
 kemungkinan_milik(X,sepatu_bola):-			% kemungkinan sepatu bola dimiliki oleh seseorang apabila 
orang(X,_,_,pemain_sepak_bola).				% pekerjaan dari orang tersebut adalah pemain sepak bola.
 kemungkinan_milik(X,gunting):-				% kemungkinan gunting dimiliki oleh seseorang apabila
orang(X,_,_,pekerja_salon).				% pekerjaan dari orang tersebut adalah pekerja salon.
 kemungkinan_milik(X,Benda):-				% sehingga kemungkinan dari seseorang memiliki benda tersebut lebih ke apabila
milik(X,Benda).						% seseorang merupakan pemilik dari benda tersebut.
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* dicurigai semua orang yang memiliki senjata yang *
* kerjanya mirip dengan senjata penyebab siti terbunuh. *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 dicurigai(X):-						% seseorang dicurigai saat
terbunuh_dengan(siti,Senjata) ,				% Siti terbunuh oleh suatu senjata,
cara_kerja_mirip(Benda,Senjata) ,			% ditemukannya suatu benda yang memiliki cara kerja mirip dengan suatu senjata,	
kemungkinan_milik(X,Benda).				% dan benda tersebut dimiliki oleh seseorang.
/* * * * * * * * * * * * * * * * * * * * * * * * * *
* dicurigai laki-laki yang selingkuh dengan siti. *
* * * * * * * * * * * * * * * * * * * * * * * * * */
 dicurigai(X):-						% bisa juga seseorang dicurigai karena
motif(cemburu),						% motif kecemburuan, serta
orang(X,_,m,_),						% orang tersebut merupakan seorang laki-laki, dan
selingkuh(siti,X).					% orang tersebut diselingkuhi Siti.
/* * * * * * * * * * * * * * * * * * * * * * *
* dicurigai perempuan yang selingkuh dengan *
* laki-laki yang juga selingkuh dengan siti *
* * * * * * * * * * * * * * * * * * * * * * */
 dicurigai(X):-						% seseorang dapat dicurigai sebagai pembunuh apabila
motif(cemburu),						% memiliki motif kecemburuan,
orang(X,_,f,_),						% orang tersebut merupakan perempuan,
selingkuh(X,Lakilaki),					% orang tersebut diselingkuhi oleh seorang laki-laki yang
selingkuh(siti,Lakilaki).				% berselingkuh dengan Siti.
/* * * * * * * * * * * * * * * * * * * * * * * * * * *
* dicurigai pencopet yang mempunyai motif uang. *
* * * * * * * * * * * * * * * * * * * * * * * * * * */
 dicurigai(X):-						% seseorang juga dapat dicurigai apabila
motif(uang),						% motifnya karena uang,
orang(X,_,_,pencopet).					% dan orang tersebut merupakan pencopet.
 pembunuh(Pembunuh):-					% seseorang disebut pembunuh apabila
orang(Pembunuh,_,_,_),					% seseorang adalah pembunuh dan
terbunuh(Terbunuh),					% seseorang telah terbunuh
Terbunuh <> Pembunuh, /* Bukan bunuh diri */		% munculnya relasi antara terbunuh dan pembunuh yaitu	
dicurigai(Pembunuh),					% seseorang yang dicurigai pembunuh,
ternodai(Pembunuh,Zat),					% pembunuh terkena noda suatu zat
ternodai(Terbunuh,Zat).					% dari zat pada tubuh korban terbunuh.
GOAL
 pembunuh(X).						% dengan kumpulan fakta-fakta tersebut, dikumpulkan kesimpulan bahwa
							% pembunuhnya merupakan Budi. Budi dinyatakan sebagai pembunuh karena
							% Budi terkena noda zat sama yang terdapat pada tubuh dari korban pembunuhan.
							% Serta apabila seseorang terkena noda yang sama dengan korban,
							% Dapat dikatakan bahwa orang tersebut merupakan pembunuh dari korban.