-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Feb 2024 pada 07.56
-- Versi server: 10.4.25-MariaDB
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `11rpl`
--
CREATE DATABASE IF NOT EXISTS `11rpl` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `11rpl`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--
-- Kesalahan membaca struktur untuk tabel 11rpl.siswa: #1932 - Table &#039;11rpl.siswa&#039; doesn&#039;t exist in engine
-- Kesalahan membaca data untuk tabel 11rpl.siswa: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `11rpl`.`siswa`&#039; at line 1
--
-- Database: `akademik`
--
CREATE DATABASE IF NOT EXISTS `akademik` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `akademik`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--
-- Kesalahan membaca struktur untuk tabel akademik.login: #1932 - Table &#039;akademik.login&#039; doesn&#039;t exist in engine
-- Kesalahan membaca data untuk tabel akademik.login: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `akademik`.`login`&#039; at line 1
--
-- Database: `appengaduanmasyarakat`
--
CREATE DATABASE IF NOT EXISTS `appengaduanmasyarakat` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `appengaduanmasyarakat`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `masyarakat`
--

CREATE TABLE `masyarakat` (
  `nik` varchar(16) NOT NULL,
  `nama` varchar(35) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `masyarakat`
--

INSERT INTO `masyarakat` (`nik`, `nama`, `username`, `password`, `telp`) VALUES
('1376012310010005', 'bamsoet', 'masyarakat', 'admin', '085364287180');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengaduan`
--

CREATE TABLE `pengaduan` (
  `id_pengaduan` int(5) NOT NULL,
  `tgl_pengaduan` varchar(20) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `isi_laporan` text NOT NULL,
  `foto` varchar(255) NOT NULL,
  `status` enum('proses','selesai') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengaduan`
--

INSERT INTO `pengaduan` (`id_pengaduan`, `tgl_pengaduan`, `nik`, `isi_laporan`, `foto`, `status`) VALUES
(1, '2020-02-13', '1376012310010005', 'pak itiak urang masuak rumah wak', '130220204341itiak.png', 'selesai');

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(5) NOT NULL,
  `nama_petugas` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telp_petugas` varchar(13) NOT NULL,
  `level` enum('admin','petugas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nama_petugas`, `username`, `password`, `telp_petugas`, `level`) VALUES
(1, 'Aqil Rahman', 'admin', '21232f297a57a5a743894a0e4a801fc3', '081215951492', 'admin'),
(2, 'M Riski', 'petugas', 'afb91ef692fd08c445e8cb1bab2ccf9c', '081215951492', 'petugas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tanggapan`
--

CREATE TABLE `tanggapan` (
  `id_tanggapan` int(5) NOT NULL,
  `id_pengaduan` int(5) NOT NULL,
  `tgl_tanggapan` varchar(20) NOT NULL,
  `tanggapan` text NOT NULL,
  `id_petugas` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tanggapan`
--

INSERT INTO `tanggapan` (`id_tanggapan`, `id_pengaduan`, `tgl_tanggapan`, `tanggapan`, `id_petugas`) VALUES
(1, 1, '2020-02-13', 'berarti awak nan punyo tu mah', 2);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `masyarakat`
--
ALTER TABLE `masyarakat`
  ADD PRIMARY KEY (`nik`);

--
-- Indeks untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`id_pengaduan`),
  ADD KEY `nik` (`nik`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indeks untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD PRIMARY KEY (`id_tanggapan`),
  ADD KEY `id_petugas` (`id_petugas`),
  ADD KEY `id_pengaduan` (`id_pengaduan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  MODIFY `id_pengaduan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  MODIFY `id_tanggapan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD CONSTRAINT `pengaduan_ibfk_1` FOREIGN KEY (`nik`) REFERENCES `masyarakat` (`nik`);

--
-- Ketidakleluasaan untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD CONSTRAINT `tanggapan_ibfk_1` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`),
  ADD CONSTRAINT `tanggapan_ibfk_2` FOREIGN KEY (`id_pengaduan`) REFERENCES `pengaduan` (`id_pengaduan`);
--
-- Database: `botak`
--
CREATE DATABASE IF NOT EXISTS `botak` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `botak`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `look_siswa`
--

CREATE TABLE `look_siswa` (
  `id_siswa` int(11) NOT NULL,
  `nama_siswa` varchar(122) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int(11) NOT NULL,
  `nama_siswa` varchar(122) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `nama_siswa`) VALUES
(1, 'bambang'),
(232323, 'agus\r\n'),
(5765675, 'ryan');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`);
--
-- Database: `case`
--
CREATE DATABASE IF NOT EXISTS `case` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `case`;
--
-- Database: `dataperpus`
--
CREATE DATABASE IF NOT EXISTS `dataperpus` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dataperpus`;
--
-- Database: `jente`
--
CREATE DATABASE IF NOT EXISTS `jente` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `jente`;

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `tambahview`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `tambahview` (
`id` int(11)
,`nama` varchar(100)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_detail_transaksi`
--

CREATE TABLE `tb_detail_transaksi` (
  `id` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_paket` int(11) NOT NULL,
  `qty` double NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_detail_transaksi`
--

INSERT INTO `tb_detail_transaksi` (`id`, `id_transaksi`, `id_paket`, `qty`, `keterangan`) VALUES
(1, 1, 1, 10, 'Terimakasih sudah menggunakan jasa kirim kami');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_member`
--

CREATE TABLE `tb_member` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `telp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_member`
--

INSERT INTO `tb_member` (`id`, `nama`, `alamat`, `jenis_kelamin`, `telp`) VALUES
(1, 'bambang susatyo', 'bumi indah\r\n', 'L', '0813-1702-2122');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_outlet`
--

CREATE TABLE `tb_outlet` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `tlp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_outlet`
--

INSERT INTO `tb_outlet` (`id`, `nama`, `alamat`, `tlp`) VALUES
(1, 'bambang susatyo', 'bumi indah', '0813-1702-2122'),
(2, 'agus', 'jl. jalan', '0822-1665-7798');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_paket`
--

CREATE TABLE `tb_paket` (
  `id` int(11) NOT NULL,
  `id_outlet` int(11) NOT NULL,
  `jenis` enum('kiloan','selimut','bed_cover','kaos','lain') NOT NULL,
  `nama_paket` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_paket`
--

INSERT INTO `tb_paket` (`id`, `id_outlet`, `jenis`, `nama_paket`, `harga`) VALUES
(1, 1, 'kaos', 'narkoba\r\n', 521);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `id` int(11) NOT NULL,
  `id_outlet` int(11) NOT NULL,
  `kode_invoice` varchar(100) NOT NULL,
  `id_member` int(11) NOT NULL,
  `tgl` datetime NOT NULL,
  `batas_waktu` datetime NOT NULL,
  `tgl_bayar` datetime NOT NULL,
  `biaya_tambahan` int(11) NOT NULL,
  `diskon` double NOT NULL,
  `pajak` int(11) NOT NULL,
  `status` enum('baru','proses','selesai','diambil') NOT NULL,
  `dibayar` enum('dibayar','belum_dibayar') NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_transaksi`
--

INSERT INTO `tb_transaksi` (`id`, `id_outlet`, `kode_invoice`, `id_member`, `tgl`, `batas_waktu`, `tgl_bayar`, `biaya_tambahan`, `diskon`, `pajak`, `status`, `dibayar`, `id_user`) VALUES
(1, 1, 'KKICY4332', 1, '2023-08-07 04:36:38', '2023-08-07 04:36:38', '2023-08-07 04:36:38', 50000, 100, 100000, 'diambil', 'dibayar', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` text NOT NULL,
  `id_outlet` int(11) NOT NULL,
  `role` enum('admin','kasir','owner') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id`, `nama`, `username`, `password`, `id_outlet`, `role`) VALUES
(1, ' Susanoong', 'bambang', '123', 1, 'owner');

-- --------------------------------------------------------

--
-- Struktur untuk view `tambahview`
--
DROP TABLE IF EXISTS `tambahview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tambahview`  AS SELECT `tb_user`.`id` AS `id`, `tb_user`.`nama` AS `nama` FROM `tb_user` WHERE `tb_user`.`nama` <> 00  ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_detail_transaksi`
--
ALTER TABLE `tb_detail_transaksi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_transaksi` (`id_transaksi`),
  ADD UNIQUE KEY `id_paket` (`id_paket`);

--
-- Indeks untuk tabel `tb_member`
--
ALTER TABLE `tb_member`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_outlet`
--
ALTER TABLE `tb_outlet`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_paket`
--
ALTER TABLE `tb_paket`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_outlet` (`id_outlet`);

--
-- Indeks untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_user` (`id_user`),
  ADD UNIQUE KEY `id_outlet` (`id_outlet`),
  ADD UNIQUE KEY `id_member` (`id_member`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_outlet` (`id_outlet`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_detail_transaksi`
--
ALTER TABLE `tb_detail_transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_member`
--
ALTER TABLE `tb_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_outlet`
--
ALTER TABLE `tb_outlet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_paket`
--
ALTER TABLE `tb_paket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_detail_transaksi`
--
ALTER TABLE `tb_detail_transaksi`
  ADD CONSTRAINT `tb_detail_transaksi_ibfk_2` FOREIGN KEY (`id_paket`) REFERENCES `tb_paket` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_detail_transaksi_ibfk_3` FOREIGN KEY (`id_transaksi`) REFERENCES `tb_transaksi` (`id`);

--
-- Ketidakleluasaan untuk tabel `tb_paket`
--
ALTER TABLE `tb_paket`
  ADD CONSTRAINT `tb_paket_ibfk_1` FOREIGN KEY (`id_outlet`) REFERENCES `tb_outlet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD CONSTRAINT `tb_transaksi_ibfk_1` FOREIGN KEY (`id_outlet`) REFERENCES `tb_outlet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_transaksi_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_transaksi_ibfk_3` FOREIGN KEY (`id_member`) REFERENCES `tb_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD CONSTRAINT `tb_user_ibfk_1` FOREIGN KEY (`id_outlet`) REFERENCES `tb_outlet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `khairan`
--
CREATE DATABASE IF NOT EXISTS `khairan` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `khairan`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bekerja_pada`
--
-- Kesalahan membaca struktur untuk tabel khairan.bekerja_pada: #1932 - Table &#039;khairan.bekerja_pada&#039; doesn&#039;t exist in engine
-- Kesalahan membaca data untuk tabel khairan.bekerja_pada: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `khairan`.`bekerja_pada`&#039; at line 1

-- --------------------------------------------------------

--
-- Struktur dari tabel `departemen`
--
-- Kesalahan membaca struktur untuk tabel khairan.departemen: #1932 - Table &#039;khairan.departemen&#039; doesn&#039;t exist in engine
-- Kesalahan membaca data untuk tabel khairan.departemen: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `khairan`.`departemen`&#039; at line 1

-- --------------------------------------------------------

--
-- Struktur dari tabel `lokasi_departemen`
--
-- Kesalahan membaca struktur untuk tabel khairan.lokasi_departemen: #1932 - Table &#039;khairan.lokasi_departemen&#039; doesn&#039;t exist in engine
-- Kesalahan membaca data untuk tabel khairan.lokasi_departemen: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `khairan`.`lokasi_departemen`&#039; at line 1

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--
-- Kesalahan membaca struktur untuk tabel khairan.pegawai: #1932 - Table &#039;khairan.pegawai&#039; doesn&#039;t exist in engine
-- Kesalahan membaca data untuk tabel khairan.pegawai: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `khairan`.`pegawai`&#039; at line 1

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai_1`
--
-- Kesalahan membaca struktur untuk tabel khairan.pegawai_1: #1932 - Table &#039;khairan.pegawai_1&#039; doesn&#039;t exist in engine
-- Kesalahan membaca data untuk tabel khairan.pegawai_1: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `khairan`.`pegawai_1`&#039; at line 1

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai_2`
--
-- Kesalahan membaca struktur untuk tabel khairan.pegawai_2: #1932 - Table &#039;khairan.pegawai_2&#039; doesn&#039;t exist in engine
-- Kesalahan membaca data untuk tabel khairan.pegawai_2: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `khairan`.`pegawai_2`&#039; at line 1

-- --------------------------------------------------------

--
-- Struktur dari tabel `proyek`
--
-- Kesalahan membaca struktur untuk tabel khairan.proyek: #1932 - Table &#039;khairan.proyek&#039; doesn&#039;t exist in engine
-- Kesalahan membaca data untuk tabel khairan.proyek: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `khairan`.`proyek`&#039; at line 1

-- --------------------------------------------------------

--
-- Struktur dari tabel `tanggungan`
--
-- Kesalahan membaca struktur untuk tabel khairan.tanggungan: #1932 - Table &#039;khairan.tanggungan&#039; doesn&#039;t exist in engine
-- Kesalahan membaca data untuk tabel khairan.tanggungan: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `khairan`.`tanggungan`&#039; at line 1
--
-- Database: `klinik`
--
CREATE DATABASE IF NOT EXISTS `klinik` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `klinik`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` int(11) NOT NULL,
  `nama_dokter` varchar(50) NOT NULL,
  `keahlian` varchar(100) NOT NULL,
  `nomor_lisensi` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `obat`
--

CREATE TABLE `obat` (
  `id_obat` int(11) NOT NULL,
  `nama_obat` varchar(100) NOT NULL,
  `deskripsi` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` int(11) NOT NULL,
  `nama_pasien` varchar(50) NOT NULL,
  `JK` char(1) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `praktik`
--

CREATE TABLE `praktik` (
  `id_praktik` int(11) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `jadwal_praktik` date NOT NULL,
  `waktu_mulai` time NOT NULL,
  `waktu_selesai` time NOT NULL,
  `deskripsi` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `resep`
--

CREATE TABLE `resep` (
  `id_resep` int(11) NOT NULL,
  `id_riwayat` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL,
  `dosis` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `riwayat_medis`
--

CREATE TABLE `riwayat_medis` (
  `id_riwayat` int(11) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `jadwal_praktik` date NOT NULL,
  `diagnosa` varchar(200) NOT NULL,
  `tabel_resep` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `tgl_transaksi` int(11) NOT NULL,
  `jumlah_transaksi` int(11) NOT NULL,
  `metode_transaksi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`);

--
-- Indeks untuk tabel `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id_obat`);

--
-- Indeks untuk tabel `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indeks untuk tabel `praktik`
--
ALTER TABLE `praktik`
  ADD PRIMARY KEY (`id_praktik`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indeks untuk tabel `resep`
--
ALTER TABLE `resep`
  ADD PRIMARY KEY (`id_resep`),
  ADD KEY `id_riwayat` (`id_riwayat`),
  ADD KEY `id_obat` (`id_obat`);

--
-- Indeks untuk tabel `riwayat_medis`
--
ALTER TABLE `riwayat_medis`
  ADD PRIMARY KEY (`id_riwayat`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_pasien` (`id_pasien`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id_pasien` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `praktik`
--
ALTER TABLE `praktik`
  MODIFY `id_praktik` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `resep`
--
ALTER TABLE `resep`
  MODIFY `id_resep` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `riwayat_medis`
--
ALTER TABLE `riwayat_medis`
  MODIFY `id_riwayat` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `praktik`
--
ALTER TABLE `praktik`
  ADD CONSTRAINT `praktik_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`),
  ADD CONSTRAINT `praktik_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`);

--
-- Ketidakleluasaan untuk tabel `resep`
--
ALTER TABLE `resep`
  ADD CONSTRAINT `resep_ibfk_1` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id_obat`),
  ADD CONSTRAINT `resep_ibfk_2` FOREIGN KEY (`id_riwayat`) REFERENCES `riwayat_medis` (`id_riwayat`);

--
-- Ketidakleluasaan untuk tabel `riwayat_medis`
--
ALTER TABLE `riwayat_medis`
  ADD CONSTRAINT `riwayat_medis_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`),
  ADD CONSTRAINT `riwayat_medis_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`);

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`);
--
-- Database: `masyarakat`
--
CREATE DATABASE IF NOT EXISTS `masyarakat` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `masyarakat`;
--
-- Database: `menumakanan`
--
CREATE DATABASE IF NOT EXISTS `menumakanan` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `menumakanan`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--
-- Kesalahan membaca struktur untuk tabel menumakanan.pelanggan: #1932 - Table &#039;menumakanan.pelanggan&#039; doesn&#039;t exist in engine
-- Kesalahan membaca data untuk tabel menumakanan.pelanggan: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `menumakanan`.`pelanggan`&#039; at line 1
--
-- Database: `nzwn`
--
CREATE DATABASE IF NOT EXISTS `nzwn` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `nzwn`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--
-- Kesalahan membaca struktur untuk tabel nzwn.login: #1932 - Table &#039;nzwn.login&#039; doesn&#039;t exist in engine
-- Kesalahan membaca data untuk tabel nzwn.login: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `nzwn`.`login`&#039; at line 1

-- --------------------------------------------------------

--
-- Struktur dari tabel `tambah_data`
--
-- Kesalahan membaca struktur untuk tabel nzwn.tambah_data: #1932 - Table &#039;nzwn.tambah_data&#039; doesn&#039;t exist in engine
-- Kesalahan membaca data untuk tabel nzwn.tambah_data: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `nzwn`.`tambah_data`&#039; at line 1
--
-- Database: `pdm wn`
--
CREATE DATABASE IF NOT EXISTS `pdm wn` DEFAULT CHARACTER SET macce COLLATE macce_bin;
USE `pdm wn`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_detail_transaksi`
--

CREATE TABLE `tb_detail_transaksi` (
  `id` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_paket` int(11) NOT NULL,
  `qty` double NOT NULL,
  `keterangan` text COLLATE macce_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=macce COLLATE=macce_bin;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_member`
--

CREATE TABLE `tb_member` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) COLLATE macce_bin NOT NULL,
  `alamat` text COLLATE macce_bin NOT NULL,
  `jenis_kelamin` enum('Laki laki','Perempuan') COLLATE macce_bin NOT NULL,
  `tlp` varchar(15) COLLATE macce_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=macce COLLATE=macce_bin;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_outlet`
--

CREATE TABLE `tb_outlet` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) COLLATE macce_bin NOT NULL,
  `alamat` text COLLATE macce_bin NOT NULL,
  `tlp` varchar(15) COLLATE macce_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=macce COLLATE=macce_bin;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_paket`
--

CREATE TABLE `tb_paket` (
  `id` int(11) NOT NULL,
  `id_outlet` int(11) NOT NULL,
  `jenis` enum('kiloan','selimut','bed_cover','kaos','lain') COLLATE macce_bin NOT NULL,
  `nama_paket` varchar(100) COLLATE macce_bin NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=macce COLLATE=macce_bin;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `id` int(11) NOT NULL,
  `id_outlet` int(11) NOT NULL,
  `kode_ivoice` int(100) NOT NULL,
  `id_member` int(11) NOT NULL,
  `tgl` datetime NOT NULL,
  `batas_waktu` datetime NOT NULL,
  `tgl_bayar` datetime NOT NULL,
  `biaya_tambahan` int(11) NOT NULL,
  `diskon` double NOT NULL,
  `pajak` int(11) NOT NULL,
  `status` enum('baru','proses','selesai','diambil') COLLATE macce_bin NOT NULL,
  `dibayar` enum('dibayar','belum_dibayar') COLLATE macce_bin NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=macce COLLATE=macce_bin;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) COLLATE macce_bin NOT NULL,
  `username` varchar(30) COLLATE macce_bin NOT NULL,
  `password` text COLLATE macce_bin NOT NULL,
  `id_outlet` int(11) NOT NULL,
  `role` enum('admin','kasir','owner') COLLATE macce_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=macce COLLATE=macce_bin;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_detail_transaksi`
--
ALTER TABLE `tb_detail_transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_transaksi` (`id_transaksi`),
  ADD KEY `id_paket` (`id_paket`);

--
-- Indeks untuk tabel `tb_member`
--
ALTER TABLE `tb_member`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_outlet`
--
ALTER TABLE `tb_outlet`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_paket`
--
ALTER TABLE `tb_paket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_outlet` (`id_outlet`),
  ADD KEY `harga` (`harga`);

--
-- Indeks untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_outlet` (`id_outlet`),
  ADD KEY `id_member` (`id_member`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_outlet` (`id_outlet`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_detail_transaksi`
--
ALTER TABLE `tb_detail_transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_member`
--
ALTER TABLE `tb_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_outlet`
--
ALTER TABLE `tb_outlet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_paket`
--
ALTER TABLE `tb_paket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_detail_transaksi`
--
ALTER TABLE `tb_detail_transaksi`
  ADD CONSTRAINT `tb_detail_transaksi_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `tb_transaksi` (`id`),
  ADD CONSTRAINT `tb_detail_transaksi_ibfk_2` FOREIGN KEY (`id_paket`) REFERENCES `tb_paket` (`id`);

--
-- Ketidakleluasaan untuk tabel `tb_paket`
--
ALTER TABLE `tb_paket`
  ADD CONSTRAINT `tb_paket_ibfk_1` FOREIGN KEY (`id_outlet`) REFERENCES `tb_outlet` (`id`);

--
-- Ketidakleluasaan untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD CONSTRAINT `tb_transaksi_ibfk_1` FOREIGN KEY (`id_member`) REFERENCES `tb_member` (`id`),
  ADD CONSTRAINT `tb_transaksi_ibfk_2` FOREIGN KEY (`id_outlet`) REFERENCES `tb_outlet` (`id`),
  ADD CONSTRAINT `tb_transaksi_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD CONSTRAINT `tb_user_ibfk_1` FOREIGN KEY (`id_outlet`) REFERENCES `tb_outlet` (`id`);
--
-- Database: `pdo`
--
CREATE DATABASE IF NOT EXISTS `pdo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pdo`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--
-- Kesalahan membaca struktur untuk tabel pdo.siswa: #1932 - Table &#039;pdo.siswa&#039; doesn&#039;t exist in engine
-- Kesalahan membaca data untuk tabel pdo.siswa: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `pdo`.`siswa`&#039; at line 1
--
-- Database: `pedulidiri`
--
CREATE DATABASE IF NOT EXISTS `pedulidiri` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `pedulidiri`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbisidata`
--
-- Kesalahan membaca struktur untuk tabel pedulidiri.tbisidata: #1932 - Table &#039;pedulidiri.tbisidata&#039; doesn&#039;t exist in engine
-- Kesalahan membaca data untuk tabel pedulidiri.tbisidata: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `pedulidiri`.`tbisidata`&#039; at line 1
--
-- Database: `pelaporan`
--
CREATE DATABASE IF NOT EXISTS `pelaporan` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pelaporan`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `masyarakat`
--

CREATE TABLE `masyarakat` (
  `nik` char(16) NOT NULL,
  `nama` varchar(35) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(32) NOT NULL,
  `telp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `masyarakat`
--

INSERT INTO `masyarakat` (`nik`, `nama`, `username`, `password`, `telp`) VALUES
('1', 'dimas', 'dimas', 'dimas', '12345');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengaduan`
--

CREATE TABLE `pengaduan` (
  `id_pengaduan` int(11) NOT NULL,
  `tgl_pengaduan` date NOT NULL,
  `nik` char(16) NOT NULL,
  `isi_laporan` text NOT NULL,
  `foto` varchar(255) NOT NULL,
  `status` enum('0','proses','selesai') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pengaduan`
--

INSERT INTO `pengaduan` (`id_pengaduan`, `tgl_pengaduan`, `nik`, `isi_laporan`, `foto`, `status`) VALUES
(1, '2023-03-05', '1', 'jalan bolong', 'Screenshot (3).png', 'selesai'),
(2, '2023-03-05', '1', 'bolongggggo', 'Screenshot (6).png', 'selesai');

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(11) NOT NULL,
  `nama_petugas` varchar(35) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(32) NOT NULL,
  `telp` varchar(13) NOT NULL,
  `level` enum('admin','petugas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nama_petugas`, `username`, `password`, `telp`, `level`) VALUES
(1, 'putra', 'putra', 'putra', '4567', 'admin'),
(2, 'dafa', 'dafa', 'dafa', '45678', 'petugas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tanggapan`
--

CREATE TABLE `tanggapan` (
  `id_tanggapan` int(11) NOT NULL,
  `id_pengaduan` int(11) NOT NULL,
  `tgl_tanggapan` date NOT NULL,
  `tanggapan` text NOT NULL,
  `id_petugas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tanggapan`
--

INSERT INTO `tanggapan` (`id_tanggapan`, `id_pengaduan`, `tgl_tanggapan`, `tanggapan`, `id_petugas`) VALUES
(26, 1, '2023-03-05', 'okee', 2),
(28, 2, '2023-03-05', 'asikk', 2);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `masyarakat`
--
ALTER TABLE `masyarakat`
  ADD PRIMARY KEY (`nik`);

--
-- Indeks untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`id_pengaduan`),
  ADD KEY `nik` (`nik`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indeks untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD PRIMARY KEY (`id_tanggapan`),
  ADD KEY `id_pengaduan` (`id_pengaduan`),
  ADD KEY `id_petugas` (`id_petugas`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  MODIFY `id_pengaduan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  MODIFY `id_tanggapan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD CONSTRAINT `pengaduan_ibfk_1` FOREIGN KEY (`nik`) REFERENCES `masyarakat` (`nik`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD CONSTRAINT `tanggapan_ibfk_1` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`) ON DELETE CASCADE,
  ADD CONSTRAINT `tanggapan_ibfk_2` FOREIGN KEY (`id_pengaduan`) REFERENCES `pengaduan` (`id_pengaduan`) ON DELETE CASCADE;
--
-- Database: `pengaduan`
--
CREATE DATABASE IF NOT EXISTS `pengaduan` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pengaduan`;
--
-- Database: `pengaduan_masyarakat`
--
CREATE DATABASE IF NOT EXISTS `pengaduan_masyarakat` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pengaduan_masyarakat`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `masyarakat`
--

CREATE TABLE `masyarakat` (
  `Nik` char(16) NOT NULL,
  `Nama` varchar(35) NOT NULL,
  `Username` varchar(25) NOT NULL,
  `Password` varchar(32) NOT NULL,
  `Telp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `masyarakat`
--

INSERT INTO `masyarakat` (`Nik`, `Nama`, `Username`, `Password`, `Telp`) VALUES
('123241142', 'Rizaldiilyas', 'sfaas', 'aaaaaaa', '08221657324');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengaduan`
--

CREATE TABLE `pengaduan` (
  `Id_Pengaduan` int(11) NOT NULL,
  `Tgl_Pengajuan` date NOT NULL,
  `Nik` char(16) NOT NULL,
  `Isi_Laporan` text NOT NULL,
  `Foto` varchar(255) NOT NULL,
  `Status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `Id_Petugas` int(11) NOT NULL,
  `Nama_Petugas` varchar(36) NOT NULL,
  `Username` varchar(25) NOT NULL,
  `Password` varchar(32) NOT NULL,
  `Telp` varchar(13) NOT NULL,
  `Level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tanggapan`
--

CREATE TABLE `tanggapan` (
  `Id_Tanggapan` int(11) NOT NULL,
  `Id_Pengaduan` int(11) NOT NULL,
  `Tgl_Tanggapan` date NOT NULL,
  `Tanggapan` text NOT NULL,
  `Id_Petugas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `masyarakat`
--
ALTER TABLE `masyarakat`
  ADD PRIMARY KEY (`Nik`);

--
-- Indeks untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`Id_Pengaduan`),
  ADD KEY `Nik` (`Nik`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`Id_Petugas`);

--
-- Indeks untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD PRIMARY KEY (`Id_Tanggapan`),
  ADD KEY `Id_Pengaduan` (`Id_Pengaduan`),
  ADD KEY `Id_Petugas` (`Id_Petugas`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD CONSTRAINT `pengaduan_ibfk_1` FOREIGN KEY (`Nik`) REFERENCES `masyarakat` (`Nik`);

--
-- Ketidakleluasaan untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD CONSTRAINT `tanggapan_ibfk_1` FOREIGN KEY (`Id_Pengaduan`) REFERENCES `pengaduan` (`Id_Pengaduan`),
  ADD CONSTRAINT `tanggapan_ibfk_2` FOREIGN KEY (`Id_Petugas`) REFERENCES `petugas` (`Id_Petugas`);
--
-- Database: `perpustakaan`
--
CREATE DATABASE IF NOT EXISTS `perpustakaan` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `perpustakaan`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` int(11) NOT NULL,
  `kode_anggota` varchar(9) NOT NULL,
  `nama_anggota` varchar(100) NOT NULL,
  `jk_anggota` char(10) NOT NULL,
  `jurusan_anggota` varchar(10) NOT NULL,
  `no_telp_anggota` varchar(13) NOT NULL,
  `alamat_anggota` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `kode_anggota`, `nama_anggota`, `jk_anggota`, `jurusan_anggota`, `no_telp_anggota`, `alamat_anggota`) VALUES
(234324, 'abcde', 'muhammad jesus kala', 'lakik', 'RPL', '082256641733', 'karawang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `kode_buku` char(5) NOT NULL,
  `judul_buku` varchar(50) NOT NULL,
  `penulis_buku` varchar(50) NOT NULL,
  `penerbit_buku` varchar(50) NOT NULL,
  `tahun_penerbit` char(4) NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `tanggal_kembali` date NOT NULL,
  `id_buku` int(11) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `id_petugas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengembalian`
--

CREATE TABLE `pengembalian` (
  `id_pengembalian` int(11) NOT NULL,
  `tanggal_pengembalian` date NOT NULL,
  `denda` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `id_petugas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(11) NOT NULL,
  `nama_petugas` int(11) NOT NULL,
  `jabatan_petugas` int(11) NOT NULL,
  `no_telp_petugas` int(11) NOT NULL,
  `alamat_petugas` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rak`
--

CREATE TABLE `rak` (
  `id_rak` int(11) NOT NULL,
  `nama_rak` varchar(50) NOT NULL,
  `lokasi_rak` varchar(50) NOT NULL,
  `id_buku` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`),
  ADD KEY `stok` (`stok`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD KEY `id_buku` (`id_buku`),
  ADD KEY `id_anggota` (`id_anggota`),
  ADD KEY `id_petugas` (`id_petugas`);

--
-- Indeks untuk tabel `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`id_pengembalian`),
  ADD KEY `id_anggota` (`id_anggota`),
  ADD KEY `id_petugas` (`id_petugas`),
  ADD KEY `id_buku` (`id_buku`),
  ADD KEY `denda` (`denda`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indeks untuk tabel `rak`
--
ALTER TABLE `rak`
  ADD PRIMARY KEY (`id_rak`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`),
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`),
  ADD CONSTRAINT `peminjaman_ibfk_3` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`);

--
-- Ketidakleluasaan untuk tabel `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD CONSTRAINT `pengembalian_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`),
  ADD CONSTRAINT `pengembalian_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`),
  ADD CONSTRAINT `pengembalian_ibfk_3` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`);

--
-- Ketidakleluasaan untuk tabel `rak`
--
ALTER TABLE `rak`
  ADD CONSTRAINT `rak_ibfk_1` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);
--
-- Database: `perusahaan`
--
CREATE DATABASE IF NOT EXISTS `perusahaan` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `perusahaan`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cuti`
--

CREATE TABLE `cuti` (
  `id` int(11) NOT NULL,
  `karyawan_id` int(11) NOT NULL,
  `tanggal_cuti` date NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_barang`
--

CREATE TABLE `detail_barang` (
  `id` int(11) NOT NULL,
  `kode_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `transaksi_id` int(11) NOT NULL,
  `barang_id` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jabatan`
--

CREATE TABLE `jabatan` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis_kelamin` enum('pria','wanita') NOT NULL,
  `jabatan` enum('hrd','manager','direktur','karwayan') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `id` int(11) NOT NULL,
  `nip` varchar(12) NOT NULL,
  `nik` varchar(12) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis_kelamin` enum('pria,wanita') NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `telpon` varchar(12) NOT NULL,
  `agama` varchar(15) NOT NULL,
  `status_nikah` enum('belum nikah,sudah nikah') NOT NULL,
  `alamat` text NOT NULL,
  `foto` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lembur`
--

CREATE TABLE `lembur` (
  `id` int(11) NOT NULL,
  `karyawan_id` int(11) NOT NULL,
  `tanggal_lembur` date NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `telepon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penggajian`
--

CREATE TABLE `penggajian` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` text NOT NULL,
  `karyawan_id` int(11) NOT NULL,
  `jumlah_gaji` int(11) NOT NULL,
  `jumlah_lembur` int(11) NOT NULL,
  `potongan` int(11) NOT NULL,
  `total_gaji_diterima` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `id_penjualan` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `id_pelanggan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `telp` varchar(12) NOT NULL,
  `alamat` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

--
-- Dumping data untuk tabel `pma__central_columns`
--

INSERT INTO `pma__central_columns` (`db_name`, `col_name`, `col_type`, `col_length`, `col_collation`, `col_isNull`, `col_extra`, `col_default`) VALUES
('perpustakaan', 'id_petugas', 'int', '11', '', 0, ',', ''),
('perpustakaan', 'jabatan_petugas', 'int', '11', '', 0, ',', ''),
('perpustakaan', 'nama_petugas', 'int', '11', '', 0, ',', ''),
('perpustakaan', 'no_telp_petugas', 'int', '11', '', 0, ',', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data untuk tabel `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\",\"relation_lines\":\"true\"}');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

--
-- Dumping data untuk tabel `pma__pdf_pages`
--

INSERT INTO `pma__pdf_pages` (`db_name`, `page_nr`, `page_descr`) VALUES
('pdm wn', 1, 'pdm wn'),
('pengaduan_masyarakat', 2, 'Pengaduan_masyarakat'),
('tes', 3, 'Klazzzz'),
('perpustakaan', 4, 'Perpustakaan'),
('klinik', 5, 'Klinik'),
('webperpustakaan', 6, 'webperpustakaan'),
('tokosatu', 7, 'toko1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data untuk tabel `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"tokosatu\",\"table\":\"tbdistributor\"},{\"db\":\"tokosatu\",\"table\":\"tbbarang\"},{\"db\":\"webperpustakaan\",\"table\":\"kategoribuku\"},{\"db\":\"appengaduanmasyarakat\",\"table\":\"masyarakat\"},{\"db\":\"webperpustakaan\",\"table\":\"ulasanbuku\"},{\"db\":\"webperpustakaan\",\"table\":\"kategotibuku_relasi\"},{\"db\":\"webperpustakaan\",\"table\":\"buku\"},{\"db\":\"webperpustakaan\",\"table\":\"koleksipribadi\"},{\"db\":\"webperpustakaan\",\"table\":\"user\"},{\"db\":\"webperpustakaan\",\"table\":\"peminjaman\"}]');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

--
-- Dumping data untuk tabel `pma__table_coords`
--

INSERT INTO `pma__table_coords` (`db_name`, `table_name`, `pdf_page_number`, `x`, `y`) VALUES
('klinik', 'dokter', 5, 421, 39),
('klinik', 'obat', 5, 380, 303),
('klinik', 'pasien', 5, 105, 35),
('klinik', 'praktik', 5, 631, 132),
('klinik', 'resep', 5, 593, 399),
('klinik', 'riwayat_medis', 5, 821, 45),
('klinik', 'transaksi', 5, 110, 256),
('pdm wn', 'tb_detail_transaksi', 1, 214, 189),
('pdm wn', 'tb_member', 1, 192, 526),
('pdm wn', 'tb_outlet', 1, 1247, 353),
('pdm wn', 'tb_paket', 1, 1093, 123),
('pdm wn', 'tb_transaksi', 1, 595, 339),
('pdm wn', 'tb_user', 1, 1202, 537),
('pengaduan_masyarakat', 'masyarakat', 2, 121, 116),
('pengaduan_masyarakat', 'pengaduan', 2, 121, 341),
('pengaduan_masyarakat', 'petugas', 2, 546, 118),
('pengaduan_masyarakat', 'tanggapan', 2, 534, 357),
('perpustakaan', 'anggota', 4, 68, 205),
('perpustakaan', 'buku', 4, 594, 39),
('perpustakaan', 'peminjaman', 4, 323, 350),
('perpustakaan', 'pengambilan', 4, 323, 56),
('perpustakaan', 'petugas', 4, 596, 359),
('perpustakaan', 'rak', 4, 846, 257),
('tes', 'jurusan', 3, 779, 357),
('tes', 'kelaz', 3, 401, 359),
('tes', 'pembayaran', 3, 408, 31),
('tes', 'petugas', 3, 781, 38),
('tes', 'siswa', 3, 96, 27),
('tes', 'spp', 3, 96, 344),
('tokosatu', 'tbbarang', 7, 600, 278),
('tokosatu', 'tbdistributor', 7, 171, 258),
('webperpustakaan', 'buku', 6, 686, 319),
('webperpustakaan', 'kategoribuku', 6, 349, 452),
('webperpustakaan', 'kategotibuku_relasi', 6, 49, 368),
('webperpustakaan', 'koleksipribadi', 6, 360, 13),
('webperpustakaan', 'peminjaman', 6, 79, 76),
('webperpustakaan', 'ulasanbuku', 6, 697, 79),
('webperpustakaan', 'user', 6, 375, 194);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data untuk tabel `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-02-16 06:56:18', '{\"Console\\/Mode\":\"collapse\",\"Server\\/hide_db\":\"\",\"Server\\/only_db\":\"\",\"lang\":\"id\",\"NavigationWidth\":211}');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indeks untuk tabel `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indeks untuk tabel `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indeks untuk tabel `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indeks untuk tabel `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indeks untuk tabel `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indeks untuk tabel `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indeks untuk tabel `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indeks untuk tabel `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indeks untuk tabel `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indeks untuk tabel `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indeks untuk tabel `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indeks untuk tabel `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indeks untuk tabel `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `pp`
--
CREATE DATABASE IF NOT EXISTS `pp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pp`;
--
-- Database: `rpl11`
--
CREATE DATABASE IF NOT EXISTS `rpl11` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `rpl11`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE `guru` (
  `id_guru` int(22) NOT NULL,
  `nama` varchar(122) NOT NULL,
  `password` varchar(122) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `id` int(122) NOT NULL,
  `nama` varchar(122) NOT NULL,
  `password` varchar(122) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id_guru`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` int(122) NOT NULL AUTO_INCREMENT;
--
-- Database: `schlflow`
--
CREATE DATABASE IF NOT EXISTS `schlflow` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `schlflow`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai`
--

CREATE TABLE `nilai` (
  `Nis` int(20) NOT NULL,
  `Id_Mapel` int(20) NOT NULL,
  `Nilai` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `Nis` int(11) NOT NULL,
  `Nama` varchar(35) NOT NULL,
  `JK` enum('laki-laki','perempuan') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`Nis`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`Nis`);
--
-- Database: `sekolah`
--
CREATE DATABASE IF NOT EXISTS `sekolah` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sekolah`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--
-- Kesalahan membaca struktur untuk tabel sekolah.siswa: #1932 - Table &#039;sekolah.siswa&#039; doesn&#039;t exist in engine
-- Kesalahan membaca data untuk tabel sekolah.siswa: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `sekolah`.`siswa`&#039; at line 1
--
-- Database: `sekolah1`
--
CREATE DATABASE IF NOT EXISTS `sekolah1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sekolah1`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `eskul`
--
-- Kesalahan membaca struktur untuk tabel sekolah1.eskul: #1932 - Table &#039;sekolah1.eskul&#039; doesn&#039;t exist in engine
-- Kesalahan membaca data untuk tabel sekolah1.eskul: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `sekolah1`.`eskul`&#039; at line 1
--
-- Database: `siswa`
--
CREATE DATABASE IF NOT EXISTS `siswa` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `siswa`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `catatanperjalanan`
--
-- Kesalahan membaca struktur untuk tabel siswa.catatanperjalanan: #1932 - Table &#039;siswa.catatanperjalanan&#039; doesn&#039;t exist in engine
-- Kesalahan membaca data untuk tabel siswa.catatanperjalanan: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `siswa`.`catatanperjalanan`&#039; at line 1
--
-- Database: `siswa1`
--
CREATE DATABASE IF NOT EXISTS `siswa1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `siswa1`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbsiswa`
--

CREATE TABLE `tbsiswa` (
  `nis` varchar(10) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `alamat` text NOT NULL,
  `notelp` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbsiswa`
--

INSERT INTO `tbsiswa` (`nis`, `nama`, `alamat`, `notelp`) VALUES
('001', 'Aulia Rachman', 'Jomin Barat', '0895369458951');
--
-- Database: `tbdatasiswa`
--
CREATE DATABASE IF NOT EXISTS `tbdatasiswa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tbdatasiswa`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbsiswa`
--
-- Kesalahan membaca struktur untuk tabel tbdatasiswa.tbsiswa: #1932 - Table &#039;tbdatasiswa.tbsiswa&#039; doesn&#039;t exist in engine
-- Kesalahan membaca data untuk tabel tbdatasiswa.tbsiswa: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `tbdatasiswa`.`tbsiswa`&#039; at line 1
--
-- Database: `tes`
--
CREATE DATABASE IF NOT EXISTS `tes` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tes`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan`
--

CREATE TABLE `jurusan` (
  `Id_Jurusan` int(11) NOT NULL,
  `Kompetensi_Keahlian` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelaz`
--

CREATE TABLE `kelaz` (
  `Id_Kelas` int(11) NOT NULL,
  `Nama_Kelas` varchar(16) NOT NULL,
  `Id_Jurusan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `Id_Pembayaran` int(11) NOT NULL,
  `Id_Petugas` int(11) NOT NULL,
  `Nisn` varchar(10) NOT NULL,
  `Tgl_Bayar` date NOT NULL,
  `Bulan_Dibayar` varchar(8) NOT NULL,
  `Tahun_Dibayar` varchar(4) NOT NULL,
  `Id_Spp` int(11) NOT NULL,
  `Jumlah_Bayar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `Id_Petugas` int(11) NOT NULL,
  `Username` varchar(25) NOT NULL,
  `Password` varchar(32) NOT NULL,
  `Nama_Petugas` varchar(35) NOT NULL,
  `Level` enum('admin','petugas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `Nisn` char(10) NOT NULL,
  `Nis` char(8) NOT NULL,
  `Nama` varchar(35) NOT NULL,
  `Id_Kelas` int(11) NOT NULL,
  `Alamat` text NOT NULL,
  `No_Telp` varchar(13) NOT NULL,
  `Id_Spp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `spp`
--

CREATE TABLE `spp` (
  `Id_Spp` int(11) NOT NULL,
  `Tahun` int(11) NOT NULL,
  `Nominal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`Id_Jurusan`),
  ADD KEY `Kompetensi_Keahlian` (`Kompetensi_Keahlian`);

--
-- Indeks untuk tabel `kelaz`
--
ALTER TABLE `kelaz`
  ADD PRIMARY KEY (`Id_Kelas`),
  ADD KEY `Kompetensi_Keahlian` (`Id_Jurusan`),
  ADD KEY `Kompetensi_Keahlian_2` (`Id_Jurusan`),
  ADD KEY `Kompetensi_Keahlian_3` (`Id_Jurusan`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`Id_Pembayaran`),
  ADD KEY `Id_Petugas` (`Id_Petugas`),
  ADD KEY `Id_Spp` (`Id_Spp`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`Id_Petugas`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`Nisn`),
  ADD KEY `Id_Spp` (`Id_Spp`),
  ADD KEY `Id_Kelas` (`Id_Kelas`);

--
-- Indeks untuk tabel `spp`
--
ALTER TABLE `spp`
  ADD PRIMARY KEY (`Id_Spp`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `Id_Jurusan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21375;

--
-- AUTO_INCREMENT untuk tabel `kelaz`
--
ALTER TABLE `kelaz`
  MODIFY `Id_Kelas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `Id_Pembayaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `petugas`
--
ALTER TABLE `petugas`
  MODIFY `Id_Petugas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `spp`
--
ALTER TABLE `spp`
  MODIFY `Id_Spp` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `kelaz`
--
ALTER TABLE `kelaz`
  ADD CONSTRAINT `kelaz_ibfk_1` FOREIGN KEY (`Id_Jurusan`) REFERENCES `jurusan` (`Id_Jurusan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kelaz_ibfk_2` FOREIGN KEY (`Id_Kelas`) REFERENCES `siswa` (`Id_Kelas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`Id_Petugas`) REFERENCES `petugas` (`Id_Petugas`) ON DELETE CASCADE,
  ADD CONSTRAINT `pembayaran_ibfk_2` FOREIGN KEY (`Id_Spp`) REFERENCES `siswa` (`Id_Spp`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_ibfk_1` FOREIGN KEY (`Id_Spp`) REFERENCES `spp` (`Id_Spp`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `tokosatu`
--
CREATE DATABASE IF NOT EXISTS `tokosatu` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tokosatu`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbbarang`
--

CREATE TABLE `tbbarang` (
  `idbarang` varchar(10) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `id_distributor` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbdistributor`
--

CREATE TABLE `tbdistributor` (
  `iddistributor` varchar(10) NOT NULL,
  `nama_distributor` varchar(30) NOT NULL,
  `alamat` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbbarang`
--
ALTER TABLE `tbbarang`
  ADD KEY `id_distributor` (`id_distributor`);

--
-- Indeks untuk tabel `tbdistributor`
--
ALTER TABLE `tbdistributor`
  ADD PRIMARY KEY (`iddistributor`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbdistributor`
--
ALTER TABLE `tbdistributor`
  ADD CONSTRAINT `tbdistributor_ibfk_1` FOREIGN KEY (`iddistributor`) REFERENCES `tbbarang` (`id_distributor`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `user`
--
CREATE DATABASE IF NOT EXISTS `user` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `user`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `catatanperjalanan`
--
-- Kesalahan membaca struktur untuk tabel user.catatanperjalanan: #1932 - Table &#039;user.catatanperjalanan&#039; doesn&#039;t exist in engine
-- Kesalahan membaca data untuk tabel user.catatanperjalanan: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `user`.`catatanperjalanan`&#039; at line 1

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_form`
--
-- Kesalahan membaca struktur untuk tabel user.user_form: #1932 - Table &#039;user.user_form&#039; doesn&#039;t exist in engine
-- Kesalahan membaca data untuk tabel user.user_form: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `user`.`user_form`&#039; at line 1
--
-- Database: `webpengaduan`
--
CREATE DATABASE IF NOT EXISTS `webpengaduan` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `webpengaduan`;
--
-- Database: `webperpustakaan`
--
CREATE DATABASE IF NOT EXISTS `webperpustakaan` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `webperpustakaan`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `bukuid` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `penulis` varchar(255) NOT NULL,
  `penerbit` varchar(255) NOT NULL,
  `tahunterbit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategoribuku`
--

CREATE TABLE `kategoribuku` (
  `kategoriid` int(11) NOT NULL,
  `namakategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategotibuku_relasi`
--

CREATE TABLE `kategotibuku_relasi` (
  `kategoribukuid` int(11) NOT NULL,
  `bukuid` int(11) NOT NULL,
  `kategoriid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `koleksipribadi`
--

CREATE TABLE `koleksipribadi` (
  `koleksiid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `bukuid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `peminjamanid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `bukuid` int(11) NOT NULL,
  `tanggalpeminjaman` date NOT NULL,
  `tanggalpengembalian` date NOT NULL,
  `statuspeminjaman` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ulasanbuku`
--

CREATE TABLE `ulasanbuku` (
  `ulasanid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `bukuid` int(11) NOT NULL,
  `ulasan` text NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `username` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `namalengkap` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`userid`, `username`, `password`, `email`, `namalengkap`) VALUES
(1, 'budi', '$2y$12$honVh0s6Q642UProKzJU/OCVc/eHNUlIa0eci6KM1jB5SU/sZlL82', 'budi@gmail.com', 'budi'),
(2, 'zaldi', '$2y$12$6ohga99vBZR..98Qgshu2u1mgD3I38sUXlfCx.lRKP0SlGtJduQeS', 'zaldi@gmail.com', 'zaldi'),
(3, 'ryan', '$2y$12$yaipn4ITek62k/Q44ahwOOjYuh4zLX6eigjAZ0XSUPX5MHrvbGxgO', 'ryan@gmail.com', 'ryan');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`bukuid`),
  ADD KEY `tahunterbit` (`tahunterbit`);

--
-- Indeks untuk tabel `kategoribuku`
--
ALTER TABLE `kategoribuku`
  ADD PRIMARY KEY (`kategoriid`);

--
-- Indeks untuk tabel `kategotibuku_relasi`
--
ALTER TABLE `kategotibuku_relasi`
  ADD PRIMARY KEY (`kategoribukuid`),
  ADD KEY `bukuid` (`bukuid`),
  ADD KEY `kategoriid` (`kategoriid`);

--
-- Indeks untuk tabel `koleksipribadi`
--
ALTER TABLE `koleksipribadi`
  ADD PRIMARY KEY (`koleksiid`),
  ADD KEY `userid` (`userid`),
  ADD KEY `bukuid` (`bukuid`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`peminjamanid`),
  ADD KEY `userid` (`userid`),
  ADD KEY `bukuid` (`bukuid`);

--
-- Indeks untuk tabel `ulasanbuku`
--
ALTER TABLE `ulasanbuku`
  ADD PRIMARY KEY (`ulasanid`),
  ADD KEY `userid` (`userid`),
  ADD KEY `bukuid` (`bukuid`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `bukuid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kategoribuku`
--
ALTER TABLE `kategoribuku`
  MODIFY `kategoriid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kategotibuku_relasi`
--
ALTER TABLE `kategotibuku_relasi`
  MODIFY `kategoribukuid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `koleksipribadi`
--
ALTER TABLE `koleksipribadi`
  MODIFY `koleksiid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `peminjamanid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ulasanbuku`
--
ALTER TABLE `ulasanbuku`
  MODIFY `ulasanid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`bukuid`) REFERENCES `peminjaman` (`bukuid`);

--
-- Ketidakleluasaan untuk tabel `kategotibuku_relasi`
--
ALTER TABLE `kategotibuku_relasi`
  ADD CONSTRAINT `kategotibuku_relasi_ibfk_1` FOREIGN KEY (`bukuid`) REFERENCES `buku` (`bukuid`),
  ADD CONSTRAINT `kategotibuku_relasi_ibfk_2` FOREIGN KEY (`kategoriid`) REFERENCES `kategoribuku` (`kategoriid`);

--
-- Ketidakleluasaan untuk tabel `koleksipribadi`
--
ALTER TABLE `koleksipribadi`
  ADD CONSTRAINT `koleksipribadi_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  ADD CONSTRAINT `koleksipribadi_ibfk_2` FOREIGN KEY (`bukuid`) REFERENCES `buku` (`bukuid`);

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`);

--
-- Ketidakleluasaan untuk tabel `ulasanbuku`
--
ALTER TABLE `ulasanbuku`
  ADD CONSTRAINT `ulasanbuku_ibfk_1` FOREIGN KEY (`bukuid`) REFERENCES `buku` (`bukuid`),
  ADD CONSTRAINT `ulasanbuku_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`);
--
-- Database: `web_pengaduan_masyarakat`
--
CREATE DATABASE IF NOT EXISTS `web_pengaduan_masyarakat` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `web_pengaduan_masyarakat`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `masyarakat`
--

CREATE TABLE `masyarakat` (
  `Nik` char(16) NOT NULL,
  `Nama` varchar(35) NOT NULL,
  `Username` varchar(25) NOT NULL,
  `Password` varchar(32) NOT NULL,
  `Telp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `masyarakat`
--

INSERT INTO `masyarakat` (`Nik`, `Nama`, `Username`, `Password`, `Telp`) VALUES
('123241142', 'Rizaldiilyas', 'sfaas', 'aaaaaaa', '08221657324');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengaduan`
--

CREATE TABLE `pengaduan` (
  `Id_Pengaduan` int(11) NOT NULL,
  `Tgl_Pengaduan` date NOT NULL,
  `Nik` char(16) NOT NULL,
  `Isi_Laporan` text NOT NULL,
  `Foto` varchar(255) NOT NULL,
  `Status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(11) NOT NULL,
  `Nama_Petugas` varchar(36) NOT NULL,
  `Username` varchar(25) NOT NULL,
  `Password` text NOT NULL,
  `Telp` varchar(13) NOT NULL,
  `Level` enum('petugas','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `Nama_Petugas`, `Username`, `Password`, `Telp`, `Level`) VALUES
(1, 'kunti bogel', 'kunti bogel', '$2y$10$E4KWiEg6SfSfrJQK7xefle8a1yjgOhyD1/xS//FyIvSP.IsBNuIDW', '082267558977', 'petugas'),
(3, 'budi', 'bpbudi', '$2y$10$pRbquX2Gdyc0N00pMxLOYelAPH4WB0/qLmKiNN.yOvsQFJJGsq6ru', '082267558974', 'petugas'),
(4, 'osik', 'bposik', '$2y$10$9bt79GBrpWhfGNpSh.GjLejVISA.y9b8uLKeg5zfRiJ7rbIRv5rzC', '082267558911', 'petugas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tanggapan`
--

CREATE TABLE `tanggapan` (
  `Id_Tanggapan` int(11) NOT NULL,
  `Id_Pengaduan` int(11) NOT NULL,
  `Tgl_Tanggapan` date NOT NULL,
  `Tanggapan` text NOT NULL,
  `Id_Petugas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `masyarakat`
--
ALTER TABLE `masyarakat`
  ADD PRIMARY KEY (`Nik`);

--
-- Indeks untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`Id_Pengaduan`),
  ADD KEY `Nik` (`Nik`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indeks untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD PRIMARY KEY (`Id_Tanggapan`),
  ADD KEY `Id_Pengaduan` (`Id_Pengaduan`),
  ADD KEY `Id_Petugas` (`Id_Petugas`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD CONSTRAINT `pengaduan_ibfk_1` FOREIGN KEY (`Nik`) REFERENCES `masyarakat` (`Nik`);

--
-- Ketidakleluasaan untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD CONSTRAINT `tanggapan_ibfk_1` FOREIGN KEY (`Id_Pengaduan`) REFERENCES `pengaduan` (`Id_Pengaduan`),
  ADD CONSTRAINT `tanggapan_ibfk_2` FOREIGN KEY (`Id_Petugas`) REFERENCES `petugas` (`Id_Petugas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
