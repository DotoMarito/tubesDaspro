program TubesDaspro;
{SPESIFIKASI : Mensimulasikan 10 hari pertama dari Engi's Kitchen}

uses uload,upesan;

{KAMUS UTAMA}
var
	{Variabel yang terpakai dalam algoritma utama}
	perintah		: string; //menerima masukan perintah dari user
	error			: integer; //penampung variabel jika terjadi error pada konversi string ke integer
	ID				: integer; //nomor simulasi
	loaded			: boolean;
	programSelesai	: boolean;
	
	{Array penyimpan}
	dataBahanMentah	: tabelBahanMentah;
	dataBahanOlahan	: tabelBahanOlahan;
	dataResep		: tabelResep;
	dataSimulasi	: tabelSimulasi;

{Daftar prosedur}
procedure startSimulasi(ID	: integer; var dataBahanMentah : tabelBahanMentah; var dataBahanOlahan : tabelBahanOlahan; var dataResep : tabelResep; var dataSimulasi : tabelSimulasi);
var
	stopSimulasi : boolean;
	sleep		 : boolean;
begin
	stopSimulasi := false;
	tampilkanMenu('startSimulasi');
	{Inisialisasi}
				sleep:=false;
				dataSimulasi.itemKe[ID].jumlahHariHidup:=1;
				{Simulasi Dimulai}
				
					repeat
						begin
						writeln('Selamat pagi!, hari ini tanggal: ',dataSimulasi.itemKe[ID].tanggalSimulasi.hari,'/',dataSimulasi.itemKe[ID].tanggalSimulasi.bulan,'/',dataSimulasi.itemKe[ID].tanggalSimulasi.tahun);
						repeat {Memulai aktivitas hari ini}
							begin
							writeln('Sisa energi: ',dataSimulasi.itemKe[ID].jumlahEnergi);
							checkEnergi(dataSimulasi.itemKe[ID].jumlahEnergi,sleep);
							if sleep=false then
								activity(dataSimulasi.itemKe[ID].jumlahEnergi,dataBahanMentah,dataBahanOlahan,stopSimulasi,sleep);
							end;
						until (stopSimulasi=true) or (sleep=true);
						resetDay(sleep,dataSimulasi.itemKe[ID].tanggalSimulasi,dataSimulasi.itemKe[ID].jumlahEnergi,dataSimulasi.itemKe[ID].jumlahHariHidup);
							if dataSimulasi.itemKe[ID].jumlahHariHidup>10 then
								stopSimulasi:=true;
						end;
					until stopSimulasi=true;
					
				{Simulasi Berakhir}	
end;

{ALGORITMA UTAMA}
begin
	{TAMPILAN ANTARMUKA AWAL}
	writeln('----------------------------------------');
	writeln('----PROGRAM SIMULASI ENGI''S KITCHEN----');
	writeln('----------------------------------------');
	writeln();
	
	{INISIALISASI VARIABEL}
	perintah := '';
	loaded := false;
	programSelesai := false;
	
	repeat
		{TAMPILAN MENU UTAMA}
		tampilkanMenu('utama');

		{MENYEDIAKAN PROMPT}
		write('> '); readln(perintah);
		
		{MENGEKSESUKSI PROMPT}
		case (perintah) of 
			'load' 				: mainLoad('bahanMentah.in','bahanOlahan.in','resep.in','simulasi.in',dataBahanMentah,dataBahanOlahan,dataResep,dataSimulasi);
			'exit' 				: begin
									shoutWarning('exitProgram');
									programSelesai := true;
								 end;(*
			'lihatInventori'	: lihatInventori();
			'lihatResep'		: lihatResep();
			'cariResep'			: cariResep();
			'tambahResep'		: tambahResep();
			'upgradeInventori'	: upgradeInventori();*)
		else begin
				if (pos('start',perintah)<>0) then //Kalo ketemu substring 'start' dalam string 'perintah'
				begin
					if (loaded) then
					begin
						val(copy(perintah,pos(' ',perintah)+1,length(perintah)) , ID, error); //Baris 43 : mengambil bagian angka dari string(perintah) dan memasukkannya ke variabel(ID)
						perintah := 'start';
						if ID = 0 then ID:=1;
						//startSimulasi(ID); //TO DO : Bikin procedure startSimulasi (checklist : x)
					end
					else {perintah "load" belum dijalankan}
					begin
						shoutWarning('belumLoad');
					end
				end
				else {masukkan user tidak memenuhi}
				begin
					shoutWarning('salahPerintah');
				end;
			 end;
		end;
		
	until (programSelesai);
	
	readln();
	
end.
