-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 07 Ara 2018, 12:43:28
-- Sunucu sürümü: 10.1.36-MariaDB
-- PHP Sürümü: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `otel_yonetim_sistemi`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `alacart_rezervasyon`
--

CREATE TABLE `alacart_rezervasyon` (
  `alacart_rez_id` int(11) NOT NULL,
  `checkin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `alacart_rezervasyon`
--

INSERT INTO `alacart_rezervasyon` (`alacart_rez_id`, `checkin_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `anlaşmalı_firmalar`
--

CREATE TABLE `anlaşmalı_firmalar` (
  `firma_id` int(5) NOT NULL,
  `firma_adı` varchar(11) COLLATE utf8mb4_turkish_ci NOT NULL,
  `telefon` char(10) COLLATE utf8mb4_turkish_ci NOT NULL,
  `bölüm` tinyint(2) NOT NULL,
  `birim` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `anlaşmalı_firmalar`
--

INSERT INTO `anlaşmalı_firmalar` (`firma_id`, `firma_adı`, `telefon`, `bölüm`, `birim`) VALUES
(1, 'MUTLU MANAV', '21200000', 0, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `birimler`
--

CREATE TABLE `birimler` (
  `birim_id` tinyint(2) NOT NULL,
  `birim` varchar(20) COLLATE utf8mb4_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `birimler`
--

INSERT INTO `birimler` (`birim_id`, `birim`) VALUES
(0, 'SICAK'),
(1, 'SOĞUK'),
(2, 'KAHVALTI'),
(3, 'PASTANE'),
(4, 'SNACK BAR'),
(5, 'ALACARTE'),
(6, 'RESTAURANT BAR'),
(7, 'POOL BAR');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bölümler`
--

CREATE TABLE `bölümler` (
  `bölüm_id` tinyint(2) NOT NULL,
  `bölüm` varchar(20) COLLATE utf8mb4_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `bölümler`
--

INSERT INTO `bölümler` (`bölüm_id`, `bölüm`) VALUES
(0, 'MUTFAK'),
(1, 'RESTAURANT'),
(2, 'İNSAN KAYNAKLARI'),
(3, 'SATIN ALMA');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `checkout`
--

CREATE TABLE `checkout` (
  `checkout_id` int(11) NOT NULL,
  `checkin_id` int(11) NOT NULL,
  `ektra_ücretler` smallint(5) UNSIGNED NOT NULL,
  `toplam_ücret` smallint(5) UNSIGNED NOT NULL,
  `c_out_tarih` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `check_in`
--

CREATE TABLE `check_in` (
  `checkin_id` int(11) NOT NULL,
  `müşteri_id` int(11) NOT NULL,
  `giriş_tarih` date NOT NULL,
  `çıkış_tarih` date NOT NULL,
  `oda_no` smallint(5) NOT NULL,
  `müşteri_tipi` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `check_in`
--

INSERT INTO `check_in` (`checkin_id`, `müşteri_id`, `giriş_tarih`, `çıkış_tarih`, `oda_no`, `müşteri_tipi`) VALUES
(1, 3, '2018-12-30', '2019-01-02', 4, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cinsiyet`
--

CREATE TABLE `cinsiyet` (
  `cinsiyet_id` bit(1) NOT NULL,
  `cinsiyeti` char(5) COLLATE utf8mb4_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `cinsiyet`
--

INSERT INTO `cinsiyet` (`cinsiyet_id`, `cinsiyeti`) VALUES
(b'0', 'ERKEK'),
(b'1', 'KADIN');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `depo`
--

CREATE TABLE `depo` (
  `ürün_id` int(11) NOT NULL,
  `alım_id` int(11) NOT NULL,
  `ürün_açıklama` varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL,
  `ürün_miktarı` varchar(20) COLLATE utf8mb4_turkish_ci NOT NULL,
  `bölüm` tinyint(2) NOT NULL,
  `birim` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `depo`
--

INSERT INTO `depo` (`ürün_id`, `alım_id`, `ürün_açıklama`, `ürün_miktarı`, `bölüm`, `birim`) VALUES
(1, 1, 'DOMATES', '10 KASA', 0, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `durumtip`
--

CREATE TABLE `durumtip` (
  `durum_tip` tinyint(2) NOT NULL,
  `Durum` varchar(20) COLLATE utf8mb4_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `durumtip`
--

INSERT INTO `durumtip` (`durum_tip`, `Durum`) VALUES
(0, 'ÇALIŞIYOR'),
(1, 'İŞTEN AYRILDI'),
(2, 'İZİNLİ');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `günler`
--

CREATE TABLE `günler` (
  `gün_id` tinyint(1) NOT NULL,
  `gün` varchar(10) COLLATE utf8mb4_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `günler`
--

INSERT INTO `günler` (`gün_id`, `gün`) VALUES
(0, 'PAZARTESİ'),
(1, 'SALI'),
(2, 'ÇARŞAMBA'),
(3, 'PERŞEMBE'),
(4, 'CUMA'),
(5, 'CUMARTESİ'),
(6, 'PAZAR');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `lojman`
--

CREATE TABLE `lojman` (
  `kayıt_no` int(11) NOT NULL,
  `odano` smallint(3) NOT NULL,
  `personel_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `lojman`
--

INSERT INTO `lojman` (`kayıt_no`, `odano`, `personel_id`) VALUES
(1, 3, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `malzeme_alım_talep`
--

CREATE TABLE `malzeme_alım_talep` (
  `talep_id` int(11) NOT NULL,
  `personel_id` int(11) NOT NULL,
  `talep` text COLLATE utf8mb4_turkish_ci NOT NULL,
  `miktarı` varchar(100) COLLATE utf8mb4_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `malzeme_alım_talep`
--

INSERT INTO `malzeme_alım_talep` (`talep_id`, `personel_id`, `talep`, `miktarı`) VALUES
(1, 3, 'DOMATES', '10 KASA'),
(2, 3, 'KOYUN', '1 KÜÇÜKBAŞ'),
(3, 3, 'BİBER', '10 KASA');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `menüler`
--

CREATE TABLE `menüler` (
  `menü_id` smallint(3) NOT NULL,
  `gün` tinyint(1) NOT NULL,
  `menü_tip` tinyint(1) NOT NULL,
  `öğle_yemeği` text COLLATE utf8mb4_turkish_ci NOT NULL,
  `akşam_yemeği` text COLLATE utf8mb4_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `menüler`
--

INSERT INTO `menüler` (`menü_id`, `gün`, `menü_tip`, `öğle_yemeği`, `akşam_yemeği`) VALUES
(1, 0, 0, 'DOMATES ÇORBA,FIRIN BAGET,	ÇİFTLİK KEBAP,SEBZELİ TAVUK,BULGUR PİLAVI,	TAVUK DÖNER', 'EZOGELİN ÇORBA,	KEMİK SUYU ÇORBA,	BULGUR PİLAVI,KARIŞIK KIZARTMA,TAVUK DÖNER	,BALIK KIZARTMA,SEBZELİ FIRIN KÖFTE'),
(2, 0, 1, 'ET DÖNER,ŞEFİN ÇORBA,MERCİMEK ÇORBA', 'STEAK,ETLİ PATATES,SOSLU SPAGHETTİ');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `menü_tip`
--

CREATE TABLE `menü_tip` (
  `menü_tipi` tinyint(1) NOT NULL,
  `Tip` varchar(20) COLLATE utf8mb4_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `menü_tip`
--

INSERT INTO `menü_tip` (`menü_tipi`, `Tip`) VALUES
(0, 'RESTAURANT'),
(1, 'ALACARTE');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `müşteri`
--

CREATE TABLE `müşteri` (
  `müşteri_id` int(11) NOT NULL,
  `adı` varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL,
  `soyadı` varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL,
  `cinsiyet` bit(1) NOT NULL,
  `adres` varchar(250) COLLATE utf8mb4_turkish_ci NOT NULL,
  `telefon` varchar(20) COLLATE utf8mb4_turkish_ci NOT NULL,
  `e_posta` varchar(20) COLLATE utf8mb4_turkish_ci NOT NULL,
  `uyruk` char(2) COLLATE utf8mb4_turkish_ci NOT NULL,
  `kimlik_id` varchar(20) COLLATE utf8mb4_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `müşteri`
--

INSERT INTO `müşteri` (`müşteri_id`, `adı`, `soyadı`, `cinsiyet`, `adres`, `telefon`, `e_posta`, `uyruk`, `kimlik_id`) VALUES
(3, 'ALPER BAHA', 'GÜRSES', b'0', 'ELAZIĞ', '5423654634', 'BAHA@GMAIL.COM', 'UK', '65321548536');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `müşteritip`
--

CREATE TABLE `müşteritip` (
  `müşteri_tip` tinyint(2) NOT NULL,
  `açıklama` varchar(20) COLLATE utf8mb4_turkish_ci NOT NULL,
  `fiyat` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `müşteritip`
--

INSERT INTO `müşteritip` (`müşteri_tip`, `açıklama`, `fiyat`) VALUES
(1, 'HERŞEY DAHİL', 150),
(2, 'SADECE KONAKLAMA', 0),
(3, 'KAHVALTI DAHİL', 50);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `odadurumu`
--

CREATE TABLE `odadurumu` (
  `durum_id` int(5) NOT NULL,
  `oda_no` smallint(5) NOT NULL,
  `durum_tip` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `odadurumu`
--

INSERT INTO `odadurumu` (`durum_id`, `oda_no`, `durum_tip`) VALUES
(1, 1, 0),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `odalar`
--

CREATE TABLE `odalar` (
  `oda_no` smallint(5) NOT NULL,
  `oda_tipi` tinyint(2) NOT NULL,
  `çift_kişilik_yatak` tinyint(1) NOT NULL,
  `tek_kişilik_yatak` tinyint(1) NOT NULL,
  `çocuk_yatağı` tinyint(1) NOT NULL,
  `fiyat` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `odalar`
--

INSERT INTO `odalar` (`oda_no`, `oda_tipi`, `çift_kişilik_yatak`, `tek_kişilik_yatak`, `çocuk_yatağı`, `fiyat`) VALUES
(1, 1, 1, 0, 0, 250),
(2, 1, 1, 1, 1, 379),
(3, 2, 0, 2, 0, 150),
(4, 3, 1, 0, 0, 2500);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `odatip`
--

CREATE TABLE `odatip` (
  `oda_tipi` tinyint(1) NOT NULL,
  `Açıklama` varchar(20) COLLATE utf8mb4_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `odatip`
--

INSERT INTO `odatip` (`oda_tipi`, `Açıklama`) VALUES
(1, 'DENİZ MANZARALI'),
(2, 'KARA MANZARALI'),
(3, 'KRAL ODASI');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `oda_durum_tip`
--

CREATE TABLE `oda_durum_tip` (
  `durum_tip` tinyint(1) NOT NULL,
  `oda_durumu` varchar(20) COLLATE utf8mb4_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `oda_durum_tip`
--

INSERT INTO `oda_durum_tip` (`durum_tip`, `oda_durumu`) VALUES
(0, 'BOŞ'),
(1, 'DOLU'),
(2, 'KİRLİ'),
(3, 'ARIZALI');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `oda_temizlik_takip`
--

CREATE TABLE `oda_temizlik_takip` (
  `takip_no` int(11) NOT NULL,
  `personel_id` int(11) NOT NULL,
  `oda_no` smallint(5) NOT NULL,
  `temizlenme_zamanı` datetime NOT NULL,
  `notlar` text COLLATE utf8mb4_turkish_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `personel`
--

CREATE TABLE `personel` (
  `personel_id` int(11) NOT NULL,
  `adı` varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL,
  `soyadı` varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL,
  `uyruk_kodu` char(2) COLLATE utf8mb4_turkish_ci NOT NULL,
  `kimlik_id` char(11) COLLATE utf8mb4_turkish_ci NOT NULL,
  `cinsiyet` bit(1) NOT NULL,
  `yaş` tinyint(2) UNSIGNED NOT NULL,
  `telefon` char(10) COLLATE utf8mb4_turkish_ci NOT NULL,
  `adres` varchar(250) COLLATE utf8mb4_turkish_ci NOT NULL,
  `parmak_izi_idi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `personel`
--

INSERT INTO `personel` (`personel_id`, `adı`, `soyadı`, `uyruk_kodu`, `kimlik_id`, `cinsiyet`, `yaş`, `telefon`, `adres`, `parmak_izi_idi`) VALUES
(3, 'MEHMET', 'KARA', 'TR', '65321456987', b'0', 25, '5423657854', 'MUĞLA', 25678945);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `personel_durum`
--

CREATE TABLE `personel_durum` (
  `personel_durum_id` int(11) NOT NULL,
  `personel_id` int(11) NOT NULL,
  `çalışma_tipi` tinyint(2) NOT NULL,
  `işe_başlama_tarihi` date NOT NULL,
  `şuanki_çalışma_durumu` tinyint(1) NOT NULL,
  `işten_ayrılma_tarihi` date DEFAULT NULL,
  `izin_günü` tinyint(1) NOT NULL,
  `bölüm_id` tinyint(2) NOT NULL,
  `birim_id` tinyint(2) DEFAULT NULL,
  `unvan_id` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `personel_durum`
--

INSERT INTO `personel_durum` (`personel_durum_id`, `personel_id`, `çalışma_tipi`, `işe_başlama_tarihi`, `şuanki_çalışma_durumu`, `işten_ayrılma_tarihi`, `izin_günü`, `bölüm_id`, `birim_id`, `unvan_id`) VALUES
(1, 3, 1, '2018-12-04', 0, NULL, 5, 0, 0, 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `personel_takip`
--

CREATE TABLE `personel_takip` (
  `takip_no` int(11) NOT NULL,
  `personel_id` int(11) NOT NULL,
  `giriş_saati` time NOT NULL,
  `çıkış_saati` time NOT NULL,
  `tarih` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `personel_takip`
--

INSERT INTO `personel_takip` (`takip_no`, `personel_id`, `giriş_saati`, `çıkış_saati`, `tarih`) VALUES
(1, 1, '09:06:00', '18:07:00', '2018-12-05'),
(2, 1, '08:40:00', '17:26:00', '2018-12-06');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `salonlar`
--

CREATE TABLE `salonlar` (
  `salon_id` tinyint(2) NOT NULL,
  `salon_tip` tinyint(1) NOT NULL,
  `salon_ismi` varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL,
  `kapasite` smallint(3) NOT NULL,
  `fiyat` smallint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `salonlar`
--

INSERT INTO `salonlar` (`salon_id`, `salon_tip`, `salon_ismi`, `kapasite`, `fiyat`) VALUES
(0, 1, 'ÇIRAĞAN SARAYI', 1000, 30000);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `salon_rezervasyon`
--

CREATE TABLE `salon_rezervasyon` (
  `salon_rez_id` int(11) NOT NULL,
  `salon_id` tinyint(2) NOT NULL,
  `müşteri_id` int(11) NOT NULL,
  `başlangiç_tarihi` date NOT NULL,
  `bitiş_tarihi` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `salon_rezervasyon`
--

INSERT INTO `salon_rezervasyon` (`salon_rez_id`, `salon_id`, `müşteri_id`, `başlangiç_tarihi`, `bitiş_tarihi`) VALUES
(1, 0, 3, '2018-12-28', '2018-12-02');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `salon_tip`
--

CREATE TABLE `salon_tip` (
  `salon_tip_id` tinyint(1) NOT NULL,
  `salon_tipi` varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `salon_tip`
--

INSERT INTO `salon_tip` (`salon_tip_id`, `salon_tipi`) VALUES
(0, 'KONFERANS SALONU'),
(1, 'DÜĞÜN SALONU');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `satın_alma_takip`
--

CREATE TABLE `satın_alma_takip` (
  `alım_id` int(11) NOT NULL,
  `talep_id` int(11) NOT NULL,
  `alış_fiyatı` smallint(5) NOT NULL,
  `alım_tarihi` datetime NOT NULL,
  `firma_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `satın_alma_takip`
--

INSERT INTO `satın_alma_takip` (`alım_id`, `talep_id`, `alış_fiyatı`, `alım_tarihi`, `firma_id`) VALUES
(1, 1, 650, '2018-12-07 00:00:00', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `unvan`
--

CREATE TABLE `unvan` (
  `unvan_id` tinyint(2) NOT NULL,
  `unvan` varchar(20) COLLATE utf8mb4_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `unvan`
--

INSERT INTO `unvan` (`unvan_id`, `unvan`) VALUES
(0, 'EXCUTİVE CHEF'),
(1, 'ŞEF'),
(2, 'KOMİ'),
(3, 'GARSON'),
(4, 'KISIM ŞEFİ'),
(5, 'MUHASEBE MÜDÜRÜ'),
(6, 'BARMEN'),
(7, 'RESEPSİYONİST');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `uyruk`
--

CREATE TABLE `uyruk` (
  `uyruk_kodu` char(2) COLLATE utf8mb4_turkish_ci NOT NULL,
  `Ülke` varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL,
  `Uyruk` varchar(20) COLLATE utf8mb4_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `uyruk`
--

INSERT INTO `uyruk` (`uyruk_kodu`, `Ülke`, `Uyruk`) VALUES
('RU', 'RUSYA', 'RUS'),
('TR', 'TÜRKİYE', 'TÜRK'),
('UK', 'İNGİLTERE', 'İNGİLİZ'),
('US', 'AMERİKA BİRLEŞİK DEVLETLERİ', 'AMERİKALI');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `çalışma_tipleri`
--

CREATE TABLE `çalışma_tipleri` (
  `çalışma_tip_id` tinyint(2) NOT NULL,
  `çalışma_tipi` varchar(20) COLLATE utf8mb4_turkish_ci NOT NULL,
  `mesai_başlama_saati` time NOT NULL,
  `mesai_bitiş_saati` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `çalışma_tipleri`
--

INSERT INTO `çalışma_tipleri` (`çalışma_tip_id`, `çalışma_tipi`, `mesai_başlama_saati`, `mesai_bitiş_saati`) VALUES
(1, 'tam zamanlı', '09:00:00', '18:00:00'),
(2, 'yarı zamanlı', '08:00:00', '12:00:00');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `üye`
--

CREATE TABLE `üye` (
  `üye_id` int(11) NOT NULL,
  `müşteri_id` int(11) NOT NULL,
  `kullanıcı_adı` varchar(20) COLLATE utf8mb4_turkish_ci NOT NULL,
  `şifre` varchar(20) COLLATE utf8mb4_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `üye`
--

INSERT INTO `üye` (`üye_id`, `müşteri_id`, `kullanıcı_adı`, `şifre`) VALUES
(1, 3, 'bahagurses', '3564897');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `alacart_rezervasyon`
--
ALTER TABLE `alacart_rezervasyon`
  ADD PRIMARY KEY (`alacart_rez_id`),
  ADD KEY `checkin_id` (`checkin_id`);

--
-- Tablo için indeksler `anlaşmalı_firmalar`
--
ALTER TABLE `anlaşmalı_firmalar`
  ADD PRIMARY KEY (`firma_id`),
  ADD KEY `birim` (`birim`),
  ADD KEY `bölüm` (`bölüm`);

--
-- Tablo için indeksler `birimler`
--
ALTER TABLE `birimler`
  ADD PRIMARY KEY (`birim_id`);

--
-- Tablo için indeksler `bölümler`
--
ALTER TABLE `bölümler`
  ADD PRIMARY KEY (`bölüm_id`);

--
-- Tablo için indeksler `checkout`
--
ALTER TABLE `checkout`
  ADD PRIMARY KEY (`checkout_id`),
  ADD KEY `checkin_id` (`checkin_id`);

--
-- Tablo için indeksler `check_in`
--
ALTER TABLE `check_in`
  ADD PRIMARY KEY (`checkin_id`),
  ADD KEY `müşteri_id` (`müşteri_id`),
  ADD KEY `müşteri_tipi` (`müşteri_tipi`),
  ADD KEY `oda_no` (`oda_no`);

--
-- Tablo için indeksler `cinsiyet`
--
ALTER TABLE `cinsiyet`
  ADD PRIMARY KEY (`cinsiyet_id`);

--
-- Tablo için indeksler `depo`
--
ALTER TABLE `depo`
  ADD PRIMARY KEY (`ürün_id`),
  ADD KEY `birim` (`birim`),
  ADD KEY `bölüm` (`bölüm`),
  ADD KEY `alım_id` (`alım_id`);

--
-- Tablo için indeksler `durumtip`
--
ALTER TABLE `durumtip`
  ADD PRIMARY KEY (`durum_tip`);

--
-- Tablo için indeksler `günler`
--
ALTER TABLE `günler`
  ADD PRIMARY KEY (`gün_id`);

--
-- Tablo için indeksler `lojman`
--
ALTER TABLE `lojman`
  ADD PRIMARY KEY (`kayıt_no`),
  ADD KEY `personel_id` (`personel_id`);

--
-- Tablo için indeksler `malzeme_alım_talep`
--
ALTER TABLE `malzeme_alım_talep`
  ADD PRIMARY KEY (`talep_id`),
  ADD KEY `personel_id` (`personel_id`);

--
-- Tablo için indeksler `menüler`
--
ALTER TABLE `menüler`
  ADD PRIMARY KEY (`menü_id`),
  ADD KEY `menü_tip` (`menü_tip`),
  ADD KEY `gün` (`gün`);

--
-- Tablo için indeksler `menü_tip`
--
ALTER TABLE `menü_tip`
  ADD PRIMARY KEY (`menü_tipi`);

--
-- Tablo için indeksler `müşteri`
--
ALTER TABLE `müşteri`
  ADD PRIMARY KEY (`müşteri_id`),
  ADD KEY `cinsiyet` (`cinsiyet`),
  ADD KEY `uyruk` (`uyruk`);

--
-- Tablo için indeksler `müşteritip`
--
ALTER TABLE `müşteritip`
  ADD PRIMARY KEY (`müşteri_tip`);

--
-- Tablo için indeksler `odadurumu`
--
ALTER TABLE `odadurumu`
  ADD PRIMARY KEY (`durum_id`),
  ADD KEY `oda_no` (`oda_no`),
  ADD KEY `durum_tip` (`durum_tip`);

--
-- Tablo için indeksler `odalar`
--
ALTER TABLE `odalar`
  ADD PRIMARY KEY (`oda_no`),
  ADD KEY `oda_tipi` (`oda_tipi`);

--
-- Tablo için indeksler `odatip`
--
ALTER TABLE `odatip`
  ADD PRIMARY KEY (`oda_tipi`);

--
-- Tablo için indeksler `oda_durum_tip`
--
ALTER TABLE `oda_durum_tip`
  ADD PRIMARY KEY (`durum_tip`);

--
-- Tablo için indeksler `oda_temizlik_takip`
--
ALTER TABLE `oda_temizlik_takip`
  ADD PRIMARY KEY (`takip_no`),
  ADD KEY `oda_no` (`oda_no`),
  ADD KEY `personel_id` (`personel_id`);

--
-- Tablo için indeksler `personel`
--
ALTER TABLE `personel`
  ADD PRIMARY KEY (`personel_id`),
  ADD KEY `cinsiyet` (`cinsiyet`),
  ADD KEY `uyruk_kodu` (`uyruk_kodu`);

--
-- Tablo için indeksler `personel_durum`
--
ALTER TABLE `personel_durum`
  ADD PRIMARY KEY (`personel_durum_id`),
  ADD KEY `birim_id` (`birim_id`),
  ADD KEY `bölüm_id` (`bölüm_id`),
  ADD KEY `izin_günü` (`izin_günü`),
  ADD KEY `personel_id` (`personel_id`),
  ADD KEY `unvan_id` (`unvan_id`),
  ADD KEY `çalışma_tipi` (`çalışma_tipi`),
  ADD KEY `şuanki_çalışma_durumu` (`şuanki_çalışma_durumu`);

--
-- Tablo için indeksler `personel_takip`
--
ALTER TABLE `personel_takip`
  ADD PRIMARY KEY (`takip_no`),
  ADD KEY `personel_id` (`personel_id`);

--
-- Tablo için indeksler `salonlar`
--
ALTER TABLE `salonlar`
  ADD PRIMARY KEY (`salon_id`),
  ADD KEY `salon_tip` (`salon_tip`);

--
-- Tablo için indeksler `salon_rezervasyon`
--
ALTER TABLE `salon_rezervasyon`
  ADD PRIMARY KEY (`salon_rez_id`),
  ADD KEY `müşteri_id` (`müşteri_id`),
  ADD KEY `salon_id` (`salon_id`);

--
-- Tablo için indeksler `salon_tip`
--
ALTER TABLE `salon_tip`
  ADD PRIMARY KEY (`salon_tip_id`);

--
-- Tablo için indeksler `satın_alma_takip`
--
ALTER TABLE `satın_alma_takip`
  ADD PRIMARY KEY (`alım_id`),
  ADD KEY `talep_id` (`talep_id`),
  ADD KEY `firma_id` (`firma_id`);

--
-- Tablo için indeksler `unvan`
--
ALTER TABLE `unvan`
  ADD PRIMARY KEY (`unvan_id`);

--
-- Tablo için indeksler `uyruk`
--
ALTER TABLE `uyruk`
  ADD PRIMARY KEY (`uyruk_kodu`);

--
-- Tablo için indeksler `çalışma_tipleri`
--
ALTER TABLE `çalışma_tipleri`
  ADD PRIMARY KEY (`çalışma_tip_id`);

--
-- Tablo için indeksler `üye`
--
ALTER TABLE `üye`
  ADD PRIMARY KEY (`üye_id`),
  ADD KEY `üye_ibfk_1` (`müşteri_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `alacart_rezervasyon`
--
ALTER TABLE `alacart_rezervasyon`
  MODIFY `alacart_rez_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `anlaşmalı_firmalar`
--
ALTER TABLE `anlaşmalı_firmalar`
  MODIFY `firma_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `checkout`
--
ALTER TABLE `checkout`
  MODIFY `checkout_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `check_in`
--
ALTER TABLE `check_in`
  MODIFY `checkin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `depo`
--
ALTER TABLE `depo`
  MODIFY `ürün_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `lojman`
--
ALTER TABLE `lojman`
  MODIFY `kayıt_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `malzeme_alım_talep`
--
ALTER TABLE `malzeme_alım_talep`
  MODIFY `talep_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `menüler`
--
ALTER TABLE `menüler`
  MODIFY `menü_id` smallint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `müşteri`
--
ALTER TABLE `müşteri`
  MODIFY `müşteri_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `müşteritip`
--
ALTER TABLE `müşteritip`
  MODIFY `müşteri_tip` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `odadurumu`
--
ALTER TABLE `odadurumu`
  MODIFY `durum_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `odalar`
--
ALTER TABLE `odalar`
  MODIFY `oda_no` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `odatip`
--
ALTER TABLE `odatip`
  MODIFY `oda_tipi` tinyint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `oda_temizlik_takip`
--
ALTER TABLE `oda_temizlik_takip`
  MODIFY `takip_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `personel`
--
ALTER TABLE `personel`
  MODIFY `personel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `personel_durum`
--
ALTER TABLE `personel_durum`
  MODIFY `personel_durum_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `personel_takip`
--
ALTER TABLE `personel_takip`
  MODIFY `takip_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `salon_rezervasyon`
--
ALTER TABLE `salon_rezervasyon`
  MODIFY `salon_rez_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `satın_alma_takip`
--
ALTER TABLE `satın_alma_takip`
  MODIFY `alım_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `üye`
--
ALTER TABLE `üye`
  MODIFY `üye_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `alacart_rezervasyon`
--
ALTER TABLE `alacart_rezervasyon`
  ADD CONSTRAINT `alacart_rezervasyon_ibfk_1` FOREIGN KEY (`checkin_id`) REFERENCES `check_in` (`checkin_id`);

--
-- Tablo kısıtlamaları `anlaşmalı_firmalar`
--
ALTER TABLE `anlaşmalı_firmalar`
  ADD CONSTRAINT `anlaşmalı_firmalar_ibfk_1` FOREIGN KEY (`birim`) REFERENCES `birimler` (`birim_id`),
  ADD CONSTRAINT `anlaşmalı_firmalar_ibfk_2` FOREIGN KEY (`bölüm`) REFERENCES `bölümler` (`bölüm_id`);

--
-- Tablo kısıtlamaları `checkout`
--
ALTER TABLE `checkout`
  ADD CONSTRAINT `checkout_ibfk_1` FOREIGN KEY (`checkin_id`) REFERENCES `check_in` (`checkin_id`);

--
-- Tablo kısıtlamaları `check_in`
--
ALTER TABLE `check_in`
  ADD CONSTRAINT `check_in_ibfk_1` FOREIGN KEY (`müşteri_id`) REFERENCES `müşteri` (`müşteri_id`),
  ADD CONSTRAINT `check_in_ibfk_2` FOREIGN KEY (`müşteri_tipi`) REFERENCES `müşteritip` (`müşteri_tip`),
  ADD CONSTRAINT `check_in_ibfk_3` FOREIGN KEY (`oda_no`) REFERENCES `odalar` (`oda_no`);

--
-- Tablo kısıtlamaları `depo`
--
ALTER TABLE `depo`
  ADD CONSTRAINT `depo_ibfk_1` FOREIGN KEY (`birim`) REFERENCES `birimler` (`birim_id`),
  ADD CONSTRAINT `depo_ibfk_2` FOREIGN KEY (`bölüm`) REFERENCES `bölümler` (`bölüm_id`),
  ADD CONSTRAINT `depo_ibfk_3` FOREIGN KEY (`alım_id`) REFERENCES `satın_alma_takip` (`alım_id`);

--
-- Tablo kısıtlamaları `lojman`
--
ALTER TABLE `lojman`
  ADD CONSTRAINT `lojman_ibfk_1` FOREIGN KEY (`personel_id`) REFERENCES `personel_durum` (`personel_durum_id`);

--
-- Tablo kısıtlamaları `malzeme_alım_talep`
--
ALTER TABLE `malzeme_alım_talep`
  ADD CONSTRAINT `malzeme_alım_talep_ibfk_1` FOREIGN KEY (`personel_id`) REFERENCES `personel` (`personel_id`);

--
-- Tablo kısıtlamaları `menüler`
--
ALTER TABLE `menüler`
  ADD CONSTRAINT `menüler_ibfk_1` FOREIGN KEY (`menü_tip`) REFERENCES `menü_tip` (`menü_tipi`),
  ADD CONSTRAINT `menüler_ibfk_2` FOREIGN KEY (`gün`) REFERENCES `günler` (`gün_id`);

--
-- Tablo kısıtlamaları `müşteri`
--
ALTER TABLE `müşteri`
  ADD CONSTRAINT `müşteri_ibfk_1` FOREIGN KEY (`cinsiyet`) REFERENCES `cinsiyet` (`cinsiyet_id`),
  ADD CONSTRAINT `müşteri_ibfk_2` FOREIGN KEY (`uyruk`) REFERENCES `uyruk` (`uyruk_kodu`);

--
-- Tablo kısıtlamaları `odadurumu`
--
ALTER TABLE `odadurumu`
  ADD CONSTRAINT `odadurumu_ibfk_1` FOREIGN KEY (`oda_no`) REFERENCES `odalar` (`oda_no`),
  ADD CONSTRAINT `odadurumu_ibfk_2` FOREIGN KEY (`durum_tip`) REFERENCES `oda_durum_tip` (`durum_tip`);

--
-- Tablo kısıtlamaları `odalar`
--
ALTER TABLE `odalar`
  ADD CONSTRAINT `odalar_ibfk_1` FOREIGN KEY (`oda_tipi`) REFERENCES `odatip` (`oda_tipi`);

--
-- Tablo kısıtlamaları `oda_temizlik_takip`
--
ALTER TABLE `oda_temizlik_takip`
  ADD CONSTRAINT `oda_temizlik_takip_ibfk_1` FOREIGN KEY (`oda_no`) REFERENCES `odalar` (`oda_no`),
  ADD CONSTRAINT `oda_temizlik_takip_ibfk_2` FOREIGN KEY (`personel_id`) REFERENCES `personel` (`personel_id`);

--
-- Tablo kısıtlamaları `personel`
--
ALTER TABLE `personel`
  ADD CONSTRAINT `personel_ibfk_1` FOREIGN KEY (`cinsiyet`) REFERENCES `cinsiyet` (`cinsiyet_id`),
  ADD CONSTRAINT `personel_ibfk_2` FOREIGN KEY (`uyruk_kodu`) REFERENCES `uyruk` (`uyruk_kodu`);

--
-- Tablo kısıtlamaları `personel_durum`
--
ALTER TABLE `personel_durum`
  ADD CONSTRAINT `personel_durum_ibfk_1` FOREIGN KEY (`birim_id`) REFERENCES `birimler` (`birim_id`),
  ADD CONSTRAINT `personel_durum_ibfk_2` FOREIGN KEY (`bölüm_id`) REFERENCES `bölümler` (`bölüm_id`),
  ADD CONSTRAINT `personel_durum_ibfk_3` FOREIGN KEY (`izin_günü`) REFERENCES `günler` (`gün_id`),
  ADD CONSTRAINT `personel_durum_ibfk_4` FOREIGN KEY (`personel_id`) REFERENCES `personel` (`personel_id`),
  ADD CONSTRAINT `personel_durum_ibfk_5` FOREIGN KEY (`unvan_id`) REFERENCES `unvan` (`unvan_id`),
  ADD CONSTRAINT `personel_durum_ibfk_6` FOREIGN KEY (`çalışma_tipi`) REFERENCES `çalışma_tipleri` (`çalışma_tip_id`),
  ADD CONSTRAINT `personel_durum_ibfk_7` FOREIGN KEY (`şuanki_çalışma_durumu`) REFERENCES `durumtip` (`durum_tip`);

--
-- Tablo kısıtlamaları `personel_takip`
--
ALTER TABLE `personel_takip`
  ADD CONSTRAINT `personel_takip_ibfk_1` FOREIGN KEY (`personel_id`) REFERENCES `personel_durum` (`personel_durum_id`);

--
-- Tablo kısıtlamaları `salonlar`
--
ALTER TABLE `salonlar`
  ADD CONSTRAINT `salonlar_ibfk_1` FOREIGN KEY (`salon_tip`) REFERENCES `salon_tip` (`salon_tip_id`);

--
-- Tablo kısıtlamaları `salon_rezervasyon`
--
ALTER TABLE `salon_rezervasyon`
  ADD CONSTRAINT `salon_rezervasyon_ibfk_1` FOREIGN KEY (`müşteri_id`) REFERENCES `müşteri` (`müşteri_id`),
  ADD CONSTRAINT `salon_rezervasyon_ibfk_2` FOREIGN KEY (`salon_id`) REFERENCES `salonlar` (`salon_id`);

--
-- Tablo kısıtlamaları `satın_alma_takip`
--
ALTER TABLE `satın_alma_takip`
  ADD CONSTRAINT `satın_alma_takip_ibfk_1` FOREIGN KEY (`talep_id`) REFERENCES `malzeme_alım_talep` (`talep_id`),
  ADD CONSTRAINT `satın_alma_takip_ibfk_2` FOREIGN KEY (`firma_id`) REFERENCES `anlaşmalı_firmalar` (`firma_id`);

--
-- Tablo kısıtlamaları `üye`
--
ALTER TABLE `üye`
  ADD CONSTRAINT `üye_ibfk_1` FOREIGN KEY (`müşteri_id`) REFERENCES `müşteri` (`müşteri_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
