unit uF12_lihatStatistik; //Ganti : sesuaikan dengan nama file, tapi tanpa ".pas"

interface

uses uP1_tipeBentukan;

	procedure mainStartSimulasi(ID : integer;
									var dataBahanMentah : tabelBahanMentah; 
									var dataBahanOlahan : tabelBahanOlahan; 
									var dataResep : tabelResep; 
									var dataSimulasi : tabelSimulasi;
									var dataInventoriBahanMentah : tabelBahanMentah;
									var dataInventoriBahanOlahan : tabelBahanOlahan);	
									

	
	{ I.S : Membaca data dari variabel data yang mau ditampilkan
	* F.S : Menampilkan data yang mau ditampilkan}
	
	
	
implementation

	procedure mainStartSimulasi(ID : integer;
									var dataBahanMentah : tabelBahanMentah; 
									var dataBahanOlahan : tabelBahanOlahan; 
									var dataResep : tabelResep; 
									var dataSimulasi : tabelSimulasi;
									var dataInventoriBahanMentah : tabelBahanMentah;
									var dataInventoriBahanOlahan : tabelBahanOlahan);	

	begin
		writeln('Hari 			: ',dataSimulasi.itemKe[ID].jumlahHariHidup);
		writeln('Energi 		: ',dataSimulasi.itemKe[ID].jumlahEnergi);
		writeln('Duit			: ',dataSimulasi.itemKe[ID].jumlahDuit);
		writeln('Pengeluaran	: ',dataSimulasi.itemKe[ID].totalPemasukan);
		writeln('Pemasukan		: ',dataSimulasi.itemKe[ID].totalPengeluaran);
		writeln('Bahan Mentah 	: ',dataInventoriBahanMentah.banyakItem);
		writeln('Bahan Baku 	: ',dataInventoriBahanOlahan.banyakItem);	

	end;
		
end.

{ TIPS DAN CARA MEMPROGRAM DARI UNIT
* 1. Buat I.S dan F.S sebaik mungkin sehingga orang lain bisa tau maksud program lu tanpa harus ngebaca implementasinya
* 2. Keterangan : I.S(initial state); F.S(final state)
* 3. Jangan mengubah uP0_utama.pas, kalo mau ngetest file ini, silahkan "uncomment" HANYA "mainNamaTemplate()" di uP0_utama.pas atau uF3_startSimulasi.pas
* 4. Kalo mau butuh fungsi atau prosedur topik umum kaya updateTanggal(x) dan sejenisnya, silahkan request ke gue atau bikin sendiri di uP3_umum.pas
* 5. Silahkan perhatikan baik-baik untup tipedata bentukan di uP1_tipeBentukan.pas
* 
* }
		



{Ingat, urang cupu, perlu banyak teach me, walaupun lu mastah kayak ndewo.}

