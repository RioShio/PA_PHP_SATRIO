-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql213.infinityfree.com
-- Generation Time: Feb 09, 2026 at 10:08 AM
-- Server version: 11.4.10-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `if0_41036111_db_dabelyuland`
--

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `whatsapp_number` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `role` enum('agent','admin') DEFAULT 'agent'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`id`, `name`, `whatsapp_number`, `email`, `password`, `photo`, `role`) VALUES
(1, 'Budi Properti', '08123456789', NULL, NULL, 'https://i.pravatar.cc/150?u=budi', 'agent'),
(2, 'Siti Agent', '08987654321', NULL, NULL, 'https://i.pravatar.cc/150?u=siti', 'agent'),
(3, 'Andi Land', '08112233445', NULL, NULL, 'https://i.pravatar.cc/150?u=andi', 'agent'),
(5, 'fadli', '081201010101', 'fadli@gmail.com', '$2y$10$lure1JeBZe4ynhBHRSKqzup/yl4xCpGvtRfMRAqspr5Vl3Z85pkXW', NULL, 'admin'),
(6, 'satrio', '0000000000', 'satrio@gmail.com', '$2y$10$lure1JeBZe4ynhBHRSKqzup/yl4xCpGvtRfMRAqspr5Vl3Z85pkXW', NULL, 'agent'),
(7, 'Alana', '191010105555', 'alana@gmail.com', '$2y$10$XAqKi01aZJwvlw1MalLAQeBf8HJUkuOcxcceUgaKLVzWGuT9rxH8O', NULL, 'agent'),
(8, 'agent', NULL, 'agent@gmail.com', '$2y$10$/FBdXQ2bJF0puJarSv4y/uoFa7GilR.UjUuxcshmpP5AB/DAr1ptu', NULL, 'agent'),
(9, 'ucup gaming', NULL, 'ucupg@gmail.com', '$2y$10$eo0pkCMF2Oh/Nle34WmUGuAdQ.3s4bIIK1/kAzMyTjFWeM4ji3816', NULL, 'agent');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(3, 'Kantor'),
(4, 'Gudang'),
(5, 'Rumah'),
(6, 'Ruko'),
(7, 'Apartemen'),
(8, 'Tanah');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `property_id` int(11) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `address_detail` text DEFAULT NULL,
  `latitude` text DEFAULT NULL,
  `longitude` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `property_id`, `city`, `district`, `address_detail`, `latitude`, `longitude`) VALUES
(42, 127, 'Kota Batu', 'Giripurno', 'Giripurno', '-6.2', '106.816666'),
(43, 128, 'Jombang', 'Mojowarno', 'Sidokerto- Mojowarno - Jombang - Jatim', '-6.2', '106.816666'),
(44, 129, 'Surabaya', 'Benowo ', 'pergudangan Maspion Romokalisari ', '-6.2', '106.816666'),
(45, 136, 'Kab. Sidoarjo', 'Waru', 'Pondok Tjandra Indah, Tambak Sumur', '-6.2', '106.816666'),
(46, 137, 'Balongbendo', 'Balongbendo', 'Balongbendo', '-6.2', '106.816666'),
(47, 138, 'Sidoarjo', 'Waru', 'Perumahan Griyo Mapan Sentosa, tambak sawah,Waru, Sidoarjo', '-6.2', '106.816666'),
(48, 147, 'Jombang', 'Jakarta', 'Singapura', '-6.1878311431347015', '106.80961579084399');

-- --------------------------------------------------------

--
-- Table structure for table `pengaduan`
--

CREATE TABLE `pengaduan` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `judul` varchar(100) DEFAULT NULL,
  `isi` text DEFAULT NULL,
  `status` enum('pending','proses','selesai') DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT 1,
  `bedrooms` int(11) DEFAULT NULL,
  `bathrooms` int(11) DEFAULT NULL,
  `land_area` int(11) DEFAULT NULL,
  `building_area` int(11) DEFAULT NULL,
  `certificate_type` enum('SHM','HGB','Lainnya') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `category_id`, `agent_id`, `title`, `description`, `price`, `is_available`, `bedrooms`, `bathrooms`, `land_area`, `building_area`, `certificate_type`, `created_at`, `status`) VALUES
(126, NULL, 6, 'Draft Properti', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-02-02 01:05:03', 'draft'),
(127, 7, 6, '700 juta udah dapat kos=kosan investasikan dana mu disini', '         Kos dijual (milik pribadi)\r\n\r\nLokasi giripurno \r\n\r\nLuas tanah 108 m2\r\n\r\nSurat SHM \r\n\r\nKamar ada 8 \r\n\r\nKamar mandi 4\r\n\r\nRuang tamu 1\r\n\r\nParkir mobil dan motor\r\n\r\nDapur 1\r\n\r\nBuka harga 700 juta nego sampai jadi setelah cek  ', '700000000.00', 1, 8, 4, NULL, 108, NULL, '2026-02-02 01:10:20', 'published'),
(128, 5, 6, 'BARU GRESS, SIAP HUNI LOKASI STRATEGIS', '          Jual  Murah Rumah  Masih Gress Siap Huni D Sidokerto- Mojowarno - Jombang - Jatim \r\n\r\n  ( 8  X 24 M )\r\n\r\n \r\n\r\nSHM \r\n\r\nLuas tanah :  192 M \r\n\r\nFull bangunan \r\n\r\nKmr TDR :  3 \r\n\r\nKmr mndi : 1 \r\n\r\nHadap  : Utara \r\n\r\nParkir cukup 2 unit mobil & motor \r\n\r\n \r\n\r\nListrik : 1300 Watt\r\n\r\nAkses jln mobil \r\n\r\n \r\n\r\nDekat jalan raya jarak \r\n\r\n \r\n\r\nHARGA : 400 JUTA ( NEGO )', '400.00', 1, 3, 1, NULL, 192, NULL, '2026-02-02 01:16:05', 'published'),
(129, 4, 6, 'DIJUAL RUMAH AREA PERGUDANGAN SUPER LUAS', '          Luas tanah 3829\r\n\r\nLebar depan 112\r\n\r\nLebar jalan 11\r\n\r\nLuas bangunan 2185', '45.00', 1, 2, 1, NULL, 2185, NULL, '2026-02-02 01:19:39', 'published'),
(130, NULL, 6, 'Draft Properti', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-02-02 01:22:36', 'draft'),
(131, NULL, 6, 'Draft Properti', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-02-02 01:23:07', 'draft'),
(132, NULL, 6, 'Draft Properti', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-02-02 01:23:13', 'draft'),
(133, NULL, 6, 'Draft Properti', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-02-02 01:23:17', 'draft'),
(134, NULL, 6, 'Draft Properti', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-02-02 01:23:22', 'draft'),
(135, NULL, 6, 'Draft Properti', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-02-02 01:23:25', 'draft'),
(136, 5, 6, 'Dijual Rumah Baru di Pondok Tjandra Indah, Kab. Sidoarjo', '          Rumah 2 Lantai Baru Gress di PONDOK TJANDRA INDAH ( Cluster Lama )\r\n\r\nLuas Tanah : 73,5 mÂ² ( 7x10,5 )\r\n\r\nLuas Bangunan : 100 mÂ²\r\n\r\nTingkat : 2 Lantai\r\n\r\nKamar Tidur : 3\r\n\r\nKamar Mandi : 2\r\n\r\nLegalitas : SHM\r\n\r\nHadap : Utara\r\n\r\nListrik : 2200 watt\r\n\r\nCarport : 1 mobil\r\n\r\nRow Jalan : 2 mobil\r\n\r\nHarga : 1,2 M nego', '1200000000.00', 1, 3, 2, NULL, 100, NULL, '2026-02-02 01:29:21', 'published'),
(137, 5, 6, 'Kos 12 kamar + 12 kmr mnd dalam. ISTIMEWA', '          JUAL KOS AKTIF\r\n\r\nKos 12 kamar + 12 kmr mnd dalam. ISTIMEWA\r\n\r\n2 lt full deck bangunan KOKOH\r\n\r\n8 x 15 masih petok D bs terima SHM \r\n\r\natap pakai genting Karang pilang\r\n\r\nFULL FASILITAS, Springbed, token split\r\n\r\nharga 800 nego\r\n\r\nLokasi Balongbendo', '800000000.00', 1, 12, 12, NULL, 120, NULL, '2026-02-02 01:32:16', 'published'),
(138, 5, 6, 'Perumahan Griyo Mapan Sentosa, tambak sawah,Waru, Sidoarjo', '          RUMAH DI JUAL CEPAT\r\n\r\nSesuai kondisi adanya \r\n\r\n \r\n\r\nðŸ“Alamat: Perumahan Griyo Mapan Sentosa, tambak sawah,Waru, Sidoarjo \r\n\r\n \r\n\r\n*ðŸ SPISIFIKASIðŸ *\r\n\r\nRumah 1 Lantai\r\n\r\nâ­•Luas tanah: 105M (7x15)\r\n\r\nâ­•Luas bangunan: 95 m\r\n\r\nâ­•Kamar tidur: 2\r\n\r\nâ­•Kamar mandi: 1\r\n\r\nâ­•Listrik:1300 watt\r\n\r\n \r\n\r\n \r\n\r\nâœðŸ»*AKSES POINT*\r\n\r\nðŸ“Dekat dengan Bandara Juanda\r\n\r\nðŸ“Dekat dengan toll Juanda\r\n\r\nðŸ“Dekat dengan rumah sakit\r\n\r\nðŸ“Dekat sarana pendidikan\r\n\r\nðŸ“Dekat Pusat Perbelanjaan\r\n\r\nðŸ“Dekat dengan sarana  ibadah \r\n\r\nðŸ“Dekat Wisata kuliner & Pertokoan\r\n \r\n\r\nNoted:\r\n\r\nAkses Jalan Aman sudah tinggi\r\n\r\ndan daerah saat ini tidak rawan banjir\r\n\r\n \r\n\r\nSertifikat :SHM\r\n\r\nHarga 480 Juta (Nego)', '480000000.00', 1, 2, 1, NULL, 95, NULL, '2026-02-02 01:35:37', 'published'),
(139, NULL, 6, 'Draft Properti', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-02-02 01:38:37', 'draft'),
(140, NULL, 6, 'Draft Properti', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-02-02 02:00:26', 'draft'),
(141, NULL, 6, 'Draft Properti', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-02-02 02:00:36', 'draft'),
(142, NULL, 6, 'Draft Properti', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-02-02 02:00:43', 'draft'),
(143, NULL, 6, 'Draft Properti', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-02-02 02:29:29', 'draft'),
(144, NULL, 6, 'Draft Properti', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-02-02 02:30:11', 'draft'),
(145, NULL, 6, 'Draft Properti', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-02-02 02:31:26', 'draft'),
(146, NULL, 6, 'Draft Properti', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-02-02 02:31:35', 'draft'),
(147, 5, 6, 'Uji coba judul', '          Deskripsi', '100000000.00', 1, 2, 1, NULL, 100, NULL, '2026-02-02 03:58:03', 'published'),
(148, NULL, 6, 'Draft Properti', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-02-02 04:07:09', 'draft'),
(149, NULL, 9, 'Draft Properti', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-02-02 07:05:48', 'draft'),
(150, NULL, 9, 'Draft Properti', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-02-02 07:06:11', 'draft'),
(151, NULL, 9, 'Draft Properti', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-02-02 07:09:12', 'draft'),
(152, NULL, 9, 'Draft Properti', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-02-02 12:54:29', 'draft'),
(153, NULL, 9, 'Draft Properti', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-02-02 12:54:49', 'draft'),
(154, NULL, 9, 'Draft Properti', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-02-02 12:55:03', 'draft'),
(155, NULL, 6, 'Draft Properti', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-02-04 06:53:21', 'draft'),
(156, NULL, 6, 'Draft Properti', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-02-04 07:09:28', 'draft');

-- --------------------------------------------------------

--
-- Table structure for table `property_facilities`
--

CREATE TABLE `property_facilities` (
  `id` int(11) NOT NULL,
  `property_id` int(11) DEFAULT NULL,
  `icon_name` varchar(50) DEFAULT NULL,
  `facility_label` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `property_facilities`
--

INSERT INTO `property_facilities` (`id`, `property_id`, `icon_name`, `facility_label`) VALUES
(96, 127, '', 'Luas tanah 108 m2'),
(97, 127, '', 'Surat SHM '),
(98, 127, '', 'Kamar ada 8 '),
(99, 127, '', 'Kamar mandi 4'),
(100, 127, '', 'Ruang tamu 1'),
(101, 127, '', 'Parkir mobil dan motor'),
(102, 127, '', 'Dapur 1'),
(103, 128, '', 'SHM '),
(104, 128, '', 'Full bangunan '),
(105, 128, '', 'Hadap  : Utara '),
(106, 128, '', 'Parkir cukup 2 unit mobil & motor '),
(107, 128, '', 'Listrik : 1300 Watt'),
(108, 128, '', 'Akses jln mobil '),
(109, 128, '', 'Dekat jalan raya jarak '),
(110, 137, '', 'FULL FASILITAS'),
(111, 138, '', 'Fasilitas  di Perumahan'),
(112, 138, '', 'Taman Bermain'),
(113, 138, '', 'Kids Playground'),
(114, 138, '', 'Masjid'),
(115, 138, '', 'gereja'),
(116, 138, '', 'Indomaret/alfamart'),
(117, 147, '', 'AC');

-- --------------------------------------------------------

--
-- Table structure for table `property_images`
--

CREATE TABLE `property_images` (
  `id` int(11) NOT NULL,
  `property_id` int(11) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `is_primary` tinyint(1) DEFAULT 0,
  `urutan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `property_images`
--

INSERT INTO `property_images` (`id`, `property_id`, `image_url`, `is_primary`, `urutan`) VALUES
(114, 127, 'public/uploads/prop_697ffa6bac65b9.31653506.jpeg', 1, 1),
(115, 127, 'public/uploads/prop_697ffa702d9013.57693916.jpeg', 0, 2),
(116, 127, 'public/uploads/prop_697ffa734c2e43.46477051.jpeg', 0, 3),
(117, 127, 'public/uploads/prop_697ffa74b1d716.72651847.jpeg', 0, 4),
(118, 127, 'public/uploads/prop_697ffa79b283c2.28340027.jpeg', 0, 5),
(119, 127, 'public/uploads/prop_697ffa7d44ab91.09309835.jpeg', 0, 6),
(120, 127, 'public/uploads/prop_697ffa810b0a53.74447798.jpeg', 0, 7),
(121, 127, 'public/uploads/prop_697ffa832e2738.76964824.jpeg', 0, 8),
(122, 127, 'public/uploads/prop_697ffa8830bcc0.53804593.jpeg', 0, 9),
(123, 127, 'public/uploads/prop_697ffa8a16fd24.47323841.jpeg', 0, 10),
(124, 127, 'public/uploads/prop_697ffa8d753792.13086908.jpeg', 0, 11),
(125, 128, 'public/uploads/prop_697ffb70ece0f9.38718849.jpeg', 1, 1),
(126, 128, 'public/uploads/prop_697ffb718d45b0.68732607.jpeg', 0, 3),
(127, 128, 'public/uploads/prop_697ffb72465a48.07053435.jpeg', 0, 2),
(128, 128, 'public/uploads/prop_697ffb7360ca43.99922344.jpeg', 0, 4),
(129, 128, 'public/uploads/prop_697ffb78684916.60456375.jpeg', 0, 5),
(130, 128, 'public/uploads/prop_697ffb7f777f76.69849477.jpeg', 0, 6),
(131, 128, 'public/uploads/prop_697ffb82498958.54009026.jpeg', 0, 7),
(132, 128, 'public/uploads/prop_697ffb84549124.91533421.jpeg', 0, 8),
(133, 128, 'public/uploads/prop_697ffb86ca7b36.44362523.jpeg', 0, 9),
(134, 128, 'public/uploads/prop_697ffb8baac334.41872484.jpeg', 0, 10),
(135, 128, 'public/uploads/prop_697ffb8cb74363.02566315.jpeg', 0, 11),
(136, 129, 'public/uploads/prop_697ffbf8174707.03000098.jpeg', 1, 1),
(137, 129, 'public/uploads/prop_697ffbfa907515.72411332.jpeg', 0, 2),
(138, 129, 'public/uploads/prop_697ffbfc789d34.58977911.jpeg', 0, 3),
(139, 129, 'public/uploads/prop_697ffbfe1417e8.70399099.jpeg', 0, 4),
(140, 129, 'public/uploads/prop_697ffc003ae161.70824246.jpeg', 0, 5),
(141, 129, 'public/uploads/prop_697ffc02099012.93712257.jpeg', 0, 6),
(142, 129, 'public/uploads/prop_697ffc09d66555.65930474.jpeg', 0, 8),
(143, 129, 'public/uploads/prop_697ffc0a22a8b5.25575198.jpeg', 0, 7),
(144, 129, 'public/uploads/prop_697ffc0db162b8.05696045.jpeg', 0, 9),
(145, 129, 'public/uploads/prop_697ffc159199a3.92258080.jpeg', 0, 11),
(146, 129, 'public/uploads/prop_697ffc16b1aa56.62673007.jpeg', 0, 10),
(147, 129, 'public/uploads/prop_697ffc199a24d3.41911826.jpeg', 0, 12),
(148, 129, 'public/uploads/prop_697ffc1aeec8e1.03756732.jpeg', 0, 13),
(149, 129, 'public/uploads/prop_697ffc1e474444.84978586.jpeg', 0, 14),
(150, 129, 'public/uploads/prop_697ffc23ea9cd6.82957583.jpeg', 0, 15),
(151, 129, 'public/uploads/prop_697ffc273c9e46.84166025.jpeg', 0, 16),
(152, 129, 'public/uploads/prop_697ffc2997de62.99702184.jpeg', 0, 17),
(153, 129, 'public/uploads/prop_697ffc2d9b9666.26517184.jpeg', 0, 18),
(154, 129, 'public/uploads/prop_697ffc34de2c57.50992565.jpeg', 0, 19),
(155, 129, 'public/uploads/prop_697ffc4041a621.44706776.jpeg', 1, 1),
(156, 136, 'public/uploads/prop_697ffe5ba8a275.19118673.jpg', 1, 1),
(157, 136, 'public/uploads/prop_697ffe5e726ad4.88097010.jpg', 0, 2),
(158, 136, 'public/uploads/prop_697ffe60264032.61686129.jpg', 0, 3),
(159, 136, 'public/uploads/prop_697ffe61bb6340.27935878.jpg', 0, 4),
(160, 136, 'public/uploads/prop_697ffe6388e6b2.50196128.jpg', 0, 5),
(161, 136, 'public/uploads/prop_697ffe655fe5b5.90746358.jpg', 0, 6),
(162, 136, 'public/uploads/prop_697ffe6750e007.20896838.jpg', 0, 7),
(163, 136, 'public/uploads/prop_697ffe6c3f8266.12002110.jpg', 0, 8),
(164, 136, 'public/uploads/prop_697ffe6f46ffc9.04963049.jpg', 0, 9),
(165, 136, 'public/uploads/prop_697ffe74458d70.06995761.jpg', 0, 10),
(166, 136, 'public/uploads/prop_697ffe7535a806.85511654.jpg', 0, 11),
(167, 136, 'public/uploads/prop_697ffe7671e3f5.48486625.jpg', 0, 12),
(168, 136, 'public/uploads/prop_697ffe794a0683.77097909.jpg', 0, 13),
(169, 136, 'public/uploads/prop_697ffe7b7b88e4.89525404.jpg', 0, 14),
(170, 137, 'public/uploads/prop_697fff3a4fc503.84834601.jpeg', 0, 2),
(171, 137, 'public/uploads/prop_697fff3b82c5c6.12539480.jpeg', 0, 3),
(172, 137, 'public/uploads/prop_697fff3ba128e9.79146962.jpeg', 1, 1),
(173, 137, 'public/uploads/prop_697fff3cb01871.91648974.jpeg', 0, 4),
(174, 137, 'public/uploads/prop_697fff3f72df67.96116877.jpeg', 0, 5),
(175, 137, 'public/uploads/prop_697fff42cee455.25343912.jpeg', 0, 6),
(176, 137, 'public/uploads/prop_697fff446ee497.82656620.jpeg', 0, 7),
(177, 137, 'public/uploads/prop_697fff4521aad3.63390944.jpeg', 0, 8),
(178, 137, 'public/uploads/prop_697fff47312ed9.42447136.jpeg', 0, 9),
(179, 137, 'public/uploads/prop_697fff4a699000.75933498.jpeg', 0, 10),
(180, 137, 'public/uploads/prop_697fff4b6bfac2.00109300.jpeg', 0, 11),
(181, 138, 'public/uploads/prop_697ffff5583e62.65049412.jpeg', 1, 1),
(182, 138, 'public/uploads/prop_697ffff6197c49.08897432.jpeg', 0, 2),
(183, 138, 'public/uploads/prop_697ffff6caf2f8.98659225.jpeg', 0, 3),
(184, 138, 'public/uploads/prop_697ffff8996060.85639259.jpeg', 0, 4),
(185, 138, 'public/uploads/prop_697ffffd1d39f1.49249408.jpeg', 0, 5),
(186, 138, 'public/uploads/prop_697fffff27ece9.31174984.jpeg', 0, 6),
(187, 138, 'public/uploads/prop_69800002552229.32005212.jpeg', 0, 7),
(188, 147, 'public/uploads/prop_698021d2b8fdf7.57383605.jpeg', 0, 2),
(189, 147, 'public/uploads/prop_69802217300c29.02226741.jpeg', 1, 1),
(190, 147, 'public/uploads/prop_698022235dc2a6.43886889.jpeg', 0, 3),
(191, 147, 'public/uploads/prop_6980222abb5535.97230446.jpeg', 0, 4),
(192, 147, 'public/uploads/prop_69802233664669.20687317.jpeg', 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','siswa') DEFAULT 'siswa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
(1, 'admin', '$2y$10$5p8E6v7K1P3S6K.9.2D.Re7jJ2H4lF6f7E9I.D.M.Y.N.Z.O.P.Q.R', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `property_id` (`property_id`);

--
-- Indexes for table `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `agent_id` (`agent_id`);

--
-- Indexes for table `property_facilities`
--
ALTER TABLE `property_facilities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `property_id` (`property_id`);

--
-- Indexes for table `property_images`
--
ALTER TABLE `property_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `property_id` (`property_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agents`
--
ALTER TABLE `agents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `pengaduan`
--
ALTER TABLE `pengaduan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `property_facilities`
--
ALTER TABLE `property_facilities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `property_images`
--
ALTER TABLE `property_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD CONSTRAINT `pengaduan_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `properties`
--
ALTER TABLE `properties`
  ADD CONSTRAINT `properties_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `properties_ibfk_2` FOREIGN KEY (`agent_id`) REFERENCES `agents` (`id`);

--
-- Constraints for table `property_facilities`
--
ALTER TABLE `property_facilities`
  ADD CONSTRAINT `property_facilities_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `property_images`
--
ALTER TABLE `property_images`
  ADD CONSTRAINT `property_images_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
