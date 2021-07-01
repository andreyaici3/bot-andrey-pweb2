-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Jul 2021 pada 15.20
-- Versi server: 10.4.16-MariaDB
-- Versi PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bot-ak`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `format_request_response`
--

CREATE TABLE `format_request_response` (
  `id` int(11) NOT NULL,
  `request` text NOT NULL,
  `response` text NOT NULL,
  `regex` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `format_request_response`
--

INSERT INTO `format_request_response` (`id`, `request`, `response`, `regex`) VALUES
(2, 'noformat', 'Maaf, Format Yang Anda Masukan Salah. \r\nUntuk Melihat Format Yang Bisa Digunakan Silahkan Ketik list. \r\nTerimakasih', 0),
(3, 'daftar', '/#[a-zA-Z0-9]+/', 1),
(6, '/start', 'Terimakasih Sudah Memulai. SIlahkan Daftar Terlebih Dahulu Untuk Menggunakan Bot ini. Ketik Daftar Untuk Mendapatakan Format Pendaftaran', 0),
(9, 'CH.AX', 'Harga Pulsa Axis\r\nAX5 = 5.850\r\nAX10 = 10.850\r\nAX15 = 15.850', 0),
(10, 'CH.TR', 'TR5 = 5.350\r\nTR10 = 10.150\r\nTR15 = 14.950', 0),
(11, 'test', 'Terimakasih Telah Memanggil BOT. Status Bot Saat ini Normal, Aman Kawal Berkah', 0),
(12, 'UN', 'Untuk Mengganti Nama Silahkan Gunakan Format UN#NamaBaru. Perhatian Nama Baru hanya boleh 1 kata tidak boleh ada spasi', 0),
(13, 'list', 'Daftar Format\r\n1. profile = Cek Profile\r\n2. CH.AX = Cek Harga Pulsa Axis\r\n3. UN = Ubah Nama (UN#namabaru)\r\n4. Test = Test Status Bot', 0),
(14, 'nodaftar', 'Maaf, Anda Belum Terdaftar Di Sistem, Silahkan Untuk Mendaftar Terlebih Dahulu, dengan Format DAFTAR#NAMA#NOHP#ALAMAT', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kotak_masuk`
--

CREATE TABLE `kotak_masuk` (
  `update_id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `id_pengirim` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `text` text NOT NULL,
  `visibility` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kotak_masuk`
--

INSERT INTO `kotak_masuk` (`update_id`, `message_id`, `id_pengirim`, `date`, `text`, `visibility`) VALUES
(512776153, 3, 375107745, '2021-06-27 09:22:11', '/start', 1),
(512776154, 4, 375107745, '2021-06-27 09:22:16', 'Pesan 1', 1),
(512776155, 5, 375107745, '2021-06-27 09:40:15', 'Pesan 2', 1),
(512776156, 6, 375107745, '2021-06-27 09:40:17', 'Pesan 3', 1),
(512776157, 7, 375107745, '2021-06-27 12:23:35', 'Pesan 4', 1),
(512776158, 9, 375107745, '2021-06-27 12:48:43', 'test', 1),
(512776159, 19, 375107745, '2021-06-27 13:57:47', 'CH.AX', 1),
(512776160, 21, 375107745, '2021-06-27 13:57:59', 'woi', 1),
(512776161, 23, 375107745, '2021-06-27 14:02:35', 'CH.AX', 1),
(512776162, 24, 375107745, '2021-06-27 14:03:09', 'CH.AX', 1),
(512776163, 25, 375107745, '2021-06-27 14:03:46', 'Hmm', 1),
(512776164, 27, 375107745, '2021-06-27 14:03:59', 'CH.AX', 1),
(512776165, 29, 375107745, '2021-06-27 14:09:38', 'CH.AX', 1),
(512776166, 31, 375107745, '2021-06-27 14:20:51', 'DAFTAR', 1),
(512776167, 33, 375107745, '2021-06-27 14:22:10', 'Daftar', 1),
(512776168, 34, 375107745, '2021-06-27 14:23:21', 'Daftar#Andrey#Cikubangmulya#089675677955', 1),
(512776169, 36, 375107745, '2021-06-27 16:41:49', 'DAFTAR#ANDREY#CIKUBANGMULYA#2020', 1),
(512776170, 38, 375107745, '2021-06-27 16:42:32', 'DAFTAR#ANDREY#CIKUBANGMULYA#2020', 1),
(512776171, 40, 375107745, '2021-06-27 16:43:07', 'DAFTAR#ANDREY#CIKUBANGMULYA#2020', 1),
(512776172, 42, 375107745, '2021-06-27 16:43:52', 'DAFTAR#ANDREY#CIKUBANGMULYA#2020', 1),
(512776173, 44, 375107745, '2021-06-27 16:45:39', 'DAFTAR#ANDREY#089675677955#CIKUBANGMULYA', 1),
(512776174, 46, 375107745, '2021-06-27 16:46:46', 'DAFTAR#ANDREY#089675677955#CIKUBANGMULYA', 1),
(512776175, 48, 375107745, '2021-06-27 16:49:22', 'DAFTAR#ANDREY#089675677955#CIKUBANGMULYA', 1),
(512776176, 50, 375107745, '2021-06-27 16:49:32', 'DAFTAR#ANDREY#089675677955#CIKUBANGMULYA', 1),
(512776177, 52, 375107745, '2021-06-27 16:50:27', 'Daftar', 1),
(512776178, 54, 375107745, '2021-06-27 16:50:48', 'Haha', 1),
(512776179, 55, 375107745, '2021-06-27 16:51:24', 'Daftar', 1),
(512776180, 57, 375107745, '2021-06-27 16:52:28', 'Daftar', 1),
(512776181, 65, 375107745, '2021-06-27 16:56:58', 't', 1),
(512776182, 67, 375107745, '2021-06-27 17:07:09', 'Test', 1),
(512776183, 69, 375107745, '2021-06-27 17:21:23', 'Daftar', 1),
(512776184, 71, 375107745, '2021-06-27 17:21:37', 'CH.AX', 1),
(512776185, 73, 375107745, '2021-06-27 17:22:52', 'CH.AX', 1),
(512776186, 75, 375107745, '2021-06-27 17:23:53', 'CH.AX', 1),
(512776187, 77, 375107745, '2021-06-27 17:24:51', 'CH.AX', 1),
(512776188, 79, 375107745, '2021-06-27 17:27:26', 'CH.AX', 1),
(512776189, 81, 375107745, '2021-06-27 17:34:59', 'CH.AX', 1),
(512776190, 83, 375107745, '2021-06-27 17:35:13', 'CH.AX', 1),
(512776191, 84, 375107745, '2021-06-27 17:36:10', 'CH.AX', 1),
(512776192, 95, 375107745, '2021-06-27 17:37:54', 'CH.AX', 1),
(512776193, 97, 375107745, '2021-06-27 17:38:02', 'daftar', 1),
(512776194, 99, 375107745, '2021-06-27 17:38:33', 'DAFTAR#ANDREY ANDRINSYAH#089675677955#CIKUBANGMULYA', 1),
(512776195, 101, 375107745, '2021-06-27 17:39:01', 'CH.AX', 1),
(512776196, 103, 408440449, '2021-06-27 17:40:57', '/start', 1),
(512776197, 105, 408440449, '2021-06-27 17:42:01', 'Ch.ax', 1),
(512776198, 107, 408440449, '2021-06-27 17:43:24', 'Daftar#gugun#085316838579#ciawigebang', 1),
(512776199, 109, 408440449, '2021-06-27 17:43:58', 'Ch.ax', 1),
(512776200, 111, 408440449, '2021-06-27 17:44:13', 'Ax10', 1),
(512776201, 113, 375107745, '2021-06-28 07:33:32', 'Test', 1),
(512776202, 115, 375107745, '2021-06-28 17:08:11', 'Halo', 1),
(512776203, 117, 375107745, '2021-06-28 17:09:38', 'format1', 1),
(512776204, 119, 375107745, '2021-06-28 17:38:05', 'CH.AX', 1),
(512776205, 121, 375107745, '2021-06-28 17:39:06', 'CH.TR', 1),
(512776206, 123, 375107745, '2021-06-28 17:39:21', 'gas', 1),
(512776207, 125, 375107745, '2021-06-28 17:40:40', 'Hmm', 1),
(512776208, 127, 375107745, '2021-06-28 17:45:08', 'H', 1),
(512776209, 129, 375107745, '2021-06-28 17:45:39', 'Test', 1),
(512776210, 131, 375107745, '2021-06-28 17:46:37', 'Test', 1),
(512776211, 133, 375107745, '2021-06-28 17:46:46', './start', 1),
(512776212, 135, 375107745, '2021-06-28 17:46:50', '/start', 1),
(512776213, 137, 375107745, '2021-06-28 17:48:05', '/start', 1),
(512776214, 139, 375107745, '2021-06-28 17:48:29', '/start', 1),
(512776215, 141, 375107745, '2021-06-28 17:49:17', '/start', 1),
(512776216, 143, 375107745, '2021-06-28 17:50:38', '/start', 1),
(512776217, 145, 375107745, '2021-06-28 17:51:01', '/start', 1),
(512776218, 147, 375107745, '2021-06-28 17:51:21', '/start', 1),
(512776219, 149, 375107745, '2021-06-28 17:51:49', '/start', 1),
(512776220, 151, 375107745, '2021-06-28 17:52:38', '/start', 1),
(512776221, 153, 375107745, '2021-06-28 17:53:03', '/start', 1),
(512776222, 155, 375107745, '2021-06-28 17:54:01', '/start', 1),
(512776223, 157, 375107745, '2021-06-28 17:58:21', 'Ax', 1),
(512776224, 159, 927478433, '2021-06-28 17:58:55', '/start', 1),
(512776225, 161, 927478433, '2021-06-28 17:59:33', 'Daftar', 1),
(512776226, 163, 927478433, '2021-06-28 18:00:21', 'DAFTAR#RIO#081224036675#Desa Cileuleuy', 1),
(512776227, 165, 927478433, '2021-06-28 18:02:19', 'Test', 1),
(512776228, 167, 375107745, '2021-06-29 08:54:43', 'UN', 1),
(512776229, 169, 375107745, '2021-06-29 08:55:11', 'DAFTAR#ANDREY#089675677955#CIKUBANGMULYA', 1),
(512776230, 171, 375107745, '2021-06-29 08:55:18', 'UN', 1),
(512776231, 173, 375107745, '2021-06-29 08:55:28', 'UN#Anda', 1),
(512776232, 175, 375107745, '2021-06-29 08:56:07', 'UN#Anda', 1),
(512776233, 177, 375107745, '2021-06-29 08:57:33', 'UN#Anda', 1),
(512776234, 179, 375107745, '2021-06-29 09:00:01', 'UN#Anda', 1),
(512776235, 181, 375107745, '2021-06-29 09:01:13', 'UN#Cahya', 1),
(512776236, 183, 375107745, '2021-07-01 13:31:48', 'Test', 1),
(512776237, 185, 820374856, '2021-07-01 13:44:27', '/start', 1),
(512776238, 187, 820374856, '2021-07-01 13:44:40', 'daftar', 1),
(512776239, 189, 820374856, '2021-07-01 13:44:49', 'CH.AX', 1),
(512776240, 191, 375107745, '2021-07-01 13:48:34', 'Profile', 1),
(512776241, 193, 375107745, '2021-07-01 13:49:33', 'Profile', 1),
(512776242, 195, 375107745, '2021-07-01 13:49:57', 'Profile', 1),
(512776243, 197, 375107745, '2021-07-01 13:52:54', 'profile', 1),
(512776244, 199, 927478433, '2021-07-01 13:53:49', 'Profile', 1),
(512776245, 200, 820374856, '2021-07-01 13:53:50', 'profile', 1),
(512776246, 203, 927478433, '2021-07-01 13:55:15', 'UN#Prasetio', 1),
(512776247, 205, 927478433, '2021-07-01 13:55:19', 'Profile', 1),
(512776248, 207, 375107745, '2021-07-01 13:58:47', 'CH.AX', 1),
(512776249, 209, 375107745, '2021-07-01 13:58:50', 'noformat', 1),
(512776250, 211, 375107745, '2021-07-01 13:59:05', 'format', 1),
(512776251, 213, 375107745, '2021-07-01 14:00:33', 'Format', 1),
(512776252, 215, 375107745, '2021-07-01 14:01:10', 'format', 1),
(512776253, 217, 375107745, '2021-07-01 14:02:02', 'format', 1),
(512776254, 219, 375107745, '2021-07-01 14:02:32', 'list', 1),
(512776255, 221, 375107745, '2021-07-01 14:10:07', 'Test', 1),
(512776256, 223, 875910896, '2021-07-01 16:09:29', '/start', 1),
(512776257, 225, 875910896, '2021-07-01 16:09:44', 'Daftar', 1),
(512776258, 227, 875910896, '2021-07-01 16:10:34', 'DAFTAR#DIMAS#087990567608#SELAJAMBE', 1),
(512776259, 229, 875910896, '2021-07-01 16:12:38', 'Profile', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `member`
--

CREATE TABLE `member` (
  `kode_member` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `no_hp` bigint(20) NOT NULL,
  `alamat` text NOT NULL,
  `pin` varchar(6) NOT NULL,
  `saldo` int(11) NOT NULL,
  `id_pengirim` int(11) NOT NULL,
  `date_create` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `member`
--

INSERT INTO `member` (`kode_member`, `nama`, `no_hp`, `alamat`, `pin`, `saldo`, `id_pengirim`, `date_create`) VALUES
(17, 'gugun', 85316838579, 'ciawigebang', '1234', 0, 408440449, '2021-06-28 07:14:13'),
(18, 'Prasetio', 81224036675, 'Desa', '1234', 0, 927478433, '2021-06-28 18:00:22'),
(20, 'DIMAS', 87990567608, 'SELAJAMBE', '1234', 0, 875910896, '2021-07-01 16:10:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `response`
--

CREATE TABLE `response` (
  `id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `response` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `response`
--

INSERT INTO `response` (`id`, `message_id`, `status`, `response`, `date_created`) VALUES
(13, 3, 1, 'MAAF, FORMAT YANG ANDA MINTA TIDAK ADA', '2021-06-28 07:26:17'),
(14, 4, 1, 'MAAF, FORMAT YANG ANDA MINTA TIDAK ADA', '2021-06-28 07:26:17'),
(15, 5, 1, 'MAAF, FORMAT YANG ANDA MINTA TIDAK ADA', '2021-06-28 07:26:17'),
(16, 6, 1, 'MAAF, FORMAT YANG ANDA MINTA TIDAK ADA', '2021-06-28 07:26:17'),
(17, 7, 1, 'MAAF, FORMAT YANG ANDA MINTA TIDAK ADA', '2021-06-28 07:26:17'),
(18, 9, 1, 'MAAF, FORMAT YANG ANDA MINTA TIDAK ADA', '2021-06-28 07:26:17'),
(19, 19, 1, 'Daftar Harga\r\nAX10 - 10.850\r\nAX15 - 15.250', '2021-06-28 07:26:17'),
(20, 21, 1, 'MAAF, FORMAT YANG ANDA MINTA TIDAK ADA', '2021-06-28 07:26:17'),
(21, 23, 1, 'Daftar Harga\r\nAX10 - 10.850\r\nAX15 - 15.250', '2021-06-28 07:26:17'),
(22, 24, 1, 'Daftar Harga\r\nAX10 - 10.850\r\nAX15 - 15.250', '2021-06-28 07:26:17'),
(23, 25, 1, 'MAAF, FORMAT YANG ANDA MINTA TIDAK ADA', '2021-06-28 07:26:17'),
(24, 27, 1, 'Daftar Harga\r\nAX10 - 10.850\r\nAX15 - 15.250', '2021-06-28 07:26:17'),
(25, 29, 1, 'Daftar Harga\r\nAX10 - 10.850\r\nAX15 - 15.250', '2021-06-28 07:26:17'),
(26, 31, 1, 'MAAF, FORMAT YANG ANDA MINTA TIDAK ADA', '2021-06-28 07:26:17'),
(27, 33, 1, '', '2021-06-28 07:26:17'),
(28, 34, 1, 'Pendaftaran Andrey Berhasil. Silahkan Untuk Bertransaksi', '2021-06-28 07:26:17'),
(29, 36, 1, 'Pendaftaran ANDREY Berhasil. Silahkan Untuk Bertransaksi', '2021-06-28 07:26:17'),
(30, 38, 1, 'Pendaftaran ANDREY Berhasil. Silahkan Untuk Bertransaksi', '2021-06-28 07:26:17'),
(31, 40, 1, 'Pendaftaran  Berhasil. Silahkan Untuk Bertransaksi', '2021-06-28 07:26:17'),
(32, 42, 1, 'Sorry!, Anda Sudah Terdaftar Di Sistem', '2021-06-28 07:26:17'),
(33, 44, 1, 'Sorry!, Anda Sudah Terdaftar Di Sistem', '2021-06-28 07:26:17'),
(34, 46, 1, 'Sorry!, Anda Sudah Terdaftar Di Sistem', '2021-06-28 07:26:17'),
(35, 48, 1, 'Pendaftaran ANDREY Berhasil. Silahkan Untuk Bertransaksi', '2021-06-28 07:26:17'),
(36, 50, 1, 'Sorry!, Anda Sudah Terdaftar Di Sistem', '2021-06-28 07:26:17'),
(37, 52, 1, 'Sorry!, Anda Sudah Terdaftar Di Sistem', '2021-06-28 07:26:17'),
(39, 55, 1, 'Sorry!, Anda Sudah Terdaftar Di Sistem', '2021-06-28 07:26:17'),
(40, 57, 1, 'Gunakan Format DAFTAR#NAMA#NOHP#ALAMAT Untuk melakukan Pendfataran', '2021-06-28 07:26:17'),
(41, 65, 1, 'MAAF, FORMAT YANG ANDA MINTA TIDAK ADA', '2021-06-28 07:26:17'),
(42, 54, 1, 'Oke', '2021-06-28 07:26:17'),
(43, 67, 1, 'Halo, Selamat Datang. Status Bot saat ini Normal', '2021-06-28 07:26:17'),
(44, 69, 1, 'Gunakan Format DAFTAR#NAMA#NOHP#ALAMAT Untuk melakukan Pendfataran', '2021-06-28 07:26:17'),
(45, 71, 1, 'MAAF, FORMAT YANG ANDA MINTA TIDAK ADA', '2021-06-28 07:26:17'),
(46, 73, 1, 'MAAF, FORMAT YANG ANDA MINTA TIDAK ADA', '2021-06-28 07:26:17'),
(47, 75, 1, 'MAAF, FORMAT YANG ANDA MINTA TIDAK ADA', '2021-06-28 07:26:17'),
(48, 77, 1, 'MAAF, FORMAT YANG ANDA MINTA TIDAK ADA', '2021-06-28 07:26:17'),
(49, 79, 1, 'Daftar Harga\r\nAX10 - 10.850\r\nAX15 - 15.250', '2021-06-28 07:26:17'),
(50, 81, 1, 'Daftar Harga\r\nAX10 - 10.850\r\nAX15 - 15.250', '2021-06-28 07:26:17'),
(51, 83, 1, 'Maaf, Anda Belum Terdaftar Di Sistem, Silahkan Untuk Mendaftar Terlebih Dahulu, dengan Format DAFTAR#NAMA#NOHP#ALAMAT', '2021-06-28 07:26:17'),
(52, 84, 1, 'Maaf, Anda Belum Terdaftar Di Sistem, Silahkan Untuk Mendaftar Terlebih Dahulu, dengan Format DAFTAR#NAMA#NOHP#ALAMAT', '2021-06-28 07:26:17'),
(53, 95, 1, 'Maaf, Anda Belum Terdaftar Di Sistem, Silahkan Untuk Mendaftar Terlebih Dahulu, dengan Format DAFTAR#NAMA#NOHP#ALAMAT', '2021-06-28 07:26:17'),
(54, 97, 1, 'Gunakan Format DAFTAR#NAMA#NOHP#ALAMAT Untuk melakukan Pendfataran', '2021-06-28 07:26:17'),
(55, 99, 1, 'Pendaftaran ANDREY Berhasil. Silahkan Untuk Bertransaksi', '2021-06-28 07:26:17'),
(56, 101, 1, 'Daftar Harga\r\nAX10 - 10.850\r\nAX15 - 15.250', '2021-06-28 07:26:17'),
(57, 103, 1, 'MAAF, FORMAT YANG ANDA MINTA TIDAK ADA', '2021-06-28 07:26:17'),
(58, 105, 1, 'Maaf, Anda Belum Terdaftar Di Sistem, Silahkan Untuk Mendaftar Terlebih Dahulu, dengan Format DAFTAR#NAMA#NOHP#ALAMAT', '2021-06-28 07:26:17'),
(59, 107, 1, 'Pendaftaran gugun Berhasil. Silahkan Untuk Bertransaksi', '2021-06-28 07:26:17'),
(60, 109, 1, 'Daftar Harga\r\nAX10 - 10.850\r\nAX15 - 15.250', '2021-06-28 07:26:17'),
(61, 111, 1, 'MAAF, FORMAT YANG ANDA MINTA TIDAK ADA', '2021-06-28 07:26:17'),
(62, 113, 1, 'Halo, Selamat Datang. Status Bot saat ini Normal', '2021-06-28 07:33:36'),
(63, 115, 1, 'Selamat Datang Kawan', '2021-06-28 17:08:14'),
(64, 117, 1, 'Berikut adalah format format yang bisa dicoba\r\n1. CH => Cek harga\r\n2. Test => Cek Bot\r\n3. daftar => untuk pendaftaran', '2021-06-28 17:09:40'),
(65, 119, 1, 'Harga Pulsa Axis\r\nAX5 = 5.850\r\nAX10 = 10.850\r\nAX15 = 15.850', '2021-06-28 17:38:16'),
(66, 121, 1, 'TR5 = 5.350\r\nTR10 = 10.150\r\nTR15 = 14.950', '2021-06-28 17:39:09'),
(67, 123, 1, 'MAAF, FORMAT YANG ANDA MINTA TIDAK ADA', '2021-06-28 17:39:24'),
(68, 125, 1, 'Maaf, Format Yang Anda Masukan Salah. \r\nUntuk Melihat Format Yang Bisa Digunakan Silahkan Ketik Format. \r\nTerimakasih', '2021-06-28 17:40:42'),
(69, 127, 1, 'Maaf, Format Yang Anda Masukan Salah. \r\nUntuk Melihat Format Yang Bisa Digunakan Silahkan Ketik Format. \r\nTerimakasih', '2021-06-28 17:45:13'),
(70, 129, 1, 'Maaf, Format Yang Anda Masukan Salah. \r\nUntuk Melihat Format Yang Bisa Digunakan Silahkan Ketik Format. \r\nTerimakasih', '2021-06-28 17:45:40'),
(71, 131, 1, 'Maaf, Anda Belum Terdaftar Di Sistem, Silahkan Untuk Mendaftar Terlebih Dahulu, dengan Format DAFTAR#NAMA#NOHP#ALAMAT', '2021-06-28 17:46:38'),
(72, 133, 1, 'Maaf, Anda Belum Terdaftar Di Sistem, Silahkan Untuk Mendaftar Terlebih Dahulu, dengan Format DAFTAR#NAMA#NOHP#ALAMAT', '2021-06-28 17:46:48'),
(73, 135, 1, 'Maaf, Anda Belum Terdaftar Di Sistem, Silahkan Untuk Mendaftar Terlebih Dahulu, dengan Format DAFTAR#NAMA#NOHP#ALAMAT', '2021-06-28 17:46:54'),
(74, 137, 1, 'Maaf, Anda Belum Terdaftar Di Sistem, Silahkan Untuk Mendaftar Terlebih Dahulu, dengan Format DAFTAR#NAMA#NOHP#ALAMAT', '2021-06-28 17:48:08'),
(75, 139, 1, 'Maaf, Format Yang Anda Masukan Salah. \r\nUntuk Melihat Format Yang Bisa Digunakan Silahkan Ketik Format. \r\nTerimakasih', '2021-06-28 17:48:31'),
(76, 141, 1, 'Maaf, Anda Belum Terdaftar Di Sistem, Silahkan Untuk Mendaftar Terlebih Dahulu, dengan Format DAFTAR#NAMA#NOHP#ALAMAT', '2021-06-28 17:49:19'),
(77, 143, 1, 'Maaf, Anda Belum Terdaftar Di Sistem, Silahkan Untuk Mendaftar Terlebih Dahulu, dengan Format DAFTAR#NAMA#NOHP#ALAMAT', '2021-06-28 17:50:42'),
(78, 145, 1, 'Maaf, Anda Belum Terdaftar Di Sistem, Silahkan Untuk Mendaftar Terlebih Dahulu, dengan Format DAFTAR#NAMA#NOHP#ALAMAT', '2021-06-28 17:51:05'),
(79, 147, 1, 'Maafsss, Anda Belum Terdaftar Di Sistem, Silahkan Untuk Mendaftar Terlebih Dahulu, dengan Format DAFTAR#NAMA#NOHP#ALAMAT', '2021-06-28 17:51:23'),
(80, 149, 1, 'Maafsss, Anda Belum Terdaftar Di Sistem, Silahkan Untuk Mendaftar Terlebih Dahulu, dengan Format DAFTAR#NAMA#NOHP#ALAMAT', '2021-06-28 17:51:50'),
(81, 151, 1, 'Maafsss, Anda Belum Terdaftar Di Sistem, Silahkan Untuk Mendaftar Terlebih Dahulu, dengan Format DAFTAR#NAMA#NOHP#ALAMAT', '2021-06-28 17:52:39'),
(82, 153, 1, 'Maaf, Format Yang Anda Masukan Salah. \r\nUntuk Melihat Format Yang Bisa Digunakan Silahkan Ketik Format. \r\nTerimakasih', '2021-06-28 17:53:06'),
(83, 155, 1, 'Terimakasih Sudah Memulai. SIlahkan Daftar Terlebih Dahulu Untuk Menggunakan Bot ini. Ketik Daftar Untuk Mendapatakan Format Pendaftaran', '2021-06-28 17:54:03'),
(84, 157, 1, 'Maaf, Anda Belum Terdaftar Di Sistem, Silahkan Untuk Mendaftar Terlebih Dahulu, dengan Format DAFTAR#NAMA#NOHP#ALAMAT', '2021-06-28 17:58:23'),
(85, 159, 1, 'Terimakasih Sudah Memulai. SIlahkan Daftar Terlebih Dahulu Untuk Menggunakan Bot ini. Ketik Daftar Untuk Mendapatakan Format Pendaftaran', '2021-06-28 17:58:58'),
(86, 161, 1, 'Gunakan Format DAFTAR#NAMA#NOHP#ALAMAT Untuk melakukan Pendfataran', '2021-06-28 17:59:36'),
(87, 163, 1, 'Pendaftaran RIO Berhasil. Silahkan Untuk Bertransaksi', '2021-06-28 18:00:22'),
(88, 165, 1, 'Terimakasih Telah Memanggil BOT. Status Bot Saat ini Normal, Aman Kawal Berkah', '2021-06-28 18:02:24'),
(89, 167, 1, 'Maaf, Anda Belum Terdaftar Di Sistem, Silahkan Untuk Mendaftar Terlebih Dahulu, dengan Format DAFTAR#NAMA#NOHP#ALAMAT', '2021-06-29 08:54:45'),
(90, 169, 1, 'Pendaftaran ANDREY Berhasil. Silahkan Untuk Bertransaksi', '2021-06-29 08:55:13'),
(91, 171, 1, 'Gunakan Format UN#NAMA Untuk melakukan Ubah Nama', '2021-06-29 08:55:18'),
(92, 173, 1, 'Gunakan Format UN#NAMA Untuk melakukan Ubah Nama', '2021-06-29 08:55:29'),
(93, 175, 1, 'Nama Berhasil Diubah', '2021-06-29 08:56:11'),
(94, 177, 1, 'Nama Berhasil Diubah', '2021-06-29 08:57:34'),
(95, 179, 1, 'Nama Berhasil Diubah', '2021-06-29 09:00:06'),
(96, 181, 1, 'Nama Berhasil Diubah', '2021-06-29 09:01:16'),
(97, 183, 1, 'Terimakasih Telah Memanggil BOT. Status Bot Saat ini Normal, Aman Kawal Berkah', '2021-07-01 13:31:51'),
(98, 185, 1, 'Terimakasih Sudah Memulai. SIlahkan Daftar Terlebih Dahulu Untuk Menggunakan Bot ini. Ketik Daftar Untuk Mendapatakan Format Pendaftaran', '2021-07-01 13:44:30'),
(99, 187, 1, 'Gunakan Format DAFTAR#NAMA#NOHP#ALAMAT Untuk melakukan Pendfataran', '2021-07-01 13:44:44'),
(100, 189, 1, 'Maaf, Anda Belum Terdaftar Di Sistem, Silahkan Untuk Mendaftar Terlebih Dahulu, dengan Format DAFTAR#NAMA#NOHP#ALAMAT', '2021-07-01 13:44:52'),
(101, 191, 1, 'Haloo Nama Kamu', '2021-07-01 13:48:35'),
(102, 193, 1, 'DATA IDENTITAS KAMU YANG SAAT INI TERDAFTAR<br>HAHAH', '2021-07-01 13:49:36'),
(103, 195, 1, 'DATA IDENTITAS KAMU YANG SAAT INI TERDAFTAR\nHAHAH', '2021-07-01 13:49:59'),
(104, 197, 1, 'DATA IDENTITAS KAMU YANG SAAT INI TERDAFTAR\nNama: Cahya\nNo Hp: 89675677955\nAlamat: CIKUBANGMULYA\nID Telegram: 375107745\nSaldo: 0\nTanggal Daftar: 2021-06-29 08:55:13', '2021-07-01 13:52:57'),
(105, 199, 1, 'DATA IDENTITAS KAMU YANG SAAT INI TERDAFTAR\nNama: RIO\nNo Hp: 81224036675\nAlamat: Desa\nID Telegram: 927478433\nSaldo: 0\nTanggal Daftar: 2021-06-28 18:00:22', '2021-07-01 13:53:51'),
(106, 200, 1, 'Maaf, Anda Belum Terdaftar Di Sistem, Silahkan Untuk Mendaftar Terlebih Dahulu, dengan Format DAFTAR#NAMA#NOHP#ALAMAT', '2021-07-01 13:53:56'),
(107, 203, 1, 'Nama Berhasil Diubah', '2021-07-01 13:55:17'),
(108, 205, 1, 'DATA IDENTITAS KAMU YANG SAAT INI TERDAFTAR\nNama: Prasetio\nNo Hp: 81224036675\nAlamat: Desa\nID Telegram: 927478433\nSaldo: 0\nTanggal Daftar: 2021-06-28 18:00:22', '2021-07-01 13:55:23'),
(109, 207, 1, 'Harga Pulsa Axis\r\nAX5 = 5.850\r\nAX10 = 10.850\r\nAX15 = 15.850', '2021-07-01 13:58:48'),
(110, 209, 1, 'Maaf, Format Yang Anda Masukan Salah. \r\nUntuk Melihat Format Yang Bisa Digunakan Silahkan Ketik Format. \r\nTerimakasih', '2021-07-01 13:58:54'),
(111, 211, 1, 'Maaf, Format Yang Anda Masukan Salah. \r\nUntuk Melihat Format Yang Bisa Digunakan Silahkan Ketik Format. \r\nTerimakasih', '2021-07-01 13:59:07'),
(112, 213, 1, 'Maaf, Format Yang Anda Masukan Salah. \r\nUntuk Melihat Format Yang Bisa Digunakan Silahkan Ketik Format. \r\nTerimakasih', '2021-07-01 14:00:36'),
(113, 215, 1, 'Maaf, Format Yang Anda Masukan Salah. \r\nUntuk Melihat Format Yang Bisa Digunakan Silahkan Ketik Format. \r\nTerimakasih', '2021-07-01 14:01:12'),
(114, 217, 1, 'Maaf, Format Yang Anda Masukan Salah. \r\nUntuk Melihat Format Yang Bisa Digunakan Silahkan Ketik Format. \r\nTerimakasih', '2021-07-01 14:02:03'),
(115, 219, 1, 'Daftar Format\r\n1. profile = Cek Profile\r\n2. CH.AX = Cek Harga Pulsa Axis\r\n3. UN = Ubah Nama (UN#namabaru)\r\n4. Test = Test Status Bot', '2021-07-01 14:02:36'),
(116, 221, 1, 'Maaf, Anda Belum Terdaftar Di Sistem, Silahkan Untuk Mendaftar Terlebih Dahulu, dengan Format DAFTAR#NAMA#NOHP#ALAMAT', '2021-07-01 14:10:18'),
(117, 223, 1, 'Terimakasih Sudah Memulai. SIlahkan Daftar Terlebih Dahulu Untuk Menggunakan Bot ini. Ketik Daftar Untuk Mendapatakan Format Pendaftaran', '2021-07-01 16:09:32'),
(118, 225, 1, 'Gunakan Format DAFTAR#NAMA#NOHP#ALAMAT Untuk melakukan Pendfataran', '2021-07-01 16:09:50'),
(119, 227, 1, 'Pendaftaran DIMAS Berhasil. Silahkan Untuk Bertransaksi', '2021-07-01 16:10:41'),
(120, 229, 1, 'DATA IDENTITAS KAMU YANG SAAT INI TERDAFTAR\nNama: DIMAS\nNo Hp: 87990567608\nAlamat: SELAJAMBE\nID Telegram: 875910896\nSaldo: 0\nTanggal Daftar: 2021-07-01 16:10:41', '2021-07-01 16:12:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` text NOT NULL,
  `password` varchar(120) NOT NULL,
  `saveCookies` varchar(120) NOT NULL,
  `Active` int(1) NOT NULL COMMENT '0 = Tidak Aktif | 1 = Aktif',
  `RoleID` tinyint(2) NOT NULL COMMENT '1 = Admin | 2 = Operator'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `saveCookies`, `Active`, `RoleID`) VALUES
(1, 'Andrey Andriansyah', 'andreyandri90@gmail.com', 'a346bc80408d9b2a5063fd1bddb20e2d5586ec30', 'fe8ff190c44b13b89362d0cd491c1ea8cdbe3051', 1, 1),
(2, 'Mohammad Irwansyah Somantri', 'mirwansyah1933@gmail.com', 'a346bc80408d9b2a5063fd1bddb20e2d5586ec30', '', 1, 1),
(3, 'Nida', 'nida@gmail.com', 'a346bc80408d9b2a5063fd1bddb20e2d5586ec30', '', 1, 2),
(4, 'Dini', 'dini@gmail.com', 'a346bc80408d9b2a5063fd1bddb20e2d5586ec30', '993e05bffe1c98edce5a4277857d94fa0595aa1d', 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `format_request_response`
--
ALTER TABLE `format_request_response`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kotak_masuk`
--
ALTER TABLE `kotak_masuk`
  ADD PRIMARY KEY (`update_id`),
  ADD UNIQUE KEY `message_id` (`message_id`);

--
-- Indeks untuk tabel `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`kode_member`);

--
-- Indeks untuk tabel `response`
--
ALTER TABLE `response`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_id` (`message_id`),
  ADD KEY `id_response` (`response`(768));

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `format_request_response`
--
ALTER TABLE `format_request_response`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `member`
--
ALTER TABLE `member`
  MODIFY `kode_member` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `response`
--
ALTER TABLE `response`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `response`
--
ALTER TABLE `response`
  ADD CONSTRAINT `response_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `kotak_masuk` (`message_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
