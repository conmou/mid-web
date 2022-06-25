-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2022-05-19 12:25:57
-- 伺服器版本： 10.4.21-MariaDB
-- PHP 版本： 7.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫: `laptop`
--
CREATE DATABASE IF NOT EXISTS `laptop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `laptop`;

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `all_platform`
-- (請參考以下實際畫面)
--
DROP VIEW IF EXISTS `all_platform`;
CREATE TABLE `all_platform` (
`nb_id` varchar(50)
,`yahoo_price` int(10)
,`yahoo_url` varchar(100)
,`sinya_price` varchar(9)
,`sinya_url` varchar(50)
,`sinya_stu_price` varchar(9)
,`pchome_url` varchar(100)
,`pchome_price` varchar(10)
);

-- --------------------------------------------------------

--
-- 資料表結構 `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `arti_Id` varchar(10) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `post_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表新增資料前，先清除舊資料 `article`
--

TRUNCATE TABLE `article`;
-- --------------------------------------------------------

--
-- 資料表結構 `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `com_Id` varchar(10) NOT NULL,
  `arti_Id` varchar(10) NOT NULL,
  `m_Id` varchar(10) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `comment_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表新增資料前，先清除舊資料 `comment`
--

TRUNCATE TABLE `comment`;
-- --------------------------------------------------------

--
-- 資料表結構 `favorite`
--

DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite` (
  `m_Id` varchar(10) NOT NULL,
  `fav_id` int(11) NOT NULL,
  `nb_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 資料表新增資料前，先清除舊資料 `favorite`
--

TRUNCATE TABLE `favorite`;
--
-- 傾印資料表的資料 `favorite`
--

INSERT INTO `favorite` (`m_Id`, `fav_id`, `nb_id`) VALUES
('ejiscutela', 18, '15-5510-R3708STW'),
('ejiscutela', 27, 'dynabook CS50L-JW PYS45T-001001'),
('ejiscutela', 31, 'dynabook CS50L-JB PYS45T-003001'),
('ejiscutela', 32, '15-3511-D1828STW');

-- --------------------------------------------------------

--
-- 資料表結構 `forum`
--

DROP TABLE IF EXISTS `forum`;
CREATE TABLE `forum` (
  `forum_type` varchar(10) NOT NULL,
  `arti_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表新增資料前，先清除舊資料 `forum`
--

TRUNCATE TABLE `forum`;
-- --------------------------------------------------------

--
-- 資料表結構 `member`
--

DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `m_Id` varchar(10) NOT NULL,
  `m_pwd` varchar(100) NOT NULL,
  `m_name` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `img_name` varchar(50) NOT NULL,
  `token` varchar(65) NOT NULL,
  `status` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 資料表新增資料前，先清除舊資料 `member`
--

TRUNCATE TABLE `member`;
--
-- 傾印資料表的資料 `member`
--

INSERT INTO `member` (`m_Id`, `m_pwd`, `m_name`, `email`, `img_name`, `token`, `status`) VALUES
('conmou0225', 'ae2f6bc5f2daa25ff58fd9bb331dce37086c4dee2a764d5b7bd9721a72bcf5ba', '', 'rock12365477@gmail.com', '', 'fbdec3706cd8af5d436fd48fd50afa14d0823cf56b7775d0c49a4dc90d561ebd', '1'),
('ejiscutela', '7c665676298b7dd162f3d1db7f1e8df912851a2259b5389495fbce450cba12da', 'EJ', 'k0970133227@gmail.com', '1652945605.png', '370fff205d3f0a2c5a86128cef0bca54c4f0881fe1cf106a6bdaff7273f6f022', '1'),
('plum9241', '74bd25a56fa755333dea51d58dd797f14a44fc19ab145d09ea776977c185c27a', '', 'mayble0411@gmail.com', '', '0531f7d0730b932d6723281e4c31a27e2183e49f700019897fb8d3b7c0205733', '1');

-- --------------------------------------------------------

--
-- 資料表結構 `pchome`
--

DROP TABLE IF EXISTS `pchome`;
CREATE TABLE `pchome` (
  `nb_id` varchar(50) NOT NULL,
  `pchome_url` varchar(100) NOT NULL,
  `pchome_price` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 資料表新增資料前，先清除舊資料 `pchome`
--

TRUNCATE TABLE `pchome`;
--
-- 傾印資料表的資料 `pchome`
--

INSERT INTO `pchome` (`nb_id`, `pchome_url`, `pchome_price`) VALUES
('ACER SF114-34-C3XJ (N5100/4G/256GB PCIe SSD/W10/FH', 'https://24h.pchome.com.tw/prod/DHAEDU-1900BDFPZ?fq=/S/DHAEE7', '13900'),
('ACER SF514-55TA-773B 綠(i7-1165G7/16G/512G PCIe/W11', 'https://24h.pchome.com.tw/prod/DHAEDE-1900C3NF2?fq=/S/DHAEE7', '34900'),
('ACER SF514-55GT-7030 綠(i7-1165G7/16G/MX350-2G/512G', 'https://24h.pchome.com.tw/prod/DHAEDE-1900C3NI6?fq=/S/DHAEE7', '34900'),
('ACER SF114-34-C7WH (N5100/4G/256GB PCIe SSD/W10/FH', 'https://24h.pchome.com.tw/prod/DHAEDU-1900BZZYU?fq=/S/DHAEE7', '12900'),
('ACER SF114-34-C0JD 金(N5100/4G/256GB PCIe SSD/W10/F', 'https://24h.pchome.com.tw/prod/DHAEDU-1900BZZZW?fq=/S/DHAEE7', '12900'),
('ACER Aspire5 A514-54-57ZX 黑(i5-1135G7/8G/512G PCIe', 'https://24h.pchome.com.tw/prod/DHAEH0-1900DVH4K?fq=/S/DHAEE7', '20900'),
('ACER A514-54G-513S 黑(i5-1135G7/8G/MX350-2G/512G PC', 'https://24h.pchome.com.tw/prod/DHAEGO-1900B0D0X?fq=/S/DHAEE8', '21900'),
('ACER A315-57G-54CL 藍(i5-1035G1/4G/MX330-2G/1T+256G', 'https://24h.pchome.com.tw/prod/DHAECU-1900AXNFP?fq=/S/DHAEE8', '19900'),
('ACER Predator PH315-54-72VQ 黑(i7-11800H/16G/RTX307', 'https://24h.pchome.com.tw/prod/DHAEGA-1900BTGI1?fq=/S/DHAEE8', '48900'),
('ConceptD CN715-71-71LC(i7-9750H/8GB+8GB/RTX2060-6G', 'https://24h.pchome.com.tw/prod/DHAEF7-A900A9L13?fq=/S/DHAEE8', '78000'),
('ACER SF316-51-577U 灰(i5-11300H/16G/512G PCIe/W10/F', 'https://24h.pchome.com.tw/prod/DHAEBP-1900C7XIU?fq=/S/DHAEE8', '25900'),
('ACER Nitro5 AN515-57-72Y9 黑(i7-11800H/16G/RTX3060-', 'https://24h.pchome.com.tw/prod/DHAEGB-1900BZAQT?fq=/S/DHAEE8', '39900'),
('ACER Nitro5 AN515-57-791E 黑(i7-11800H/8G/RTX3050-4', 'https://24h.pchome.com.tw/prod/DHAEGB-1900BZARU?fq=/S/DHAEE8', '34900'),
('ASUS ROG Zephyrus G14 GA401QM-0032E5900HS 日蝕灰(R9-5', 'https://24h.pchome.com.tw/prod/DHAS4N-A900B7V2B?q=/S/DHAFC6', '50900'),
('ROG Zephyrus G15 GA503QS-0072E5900HS(R9-5900HS/16G', 'https://24h.pchome.com.tw/prod/DHAS6K-A900BYZWQ', '59999'),
('ASUS ROG Zephyrus G14 GA401QM-0032E5900HS 日蝕灰(R9-5', 'https://24h.pchome.com.tw/prod/DHAS4N-A900B7V2B', '53900'),
('ASUS Vivobook 13 Slate OLED T3300KA-0112KN6000 (N6', 'https://24h.pchome.com.tw/prod/DHAFND-A900C3OFR?q=/S/DHAFBV', '18990'),
('ROG Zephyrus Flow X13 GV301QE-0022A5900HS(AMD R9-5', 'https://24h.pchome.com.tw/prod/DHAS6K-A900BINMQ?q=/S/DHAFC8', '47900'),
('ASUS VivoBook Pro 15 OLED M3500QC-0112B5600H (R5-5', 'https://24h.pchome.com.tw/prod/DHAFN4-A900BT634?q=/S/DHAFN6', '33900'),
('ASUS Zenbook 14X OLED UX5400EG-0108P1135G7 星河紫(i5-', 'https://24h.pchome.com.tw/prod/DHAXAU-A900CTQ6D?q=/S/DHAFC4', '42900'),
('ASUS X415EA-0131G1135G7 星空灰(i5-1135G7/8G/512G PCIe', 'https://24h.pchome.com.tw/prod/DHAFM6-A900BK40B', '22900'),
('ASUS ZenBook Pro 15 UX535LI-0323G10300H(i5-10300H/', 'https://24h.pchome.com.tw/prod/DHAXAR-A900C1X5P', '37988'),
('ASUS ZenBook 14 UX425EA-0702P1135G7 星河紫(i5-1135G7/', 'https://24h.pchome.com.tw/prod/DHAXA3-A900CTP69', '32900'),
('ASUS FX507ZE-0041B12700H 御鐵灰(i7-12700H/8Gx2/RTX305', 'https://24h.pchome.com.tw/prod/DHAS1U-A900DZNYJ', '39900'),
('ASUS ZenBook 14X UX5401EA-0142G1135G7 (i5-1135G7/1', 'https://24h.pchome.com.tw/prod/DHAXAW-A900DSO6B?q=/S/DHAFLB', '35900'),
('ASUS B7402FEA-0071A1155G7 黑 (i5-1155G7/16G/512G PC', 'https://24h.pchome.com.tw/prod/DHAFKD-A900C8TNZ?q=/S/DHAFKD', '39990'),
('ASUS TUF Gaming F17 FX707ZM-0021B12700H (i7-12700H', 'https://24h.pchome.com.tw/prod/DHAS1U-A900DVWX8', '45900'),
('ROG Zephyrus G15 GA503QS-0072E5900HS(R9-5900HS/16G', 'https://24h.pchome.com.tw/prod/DHAS6K-A900BYZWQ?q=/S/DHAFNV', '56900'),
('ASUS ZenBook 14 UX425EA-0702P1135G7 星河紫(i5-1135G7/', 'https://24h.pchome.com.tw/prod/DHAXA3-A900CTP69?q=/S/DHAFC4', '32900'),
('ASUS FX516PE-0031A11370H 御鐵灰(i7-11370H/8G/RTX3050T', 'https://24h.pchome.com.tw/prod/DHAS1U-A900BBUTG?q=/S/DHAFNV', '34500'),
('ASUS VivoBook Flip TP470EA-0112K1135G7 黑(i5-1135G7', 'https://24h.pchome.com.tw/prod/DHAFLY-1900ECT39?q=/S/DHAFLY', '23900'),
('ASUS FX506HM-0042A11800H 幻影灰(i7-11800H/8G/RTX 3060', 'https://24h.pchome.com.tw/prod/DHAS1U-A900BC5V1?q=/S/DHAFNV', '41900'),
('ASUS Zenbook 14X OLED UX5400EG-0098G1165G7(i7-1165', 'https://24h.pchome.com.tw/prod/DHAXAT-A900C877T?q=/S/DHAFG4', '48900'),
('ASUS ZenBook 14 UX435EAL-0062G1135G7 綠松灰(i5-1135G7', 'https://24h.pchome.com.tw/prod/DHAXAJ-A900BS8W2', '39900'),
('ASUS FX516PC-0021A11300H 御鐵灰(i5-11300H/8G/RTX3050-', 'https://24h.pchome.com.tw/prod/DHAS1U-A900BOEN9', '30900'),
('ASUS ZenBook Pro 15 UX535LI-0323G10300H(i5-10300H/', 'https://24h.pchome.com.tw/prod/DHAXAR-A900C1X5P?q=/S/DHAFG4', '35888'),
('ASUS B9450FA-3441A10210U 黑 (i5-10210U/16G/256G PCI', 'https://24h.pchome.com.tw/prod/DHAFKD-A900BUC34?q=/S/DHAFKD', '27990'),
('ASUS ROG Zephyrus G14 GA401QM-0022D5900HS 月光白(R9-5', 'https://24h.pchome.com.tw/prod/DHAS4N-A900B7V29?q=/S/DHAFC6', '50900'),
('ASUS E410MA-0551WN4020 夢幻白(Celeron N4020/4G/64G/Wi', 'https://24h.pchome.com.tw/prod/DHAFI0-A900BJ9AU?q=/S/DHAFI0', '9488'),
('ASUS ROG Zephyrus G15 GA503QC-0042E5900HS 灰(R9-590', 'https://24h.pchome.com.tw/prod/DHAS6K-A900BXD5Q', '39900'),
('ASUS ZenBook UM535QE-0163G5900HX 綠松灰 (R9-5900HX/16', 'https://24h.pchome.com.tw/prod/DHAXAQ-A900DYY7M', '44900'),
('ASUS ROG Zephyrus G14 AW SE GA401QEC-0022G5900HS(R', 'https://24h.pchome.com.tw/prod/DHAS6K-A900BN2GD?q=/S/DHAFEU', '46900'),
('ASUS ZenBook 14 UM425QA-0062G5900HX 綠松灰 (R9-5900HX', 'https://24h.pchome.com.tw/prod/DHAXAQ-A900BSXTR?q=/S/DHAFO1', '35900'),
('ASUS ZenBook Duo 14 UX482EG-0111A1165G7 蒼宇藍(i7-116', 'https://24h.pchome.com.tw/prod/DHAXAK-A900BTDZ1', '62900'),
('HP Elitebook 845 G8(R7-5850U/16G/1TB SSD/AMD Radeo', 'https://24h.pchome.com.tw/prod/DHAG7I-A900COMW6?q=/S/DHAG7I', '43900'),
('HP Victus 16-e0771AX (R7-5800H/16G/RTX3060-6G/512G', 'https://24h.pchome.com.tw/prod/DHAJ5V-1900DXOFJ?q=/S/DHAGBX', '38900'),
('HP Pavilion Aero 13-be0155AU (R7-5800U/16GB/512GB ', 'https://24h.pchome.com.tw/prod/DHAG7Z-A900EN7S0?q=/S/DHAGDI', '33900'),
('HP Pavilion 14-dv1003TX(i5-1155 G7/8G/MX450-2G/512', 'https://24h.pchome.com.tw/prod/DHAG4N-A900C3C53?q=/S/DHAGC2', '29900'),
('HP OMEN 16-C0668AX(R7-5800H/16G/RTX3070 8G/1TB/W10', 'https://24h.pchome.com.tw/prod/DHAJ67-A900DX267?q=/S/DHAGBX', '47900'),
('HP Pavilion Aero 13-be0818AU (R5-5600U/8GB/256GB P', 'https://24h.pchome.com.tw/prod/DHAG7Z-1900CUBDH?q=/S/DHAG7Z', '25900'),
('HP OMEN 16-C0665AX(R9-5900HX/32G/RTX3070 8G/1TB/W1', 'https://24h.pchome.com.tw/prod/DHAJ67-A900D0GP7?q=/S/DHAGBX', '57900'),
('HP 15.6吋效能筆電(R3-5300U/8GB/256GB PCIe SSD/W10/FHD/1', 'https://24h.pchome.com.tw/prod/DHAG4S-1900BMKIC', '22900'),
('(商) HP 240 G8(Celero N4020/4G/256GB SSD/Win10/14)', 'https://24h.pchome.com.tw/prod/DHAG7N-A900BRVPL', '15900'),
('HP 15s-fq2007TU 星幻粉(i7-1165 G7/16GB/1TB PCIe/W10/F', 'https://24h.pchome.com.tw/prod/DHAG4S-A900B5LE7', '33900'),
('HP 15s-eq2001AU 星幻粉(R3-5300U/8GB/256GB PCIe SSD/W1', 'https://24h.pchome.com.tw/prod/DHAG4S-A900BLVF2', '22900'),
('HP Spectre x360 Conv14-ea0052TU (i7-1165 G7/16GB/1', 'https://24h.pchome.com.tw/prod/DHAG6P-A900BHUT6', '57900'),
('HP Spectre x360 Conv14-ea0051TU (i7-1165 G7/16GB/1', 'https://24h.pchome.com.tw/prod/DHAG6P-A900BIOKS', '62900'),
('HP Victus 16-e0771AX (R7-5800H/16G/RTX3060-6G/512G', 'https://24h.pchome.com.tw/prod/DHAGA4-A900BL7OQ', '41900'),
('HP 14s-dq4005TU 極地白(i5-1155 G7/8GB/512GB PCIe SSD/', 'https://24h.pchome.com.tw/prod/DHAG4T-1900ECQVN?q=/S/DHAG4T', '20900'),
('HP Victus 16-d0662TX 公爵黑(i7-11800H/8G/RTX3050-4G/5', 'https://24h.pchome.com.tw/prod/DHAJ5V-A900BQOE6?q=/S/DHAG57', '34900'),
('(商) HP ProBook 455 G8(AMD-R7 5800U/16G/AMD Radeon™', 'https://24h.pchome.com.tw/prod/DHAG7L-A900CTGKJ?q=/S/DHAG7L', '33900'),
('HP Pavilion 15-eh1007AU(R5-5500U/8G/512G PCIe SSD/', 'https://24h.pchome.com.tw/prod/DHAG4M-1900C1HGC?q=/S/DHAGCM', '27900'),
('(商) HP Probook 470 G8(i7-1165G7/8G/MX450-2G/1T+256', 'https://24h.pchome.com.tw/prod/DHAG7M-1900DXJ8B?q=/S/DHAG7M', '30900'),
('(商) HP ProBook 455 G8(AMD-R5 5600U/8G/AMD Radeon™ ', 'https://24h.pchome.com.tw/prod/DHAG8G-A900BCRTR?q=/S/DHAG5Z', '28888'),
('HP 14s-dq4001TU 極地白(i7-1195 G7/16G/1T PCIe SSD/W11', 'https://24h.pchome.com.tw/prod/DHAG4T-A900C8TN9?q=/S/DHAG4T', '33900'),
('HP有線滑鼠 m150', 'https://24h.pchome.com.tw/prod/DCAN9R-A9008JTML?q=/S/DHAGD6', '159'),
('(商) HP 245 G8(R5 5500U/8G/1TB HDD/W10/FHD/14)', 'https://24h.pchome.com.tw/prod/DHAG7N-A900C166B?q=/S/DHAG9R', '23900'),
('HP Pavilion Aero 13-be0818AU (R5-5600U/8GB/256GB P', 'https://24h.pchome.com.tw/prod/DHAG7Z-A900C3C4C?q=/S/DHAGCW', '27900'),
('HP OfficeJet Pro 8020 多功能事務機', 'https://24h.pchome.com.tw/prod/DCAE5N-A900A1G1C?q=/S/DHAGD5', '5990'),
('【福利品】HP ENVY 15-ep0156TX(i7-10870H/32GB/RTX2060-6G', 'https://24h.pchome.com.tw/prod/DHAG5O-A900DSJD4?q=/S/DHAG5O', '56900'),
('HP 15s-eq2003AU 星空銀(R7-5700U/8GB/1TB PCIe SSD/W11/', 'https://24h.pchome.com.tw/prod/DHAG4S-A900BWH42?q=/S/DHAG4S', '29900'),
('(商)HP Pro C640 G2 Chromebook(i3-1115G4/8G/64GB MMC', 'https://24h.pchome.com.tw/prod/DHAG5A-A900BX28D?q=/S/DHAG5A', '23900'),
('(商) HP ProBook 455 G8(AMD-R7 5800U/16G/AMD Radeon™', 'https://24h.pchome.com.tw/prod/DHAG8G-A900B8M15?q=/S/DHAG7L', '36999'),
('Lenovo Gaming 3 82K201GPTW 黑 (RYZEN 5 5600H/8G/GTX', 'https://24h.pchome.com.tw/prod/DHBA3X-1900DYOJI?q=/S/DHBF51', '22990'),
('Lenovo IdeaPad Slim 3 82KT001ETW 灰 (RYZEN 7 5700U/', 'https://24h.pchome.com.tw/prod/DHBF5C-1900BV2WU?q=/S/DHBF09', '17990'),
('Lenovo IdeaPad Slim 3 82KT001DTW 灰 (RYZEN 5 5500U/', 'https://24h.pchome.com.tw/prod/DHBF5C-1900BWZCW?q=/S/DHBF51', '16990'),
('Lenovo ThinkPad E14 Gen3 20Y7006KTW 黑 (RYZEN 7 570', 'https://24h.pchome.com.tw/prod/DHAD6S-1900DX2M2?q=/S/DHBF0F', '21900'),
('Lenovo Yoga 6 13ALC6 82ND009TTW 深淵藍 (RYZEN 5 5500U', 'https://24h.pchome.com.tw/prod/DHBF5X-1900DYPGU?q=/S/DHBF64', '23990'),
('Lenovo IdeaPad Slim 5 Pro 82L500K5TW 灰 (RYZEN 7 58', 'https://24h.pchome.com.tw/prod/DHBF6P-1900E6RG9?q=/S/DHBF6R', '36990'),
('Lenovo Yoga Slim 7 Carbon 82L0002RTW 灰 (RYZEN 7 58', 'https://24h.pchome.com.tw/prod/DHBA3X-1900EO93N?q=/S/DHBF1R', '29990'),
('Lenovo Yoga Slim 7 Carbon 82L0002RTW 灰 (RYZEN 7 58', 'https://24h.pchome.com.tw/prod/DHBF6T-1900DVWUR?q=/S/DHBF6R', '34990'),
('Lenovo Legion 5 82JW005RTW 藍 (RYZEN 7 5800H/16G/RT', 'https://24h.pchome.com.tw/prod/DHBA4A-1900C7PGC?q=/S/DHBF74', '32990'),
('Lenovo Yoga Slim 7i Pro 82NC007GTW 灰(i7-11370H/16G', 'https://24h.pchome.com.tw/prod/DHBF65-A900BYWMJ?q=/S/DHBF65', '31990'),
('Lenovo Legion 7 82N600KQTW 灰 (RYZEN 9 5900HX/32G/R', 'https://24h.pchome.com.tw/prod/DHBA4L-A900CA7FC?q=/S/DHBF2M', '83590'),
('Lenovo Legion Slim 7 82K8004TTW 黑 (RYZEN 7 5800H/3', 'https://24h.pchome.com.tw/prod/DHBA4I-1900C1M8B?q=/S/DHBF74', '39990'),
('Lenovo ThinkPad X1 Carbon Gen9 20XW00AFTW 黑  (i5-1', 'https://24h.pchome.com.tw/prod/DHAD6F-A900E6L7D?q=/S/DHBF1I', '47990'),
('Lenovo ThinkPad X1 Nano Gen 1 20UN0085TW 黑  (i7-11', 'https://24h.pchome.com.tw/prod/DHAD6F-A900E6DN9?q=/S/DHBF2H', '66990'),
('Lenovo ThinkBook 15p  Gen2 21B1001PTW 灰 (i5-11400H', 'https://24h.pchome.com.tw/prod/DHAD6G-A900E6KNH?q=/S/DHBF1R', '34900'),
('Lenovo Yoga Slim 7 Carbon 82L0002ATW 灰(R5-5600U/16', 'https://24h.pchome.com.tw/prod/DHBF6T-A900DZ3FO?q=/S/DHBF0F', '31990'),
('Lenovo Legion 5i 82JK00F1TW 藍 (i5-11400H/16G/RTX30', 'https://24h.pchome.com.tw/prod/DHBF64-A900DX35U?q=/S/DHBF64', '27990'),
('Lenovo Legion 5i 82JK00F1TW 藍 (i5-11400H/16G/RTX30', 'https://24h.pchome.com.tw/prod/DHBA4A-A900ENMJ7?q=/S/DHBF6H', '31990'),
('Lenovo ThinkPad L14 黑(R7P-5850U/8G/512G PCIe/W10P/', 'https://24h.pchome.com.tw/prod/DHAD6H-A900C29RF?q=/S/DHBF0F', '29990'),
('Lenovo 65W USB Type-C AC Adapter (4X20M26282)', 'https://24h.pchome.com.tw/prod/DHBF2G-A90093K0Z?q=/S/DHBF2G', '1090'),
('Lenovo Legion Slim 7 82K800DETW 黑 (RYZEN 7 5800H/3', 'https://24h.pchome.com.tw/prod/DHBA4I-A900E6P74?q=/S/DHBF2K', '47990'),
('Lenovo IdeaPad Slim 3 82KT00RGTW 灰 (RYZEN 5 5500U/', 'https://24h.pchome.com.tw/prod/DHBF4X-A900BXHJG?q=/S/DHBF6Y', '32490'),
('Lenovo IdeaPad Slim 3 82KT00RGTW 灰 (RYZEN 5 5500U/', 'https://24h.pchome.com.tw/prod/DHBF5C-1900DQRCN?q=/S/DHBF6Q', '17990'),
('Lenovo ThinkPad X1 Nano Gen 1 20UNS07300 黑  (i5-11', 'https://24h.pchome.com.tw/prod/DHAD6F-A900E6E2P?q=/S/DHBF5Y', '55900'),
('Lenovo ThinkPad X1 Nano Gen 1 20UNS07200 黑 (i5-113', 'https://24h.pchome.com.tw/prod/DHAD6F-A900E6DWP?q=/S/DHBF5Y', '53990'),
('Lenovo ThinkPad E15 20TDS02E00-3Y 黑(i7-1165G7/8G/5', 'https://24h.pchome.com.tw/prod/DHBF49-A900B6KB0?q=/S/DHBF1J', '32990'),
('Lenovo IdeaPad Slim 3 82KT001DTW 灰 (RYZEN 5 5500U/', 'https://24h.pchome.com.tw/prod/DHBF6P-1900EOQCU?q=/S/DHBF6P', '28990'),
('Lenovo IdeaPad Slim 3 82KT001DTW 灰 (RYZEN 5 5500U/', 'https://24h.pchome.com.tw/prod/DHBF5C-1900BYWHD?q=/S/DHBF5A', '17990'),
('Lenovo Gaming 3 82K201GPTW 黑 (RYZEN 5 5600H/8G/GTX', 'https://24h.pchome.com.tw/prod/DHBA3X-A900CDI5Q?q=/S/DHBF51', '23990'),
('Lenovo IdeaPad Slim 3 82KT00RGTW 灰 (RYZEN 5 5500U/', 'https://24h.pchome.com.tw/prod/DHBF5C-1900DQRMY?q=/S/DHBF08', '16990'),
('Lenovo ThinkPad 65W Slim AC Adapter (USB Type-C)(4', 'https://24h.pchome.com.tw/prod/DHBF2G-A900AK6BL?q=/S/DHBF2G', '1490'),
('Lenovo USB-C 旅行集線器 (4X91A30366)', 'https://24h.pchome.com.tw/prod/DHBF2G-A900BQEYA?q=/S/DHBF2G', '1790'),
('Lenovo ThinkPad E15 Gen2 20TD00D5TW 黑 (i7-1165G7/1', 'https://24h.pchome.com.tw/prod/DHAD6S-1900EOPZE?q=/S/DHBF0G', '28900'),
('Lenovo IdeaPad Slim 3 82KU01EETW 灰 (RYZEN 5 5500U/', 'https://24h.pchome.com.tw/prod/DHBF5D-1900DYPF1?q=/S/DHBF08', '16990'),
('Lenovo USB-C 至 4 埠 USB-A 集線器(GX90X21431)', 'https://24h.pchome.com.tw/prod/DHBF2G-A900BQEZ0?q=/S/DHBF2G', '1090'),
('Lenovo IdeaPad Slim 3 82KT001ETW 灰 (RYZEN 7 5700U/', 'https://24h.pchome.com.tw/prod/DHBF5C-1900BKOG9?q=/S/DHBF3H', '18990'),
('Lenovo ThinkPad T14 黑(i5-1135G7/8G/MX450-2G/512G P', 'https://24h.pchome.com.tw/prod/DHBF46-A900BF7Z4?q=/S/DHBF1I', '41990'),
('Lenovo ThinkPad E14 Gen2 20TA00C7TW 黑 (i7-1165G7/M', 'https://24h.pchome.com.tw/prod/DHAD6S-A900EO5OP?q=/S/DHBF74', '32900'),
('Lenovo IdeaPad Slim 3 82KT00RGTW 灰 (RYZEN 5 5500U/', 'https://24h.pchome.com.tw/prod/DHBF5C-1900EOQ52?q=/S/DHBF51', '16990'),
('Lenovo Yoga Slim 7i Pro 82NH008XTW 灰(i5-11300H/16G', 'https://24h.pchome.com.tw/prod/DHBF65-A900ENM8O?q=/S/DHBF1I', '30990'),
('《商務首款窄邊框》', 'https://24h.pchome.com.twhttps://24h.pchome.com.tw/store/DHAI3D', '35900up'),
('DELL Vostro V14-5410-R3528ATW 灰 (i5-11320H/8G/MX45', 'https://24h.pchome.com.tw/prod/DHAI3D-A900BWLRI', '32990'),
('DELL Vostro V14-5410-R3628ATW 灰 ((i5-11320H/16G/MX', 'https://24h.pchome.com.tw/prod/DHAI3D-A900BWLRP', '35990'),
('DELL Vostro V14-5410-R3728ATW 灰 (i7-11390H/8G/MX45', 'https://24h.pchome.com.tw/prod/DHAI3D-A900BWLSI', '37990'),
('DELL Vostro V14-5410-R3828ATW 灰 (i7-11390H/16G/MX4', 'https://24h.pchome.com.tw/prod/DHAI3D-A900BWLSM', '39990'),
('《輕薄可擴充》', 'https://24h.pchome.com.twhttps://24h.pchome.com.tw/store/DHAI7Y', '25990up'),
('DELL 15-5515-R1508STW11 Platinum Silver (RYZEN 5 5', 'https://24h.pchome.com.tw/prod/DHAI7Y-A900BWWFG', '25990'),
('DELL 15-5515-R1608STW11 Platinum Silver (RYZEN 5 5', 'https://24h.pchome.com.tw/prod/DHAI7Y-A900BWWF2', '27990'),
('DELL 15-5510-R3728STW Platinum Silver (i7-11390H/1', 'https://24h.pchome.com.tw/prod/DHAI7Y-A900BWXBY', '34990'),
('DELL 15-5510-R4728STW Platinum Silver (i7-11390H/1', 'https://24h.pchome.com.tw/prod/DHAI7Y-A900BYBXM', '37990'),
('《三窄邊框》', 'https://24h.pchome.com.twhttps://24h.pchome.com.tw/store/DHAI6R', '27900up'),
('DELL 14-5415-R1508STW11 Platinum Silver (RYZEN 5 5', 'https://24h.pchome.com.tw/prod/DHAI7W-A900BWLZK', '25990'),
('DELL 14-5415-R1608STW11 Platinum Silver (RYZEN 5 5', 'https://24h.pchome.com.tw/prod/DHAI7W-A900BWM09', '27990'),
('DELL 14-5410-R3728STW Platinum Silver (i7-11390H/1', 'https://24h.pchome.com.tw/prod/DHAI7W-A900BWMGF', '34990'),
('DELL 14-5410-R4528PTW Peach Dust (i5-11320H/16G/MX', 'https://24h.pchome.com.tw/prod/DHAI7W-A900BWWCT', '34990'),
('《新機上市》', 'https://24h.pchome.com.twhttps://24h.pchome.com.tw/store/DHAI6O', '47900up'),
('DELL Latitude 7520-I716G512G11 (i7-1185G7/16G/512G', 'https://24h.pchome.com.tw/prod/DHAI6O-A900BVZWK', '51990'),
('DELL Latitude 7420-I716G512G11 (i7-1185G7/16G/512G', 'https://24h.pchome.com.tw/prod/DHAI6O-A900BVZVG', '53990'),
('DELL Latitude 7320-I716G512G11 (i7-1185G7/16G/512G', 'https://24h.pchome.com.tw/prod/DHAI6O-A900BVYBR', '49990'),
('DELL Latitude 9520-I716G512G (i7-1185G7/16G/512G P', 'https://24h.pchome.com.tw/prod/DHAI6O-A900B9C79', '65990'),
('《高性能創作》', 'https://24h.pchome.com.twhttps://24h.pchome.com.tw/store/DHAI7A', '41900up'),
('DELL Inspiron 15 Plus 15-7510-R1648STW11 銀 (i5-114', 'https://24h.pchome.com.tw/prod/DHAI7A-A900BX4EG', '41990'),
('DELL Inspiron 15 Plus 15-7510-R1748STW11 銀 (i7-118', 'https://24h.pchome.com.tw/prod/DHAI7A-A900BX4EK', '45990'),
('DELL Inspiron 15 Plus 15-7510-R1848STW11 銀 (i7-118', 'https://24h.pchome.com.tw/prod/DHAI7A-A900BX4EP', '47990'),
('DELL Inspiron 15 Plus 15-7510-R2848STW11 銀 (i7-118', 'https://24h.pchome.com.tw/prod/DHAI7A-A900BX4EU', '57990'),
('電競G全系列', 'https://24h.pchome.com.twhttps://24h.pchome.com.tw/store/DHAI62', '30900up'),
('DELL G15-5511-R1648NTW 綠 (i5-11400H/16G/RTX3050-4G', 'https://24h.pchome.com.tw/prod/DHAI62-A900BL07Z', '37990'),
('DELL G15-5511-R1648BTW 灰 (i5-11400H/16G/RTX3050-4G', 'https://24h.pchome.com.tw/prod/DHAI62-A900BL07X', '37990'),
('DELL G15-5515-R2768NTW11 綠 (RYZEN 7 5800H/16G/RTX3', 'https://24h.pchome.com.tw/prod/DHAI62-A900BX09H', '45990'),
('DELL G15-5511-R2868SETW11 黑 (i7-11800H/16G/RTX3060', 'https://24h.pchome.com.tw/prod/DHAI62-A900BXGOV', '51990'),
('ASUS ROG Zephyrus G14 GA401QM-0032E5900HS 日蝕灰(R9-5', 'https://24h.pchome.com.tw/prod/DHAS4N-A900B7V2B?q=/S/DHAS6P', '50900'),
('ASUS TUF Gaming F17 FX707ZM-0021B12700H (i7-12700H', 'https://24h.pchome.com.tw/prod/DHAS1U-A900DVWX8?q=/S/DHAS4Q', '45900'),
('ASUS ROG Strix SCAR 15 G533ZM-0022S12900H (i9-1290', 'https://24h.pchome.com.tw/prod/DHAS4K-A900DV9GZ?q=/S/DHAS44', '55900'),
('ROG Zephyrus Flow X13 GV301QE-0022A5900HS(AMD R9-5', 'https://24h.pchome.com.tw/prod/DHAS6K-A900BINMQ?q=/S/DHAS76', '47900'),
('ASUS TUF Gaming F17 FX707ZE-0021B12700H (i7-12700H', 'https://24h.pchome.com.tw/prod/DHAS1U-A900DVWWS?q=/S/DHAS79', '39900'),
('ROG Zephyrus G15 GA503QS-0072E5900HS(R9-5900HS/16G', 'https://24h.pchome.com.tw/prod/DHAS6K-A900BYZWQ?q=/S/DHAS6K', '56900'),
('ASUS FX516PE-0031A11370H 御鐵灰(i7-11370H/8G/RTX3050T', 'https://24h.pchome.com.tw/prod/DHAS1U-A900BBUTG?q=/S/DHAS1U', '34500'),
('ASUS FX506HM-0042A11800H 幻影灰(i7-11800H/8G/RTX 3060', 'https://24h.pchome.com.tw/prod/DHAS1U-A900BC5V1?q=/S/DHAS1U', '41900'),
('ASUS ROG Zephyrus G14 GA401QM-0022D5900HS 月光白(R9-5', 'https://24h.pchome.com.tw/prod/DHAS4N-A900B7V29?q=/S/DHAS6P', '50900'),
('ASUS FX516PM-0231A11300H 御鐵灰(i5-11300H/8G/RTX3060-', 'https://24h.pchome.com.tw/prod/DHAS1U-A900ENMQE?q=/S/DHAS1U', '30999'),
('ASUS ROG Zephyrus G14 AW SE GA401QEC-0022G5900HS(R', 'https://24h.pchome.com.tw/prod/DHAS6K-A900BN2GD?q=/S/DHAS4L', '46900'),
('ASUS ROG Strix G15 G513RC-0042F6800H 潮魂黑(R7-6800H/', 'https://24h.pchome.com.tw/prod/DHAS4M-A900E4H9I?q=/S/DHAS4M', '36900'),
('ROG Zephyrus M16 GU603HE-0032A11800H 無盡黑 (i7-11800', 'https://24h.pchome.com.tw/prod/DHAS6K-A900BVYKW?q=/S/DHAS6K', '44900'),
('ASUS FX507ZE-0041B12700H 御鐵灰(i7-12700H/16GB/RTX305', 'https://24h.pchome.com.tw/prod/DHAS1U-A900ENFWC?q=/S/DHAS4P', '39900'),
('ASUS ROG Strix SCAR G533QM-0031A5900HX(R9-5900HX/1', 'https://24h.pchome.com.tw/prod/DHAS4K-A900BR13I?q=/S/DHAS4K', '51900'),
('ASUS FA707RC-0021B6800H 御鐵灰(AMD R7-6800H/8G/RTX305', 'https://24h.pchome.com.tw/prod/DHAS4J-A900ENMR2?q=/S/DHAS4J', '35900'),
('華碩 ASUS ROG Strix Impact II Wireless 電競滑鼠', 'https://24h.pchome.com.tw/prod/DCANCA-A900AVXH4?q=/S/DHAS5O', '1990'),
('華碩 ROG Gladius II Origin 電競滑鼠', 'https://24h.pchome.com.tw/prod/DCANCA-A9008Q1Z6?q=/S/DHAS5O', '1290'),
('華碩 ROG Spatha X 無線電競滑鼠', 'https://24h.pchome.com.tw/prod/DCANCA-A900BDTJE?q=/S/DHAS5O', '5490'),
('ASUS FA506IC-0122B4800H 戰魂黑(AMD R7-4800H/8G/RTX305', 'https://24h.pchome.com.tw/prod/DHAS4J-A900ENMQ4?q=/S/DHAS4J', '29900'),
('ASUS TUF F15 FX506HCB-0102A11600H 幻影灰(i7-11600H/8G', 'https://24h.pchome.com.tw/prod/DHAS1U-A900C1MB6?q=/S/DHAS1U', '33500'),
('華碩 ASUS ROG-SCABBARD-II 電競滑鼠墊', 'https://24h.pchome.com.tw/prod/DCANCA-A900AVXAF?q=/S/DHAS5O', '990'),
('華碩 ASUS ROG Strix Carry 電競滑鼠', 'https://24h.pchome.com.tw/prod/DCANCA-A900A62U8?q=/S/DHAS5O', '1490'),
('ASUS FX506HCB-0052A11800H 幻影灰(i7-11800H/8G/RTX3050', 'https://24h.pchome.com.tw/prod/DHAS1U-A900C8PD8?q=/S/DHAS1U', '34900'),
('華碩 ROG TUF GAMING M4 AIR 電競滑鼠', 'https://24h.pchome.com.tw/prod/DCANCA-A900DSYJE?q=/S/DHAS5O', '990'),
('華碩 ASUS ROG STRIX IMPACT II RGB電競滑鼠', 'https://24h.pchome.com.tw/prod/DCANCA-A900AFZSE?q=/S/DHAS5O', '990'),
('華碩 ROG TUF GAMING M4 無線藍牙雙模電競滑鼠', 'https://24h.pchome.com.tw/prod/DCANCA-A900DSYQC?q=/S/DHAS5O', '1690'),
('華碩 ASUS ROG Keris Wireless 輕量化無線三模電競滑鼠', 'https://24h.pchome.com.tw/prod/DCANCA-A900B3X4J?q=/S/DHAS5O', '2490'),
('ROG SLASH Sling Bag BC3000 經典單肩包', 'https://24h.pchome.com.tw/prod/DHAS6O-A900BQOY4?q=/S/DHAS73', '2690'),
('華碩 ASUS ROG STRIX IMPACT II RGB電競滑鼠 (月光白)', 'https://24h.pchome.com.tw/prod/DCANCA-A900BRMQS?q=/S/DHAS5O', '990'),
('瘋電競\n全館指定▼送電競豪禮', 'https://24h.pchome.com.twhttps://24h.pchome.com.tw/store/DHAK5R', '42900up'),
('MSI微星 GS66 11UG-246TW(i7-11800H/32G/RTX3070-8G/2T ', 'https://24h.pchome.com.tw/prod/DHAK5R-A900BRAFL', '73900'),
('MSI微星 GS66 11UH-077TW(i9-11900H/64G/RTX3080-16G/2T', 'https://24h.pchome.com.tw/prod/DHAK5R-A900BMPVL', '104900'),
('MSI微星 GS76 Stealth 11UE-621TW(i7-11800H/16G/RTX306', 'https://24h.pchome.com.tw/prod/DHAK5R-A900C2J0I', '60900'),
('MSI微星 Stealth GS66 12UGS-017TW(i7-12700H/32G/RTX30', 'https://24h.pchome.com.tw/prod/DHAK5R-A900CDKAW', '85900'),
('超狂特色\n▼效能無限▼', 'https://24h.pchome.com.twhttps://24h.pchome.com.tw/store/DHAK5S', '60900up'),
('MSI微星 GE66 10UE-243TW 銀灰(i7-10870H/16G/RTX3060-6G/', 'https://24h.pchome.com.tw/prod/DHAK5S-A900B51YG', '49900'),
('MSI微星 GE66 11UG-241TW 銀灰(i7-11800H/16G/RTX3070-8G/', 'https://24h.pchome.com.tw/prod/DHAK5S-A900BRBG5', '69900'),
('MSI微星 GP76 11UG-827TW 黑(i7-11800H/16G/RTX3070-8G/1', 'https://24h.pchome.com.tw/prod/DHAK5T-A900BWHI2', '59900'),
('MSI微星 GP66 11UH-401TW 黑(i7-11800H/16G/RTX3080-8G/1', 'https://24h.pchome.com.tw/prod/DHAK5T-1900BJTTI', '63900'),
('效能電競\n▼無懈可擊 ▼', 'https://24h.pchome.com.twhttps://24h.pchome.com.tw/store/DHAK8I', '31900up'),
('MSI微星 Sword 15 A12UC-014TW(i7-12700H/8GB/RTX3050-4', 'https://24h.pchome.com.tw/prod/DHAK8I-A900CE00H', '39900'),
('MSI微星 Katana GF76 11UC-485TW(i5-11400H/8G/RTX3050-', 'https://24h.pchome.com.tw/prod/DHAK8I-1900C1WOO', '31500'),
('MSI微星 GF63 11SC-066TW 黑(i7-11800H/8G/GTX1650-4G/51', 'https://24h.pchome.com.tw/prod/DHAK8I-A900C19KM', '29900'),
('MSI微星 Sword 17 A11UC-043TW(i7-11800H/8GB/RTX3050-4', 'https://24h.pchome.com.tw/prod/DHAK8I-A900BC5QV', '35900'),
('RGB鍵盤\n▼絢麗戰鬥電競 ▼', 'https://24h.pchome.com.twhttps://24h.pchome.com.tw/store/DHAK83', '30900up'),
('MSI微星 Alpha 15 B5EEK-023TW黑(R7-5800H/16G/RX6600M-8', 'https://24h.pchome.com.tw/prod/DHAK83-A900BLEZH', '39900'),
('MSI微星 Delta 15 A5EFK-012TW灰(R9-5900HX/16G/RX6700M-', 'https://24h.pchome.com.tw/prod/DHAK83-A900BR5Y2', '52900'),
('MSI微星 Alpha 15 A4DEK-030TW黑(R7-4800H/8G/RX5600M-6G', 'https://24h.pchome.com.tw/prod/DHAK83-A900BP3YS', '36900'),
('MSI微星 Alpha 17 A4DEK-031TW黑(R7-4800H/16G/RX5600M-6', 'https://24h.pchome.com.tw/prod/DHAK83-A900B6ZEX', '39900'),
('MSI微星 Sword 15 A12UC-014TW(i7-12700H/8GB/RTX3050-4', 'https://24h.pchome.com.tw/prod/DHAK8I-A900CE00H?q=/S/DHAK2A', '37900'),
('MSI微星 Modern 15 A5M-092TW 灰(R7-5700U/8G/512G SSD/W', 'https://24h.pchome.com.tw/prod/DHAK89-A900C00Y8?q=/S/DHAK9R', '22900'),
('MSI微星 Pulse GL76 12UEK-220TW(i7-12700H/16G/RTX3060', 'https://24h.pchome.com.tw/prod/DHAK5U-A900DSMUU?q=/S/DHAK5U', '51900'),
('MSI微星 Modern 14 B5M-067TW 灰(R5-5500U/8G/256G SSD/W', 'https://24h.pchome.com.tw/prod/DHAK89-A900C0147?q=/S/DHAK89', '19900'),
('MSI微星 Crosshair 15 R6E B12UGZ-017TW(i7-12700H/32G/', 'https://24h.pchome.com.tw/prod/DHAK5U-A900ENSG4?q=/S/DHAK80', '60900'),
('MSI微星 Vector GP76 12UH-040TW(i7-12700H/32G/RTX3080', 'https://24h.pchome.com.tw/prod/DHAK5T-A900CDZOC?q=/S/DHAK5T', '77990'),
('MSI微星 Summit E13FlipEvo A11MT-241TW 白(i7-1185G7/16', 'https://24h.pchome.com.tw/prod/DHAK8R-A900BW57B?q=/S/DHAK5F', '38900'),
('MSI微星 Modern 14 B10MW-666TW(i7-10510U/8G/512G SSD/', 'https://24h.pchome.com.tw/prod/DHAK89-A900DXIAR?q=/S/DHAK9J', '23900'),
('MSI微星 Stealth GS66 12UGS-017TW(i7-12700H/32G/RTX30', 'https://24h.pchome.com.tw/prod/DHAK5R-A900CDKAW?q=/S/DHAK80', '83900'),
('MSI微星 GP76 11UG-827TW 黑(i7-11800H/16G/RTX3070-8G/1', 'https://24h.pchome.com.tw/prod/DHAK5T-A900BWHI2?q=/S/DHAK5T', '57900'),
('技嘉 AERO 15 OLED KD 創作者筆電 (i7-11800H/16G/RTX3060/51', 'https://24h.pchome.com.tw/prod/DHAV5V-A900BXQKG?q=/S/DHAV97', '45900'),
('技嘉 AORUS 15P KD 電競筆電 (i7-11800H/16G/RTX3060/512G S', 'https://24h.pchome.com.tw/prod/DHAV5T-A900BXFRG?q=/S/DHAV5T', '39999'),
('技嘉 AORUS 15P YD 電競筆電 (i7-11800H/16G/RTX3080/1TB SS', 'https://24h.pchome.com.tw/prod/DHAV5T-A900BOH06?q=/S/DHAV5T', '52900'),
('技嘉 A5 K1 電競筆電 (R7-5800H/16G/RTX 3060/1TB SSD/Win11', 'https://24h.pchome.com.tw/prod/DHAV90-A900E9KD7?q=/S/DHAV90', '36999'),
('技嘉 AERO 16 XE5 創作者筆電(i7-12700H/RTX3070Ti 8G/OLED 4', 'https://24h.pchome.com.tw/prod/DHAV5V-A900E6X9H?q=/S/DHAV5V', '83900'),
('技嘉 A5 X1 電競筆電 (R9 5900HX/16G/RTX 3070/512G SSD/Win', 'https://24h.pchome.com.tw/prod/DHAV90-A900E9E7X?q=/S/DHAV90', '46999'),
('技嘉 AORUS 17 XE4 電競筆電(i7-12700H/RTX3070Ti/360Hz/16G', 'https://24h.pchome.com.tw/prod/DHAV5V-A900DYOSM?q=/S/DHAV6A', '59900'),
('技嘉 A5 K1 電競筆電 (R7-5800H/RTX3060 6G/240Hz/16G/1TB S', 'https://24h.pchome.com.tw/prod/DHAV90-A900E6IKA?q=/S/DHAV90', '36999'),
('技嘉 GIGABYTE U4 UD筆電 (i5-1155G7/16G/512G SSD/Win 11', 'https://24h.pchome.com.tw/prod/DHAV9C-A900DVX8Y?q=/S/DHAV9C', '19999'),
('技嘉 AORUS 17 XE4 電競筆電(i7-12700H/RTX3070Ti/360Hz/16G', 'https://24h.pchome.com.tw/prod/DHAV5T-A900ENEV8?q=/S/DHAV9H', '59900'),
('技嘉 G7 GD 電競筆電 (i5-11400H/16G/RTX3050/512G SSD/Win1', 'https://24h.pchome.com.tw/prod/DHAV90-A900DX2IZ?q=/S/DHAV90', '29900'),
('技嘉 G5 GD 電競筆電 (i5-11400H/16G/RTX3050/512G SSD/Win1', 'https://24h.pchome.com.tw/prod/DHAV90-A900DX2K2?q=/S/DHAV90', '28900'),
('技嘉 AORUS 15P XD 電競筆電 (i7-11800H/16G/RTX3070/1TB SS', 'https://24h.pchome.com.tw/prod/DHAV5T-A900C27I9?q=/S/DHAV5T', '47900'),
('技嘉 G5 GD 電競筆電 (i5-11400H/16G/RTX3050/512G SSD/Win1', 'https://24h.pchome.com.tw/prod/DHAV90-A900DYYJ2?q=/S/DHAV90', '28900'),
('技嘉 AORUS 15P YD 電競筆電 (i7-11800H/16G/RTX3080/1TB SS', 'https://24h.pchome.com.tw/prod/DHAV5T-A900BYLQ8?q=/S/DHAV5T', '52900'),
('技嘉 AORUS 15P XD 電競筆電 (i7-11800H/16G/RTX3070/1TB SS', 'https://24h.pchome.com.tw/prod/DHAV5T-1900C2VEW?q=/S/DHAV5T', '47900'),
('技嘉 G5 GD 電競筆電 (i5-11400H/16G/RTX3050/512G SSD/Win1', 'https://24h.pchome.com.tw/prod/DHAV90-A900DX90M?q=/S/DHAV90', '28900'),
('技嘉 AORUS 15P YD 電競筆電 (i7-11800H/32G/RTX3080/1TB SS', 'https://24h.pchome.com.tw/prod/DHAV5T-A900BOGYI?q=/S/DHAV5T', '71900'),
('技嘉 AORUS 15P YD 電競筆電 (i7-11800H/16G/RTX3080/1TB SS', 'https://24h.pchome.com.tw/prod/DHAV5T-A900BRBCR?q=/S/DHAV5T', '52900'),
('技嘉 AORUS 15P XD 電競筆電 (i7-11800H/16G/RTX 3070/1TB S', 'https://24h.pchome.com.tw/prod/DHAV5T-A900C219X?q=/S/DHAV6A', '47900'),
('技嘉 G7 GD 電競筆電 (i5-11400H/16G/RTX3050/512G SSD/Win1', 'https://24h.pchome.com.tw/prod/DHAV90-A900DX90R?q=/S/DHAV90', '29900'),
('技嘉 AORUS 15P XD 電競筆電 (i7-11800H/16G/RTX 3070/1TB S', 'https://24h.pchome.com.tw/prod/DHAV5T-A900C2AWH?q=/S/DHAV5T', '47900'),
('技嘉 AORUS 15P XD 電競筆電 (i7-11800H/16G/RTX3070/1TB SS', 'https://24h.pchome.com.tw/prod/DHAV5T-A900DYUGL?q=/S/DHAV5T', '47900'),
('技嘉 AORUS 15P XD 電競筆電 (i7-11800H/16G/RTX3070/1TB SS', 'https://24h.pchome.com.tw/prod/DHAV5T-A900DYYJE?q=/S/DHAV6A', '47900'),
('技嘉 AORUS 15P YD 電競筆電 (i7-11800H/32G/RTX3080/1TB SS', 'https://24h.pchome.com.tw/prod/DHAV5T-A900BRAK1?q=/S/DHAV5T', '60900'),
('技嘉 AORUS 15P YD 電競筆電 (i7-11800H/16G/RTX3080/1TB SS', 'https://24h.pchome.com.tw/prod/DHAV5T-A900DYPSN?q=/S/DHAV5T', '52900'),
('Aorus 15G (i7-10875H/8Gx2/RTX2070/512G PCIe/W10/FH', 'https://24h.pchome.com.tw/prod/DHAV8S-A900B0SMW?q=/S/DHAV5T', '39990'),
('【福利品】Aorus 15G (i7-10875H/8Gx2/RTX2070/512G PCIe/W', 'https://24h.pchome.com.tw/prod/DHAV8S-A900AY6T7?q=/S/DHAV5T', '39888'),
('技嘉 AERO 16 XE5 創作者筆電(i7-12700H/RTX3070Ti 8G/OLED 4', 'https://24h.pchome.com.tw/prod/DHAV5V-A900EOB6P?q=/S/DHAV8Z', '83900'),
('技嘉 AERO 15 OLED XD 創作者筆電 (i7-11800H/16G/RTX3070/1T', 'https://24h.pchome.com.tw/prod/DHAV5V-A900EOR9P?q=/S/DHAV8V', '59900'),
('Razer Blade 14 黑(R9-5900HX/16G/RTX3070-8G/1TB SSD/', 'https://24h.pchome.com.tw/prod/DHACCI-1900BZ1DM?q=/S/DHACCG', '55900'),
('Razer 刺鱗樹蝰', 'https://24h.pchome.com.tw/prod/DCANA8-A9009B92V?q=/S/DHACAY', '799'),
('獵魂光蛛(中文)\n光軸機械鍵盤', 'https://24h.pchome.com.twhttps://24h.pchome.com.tw/prod/DCAH8X-A9009BKDH?fq=/S/DHACBC', '3690'),
('Razer Leviathan\n利維坦巨獸', 'https://24h.pchome.com.twhttps://24h.pchome.com.tw/prod/DCAIGE-A9009I920?fq=/S/DHACBH', '6990'),
('Razer\nIfrit USB Audio', 'https://24h.pchome.com.tw/prod/DCAY0R-A900AB8YJ', '3790'),
('Razer Blade 14 黑(R9-5900HX/16G/RTX3070-8G/1TB SSD/', 'https://24h.pchome.com.tw/prod/DHACCI-A900BS2IJ?q=/S/DHACCL', '60900'),
('Razer Book (i7-1165G7/16G/512G SSD/W10/UHD)', 'https://24h.pchome.com.tw/prod/DHACBN-A900AZYWQ?q=/S/DHACB5', '68900'),
('獵魂光蛛精英版(英文)\n光軸機械鍵盤', 'https://24h.pchome.com.twhttps://24h.pchome.com.tw/prod/DCAH8X-A9009BK5E?fq=/S/DHACBC', '6990'),
('Razer Emote\n魔音海妖', 'https://24h.pchome.com.twhttps://24h.pchome.com.tw/prod/DCAY0R-A900AB8QP?fq=/S/DCAYU7', '6190'),
('Razer 北海巨妖\n耳機麥克風', 'https://24h.pchome.com.tw/prod/DCAY0R-A900A53W8', '3190'),
('Razer Blade 15 Advanced(i7-10875H/16G/RTX2080 SUPE', 'https://24h.pchome.com.tw/prod/DHACAD-A900DW6W0?q=/S/DHACB5', '55900'),
('Razer Blade 17 黑(i7-12800H/32G/RTX 3080 Ti/1TB PCI', 'https://24h.pchome.com.tw/prod/DHACAE-A900DZM4T?q=/S/DHACCL', '132990'),
('黑寡婦幻彩版\n機械鍵盤', 'https://24h.pchome.com.twhttps://24h.pchome.com.tw/prod/DCAH8X-A9009X03E?fq=/S/DHACBD', '2690'),
('Razer 戰錘狂鯊\n無線耳機', 'https://24h.pchome.com.tw/prod/DCAY0R-A900ADSC7', '3690'),
('Razer Kraken\nKitty Ears Quartz', 'https://24h.pchome.com.tw/prod/DCAY0R-A900A026P', '699'),
('Razer Core X', 'https://24h.pchome.com.tw/prod/DHACAF-A900A81E4?q=/S/DHACB1', '8990'),
('Razer 毒蝰終極版', 'https://24h.pchome.com.tw/prod/DCANA8-A900ACV5L?q=/S/DHACAH', '3490'),
('黑寡婦輕裝版\n機械式鍵盤', 'https://24h.pchome.com.twhttps://24h.pchome.com.tw/prod/DCAH8X-A9009X04W?fq=/S/DHACBD', '3290'),
('Razer 北海巨妖\n耳機麥克風', 'https://24h.pchome.com.tw/prod/DCAY0R-A9009VW2Y', '3190'),
('Razer\n魔音海妖X粉晶', 'https://24h.pchome.com.tw/prod/DCAY0R-A9009WNCM', '3499'),
('Razer 黑鯊V2 Pro 耳麥', 'https://24h.pchome.com.tw/prod/DCAY0R-A900AW2Y8?q=/S/DHACBA', '5990'),
('Razer 北海巨妖耳機麥(黑)', 'https://24h.pchome.com.tw/prod/DCAY0R-A9009VW2Y?q=/S/DHACAY', '3190'),
('雨林狼蛛幻彩版\nRGB電競鍵盤', 'https://24h.pchome.com.twhttps://24h.pchome.com.tw/prod/DCAH8X-A9009B9F5?fq=/S/DHACBE', '2190'),
('Razer 北海巨妖\n專業版耳機粉晶', 'https://24h.pchome.com.tw/prod/DCAY0R-A9009WNDM', '3190'),
('Razer Kraken\nTE 北海巨妖TE競技版', 'https://24h.pchome.com.tw/prod/DCAY0R-A900A019X', '3790'),
('Razer Core X (銀色)', 'https://24h.pchome.com.tw/prod/DHACAF-A900AYC07?q=/S/DHACAF', '9290'),
('Razer Blade 14 黑(R9-5900HX/16G/RTX3080-8G/1TB SSD/', 'https://24h.pchome.com.tw/prod/DHACAD-A900BG5A9?q=/S/DHACCL', '68900'),
('Cynosa Chroma\nRGB電競鍵盤', 'https://24h.pchome.com.twhttps://24h.pchome.com.tw/prod/DCAH8X-A900A014M?fq=/S/DHACBE', '2290'),
('Razer 幻彩\n粉晶耳機架', 'https://24h.pchome.com.tw/prod/DCAY0R-A9009WNCO', '2290'),
('Razer Kraken\n北海巨妖電競耳麥', 'https://24h.pchome.com.tw/prod/DCAY0R-A900A5PFV', '1799'),
('HP Victus 16-e0771AX (R7-5800H/16G/RTX3060-6G/512G', 'https://24h.pchome.com.tw/prod/DHAJ5V-1900DXOFJ?q=/S/DHAJ5V', '38900'),
('HP OMEN 16-C0668AX(R7-5800H/16G/RTX3070 8G/1TB/W10', 'https://24h.pchome.com.tw/prod/DHAJ67-A900DX267?q=/S/DHAJ6Q', '47900'),
('HP Pavilion Gaming 15-dk2805TX(i5-11300H/8G/GTX165', 'https://24h.pchome.com.tw/prod/DHAG4Q-A900BJ1VK', '31900'),
('HP OMEN 16-C0665AX(R9-5900HX/32G/RTX3070 8G/1TB/W1', 'https://24h.pchome.com.tw/prod/DHAJ67-A900D0GP7?q=/S/DHAJ4L', '57900'),
('HP Victus 16-d0662TX 公爵黑(i7-11800H/8G/RTX3050-4G/5', 'https://24h.pchome.com.tw/prod/DHAJ5V-A900BQOE6?q=/S/DHAJ6A', '34900'),
('HP OMEN 16-b0662TX 秘影黑(i7-11800H/16G/RTX3070-8G/51', 'https://24h.pchome.com.tw/prod/DHAJ67-A900EN7S4?q=/S/DHAJ67', '50900'),
('HP OMEN 16-C0668AX(R7-5800H/16G/RTX3070 8G/1TB/W10', 'https://24h.pchome.com.tw/prod/DHAJ67-A900EZHDQ?q=/S/DHAJ67', '47999'),
('HP OMEN 16-C0666AX(R7-5800H/16G/RX6600M 8G/512GB P', 'https://24h.pchome.com.tw/prod/DHAJ67-A900EZHF0?q=/S/DHAJ67', '37900'),
('HP Pavilion Gaming 15-dk2805TX 黑騎士(i5-11300H/8G/GT', 'https://24h.pchome.com.tw/prod/DHAJ5Y-A900EYNFY?q=/S/DHAJ5Y', '24900'),
('HP Victus 16-d0662TX 公爵黑(i7-11800H/8G/RTX3050-4G/5', 'https://24h.pchome.com.tw/prod/DHAJ61-1900EU1XD?q=/S/DHAJ61', '34900'),
('HP Victus 16-d1044TX 紳仕藍(i5-12500H/8G/RTX3060-6G/5', 'https://24h.pchome.com.tw/prod/DHAJ61-A900EVP0C?q=/S/DHAJ61', '38900'),
('HP Victus 16-d1028TX 特務白(i7-12700H/8G/RTX 3050ti 4', 'https://24h.pchome.com.tw/prod/DHAJ61-A900EYNH3?q=/S/DHAJ61', '39900'),
('【限時下殺】Apacer宇瞻 AC630 2TB 2.5吋軍規行動硬碟', 'https://24h.pchome.com.tw/prod/DHAM7O-1900EYKJ9?q=/S/DHAJ5Y', '1699'),
('HP Pavilion Gaming 15-ec2037AX (R7-5800H/8G/RTX305', 'https://24h.pchome.com.tw/prod/DHAJ5Y-1900BVNFO', '31900'),
('HP OMEN 16-C0665AX(R9-5900HX/32G/RTX3070 8G/1TB/W1', 'https://24h.pchome.com.tw/prod/DHAJ67-A900EZHGU?q=/S/DHAJ67', '57900'),
('HP Victus 16-d1049TX 公爵黑(i5-12500H/8G/GTX 1650-4G/', 'https://24h.pchome.com.tw/prod/DHAJ61-A900ERUZ4?q=/S/DHAJ63', '31900'),
('HP Victus 16.1吋電競筆電(R7-5800H/16G/RTX3060-6G/512G P', 'https://24h.pchome.com.tw/prod/DHAJ5V-1900EZMHM?q=/S/DHAJ5V', '37900'),
('HP Pavilion Gaming 15-dk2801TX 黑騎士(i7-11370H/8G/RT', 'https://24h.pchome.com.tw/prod/DHAJ5Y-1900ESHWH?q=/S/DHAJ6A', '31900');

-- --------------------------------------------------------

--
-- 資料表結構 `sinya`
--

DROP TABLE IF EXISTS `sinya`;
CREATE TABLE `sinya` (
  `nb_id` varchar(100) DEFAULT NULL,
  `sinya_price` varchar(9) DEFAULT NULL,
  `sinya_url` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表新增資料前，先清除舊資料 `sinya`
--

TRUNCATE TABLE `sinya`;
--
-- 傾印資料表的資料 `sinya`
--

INSERT INTO `sinya` (`nb_id`, `sinya_price`, `sinya_url`) VALUES
('HP ZBOOK FURY 17 G8 菁英行動工作站商用筆電/W-11955M/Quadro A5000 16G/32G/2TB PCIe/17.3吋 4K UHD/W11 Pro/3-3-3/67', '192800', 'https://www.sinya.com.tw/prod/174226'),
('VAIO Z Kachi-iro 勝色 時尚商務筆電 i7-11390H/32GB/2TB SSD/14.1吋UHD 4K/W11pro/日本製/NZ14V5TW001P', '149900', 'https://www.sinya.com.tw/prod/168404'),
('GIGABYTE AERO 16 YE5-94TW949HP 技嘉 創作者系列筆電/i9-12900H/RTX3080Ti 16G/32GB/3TB PCIe/16吋 UHD OLED/W11-PRO', '132900', 'https://www.sinya.com.tw/prod/171468'),
('GIGABYTE AERO 16 YE5-94TW948HP 技嘉 創作者系列筆電/i9-12900H/RTX3080Ti 16G/32GB/2TB PCIe/16吋 UHD OLED/W11-PRO', '132900', 'https://www.sinya.com.tw/prod/173293'),
('MSI Creator Z17 A12UHST-001TW 微星纖薄創作者筆電/i9-12900H/RTX3080Ti 16G/64G/2TB PCIe/17吋QHD IPS 165Hz/W11-PR', '128900', 'https://www.sinya.com.tw/prod/172325'),
('HP ZBOOK FURY 17 G8 菁英行動工作站商用筆電/i9-11950H/Quadro A3000 6G/32G/1TB PCIe+2TB/17.3吋 4K UHD/W11 Pro/3-3-', '127900', 'https://www.sinya.com.tw/prod/174225'),
('HP ZBOOK STUDIO G8 創作行動工作站商用筆電/i9-11950H/RTX3060 6G/32G/1TB PCIe/15.6吋 OLED 4K UHD 觸控/W11 Pro/3-3-3/', '119900', 'https://www.sinya.com.tw/prod/174230'),
('MSI Stealth GS77 12UHS-024TW 微星超輕薄電競筆電/i9-12900H/RTX3080Ti 16G/64G/2TB PCIe/17.3吋UHD 120Hz/W11Pro/SS', '118900', 'https://www.sinya.com.tw/prod/172330'),
('MSI Raider GE76 Deluxe Edition 12UHS-038TW 微星旗艦電競筆電/i9-12900HK/RTX3080Ti 16G/64G/2TB PCIe/17.3吋UHD 3', '117900', 'https://www.sinya.com.tw/prod/173431'),
('Razer Blade 17 RZ09-0406CTC3-R3T1 雷蛇八核電競筆電/i7-11800H/RTX3080 8G/32G/1TB PCIe/17.3吋FHD 360Hz/W10/1年保固', '111990', 'https://www.sinya.com.tw/prod/169502'),
('HP ZBOOK FURY 15 G8 菁英行動工作站商用筆電/i9-11950H/Quadro A3000 6G/16G/1TB PCIe/15.6吋 FHD/W11 Pro/3-3-3/67N56', '109900', 'https://www.sinya.com.tw/prod/174224'),
('MSI GE66 Raider 12UHS-253TW 微星旗艦電競筆電/i9-12900HK/RTX3080Ti 16G/64G/2TB PCIe/15.6吋UHD 120Hz/W11 Pro/SS', '109900', 'https://www.sinya.com.tw/prod/173252'),
('Razer Blade 15 RZ09-0409KTD3-R3T1 雷蛇八核電競筆電/i7-11800H/RTX3080 8G/32G/1TB PCIe/15.6吋QHD 240Hz/W11/1年保固', '107900', 'https://www.sinya.com.tw/prod/169497'),
('MSI Stealth GS66 12UHS-070TW 微星12代超輕薄電競筆電/i9-12900H/64G/2TB SSD/RTX3080Ti 16G/15.6吋QHD 240Hz/W11Pro/', '107900', 'https://www.sinya.com.tw/prod/173964'),
('MSI Creator 17 B11UH-607TW 微星纖薄創作者筆電/i9-11900H/RTX3080 16G/32G/2TB PCIe/17.3吋 120Hz UHD/W10-PRO/白色背光', '99900', 'https://www.sinya.com.tw/prod/166500'),
('HP ZBOOK STUDIO G8 創作行動工作站商用筆電/i7-11800H/RTX3070 8G/32G/1TB PCIe/15.6吋 FHD/W11 Pro/3-3-3/67G70PA', '99900', 'https://www.sinya.com.tw/prod/174229'),
('Razer Blade 17 RZ09-0406BTC3-R3T1 雷蛇八核電競筆電/i7-11800H/RTX3070 8G/16G/1TB PCIe/17.3吋FHD 360Hz/W10/1年保固', '93990', 'https://www.sinya.com.tw/prod/169501'),
('Razer Blade 14 RZ09-0370CTA3-R3T1 雷蛇八核輕薄電競/R9-5900HX/RTX3080 8G/16G/1TB PCIe/14吋QHD 165Hz/W10/1年保固/各', '93990', 'https://www.sinya.com.tw/prod/169504'),
('HP ZBOOK STUDIO G8 創作行動工作站商用筆電/i7-11850H/Quadro A2000 4G/32G/1TB PCIe/15.6吋 FHD/W11 Pro/3-3-3/67N52P', '93900', 'https://www.sinya.com.tw/prod/174228'),
('Razer Blade 15 RZ09-0409JTD3-R3T1 雷蛇八核電競筆電/i7-11800H/RTX3070 8G/16G/1TB PCIe/15.6吋QHD 240Hz/W11/1年保固', '92990', 'https://www.sinya.com.tw/prod/169496'),
('MSI WS76 11UK-450TW 微星繪圖超輕薄工作站/i9-11900H/Quadro RTX A3000 6G/32G/2TB PCIe/17.3吋 UHD IPS/120Hz/W10-PR', '91900', 'https://www.sinya.com.tw/prod/172316'),
('MSI Stealth GS77 12UGS-067TW 微星超輕薄電競筆電/i9-12900H/RTX3070Ti 8G/32G/2TB PCIe/17.3吋UHD 120Hz/W11Pro/SS單', '91900', 'https://www.sinya.com.tw/prod/172007'),
('MSI Creator Z16P B12UGST-034TW 微星纖薄創作者筆電/i9-12900H/32G/2T SSD/RTX3070Ti-8G/16吋QHD 165Hz/W11-Pro/SS單鍵', '90900', 'https://www.sinya.com.tw/prod/173966'),
('MSI Creator Z17 A12UGST-002TW 微星纖薄創作者筆電/i7-12700H/RTX3070Ti 8G/32G/2TB PCIe/17吋QHD IPS 165Hz/W11-PRO', '88900', 'https://www.sinya.com.tw/prod/172418'),
('MSI GE76 Raider 12UGS-448TW 微星旗艦電競筆電/i7-12700H/RTX3070Ti 8G/32G/2TB PCIe/17.3吋QHD 240Hz/W11 Pro/SS單鍵', '88900', 'https://www.sinya.com.tw/prod/170227'),
('HP ZBOOK FURY 15 G8 菁英行動工作站商用筆電/i9-11900H/Quadro A2000 4G/8G/512G PCIe+2TB/15.6吋 FHD/W11 Pro/3-3-3/6', '87900', 'https://www.sinya.com.tw/prod/174223'),
('GIGABYTE AERO 17 XE5-73TW738HQ 技嘉 創作者系列筆電/i7-12700H/RTX3070Ti 8G/16GB/2TB PCIe/17吋 UHD miniLED 120Hz', '86900', 'https://www.sinya.com.tw/prod/173294'),
('VAIO SX14 Kachi-iro 勝色 時尚商務筆電 i7-1195G7/32GB/2TB SSD/14.1吋FHD 觸控/W11/日本製/含觸控筆/NZ14V4TW005P', '85900', 'https://www.sinya.com.tw/prod/168403'),
('MSI GE66 Raider 12UGS-034TW 微星旗艦電競筆電/i7-12700H/RTX3070Ti 8G/32G/2TB PCIe/15.6吋QHD 240Hz/W11 Pro/SS單鍵', '83900', 'https://www.sinya.com.tw/prod/170225'),
('GIGABYTE AERO 16 XE5-73TW938HP 技嘉 創作者系列筆電/i7-12700H/RTX3070Ti 8G/16GB/2TB PCIe/16吋 UHD OLED/W11-PRO/', '83900', 'https://www.sinya.com.tw/prod/172790'),
('MSI Stealth GS66 12UGS-017TW 微星12代超輕薄電競筆電/i7-12700H/RTX3070Ti 8G/32G/1TB PCIe/15.6吋QHD 240Hz/W11-Pro', '82900', 'https://www.sinya.com.tw/prod/170224'),
('GIGABYTE AORUS 17 YE5-74TW544SH 技嘉 電競筆電/i7-12700H/RTX3080Ti 16G/32GB/1TB PCIe/17.3吋 FHD 360Hz/W11/RG', '79900', 'https://www.sinya.com.tw/prod/172420'),
('HP ZBOOK FURY 15 G8 菁英行動工作站商用筆電/i7-11800H/Quadro A2000 4G/8G/512G PCIe+1TB/15.6吋 FHD/W11 Pro/3-3-3/6', '79900', 'https://www.sinya.com.tw/prod/174222'),
('VAIO SX14 Signature Black 特仕黑 時尚商務筆電 i7-1195G7/32GB/2TB SSD/14.1吋FHD 觸控/W11/日本製/含觸控筆/NZ14V4TW001P', '79900', 'https://www.sinya.com.tw/prod/168400'),
('VAIO SX14 Brown 古銅棕 時尚商務筆電 i7-1195G7/32GB/2TB SSD/14.1吋FHD 觸控/W11/日本製/含觸控筆/NZ14V4TW003P', '79900', 'https://www.sinya.com.tw/prod/168401'),
('VAIO SX14 White 珍珠白 時尚商務筆電 i7-1195G7/32GB/2TB SSD/14.1吋FHD 觸控/W11/日本製/含觸控筆/NZ14V4TW004P', '79900', 'https://www.sinya.com.tw/prod/168402'),
('Razer Blade 15 RZ09-0409ATD3-R3T1 雷蛇八核電競筆電/i7-11800H/RTX3060 6G/16G/1TB PCIe/15.6吋QHD 240Hz/W10/1年保固', '78990', 'https://www.sinya.com.tw/prod/169500'),
('HP ZBOOK STUDIO G8 創作行動工作站商用筆電/i7-11800H/Quadro T1200 4G/16G/1TB PCIe/15.6吋 FHD/W11 Pro/3-3-3/67G69P', '77900', 'https://www.sinya.com.tw/prod/174227'),
('GIGABYTE AERO 17 HDR YD-73TW548GP 技嘉4K創作者系列筆電/i7-11800H/RTX3080 8GB/32GB/512GB PCIe+1TB SSD/17.3吋 UH', '76900', 'https://www.sinya.com.tw/prod/160676'),
('MSI GP76 Vector 12UH-040TW 微星電競筆電/i7-12700H/RTX3080 8G/32G/1TB PCIe/17.3吋FHD 360Hz/W11/SS單鍵RGB背光電競鍵盤', '76900', 'https://www.sinya.com.tw/prod/170229'),
('HP ZBOOK POWER G8 效能行動工作站商用筆電/i9-11900H/Quadro A2000 4G/16G/1TB PCIe/15.6吋 FHD/W11 Pro/3-3-3/67N51PA', '75900', 'https://www.sinya.com.tw/prod/174220'),
('Razer Blade 14 RZ09-0370BTA3-R3T1 雷蛇八核輕薄電競/R9-5900HX/RTX3070 8G/16G/1TB PCIe/14吋QHD 165Hz/W10/1年保固/各', '73990', 'https://www.sinya.com.tw/prod/169503'),
('【交期不確定, 售完暫不接單】ASUS ROG Zephyrus M16 GU603ZW-0022A12900H 無盡黑 華碩西風之神電競筆電/i9-12900H/RTX3070Ti 8G/32G/1', '73900', 'https://www.sinya.com.tw/prod/170664'),
('MSI Creator Z16 A11UET-265TW 微星纖薄創作者筆電+Office365一年/i9-11900H/RTX3060 6G/32G/2TB PCIe/16吋QHD IPS 120H', '71900', 'https://www.sinya.com.tw/prod/168552'),
('ASUS ROG Zephyrus M16 GU603HR-0022A11900H 華碩無盡黑西風之神電競筆電/i9-11900H/RTX3070 8G/32G/2TB PCIe 4.0/16吋WQX', '69900', 'https://www.sinya.com.tw/prod/163806'),
('【最新12代, 槍神必買】ASUS ROG Strix SCAR 17 G733ZW-0032S12900H 華碩神準狙擊液態金屬版電競筆電/i9-12900H/RTX3070 Ti 8G(MUX獨顯', '68900', 'https://www.sinya.com.tw/prod/171782'),
('【最新12代到貨】ASUS ROG Strix SCAR 15 G533ZW-0022S12900H 華碩神準狙擊液態金屬版電競筆電/i9-12900H/RTX3070 Ti 8G/32G (16GB', '67900', 'https://www.sinya.com.tw/prod/171604'),
('HP ZBOOK POWER G8 效能行動工作站商用筆電/i7-11800H/Quadro A2000 4G/16G/512G PCIe/15.6吋 FHD/W11 Pro/3-3-3/67G68P', '65900', 'https://www.sinya.com.tw/prod/174219'),
('MSI GE66 Raider 11UG-241TW 微星旗艦電競筆電/i7-11800H/RTX3070 8G/16G/2TB PCIe/15.6吋QHD 240Hz/W10/SS單鍵RGB電競鍵盤', '63900', 'https://www.sinya.com.tw/prod/162566'),
('MSI Creator Z16 Hiroshi Fujiwara A11UE-225TW 微星纖薄創作者筆電 藤原浩版+OFFCE 365 個人一年版/i7-11800H/RTX3060 6G/16G', '63900', 'https://www.sinya.com.tw/prod/166157'),
('MSI Creator Z16 A11UE-058TW 微星纖薄創作者筆電+OFFCE 365一年/i7-11800H/RTX3060 6G/32G/1TB PCIe/16吋QHD IPS 120Hz', '63900', 'https://www.sinya.com.tw/prod/164061'),
('GIGABYTE AERO 17 HDR XD-73TW524GP 技嘉4K創作者系列筆電/i7-11800H/RTX3070 8GB/16GB/1TB PCIe/17.3吋 UHD HDR/W10-', '62999', 'https://www.sinya.com.tw/prod/160677'),
('GIGABYTE AERO 15 OLED XD-73TW644GP 技嘉4K創作者系列筆電/i7-11800H/RTX3070 8G/32GB/1TB PCIe/15.6吋 UHD OLED/W10', '62900', 'https://www.sinya.com.tw/prod/160675'),
('ASUS Zenbook Duo 14 UX482EGR-0141A1195G7 蒼宇藍 華碩雙螢幕超薄極輕筆電 ScreenPad Plus/i7-1195G7/32G/ PCIEG3x4 NVME', '61900', 'https://www.sinya.com.tw/prod/172407'),
('HP ZBOOK FIREFLY 15 G8 輕薄行動工作站商用筆電/i7-1165G7/Quadro T500 4G/16G/1TB PCIe/15.6吋 4K UHD/W11 Pro/3-3-3/', '61900', 'https://www.sinya.com.tw/prod/174216'),
('HP Elitebook 830 G8 惠普極輕旗艦商用筆電/i7-1185G7 vPro/Iris Xe/16G/1TB PCIe/13吋 FHD/W10 Pro/3-3-0/3C0F5PA', '60900', 'https://www.sinya.com.tw/prod/174142'),
('MSI Vector GP76 12UGS-458TW 微星電競筆電/i7-12700H/RTX3070 Ti 8G/16G/1TB PCIe/17.3吋FHD 360Hz/W11/SS單鍵RGB背光', '60900', 'https://www.sinya.com.tw/prod/173397'),
('GIGABYTE AERO 15 OLED XD-73TW624GR 技嘉4K創作者系列筆電/i7-11800H/RTX3070 8G/16GB/1TB PCIe/15.6吋 UHD OLED/W11', '59900', 'https://www.sinya.com.tw/prod/172884'),
('【12代新機】acer Predator Helios 300 PH317-56-724M 宏碁掠奪者狂暴效能電競筆電/i7-12700H/RTX3070Ti 8G /16G/512G PCIe/17', '59900', 'https://www.sinya.com.tw/prod/173694'),
('HP ZBOOK POWER G8 效能行動工作站商用筆電/i7-11800H/Quadro T1200 4G/8G/512G PCIe/15.6吋 FHD/W10 Pro/3-3-3/50N37PA', '59900', 'https://www.sinya.com.tw/prod/174217'),
('【2T SSD升級版】MSI GP66 Leopard 11UH-665TW 微星11代電競筆電/i7-11800H/RTX3080 8G/16G/1TB+1TB SSD/15.6吋FHD 240Hz', '59900', 'https://www.sinya.com.tw/prod/171943'),
('MSI Crosshair 15 R6E B12UGZ-017TW 微星虹彩六號限定款電競筆電/i7-12700H/RTX3070 8G(滿血版)/32G/1TB PCIe/15.6吋QHD 165H', '59900', 'https://www.sinya.com.tw/prod/171948'),
('GIGABYTE AORUS 15 XE4-73TWB14SH 技嘉電競筆電/i7-12700H/RTX3070Ti 8GB/16GB/1TB PCIe/15.6吋QHD 165Hz/W11/RGB單', '59900', 'https://www.sinya.com.tw/prod/171462'),
('GIGABYTE AORUS 17 XE4-73TW514SH 技嘉電競筆電/i7-12700H/RTX3070Ti 8GB/16GB/1TB PCIe Gen4/17.3吋FHD 360Hz/W11', '59900', 'https://www.sinya.com.tw/prod/171212'),
('MSI Summit E16Flip A12UCT-005TW 微星商務菁英筆電 觸控面板 /i7-1280P/RTX3050-4G/32G/1TB PCIe/16吋 QHD(2560X1600) /', '58900', 'https://www.sinya.com.tw/prod/173879'),
('HP Elite Dragonfly G2 惠普商用翻轉觸控筆電/i5-1135G7/Iris Xe/16G/512G PCIe/13.3吋 FHD觸碰翻轉/W10 Pro/3-3-3/3E5E7PA', '58900', 'https://www.sinya.com.tw/prod/172453'),
('MSI Creator 17 B11UE-419TW 微星纖薄創作者筆電/i7-11800H/RTX3060 6G/16G/1TB PCIe/17.3吋 120Hz UHD/W10-PRO/白色背光鍵', '58900', 'https://www.sinya.com.tw/prod/167855'),
('MSI Creator 15 A11UE-499TW 微星纖薄創作者筆電+Office365一年/i7-11800H/RTX3060 6G/32G/1TB PCIe/15.6吋 OLED UHD/W1', '58500', 'https://www.sinya.com.tw/prod/167856'),
('【最新12代 交期不確定, 不再接單】ASUS ROG Flow Z13 GZ301ZE-0021A12900H 無盡黑 華碩翻轉觸控電競筆電/ i9-12900H/RTX3050 Ti 4G(MUX', '57900', 'https://www.sinya.com.tw/prod/171784'),
('MSI GP76 Leopard 11UG-827TW 微星電競筆電/i7-11800H/RTX3070 8G/16G/1TB PCIe/17.3吋FHD 300Hz/W10/SS單鍵RGB背光電競鍵', '57900', 'https://www.sinya.com.tw/prod/166233'),
('【最新12代到貨】ASUS ROG Zephyrus M16 GU603ZM-0032A12700H 無盡黑 華碩西風之神電競筆電/ i7-12700H/RTX3060 6G/16G (8GB*2 D', '57900', 'https://www.sinya.com.tw/prod/172123'),
('【最新12代】ASUS ROG Strix SCAR 17 G733ZM-0022S12900H 華碩神準狙擊液態金屬版電競筆電/i9-12900H/RTX3060 6G/16G (8GB*2)DDR', '56900', 'https://www.sinya.com.tw/prod/171603'),
('【12代新機】acer Predator Helios 300 PH315-55-74FV 宏碁掠奪者狂暴效能電競筆電/i7-12700H/RTX3070Ti 8G /16G/512G PCIe/15', '56900', 'https://www.sinya.com.tw/prod/173693'),
('【西風之神．遊戲之神】ASUS ROG Zephyrus G15 GA503QS-0072E5900HS 日蝕灰液態金屬版華碩薄邊框電競筆電/R9-5900HS/RTX3080 8G/16G/512G', '56900', 'https://www.sinya.com.tw/prod/163735'),
('MSI Prestige 15 A12UD-021TW 石墨灰 微星輕薄商務效能筆電/i7-1280P/RTX3050Ti 4G/32G/2TB PCIe/15.6吋UHD (3840x2160)/W', '56900', 'https://www.sinya.com.tw/prod/172735'),
('【最新12代到貨】ASUS ROG Strix SCAR 15 G533ZM-0022S12900H 華碩神準狙擊液態金屬版電競筆電/i9-12900H/RTX3060 6G/16G (8GB*2)D', '55900', 'https://www.sinya.com.tw/prod/171593'),
('acer Predator Helios 300 PH315-54-94W7 宏碁掠奪者狂暴效能電競筆電/i9-11900H/RTX3070 8G/16G/512G PCIe/15.6吋FHD IPS', '55900', 'https://www.sinya.com.tw/prod/173940'),
('MSI WF76 11UJ-670TW 微星行動繪圖工作站/i7-11800H/RTX A2000 4G/16G/1TB PCIE/17.3吋FHD 144Hz/W11-PRO/3年保/含MSI原廠個', '55900', 'https://www.sinya.com.tw/prod/172944'),
('MSI GE66 Raider 10UG-401TW 微星十代窄邊框極致電競筆電/i7-10870H/RTX3070 8G/16G/2TB PCIe/15.6吋FHD 240Hz/W10/SS單鍵RG', '54900', 'https://www.sinya.com.tw/prod/171783'),
('dynabook Portege X30W-J 瑪瑙藍翻轉觸控/i7-1165G7/16G/512G PCIe/13.3吋FHD 觸控/W10/3年保/PDA11T-07N011/原Toshiba/觸', '54900', 'https://www.sinya.com.tw/prod/157796'),
('ASUS ROG Zephyrus M16 GU603HM-0062A11900H 華碩無盡黑西風之神電競筆電/i9-11900H/RTX3060 6G/16G/1TB PCIe/16吋WQXGA 1', '54900', 'https://www.sinya.com.tw/prod/162701'),
('MSI GE66 Raider 11UE-600TW 微星旗艦電競筆電/i7-11800H/RTX3060 6G/16G/1TB PCIe/15.6吋UHD OLED/W10/SS單鍵RGB電競鍵盤/', '54900', 'https://www.sinya.com.tw/prod/168336'),
('MSI WF66 11UJ-481TW 微星行動繪圖工作站/i7-11800H/RTX A2000 4G/16G/1TB PCIE/15.6吋FHD 144Hz/W10-PRO/3年保/含MSI原廠個', '54500', 'https://www.sinya.com.tw/prod/162846'),
('MSI Summit E16 Flip A11UCT-051TW 微星商務菁英筆電 觸控板+Office365一年/i7-1195G7/RTX-3050 4G/16G/1TB PCIe/16吋 QHD', '54500', 'https://www.sinya.com.tw/prod/164906'),
('MSI GP66 Leopard 11UH-665TW 微星11代電競筆電/i7-11800H/RTX3080 8G/16G/1TB PCIe/15.6吋FHD 240Hz/W11/SS單鍵RGB背光', '53900', 'https://www.sinya.com.tw/prod/171583'),
('LG gram 17 17Z90P-G.AA64C2 天使白 窄邊極緻超輕薄筆電/i5-1135G7/Iris Xe/16G/512G PCIe/17吋 WQXGA/W11/2年保', '53888', 'https://www.sinya.com.tw/prod/171179'),
('【Ryzen 6000 無交期暫不接單】ASUS ROG Strix G17 G713RM-0042F6900HX 潮魂黑 液態金屬版華碩薄邊框電競筆電/R9-6900HX/RTX3060 6G(MU', '52900', 'https://www.sinya.com.tw/prod/171781'),
('HP ZBOOK FIREFLY 14 G8 輕薄行動工作站商用筆電/i7-1165G7/Quadro T500 4G/16G/512G PCIe/14吋 FHD/W11 Pro/3-3-3/67G6', '52900', 'https://www.sinya.com.tw/prod/174214'),
('HP ZBOOK FIREFLY 15 G8 輕薄行動工作站商用筆電/i7-1165G7/Quadro T500 4G/16G/512G PCIe/15.6吋 FHD/W11 Pro/3-3-3/67', '52900', 'https://www.sinya.com.tw/prod/174215'),
('HP ZBOOK POWER G8 效能行動工作站商用筆電/i7-11800H/Quadro T600 4G/8G/512G PCIe/15.6吋 FHD/W11 Pro/1-1-1/33D92AV', '52900', 'https://www.sinya.com.tw/prod/174218'),
('HP ZBOOK POWER G9 效能行動工作站商用筆電/i7-12700H/Quadro T600 4G/8G/512G PCIe/15.6吋 FHD/W11 Pro/1-1-1/4T506AV', '52900', 'https://www.sinya.com.tw/prod/174221'),
('【RTX3080 職業選手高標準認證】GIGABYTE AORUS 15P YD-73TW224GH 技嘉旗艦電競筆電/i7-11800H/RTX3080 8G/16G/1TB PCIe/15.6吋 ', '52900', 'https://www.sinya.com.tw/prod/163795'),
('MSI WF66 11UI-482TW 微星行動繪圖工作站/i7-11800H/T1200 4G/16G/1TB PCIE/15.6吋FHD 144Hz/W10-PRO/3年保/含MSI原廠個性後背包', '51900', 'https://www.sinya.com.tw/prod/162845'),
('dynabook Portege X30W-J 瑪瑙藍翻轉觸控/i5-1135G7/16G/512G PCIe/13.3吋FHD 觸控/W10/3年保/PDA11T-07U014/原Toshiba/觸', '51900', 'https://www.sinya.com.tw/prod/157795'),
('MSI WF76 11UI-669TW 微星行動繪圖工作站/i7-11800H/NVIDIA T1200 4G/16G/1TB PCIE/17.3吋FHD 144Hz/W11-PRO/3年保/含MSI', '51900', 'https://www.sinya.com.tw/prod/172945'),
('MSI WF76 11UI-268TW 微星行動繪圖工作站/i7-11800H/NVIDIA T1200 4G/16G/1TB PCIE/17.3吋FHD 144Hz/W10-PRO/3年保/含MSI', '51900', 'https://www.sinya.com.tw/prod/165625'),
('LG gram 16 16Z90P-G.AA88C2 曜石黑 窄邊極緻超輕薄筆電/i7-1165G7/Iris Xe/16G/1TB PCIe/16吋 WQXGA/W11/2年保【福利品出清】【福利品', '51888', 'https://www.sinya.com.tw/prod/169697'),
('【效能×輕薄】ASUS ROG Zephyrus G14 GA401QM-0022D5900HS 華碩月光白(有燈)西風之神電競筆電/R9-5900HS/RTX3060 6G/32G/1TB PCIe', '50900', 'https://www.sinya.com.tw/prod/159479'),
('MSI Pulse GL76 12UEK-220TW 微星戰鬥版電競筆電/i7-12700H/RTX3060 6G/16G/1TB PCIe/17.3吋FHD 360Hz/W11/彩色背光電競鍵盤/含', '50900', 'https://www.sinya.com.tw/prod/170231'),
('ASUS ROG Zephyrus G14 GA401QM-0032E5900HS 日蝕灰 (有燈)西風之神電競筆電/R9-5900HS/RTX3060 6G/32G/1TB PCIe/14吋QHD/', '50900', 'https://www.sinya.com.tw/prod/159480'),
('【大滿貫版】MSI Crosshair 17 B12UGZ-277TW 微星炫彩版電競筆電/i7-12700H/RTX3070 8G/8G+8G/512G+500G/17.3吋 360Hz/W11/全', '50700', 'https://www.sinya.com.tw/prod/174154'),
('【1T SSD版】MSI Crosshair 17 B12UGZ-277TW 微星炫彩版電競筆電/i7-12700H/RTX3070 8G/8G/512G+500G/17.3吋 360Hz/W11/全', '50000', 'https://www.sinya.com.tw/prod/174155'),
('【最新12代, 少量到貨, 售完暫不接單】ASUS ROG Flow Z13 GZ301ZC-0091A12700H 無盡黑 華碩翻轉觸控電競筆電/ i7-12700H/RTX3050 4G/16G ', '49999', 'https://www.sinya.com.tw/prod/171608'),
('MSI GE66 Raider 10UE-243TW 微星十代窄邊框極致電競筆電/i7-10870H/RTX3060 6G/16G/2TB PCIe/15.6吋FHD 240Hz/W10/SS單鍵RG', '49999', 'https://www.sinya.com.tw/prod/157550'),
('【最新12代 太空紀念版】ASUS ZenBook 14X UX5401ZAS-0078T12700H 零重力鈦色 華碩太空紀念版筆電/i7-12700H/16G/1TB PCIe 4.0/14吋 2', '49900', 'https://www.sinya.com.tw/prod/171788'),
('HP Elitebook 840 Aero G8 惠普極輕旗艦商用筆電/i5-1145G7/Iris Xe/16G/512G PCIe/14吋 FHD/W10 Pro/3-3-0/456B4PA', '49900', 'https://www.sinya.com.tw/prod/174231'),
('Razer Book 13 RZ09-0357MTM2-R3T1 水銀白 雷蛇輕薄筆電/i7-1165G7/16G/512G PCIe/13.4吋FHD/W11/1年保固/J0047183', '49890', 'https://www.sinya.com.tw/prod/169367'),
('【16G版】MSI Crosshair 17 B12UGZ-277TW 微星炫彩版電競筆電/i7-12700H/RTX3070 8G/8G+8G/512G PCIe/17.3吋 360Hz/W11/全', '49500', 'https://www.sinya.com.tw/prod/174153'),
('HP ProBook 440 G9 惠普12代輕薄窄邊商用筆電/i7-1255U/MX570/8G/1TB PCIe/14 FHD/W11Pro DG W10Pro Pro/3-3-3/6G6J9PA', '48900', 'https://www.sinya.com.tw/prod/174134'),
('HP Elitebook x360 830 G8 惠普商用翻轉觸控筆電/i5-1135G7/Iris Xe/16G/1TB PCIe/13.3吋 FHD觸碰翻轉/W10 Pro/3-3-0/3A6C5', '48900', 'https://www.sinya.com.tw/prod/174141'),
('MSI Crosshair 17 B12UGZ-277TW 微星炫彩版電競筆電/i7-12700H/RTX3070 8G/8G/512G PCIe/17.3吋 360Hz/W11/全彩背光電競鍵盤', '48900', 'https://www.sinya.com.tw/prod/174152'),
('ASUS UX5400EG-0098G1165G7 綠松灰 華碩超薄極輕筆電 NumberPad版/i7-1165G7/MX450 2G/16G/1TB PCIe/14吋 2.8K OLED Touc', '48900', 'https://www.sinya.com.tw/prod/169337'),
('ASUS VivobookPro 16X M7600QC-0068K5800H 零度黑 窄邊框輕薄筆電/R7 5800H/RTX3050 4G/16G DDR4 on board/1TB PCIe/1', '48900', 'https://www.sinya.com.tw/prod/172513'),
('acer Predator Helios 300 PH315-54-72VQ 宏碁掠奪者狂暴效能電競筆電/i7-11800H/RTX3070 8G /16G/512G PCIe/15.6吋FHD IP', '47999', 'https://www.sinya.com.tw/prod/162881'),
('DELL G15-5520-R2768NTW 迷彩綠 戴爾硬核遠征電競筆電/i7-12700H/RTX3060 6G/16G/512GB PCIe/15.6吋 FHD 165Hz/W11/2年保', '47990', 'https://www.sinya.com.tw/prod/173340'),
('DELL G15-5520-R2768BTW 耀夜黑 戴爾硬核遠征電競筆電/i7-12700H/RTX3060 6G/16G/512GB PCIe/15.6吋 FHD 165Hz/W11/2年保', '47990', 'https://www.sinya.com.tw/prod/173341'),
('ASUS ROG Flow X13 GV301QE-0022A5900HS 華碩翻轉觸控電競筆電/R9-5900HS/RTX3050Ti 4G/32G/1TB PCIe/13.4吋觸控面板 120Hz', '47900', 'https://www.sinya.com.tw/prod/161851'),
('ASUS ROG Zephyrus G15 GA503QM-0122E5900HS 日蝕灰液態金屬版華碩薄邊框電競筆電/R9-5900HS/RTX3060 6G/16G/512G PCIe/15.6吋', '47900', 'https://www.sinya.com.tw/prod/162699'),
('【高更新率秒殺對手 RTX3070 8G】GIGABYTE AORUS 15P XD-73TW324GH 技嘉旗艦電競筆電 300Hz限量版/i7-11800H/RTX3070 8G/16G/1TB ', '47900', 'https://www.sinya.com.tw/prod/163796'),
('GIGABYTE A5 X1-CTW2130SH 技嘉戰鬥版電競筆電/R9-5900HX/RTX3070 8G/16G/512G PCIe/15.6吋 FHD 240Hz/W10/15色全區孤島背光鍵', '46999', 'https://www.sinya.com.tw/prod/164628'),
('【12代 touch OLED】ASUS ZenBook UP5401ZA-0023G12700H 綠松灰 華碩OLED翻轉筆電 NumberPad版/i7-12700H/16G/1TB PCIe4.', '46900', 'https://www.sinya.com.tw/prod/172906'),
('MSI Stealth 15M B12UE-028TW 微星超輕薄電競筆電/i7-1280P/RTX3060 6G/16G/1TB PCIe/15.6吋FHD 144Hz/W11/全彩背光電競鍵盤/含', '46900', 'https://www.sinya.com.tw/prod/172732'),
('MSI Crosshair 15 B12UEZ-023TW 微星炫彩版電競筆電/i7-12700H/RTX3060 6G/16G/1TB PCIe/15.6吋QHD 165Hz/W11/全彩背光電競鍵', '46900', 'https://www.sinya.com.tw/prod/172005'),
('VAIO SX14 深夜黑 時尚商務筆電i7-10710U/16GB/512GB PCIe/14.1吋UHD(4K)/W10/日本製/NZ14V2TW045P', '45999', 'https://www.sinya.com.tw/prod/165561'),
('VAIO SX14 霧鋁銀 時尚商務筆電/i7-10710U/16GB/512GB PCIe/14.1吋UHD(4K)/W10/日本製/NZ14V2TW046P', '45999', 'https://www.sinya.com.tw/prod/165562'),
('VAIO SX14 古銅棕 時尚商務筆電/i7-10710U/16GB/512GB PCIe/14.1吋UHD(4K)/W10/日本製/NZ14V2TW047P', '45999', 'https://www.sinya.com.tw/prod/165563'),
('【12代新機】acer Swift5 SF514-56T-71J2 迷霧綠 宏碁12代頂級極纖薄觸控筆電/i7-1260P/Iris Xe/16G/512G PCIe/14吋觸碰 WQXGA IPS/', '45900', 'https://www.sinya.com.tw/prod/172831'),
('dynabook Portege X30L-J 瑪瑙藍/i5-1135G7/8G/512G PCIe/13.3吋FHD 觸控/W10/3年保/PCR10T-04M00X/原Toshiba', '45900', 'https://www.sinya.com.tw/prod/157791'),
('【12代新機】acer Nitro AN515-58-77MX 戰魂黑 宏碁戰魂電競遊戲筆電/i7-12700H/RTX3060 6G/16G/512 PCIe/15.6吋FHD IPS 165Hz/', '45900', 'https://www.sinya.com.tw/prod/173692'),
('【最新12代】ASUS TUF Gaming F17 FX707ZM-0021B12700H 御鐵灰 華碩薄邊框軍規電競筆電/i7-12700H/RTX3060 6G/16G/512G PCIe 3.', '45900', 'https://www.sinya.com.tw/prod/171477'),
('【16G升級版】MSI Katana GF76 12UE-250TW 微星輕薄極窄邊框電競筆電/i7-12700H/RTX3060 6G/8G+8G/1TB PCIe/17.3吋 FHD 144Hz/', '45650', 'https://www.sinya.com.tw/prod/173094'),
('【最新12代到貨】ASUS TUF Gaming F15 FX507ZM-0021B12700H 御鐵灰 華碩薄邊框軍規電競筆電/i7-12700H/RTX3060 6G/16G DDR5 4800/', '44900', 'https://www.sinya.com.tw/prod/171601'),
('ASUS ROG Zephyrus M16 GU603HE-0032A11800H 無盡黑 華碩西風之神電競筆電/i7-11800H/RTX3050Ti 4G/16G/512G PCIe/16吋WQX', '44900', 'https://www.sinya.com.tw/prod/162700'),
('MSI Katana GF76 12UE-250TW 微星輕薄極窄邊框電競筆電/i7-12700H/RTX3060 6G/8G/1TB PCIe/17.3吋 FHD 144Hz/W11/紅色背光電競鍵', '44900', 'https://www.sinya.com.tw/prod/172252'),
('MSI Pulse GL66 11UEK-699TW 微星電競筆電鈦灰版/i7-11800H/RTX3060 6G/16G/1TB PCIe/15.6吋FHD 240Hz/W11/彩色背光電競鍵盤/含', '44900', 'https://www.sinya.com.tw/prod/170210'),
('MSI Prestige 15 A11UC-095TW 石墨灰 微星輕薄商務效能筆電i7-1195G7/RTX3050Ti 4G/16G/1TB PCIe/15.6吋UHD (3840x2160)/W', '44500', 'https://www.sinya.com.tw/prod/173876'),
('【贈1TB外接硬碟】HUAWEI Matebook 14s-intel i7 11th 深空灰/i7-11370H/Iris Xe/16G/512G PCIe/14.2吋 3:2 觸碰 2.5K LT', '43990', 'https://www.sinya.com.tw/prod/173955'),
('HUAWEI Matebook 14s-intel i7 11th 深空灰/i7-11370H/Iris Xe/16G/512G PCIe/14.2吋 3:2 觸碰 2.5K LTPS/W11/2年保', '43990', 'https://www.sinya.com.tw/prod/170892'),
('HP Elitebook 855 G8 惠普極輕旗艦商用筆電/R7 Pro 5850U/16G/1TB PCIe/15.6吋 FHD/W10 Pro/3-3-0/5R3X3PA', '43900', 'https://www.sinya.com.tw/prod/174140'),
('HP EliteBook 845 G8 惠普極輕旗艦商用筆電/R7 Pro 5850U/16G/1TB PCIe/14吋 FHD/W10 Pro/3-3-0/5R3X4PA', '43900', 'https://www.sinya.com.tw/prod/174252'),
('ASUS Zenbook 14 Ultralight EVO UX435EAL-0232G1165G7 綠松灰 華碩超薄極輕筆電 NumberPad版/i7-1165G7/16G/512GB PCIe', '43900', 'https://www.sinya.com.tw/prod/172736'),
('Dynabook Portege X50W-J 太空銀翻轉觸控/i7-1165G7/16G/512G PCIe/15.6吋 觸控/W10/3年保/PLT11T-00T002/原Toshiba/觸控筆', '43900', 'https://www.sinya.com.tw/prod/159187'),
('MSI Summit E13 Flip Evo A11MT-031TW 石墨黑 微星旗艦商用筆電 翻轉觸碰版/i7-1185G7/32G/1TB PCIe/13.4吋 FHD 翻轉觸碰/W10-PRO', '42900', 'https://www.sinya.com.tw/prod/159273'),
('HP Elitebook 645 G9 惠普極輕旗艦商用筆電/R7 Pro 5875U/16G/1TB PCIe/14吋 FHD/W11Pro DG W10Pro Pro/3-3-3/67N73PA', '42900', 'https://www.sinya.com.tw/prod/174135'),
('HP Elitebook 655 G9 惠普極輕旗艦商用筆電/R7 Pro 5875U/16G/1TB PCIe/15.6吋 FHD/W11Pro DG W10Pro Pro/3-3-3/67N74P', '42900', 'https://www.sinya.com.tw/prod/174138'),
('HP Elitebook 830 G8 惠普極輕旗艦商用筆電/i5-1135G7/Iris Xe/16G/512G PCIe/13吋 FHD/W10P/3-3-0/3A6C4PA', '42900', 'https://www.sinya.com.tw/prod/157782'),
('【4K創作者筆電】GIGABYTE AERO 15 OLED KD-72TW623GP 技嘉4K創作者系列筆電/i7-11800H/RTX3060 6G/16GB/512G PCIe/15.6吋 UH', '42900', 'https://www.sinya.com.tw/prod/161627'),
('【Ryzen 6000到貨】ASUS TUF Gaming A17 FA707RM-0021B6800H 御鐵灰 華碩薄邊框軍規電競筆電/R7-6800H/RTX3060 6G(MUX獨顯直連)/16', '42900', 'https://www.sinya.com.tw/prod/172405'),
('ASUS UX5400EG-0108P1135G7 星河紫 華碩超薄極輕筆電 NumberPad版/i5-1135G7/MX450 2G/16G/512GB PCIe/14吋 2.8K OLED To', '42900', 'https://www.sinya.com.tw/prod/169338'),
('HP Elitebook 840 Aero G8 惠普極輕旗艦商用筆電/i5-1135G7/Iris Xe/8G/1TB PCIe/14吋 FHD/W10/1-1-0/4V7Y8PA', '42900', 'https://www.sinya.com.tw/prod/172454'),
('HP ProBook 440 G9 惠普12代輕薄窄邊商用筆電/i5-1235U/MX570/8G/512G PCIe/14 FHD/W11Pro DG W10Pro Pro/3-3-3/6G6J8P', '42000', 'https://www.sinya.com.tw/prod/174131'),
('ASUS TUF Dash F15 FX516PR-0091A11370H 御鐵灰 華碩軍規電競筆電/i7-11370H/RTX3070 8G/8G/512G PCIe/15.6吋FHD 144Hz/', '41999', 'https://www.sinya.com.tw/prod/157858'),
('ASUS TUF Gaming F15 FX506HM-0042A11800H 幻影灰 華碩薄邊框軍規電競筆電/i7-11800H/RTX3060 6G/8G/512G PCIe/15.6吋FHD 1', '41900', 'https://www.sinya.com.tw/prod/160886'),
('【ROG X AW 聯名機】ASUS ROG Zephyrus G14 GA401QEC-0022G5900HS /R9-5900HS/RTX3050 Ti 4G/16G/1TB PCIe/14吋QH', '41900', 'https://www.sinya.com.tw/prod/163805'),
('ASUS ROG XG 外接顯示卡GC31S-041', '40900', 'https://www.sinya.com.tw/prod/161664'),
('【Ryzen 6000新上市】ASUS TUF Gaming A15 FA507RM-0021B6800H 御鐵灰 華碩薄邊框軍規電競筆電/R7-6800H/RTX3060 6G(MUX獨顯直連)/8', '40900', 'https://www.sinya.com.tw/prod/174235'),
('ASUS ZenBook Flip UP5401EA-0053G1135G7 綠松灰 華碩OLED翻轉筆電/i5-1135G7/16G/512GB PCIe 4.0/14吋 Touch 2.8K(28', '40900', 'https://www.sinya.com.tw/prod/169897'),
('VAIO SX14 古銅棕 時尚商務筆電/i7-10710U/8GB/256GB PCIe/14.1吋FHD/W10/日本製/NZ14V2TW044P', '39999', 'https://www.sinya.com.tw/prod/165565'),
('HP Elitebook X360 830 G7 2H9R8PA 惠普翻轉商用筆電/i5-10210U/16G/512G SSD/觸碰筆/WiFi-6/RJ45/W10-Pro/330', '39900', 'https://www.sinya.com.tw/prod/167232'),
('【最新12代到貨】ASUS TUF Gaming F15 FX507ZE-0041B12700H 御鐵灰 華碩薄邊框軍規電競筆電/i7-12700H/RTX3050Ti 4G/16G(8G*2)/51', '39900', 'https://www.sinya.com.tw/prod/171097'),
('【最新12代到貨】ASUS TUF Gaming F17 FX707ZE-0021B12700H 御鐵灰 華碩薄邊框軍規電競筆電/i7-12700H/RTX3050Ti 4G/8G/512G PCIe', '39900', 'https://www.sinya.com.tw/prod/170670'),
('ASUS TUF Dash F15 FX516PM-0201A11370H 御鐵灰 華碩軍規電競筆電/i7-11370H/RTX3060 6G/16G/512G PCIe/15.6吋QHD 165Hz', '39900', 'https://www.sinya.com.tw/prod/163539'),
('【最新12代 EVO OLED】ASUS ZenBook 14 OLED UX3402ZA-0042B1260P 紳士藍 華碩超薄極輕筆電 NumberPad版/i7-1260P/16G/512G P', '39900', 'https://www.sinya.com.tw/prod/173785'),
('【最新12代 EVO OLED】ASUS ZenBook 14 OLED UX3402ZA-0072E1260P 青瓷綠 華碩超薄極輕筆電 NumberPad版/i7-1260P/16G/512G P', '39900', 'https://www.sinya.com.tw/prod/173786'),
('ASUS ROG Zephyrus G15 GA503QC-0042E5900HS 華碩日蝕灰(無燈)西風之神電競筆電/R9-5900HS/RTX3050 4G/16G/512GB PCIe/15吋Q', '39900', 'https://www.sinya.com.tw/prod/166381'),
('MSI Prestige 14 A11SC-048TW 純淨白 微星輕薄商務筆電+Office365一年/i7-1195G7/GTX-1650 4G/16G/1TB PCIe/14吋 4K/W10-P', '39500', 'https://www.sinya.com.tw/prod/167857'),
('DELL G15-5520-R1748NTW 迷彩綠 戴爾硬核遠征電競筆電/i7-12700H/RTX3050 4G/16G/512GB PCIe/15.6吋 FHD 120Hz/W11/2年保', '38990', 'https://www.sinya.com.tw/prod/173337'),
('DELL G15-5520-R2648BTW 暗影灰 戴爾硬核遠征電競筆電/i5-12500H/RTX3050Ti 4G/16G/512GB PCIe/15.6吋 FHD 165Hz/W11/2年保', '38990', 'https://www.sinya.com.tw/prod/173097'),
('DELL Inspiron 14-5420-R2828STW 戴爾輕薄銀河星跡/i7-1260P/MX570 2G/16G/512G PCIe/14吋 16:10 2.2K/W11/2年保固/Insp', '38990', 'https://www.sinya.com.tw/prod/173795'),
('【12代新機】acer Nitro AN515-58-76FW 戰魂黑 宏碁戰魂電競遊戲筆電/i7-12700H/RTX3050 4G/16G/512 PCIe/15.6吋FHD IPS 165Hz/', '38900', 'https://www.sinya.com.tw/prod/174193'),
('HP ProBook 635 Aero G8 惠普極輕旗艦商用筆電/R5-5600U/8G/512G PCIe/13.3 FHD/W10 Pro/3-3-0/276K4AV', '38900', 'https://www.sinya.com.tw/prod/172457'),
('ASUS Zenbook 14 Ultralight EVO UX435EAL-0252G1135G7 綠松灰 華碩超薄極輕筆電 NumberPad版/i5-1135G7/16G/512GB PCIe', '38900', 'https://www.sinya.com.tw/prod/172734'),
('Dynabook Portege X50W-J 太空銀翻轉觸控/i5-1135G7/8G/512G PCIe/15.6吋 觸控/W10/3年保/PLT11T-00U003/原Toshiba/觸控筆', '38900', 'https://www.sinya.com.tw/prod/159188'),
('MSI Summit E13 Flip Evo A11MT-241TW 純淨白 微星旗艦商用筆電 翻轉觸碰版+Office365個人一年/i7-1185G7/16G/1TB PCIe/13.4吋 FH', '38500', 'https://www.sinya.com.tw/prod/166386'),
('acer TravelMate P2 TMP214-53G-75G4 宏碁商用筆電/i7-1165G7/MX330 2G/16G/1TB PCIe/14吋 FHD IPS/W10 Pro/3年保/含原', '37900', 'https://www.sinya.com.tw/prod/172077'),
('MSI Crosshair 15 A11UDK-875TW 微星炫彩版電競筆電/i7-11800H/RTX3050Ti 4G/16G/1TB PCIe/15.6吋FHD 144Hz/W10/全彩背光電', '37900', 'https://www.sinya.com.tw/prod/169021'),
('ASUS VivobookPro 15 K3500PC-0142B11300H 午夜藍 窄邊框輕薄筆電/i5-11300H/RTX3050 4G/16G/512GB PCIe/15吋 FHD OLED', '37900', 'https://www.sinya.com.tw/prod/169339'),
('【最新12代 EVO】ASUS ZenBook 14 UX3402ZA-0032B1260P 紳士藍 華碩超薄極輕筆電 NumberPad版/i7-1260P/16G/512G PCIe 4.0/14', '37900', 'https://www.sinya.com.tw/prod/173783'),
('【最新12代 EVO】ASUS ZenBook 14 UX3402ZA-0152E1260P 青瓷綠 華碩超薄極輕筆電 NumberPad版/i7-1260P/16G/512G PCIe 4.0/14', '37900', 'https://www.sinya.com.tw/prod/173787'),
('ASUS VivobookPro 14 K3400PH-0488B11370H 午夜藍 窄邊框輕薄筆電/i7-11370H/GTX1650 4GB/16G/512G PCIe/14吋 2.8K OLE', '37641', 'https://www.sinya.com.tw/prod/169335'),
('MSI Sword 15 A12UC-014TW 龍魂白 微星輕薄電競筆電/i7-12700H/RTX3050 4G/8G/512G PCIe/15.6吋 FHD 144Hz/W11/藍色背光電競鍵盤', '37500', 'https://www.sinya.com.tw/prod/170230'),
('HP ProBook 440 G9 惠普12代輕薄窄邊商用筆電/i5-1235U/Iris Xe/8G/512G PCIe/14 FHD/W11Pro DG W10Pro Pro/3-3-3/6G6J', '37000', 'https://www.sinya.com.tw/prod/174130'),
('GIGABYTE A5 K1-BTW2150SB 技嘉戰鬥版電競筆電/R7-5800HX/RTX3060 6G/16G/1TB PCIe/15.6吋 FHD 240Hz/W11/15色全區孤島背光鍵盤', '36999', 'https://www.sinya.com.tw/prod/172436'),
('【Ryzen 6000最新到貨】ASUS ROG STRIX G15 G513RC-0042F6800H 潮魂黑 液態金屬版華碩薄邊框電競筆電/R7-6800H/RTX3050 4G/8GB DDR5', '36900', 'https://www.sinya.com.tw/prod/171607'),
('ASUS ZenBook UX425EA-0662G1165G7 綠松灰 華碩超薄極輕筆電 NumberPad版/i7-1165G7/16G/512G PCIe/14吋FHD IPS/W11/原廠保護', '36900', 'https://www.sinya.com.tw/prod/169569'),
('ASUS ZenBook UX425EA-0692P1165G7 星河紫 華碩超薄極輕筆電 NumberPad版/i7-1165G7/16G/512G PCIe/14吋FHD IPS/W11/原廠保護', '36900', 'https://www.sinya.com.tw/prod/169571'),
('【12代】ASUS TUF Dash F15 FX517ZC-0021D12650H 御鐵黑 華碩軍規電競筆電/i7-12650H/RTX3050 4G(具備MUX獨顯直連)/8GB DDR5 480', '36900', 'https://www.sinya.com.tw/prod/172917'),
('【Ryzen 6000最新到貨】ASUS TUF Gaming A15 FA507RE-0031B6800H 御鐵灰 華碩薄邊框軍規電競筆電/R7-6800H/RTX3050 Ti 4G(MUX獨顯直', '36900', 'https://www.sinya.com.tw/prod/173454'),
('【視覺×聽覺 一場饗宴】ASUS VivobookPro 15 K3500PC-0062B11300H 午夜藍 窄邊框輕薄筆電/i5-11300H/RTX3050 4G/16G/512GB PCIe/', '36900', 'https://www.sinya.com.tw/prod/165282'),
('LG gram 16 16Z90P-G.AA64C2 冰雪白 窄邊極緻超輕薄筆電/i5-1135G7/Iris Xe/16G/512G PCIe/16吋 WQXGA/W11/2年保', '36900', 'https://www.sinya.com.tw/prod/169695'),
('LG gram 16 16Z90P-G.AA66C2 石英銀 窄邊極緻超輕薄筆電/i5-1135G7/Iris Xe/16G/512G PCIe/16吋 WQXGA/W11/2年保', '36900', 'https://www.sinya.com.tw/prod/169696'),
('acer Nitro AN517-54-75F2 戰魂黑 宏碁戰魂電競遊戲筆電/i7-11800H/RTX3050Ti 4GB/16G/512G PCIe/17.3吋FHD IPS 144Hz/W10', '35999', 'https://www.sinya.com.tw/prod/167293'),
('DELL G15-5520-R1648NTW 迷彩綠 戴爾硬核遠征電競筆電/i5-12500H/RTX3050 4G/16G/512GB PCIe/15.6吋 FHD 120Hz/W11/2年保', '35990', 'https://www.sinya.com.tw/prod/173315'),
('DELL G15-5520-R1648BTW 耀夜黑 戴爾硬核遠征電競筆電/i5-12500H/RTX3050 4G/16G/512GB PCIe/15.6吋 FHD 120Hz/W11/2年保', '35990', 'https://www.sinya.com.tw/prod/173099'),
('【Ryzen 6000最新到貨】ASUS TUF Gaming A17 FA707RC-0021B6800H 御鐵灰 華碩薄邊框軍規電競筆電/R7-6800H/RTX3050 4G(MUX獨顯直連)/', '35900', 'https://www.sinya.com.tw/prod/171780'),
('ASUS ZenBook UM425QA-0062G5900HX 綠松灰 華碩超薄極輕筆電 NumberPad版/R9-5900HX/16G/512G PCIe/14吋FHD IPS/W10/含保護袋', '35900', 'https://www.sinya.com.tw/prod/164196'),
('acer SwiftX SFX16-51G-75ZR 太空灰 宏碁超輕薄筆電/i7-11390H/RTX3050Ti 4G/16G/512G PCIe/16.1吋 FHD IPS/W11/含原廠包包及', '35900', 'https://www.sinya.com.tw/prod/169840'),
('【槍神專屬】ASUS ROG Strix G15 G513QE-0031C5900HX 潮魂黑液態金屬版華碩薄邊框電競筆電/R9-5900HX/RTX3050Ti 4G/8G/512G PCIe/15', '35900', 'https://www.sinya.com.tw/prod/163215'),
('ASUS Vivobook S14 S435EA-0099E1165G7 秘境綠 華碩超薄筆電 虛擬數字鍵盤版/i7-1165G7/16G/512GB PCIe/14吋FHD IPS/Win11/In', '35900', 'https://www.sinya.com.tw/prod/167616'),
('ASUS ZenBook UX5401EA-0142G1135G7 綠松灰 華碩輕薄美型筆電/i5-1135G7/16G/512GB PCIe 4.0/14吋 2K WQXGA(2560 x 1600', '35900', 'https://www.sinya.com.tw/prod/169982'),
('【16G升級版】MSI Katana GF66 11UD-861TW 微星輕薄電競筆電/i7-11800H/RTX3050Ti 4G/8G+8G/512G PCIe/15.6吋 FHD 144Hz/W', '35650', 'https://www.sinya.com.tw/prod/171655'),
('【16G升級版】MSI GF65 Thin 10UE-419TW 微星戰鬥電競筆電/i7-10750H/RTX3060 6G/16G/1TB PCIe/15.6吋 144Hz FHD/W10/紅色背光', '35500', 'https://www.sinya.com.tw/prod/167081'),
('【16G升級版】MSI Sword 15 A11UC-073TW 龍魂白 微星輕薄電競筆電/i7-11800H/RTX3050 4G/16G/512G PCIe/15.6吋 FHD 144Hz/W10', '35250', 'https://www.sinya.com.tw/prod/164919'),
('VAIO SE14 簡約灰 窄邊框時尚商務筆電/i7-1165G7/16GB/1TB/14吋FHD/W10/NP14V3TW013P', '34999', 'https://www.sinya.com.tw/prod/164873'),
('DELL Inspiron 15-5510-R4528STW 戴爾輕薄銀河星跡 低藍光版/i5-11320H/MX450 2G/16G/512G PCIe/15.6吋 FHD/W11/2年保固/Ins', '34990', 'https://www.sinya.com.tw/prod/169566'),
('MSI GF65 Thin 10UE-419TW 微星戰鬥電競筆電/i7-10750H/RTX3060 6G/8G/1TB PCIe/15.6吋 144Hz FHD/W10/紅色背光電競鍵盤【福利品】', '34990', 'https://www.sinya.com.tw/prod/165106'),
('【16G升級版】MSI Katana GF76 11UD-666TW 微星輕薄極窄邊框電競筆電/i7-11800H/RTX3050Ti 4G/8G+8G/1TB PCIe/17.3吋 FHD 144H', '34988', 'https://www.sinya.com.tw/prod/174319'),
('GIGABYTE G5 KD-52TW123SO 技嘉戰鬥版電競筆電/i5-11400H/RTX3060 6G/16G/512G PCIe/15.6吋 144Hz FHD/W11/15色全區孤島背光鍵', '34900', 'https://www.sinya.com.tw/prod/168212'),
('MSI Katana GF66 11UD-861TW 微星輕薄電競筆電/i7-11800H/RTX3050Ti 4G/8G/512G PCIe/15.6吋 FHD 144Hz/W10/紅色背光電競鍵盤', '34900', 'https://www.sinya.com.tw/prod/170543'),
('acer Swift5 SF514-55TA-773B 迷霧綠 宏碁極纖薄觸控筆電 抗菌版/i7-1165G7/Iris Xe/16G/512G PCIe/14吋觸碰 FHD IPS/W11', '34900', 'https://www.sinya.com.tw/prod/167296'),
('HP ProBook 455 G8 惠普輕薄窄邊商用筆電/R7-5800U/16G/512G PCIe/15.6 FHD/W10 Pro/2YADP/3D0X2PA', '34900', 'https://www.sinya.com.tw/prod/172458'),
('ASUS VivoBook S15 OLED S513EQ-0112S1165G7 閃電銀華碩超薄筆電/i7-1165G7/MX350 2G/16G/512GB PCIe/15吋OLED FHD/W1', '34900', 'https://www.sinya.com.tw/prod/162764'),
('MSI Katana GF76 11UD-666TW 微星輕薄極窄邊框電競筆電/i7-11800H/RTX3050Ti 4G/8G/1TB PCIe/17.3吋 FHD 144Hz/W11/紅色背光電', '34900', 'https://www.sinya.com.tw/prod/174318'),
('MSI Sword 15 A11UC-073TW 龍魂白 微星輕薄電競筆電/i7-11800H/RTX3050 4G/8G/512G PCIe/15.6吋 FHD 144Hz/W10/藍色背光電競鍵盤', '34500', 'https://www.sinya.com.tw/prod/160817'),
('【殺破龍】MSI Katana GF66 11UD-1210TW 微星輕薄電競筆電/i5-11400H/RTX3050Ti 4G/8G/1TB PCIe/15.6吋 FHD 144Hz/W11+ 27', '34388', 'https://www.sinya.com.tw/prod/171416'),
('ASUS TUF Dash F15 FX516PE-0031A11370H 御鐵灰 華碩軍規電競筆電/i7-11370H/RTX3050Ti 4G/8G/512G PCIe/15.6吋FHD 144H', '33900', 'https://www.sinya.com.tw/prod/160848'),
('ASUS TUF Gaming F15 FX506HM-0072B11400H 戰魂黑 華碩薄邊框軍規電競筆電/i5-11400H/RTX3060 6G/8G/512G PCIe/15.6吋FHD 1', '33900', 'https://www.sinya.com.tw/prod/172902'),
('acer Nitro AN515-57-76QN 戰魂黑 宏碁戰魂電競遊戲筆電/i7-11800H/RTX3050 4G/8G/512 PCIe/15.6吋FHD IPS 144Hz/W11/含ace', '33900', 'https://www.sinya.com.tw/prod/173691'),
('MSI Prestige 14Evo A11MO-049TW 純淨白 微星輕薄筆電+Office365一年/i7-1195G7/Iris Xe/16G/1TB PCIe/14吋FHD 300nit/W', '33500', 'https://www.sinya.com.tw/prod/169024'),
('dynabook EX50L-J 耀眼藍輕薄效能筆電/i7-1165G7/16G/1TB+512G PCIe/15.6吋 FHD/W10/3年保/PBS41T-01X00F /原Toshiba/', '33500', 'https://www.sinya.com.tw/prod/162698'),
('DELL Inspiron 14-5410-R4528STW 戴爾輕薄銀河星跡 低藍光版/i5-11320H/MX450 2G/16G/512G PCIe/14吋 FHD/W11/2年保固/Inspi', '32999', 'https://www.sinya.com.tw/prod/169693'),
('Lenovo ThinkPad E15 Gen2 聯想專業商務筆電/i7-1165G7/8G/512G SSD/15.6吋 FHD/W10 Pro/3年保/20TDS02E00', '32990', 'https://www.sinya.com.tw/prod/170305'),
('ASUS VivoBook X712EQ-0098S1165G7 冰河銀 華碩窄邊框輕薄筆電/i7-1165G7/MX350 2G/8G/512G PCIe/17.3吋FHD IPS/W11/HDD升', '32900', 'https://www.sinya.com.tw/prod/171786'),
('ASUS ZenBook UX425EA-0702P1135G7 星河紫 華碩超薄極輕筆電 NumberPad版/i5-1135G7/16G/512G PCIe/14吋FHD IPS/W11/原廠保護', '32900', 'https://www.sinya.com.tw/prod/171541'),
('acer TravelMate P2 TMP215-53-78LE 宏碁商用筆電/i7-1165G7/Iris Xe/8G/512G PCIe/15.6吋 FHD/W11 Pro/3年保/含原廠包包及', '32900', 'https://www.sinya.com.tw/prod/171358'),
('ASUS UX325EA-0292G1135G7 綠松灰 華碩四邊窄輕薄筆電/i5-1135G7/16G/512G PCIe/13.3吋FHD OLED/W11/含原廠保護袋/1年M365', '32900', 'https://www.sinya.com.tw/prod/169334'),
('ASUS UX325EA-0302P1135G7 星河紫 華碩四邊窄輕薄筆電/i5-1135G7/16G/512G PCIe/13.3吋FHD OLED/W11/含原廠保護袋/1年M365', '32900', 'https://www.sinya.com.tw/prod/169344'),
('ASUS ZenBook UX425EA-0672G1135G7 綠松灰 華碩超薄極輕筆電 NumberPad版/i5-1135G7/16G/512G PCIe/14吋FHD IPS/W11/原廠保護', '32900', 'https://www.sinya.com.tw/prod/170949'),
('HP 348 G7 質感銀 惠普輕薄窄邊商用筆電/i7-10510U/8G/512G PCIe/14吋FHD IPS/W10 Pro/3-3-0', '32800', 'https://www.sinya.com.tw/prod/174331'),
('【12代新機】【1.5TB SSD版】acer Swift3 SF314-512-50JE 神秘銀 宏碁12代超輕薄筆電/i5-1240P/Iris Xe/16G/512G PCIe+1TB PCIe', '32510', 'https://www.sinya.com.tw/prod/174268'),
('Lenovo IdeaPad Gaming 3 82K100C2TW 黑魂 聯想窄邊框電競筆電/i7-11370H/8G/512G PCIe/RTX3050Ti-4G/15吋FHD 120Hz/W10', '31990', 'https://www.sinya.com.tw/prod/172146'),
('acer Swift5 SF514-55GT-5551 迷霧綠 宏碁極纖薄觸控筆電 獨顯版/i5-1135G7/MX350 2G/16G/512G PCIe/14吋觸碰 FHD IPS/W11', '31900', 'https://www.sinya.com.tw/prod/167295'),
('acer Aspire Vero AV15-51R-73AP 未來灰 宏碁輕薄筆電 國家地理頻道特別版/i7-1195G7/16G/1TB PCIe/15.6吋 FHD IPS/W11', '31900', 'https://www.sinya.com.tw/prod/169858'),
('ASUS VivoBook S14 S435EA-0089E1135G7 秘境綠 華碩超薄筆電 虛擬數字鍵盤版/i5-1135G7/16G/512GB PCIe/14吋FHD IPS/Win11/In', '31900', 'https://www.sinya.com.tw/prod/167618'),
('acer SwiftX SFX14-41G-R2FK 暮日金 宏碁輕量強效筆電/R7-5800U/RTX3050 4G/16G/512G PCIe/14吋FHD IPS/W10/含原廠包包及滑鼠', '31888', 'https://www.sinya.com.tw/prod/162742'),
('acer SwiftX SFX14-41G-R3S5 煙燻粉 宏碁輕量強效筆電/R7-5700U/RTX3050 4G/16G/512G PCIe/14吋FHD IPS/W11/含原廠包包及滑鼠', '31188', 'https://www.sinya.com.tw/prod/167647'),
('acer SwiftX SFX14-41G-R2CE 深邃藍 宏碁輕量強效筆電/R7-5800U/RTX3050 4G/16G/512G PCIe/14吋FHD IPS/W10/含原廠包包及滑鼠【福利', '30999', 'https://www.sinya.com.tw/prod/162743'),
('Genuine捷元 15T EVO 輕薄長效觸控筆電/i7-1165G7/Iris Xe/16G/512G PCIe/15吋觸控 FHD IPS/W10/2年保/含原廠側背包及無線滑鼠', '30990', 'https://www.sinya.com.tw/prod/171777'),
('【硬碟加量版】Genuine捷元 15T EVO 輕薄長效觸控筆電/i7-1165G7/Iris Xe/16G/512G PCIe+500G M.2 SSD外接碟/15吋觸控 FHD IPS/W10/', '30990', 'https://www.sinya.com.tw/prod/172957'),
('ASUS TUF Dash F15 FX516PM-0231A11300H 御鐵灰 華碩軍規電競筆電/i5-11300H/RTX3060 6G/8G/512G PCIe/15.6吋FHD 144Hz/', '30900', 'https://www.sinya.com.tw/prod/171779'),
('Lenovo ThinkPad L14 Gen2 聯想專業商務筆電/i5-1135G7/8G/1TB+256G SSD/14吋 FHD/W10 Pro/3年保/20X1S08700', '30900', 'https://www.sinya.com.tw/prod/170301'),
('Lenovo ThinkPad E14 Gen2 聯想專業商務筆電/i5-1135G7/8G/512G SSD/14吋 FHD/W10 Pro/3年保/20TAS02C00', '30900', 'https://www.sinya.com.tw/prod/170303'),
('【12代新機】acer Swift3 SF314-512-50JE 神秘銀 宏碁12代超輕薄筆電/i5-1240P/Iris Xe/16G/512G PCIe/14吋 QHD IPS/W11/含原廠包', '30900', 'https://www.sinya.com.tw/prod/173941'),
('ASUS VivoBook S513EQ-0182D1135G7 魔幻金 華碩超薄筆電/i5-1135G7/MX350 2G/8G/512GB PCIe/15吋FHD IPS/W10/含華碩原廠包包及', '30900', 'https://www.sinya.com.tw/prod/162757'),
('ASUS VivoBook S15 OLED S513EQ-0262S1135G7 閃電銀華碩超薄筆電/i5-1135G7/MX350 2G/16G/512GB PCIe/15吋OLED FHD/W1', '30900', 'https://www.sinya.com.tw/prod/162761'),
('acer SwiftX SFX14-41G-R2VG 暮日金 宏碁輕量強效筆電/R5-5600U/RTX3050 4G/16G/512G PCIe/14吋FHD IPS/W10/含原廠包包及滑鼠', '30900', 'https://www.sinya.com.tw/prod/164347'),
('【16G優規雙碟版】acer Nitro AN515-57-517T 戰魂黑 宏碁戰魂電競遊戲筆電/i5-11400H/RTX3050 4G/16G(8G+8G)/512 PCIe+1TB/15.6吋', '30730', 'https://www.sinya.com.tw/prod/171585'),
('【16G 雙碟版】MSI GF63 Thin 11SC-066TW 微星戰鬥電競筆電/i7-11800H/GTX1650 4G/16G/1TB+512G PCIe/15.6吋FHD 144Hz/W10', '30550', 'https://www.sinya.com.tw/prod/167881'),
('MSI Prestige 14Evo A11MO-059TW 璀璨白 微星輕薄筆電+Office365一年/i5-1155G7/Iris Xe/16G/1TB PCIe/14吋FHD 300nit/W', '30500', 'https://www.sinya.com.tw/prod/169025'),
('MSI Prestige 14Evo A11MO-068TW 石墨灰 微星輕薄筆電+Office365一年/i5-1155G7/Iris Xe/16G/1TB PCIe/14吋FHD 300nit/W', '30500', 'https://www.sinya.com.tw/prod/169026'),
('【16G優規】MSI Katana GF76 11UC-485TW 微星輕薄極窄邊框電競筆電/i5-11400H/RTX3050 4G/8G+8G/512G PCIe/17.3吋 FHD 144Hz/', '30250', 'https://www.sinya.com.tw/prod/171406'),
('【16G優規】MSI Katana GF66 11UD-1210TW 微星輕薄電競筆電/i5-11400H/RTX3050Ti 4G/8G+8G/1TB PCIe/15.6吋 FHD 144Hz/W1', '30250', 'https://www.sinya.com.tw/prod/171407'),
('【雙碟版】MSI GF63 Thin 11SC-066TW 微星戰鬥電競筆電/i7-11800H/GTX1650 4G/8G/1TB+512G PCIe/15.6吋FHD 144Hz/W10/紅色背光', '29950', 'https://www.sinya.com.tw/prod/167880'),
('ASUS TUF Gaming A15 FA506IC-0122B4800H 戰魂黑 華碩軍規電競筆電/R7-4800H/RTX3050 4G/8G/512G PCIe/15.6吋FHD 144Hz/', '29900', 'https://www.sinya.com.tw/prod/171778'),
('【16G優規版 網購限定】ASUS TUF Gaming A15 FA506IC-0122B4800H 戰魂黑 華碩軍規電競筆電/R7-4800H/RTX3050 4G/16G(8G+8G)/512G', '29900', 'https://www.sinya.com.tw/prod/173855'),
('GIGABYTE G7 GD-51TW123SO 技嘉戰鬥版電競筆電/i5-11400H/RTX3050 4G/16G/512G PCIe/17.3吋 144Hz FHD/W11/15色全區孤島背光鍵', '29900', 'https://www.sinya.com.tw/prod/170545'),
('Lenovo ThinkPad L14 Gen2 聯想專業商務筆電/i5-1135G7/8G/1TB 7200轉/14吋 FHD/W10 Pro/3年保/20X1S00E00', '29900', 'https://www.sinya.com.tw/prod/170302'),
('ASUS VivoBook S15 IPS K513EQ-0972K1165G7 酷玩黑 華碩超薄筆電/i7-1165G7/MX350 2G/8G/512GB PCIe/15.6吋 FHD IPS /', '29900', 'https://www.sinya.com.tw/prod/172122'),
('【贈OFFICE 2021家用版】XPG XENIA 14 威剛極輕生活商務筆電/i5-1135G7/Iris Xe/16G/512G PCIE/14吋FHD/W10 PRO/2年保固/14I5G11', '29900', 'https://www.sinya.com.tw/prod/170336'),
('【贈24吋螢幕+無線鍵鼠組】XPG XENIA 14 威剛極輕生活商務筆電/i5-1135G7/Iris Xe/16G/512G PCIE/14吋FHD/W10 PRO/2年保固/14I5G11GXE', '29900', 'https://www.sinya.com.tw/prod/170344'),
('ASUS VivoBook S15 IPS K513EQ-0992S1165G7 閃電銀 華碩超薄筆電/i7-1165G7/MX350 2G/8G/512GB PCIe/15.6吋 FHD IPS /', '29900', 'https://www.sinya.com.tw/prod/172406'),
('ASUS TUF Gaming A15 FA506IC-0032A4800H 幻影灰 華碩軍規電競筆電/R7-4800H/RTX3050 4G/8G/512G PCIe/15.6吋FHD 144Hz/', '29900', 'https://www.sinya.com.tw/prod/163763'),
('ASUS VivoBook S15 IPS K513EQ-0982D1165G7 魔幻金 華碩超薄筆電/i7-1165G7/MX350 2G/8G/512GB PCIe/15.6吋 FHD IPS /', '29900', 'https://www.sinya.com.tw/prod/171705'),
('ASUS VivoBook X1403ZA-0161B12500H 午夜藍 華碩輕薄文書筆電/i5-12500H/8G/512G PCIe/14吋2.8K(2880x1800) OLED 16:10 ', '29900', 'https://www.sinya.com.tw/prod/173789'),
('ASUS TUF Gaming A15 FA506ICB-0132B4800H 戰魂黑 華碩軍規電競筆電/R7-4800H/RTX3050 4G/8G/512G PCIe/15.6吋FHD 144Hz', '29900', 'https://www.sinya.com.tw/prod/173802'),
('HUAWEI MateBook14-intel i5 11th 深空灰/i5-1135G7/Iris Xe/16G/512G PCIe/14吋 3:2 觸碰 2K IPS/W10/2年保', '29900', 'https://www.sinya.com.tw/prod/169458'),
('【贈2TB外接硬碟+64G隨身碟】XPG XENIA 14 威剛極輕生活商務筆電/i5-1135G7/Iris Xe/16G/512G PCIE/14吋FHD/W10 PRO/2年保固/14I5G11', '29900', 'https://www.sinya.com.tw/prod/171255'),
('Lenovo ThinkPad E15 Gen2 聯想專業商務筆電/i5-1135G7/8G/512G SSD/15.6吋 FHD/W10 Pro/3年保/20TDS02F00', '29888', 'https://www.sinya.com.tw/prod/170304'),
('MSI Katana GF76 11UC-664TW 微星輕薄極窄邊框電競筆電/i5-11400H/RTX3050 4G/8G/512G PCIe/17.3吋 FHD 144Hz/W11/紅色背光電競', '29500', 'https://www.sinya.com.tw/prod/172952'),
('【1T SSD版】MSI GF63 Thin 11SC-475TW 微星戰鬥電競筆電/i7-11800H/GTX1650 4G/8G/512G+512G SSD/15.6吋FHD 144Hz/W11/', '29500', 'https://www.sinya.com.tw/prod/171941'),
('MSI Katana GF76 11UC-485TW 微星輕薄極窄邊框電競筆電/i5-11400H/RTX3050 4G/8G/512G PCIe/17.3吋 FHD 144Hz/W10/紅色背光電競', '29500', 'https://www.sinya.com.tw/prod/170205'),
('MSI Katana GF66 11UD-1210TW 微星輕薄電競筆電/i5-11400H/RTX3050Ti 4G/8G/1TB PCIe/15.6吋 FHD 144Hz/W11/紅色背光電競鍵盤', '29500', 'https://www.sinya.com.tw/prod/170992'),
('【16G優規升級版】acer Nitro AN515-57-517T 戰魂黑 宏碁戰魂電競遊戲筆電/i5-11400H/RTX3050 4G/16G(8G+8G)/512 PCIe/15.6吋FHD ', '29280', 'https://www.sinya.com.tw/prod/170511'),
('【16G升級版】MSI GF63 Thin 11SC-066TW 微星戰鬥電競筆電/i7-11800H/GTX1650 4G/16G/512G PCIe/15.6吋FHD 144Hz/W10/紅色背光', '29250', 'https://www.sinya.com.tw/prod/167879'),
('【16G升級版】MSI GF63 Thin 11SC-475TW 微星戰鬥電競筆電/i7-11800H/GTX1650 4G/8G+8G/512G PCIe/15.6吋FHD 144Hz/W11/紅色', '29250', 'https://www.sinya.com.tw/prod/171506'),
('【32G優規升級版】XPG XENIA 14 威剛極輕生活商務筆電/i5-1135G7/Iris Xe/32G(16G+16G)/1TB PCIe(512G*2)/14吋FHD/W10 PRO/0.9', '28999', 'https://www.sinya.com.tw/prod/172124'),
('VAIO SE14 古銅金 窄邊框時尚商務筆電/i5-1135G7/16GB/512GB/14吋FHD/W10/NP14V3TW006P', '28999', 'https://www.sinya.com.tw/prod/170422'),
('ASUS VivoBook X712EQ-0068S1135G7 冰河銀 華碩窄邊框輕薄筆電/i5-1135G7/MX350 2G/8G/512G PCIe/17.3吋FHD IPS/W11/HDD升', '28900', 'https://www.sinya.com.tw/prod/171787'),
('acer Swift5 SF514-55T-51LL 迷霧綠 宏碁極纖薄觸控筆電/i5-1135G7/Iris Xe/16G/512G PCIe/14吋觸碰 FHD IPS/W11', '28900', 'https://www.sinya.com.tw/prod/171303'),
('GIGABYTE G5 GD-51TW123SO 技嘉戰鬥版電競筆電/i5-11400H/RTX3050 4G/16G/512G PCIe/15.6吋 144Hz FHD/W11/15色全區孤島背光鍵', '28900', 'https://www.sinya.com.tw/prod/170544'),
('ASUS TUF Gaming A17 FA706IC-0062B4600H 戰魂黑 華碩薄邊框軍規電競筆電/R5-4600H/RTX3050 4G/8G/512G PCIe/17.3吋FHD 144', '28900', 'https://www.sinya.com.tw/prod/172901'),
('dynabook EX50L 耀眼藍文書效能筆電/i7-1165G7/16G/512G PCIe/15吋FHD/W10/3年保/PBS41T-01200F/原Toshiba', '28900', 'https://www.sinya.com.tw/prod/157805'),
('acer Nitro AN515-57-517T 戰魂黑 宏碁戰魂電競遊戲筆電/i5-11400H/RTX3050 4G/8G/512 PCIe/15.6吋FHD IPS 144Hz/W11/含ace', '28900', 'https://www.sinya.com.tw/prod/169838'),
('ASUS VivoBook X513EP-0731K1165G7 酷玩黑 華碩四邊窄框輕薄筆電/i7-1165G7/MX330 2G/8G/512G PCIe/15.6吋FHD IPS/W11/含華碩', '28900', 'https://www.sinya.com.tw/prod/170952'),
('ASUS VivoBook X513EP-0741W1165G7 幻彩白 華碩四邊窄框輕薄筆電/i7-1165G7/MX330 2G/8G/512G PCIe/15.6吋FHD IPS/W11/含華碩', '28900', 'https://www.sinya.com.tw/prod/170953'),
('ASUS VivoBook X1503ZA-0111B12500H 午夜藍 華碩輕薄文書筆電/i5-12500H/8G/512G PCIe/15.6吋FHD(1920 x 1080) OLED 16:', '28900', 'https://www.sinya.com.tw/prod/173792'),
('【超值福利品】ASUS TUF Dash F15 FX516PC-0021A11300H 御鐵灰 華碩軍規電競筆電/i5-11300H/RTX3050 4G/8G/512G PCIe/15.6吋FHD', '28900', 'https://www.sinya.com.tw/prod/163820'),
('acer SwiftX SFX14-41G-R0F4 煙燻粉 宏碁輕量強效筆電/R7-5700U/GTX-1650 4G/16G/512G PCIe/14吋FHD IPS/W10/含原廠包包及滑鼠', '28900', 'https://www.sinya.com.tw/prod/162303'),
('【OLED×RTX3050×輕薄】ASUS VivobookPro 15 M3500QC-0112B5600H 午夜藍 窄邊框輕薄筆電/R5-5600H/RTX3050 4G/16G/512GB PC', '28888', 'https://www.sinya.com.tw/prod/165288'),
('微軟Microsoft Surface Pro 7+ 白金色/i5-1135G7/8G/128G SSD/12.3吋FHD/W11', '28888', 'https://www.sinya.com.tw/prod/172741'),
('微軟Microsoft Surface Laptop Go 白金色/i5-1035G1/8G/256G SSD/12.4吋FHD/W10/THJ-00019', '28888', 'https://www.sinya.com.tw/prod/171228'),
('微軟Microsoft Surface Laptop Go 砂岩金/i5-1035G1/8G/256G SSD/12.4吋FHD/W10/THJ-00044', '28888', 'https://www.sinya.com.tw/prod/171232'),
('微軟Microsoft Surface Laptop Go 冰藍色/i5-1035G1/8G/256G SSD/12.4吋FHD/W10/THJ-00033', '28888', 'https://www.sinya.com.tw/prod/171233'),
('【OLED×音響認證×輕薄】ASUS VivobookPro 14 M3401QA-0088B5800H 午夜藍 窄邊框輕薄筆電/R7-5800H/16G/512B PCIe/14吋 2.8K OLE', '28800', 'https://www.sinya.com.tw/prod/165638'),
('acer Extensa EX215-54G-76W2 宏碁商用筆電/i7-1165G7/MX350 2G/8G/512G PCIe+1TB/15.6吋 FHD/W10 Pro/2年保/含原廠包包及滑', '28800', 'https://www.sinya.com.tw/prod/171364'),
('MSI GF63 Thin 11SC-066TW 微星戰鬥電競筆電/i7-11800H/GTX1650 4G/8G/512G PCIe/15.6吋FHD 144Hz/W10/紅色背光電競鍵盤/含原廠電', '28500', 'https://www.sinya.com.tw/prod/167877'),
('MSI Modern 14 B11MO-830TW 慕斯杏 微星超輕薄筆電/i7-1195G7/16G/512G PCIe/14吋FHD IPS/W10/白色背光鍵盤/含原廠包包及滑鼠', '28500', 'https://www.sinya.com.tw/prod/167878'),
('MSI GF63 Thin 11SC-475TW 微星戰鬥電競筆電/i7-11800H/GTX1650 4G/8G/512G PCIe/15.6吋FHD 144Hz/W11/紅色背光電競鍵盤/含原廠電', '28500', 'https://www.sinya.com.tw/prod/171505'),
('acer Swift5 SF514-55GT-53NK 迷霧綠 宏碁極纖薄觸控筆電 獨顯版/i5-1135G7/MX350 2G/16G/512G PCIe/14吋觸碰 FHD IPS/W10/含原廠', '27999', 'https://www.sinya.com.tw/prod/155968'),
('acer SwiftX SFX14-41G-R02A 暮日金 宏碁輕量強效筆電/R7-5700U/GTX1650 4G/16G/512G PCIe/14吋FHD IPS/W10/含原廠包包及滑鼠【福利', '27999', 'https://www.sinya.com.tw/prod/162284'),
('acer Swift5 SF514-55TA-5884 迷霧綠 宏碁極纖薄觸控筆電 抗菌版/i5-1135G7/Iris Xe/8G/512G PCIe/14吋觸碰 FHD IPS/W11', '27999', 'https://www.sinya.com.tw/prod/170481'),
('DELL Vostro V16-5625-R1508ATW 高效軍規商務筆電/R5-5625U/8G/512G PCIe/16吋 16:10 FHD+/W11 Pro/2年保/Vostro 16 50', '27990', 'https://www.sinya.com.tw/prod/173335'),
('XPG XENIA 14 威剛極輕生活商務筆電/i5-1135G7/Iris Xe/16G/512G PCIE/14吋FHD/W10 PRO/0.97kg/2年保固/中文鍵盤/14I5G11GXELX', '27990', 'https://www.sinya.com.tw/prod/169406'),
('ASUS VivoBook S433EA-0428G1135G7 搖滾黑 華碩超薄筆電 虛擬數字鍵盤版/i5-1135G7/16G/512GB PCIe/14吋FHD IPS/W11/含華碩原廠包包及', '27900', 'https://www.sinya.com.tw/prod/171350'),
('【最新AMD R5 5000系列】ASUS Vivobook S15 M3502QA-0022K5600H 搖滾黑 華碩超輕薄筆電 /R5-5600H/8G DDR4/512GB PCIe/15.6吋', '27900', 'https://www.sinya.com.tw/prod/173451'),
('ASUS VivoBook S433EA-0048W1135G7 幻彩白 華碩超薄筆電 虛擬數字鍵盤版/i5-1135G7/16G/512GB PCIe/14吋FHD IPS/W10/含華碩原廠包包及', '27900', 'https://www.sinya.com.tw/prod/156321'),
('ASUS VivoBook S433EA-0098G1135G7 搖滾黑 華碩超薄筆電 虛擬數字鍵盤版/i5-1135G7/16G/512GB PCIe/14吋FHD IPS/W10/含華碩原廠包包及', '27900', 'https://www.sinya.com.tw/prod/156322'),
('ASUS VivoBook S433EA-0418W1135G7 幻彩白 華碩超薄筆電 虛擬數字鍵盤版/i5-1135G7/16G/512GB PCIe/14吋FHD IPS/W11/含華碩原廠包包及', '27900', 'https://www.sinya.com.tw/prod/171706'),
('【12代新機】【1.5TB SSD版】acer Aspire5 A515-57G-51A9 金屬灰 宏碁12代高效能獨顯/i5-1235U/MX550/8G/512G PCIe+1TB PCIe/15', '27510', 'https://www.sinya.com.tw/prod/174270'),
('DELL Inspiron 14-5415-R1708STW11 戴爾輕薄銀河星跡 R7版/八核心R7-5700U/8G/512G PCIe/14吋 FHD/W11/2年保固/Inspiron 14 ', '26999', 'https://www.sinya.com.tw/prod/169512'),
('VAIO SE14 簡約灰 窄邊框時尚商務筆電/i5-1135G7/16GB/512GB/14吋FHD/W10/NP14V3TW005P', '26999', 'https://www.sinya.com.tw/prod/170423'),
('Lenovo Ideapad YOGA 6 82ND00AXTW 深淵藍/R7-5700U/16G/512G PCIe/W11/FHD/13.3/3年保', '26990', 'https://www.sinya.com.tw/prod/172145'),
('acer TravelMate P2 TMP215-53-572B-TW 宏碁商用筆電/i5-1135G7/Iris Xe/8G/512G PCIe/15.6吋FHD IPS/W10-PRO/3年保/', '26900', 'https://www.sinya.com.tw/prod/165648'),
('acer Swift3 SF314-511-513K 神秘銀 宏碁超輕薄筆電/i5-1135G7/Iris Xe/16G/512G PCIe/14吋 FHD IPS/W11/含原廠包包及滑鼠', '26900', 'https://www.sinya.com.tw/prod/169845'),
('acer Swift3 SF314-511-553Y 深邃藍 宏碁超輕薄筆電/i5-1135G7/Iris Xe/16G/512G PCIe/14吋 FHD IPS/W11/含原廠包包和滑鼠', '26900', 'https://www.sinya.com.tw/prod/171444'),
('ASUS VivoBook X513EP-0701K1135G7 酷玩黑 華碩四邊窄框輕薄筆電/i5-1135G7/MX330 2G/8G/512G PCIe/15.6吋FHD IPS/W11/含華碩', '26900', 'https://www.sinya.com.tw/prod/170950'),
('acer TravelMate P2 TMP214-53-53TV 宏碁商用筆電/i5-1135G7/Iris Xe/8G/512G PCIe/14吋 FHD IPS/W10 Pro/3年保/含原廠包', '26900', 'https://www.sinya.com.tw/prod/174068'),
('【12代新機】【16G優規雙碟版】acer Aspire5 A514-55G-54Z3 金屬灰 宏碁12代高效能獨顯/i5-1235U/MX550/16G(8G+8G)/512G PCIe+1TB/1', '26561', 'https://www.sinya.com.tw/prod/174359'),
('【12代新機】【16G優規升級版】acer Aspire5 A515-57G-51A9 金屬灰 宏碁12代高效能獨顯/i5-1235U/MX550/16G(8G+8G)/512G PCIe/15.6吋', '26199', 'https://www.sinya.com.tw/prod/173881'),
('acer Extensa EX215-54G-50FC 宏碁獨顯商用筆電/i5-1135G7/MX350 2G/8G/512G PCIe+1TB/15.6吋 FHD/W10 Pro/2年保/含原廠包包', '25999', 'https://www.sinya.com.tw/prod/171363'),
('DELL Vostro V15-3525-R2608BTW 輕薄商務筆電/R5-5625U/16G/512G PCIe/15.6吋 FHD 120 Hz/W11 Pro/2年保/Vostro 15 3', '25990', 'https://www.sinya.com.tw/prod/173334'),
('ASUS VivoBook S15 IPS K513EQ-0962S1135G7 閃電銀 華碩超薄筆電/i5-1135G7/MX350 2G/8G/512GB PCIe/15.6吋 FHD IPS /', '25900', 'https://www.sinya.com.tw/prod/172121'),
('ASUS TUF Gaming F15 FX506LH-0281B10300H 戰魂黑 華碩軍規電競筆電/i5-10300H/GTX 1650 4G/8G/512G PCIe/15.6吋薄邊框FHD ', '25900', 'https://www.sinya.com.tw/prod/171610'),
('acer TravelMate P2 TMP215-53-54LC-TW 宏碁雙碟商用筆電/i5-1135G7/Iris Xe/8G/256G PCIe+1TB/15.6吋FHD IPS/W11/3年', '25900', 'https://www.sinya.com.tw/prod/171356'),
('【16G優規版】ASUS TUF Gaming F15 FX506LHB-0291B10300H 戰魂黑 華碩軍規電競筆電/i5-10300H/GTX 1650 4G/16G(8G+8G)/512G ', '25900', 'https://www.sinya.com.tw/prod/173917'),
('【12代新機】acer Aspire5 A515-57G-51A9 金屬灰 宏碁12代高效能獨顯/i5-1235U/MX550/8G/512G PCIe/15.6吋FHD IPS/W11', '25900', 'https://www.sinya.com.tw/prod/173697'),
('ASUS VivoBook S15 IPS K513EQ-0942K1135G7 酷玩黑 華碩超薄筆電/i5-1135G7/MX350 2G/8G/512GB PCIe/15.6吋 FHD IPS /', '25900', 'https://www.sinya.com.tw/prod/171695'),
('ASUS VivoBook S15 IPS K513EQ-0952D1135G7 魔幻金 華碩超薄筆電/i5-1135G7/MX350 2G/8G/512GB PCIe/15.6吋 FHD IPS /', '25900', 'https://www.sinya.com.tw/prod/171696'),
('ASUS TUF Gaming F15 FX506LHB-0291B10300H 戰魂黑 華碩軍規電競筆電/i5-10300H/GTX 1650 4G/8G/512G PCIe/15.6吋薄邊框FHD', '25900', 'https://www.sinya.com.tw/prod/173796'),
('dynabook Satellite CS50L-JW 雪漾白 文書效能筆電/i7-1165G7/16G/512G SSD/15吋FHD/W10/1年保/PYS45T-001001/原Toshiba', '25888', 'https://www.sinya.com.tw/prod/167722'),
('Dynabook CS40L-JB 黑曜藍 文書效能筆電/i7-1165G7/16G/512G SSD/14吋FHD/W11/1年保/PYS48T-003001/原Toshiba', '25888', 'https://www.sinya.com.tw/prod/172509');
INSERT INTO `sinya` (`nb_id`, `sinya_price`, `sinya_url`) VALUES
('dynabook CS40L-JG 迷霧金 文書效能筆電/i7-1165G7/16G/512G SSD/14吋FHD/W11/1年保/PYS48T-002001/原Toshiba', '25888', 'https://www.sinya.com.tw/prod/172510'),
('dynabook CS40L-JW 雪漾白 文書效能筆電/i7-1165G7/16G/512G SSD/14吋FHD/W11/1年保/PYS48T-001001/原Toshiba', '25888', 'https://www.sinya.com.tw/prod/172511'),
('HP 250 G8 沈穩黑 惠普輕薄窄邊商用筆電/i3-1125G4/4G/256G SSD+1TB/15.6吋 HD/W10/1-1-0/5C0Z9PA', '25700', 'https://www.sinya.com.tw/prod/174126'),
('【12代新機】【1.5TB SSD版】acer Aspire5 A515-57-52NZ 金屬灰 宏碁12代高效能筆電/i5-1235U/Iris Xe/8G/512G PCIe+1TB PCIe/1', '25610', 'https://www.sinya.com.tw/prod/174271'),
('【24G豪華雙碟版】acer Aspire5 A514-54G-56X3 質感金 宏碁高效能筆電/i5-1135G7/MX350 2G/24G(8G+16G)/1TB 高速PCIe SSD+1TB/1', '25590', 'https://www.sinya.com.tw/prod/174122'),
('【12代新機】【16G優規升級版】acer Aspire5 A514-55G-54Z3 金屬灰 宏碁12代高效能獨顯/i5-1235U/MX550/16G(8G+8G)/512G PCIe/14吋FH', '25299', 'https://www.sinya.com.tw/prod/174361'),
('【日系品牌 保固30個月 輕薄1.39kg】VAIO SE14 簡約灰 窄邊框時尚商務筆電/i5-1135G7/8GB/512GB/14吋FHD/W10/NP14V3TW001P', '24999', 'https://www.sinya.com.tw/prod/164872'),
('HP 348 G7 惠普商用筆記型電腦/i5-10210U/8G/512G/14FHD/WiFi-6/Win10Pro/3-3-0', '24999', 'https://www.sinya.com.tw/prod/166446'),
('DELL Vostro V15-3525-R1608BTW 輕薄商務筆電/R5-5625U/8G/512G PCIe/15.6吋 FHD 120 Hz/W11 Pro/2年保/Vostro 15 30', '24990', 'https://www.sinya.com.tw/prod/173333'),
('ASUS Vivobook X1402ZA-0051B1240P 午夜藍 華碩窄邊框戰鬥版筆電/i5-1240P/8G/512G PCIe/14吋 FHD 窄邊框 IPS aspect ratio/W', '24900', 'https://www.sinya.com.tw/prod/173788'),
('ASUS Vivobook X1502ZA-0071B1240P 午夜藍 華碩窄邊框戰鬥版筆電/i5-1240P/8G/512G PCIe/15.6吋 FHD 窄邊框 IPS aspect ratio', '24900', 'https://www.sinya.com.tw/prod/173790'),
('ASUS Vivobook X1502ZA-0091S1240P 冰河銀 華碩窄邊框戰鬥版筆電/i5-1240P/8G/512G PCIe/15.6吋 FHD 窄邊框 IPS aspect ratio', '24900', 'https://www.sinya.com.tw/prod/173791'),
('【12代新機】acer Aspire5 A514-55G-54Z3 金屬灰 宏碁12代高效能獨顯/i5-1235U/MX550/8G/512G PCIe/14吋FHD IPS/W11', '24900', 'https://www.sinya.com.tw/prod/174320'),
('ASUS VivoBook X513EP-0481W1135G7 幻彩白 華碩四邊窄框輕薄筆電/i5-1135G7/MX330 2G/8G/512G PCIe/15.6吋FHD IPS/W10/含華碩', '24900', 'https://www.sinya.com.tw/prod/166905'),
('【12代新機】【16G優規雙碟版】acer Aspire5 A514-55-54LV 金屬灰 宏碁12代高效能獨顯/i5-1235U/Iris Xe/16G(8G+8G)/512G PCIe+1TB/', '24561', 'https://www.sinya.com.tw/prod/174360'),
('【16G優規雙碟版】acer Aspire5 A517-52-537W 神秘銀 宏碁大尺寸筆電/i5-1135G7/16G(8G+8G)/512G PCIe SSD+1TB硬碟/17.3吋 FHD I', '24542', 'https://www.sinya.com.tw/prod/172254'),
('【16G優規雙碟版】acer Aspire5 A515-56G-536P 雅痞黑 宏碁高效能筆電/i5-1135G7/MX350 2G/16G(8G+8G)/512G PCIe+1TB/15.6吋FH', '24461', 'https://www.sinya.com.tw/prod/174016'),
('【16G優規雙碟版】acer Aspire5 A515-56G-58A7 神祕銀 宏碁高效能筆電/i5-1135G7/MX350 2G/16G(8G+8G)/512G PCIe+1TB/15.6吋FH', '24461', 'https://www.sinya.com.tw/prod/174017'),
('【12代新機】【16G優規升級版】acer Aspire5 A515-57-52NZ 金屬灰 宏碁12代高效能筆電/i5-1235U/Iris Xe/16G(8G+8G)/512G PCIe/15.6', '24299', 'https://www.sinya.com.tw/prod/173880'),
('Lenovo IdeaPad Slim5 Pro 14ACN6 暴風灰 聯想八核輕薄筆電/R7-5800U/16G/512G PCIe/14吋 2.2K/W11/2年保/含休閒後背包', '23999', 'https://www.sinya.com.tw/prod/169472'),
('HP 240 G8 沈穩黑 惠普輕薄窄邊商用筆電/i5-1135G7/8G/500G/14吋 HD/W10 Pro/1-1-0/4F1U8PA', '23999', 'https://www.sinya.com.tw/prod/172456'),
('DELL Inspiron 15-3525-R2608STW 戴爾輕薄銀河星跡 R5-5625U/16G/512G PCIe/15.6吋FHD/W11/2年保固/Inspiron 15 3000系列', '23990', 'https://www.sinya.com.tw/prod/173583'),
('DELL Vostro V15-3525-R1508BTW 輕薄商務筆電/R5-5625U/8G/256G PCIe/15.6吋 FHD 120 Hz/W11 Pro/2年保/Vostro 15 30', '23990', 'https://www.sinya.com.tw/prod/173332'),
('HP 255 G8 質感銀 惠普輕薄窄邊商用筆電/R5-5500U/8G/1TB/15.6吋 FHD IPS/W10/1-1-0/4L6J0PA', '23900', 'https://www.sinya.com.tw/prod/174124'),
('【輕薄990g的自由 軍規符合】GIGABYTE U4 UD-70TW823SE 技嘉990克輕薄型動派筆電+Office365個人一年/i7-1195G7/Iris Xe/16G(8G*2)/512', '23900', 'https://www.sinya.com.tw/prod/167280'),
('【12代新機】acer Aspire5 A515-57-52NZ 金屬灰 宏碁12代高效能筆電/i5-1235U/Iris Xe/8G/512G PCIe/15.6吋FHD IPS/W11', '23900', 'https://www.sinya.com.tw/prod/173698'),
('acer Swift3 SF314-511-545L 神秘銀 宏碁超輕薄筆電/i5-1135G7/Iris Xe/16G/512G PCIe/14吋 FHD IPS/W10/含原廠包包及滑鼠【福利品】', '23888', 'https://www.sinya.com.tw/prod/160773'),
('【大滿貫版本】MSI Modern 15 A5M-092TW 石墨灰 微星超輕薄筆電/R7-5700U/16G/1T SSD/15.6吋FHD/W11/白色背光鍵盤【筆電高興價】【每周精選】', '23800', 'https://www.sinya.com.tw/prod/173116'),
('【大滿貫版】MSI Modern 15 A11MU-1028TW 石墨灰 微星超輕薄筆電/i5-1155G7/8G+8G/512G+500G/15.6吋FHD/W11/白色背光鍵盤【筆電高興價】', '23800', 'https://www.sinya.com.tw/prod/174159'),
('【高速SSD雙碟版】acer Aspire5 A517-52-537W 神秘銀 宏碁大尺寸筆電/i5-1135G7/8G/512G PCIe SSD+1TB/17.3吋 FHD IPS/W11', '23762', 'https://www.sinya.com.tw/prod/172247'),
('【1TB PCIe 雙碟版】acer Aspire5 A514-54G-50TQ 質感金 宏碁認證高效能/i5-1135G7/MX350 2G/8G/1TB 高速PCIe SSD+1TB/14吋FHD', '23610', 'https://www.sinya.com.tw/prod/171989'),
('【1TB PCIe 雙碟版】acer Aspire5 A514-54G-589P 神秘銀 宏碁認證高效能/i5-1135G7/MX350 2G/8G/1TB 高速PCIe SSD+1TB/14吋FHD', '23610', 'https://www.sinya.com.tw/prod/171990'),
('【16G優規雙碟版】acer Aspire5 A515-56-50L0 雅痞黑 宏碁高效能筆電/i5-1135G7/16G(8G+8G)/512G PCIe+1TB/15.6吋FHD IPS/W11【', '23561', 'https://www.sinya.com.tw/prod/173884'),
('【16G優規雙碟版】acer Aspire5 A515-56-5422 神祕銀 宏碁高效能筆電/i5-1135G7/16G(8G+8G)/512G PCIe+1TB/15.6吋FHD IPS/W11【', '23561', 'https://www.sinya.com.tw/prod/173885'),
('MSI Modern 14 B10MW-666TW 石墨灰 微星超輕薄商務筆電/i7-10510U/8G/512G PCIe/14吋FHD/W10 PRO/3年保固/白色背光鍵盤', '23500', 'https://www.sinya.com.tw/prod/171908'),
('【12代新機】【16G優規升級版】acer Aspire5 A514-55-54LV 金屬灰 宏碁12代高效能獨顯/i5-1235U/Iris Xe/16G(8G+8G)/512G PCIe/14吋F', '23299', 'https://www.sinya.com.tw/prod/174358'),
('【16G優規升級版】acer Aspire5 A515-56G-58A7 神祕銀 宏碁高效能筆電/i5-1135G7/MX350 2G/16G(8G+8G)/512G PCIe/15.6吋FHD IP', '23199', 'https://www.sinya.com.tw/prod/172989'),
('【16G優規升級版】acer Aspire5 A515-56G-536P 雅痞黑 宏碁高效能筆電/i5-1135G7/MX350 2G/16G(8G+8G)/512G PCIe/15.6吋FHD IP', '23199', 'https://www.sinya.com.tw/prod/173562'),
('【1T SSD版】MSI Modern 15 A11MU-1028TW 石墨灰 微星超輕薄筆電/i5-1155G7/8G/512G+500G/15.6吋FHD/W11/白色背光鍵盤【筆電高興價】', '23100', 'https://www.sinya.com.tw/prod/174160'),
('【1T SSD版】MSI Modern 15 A5M-092TW 石墨灰 微星超輕薄筆電/R7-5700U/8G/512G+500G SSD/15.6吋FHD/W11/白色背光鍵盤【筆電高興價】', '23000', 'https://www.sinya.com.tw/prod/171944'),
('acer Extensa EX215-54-55LH 宏碁商用筆電/i5-1135G7/Iris Xe/8G/512G PCIe/15.6吋 FHD/W10 Pro/2年保/含原廠包包及滑鼠', '22999', 'https://www.sinya.com.tw/prod/171359'),
('HP 245 G8 沈穩黑 惠普輕薄窄邊商用筆電/R5-5500U/8G/1TB/14吋 FHD IPS/W10/1-1-0/48W34PA', '22999', 'https://www.sinya.com.tw/prod/172455'),
('VAIO SE14 古銅金 窄邊框時尚商務筆電/i5-1135G7/8GB/512GB/14吋FHD/W10/NP14V3TW002P', '22999', 'https://www.sinya.com.tw/prod/170419'),
('DELL Inspiron 15-3525-R1608STW 戴爾輕薄銀河星跡 R5-5625U/8G/512G PCIe/15.6吋FHD/W11/2年保固/Inspiron 15 3000系列', '22990', 'https://www.sinya.com.tw/prod/173582'),
('【16G優規雙碟版】acer Aspire5 A514-54G-50TQ 質感金 宏碁認證高效能/i5-1135G7/MX350 2G/16G(8G+8G)/500G 高速PCIe SSD+1TB/1', '22988', 'https://www.sinya.com.tw/prod/172986'),
('【16G優規雙碟版】acer Aspire5 A514-54G-589P 神秘銀 宏碁認證高效能/i5-1135G7/MX350 2G/16G(8G+8G)/500G 高速PCIe SSD+1TB/1', '22988', 'https://www.sinya.com.tw/prod/172987'),
('ASUS VivoBook X513EA-0021K1135G7 酷玩黑 華碩四邊窄框輕薄筆電/i5-1135G7/8G/512G PCIe/15.6吋FHD IPS/W11/含華碩原廠包包及滑鼠', '22900', 'https://www.sinya.com.tw/prod/172810'),
('acer Aspire5 A515-56G-58A7 神祕銀 宏碁高效能筆電/i5-1135G7/MX350 2G/8G/512G PCIe/15.6吋FHD IPS/W11', '22900', 'https://www.sinya.com.tw/prod/169781'),
('dynabook EX50L 銀河白文書效能筆電/i5-1135G7/8G/512G PCIe/15吋FHD/W10/3年保/PBS41T-01300E /原Toshiba', '22900', 'https://www.sinya.com.tw/prod/157804'),
('acer Aspire5 A515-56G-536P 雅痞黑 宏碁高效能筆電/i5-1135G7/MX350 2G/8G/512G PCIe/15.6吋FHD IPS/W11', '22900', 'https://www.sinya.com.tw/prod/171397'),
('ASUS X515EP-0221G1135G7 星空灰 華碩四邊窄框輕薄筆電/i5-1135G7/MX330 2G/8G/512G PCie/15.6吋FHD IPS/W11', '22900', 'https://www.sinya.com.tw/prod/170395'),
('ASUS X515EP-0241S1135G7 冰柱銀 華碩四邊窄框輕薄筆電/i5-1135G7/MX330 2G/8G/512G PCie/15.6吋FHD IPS/W11', '22900', 'https://www.sinya.com.tw/prod/170396'),
('ASUS Laptop X415EP-0081S1135G7 冰柱銀 華碩窄邊框戰鬥版筆電/i5-1135G7/MX330 2G/8G/512G PCIe/14吋 IPS FHD/W10', '22900', 'https://www.sinya.com.tw/prod/162751'),
('ASUS Laptop X415EP-0071G1135G7 星空灰 華碩窄邊框戰鬥版筆電/i5-1135G7/MX330 2G/8G/512G PCIe/14吋 IPS FHD/W10', '22900', 'https://www.sinya.com.tw/prod/162752'),
('acer Aspire3 A315-58G-56TD 湖水藍 宏碁獨顯效能型筆電/i5-1135G7/MX350 2G/8G/512G PCIe/15.6吋 FHD/W11', '22900', 'https://www.sinya.com.tw/prod/174276'),
('acer Aspire3 A315-58G-54DR 神秘銀 宏碁獨顯效能型筆電/i5-1135G7/MX350 2G/8G/512G PCIe/15.6吋 FHD/W11', '22900', 'https://www.sinya.com.tw/prod/174277'),
('acer Aspire5 A517-52-537W 神秘銀 宏碁大尺寸筆電/i5-1135G7/8G/512G PCIe SSD/17.3吋 FHD IPS/W11', '22900', 'https://www.sinya.com.tw/prod/172241'),
('【12代新機】acer Aspire5 A514-55-54LV 金屬灰 宏碁12代高效能獨顯/i5-1235U/Iris Xe/8G/512G PCIe/14吋FHD IPS/W11', '22900', 'https://www.sinya.com.tw/prod/174321'),
('微軟Microsoft Surface Laptop Go 白金色/i5-1035G1/8G/128G SSD/12.4吋FHD/W10/THH-00019', '22888', 'https://www.sinya.com.tw/prod/156464'),
('微軟Microsoft Surface Laptop Go 砂岩金/i5-1035G1/8G/128G SSD/12.4吋FHD/W10/THH-00044', '22888', 'https://www.sinya.com.tw/prod/171227'),
('【高速SSD雙碟版】acer Aspire5 A515-56-5422 神祕銀 宏碁高效能筆電/i5-1135G7/8G/512G PCIe+1TB/15.6吋FHD IPS/W11【筆電高興價】', '22762', 'https://www.sinya.com.tw/prod/173882'),
('【高速SSD雙碟版】acer Aspire5 A515-56-50L0 雅痞黑 宏碁高效能筆電/i5-1135G7/8G/512G PCIe+1TB/15.6吋FHD IPS/W11【筆電高興價】', '22762', 'https://www.sinya.com.tw/prod/173883'),
('【高速SSD雙碟版】acer Aspire5 A514-54G-597W 群青藍 宏碁高效能筆電/i5-1135G7/MX350 2G/8G/500G 高速PCIe SSD+1TB/14吋FHD IP', '22739', 'https://www.sinya.com.tw/prod/172111'),
('【高速SSD雙碟版】acer Aspire5 A514-54G-57N6 雅痞黑 宏碁高效能筆電/i5-1135G7/MX350 2G/8G/500G 高速PCIe SSD+1TB/14吋FHD IP', '22739', 'https://www.sinya.com.tw/prod/172112'),
('【高速SSD雙碟版】acer Aspire5 A514-54G-56X3 質感金 宏碁高效能筆電/i5-1135G7/MX350 2G/8G/500G 高速PCIe SSD+1TB/14吋FHD IP', '22739', 'https://www.sinya.com.tw/prod/172113'),
('【高速SSD雙碟版】acer Aspire5 A514-54G-521D 煙燻粉 宏碁高效能筆電/i5-1135G7/MX350 2G/8G/500G 高速PCIe SSD+1TB/14吋FHD IP', '22739', 'https://www.sinya.com.tw/prod/172114'),
('【16G升級版】MSI Modern 15 A5M-092TW 石墨灰 微星超輕薄筆電/R7-5700U/8G+8G/512G SSD/15.6吋FHD/W11/白色背光鍵盤【筆電高興價】', '22650', 'https://www.sinya.com.tw/prod/171945'),
('【16G版】MSI Modern 15 A11MU-1028TW 石墨灰 微星超輕薄筆電/i5-1155G7/8G+8G/512G PCIe/15.6吋FHD/W11/白色背光鍵盤【筆電高興價】', '22600', 'https://www.sinya.com.tw/prod/174158'),
('【16G優規升級版】acer Aspire5 A514-54G-58HW 神秘銀 宏碁高效能筆電/i5-1135G7/MX350 2G/16G(8G+8G)/512G PCIe/14吋FHD IPS/', '22299', 'https://www.sinya.com.tw/prod/172861'),
('【16G優規升級版】acer Aspire5 A515-56-50L0 雅痞黑 宏碁高效能筆電/i5-1135G7/16G(8G+8G)/512G PCIe/15.6吋FHD IPS/W11【筆電高興', '22299', 'https://www.sinya.com.tw/prod/173975'),
('【16G優規升級版】acer Aspire5 A515-56-5422 神祕銀 宏碁高效能筆電/i5-1135G7/16G(8G+8G)/512G PCIe/15.6吋FHD IPS/W11【筆電高興', '22299', 'https://www.sinya.com.tw/prod/173976'),
('【16G優規升級版】acer Aspire5 A514-54G-50R0 群青藍 宏碁高效能筆電/i5-1135G7/MX350 2G/16G(8G+8G)/512G PCIe/14吋 FHD IPS', '22299', 'https://www.sinya.com.tw/prod/173560'),
('【16G優規升級版】acer Aspire5 A514-54G-59R4 雅痞黑 宏碁高效能筆電/i5-1135G7/MX350 2G/16G(8G+8G)/512G PCIe/14吋FHD IPS/', '22299', 'https://www.sinya.com.tw/prod/173561'),
('DELL Inspiron 15-3525-R1508STW 戴爾輕薄銀河星跡 R5-5625U/8G/256G PCIe/15.6吋FHD/W11/2年保固/Inspiron 15 3000系列', '21990', 'https://www.sinya.com.tw/prod/173580'),
('【高速SSD雙碟版】acer Aspire5 A514-54G-50TQ 質感金 宏碁認證高效能/i5-1135G7/MX350 2G/8G/500G 高速PCIe SSD+1TB/14吋FHD IP', '21988', 'https://www.sinya.com.tw/prod/172115'),
('【高速SSD雙碟版】acer Aspire5 A514-54G-589P 神秘銀 宏碁認證高效能/i5-1135G7/MX350 2G/8G/500G 高速PCIe SSD+1TB/14吋FHD IP', '21988', 'https://www.sinya.com.tw/prod/172116'),
('【16G優規雙碟版】acer Aspire5 A514-54G-56X3 質感金 宏碁高效能筆電/i5-1135G7/MX350 2G/16G(8G+8G)/500G 高速PCIe SSD+1TB/1', '21988', 'https://www.sinya.com.tw/prod/172186'),
('【16G優規雙碟版】acer Aspire5 A514-54G-521D 煙燻粉 宏碁高效能筆電/i5-1135G7/MX350 2G/16G(8G+8G)/500G 高速PCIe SSD+1TB/1', '21988', 'https://www.sinya.com.tw/prod/172187'),
('【16G優規雙碟版】acer Aspire5 A514-54G-57N6 雅痞黑 宏碁高效能筆電/i5-1135G7/MX350 2G/16G(8G+8G)/500G 高速PCIe SSD+1TB/1', '21988', 'https://www.sinya.com.tw/prod/172188'),
('【16G優規雙碟版】acer Aspire5 A514-54G-597W 群青藍 宏碁高效能筆電/i5-1135G7/MX350 2G/16G(8G+8G)/500G 高速PCIe SSD+1TB/1', '21988', 'https://www.sinya.com.tw/prod/172189'),
('MSI Modern 15 A5M-092TW 石墨灰 微星超輕薄筆電/R7-5700U/8G/512G PCIe/15.6吋FHD/W11/白色背光鍵盤/含包包及滑鼠', '21900', 'https://www.sinya.com.tw/prod/167441'),
('MSI Modern 15 A11MU-1028TW 石墨灰 微星超輕薄筆電/i5-1155G7/8G/512G PCIe/15.6吋FHD/W11/白色背光鍵盤', '21900', 'https://www.sinya.com.tw/prod/174157'),
('acer Aspire5 A514-54G-50TQ 質感金 宏碁高效能筆電/i5-1135G7/MX350 2G/8G/1TB/14吋FHD IPS/W11', '21900', 'https://www.sinya.com.tw/prod/169818'),
('acer Aspire5 A514-54G-57N6 雅痞黑 宏碁高效能筆電/i5-1135G7/MX350 2G/8G/1TB/14吋FHD IPS/W10/含acer原廠包包及滑鼠', '21900', 'https://www.sinya.com.tw/prod/155998'),
('acer Aspire5 A514-54G-521D 煙燻粉 宏碁高效能筆電/i5-1135G7/MX350 2G/8G/1TB/14吋FHD IPS/W10/含acer原廠包包及滑鼠【福利品出清】【', '21900', 'https://www.sinya.com.tw/prod/155999'),
('acer Aspire5 A514-54G-56X3 質感金 宏碁高效能筆電/i5-1135G7/MX350 2G/8G/1TB/14吋FHD IPS/W10/含acer原廠包包及滑鼠', '21900', 'https://www.sinya.com.tw/prod/156000'),
('acer Aspire5 A514-54G-597W 群青藍 宏碁高效能筆電/i5-1135G7/MX350 2G/8G/1TB/14吋FHD IPS/W10/含acer原廠包包及滑鼠【福利品】', '21900', 'https://www.sinya.com.tw/prod/156001'),
('acer Aspire5 A514-54G-50R0 群青藍 宏碁高效能筆電/i5-1135G7/MX350 2G/8G/512G PCIe/14吋 FHD IPS/W11', '21900', 'https://www.sinya.com.tw/prod/173421'),
('acer Aspire5 A514-54G-589P 神秘銀 宏碁高效能筆電/i5-1135G7/MX350 2G/8G/1TB/14吋FHD IPS/W11', '21900', 'https://www.sinya.com.tw/prod/171392'),
('acer Aspire5 A514-54G-58HW 神秘銀 宏碁高效能筆電/i5-1135G7/MX350 2G/8G/512G PCIe/14吋FHD IPS/W11', '21900', 'https://www.sinya.com.tw/prod/171394'),
('acer Aspire5 A514-54G-59R4 雅痞黑 宏碁高效能筆電/i5-1135G7/MX350 2G/8G/512G PCIe/14吋FHD IPS/W11', '21900', 'https://www.sinya.com.tw/prod/171395'),
('acer Aspire3 A315-58G-585X 湖水藍 宏碁獨顯效能型筆電/i5-1135G7/MX350 2G/8G/1TB+256G PCIE/15.6吋 FHD/W11【福利品出清】【福利', '20999', 'https://www.sinya.com.tw/prod/171126'),
('acer Aspire5 A515-56-5422 神祕銀 宏碁高效能筆電/i5-1135G7/8G/512G PCIe/15.6吋FHD IPS/W11', '20900', 'https://www.sinya.com.tw/prod/173695'),
('acer Aspire5 A515-56-50L0 雅痞黑 宏碁高效能筆電/i5-1135G7/8G/512G PCIe/15.6吋FHD IPS/W11', '20900', 'https://www.sinya.com.tw/prod/173696'),
('ASUS X515EA-0171S1135G7 冰柱銀 華碩戰鬥版筆電/i5-1135G7/8G/512G PCIe/15.6吋IPS FHD/W11', '20900', 'https://www.sinya.com.tw/prod/169345'),
('ASUS X515EA-0271G1135G7 星空灰 華碩戰鬥版筆電/i5-1135G7/8G/512G PCIe/15.6吋IPS FHD/W11', '20900', 'https://www.sinya.com.tw/prod/169346'),
('ASUS Laptop X415EA-0341G1135G7 星空灰 華碩窄邊框戰鬥版筆電/i5-1135G7/8G/512G PCIe/14吋 IPS FHD/W11', '20900', 'https://www.sinya.com.tw/prod/170394'),
('ASUS Laptop X415EA-0351S1135G7 冰柱銀 華碩窄邊框戰鬥版筆電/i5-1135G7/8G/512G PCIe/14吋 IPS FHD/W11', '20900', 'https://www.sinya.com.tw/prod/171707'),
('ASUS Laptop X415EA-0131G1135G7 星空灰 華碩窄邊框戰鬥版筆電/i5-1135G7/8G/512G PCIe/14吋 IPS FHD/W10', '20900', 'https://www.sinya.com.tw/prod/162749'),
('ASUS Laptop X415EA-0151S1135G7 冰柱銀 華碩窄邊框戰鬥版筆電/i5-1135G7/8G/512G PCIe/14吋 IPS FHD/W10【福利品出清】【福利品】', '20900', 'https://www.sinya.com.tw/prod/162750'),
('MSI Modern 14 B11M-697TW 石墨灰 微星超輕薄筆電/i5-1155G7/8G/Iris Xe/512G PCIe/14吋FHD/W11背光鍵盤背光鍵盤/含原廠包包及滑鼠', '20500', 'https://www.sinya.com.tw/prod/171243'),
('【16G升級版】MSI Modern 14 B5M-067TW 石墨灰 微星超輕薄筆電/R5-5500U/8G+8G/256G PCIe/14吋FHD/W11/白色背光鍵盤【筆電高興價】', '20250', 'https://www.sinya.com.tw/prod/171357'),
('【輕薄990g的自由 軍規符合】GIGABYTE U4 UD-50TW823SO 技嘉990克輕薄型動派筆電/i5-1155G7/Iris Xe/16G(8G*2)/512G SSD/14吋FHD/W', '19999', 'https://www.sinya.com.tw/prod/170208'),
('【贈1TB外接硬碟】HUAWEI MateBook D15 深空灰/i5-10210U/8G/512G PCIe/15.6吋FHD IPS/W10/2年保【筆電高興價】', '19900', 'https://www.sinya.com.tw/prod/173953'),
('ASUS X515EP-0151G1135G7 星空灰 華碩四邊窄框輕薄筆電/i5-1135G7/MX330 2G/8G/512G PCie/15.6吋FHD IPS/W10【福利品出清】【福利品】', '19900', 'https://www.sinya.com.tw/prod/162753'),
('HUAWEI MateBook D15 深空灰/i5-10210U/8G/512G PCIe/15.6吋FHD IPS/W10/2年保', '19900', 'https://www.sinya.com.tw/prod/169457'),
('dynabook Satellite CS50L-JW 雪漾白 文書效能筆電/i5-1135G7/8G/512G SSD/15吋FHD/W10/1年保/PYS45T-004002/原Toshiba', '19888', 'https://www.sinya.com.tw/prod/167725'),
('dynabook Satellite CS50L-JB 黑曜藍 文書效能筆電/i5-1135G7/8G/512G SSD/15吋FHD/W10/1年保/PYS45T-006002/原Toshiba', '19888', 'https://www.sinya.com.tw/prod/172514'),
('dynabook CS40L-JW 雪漾白 文書效能筆電/i5-1135G7/8G/512G SSD/14吋FHD/W11/1年保/PYS48T-004002/原Toshiba', '19888', 'https://www.sinya.com.tw/prod/172519'),
('MSI Modern 14 B5M-067TW 石墨灰 微星超輕薄筆電/R5-5500U/8G/256G PCIe/14吋FHD/W11/白色背光鍵盤/含包包及滑鼠', '19500', 'https://www.sinya.com.tw/prod/167438'),
('dynabook Satellite CS50L-HW 雪漾白 文書效能筆電/i5-1035G1/8G/256G SSD/15吋FHD/W10/3年保/PYS35T-00F00D/原Toshiba', '18999', 'https://www.sinya.com.tw/prod/164871'),
('【日式傳統工藝美學】VAIO E15 原錫銀日系輕薄效能筆電/R7-3700U/8G/512G SSD/15.6吋 FHD/W10/NE15V2TW027P/含原廠包包', '18999', 'https://www.sinya.com.tw/prod/162077'),
('【日式傳統工藝美學】VAIO E15 石墨黑日系輕薄效能筆電/R7-3700U/8G/512G SSD/15.6吋 FHD/W10/NE15V2TW056P-026P/含原廠包包', '18999', 'https://www.sinya.com.tw/prod/164757'),
('【二合一OLED平板電腦+Office365】ASUS Vivobook 13 Slate OLED T3300KA-0112KN6000 酷潮黑 華碩二合一平板電腦+Office365 一年/N60', '18990', 'https://www.sinya.com.tw/prod/168517'),
('ASUS Laptop X712EA-0028S7505 冰河銀 華碩窄邊框文書筆電/Intel Pentium Gold 7505/8G/256G PCIe/17.3吋IPS FHD/W11/附HD', '18900', 'https://www.sinya.com.tw/prod/172811'),
('HP 240 G8 沈穩黑 惠普輕薄窄邊商用筆電/i3-1125G4/4G/128G SSD/14吋 HD/W10 Pro/1-1-0/4E4B7PA', '18900', 'https://www.sinya.com.tw/prod/174125'),
('Lenovo IdeaPad Slim3 14ITL05 鉑銀灰 聯想輕薄筆電/i5-1135G7/Iris Xe/8G/512G SSD/14吋 FHD IPS/W11/2年保/含休閒後背包', '18900', 'https://www.sinya.com.tw/prod/169430'),
('Lenovo IdeaPad Slim3 14ITL05 深邃藍 聯想輕薄筆電/i5-1135G7/8G/512G SSD/14吋 FHD/W11/2年保/含休閒後背包/81X700DYTW', '18900', 'https://www.sinya.com.tw/prod/169431'),
('【原TOSHIBA 三年保固 W10-PRO】dynabook Satellite PRO C40-H 黑曜藍商務效能筆電/i5-1035G1/8G/512G SSD/14吋 FHD/W10-PRO/', '18800', 'https://www.sinya.com.tw/prod/162043'),
('HP 240 G9 沈穩黑 惠普輕薄窄邊商用筆電/N4500/4G/256G PCIe/14吋 HD/W11/1-1-0/6E3X9PA', '18060', 'https://www.sinya.com.tw/prod/174123'),
('AVITA LIBER V14 蔚天藍鋁合金版纖薄型筆電/i5-1135G7/8G/512G SSD/14吋FHD IPS/W10【福利品出清】【福利品】', '17999', 'https://www.sinya.com.tw/prod/162343'),
('AVITA LIBER V14 柔薇紫鋁合金版纖薄型筆電/i5-1135G7/8G/512G SSD/14吋FHD IPS/W10/【福利品出清】【福利品】', '17999', 'https://www.sinya.com.tw/prod/162344'),
('AVITA LIBER V14 珊貝啡鋁合金版纖薄型筆電/i5-1135G7/8G/512G SSD/14吋FHD IPS/W10/', '17999', 'https://www.sinya.com.tw/prod/162689'),
('AVITA LIBER V14 盛夏粉鋁合金版纖薄型筆電/i5-1135G7/8G/512G SSD/14吋FHD IPS/W10', '17999', 'https://www.sinya.com.tw/prod/168135'),
('acer Aspire3 A317-33-P8YJ 神祕銀 宏碁超值大螢幕文書機/N6000/8G/512G SSD/17.3吋FHD IPS/W11', '17900', 'https://www.sinya.com.tw/prod/169855'),
('【16G豪華雙碟版】acer Aspire3 A315-35-P5UZ 神祕銀 宏碁超值文書筆電/N6000四核/16G(8G+8G)/1TB 高速PCIe SSD+1TB/15.6吋 FHD/W11', '17390', 'https://www.sinya.com.tw/prod/174272'),
('dynabook Satellite CS40L-H 黑曜藍文書效能筆電/i5-1035G1/8G/512G SSD/14吋FHD/W10/3年保/PYS38T-00F002/原Toshiba', '16999', 'https://www.sinya.com.tw/prod/161778'),
('【超激省】480G SSD+8G dynabook Satellite PRO C40-H 黑曜藍/i3-1005G1/8G/480G SSD/14吋HD/W10/3年保/原Toshiba【筆電高興價', '16900', 'https://www.sinya.com.tw/prod/163371'),
('dynabook Satellite PRO C40-H 黑曜藍/i3-1005G1/16G/128G SSD/14吋HD/W10/3年保/原Toshiba【16G特仕版】', '16900', 'https://www.sinya.com.tw/prod/166465'),
('acer Swift1 SF114-34-C2QF 質感金 8G版 宏碁超值輕薄筆電/N5100/8G/512G PCIe/14吋FHD IPS/W11/含acer原廠包包及滑鼠', '16900', 'https://www.sinya.com.tw/prod/173699'),
('acer Swift1 SF114-34-C3GM 鈦空銀 8G版 宏碁超值輕薄筆電/N5100/8G/512G PCIe/14吋FHD IPS/W11/含acer原廠包包及滑鼠', '16900', 'https://www.sinya.com.tw/prod/173700'),
('acer Swift1 SF114-34-C6DR 甜心粉 8G版 宏碁超值輕薄筆電/N5100/8G/512G PCIe/14吋FHD IPS/W11/含acer原廠包包及滑鼠', '16900', 'https://www.sinya.com.tw/prod/173701'),
('acer Swift1 SF114-34-C3V2 彩虹銀 8G版 宏碁超值輕薄筆電/N5100/8G/512G PCIe/14吋FHD IPS/W11/含acer原廠包包及滑鼠', '16900', 'https://www.sinya.com.tw/prod/173702'),
('acer Aspire3 A315-57-50TZ 深夜黑 宏碁超值效能型筆電/i5-1035G1/8G/512G PCIe/15.6吋 FHD/W11', '16900', 'https://www.sinya.com.tw/prod/174275'),
('【1TB PCIe 雙碟版】acer Aspire3 A315-35-P5UZ 神祕銀 宏碁超值文書筆電/N6000四核/8G/1TB 高速PCIe SSD+1TB/15.6吋 FHD/W11【筆電高', '16610', 'https://www.sinya.com.tw/prod/171983'),
('【16G優規雙碟版】acer Aspire3 A315-35-P5UZ 神祕銀 宏碁超值文書筆電/N6000四核/16G(8G+8G)/500G 高速PCIe SSD+1TB/15.6吋 FHD/W1', '16519', 'https://www.sinya.com.tw/prod/172217'),
('dynabook Satellite CS50L-HW 雪漾白 文書效能筆電/i3-1005G1/8G/256G SSD/15吋FHD/W10/3年保/PYS35T-00E00D/原Toshiba', '15999', 'https://www.sinya.com.tw/prod/165296'),
('acer Aspire3 A315-35-P5UZ 神祕銀 宏碁超值文書筆電/N6000四核/8G/1TB/15.6吋 FHD/W11', '15900', 'https://www.sinya.com.tw/prod/169846'),
('acer Swift1 SF114-34-C6CQ 質感金 8G版 宏碁超值輕薄筆電/N5100/8G/256G PCIe/14吋FHD IPS/W11/含acer原廠包包及滑鼠', '15900', 'https://www.sinya.com.tw/prod/170460'),
('acer Swift1 SF114-34-C98J 鈦空銀 8G版 宏碁超值輕薄筆電/N5100/8G/256G PCIe/14吋FHD IPS/W11/含acer原廠包包及滑鼠', '15900', 'https://www.sinya.com.tw/prod/170478'),
('acer Swift1 SF114-34-C9ZV 甜心粉 8G版 宏碁超值輕薄筆電/N5100/8G/256G PCIe/14吋FHD IPS/W11/含acer原廠包包及滑鼠', '15900', 'https://www.sinya.com.tw/prod/170479'),
('acer Swift1 SF114-34-C04D 彩虹銀 8G版 宏碁超值輕薄筆電/N5100/8G/256G PCIe/14吋FHD IPS/W11/含acer原廠包包及滑鼠', '15900', 'https://www.sinya.com.tw/prod/170480'),
('【高速SSD雙碟版】acer Aspire3 A315-35-P5UZ 神祕銀 宏碁超值文書筆電/N6000四核/8G/500G 高速PCIe SSD+1TB/15.6吋 FHD/W11【筆電高興價】', '15739', 'https://www.sinya.com.tw/prod/172119'),
('ASUS Laptop X515KA-0201GN5100 星空灰 華碩戰鬥版筆電/Intel Celeron N5100/4G/256GB PCIe/15.6吋IPS FHD窄邊框/W11', '14900', 'https://www.sinya.com.tw/prod/171785'),
('【3年國內到府維修】ASUS ExpertBook BM1400CDA-0061A3250U 商用筆電/R3-3250U/8G/256GB PCIe/14吋 FHD/W10pro/3年保固/含包包、滑', '14888', 'https://www.sinya.com.tw/prod/164786'),
('【原TOSHIBA 三年保固】dynabook Satellite PRO C40-H 黑曜藍文書效能筆電/i3-1005G1/4G/128G SSD/14吋HD/W10', '13900', 'https://www.sinya.com.tw/prod/161923'),
('【3年國內到府維修】ASUS BR1100FKA-0041AN5100 華碩 防疫 居家 商務筆電筆電/N5100/8G/128G/11.6吋 HD/W10/3年到府維修/含滑鼠及收納包', '12490', 'https://www.sinya.com.tw/prod/165400'),
('【追劇好伙伴 停課不停學】ASUS Chromebook CM3000DVA-0031AMT8183 華碩 防疫 居家 商務筆電/MediaTek 8183/4G/128G/10.5吋 WUXG/含鍵', '11880', 'https://www.sinya.com.tw/prod/164944'),
('金士頓 HyperX Cloud Orbit S電競耳機/有線/3D音效/頭部追蹤/100mm磁性單體', '11500', 'https://www.sinya.com.tw/prod/152084');

-- --------------------------------------------------------

--
-- 資料表結構 `sinya_stu`
--

DROP TABLE IF EXISTS `sinya_stu`;
CREATE TABLE `sinya_stu` (
  `sinya_stu_url` varchar(100) NOT NULL,
  `sinya_stu_price` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 資料表新增資料前，先清除舊資料 `sinya_stu`
--

TRUNCATE TABLE `sinya_stu`;
--
-- 傾印資料表的資料 `sinya_stu`
--

INSERT INTO `sinya_stu` (`sinya_stu_url`, `sinya_stu_price`) VALUES
('https://www.sinya.com.tw/prod/174226', '192000'),
('https://www.sinya.com.tw/prod/168404', '148000'),
('https://www.sinya.com.tw/prod/171468', '130000'),
('https://www.sinya.com.tw/prod/173293', '130000'),
('https://www.sinya.com.tw/prod/172325', '127000'),
('https://www.sinya.com.tw/prod/174225', '127000'),
('https://www.sinya.com.tw/prod/174230', '119000'),
('https://www.sinya.com.tw/prod/172330', '117777'),
('https://www.sinya.com.tw/prod/173431', '115555'),
('https://www.sinya.com.tw/prod/169502', '110990'),
('https://www.sinya.com.tw/prod/174224', '109000'),
('https://www.sinya.com.tw/prod/173252', '108500'),
('https://www.sinya.com.tw/prod/169497', '106900'),
('https://www.sinya.com.tw/prod/173964', '105000'),
('https://www.sinya.com.tw/prod/166500', '98888'),
('https://www.sinya.com.tw/prod/174229', '99000'),
('https://www.sinya.com.tw/prod/169501', '92990'),
('https://www.sinya.com.tw/prod/169504', '83990'),
('https://www.sinya.com.tw/prod/174228', '93000'),
('https://www.sinya.com.tw/prod/169496', '91990'),
('https://www.sinya.com.tw/prod/172316', '90500'),
('https://www.sinya.com.tw/prod/172007', '90888'),
('https://www.sinya.com.tw/prod/173966', '88888'),
('https://www.sinya.com.tw/prod/172418', '87900'),
('https://www.sinya.com.tw/prod/170227', '88888'),
('https://www.sinya.com.tw/prod/174223', '87000'),
('https://www.sinya.com.tw/prod/173294', '83900'),
('https://www.sinya.com.tw/prod/168403', '84000'),
('https://www.sinya.com.tw/prod/170225', '82900'),
('https://www.sinya.com.tw/prod/172790', '79900'),
('https://www.sinya.com.tw/prod/170224', '81888'),
('https://www.sinya.com.tw/prod/172420', '78000'),
('https://www.sinya.com.tw/prod/174222', '79000'),
('https://www.sinya.com.tw/prod/168400', '78500'),
('https://www.sinya.com.tw/prod/168401', '78500'),
('https://www.sinya.com.tw/prod/168402', '78500'),
('https://www.sinya.com.tw/prod/169500', '68990'),
('https://www.sinya.com.tw/prod/174227', '77000'),
('https://www.sinya.com.tw/prod/160676', '75900'),
('https://www.sinya.com.tw/prod/170229', '75888'),
('https://www.sinya.com.tw/prod/174220', '75000'),
('https://www.sinya.com.tw/prod/169503', '69990'),
('https://www.sinya.com.tw/prod/170664', '72900'),
('https://www.sinya.com.tw/prod/168552', '70900'),
('https://www.sinya.com.tw/prod/163806', '68900'),
('https://www.sinya.com.tw/prod/171782', '66900'),
('https://www.sinya.com.tw/prod/171604', '64900'),
('https://www.sinya.com.tw/prod/174219', '65000'),
('https://www.sinya.com.tw/prod/162566', '62888'),
('https://www.sinya.com.tw/prod/166157', '62900'),
('https://www.sinya.com.tw/prod/164061', '62888'),
('https://www.sinya.com.tw/prod/160677', '62800'),
('https://www.sinya.com.tw/prod/160675', '61000'),
('https://www.sinya.com.tw/prod/172407', '59900'),
('https://www.sinya.com.tw/prod/174216', '61000'),
('https://www.sinya.com.tw/prod/174142', '60500'),
('https://www.sinya.com.tw/prod/173397', '59900'),
('https://www.sinya.com.tw/prod/172884', '58500'),
('https://www.sinya.com.tw/prod/173694', '59000'),
('https://www.sinya.com.tw/prod/174217', '59000'),
('https://www.sinya.com.tw/prod/171943', '58900'),
('https://www.sinya.com.tw/prod/171948', '58888'),
('https://www.sinya.com.tw/prod/171462', '59000'),
('https://www.sinya.com.tw/prod/171212', '59000'),
('https://www.sinya.com.tw/prod/173879', '57900'),
('https://www.sinya.com.tw/prod/172453', '58900'),
('https://www.sinya.com.tw/prod/167855', '57999'),
('https://www.sinya.com.tw/prod/167856', '57500'),
('https://www.sinya.com.tw/prod/171784', '54900'),
('https://www.sinya.com.tw/prod/166233', '56666'),
('https://www.sinya.com.tw/prod/172123', '55900'),
('https://www.sinya.com.tw/prod/171603', '53500'),
('https://www.sinya.com.tw/prod/173693', '56000'),
('https://www.sinya.com.tw/prod/163735', '54500'),
('https://www.sinya.com.tw/prod/172735', '55888'),
('https://www.sinya.com.tw/prod/171593', '51900'),
('https://www.sinya.com.tw/prod/173940', '55000'),
('https://www.sinya.com.tw/prod/172944', '54900'),
('https://www.sinya.com.tw/prod/171783', '54900'),
('https://www.sinya.com.tw/prod/157796', '54000'),
('https://www.sinya.com.tw/prod/162701', '52900'),
('https://www.sinya.com.tw/prod/168336', '53900'),
('https://www.sinya.com.tw/prod/162846', '53888'),
('https://www.sinya.com.tw/prod/164906', '53800'),
('https://www.sinya.com.tw/prod/171583', '52900'),
('https://www.sinya.com.tw/prod/171179', '53888'),
('https://www.sinya.com.tw/prod/171781', '50900'),
('https://www.sinya.com.tw/prod/174214', '52000'),
('https://www.sinya.com.tw/prod/174215', '52000'),
('https://www.sinya.com.tw/prod/174218', '52000'),
('https://www.sinya.com.tw/prod/174221', '52000'),
('https://www.sinya.com.tw/prod/163795', '47800'),
('https://www.sinya.com.tw/prod/162845', '50888'),
('https://www.sinya.com.tw/prod/157795', '51000'),
('https://www.sinya.com.tw/prod/172945', '50888'),
('https://www.sinya.com.tw/prod/165625', '50888'),
('https://www.sinya.com.tw/prod/169697', '51888'),
('https://www.sinya.com.tw/prod/159479', '47900'),
('https://www.sinya.com.tw/prod/170231', '49999'),
('https://www.sinya.com.tw/prod/159480', '47900'),
('https://www.sinya.com.tw/prod/174154', '49700'),
('https://www.sinya.com.tw/prod/174155', '49000'),
('https://www.sinya.com.tw/prod/171608', '49000'),
('https://www.sinya.com.tw/prod/157550', '49999'),
('https://www.sinya.com.tw/prod/171788', '48500'),
('https://www.sinya.com.tw/prod/174231', '49000'),
('https://www.sinya.com.tw/prod/169367', '49390'),
('https://www.sinya.com.tw/prod/174153', '48500'),
('https://www.sinya.com.tw/prod/174134', '48500'),
('https://www.sinya.com.tw/prod/174141', '48500'),
('https://www.sinya.com.tw/prod/174152', '47900'),
('https://www.sinya.com.tw/prod/169337', '44900'),
('https://www.sinya.com.tw/prod/172513', '46900'),
('https://www.sinya.com.tw/prod/162881', '47999'),
('https://www.sinya.com.tw/prod/173340', '47500'),
('https://www.sinya.com.tw/prod/173341', '47500'),
('https://www.sinya.com.tw/prod/161851', '45500'),
('https://www.sinya.com.tw/prod/162699', '47500'),
('https://www.sinya.com.tw/prod/163796', '44500'),
('https://www.sinya.com.tw/prod/164628', '46000'),
('https://www.sinya.com.tw/prod/172906', '44500'),
('https://www.sinya.com.tw/prod/172732', '45900'),
('https://www.sinya.com.tw/prod/172005', '45900'),
('https://www.sinya.com.tw/prod/165561', '45000'),
('https://www.sinya.com.tw/prod/165562', '45000'),
('https://www.sinya.com.tw/prod/165563', '45000'),
('https://www.sinya.com.tw/prod/172831', '45500'),
('https://www.sinya.com.tw/prod/157791', '45000'),
('https://www.sinya.com.tw/prod/173692', '45500'),
('https://www.sinya.com.tw/prod/171477', '43500'),
('https://www.sinya.com.tw/prod/173094', '43650'),
('https://www.sinya.com.tw/prod/171601', '43500'),
('https://www.sinya.com.tw/prod/162700', '42900'),
('https://www.sinya.com.tw/prod/172252', '42900'),
('https://www.sinya.com.tw/prod/170210', '43888'),
('https://www.sinya.com.tw/prod/173876', '43888'),
('https://www.sinya.com.tw/prod/173955', '43990'),
('https://www.sinya.com.tw/prod/170892', '43990'),
('https://www.sinya.com.tw/prod/174140', '43500'),
('https://www.sinya.com.tw/prod/174252', '43000'),
('https://www.sinya.com.tw/prod/172736', '42500'),
('https://www.sinya.com.tw/prod/159187', '43000'),
('https://www.sinya.com.tw/prod/159273', '42900'),
('https://www.sinya.com.tw/prod/174135', '42500'),
('https://www.sinya.com.tw/prod/174138', '42500'),
('https://www.sinya.com.tw/prod/157782', '42500'),
('https://www.sinya.com.tw/prod/161627', '39999'),
('https://www.sinya.com.tw/prod/172405', '39900'),
('https://www.sinya.com.tw/prod/169338', '39900'),
('https://www.sinya.com.tw/prod/172454', '42500'),
('https://www.sinya.com.tw/prod/174131', '41500'),
('https://www.sinya.com.tw/prod/157858', '39800'),
('https://www.sinya.com.tw/prod/160886', '38500'),
('https://www.sinya.com.tw/prod/163805', '40900'),
('https://www.sinya.com.tw/prod/161664', '39900'),
('https://www.sinya.com.tw/prod/174235', '37900'),
('https://www.sinya.com.tw/prod/169897', '37900'),
('https://www.sinya.com.tw/prod/165565', '39000'),
('https://www.sinya.com.tw/prod/167232', '37500'),
('https://www.sinya.com.tw/prod/171097', '37500'),
('https://www.sinya.com.tw/prod/170670', '37700'),
('https://www.sinya.com.tw/prod/163539', '37900'),
('https://www.sinya.com.tw/prod/173785', '37500'),
('https://www.sinya.com.tw/prod/173786', '37900'),
('https://www.sinya.com.tw/prod/166381', '38900'),
('https://www.sinya.com.tw/prod/167857', '38900'),
('https://www.sinya.com.tw/prod/173337', '38500'),
('https://www.sinya.com.tw/prod/173097', '38500'),
('https://www.sinya.com.tw/prod/173795', '38500'),
('https://www.sinya.com.tw/prod/174193', '38500'),
('https://www.sinya.com.tw/prod/172457', '38500'),
('https://www.sinya.com.tw/prod/172734', '37900'),
('https://www.sinya.com.tw/prod/159188', '38000'),
('https://www.sinya.com.tw/prod/166386', '37800'),
('https://www.sinya.com.tw/prod/172077', '37500'),
('https://www.sinya.com.tw/prod/169021', '36888'),
('https://www.sinya.com.tw/prod/169339', '37500'),
('https://www.sinya.com.tw/prod/173783', '35900'),
('https://www.sinya.com.tw/prod/173787', '36900'),
('https://www.sinya.com.tw/prod/169335', '37641'),
('https://www.sinya.com.tw/prod/170230', '36888'),
('https://www.sinya.com.tw/prod/174130', '36500'),
('https://www.sinya.com.tw/prod/172436', '36500'),
('https://www.sinya.com.tw/prod/171607', '34500'),
('https://www.sinya.com.tw/prod/169569', '35900'),
('https://www.sinya.com.tw/prod/169571', '35900'),
('https://www.sinya.com.tw/prod/172917', '34900'),
('https://www.sinya.com.tw/prod/173454', '34500'),
('https://www.sinya.com.tw/prod/165282', '32800'),
('https://www.sinya.com.tw/prod/169695', '36900'),
('https://www.sinya.com.tw/prod/169696', '36900'),
('https://www.sinya.com.tw/prod/167293', '35999'),
('https://www.sinya.com.tw/prod/173315', '35500'),
('https://www.sinya.com.tw/prod/173099', '35500'),
('https://www.sinya.com.tw/prod/171780', '33900'),
('https://www.sinya.com.tw/prod/164196', '34900'),
('https://www.sinya.com.tw/prod/169840', '35500'),
('https://www.sinya.com.tw/prod/163215', '33900'),
('https://www.sinya.com.tw/prod/167616', '34500'),
('https://www.sinya.com.tw/prod/169982', '35700'),
('https://www.sinya.com.tw/prod/171655', '35250'),
('https://www.sinya.com.tw/prod/167081', '35500'),
('https://www.sinya.com.tw/prod/164919', '35250'),
('https://www.sinya.com.tw/prod/164873', '34500'),
('https://www.sinya.com.tw/prod/169566', '34490'),
('https://www.sinya.com.tw/prod/165106', '34500'),
('https://www.sinya.com.tw/prod/174319', '34984'),
('https://www.sinya.com.tw/prod/168212', '32900'),
('https://www.sinya.com.tw/prod/170543', '34500'),
('https://www.sinya.com.tw/prod/167296', '34500'),
('https://www.sinya.com.tw/prod/172458', '34500'),
('https://www.sinya.com.tw/prod/162764', '29900'),
('https://www.sinya.com.tw/prod/174318', '34500'),
('https://www.sinya.com.tw/prod/160817', '33888'),
('https://www.sinya.com.tw/prod/171416', '34388'),
('https://www.sinya.com.tw/prod/160848', '32900'),
('https://www.sinya.com.tw/prod/172902', '31900'),
('https://www.sinya.com.tw/prod/173691', '33500'),
('https://www.sinya.com.tw/prod/169024', '32888'),
('https://www.sinya.com.tw/prod/162698', '32900'),
('https://www.sinya.com.tw/prod/169693', '32999'),
('https://www.sinya.com.tw/prod/170305', '32490'),
('https://www.sinya.com.tw/prod/171786', '30900'),
('https://www.sinya.com.tw/prod/171541', '31500'),
('https://www.sinya.com.tw/prod/171358', '32400'),
('https://www.sinya.com.tw/prod/169334', '31900'),
('https://www.sinya.com.tw/prod/169344', '31900'),
('https://www.sinya.com.tw/prod/170949', '31500'),
('https://www.sinya.com.tw/prod/174331', '29400'),
('https://www.sinya.com.tw/prod/174268', '32510'),
('https://www.sinya.com.tw/prod/172146', '30990'),
('https://www.sinya.com.tw/prod/167295', '31500'),
('https://www.sinya.com.tw/prod/169858', '30990'),
('https://www.sinya.com.tw/prod/167618', '30900'),
('https://www.sinya.com.tw/prod/162742', '31888'),
('https://www.sinya.com.tw/prod/167647', '31188'),
('https://www.sinya.com.tw/prod/162743', '30999'),
('https://www.sinya.com.tw/prod/171777', '30290'),
('https://www.sinya.com.tw/prod/172957', '30290'),
('https://www.sinya.com.tw/prod/171779', '29500'),
('https://www.sinya.com.tw/prod/170301', '30400'),
('https://www.sinya.com.tw/prod/170303', '30400'),
('https://www.sinya.com.tw/prod/173941', '30500'),
('https://www.sinya.com.tw/prod/162757', '29800'),
('https://www.sinya.com.tw/prod/162761', '27900'),
('https://www.sinya.com.tw/prod/164347', '30500'),
('https://www.sinya.com.tw/prod/171585', '30730'),
('https://www.sinya.com.tw/prod/167881', '30050'),
('https://www.sinya.com.tw/prod/169025', '29999'),
('https://www.sinya.com.tw/prod/169026', '29999'),
('https://www.sinya.com.tw/prod/171406', '29688'),
('https://www.sinya.com.tw/prod/171407', '29750'),
('https://www.sinya.com.tw/prod/167880', '29450'),
('https://www.sinya.com.tw/prod/171778', '28900'),
('https://www.sinya.com.tw/prod/173855', '29900'),
('https://www.sinya.com.tw/prod/170545', '29500'),
('https://www.sinya.com.tw/prod/170302', '29400'),
('https://www.sinya.com.tw/prod/172122', '27200'),
('https://www.sinya.com.tw/prod/170336', '29900'),
('https://www.sinya.com.tw/prod/170344', '29900'),
('https://www.sinya.com.tw/prod/172406', '27200'),
('https://www.sinya.com.tw/prod/163763', '28900'),
('https://www.sinya.com.tw/prod/171705', '27200'),
('https://www.sinya.com.tw/prod/173789', '27900'),
('https://www.sinya.com.tw/prod/173802', '28900'),
('https://www.sinya.com.tw/prod/169458', '29500'),
('https://www.sinya.com.tw/prod/171255', '29900'),
('https://www.sinya.com.tw/prod/170304', '29888'),
('https://www.sinya.com.tw/prod/172952', '28888'),
('https://www.sinya.com.tw/prod/171941', '29000'),
('https://www.sinya.com.tw/prod/170205', '28888'),
('https://www.sinya.com.tw/prod/170992', '29000'),
('https://www.sinya.com.tw/prod/170511', '29280'),
('https://www.sinya.com.tw/prod/167879', '28750'),
('https://www.sinya.com.tw/prod/171506', '28750'),
('https://www.sinya.com.tw/prod/172124', '28999'),
('https://www.sinya.com.tw/prod/170422', '28500'),
('https://www.sinya.com.tw/prod/171787', '27500'),
('https://www.sinya.com.tw/prod/171303', '28900'),
('https://www.sinya.com.tw/prod/170544', '28000'),
('https://www.sinya.com.tw/prod/172901', '27900'),
('https://www.sinya.com.tw/prod/157805', '28500'),
('https://www.sinya.com.tw/prod/169838', '28500'),
('https://www.sinya.com.tw/prod/170952', '26900'),
('https://www.sinya.com.tw/prod/170953', '26900'),
('https://www.sinya.com.tw/prod/173792', '27500'),
('https://www.sinya.com.tw/prod/163820', '26900'),
('https://www.sinya.com.tw/prod/162303', '28900'),
('https://www.sinya.com.tw/prod/165288', '28888'),
('https://www.sinya.com.tw/prod/172741', '28888'),
('https://www.sinya.com.tw/prod/171228', '27888'),
('https://www.sinya.com.tw/prod/171232', '27888'),
('https://www.sinya.com.tw/prod/171233', '27888'),
('https://www.sinya.com.tw/prod/165638', '27800'),
('https://www.sinya.com.tw/prod/171364', '28800'),
('https://www.sinya.com.tw/prod/167877', '28000'),
('https://www.sinya.com.tw/prod/167878', '27990'),
('https://www.sinya.com.tw/prod/171505', '27500'),
('https://www.sinya.com.tw/prod/155968', '27999'),
('https://www.sinya.com.tw/prod/162284', '27999'),
('https://www.sinya.com.tw/prod/170481', '27999'),
('https://www.sinya.com.tw/prod/173335', '27500'),
('https://www.sinya.com.tw/prod/169406', '26990'),
('https://www.sinya.com.tw/prod/171350', '26900'),
('https://www.sinya.com.tw/prod/173451', '26900'),
('https://www.sinya.com.tw/prod/156321', '26900'),
('https://www.sinya.com.tw/prod/156322', '26900'),
('https://www.sinya.com.tw/prod/171706', '26900'),
('https://www.sinya.com.tw/prod/174270', '27510'),
('https://www.sinya.com.tw/prod/169512', '26999'),
('https://www.sinya.com.tw/prod/170423', '25900'),
('https://www.sinya.com.tw/prod/172145', '25888'),
('https://www.sinya.com.tw/prod/165648', '26300'),
('https://www.sinya.com.tw/prod/169845', '26500'),
('https://www.sinya.com.tw/prod/171444', '26500'),
('https://www.sinya.com.tw/prod/170950', '25800'),
('https://www.sinya.com.tw/prod/174359', '26561'),
('https://www.sinya.com.tw/prod/173881', '26199'),
('https://www.sinya.com.tw/prod/171363', '25999'),
('https://www.sinya.com.tw/prod/173334', '25500'),
('https://www.sinya.com.tw/prod/172121', '24500'),
('https://www.sinya.com.tw/prod/171610', '24500'),
('https://www.sinya.com.tw/prod/171356', '25500'),
('https://www.sinya.com.tw/prod/173917', '25900'),
('https://www.sinya.com.tw/prod/173697', '25400'),
('https://www.sinya.com.tw/prod/171695', '24500'),
('https://www.sinya.com.tw/prod/171696', '24500'),
('https://www.sinya.com.tw/prod/173796', '23900'),
('https://www.sinya.com.tw/prod/167722', '25500'),
('https://www.sinya.com.tw/prod/172509', '25000'),
('https://www.sinya.com.tw/prod/172510', '25000'),
('https://www.sinya.com.tw/prod/172511', '25000'),
('https://www.sinya.com.tw/prod/174126', '25500'),
('https://www.sinya.com.tw/prod/174271', '25610'),
('https://www.sinya.com.tw/prod/174122', '25590'),
('https://www.sinya.com.tw/prod/174361', '25299'),
('https://www.sinya.com.tw/prod/164872', '22900'),
('https://www.sinya.com.tw/prod/166446', '24700'),
('https://www.sinya.com.tw/prod/173333', '24500'),
('https://www.sinya.com.tw/prod/173788', '23500'),
('https://www.sinya.com.tw/prod/173790', '23500'),
('https://www.sinya.com.tw/prod/173791', '23500'),
('https://www.sinya.com.tw/prod/174320', '24500'),
('https://www.sinya.com.tw/prod/166905', '23900'),
('https://www.sinya.com.tw/prod/174360', '24561'),
('https://www.sinya.com.tw/prod/172254', '24542'),
('https://www.sinya.com.tw/prod/174016', '24461'),
('https://www.sinya.com.tw/prod/174017', '24461'),
('https://www.sinya.com.tw/prod/173880', '24299'),
('https://www.sinya.com.tw/prod/169472', '23688'),
('https://www.sinya.com.tw/prod/172456', '23999'),
('https://www.sinya.com.tw/prod/173583', '23500'),
('https://www.sinya.com.tw/prod/173332', '23500'),
('https://www.sinya.com.tw/prod/174124', '23500'),
('https://www.sinya.com.tw/prod/167280', '23500'),
('https://www.sinya.com.tw/prod/173698', '23500'),
('https://www.sinya.com.tw/prod/160773', '23888'),
('https://www.sinya.com.tw/prod/173116', '23588'),
('https://www.sinya.com.tw/prod/174159', '23588'),
('https://www.sinya.com.tw/prod/172247', '23762'),
('https://www.sinya.com.tw/prod/171989', '23610'),
('https://www.sinya.com.tw/prod/171990', '23610'),
('https://www.sinya.com.tw/prod/173884', '23561'),
('https://www.sinya.com.tw/prod/173885', '23561'),
('https://www.sinya.com.tw/prod/171908', '22500'),
('https://www.sinya.com.tw/prod/174358', '23299'),
('https://www.sinya.com.tw/prod/172989', '23199'),
('https://www.sinya.com.tw/prod/173562', '23199'),
('https://www.sinya.com.tw/prod/174160', '22888'),
('https://www.sinya.com.tw/prod/171944', '22788'),
('https://www.sinya.com.tw/prod/171359', '22999'),
('https://www.sinya.com.tw/prod/172455', '22999'),
('https://www.sinya.com.tw/prod/170419', '22500'),
('https://www.sinya.com.tw/prod/173582', '22500'),
('https://www.sinya.com.tw/prod/172986', '22988'),
('https://www.sinya.com.tw/prod/172987', '22988'),
('https://www.sinya.com.tw/prod/172810', '21900'),
('https://www.sinya.com.tw/prod/169781', '22500'),
('https://www.sinya.com.tw/prod/157804', '22500'),
('https://www.sinya.com.tw/prod/171397', '22500'),
('https://www.sinya.com.tw/prod/170395', '21900'),
('https://www.sinya.com.tw/prod/170396', '21900'),
('https://www.sinya.com.tw/prod/162751', '20900'),
('https://www.sinya.com.tw/prod/162752', '20900'),
('https://www.sinya.com.tw/prod/174276', '22500'),
('https://www.sinya.com.tw/prod/174277', '22500'),
('https://www.sinya.com.tw/prod/172241', '22500'),
('https://www.sinya.com.tw/prod/174321', '22500'),
('https://www.sinya.com.tw/prod/156464', '22000'),
('https://www.sinya.com.tw/prod/171227', '22000'),
('https://www.sinya.com.tw/prod/173882', '22762'),
('https://www.sinya.com.tw/prod/173883', '22762'),
('https://www.sinya.com.tw/prod/172111', '22739'),
('https://www.sinya.com.tw/prod/172112', '22739'),
('https://www.sinya.com.tw/prod/172113', '22739'),
('https://www.sinya.com.tw/prod/172114', '22739'),
('https://www.sinya.com.tw/prod/171945', '22438'),
('https://www.sinya.com.tw/prod/174158', '22388'),
('https://www.sinya.com.tw/prod/172861', '22299'),
('https://www.sinya.com.tw/prod/173975', '22299'),
('https://www.sinya.com.tw/prod/173976', '22299'),
('https://www.sinya.com.tw/prod/173560', '22299'),
('https://www.sinya.com.tw/prod/173561', '22299'),
('https://www.sinya.com.tw/prod/173580', '21500'),
('https://www.sinya.com.tw/prod/172115', '21988'),
('https://www.sinya.com.tw/prod/172116', '21988'),
('https://www.sinya.com.tw/prod/172186', '21988'),
('https://www.sinya.com.tw/prod/172187', '21988'),
('https://www.sinya.com.tw/prod/172188', '21988'),
('https://www.sinya.com.tw/prod/172189', '21988'),
('https://www.sinya.com.tw/prod/167441', '21688'),
('https://www.sinya.com.tw/prod/174157', '21688'),
('https://www.sinya.com.tw/prod/169818', '21500'),
('https://www.sinya.com.tw/prod/155998', '21500'),
('https://www.sinya.com.tw/prod/155999', '21500'),
('https://www.sinya.com.tw/prod/156000', '21500'),
('https://www.sinya.com.tw/prod/156001', '21500'),
('https://www.sinya.com.tw/prod/173421', '21500'),
('https://www.sinya.com.tw/prod/171392', '21500'),
('https://www.sinya.com.tw/prod/171394', '21500'),
('https://www.sinya.com.tw/prod/171395', '21500'),
('https://www.sinya.com.tw/prod/171126', '20999'),
('https://www.sinya.com.tw/prod/173695', '20900'),
('https://www.sinya.com.tw/prod/173696', '20900'),
('https://www.sinya.com.tw/prod/169345', '19900'),
('https://www.sinya.com.tw/prod/169346', '19900'),
('https://www.sinya.com.tw/prod/170394', '19900'),
('https://www.sinya.com.tw/prod/171707', '19900'),
('https://www.sinya.com.tw/prod/162749', '18900'),
('https://www.sinya.com.tw/prod/162750', '18900'),
('https://www.sinya.com.tw/prod/171243', '19900'),
('https://www.sinya.com.tw/prod/171357', '19750'),
('https://www.sinya.com.tw/prod/170208', '19900'),
('https://www.sinya.com.tw/prod/162753', '18900'),
('https://www.sinya.com.tw/prod/169457', '18900'),
('https://www.sinya.com.tw/prod/167725', '19000'),
('https://www.sinya.com.tw/prod/172514', '19000'),
('https://www.sinya.com.tw/prod/172519', '19000'),
('https://www.sinya.com.tw/prod/167438', '19000'),
('https://www.sinya.com.tw/prod/164871', '18500'),
('https://www.sinya.com.tw/prod/162077', '17900'),
('https://www.sinya.com.tw/prod/164757', '17900'),
('https://www.sinya.com.tw/prod/168517', '17900'),
('https://www.sinya.com.tw/prod/172811', '18500'),
('https://www.sinya.com.tw/prod/174125', '18500'),
('https://www.sinya.com.tw/prod/169430', '18500'),
('https://www.sinya.com.tw/prod/169431', '18500'),
('https://www.sinya.com.tw/prod/162043', '17900'),
('https://www.sinya.com.tw/prod/174123', '18060'),
('https://www.sinya.com.tw/prod/162343', '17500'),
('https://www.sinya.com.tw/prod/162344', '17500'),
('https://www.sinya.com.tw/prod/162689', '17500'),
('https://www.sinya.com.tw/prod/168135', '17500'),
('https://www.sinya.com.tw/prod/169855', '17200'),
('https://www.sinya.com.tw/prod/174272', '17390'),
('https://www.sinya.com.tw/prod/161778', '16500'),
('https://www.sinya.com.tw/prod/163371', '16900'),
('https://www.sinya.com.tw/prod/166465', '16700'),
('https://www.sinya.com.tw/prod/173699', '16500'),
('https://www.sinya.com.tw/prod/173700', '16500'),
('https://www.sinya.com.tw/prod/173701', '16500'),
('https://www.sinya.com.tw/prod/173702', '16500'),
('https://www.sinya.com.tw/prod/174275', '16500'),
('https://www.sinya.com.tw/prod/171983', '16610'),
('https://www.sinya.com.tw/prod/172217', '16519'),
('https://www.sinya.com.tw/prod/165296', '15500'),
('https://www.sinya.com.tw/prod/169846', '15500'),
('https://www.sinya.com.tw/prod/170460', '14900'),
('https://www.sinya.com.tw/prod/170478', '14900'),
('https://www.sinya.com.tw/prod/170479', '14900'),
('https://www.sinya.com.tw/prod/170480', '14900'),
('https://www.sinya.com.tw/prod/172119', '15739'),
('https://www.sinya.com.tw/prod/171785', '13900'),
('https://www.sinya.com.tw/prod/164786', '13800'),
('https://www.sinya.com.tw/prod/161923', '12900'),
('https://www.sinya.com.tw/prod/165400', '11900'),
('https://www.sinya.com.tw/prod/164944', '9700'),
('https://www.sinya.com.tw/prod/152084', '11500');

-- --------------------------------------------------------

--
-- 資料表結構 `specifics_yahoo`
--

DROP TABLE IF EXISTS `specifics_yahoo`;
CREATE TABLE `specifics_yahoo` (
  `nb_id` varchar(50) NOT NULL,
  `yahoo_price` int(10) NOT NULL,
  `yahoo_url` varchar(100) NOT NULL,
  `img_url` varchar(100) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `cpu` varchar(50) NOT NULL,
  `gpu` varchar(50) NOT NULL,
  `ram` varchar(50) NOT NULL,
  `slot_max` varchar(50) NOT NULL,
  `SSD` varchar(50) NOT NULL,
  `HDD` varchar(50) NOT NULL,
  `weight` varchar(50) NOT NULL,
  `inch` varchar(50) NOT NULL,
  `resolution` varchar(100) NOT NULL,
  `internet_device` varchar(100) NOT NULL,
  `battery` varchar(100) NOT NULL,
  `windows_version` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 資料表新增資料前，先清除舊資料 `specifics_yahoo`
--

TRUNCATE TABLE `specifics_yahoo`;
--
-- 傾印資料表的資料 `specifics_yahoo`
--

INSERT INTO `specifics_yahoo` (`nb_id`, `yahoo_price`, `yahoo_url`, `img_url`, `brand`, `cpu`, `gpu`, `ram`, `slot_max`, `SSD`, `HDD`, `weight`, `inch`, `resolution`, `internet_device`, `battery`, `windows_version`) VALUES
('AERO 17 YE5-A4TW748HQ', 134900, 'https://tw.buy.yahoo.com/gdsale/技嘉-GIGABYTE-AERO-17-YE5-A4TW748HQ-17-3吋筆電-i9-12900-9997059.html', 'https://s.yimg.com/zp/MerchandiseImages/7D6C204EE8-SP-11274106.jpg', 'GIGABYTE技嘉', '第12代Intel® Core  i9-12900H (2.5GHz~5GHz', 'RTX 3080 Ti', '32G', '2 最高64G', '2TB', '無', '2.60', '17.3吋', '3840x2160', 'Intel® Wi-Fi 6E AX211 (Gig+) Wireless 藍牙5.2', '99Wh', 'Windows 11 Pro'),
('AERO 16 YE5-94TW949HP', 132900, 'https://tw.buy.yahoo.com/gdsale/技嘉-GIGABYTE-AERO-16-YE5-94TW949HP-16吋筆電-i9-12900HK-9888443.html', 'https://s.yimg.com/zp/MerchandiseImages/3D36105535-SP-10971440.jpg', 'GIGABYTE技嘉', '第12代Intel® Core i9-12900HK (2.5GHz~5GHz)', 'RTX 3080 Ti', '32G', '2 最高64G', '2TB', '無', '2.30', '16吋', '3840x2400', 'Intel® Wi-Fi 6E AX210 (Gig+) Wireless 藍牙5.2', '99Wh', 'Windows 11 Pro'),
('Creator Z17 A12UHST-001TW', 129900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Creator-Z17-A12UHST-001TW-17吋創作者筆電-i9-12900H-9927594.html', 'https://s.yimg.com/zp/MerchandiseImages/FAC5B3CE41-SP-11103599.jpg', 'MSI微星', 'i9-12900H', 'RTX 3080Ti', '64G', '2 最高64G', '2TB', '無', '2.49', '17.3吋', '2560 x 1600', 'Killer ax Wi-Fi 6E 藍牙5.2', '90 Battery (Whr) /240W adapter', 'Windows 11 Pro'),
('WE76 11UM-621TW', 129900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-WE76-11UM-621TW-17-3吋繪圖工作站筆電-i9-11980HK-32G-9881685.html', 'https://s.yimg.com/zp/MerchandiseImages/B2E750C14B-SP-10973247.jpg', 'MSI微星', 'i9-11980HK', 'RTX A5000', '32G', '2 最高64G', '2TB', '無', '2.9', '17.3吋', '3840 x 2160, UHD', 'Killer ax Wi-Fi 6E 藍牙5.2', '230W Slim adapter', 'Win10 Pro'),
('Raider GE76 Deluxe Edition 12UHS-038TW', 119900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Raider-GE76-Deluxe-Edition-12UHS-038TW-17-3吋-9969956.html', 'https://s.yimg.com/zp/MerchandiseImages/602D422A5D-SP-11207137.jpg', 'MSI微星', 'i9-12900HK', 'RTX 3080Ti', '64G', '2 最高64G', '2TB', '無', '2.9', '17.3吋', 'UHD (3840x2160), 120Hz', 'Killer Gb LAN(Up to 2.5G)/Intel Killer AX Wi-Fi 6E 藍牙5.2', '99.9 Battery (Whr) 280W adapter', 'Windows 11 Pro'),
('Stealth GS77 12UHS-024TW', 119900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Stealth-GS77-12UHS-024TW-15吋電競筆電-i9-12900H-6-9934728.html', 'https://s.yimg.com/zp/MerchandiseImages/CCF1BCEE26-SP-11118266.jpg', 'MSI微星', 'i9-12900H', 'RTX 3080Ti', '64G', '2 最高64G', '2TB', '無', '2.8', '17.3吋', '3840x2160', 'Killer Gb LAN(Up to 2.5G)/Intel Killer AX Wi-Fi 6E 藍牙5.2', '99.9 Battery / 240W adapter', 'Windows 11 Pro'),
('Raider GE66 Deluxe Edition 12UHS-253TW', 111900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Raider-GE66-Deluxe-Edition-12UHS-253TW-15-6吋-9945592.html', 'https://s.yimg.com/zp/MerchandiseImages/2C8548BE96-SP-11165390.jpg', 'MSI微星', 'i9-12900HK', 'RTX 3080Ti', '32G', '2 最高64G', '2TB', '無', '2.38', '15.6吋', 'UHD (3840x2160), 120Hz', 'Killer Gb LAN(Up to 2.5G)/Intel Killer AX Wi-Fi 6E 藍牙5.2', '99.9 Battery (Whr) 280W adapter', 'Windows 11 Pro'),
('UX582ZM-0021B12900H', 109900, 'https://tw.buy.yahoo.com/gdsale/ASUS-UX582ZM-15-6吋觸控筆電-i9-12900H-RTX3060-32G-1TB-S-9938337.html', 'https://s.yimg.com/zp/MerchandiseImages/FC0C4AAF79-Gd-9938337.jpg', 'ASUS華碩', 'Intel® Core i9-12900H', 'RTX3060', '32G', '無(on board) 最高32G', '1TB', '無', '-', '15.6吋', '3840 x 2160', 'Wi-Fi 6E(802.11ax) 藍牙5.2', '92WHRS', 'Win 11 home'),
('Stealth GS66 12UHS-070TW', 109900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Stealth-GS66-12UHS-070TW-15吋電競筆電-i9-12900H-6-9934731.html', 'https://s.yimg.com/zp/MerchandiseImages/00A5B782F9-SP-11138202.jpg', 'MSI微星', 'i9-12900H', 'RTX 3080Ti', '64G', '2 最高64G', '2TB', '無', '2.1', '15.6吋', '2560x1440', 'Killer Gb LAN(Up to 2.5G)/Intel Killer AX Wi-Fi 6E 藍牙5.2', '99.9 Battery / 240W adapter', 'Windows 11 Pro'),
('UX582ZM-0041B12900H', 99900, 'https://tw.buy.yahoo.com/gdsale/ASUS-UX582ZM-15-6吋觸控筆電-i9-12900H-RTX3060-32G-1TB-S-9938335.html', 'https://s.yimg.com/zp/MerchandiseImages/0B5E23FE8B-Gd-9938335.jpg', 'ASUS華碩', 'Intel® Core i9-12900H', 'RTX3060', '32G', '無(on board) 最高32G', '1TB', '無', '-', '15.6吋', '1920 x 1080', 'Wi-Fi 6E(802.11ax) 藍牙5.2', '92WHRS', 'Win 11 home'),
('WS66 11UM-610TW', 99900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-WS66-11UM-610TW-15吋繪圖工作站筆電-i9-11900H-32G-1T-9860170.html', 'https://s.yimg.com/zp/MerchandiseImages/659277b9fe-Gd-9860170.jpg', 'MSI微星', 'i9-11900H', 'RTX A5000', '32G', '2 最高64G', '1TB', '無', '2.1', '15.6吋', '3840 x 2160, UHD', 'Killer ax Wi-Fi 6E 藍牙5.2', '230W Slim adapter', 'Win10 Pro'),
('Creator 17 B11UH-607TW', 99900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Creator-17-B11UH-607TW-17吋創作者筆電-i9-11900H-32-9754156.html', 'https://s.yimg.com/zp/MerchandiseImages/b2797bd84e-Gd-9754156.jpg', 'MSI微星', 'i9-11900H', 'RTX3080', '32G', '2 最高64G', '2TB', '無', '2.45', '17.3吋', '3840*2160', 'Killer ax Wi-Fi 6E 藍牙5.2', '99.9 Battery (Whr) /230W Slim adapter', 'Win10 Pro'),
('GS66 Stealth 11UH-077TW', 94900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-GS66-11UH-077TW-15吋電競筆電-i9-11900H-64G-2TB-SS-9635163.html', 'https://s.yimg.com/zp/MerchandiseImages/74D6B20130-SP-10184579.jpg', 'MSI微星', 'i9-11900H 八核心處理器', 'RTX3080', '64G', '2 最高64G', '2TB', '無', '2.1', '15.6吋', '3840x2160', '802.11 ax Wi-Fi 6E 藍牙5.2', '99.9 Battery / 230W Slim adapter', 'Win10 Pro'),
('WS76 11UK-450TW', 92900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-WS76-11UK-450TW-17吋繪圖工作站筆電-i9-11900H-32G-2T-9927592.html', 'https://s.yimg.com/zp/MerchandiseImages/7BE1E8BB3E-SP-11102799.jpg', 'MSI微星', 'i9-11900H', 'RTX A3000', '64G', '2 最高64G', '2TB', '無', '2.45', '17.3吋', '3840 x 2160, UHD', 'Killer ax Wi-Fi 6E 藍牙5.2', '230W Slim adapter', 'Win10 Pro'),
('Stealth GS77 12UGS-067TW', 92900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Stealth-GS77-12UGS-067TW-15吋電競筆電-i9-12900H-3-9923398.html', 'https://s.yimg.com/zp/MerchandiseImages/e8d61eeeaf-Gd-9923398.jpg', 'MSI微星', 'i9-12900H', 'RTX 3070Ti', '32G', '2 最高64G', '2TB', '無', '2.8', '17.3吋', '3840x2160', 'Killer Gb LAN(Up to 2.5G)/Intel Killer AX Wi-Fi 6E 藍牙5.2', '99.9 Battery / 240W adapter', 'Windows 11 Pro'),
('Creator Z16P B12UGST-034TW', 91900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Creator-Z16P-B12UGST-034TW-16吋創作者筆電-i9-12900-9934826.html', 'https://s.yimg.com/zp/MerchandiseImages/7CB5334BE4-SP-11139021.jpg', 'MSI微星', 'i9-12900H', 'RTX 3070Ti', '32G', '2 最高64G', '2TB', '無', '2.39', '16吋', '2560 x 1600', 'Killer ax Wi-Fi 6E 藍牙5.2', '90 Battery (Whr) /240W adapter', 'Windows 11 Pro'),
('Raider GE76 12UGS-448TW', 89900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Raider-GE76-12UGS-448TW-17吋電競筆電-i7-12700H-32-9859071.html', 'https://s.yimg.com/zp/MerchandiseImages/602D422A5D-SP-10904355.jpg', 'MSI微星', 'i7-12700H', 'RTX 3070Ti', '32G', '2 最高64G', '2TB', '無', '2.9', '17.3吋', 'QHD (2560x1440), 240Hz', 'Killer Gb LAN(Up to 2.5G)/Intel Killer AX Wi-Fi 6E 藍牙5.2', '99.9 Battery (Whr) 280W adapter', 'Windows 11 Pro'),
('Creator Z17 A12UGST-002TW', 89900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Creator-Z17-A12UGST-002TW-17吋創作者筆電-i7-12700H-9927593.html', 'https://s.yimg.com/zp/MerchandiseImages/FAC5B3CE41-SP-11104460.jpg', 'MSI微星', 'i7-12700H', 'RTX 3070Ti', '32G', '2 最高64G', '2TB', '無', '2.49', '17.3吋', '2560 x 1600', 'Killer ax Wi-Fi 6E 藍牙5.2', '90 Battery (Whr) /240W adapter', 'Windows 11 Pro'),
('GE66 11UH-245TW', 89900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-GE66-11UH-245TW-15-6吋電競筆電-i9-11980HK-32G-RTX-9584462.html', 'https://s.yimg.com/zp/MerchandiseImages/ae39f8fa07-Gd-9584462.jpg', 'MSI微星', 'i9-11980HK', 'RTX3080', '32G', '2 最高64G', '2TB', '無', '2.38', '15.6吋', '3840x2160', 'Killer ax Wi-Fi 6E 藍牙5.2', '99.9 Battery (Whr) /280W adapter', 'Win10 Pro'),
('WS76 11UK-451TW', 88900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-WS76-11UK-451TW-17吋繪圖工作站筆電-i7-11800H-16G-1T-9901708.html', 'https://s.yimg.com/zp/MerchandiseImages/7BE1E8BB3E-SP-11023604.jpg', 'MSI微星', 'i7-11800H', 'RTX A3000', '64G', '2 最高64G', '1TB', '無', '2.45', '17.3吋', '3840 x 2160, UHD', 'Killer ax Wi-Fi 6E 藍牙5.2', '230W Slim adapter', 'Win10 Pro'),
('AERO 16 XE5-73TW938HP', 85900, 'https://tw.buy.yahoo.com/gdsale/技嘉-GIGABYTE-AERO-16-XE5-73TW938HP-16吋筆電-i7-12700H-9911499.html', 'https://s.yimg.com/zp/MerchandiseImages/86E224DC1A-SP-11039306.jpg', 'GIGABYTE技嘉', '第12代Intel® Core i7-12700H (2.3GHz~4.7GHz)', 'RTX 3070 Ti', '16G', '2 最高64G', '2TB', '無', '2.30', '16吋', '3840x2400', 'Intel® Wi-Fi 6E AX210 (Gig+) Wireless 藍牙5.2', '99Wh', 'Windows 11 Pro'),
('Raider GE66 12UGS-034TW', 84900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Raider-GE66-12UGS-034TW-15-6吋電競筆電-i7-12700H-9859075.html', 'https://s.yimg.com/zp/MerchandiseImages/B1908D7064-SP-10904367.jpg', 'MSI微星', 'i7-12700H', 'RTX 3070Ti', '32G', '2 最高64G', '2TB', '無', '2.38', '15.6吋', 'QHD (2560x1440), 240Hz', 'Killer Gb LAN(Up to 2.5G)/Intel Killer AX Wi-Fi 6E 藍牙5.2', '99.9 Battery (Whr) 280W adapter', 'Windows 11 Pro'),
('Stealth GS66 12UGS-017TW', 83900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Stealth-GS66-12UGS-017TW-15吋電競筆電-i7-12700H-3-9859215.html', 'https://s.yimg.com/zp/MerchandiseImages/00A5B782F9-SP-10904390.jpg', 'MSI微星', 'i7-12700H', 'RTX 3070Ti', '32G', '2 最高64G', '1TB', '無', '2.1', '15.6吋', '2560x1440', 'Killer Gb LAN(Up to 2.5G)/Intel Killer AX Wi-Fi 6E 藍牙5.2', '99.9 Battery / 240W adapter', 'Windows 11 Pro'),
('Creator Z16 A11UET-092TW', 79900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Creator-Z16-A11UET-092TW-15吋創作者觸控筆電-i9-11900-9596281.html', 'https://s.yimg.com/zp/MerchandiseImages/09c20ddd74-Gd-9596281.jpg', 'MSI微星', 'i9-11900H', 'RTX3060', '32G', '2 最高64G', '2TB', '無', '2.2', '16吋', '2560*1600', 'Killer ax Wi-Fi 6E 藍牙5.2', '90 Battery (Whr) /180W Slim adapter', 'Win10 Pro'),
('Vector GP76 12UH-040TW', 77900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Vector-GP76-12UH-040TW-17吋12代360Hz電競筆電-i7-12-9859074.html', 'https://s.yimg.com/zp/MerchandiseImages/E9B64D2B1D-SP-10904347.jpg', 'MSI微星', 'i7-12700H', 'RTX3080', '32G', '2 最高64G', '1TB', '無', '2.9', '17.3吋', '1920x1080, 360Hz', 'Gb LAN (Up to 2.5G) /Intel® Killer™ AX Wi-Fi 6E 藍牙5.2', '280W adapter', 'Win 11 home'),
('Elitebook x360 1040 G8 (3V2G7PA)', 77900, 'https://tw.buy.yahoo.com/gdsale/HP-惠普-EliteBook-x360-1040-G8-14吋翻轉觸控商用筆電-i7-1185G7-9508251.html', 'https://s.yimg.com/zp/MerchandiseImages/1FD1A0E7E5-SP-9843467.jpg', 'HP惠普', '11th Gen. Intel Core:i7-1185G7', 'Intel Iris Xe Graphics', '32G', '無(on board) 最高32G', '2TB', '無', '1.31', '14.0吋', '3840 x 2160', 'Intel AX201 (2x2) Wi-Fi 6 藍牙5.0', '4 cell 54 WHr / 7.0Ah', 'Win10 Pro'),
('GS76 Stealth 11UG-211TW', 76900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-GS76-11UG-211TW-17吋電競筆電-i7-11800H-32G-1TB-SS-9686628.html', 'https://s.yimg.com/zp/MerchandiseImages/ECE031692D-SP-10373133.jpg', 'MSI微星', 'i7-11800H 八核心處理器', 'RTX3070', '32G', '2 最高64G', '2TB', '無', '2.45', '17.3吋', '2560x1440', '802.11 ax Wi-Fi 6E 藍牙5.2', '99.9 Battery / 230W Slim adapter', 'Win10 Pro'),
('Elitebook x360 1030 G8(3V628PA)', 76900, 'https://tw.buy.yahoo.com/gdsale/HP-惠普-EliteBook-x360-1030-G8-13-3吋翻轉觸控商用筆電-i7-1185-9508253.html', 'https://s.yimg.com/zp/MerchandiseImages/2023F67DCE-SP-9835252.jpg', 'HP惠普', '11th Gen. Intel Core:i7-1185G7', 'Intel Iris Xe Graphics', '32G', '無(on board) 最高32G', '2TB', '無', '1.21', '13.3吋', '1920 x 1080', 'Intel AX201 (2x2) Wi-Fi 6 藍牙5.0', '主電池: 2 cell 38 WHr / 4.68Ah', 'Win10 Pro'),
('GE76 11UG-438TW', 75900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-GE76-11UG-438TW-17吋電競筆電-i7-11800H-16G-RTX307-9546183.html', 'https://s.yimg.com/zp/MerchandiseImages/C15C2EAC26-SP-9947801.jpg', 'MSI微星', 'i7-11800H', 'RTX3070', '16G', '2 最高64G', '2TB', '無', '2.9', '17.3吋', '2560x1440', 'Killer ax Wi-Fi 6E 藍牙5.2', '99.9 Battery (Whr) /280W adapter', 'Win10 home'),
('WS66 10TK-485TW', 74900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-WS66-10TK-485TW-15吋繪圖工作站筆電-i7-10870H-32G-1T-9446507.html', 'https://s.yimg.com/zp/MerchandiseImages/B44DA585EC-SP-9657974.jpg', 'MSI微星', 'i7-10870H', 'RTX 3000', '32G', '2 最高64G', '1TB', '無', '2.1', '15.6吋', '3840 x 2160, UHD', '802.11 ax Wi-Fi 6 藍牙5.1', '4-Cell /180W Slim adapter', 'Win10 Pro'),
('GU603ZW-0022A12900H', 73900, 'https://tw.buy.yahoo.com/gdsale/ASUS-GU603ZW-16吋電競筆電-i9-12900H-RTX3070Ti-32G-1TB-S-9880783.html', 'https://s.yimg.com/zp/MerchandiseImages/37F9CDBFD5-Gd-9880783.jpg', 'ASUS華碩', 'Core i9-12900H  2.5GHz (24M Cache, up to 5.0GHz)', 'RTX 3070Ti', '32G', '已佔用1 最高48G', '1TB', '無', '-', '16吋', '2560 x 1600', 'Wi-Fi 6(802.11ax) 藍牙5.2', '90WHrs, 4S1P, 4-cell Li-ion', 'Win 11 home'),
('Creator Z16 A11UET-265TW', 72900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Creator-Z16-A11UET-265TW-16吋創作者觸控筆電-i9-11900-9840200.html', 'https://s.yimg.com/zp/MerchandiseImages/91D0C1175B-SP-10845068.jpg', 'MSI微星', 'i9-11900H', 'RTX3060', '32G', '2 最高64G', '2TB', '無', '2.2', '16吋', '2560*1600', 'Killer ax Wi-Fi 6E 藍牙5.2', '90 Battery (Whr) /180W Slim adapter', 'Win10 Pro'),
('AORUS 15P YD-73TW244GH', 71900, 'https://tw.buy.yahoo.com/gdsale/GIGABYTE-技嘉-AORUS-15P-YD-15-6吋創作者筆電-i7-11800H-RTX3-9658399.html', 'https://s.yimg.com/zp/MerchandiseImages/70FC614147-SP-10263334.jpg', 'GIGABYTE技嘉', 'i7-11800H', 'RTX3080', '32G', '2, 已佔用2 最高64G', '1TB', '無', '2.29', '15.6吋', '1920x1080', 'RTL8125-BG REALTEK (2.5G) 乙太網路介面 藍牙5.2', '充電式鋰電池 99Wh', 'Win10 home'),
('AORUS 17G YD-73TW345GH', 69999, 'https://tw.buy.yahoo.com/gdsale/GIGABYTE-技嘉-AORUS-17G-YD-17-3吋電競筆電-i7-11800H-RTX30-9566965.html', 'https://s.yimg.com/zp/MerchandiseImages/54EBB49850-SP-10003797.jpg', 'GIGABYTE技嘉', 'i7-11800H', 'RTX3080', '32G', '2 最高64G', '512GB', '無', '2.7', '17.3吋', '1920x1080', 'ntel® AX200 Wireless 或  Intel® AX201 Wireless 藍牙5.2', '99Wh', 'Win10 Pro'),
('G733ZW-0032S12900H', 68900, 'https://tw.buy.yahoo.com/gdsale/ASUS-G733ZM-17-3吋筆電-i9-12900H-RTX3070Ti-32G-1TB-SS-9892845.html', 'https://s.yimg.com/zp/MerchandiseImages/296CB6770B-Gd-9892845.jpg', 'ASUS華碩', '12th Gen Intel® Core i9-12900H Processor 2.5 GHz', 'RTX 3070 Ti', '32G', '已佔用2 最高64G', '1TB', '無', '2.9', '17.3吋', '1920 x 1080', 'Wi-Fi 6(802.11ax) 藍牙5.2', '90WHrs', 'Win 11 home'),
('G533ZW-0022S12900H', 67900, 'https://tw.buy.yahoo.com/gdsale/ASUS-G533ZW-15-6吋筆電-i9-12900H-RTX-3070Ti-32G-1TB-S-9880781.html', 'https://s.yimg.com/zp/MerchandiseImages/3AFEF9727C-Gd-9880781.jpg', 'ASUS華碩', '12th Gen Intel® Core i9-12900H Processor 2.5 GHz', 'RTX3070Ti', '32G', '已佔用2 最高64G', '1TB', '無', '2.3', '15.6吋', '1920 x 1080', 'Wi-Fi 6(802.11ax) 藍牙5.2', '90WHrs', 'Win 11 home'),
('PRO-W700G2T-0072I9750H', 66880, 'https://tw.buy.yahoo.com/gdsale/ASUS-ProArt-StudioBook-17吋-商用筆電-PRO-W700G2T-0072I9-9936785.html', 'https://s.yimg.com/zp/MerchandiseImages/E21F7101EB-SP-11145049.jpg', 'ASUS華碩', 'Intel® Core i7-9750H Processor 2.6 GHz', 'NVIDIA® Quadro® T2000', '32G', '1 最高64G', '1TB', '無', '2.39', '17.0吋', '1920x1200', '802.11ac 藍牙5.0', '57Whrs', 'Win10 Pro'),
('Creator Z16 Hiroshi Fujiwara A11UE-225TW', 64900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Creator-Z16-Hiroshi-Fujiwara-A11UE-225TW16吋創-9721105.html', 'https://s.yimg.com/zp/MerchandiseImages/4071C2391A-Gd-9721105.jpg', 'MSI微星', 'i7-11800H', 'RTX3060', '16G', '2 最高64G', '1TB', '無', '2.2', '16吋', '2560*1600', 'Killer ax Wi-Fi 6E 藍牙5.2', '90 Battery (Whr)', 'Win10 home'),
('Creator Z16 A11UE-058TW', 64900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Creator-Z16-A11UE-058TW-15吋創作者筆電-i7-11800H-3-9657906.html', 'https://s.yimg.com/zp/MerchandiseImages/09C20DDD74-SP-10276652.jpg', 'MSI微星', 'i7-11800H', 'RTX3060', '32G', '2 最高64G', '1TB', '無', '2.2', '16吋', '2560*1600', 'Killer ax Wi-Fi 6E 藍牙5.2', '90 Battery (Whr) /180W Slim adapter', 'Win10 Pro'),
('Spectre x360 Conv14-ea1055TU', 64900, 'https://tw.buy.yahoo.com/gdsale/HP-皇爵翻轉14-Spectre-x360-14-ea1055TU-14吋輕薄翻轉觸控筆電-i7-9819894.html', 'https://s.yimg.com/zp/MerchandiseImages/C97B2657F0-SP-10773638.jpg', 'HP惠普', 'i7-1195 G7', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高32G', '1TB', '無', '1.34', '13.5吋', '3K2K (3000x2000) OLED', 'Intel Wi-Fi 6 AX 201 (2x2) 藍牙5.0', '標配 3cell 41WHr', 'Win 11 home'),
('GE66 11UG-241TW', 63900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-GE66-11UG-241TW-15-6吋電競筆電-i7-11800H-16G-RTX3-9676906.html', 'https://s.yimg.com/zp/MerchandiseImages/A325F81248-SP-10341500.jpg', 'MSI微星', 'i7-11800H', 'RTX3070', '16G', '2 最高64G', '2TB', '無', '2.38', '15.6吋', '2560 x 1440', 'Killer ax Wi-Fi 6E 藍牙5.2', '99.9 Battery (Whr) /280W adapter', 'Win10 home'),
('GS76 Stealth 11UE-212TW', 62900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-GS76-11UE-212TW-15吋電競筆電-i7-11800H-16G-1TB-SS-9600032.html', 'https://s.yimg.com/zp/MerchandiseImages/EA35A61AD2-SP-10098376.jpg', 'MSI微星', 'i7-11800H 八核心處理器', 'RTX3060', '16G', '2 最高64G', '1TB', '無', '2.45', '17.3吋', '2560x1440', '802.11 ax Wi-Fi 6E 藍牙5.2', '99.9 Battery / 230W Slim adapter', 'Win10 home'),
('GP66 Leopard 11UG-007TW', 61900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-GP66-11UG-007TW-15吋11代30系列電競筆電-i7-11800H-16G-9551287.html', 'https://s.yimg.com/zp/MerchandiseImages/23334C0628-SP-9957969.jpg', 'MSI微星', 'i7-11800H', 'RTX3070', '16G', '2 最高64G', '1TB', '無', '2.38', '15.6吋', '1920x1080', 'Killer ax Wi-Fi 6E 藍牙5.2', '280W adapter', 'Win10 home'),
('UX482EGR-0141A1195G7', 61900, 'https://tw.buy.yahoo.com/gdsale/ASUS-UX482EGR-14吋筆電-i7-1195G7-MX450-32G-1TB-SSD-Ze-9850374.html', 'https://s.yimg.com/zp/MerchandiseImages/2e626887a8-Gd-9850374.jpg', 'ASUS華碩', 'Intel® Core i7-1195G7 Processor 3.0 GHz', 'MX450', '32G', '無(on board) 最高32G', '1TB', '無', '-', '14.0吋', '1920 x 1080', 'Wi-Fi 6(Gig+)(802.11ax) 藍牙5.2', '70WHrs, 4S1P, 4-cell Li-ion', 'Win 11 home'),
('GS66 Stealth 11UE-245TW', 61900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-GS66-11UE-245TW-15吋電競筆電-i7-11800H-16G-1TB-SS-9569785.html', 'https://s.yimg.com/zp/MerchandiseImages/74D6B20130-SP-10010779.jpg', 'MSI微星', 'i7-11800H 八核心處理器', 'RTX3060', '16G', '2 最高64G', '1TB', '無', '2.1', '15.6吋', '2560x1440', '802.11 ax Wi-Fi 6E 藍牙5.2', '99.9 Battery / 230W Slim adapter', 'Win10 home'),
('Vector GP76 12UGS-458TW', 61900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Vector-GP76-12UGS-458TW-17吋12代360Hz電競筆電-i7-1-9969955.html', 'https://s.yimg.com/zp/MerchandiseImages/E9B64D2B1D-SP-11206687.jpg', 'MSI微星', 'i7-12700H', 'RTX3070Ti', '16G', '2 最高64G', '1TB', '無', '2.9', '17.3吋', '1920x1080, 360Hz', 'Gb LAN (Up to 2.5G) /Intel Killer AX Wi-Fi 6E 藍牙5.2', '280W adapter', 'Win 11 home'),
('B9400CEA-0171A1165G7', 61880, 'https://tw.buy.yahoo.com/gdsale/ASUS-ExpertBook-B9400CEA-14吋商用筆電-i7-1165G7-32G-1T--9379457.html', 'https://s.yimg.com/zp/MerchandiseImages/ab190bfb03-Gd-9379457.jpg', 'ASUS華碩', 'Intel Core i7-1165G7 Processor 2.8 GHz', 'Intel Iris Xe Graphics', '32G', '1 最高32G', '2TB', '無', '1.005', '14.0吋', '1920 x 1080', 'Wi-Fi 6 (802.11ax) 藍牙5.0', '66Whrs', 'Win10 Pro'),
('Vector GP66 12UGS-430TW', 60900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Vector-GP66-12UGS-430TW-12代165Hz電競筆電-i7-1270-9995925.html', 'https://s.yimg.com/zp/MerchandiseImages/84FFA63300-SP-11206395.jpg', 'MSI微星', 'i7-12700H', 'RTX3070Ti', '16G', '2 最高64G', '1TB', '無', '2.38', '15.6吋', '2560x1440, 165Hz', 'Gb LAN (Up to 2.5G) /Intel® Killer AX Wi-Fi 6E 藍牙5.2', '280W adapter', 'Win 11 home'),
('Spectre x360 Conv14-ea0051TU', 60900, 'https://tw.buy.yahoo.com/gdsale/HP-皇爵翻轉14-Spectre-x360-14-ea0051TU-14吋輕薄翻轉觸控筆電-i7-9303892.html', 'https://s.yimg.com/zp/MerchandiseImages/D5B463CA1F-Gd-9303892.jpg', 'HP惠普', 'i7-1165 G7', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '1TB', '無', '1.36', '13.5吋', '3000x2000', 'Intel Wi-Fi 6 AX 201 (2x2) 藍牙5.0', '標配 4cell 66Whr', 'Win10 home'),
('Crosshair 15 R6E B12UGZ-017TW', 60900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Crosshair-15-R6E-B12UGZ-017TW-15吋電競筆電-i7-127-9934732.html', 'https://s.yimg.com/zp/MerchandiseImages/08A499B54A-SP-11133197.jpg', 'MSI微星', 'i7-12700H', 'RTX3070', '32G', '2 最高64G', '1TB', '無', '2.47', '15.6吋', '2560x1440', '802.11 ax Wi-Fi 6 藍牙5.2', '90 Battery (Whr)/ 240W adapter', 'Win 11 home'),
('AORUS 17 XE4-73TW514SH', 59900, 'https://tw.buy.yahoo.com/gdsale/技嘉-GIGABYTE-AORUS-17-XE4-73TW514SH-17-3吋筆電-i7-1270-9888442.html', 'https://s.yimg.com/zp/MerchandiseImages/3193769EB4-SP-10971808.jpg', 'GIGABYTE技嘉', '第12代Intel® Core i7-12700H (2.3GHz~4.7GHz)', 'RTX 3070 Ti', '16G', '2 最高64G', '1TB', '無', '2.7', '17.3吋', '1920 x 1080', 'Intel® Wi-Fi 6E AX211 (Gig+) Wireless 藍牙5.2', '99Wh', 'Win 11 home'),
('Summit E16Flip A12UCT-005TW', 59900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Summit-E16Flip-A12UCT-005TW-16吋輕薄商務筆電-i7-128-9969953.html', 'https://s.yimg.com/zp/MerchandiseImages/ff287575d3-Gd-9969953.jpg', 'MSI微星', 'i7-1280P', 'RTX 3050', '32G', '已佔用1 最高32G', '1TB', '無', '1.9', '16吋', 'QHD(2560 x 1600)', 'Intel Killer AX Wi-Fi 6E 藍牙5.2', '82 Battery (Whr)/ 100W adapter', 'Windows 11 Pro'),
('Creator 15 A11UE-499TW', 59900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Creator-15-A11UE-499TW-17吋創作者筆電-i7-11800H-32-9801461.html', 'https://s.yimg.com/zp/MerchandiseImages/E4C876729A-SP-10716741.jpg', 'MSI微星', 'i7-11800H', 'RTX3060', '32G', '2 最高64G', '1TB', '無', '2.1', '15.6吋', '3840*2160', 'Killer ax Wi-Fi 6E 藍牙5.2', '99.9 Battery (Whr) /230W Slim adapter', 'Win10 Pro'),
('AORUS 15 XE4-73TWB14SH', 59900, 'https://tw.buy.yahoo.com/gdsale/技嘉-GIGABYTE-AORUS-15-XE4-73TWB14SH-15-6吋筆電-i7-1270-9888441.html', 'https://s.yimg.com/zp/MerchandiseImages/ECDF2C0019-SP-10971712.jpg', 'GIGABYTE技嘉', '第12代Intel® Core i7-12700H (2.3GHz~4.7GHz)', 'RTX 3070 Ti', '16G', '2 最高64G', '1TB', '無', '2.4', '15.6吋', '2560x1440', 'Intel® Wi-Fi 6E AX210(Gig+) Wireless 藍牙5.2', '99Wh', 'Win 11 home'),
('Creator 17 B11UE-419TW', 59900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Creator-17-B11UE-419TW-17吋創作者筆電-i7-11800H-16-9801460.html', 'https://s.yimg.com/zp/MerchandiseImages/B2797BD84E-SP-10717349.jpg', 'MSI微星', 'i7-11800H', 'RTX3060', '16G', '2 最高64G', '1TB', '無', '2.45', '17.3吋', '3840*2160', 'Killer ax Wi-Fi 6E 藍牙5.2', '99.9 Battery (Whr) /230W Slim adapter', 'Win10 Pro'),
('Elitebook x360 1040 G8 (3V281PA)', 58900, 'https://tw.buy.yahoo.com/gdsale/HP-惠普-EliteBook-x360-1040-G8-14吋翻轉觸控商用筆電-i5-1145G7-9508252.html', 'https://s.yimg.com/zp/MerchandiseImages/1FD1A0E7E5-SP-9843411.jpg', 'HP惠普', '11th Gen. Intel Core:i5-1145G7', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.31', '14.0吋', '1920 x 1080', 'Intel AX201 (2x2) Wi-Fi 6 藍牙5.0', '4 cell 54 WHr / 7.0Ah', 'Win10 Pro'),
('Elitebook x360 1030 G8(3V627PA)', 58900, 'https://tw.buy.yahoo.com/gdsale/HP-惠普-EliteBook-x360-1030-G8-13-3吋翻轉觸控商用筆電-i5-1145-9508254.html', 'https://s.yimg.com/zp/MerchandiseImages/2023F67DCE-SP-9835108.jpg', 'HP惠普', '11th Gen. Intel Core:i5-1145G7', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.21', '13.3吋', '1920 x 1080', 'Intel AX201 (2x2) Wi-Fi 6 藍牙5.0', '主電池: 2 cell 38 WHr / 4.68Ah', 'Win10 Pro'),
('B9400CEA-0111A1165G7', 58800, 'https://tw.buy.yahoo.com/gdsale/ASUS-ExpertBook-B9400CEA-14吋商用筆電-i7-1165G7-32G-2T--9379268.html', 'https://s.yimg.com/zp/MerchandiseImages/ab190bfb03-Gd-9379268.jpg', 'ASUS華碩', 'Intel Core i7-1165G7 Processor 2.8 GHz', 'Intel Iris Xe Graphics', '32G', '1 最高32G', '2TB', '無', '0.995', '14.0吋', '1920 x 1080', 'Wi-Fi 6 (802.11ax) 藍牙5.0', '66Whrs', 'Win10 Pro'),
('PRO-W700G1T-0082I9750H', 57990, 'https://tw.buy.yahoo.com/gdsale/ASUS-ProArt-StudioBook-17吋-商用筆電-PRO-W700G1T-0082I9-9936776.html', 'https://s.yimg.com/zp/MerchandiseImages/E21F7101EB-SP-11144937.jpg', 'ASUS華碩', 'Intel® Core i7-9750H Processor 2.6 GHz', 'NVIDIA® Quadro® T1000', '16G', '1 最高64G', '512GB', '無', '2.39', '17.0吋', '1920x1200', '802.11ac 藍牙5.0', '57Whrs', 'Win10 Pro'),
('Swift 7-SF714-52T-748F', 57900, 'https://tw.buy.yahoo.com/gdsale/Acer-SF714-52T-748F-14吋筆電-i7-8500Y-16G-512G-SSD-Sw-9048385.html', 'https://s.yimg.com/zp/MerchandiseImages/3A501749FD-Gd-9048385.jpg', 'Acer宏碁', 'Intel® Core i7-8500', '其他', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '0.85', '14.0吋', '1920x1080', 'WIFI6 2x2 MU-MIMO 藍牙5.0', '-', 'Win10 home'),
('Surface Laptop 4 i7/16G/512G', 48888, 'https://tw.buy.yahoo.com/gdsale/微軟-Microsoft-Surface-Laptop-4-13吋-i7-16G-512G冰藍-5E-9872056.html', 'https://s.yimg.com/zp/MerchandiseImages/C22AEA3614-SP-10947372.jpg', 'Microsoft微軟', 'Intel® Core i7-1185G7', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1', '13.5吋', '2256 x 1504 (201 PPI)', 'Wi-Fi 6： 相容於 802.11ax 藍牙5.0', '一般使用時間最長可達 19 小時', 'Win10 home'),
('G15-5520-R2768NTW', 47990, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-Gaming-G15-5520-15-6吋電競筆電-i7-12700H--9969629.html', 'https://s.yimg.com/zp/MerchandiseImages/4C72B1200B-SP-11245219.jpg', 'Dell戴爾', '12thGen Intel® Corei7-12700H 14-Core Processor', 'NVIDIA® GeForce RTX 3060', '16G', '2 最高32G', '512GB', '無', '2.437', '15.6吋', '1920 x 1080', 'Intel Wi-Fi 6 AX201, 2x2 802.11ax 1 藍牙4.0', '86 WHr, 6-Cell Battery (integrated)', 'Win 11 home'),
('G15-5520-R2768BTW', 47990, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-Gaming-G15-5520-15-6吋電競筆電-i7-12700H--9935581.html', 'https://s.yimg.com/zp/MerchandiseImages/A13CE73843-SP-11141197.jpg', 'Dell戴爾', '12thGen Intel® Corei7-12700H 14-Core Processor', 'NVIDIA® GeForce RTX 3060', '16G', '2 最高32G', '512GB', '無', '2.437', '15.6吋', '1920 x 1080', 'Intel Wi-Fi 6 AX201, 2x2 802.11ax 藍牙4.0', '86 WHr, 6-Cell Battery (integrated)', 'Win 11 home'),
('Stealth 15M B12UE-028TW', 47900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Stealth-15M-B12UE-028TW-15吋輕薄電競筆電-i7-1280P-1-9939749.html', 'https://s.yimg.com/zp/MerchandiseImages/CB39AEBBF9-SP-11151051.jpg', 'MSI微星', 'i7-1280P', 'RTX3060', '16G', '2 最高64G', '1TB', '無', '1.8', '15.6吋', '1920x1080', '802.11 ax Wi-Fi 6 藍牙5.2', '180W adapter', 'Win 11 home'),
('AORUS 15P XD-73TW224GO', 47900, 'https://tw.buy.yahoo.com/gdsale/技嘉-GIGABYTE-AORUS-15P-XD-73TW224GO-15-6吋筆電-9807486.html', 'https://s.yimg.com/zp/MerchandiseImages/5DCF69C6EF-SP-10722597.jpg', 'GIGABYTE技嘉', 'i7-11800H', 'RTX3070', '16G', '已佔用2 最高16G', '1TB', '無', '2.29', '15.6吋', '1920x1080', 'Intel® AX200 Wireless 藍牙5.2', '充電式鋰電池 99Wh', 'Win 11 home'),
('Crosshair 15 B12UEZ-023TW', 47900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Crosshair-15-B12UEZ-023TW-15吋電競筆電-i7-12700H-9923397.html', 'https://s.yimg.com/zp/MerchandiseImages/B98CE31865-SP-11088140.jpg', 'MSI微星', 'i7-12700H', 'RTX3060', '16G', '2 最高64G', '1TB', '無', '2.3', '15.6吋', '2560x1440', '802.11 ax Wi-Fi 6 藍牙5.2', '53.5 Battery (Whr)/ 240W adapter', 'Win 11 home'),
('GV301QH-0072A5900H (Flow X13)', 47900, 'https://tw.buy.yahoo.com/gdsale/ASUS-GV301QH-13吋電競筆電-R9-5900HS-GTX1650-16G-1TB-SSD-9407430.html', 'https://s.yimg.com/zp/MerchandiseImages/439C7A1D7F-Gd-9407430.jpg', 'ASUS華碩', 'AMD Ryzen 9 5900HS Processor 3.1 GHz', 'GTX 1650', '16G(on board)', '無(on board) 最高16G', '1TB', '無', '1.3', '13吋', '3840 x 2400', 'Wi-Fi 6(802.11ax) 藍牙5.1', '62WHrs, 4S1P, 4-cell Li-ion', 'Win10 home'),
('GA503QM-0122E5900HS', 47900, 'https://tw.buy.yahoo.com/gdsale/ASUS-GA503QM-15吋電競筆電-R9-5900HS-RTX3060-16G-512G-SS-9588287.html', 'https://s.yimg.com/zp/MerchandiseImages/0A28F253BB-Gd-9588287.jpg', 'ASUS華碩', 'AMD Ryzen 9 5900HS Processor 3.1 GHz', 'RTX3060', '16G(on board)', '1 最高48G', '512GB', '無', '-', '15.6吋', 'QHD (2560 x 1440)', 'Wi-Fi 6(802.11ax) 藍牙5.1', '-', 'Win10 home'),
('WF65 10TH-1220TW', 47900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-WF65-10TH-1220TW-15吋繪圖工作站筆電-i7-10750H-16G-1T-9234010.html', 'https://s.yimg.com/zp/MerchandiseImages/7A6623C7DC-Gd-9234010.jpg', 'MSI微星', 'i7-10750H 六核心處理器', 'P620', '16G', '2 最高64G', '512GB', '1TB', '1.86', '15.6吋', '1920x1080', '802.11 ax Wi-Fi 6 藍牙5.1', '3-Cell , 51Whr /120W adapter', 'Win10 Pro'),
('Katana GF76 11UE-011TW', 47900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Katana-GF76-11UE-011TW-17-3吋電競筆電-i7-11800H-1-9511585.html', 'https://s.yimg.com/zp/MerchandiseImages/3C90BDE028-SP-9852439.jpg', 'MSI微星', 'i7-11800H', 'RTX3060', '16G', '2 最高64G', '512GB', '無', '2.9', '17.3吋', '1920x1080', 'Intel Wi-Fi 6 AX201 藍牙5.2', '53.5 Battery (Whr) / 180W adapter', 'Win10 home'),
('GV301QE-0022A5900HS (Flow X13)', 47090, 'https://tw.buy.yahoo.com/activity/onsale/combo?actid=368294', 'https://s.yimg.com/zp/MipImages/626279DF0E-MIP-368294.jpeg', 'ASUS華碩', 'AMD Ryzen 9 5900HS Processor 3.1 GHz', 'RTX3050Ti', '32G', '無(on board) 最高32G', '1TB', '無', '1.3', '13吋', '1920 x 1200', 'Wi-Fi 6(802.11ax) 藍牙5.1', '62WHrs, 4S1P, 4-cell Li-ion', 'Win10 home'),
('A5 X1-CTW2130SB', 46999, 'https://tw.buy.yahoo.com/gdsale/技嘉-GIGABYTE-A5-X1-CTW2130SB-15-6吋筆電-R9-5900HX-RTX3-9911498.html', 'https://s.yimg.com/zp/MerchandiseImages/86263B79CF-SP-11011919.jpg', 'GIGABYTE技嘉', 'AMD Ryzen 9 5900HX 行動處理器', 'RTX3070', '16G', '2 最高64G', '512GB', '無', '2.12', '15.6吋', '1920x1080', 'Intel® AX200 Wireless 藍牙5.2', '高達 48.96WHrs', 'Win 11 home'),
('UP5401ZA-0023G12700H', 46900, 'https://tw.buy.yahoo.com/gdsale/ASUS-UP5401ZA-14吋-2-8K觸控翻轉筆電-i7-12700H-16G-1TB-SSD-9956182.html', 'https://s.yimg.com/zp/MerchandiseImages/0B6234B27D-Gd-9956182.jpg', 'ASUS華碩', 'Core i7-12700H Processor 2.3 GHz', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '1TB', '無', '1.4', '14.0吋', '2880 x 1800', 'Wi-Fi 6E(802.11ax) 藍牙5.2', '63WHrs', 'Win 11 home'),
('Prestige 14 A11SCS-034TW', 46900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Prestige-14-A11SCS-034TW-14吋-商務輕薄筆電-i7-1185G-9279051.html', 'https://s.yimg.com/zp/MerchandiseImages/56799A20D5-Gd-9279051.jpg', 'MSI微星', 'i7-1185G7 Processor', 'GTX 1650Ti', '16G(on board)', '無(on board) 最高16G', '1TB', '無', '1.29', '14.0吋', '4K UHD (3840x2160)', '802.11 ax Wi-Fi 6 藍牙5.1', '90W adapter', 'Win10 Pro'),
('Katana GF66 11UE-010TW', 46900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Katana-GF66-11UE-010TW-15-6吋電競筆電-i7-11800H-1-9525481.html', 'https://s.yimg.com/zp/MerchandiseImages/41038AB71F-SP-9881498.jpg', 'MSI微星', 'i7-11800H', 'RTX3060', '16G', '2 最高64G', '512GB', '無', '2.1', '15.6吋', 'FHD (1920x1080)', '802.11 ax Wi-Fi 6 藍牙5.2', '53.5 Battery (Whr)', 'Win10 home'),
('GA401QEC-0022G5900HS', 46900, 'https://tw.buy.yahoo.com/gdsale/ROG-X-Alan-Walker-G14-聯名機-ASUS-GA401QEC-14吋電競筆電-R9-9643706.html', 'https://s.yimg.com/zp/MerchandiseImages/D7F6FD0A3D-Gd-9643706.jpg', 'ASUS華碩', 'Ryzen 9 5900HS Processor 3.1 GHz', 'RTX 3050 Ti', '16G', '2, 已佔用1 最高24G', '1TB', '無', '1.7', '14.0吋', '2560 x 1440', 'Wi-Fi 6(802.11ax) 藍牙5.1', '76WHrs, 4S1P, 4-cell Li-ion', 'Win10 home'),
('ThinkPad T14', 45990, 'https://tw.buy.yahoo.com/gdsale/Lenovo-T14-14吋商務筆電-i7-1165G7-MX450-2G獨顯-8G-512G-PC-9554077.html', 'https://s.yimg.com/zp/MerchandiseImages/749357184E-SP-9964769.jpg', 'Lenovo聯想', 'i7-1165G7 處理器（12M 快取記憶體，最高可達4.70 GHz）', 'NVIDIA GeForce MX450', '8G', '1 最高40G', '512GB', '無', '1.46', '14.0吋', '(1920x1080) IPS', 'Intel AX201 11ax, 2x2 藍牙5.2', '3 Cell', 'Win10 Pro'),
('ProBook 450 G8 (2Z5X9PA)', 45900, 'https://tw.buy.yahoo.com/gdsale/HP-惠普-ProBook-450-G8-15-6吋商用筆電-MX450-15-6FHD-i7-11-9409186.html', 'https://s.yimg.com/zp/MerchandiseImages/F6F5F57E70-SP-9565424.jpg', 'HP惠普', 'i7-1165G7', 'NVIDIA GeForce MX450', '8G', '2 最高32G', '1TB', '無', '1.74', '15.6吋', '1920 x 1080', 'Intel Dual Band Wi-Fi6 AX201 802.11a/b/g/n/ac(2x2) 藍牙5.0', '3 cell (45 WHr / 3.95Ah) / 11 hrs', 'Win10 Pro'),
('KD-72TW623GP', 45900, 'https://tw.buy.yahoo.com/gdsale/GIGABYTE-技嘉-AERO-15-OLED-15-6吋創作者筆電-i7-11800H-RTX3-9549843.html', 'https://s.yimg.com/zp/MerchandiseImages/16726611A5-SP-9955068.jpg', 'GIGABYTE技嘉', '11800H', 'RTX3060', '16G', '2 最高64G', '512GB', '無', '2', '15.6吋', '3840x2160', '乙太網路介面 藍牙5.2', '99Wh', 'Windows 11 Pro'),
('FX707ZM-0021B12700H', 45900, 'https://tw.buy.yahoo.com/gdsale/ASUS-FX707ZM-17-3吋電競筆電-i7-12700H-RTX3060-16G-512G-9880779.html', 'https://s.yimg.com/zp/MerchandiseImages/7524A0EB5B-Gd-9880779.jpg', 'ASUS華碩', '12th Gen Intel® Core i7-12700H Processor 2.3 GHz', 'RTX3060', '16G', '2, 已佔用1 最高32G', '512GB', '無', '2.6', '17.3吋', '1920 x 1080', 'Wi-Fi 6(802.11ax) 藍牙5.2', '90WHrs, 4S1P, 4-cell Li-ion', 'Win 11 home'),
('AN515-58-77MX', 45900, 'https://tw.buy.yahoo.com/gdsale/Acer-AN515-58-77MX-15-6吋電競筆電-i7-12700H-16GB-512GB-9992330.html', 'https://s.yimg.com/zp/MerchandiseImages/4D7B331258-SP-11297721.jpg', 'Acer宏碁', 'Intel® Core i7-12700H', 'RTX3060', '16G', '2 最高32G', '512GB', '無', '2.6', '15.6吋', '1920 x 1080', 'Killer Wi-Fi 6E 1675i 802.11 a/b/g/n/ac/ax 藍牙5.1', '57Wh Li-ion battery', 'Win 11 home'),
('Portege X30L-J PCR10T-04M00X', 45900, 'https://tw.buy.yahoo.com/gdsale/Dynabook-X30L-J-906g13吋超輕薄筆電-i5-1135G7-8G-512-觸控-9357889.html', 'https://s.yimg.com/zp/MerchandiseImages/7798f6593f-Gd-9357889.jpg', 'Dynabook', 'Intel Core i5-1135G7', 'Intel Iris Xe Graphics', '8G(on board)', '2, 已佔用1 最高32G', '512GB', '無', '0.906', '13.3吋', '1920*1080', 'Wi-Fi6 Intel 11ax+acagn 藍牙5.1', '4 Cell /53Whr/ 支援30分鐘快充40%電量', 'Win10 home'),
('ProBook 440 G8 (2Z5H2PA)', 45900, 'https://tw.buy.yahoo.com/gdsale/HP-惠普-ProBook-440-G8-14吋商用筆電-MX450-14FHD-i7-1165G7-9409185.html', 'https://s.yimg.com/zp/MerchandiseImages/BE846AD11A-SP-9565026.jpg', 'HP惠普', 'i7-1165G7', 'NVIDIA GeForce MX450', '8G', '2 最高32G', '1TB', '無', '1.38', '14.0吋', '1920 x 1080', 'Intel Dual Band Wi-Fi6 AX201 802.11a/b/g/n/ac(2x2) 藍牙5.0', '3 cell (45 WHr / 3.95Ah) / 11 hrs', 'Win10 Pro'),
('SF514-56T-71J2', 45900, 'https://tw.buy.yahoo.com/gdsale/Acer-SF514-56T-71J2-14吋12代觸控筆電-Ci7-1260P-16G-512GB-9949783.html', 'https://s.yimg.com/zp/MerchandiseImages/EA90F843D2-SP-11154525.jpg', 'Acer宏碁', 'Intel® Core i7-1260P', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.2', '14.0吋', '2560 x 1600', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.2', '56Wh Li-ion battery', 'Win 11 home'),
('ProBook 635 Aero G7 (201J0AV#71256769)', 45900, 'https://tw.buy.yahoo.com/gdsale/HP-惠普-ProBook-635-Aero-G7-13-3吋商用筆電-Ryzen7P-4750U--9409184.html', 'https://s.yimg.com/zp/MerchandiseImages/862C1A4A54-SP-9565728.jpg', 'HP惠普', '4750U', 'AMD Radeon Graphics', '16G', '2 最高32G', '1TB', '無', '0.999', '13.3吋', '1920 x 1080', 'Intel Wi-Fi 6 AX200 802.11ax (2x2) 藍牙5.0', '3 cell (42 WHr / 3.64Ah)', 'Win10 Pro'),
('Katana GF76 12UE-250TW', 45900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Katana-GF76-12UE-250TW-17-3吋電競筆電-i7-12700H-8-9934734.html', 'https://s.yimg.com/zp/MerchandiseImages/8A07EC1017-SP-11117341.jpg', 'MSI微星', 'i7-12700H', 'RTX3060', '8G', '2 最高64G', '1TB', '無', '2.6', '17.3吋', '1920x1080', '802.11 ax Wi-Fi 6 藍牙5.2', '53.5 Battery (Whr) / 240W adapter', 'Win 11 home'),
('Pulse GL66 11UEK-699TW', 45900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Pulse-GL66-11UEK-699TW-15-6吋11代電競筆電-i7-11800-9860171.html', 'https://s.yimg.com/zp/MerchandiseImages/04FF7DC86F-SP-10905465.jpg', 'MSI微星', 'i7-11800H', 'RTX3060', '16G', '2 最高64G', '1TB', '無', '2.25', '15.6吋', 'FHD (1920x1080)', '802.11 ax Wi-Fi 6 藍牙5.2', '53.5 Battery (Whr)', 'Win 11 home'),
('B9400CEA-0201A1135G7', 45880, 'https://tw.buy.yahoo.com/gdsale/ASUS-ExpertBook-B9-14吋-商用筆電-B9400CEA-0201A1135G7-i-9731987.html', 'https://s.yimg.com/zp/MerchandiseImages/f66af04743-Gd-9731987.jpg', 'ASUS華碩', 'Intel Core i5-1135G7', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高32G', '512GB', '無', '0.995', '14.0吋', '1920 x 1080', 'Wi-Fi 6(802.11ax) 藍牙5.2', '66WHrs，4S1P，4 芯鋰離子', 'Win10 Pro'),
('15-7510-R1848STW11', 44999, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-7000-15-6吋-高性能創作筆電-i7-11800H-16G-512-9777788.html', 'https://s.yimg.com/zp/MerchandiseImages/9D598DD715-SP-10647034.jpg', 'Dell戴爾', '11th Generation Intel® Core i7-11800H', 'NVIDIA® GeForce® RTX 3050 Ti', '16G', '2 最高32G', '512GB', '無', '2.009', '15.6吋', '1920 x 1080', 'Intel Wi-Fi 6 AX201 2x2 (Gig+) 藍牙5.0', '6-Cell Battery, 86 Whr (Integrated)', 'Win 11 home'),
('15-7510-R1748STW11', 44990, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-7000-15-6吋-高性能創作筆電-i7-11800H-16G-512-9844782.html', 'https://s.yimg.com/zp/MerchandiseImages/9D598DD715-SP-10864644.jpg', 'Dell戴爾', '11th Generation Intel® Core i7-11800H', 'NVIDIA® GeForce® RTX 3050', '16G', '2 最高32G', '512GB', '無', '1.938', '15.6吋', '1920 x 1080', 'Intel Wi-Fi 6 AX201 2x2 (Gig+) 藍牙5.0', '3-Cell Battery, 56 Whr (Integrated)', 'Win 11 home'),
('Prestige 15 A11UC-095TW', 44900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Prestige-15-A11UC-095TW-15吋輕薄商務筆電-i7-1195G7-9983691.html', 'https://s.yimg.com/zp/MerchandiseImages/1A15385178-SP-11207730.jpg', 'MSI微星', 'i7-1195G7', 'RTX 3050', '16G', '已佔用1, 2 最高32G', '1TB', '無', '1.69', '15.6吋', 'UHD(3840x2160)', 'Killer ax Wi-Fi 6E 藍牙5.2', '4-Cell / 90W adapter', 'Win 11 home'),
('FX507ZM-0021B12700H', 44900, 'https://tw.buy.yahoo.com/gdsale/ASUS-FX507ZE-15-6吋電競筆電-i7-12700H-RTX-3060-16G-512G-9892913.html', 'https://s.yimg.com/zp/MerchandiseImages/D5DA596CA3-Gd-9892913.jpg', 'ASUS華碩', '12th Gen Intel® Core i7-12700H Processor 2.3 GHz', 'RTX3060', '16G', '2 最高32G', '512GB', '無', '2.2', '15.6吋', '1920 x 1080', 'Wi-Fi 6(802.11ax) 藍牙5.2', '90WHrs, 4S1P, 4-cell Li-ion', 'Win 11 home'),
('M7400QE-0028K5800H', 44900, 'https://tw.buy.yahoo.com/gdsale/ASUS-M7400QE-14吋筆電-R7-5800H-RTX-3050Ti-16G-1TB-SSD-9832790.html', 'https://s.yimg.com/zp/MerchandiseImages/368A311115-Gd-9832790.jpg', 'ASUS華碩', 'AMD Ryzen 7 5800H Mobile Processor', 'NVIDIA® GeForce® RTX 3050Ti', '16G(on board)', '無(on board) 最高16G', '1TB', '無', '-', '14.0吋', '2880 x 1800', 'Wi-Fi 6(802.11ax) 藍牙5.0', '63WHrs', 'Win10 home'),
('GU603HE-0032A11800H', 44900, 'https://tw.buy.yahoo.com/gdsale/ASUS-GU603HE-16吋電競筆電-i7-11800H-RTX3050Ti-16G-512GB-9588289.html', 'https://s.yimg.com/zp/MerchandiseImages/C15E982457-Gd-9588289.jpg', 'ASUS華碩', 'Intel® Core i7-11800H Processor 2.3 GHz', 'RTX3050Ti', '16G(on board)', '1 最高48G', '512GB', '無', '1.9', '16吋', '2560 x 1600', 'Wi-Fi 6(802.11ax) 藍牙5.2', '90WHrs, 4S1P, 4-cell Li-ion', 'Win10 home'),
('Slim 7i 82BC0019TW', 43990, 'https://tw.buy.yahoo.com/gdsale/Lenovo-Legion-Slim-7i-15-6吋電競筆電-i7-10750H-GTX1660T-9516984.html', 'https://s.yimg.com/zp/MerchandiseImages/656B1CE9A8-SP-9867811.jpg', 'Lenovo聯想', 'i7-10750H 六核心2.60 GHz（12M 快取記憶體，最高可達5.00 GHz）', 'GTX 1660Ti', '16G', '1, 已佔用1 最高40G', '512GB', '無', '1.86', '15.6吋', '15.6 FHD (1920x1080) IPS 300nits Anti-glare,144Hz', '11ax, 2x2 藍牙5.1', '230W Slim Tip', 'Win10 home'),
('PLT11T-00T002', 43900, 'https://tw.buy.yahoo.com/gdsale/Dynabook-X50W-J-15-6吋翻轉筆電-i7-1165G7-16G-512SSD-觸控筆-9395034.html', 'https://s.yimg.com/zp/MerchandiseImages/804cf225f1-Gd-9395034.jpg', 'Dynabook', 'Intel Core i7-1165G7', 'Intel Iris Xe Graphics', '16G', '2, 已佔用1 最高32G', '512GB', '無', '1.72', '15.6吋', '1920x1080', 'Wi-Fi6 Intel 11ax+acagn 藍牙5.1', '53Whs 4cell', 'Win10 home'),
('Portege X30L-J PCR10T-04N00X', 43900, 'https://tw.buy.yahoo.com/gdsale/Dynabook-X30L-J-906g13吋超輕薄筆電-i5-1135G7-8G-512-IGZO-9357890.html', 'https://s.yimg.com/zp/MerchandiseImages/d74539bb9c-Gd-9357890.jpg', 'Dynabook', 'Intel Core i5-1135G7', 'Intel Iris Xe Graphics', '8G(on board)', '2, 已佔用1 最高32G', '512GB', '無', '0.906', '13.3吋', '1920*1080', 'Wi-Fi6 Intel 11ax+acagn 藍牙5.1', '4 Cell /53Whr/ 支援30分鐘快充40%電量', 'Win10 home'),
('ProBook 430 G8(2Z5G9PA)', 43900, 'https://tw.buy.yahoo.com/gdsale/HP-惠普-ProBook-430-G8-13-3吋商用筆電-13-3FHD-i7-1165G7-8-9409177.html', 'https://s.yimg.com/zp/MerchandiseImages/26EAB6E26F-SP-9563903.jpg', 'HP惠普', 'i7-1165G7', 'Intel Iris Xe Graphics', '8G', '2 最高32G', '1TB', '無', '1.28', '13.3吋', '1920 x 1080', 'Intel Dual Band Wi-Fi6 AX201 802.11a/b/g/n/ac(2x2) 藍牙5.0', '3 cell (45 WHr / 3.95Ah) / 12 hrs', 'Win10 Pro'),
('SummitE13FlipEvo A11MT-031TW', 43900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Summit-E13FlipEvo-A11MT-031TW-13吋翻轉商務筆電-i7-1-9451635.html', 'https://s.yimg.com/zp/MerchandiseImages/334FE65EA9-Gd-9451635.jpg', 'MSI微星', 'i7-1185G7', 'Intel Iris Xe Graphics', '32G', '1 最高32G', '1TB', '無', '1.35', '13.3吋', '1920x1080', '802.11 ax Wi-Fi 6E 藍牙5.2', '70 Battery (Whr)/65W adapter', 'Win10 Pro'),
('Victus by HP Laptop 16-d0660TX', 43900, 'https://tw.buy.yahoo.com/gdsale/HP-光影V-Victus-16-d0660TX-16-1吋電競筆電-i7-11800H-16G-R-9847849.html', 'https://s.yimg.com/zp/MerchandiseImages/2710DAE8A4-SP-10865906.jpg', 'HP惠普', 'i7-11800H', 'RTX3060', '16G', '2 最高32G', '512GB', '無', '2.46', '16吋', '1920x1080', 'Realtek Cava Wi-Fi 6 ax 2x2 藍牙5.0', '標配 4cell 70Whr', 'Win 11 home'),
('UX435EAL-0232G1165G7', 43900, 'https://tw.buy.yahoo.com/gdsale/ASUS-UX435EAL-14吋筆電-i7-1165G7-16G-512G-EVO-Win-11-9895724.html', 'https://s.yimg.com/zp/MerchandiseImages/CF4358BD4B-Gd-9895724.jpg', 'ASUS華碩', 'Core i7-1165G7 Processor 2.8 GHz', 'Intel® Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '-', '14.0吋', '1920x1080', 'Wi-Fi 6(Gig+)(802.11ax) 藍牙5.0', '-', 'Win 11 home'),
('Katana GF76 11UD-023TW', 43900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Katana-GF76-11UD-023TW-17-3吋電競筆電-i7-11800H-1-9511583.html', 'https://s.yimg.com/zp/MerchandiseImages/3C90BDE028-SP-9852472.jpg', 'MSI微星', 'i7-11800H', 'RTX 3050Ti筆記型電腦GPU', '16G', '2 最高64G', '512GB', '無', '2.9', '17.3吋', '1920x1080', 'Intel Wi-Fi 6 AX201 藍牙5.2', '53.5 Battery (Whr) / 150W adapter', 'Win10 home'),
('Surface Laptop 4 i5/16G/512G', 43288, 'https://tw.buy.yahoo.com/gdsale/微軟-Microsoft-Surface-Laptop-4-13吋-i5-16G-512G墨黑-5A-9590690.html', 'https://s.yimg.com/zp/MerchandiseImages/8A621B43D2-SP-10074317.jpg', 'Microsoft微軟', 'Intel® Core i5-1135G7', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1', '13.5吋', '2256 x 1504 (201 PPI)', 'Wi-Fi 6： 相容於 802.11ax 藍牙5.0', '一般使用時間最長可達 19 小時', 'Win10 home'),
('AORUS 15P KD-72TW223GO', 42900, 'https://tw.buy.yahoo.com/gdsale/技嘉-GIGABYTE-AORUS-15P-KD-72TW223GO-15-6吋筆電-9779116.html', 'https://s.yimg.com/zp/MerchandiseImages/B6088978C1-SP-10588077.jpg', 'GIGABYTE技嘉', 'i7-11800H', 'RTX3060', '16G', '2 最高64G', '512GB', '無', '2.29', '15.6吋', '1920x1080', 'Intel® AX200 Wireless 藍牙5.2', '99Wh', 'Win 11 home'),
('FA707RM-0021B6800H', 42900, 'https://tw.buy.yahoo.com/gdsale/ASUS-FA707RM-17吋電競筆電-R7-6800H-RTX-3060-16GB-512G-W-9923326.html', 'https://s.yimg.com/zp/MerchandiseImages/D127AE640F-Gd-9923326.jpg', 'ASUS華碩', 'AMD Ryzen 7 6800H Processor (up to 4.7 GHz)', 'RTX3060', '16G', '2 最高32G', '512GB', '無', '2.6', '17.3吋', '1920x1080', 'Wi-Fi 6 (802.11ax) 藍牙5.2', '90WHrs, 4S1P, 4-cell Li-ion', 'Win 11 home'),
('Katana GF66 11UD-034TW', 42900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Katana-GF66-11UD-034TW-15-6吋電競筆電-i7-11800H-1-9546005.html', 'https://s.yimg.com/zp/MerchandiseImages/41038AB71F-SP-9921194.jpg', 'MSI微星', 'i7-11800H', 'RTX 3050Ti', '16G', '2 最高64G', '512GB', '無', '2.25', '15.6吋', 'FHD (1920x1080)', '802.11 ax Wi-Fi 6 藍牙5.2', '53.5 Battery (Whr)', 'Win10 home'),
('UX5400EG-0108P1135G7 星河紫', 42900, 'https://tw.buy.yahoo.com/gdsale/ASUS-UX5400EG-14吋2-8K觸控筆電-i5-1135G7-MX450-16G-512G-9829899.html', 'https://s.yimg.com/zp/MerchandiseImages/6E02C7D908-SP-10808191.jpg', 'ASUS華碩', 'Intel® Core i5-1135G7 Processor 2.4 GHz', 'MX450', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.4', '14.0吋', '2880 x 1800', 'Wi-Fi 6(802.11ax) 藍牙5.0', '67WHrs', 'Win 11 home'),
('K3500PC-0032S11370H', 41900, 'https://tw.buy.yahoo.com/gdsale/ASUS-K3500PC-15-6吋筆電-i7-11370H-RTX-3050-16G-512G-S-9795008.html', 'https://s.yimg.com/zp/MerchandiseImages/7E89BA04C9-Gd-9795008.jpg', 'ASUS華碩', 'Core i7-11370H Processor 3.3 GHz', 'NVIDIA® GeForce® RTX 3050', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.65', '15.6吋', '1920 x 1080', 'Wi-Fi 6(802.11ax) 藍牙5.0', '63WHrs', 'Win10 home'),
('FX506HM-0042A11800H', 41900, 'https://tw.buy.yahoo.com/gdsale/ASUS-FX506HM-15吋電競筆電-i7-11800H-RTX3060-8G-512G-TUF-9536492.html', 'https://s.yimg.com/zp/MerchandiseImages/EB9D6777B8-Gd-9536492.jpg', 'ASUS華碩', 'Intel® Core i7-11800H Processor 2.3 GHz', 'RTX3060', '8G', '2, 已佔用1 最高32G', '512GB', '無', '2.3', '15.6吋', '1920 x 1080', 'Wi-Fi 6(802.11ax) 藍牙5.2', '90WHrs, 4S1P, 4-cell Li-ion', 'Win10 home'),
('15-7510-R1648STW11', 40990, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-7000-15-6吋-高性能創作筆電-i5-11400H-16G-512-9844762.html', 'https://s.yimg.com/zp/MerchandiseImages/9D598DD715-SP-10864564.jpg', 'Dell戴爾', '11th Generation Intel® Core i5-11400H', 'NVIDIA® GeForce® RTX 3050', '16G', '2 最高32G', '512GB', '無', '1.938', '15.6吋', '1920 x 1080', 'Intel Wi-Fi 6 AX201 2x2 (Gig+) 藍牙5.0', '3-Cell Battery, 56 Whr (Integrated)', 'Win 11 home'),
('16-5620-R3828STW', 40990, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-5620-16吋-高性能輕薄筆電-I7-1260P-16G-512G-M-10001278.html', 'https://s.yimg.com/zp/MerchandiseImages/7DD5A9A6AE-SP-11337488.jpg', 'Dell戴爾', '12th Generation Intel® Core i7-1260P Processor', 'NVIDIA® GeForce® MX570 Graphics', '16G', '2 最高32G', '512GB', '無', '1.87', '16吋', '3072 x 1920', 'Intel® Wi-Fi 6 AX211 (Gig+) 藍牙4.0', '4-Cell Battery, 54 Whr (Integrated)', 'Win 11 home'),
('UP5401EA-0053G1135G7', 40900, 'https://tw.buy.yahoo.com/gdsale/ASUS-UP5401EA-14吋2-8K觸控翻轉筆電-i5-1135G7-16G-512G-Zen-9850377.html', 'https://s.yimg.com/zp/MerchandiseImages/59C66995B6-Gd-9850377.jpg', 'ASUS華碩', 'Intel® Core i5-1135G7 Processor 2.4 GHz', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '-', '14.0吋', '2880 x 1800', 'Wi-Fi 6(Gig+)(802.11ax) 藍牙5.0', '電池67WHrs', 'Win10 home'),
('GA503QC-0042E5900HS', 40900, 'https://tw.buy.yahoo.com/gdsale/ASUS-GA503QC-15吋電競筆電-R9-5900HS-RTX3050-16G-512G-Ze-9744481.html', 'https://s.yimg.com/zp/MerchandiseImages/A8F1C23F46-Gd-9744481.jpg', 'ASUS華碩', 'AMD Ryzen 9 5900HS Processor 3.1 GHz', 'RTX3050', '16G(on board)', '1 最高48G', '512GB', '無', '-', '15.6吋', 'QHD (2560 x 1440)', 'Wi-Fi 6(802.11ax) 藍牙5.1', '-', 'Win10 home'),
('ProBook 635 Aero G7 (182V8AV#71256770)', 40900, 'https://tw.buy.yahoo.com/gdsale/HP-惠普-ProBook-635-Aero-G7-13-3吋商用筆電-Ryzen5-4500U-8-9409183.html', 'https://s.yimg.com/zp/MerchandiseImages/862C1A4A54-SP-9565668.jpg', 'HP惠普', '4500U', 'AMD Radeon Graphics', '8G', '2 最高32G', '512GB', '無', '0.999', '13.3吋', '1920 x 1080', 'Intel Wi-Fi 6 AX200 802.11ax (2x2) 藍牙5.0', '3 cell (42 WHr / 3.64Ah)', 'Win10 Pro'),
('UP5401ZA-0043G12500H', 40900, 'https://tw.buy.yahoo.com/gdsale/ASUS-UP5401ZA-14吋2-8K觸控翻轉筆電-i5-12500H-16G-512G-Zen-9956180.html', 'https://s.yimg.com/zp/MerchandiseImages/14F50E9B77-Gd-9956180.jpg', 'ASUS華碩', 'Core i5-12500H Processor 2.5 GHz', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.4', '14.0吋', '2880 x 1800', 'Wi-Fi 6E(802.11ax) 藍牙5.2', '63WHrs', 'Win 11 home'),
('UX363EA-0402G1165G7', 40900, 'https://tw.buy.yahoo.com/gdsale/ASUS-UX363EA-13吋筆電-i7-1165G7-16G-512G-SSD-OLED-觸控螢-9723698.html', 'https://s.yimg.com/zp/MerchandiseImages/BA7154080D-Gd-9723698.jpg', 'ASUS華碩', 'Core i7-1165G7 Processor 2.8 GHz', '-', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.3', '13.3吋', '1920x1080', '802.11ax 藍牙5.0', '-', 'Win10 home'),
('AN515-57-74AB', 39900, 'https://tw.buy.yahoo.com/gdsale/Acer-AN515-57-74AB-15吋電競筆電-i7-11800H-RTX3060-16G-5-9644979.html', 'https://s.yimg.com/zp/MerchandiseImages/5B11A2A856-SP-10249851.jpg', 'Acer宏碁', 'Intel® Core i7-11800H', 'RTX3060', '16G', '2 最高32G', '512GB', '無', '2.2', '15.6吋', '1920 x 1080', 'KillerWi-Fi6AX1650i802.11a/b/g/n+acR2+ax2x2MU-MIMO 藍牙5.1', '57Wh Li-ion battery', 'Win10 home'),
('Summit E16FlipEvo A11MT-052TW', 39999, 'https://tw.buy.yahoo.com/gdsale/MSI-微星-Summit-E16FlipEvo-A11MT-052TW-16吋觸控商務筆電-i7-9710556.html', 'https://s.yimg.com/zp/MerchandiseImages/4C6D9CBE1B-SP-10446824.jpg', 'MSI微星', 'i7-1195G7', 'Intel Iris Xe Graphics', '16G(on board)', '已佔用1 最高32G', '1TB', '無', '2', '16吋', '2560 x 1600', 'Killer ax Wi-Fi 6E 藍牙5.2', '90W adapter / 82 Battery (Whr)', 'Win10 Pro'),
('Prestige 14 A11SC-048TW', 39999, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Prestige-14-A11SC-048TW-14吋輕薄商務筆電-i7-1195G7-9808263.html', 'https://s.yimg.com/zp/MerchandiseImages/844ACC5D51-Gd-9808263.jpg', 'MSI微星', 'i7-1195G7', 'GTX 1650', '16G(on board)', '無(on board) 最高16G', '1TB', '無', '1.29', '14.0吋', '3840*2160', 'Killer ax Wi-Fi 6E 藍牙5.2', '52 Battery (Whr)/ 90W adapter', 'Win10 home'),
('V16-5620-R1828ATW', 39990, 'https://tw.buy.yahoo.com/gdsale/DELL-Vostro-5620-16吋筆電-I7-1260P-16G-512G-MX570-Win-9982050.html', 'https://s.yimg.com/zp/MerchandiseImages/AB935C9384-SP-11277454.jpg', 'Dell戴爾', '12th Generation Intel® Core i7-1260P Processor', 'NVIDIA® GeForce® MX570 Graphics', '16G', '2 最高16G', '512GB', '無', '1.91', '16吋', '1920 x 1200', 'Intel® Wi-Fi 6 AX201 (Gig+) 藍牙4.0', '4-Cell Battery, 54 Whr (Integrated)', 'Windows 11 Pro'),
('Yoga Duet 7i (82AS005MTW)', 39990, 'https://tw.buy.yahoo.com/gdsale/Lenovo-Yoga-Duet-7i-13吋2-in-1觸控筆電-I7-10510U-16G-51-9292568.html', 'https://s.yimg.com/zp/MerchandiseImages/2FFB9EDC6D-SP-9238607.jpg', 'Lenovo聯想', 'CORE_I7-10510U_1.8G_4C_MB', 'INTEGRATED_GRAPHICS', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '0.836', '13吋', '2160 x 1350', 'WLAN_2X2AX 藍牙5.0', '4 cell/42Wh/ 12hr', 'Win10 home'),
('Pavilion x360 Convert 14-dy1003TU', 39900, 'https://tw.buy.yahoo.com/gdsale/HP-星鑽翻轉-Pavilion-x360-14-dy1003TU-14吋翻轉筆電-i7-1195-9819827.html', 'https://s.yimg.com/zp/MerchandiseImages/D96BD1112B-SP-10779139.jpg', 'HP惠普', 'Intel Core i7-1195 G7 Quad Core', 'Intel Iris Xe Graphics', '16G', '2 最高16G', '1TB', '無', '1.5', '14.0吋', '1920x1080', 'Mediatek Wi-Fi6 ax2x2 藍牙5.2', '標配 3cell 43Whr', 'Win 11 home'),
('FX507ZE-0041B12700H', 39900, 'https://tw.buy.yahoo.com/gdsale/ASUS-FX507ZE-15-6吋電競筆電-i7-12700H-RTX3050Ti-16G-512-9880777.html', 'https://s.yimg.com/zp/MerchandiseImages/4E306E6663-Gd-9880777.jpg', 'ASUS華碩', '12th Gen Intel® Core i7-12700H Processor 2.3 GHz', 'RTX 3050Ti', '16G', '2 最高32G', '512GB', '無', '2.2', '15.6吋', '1920 x 1080', 'Wi-Fi 6(802.11ax) 藍牙5.2', '56WHrs, 4S1P, 4-cell Li-ion', 'Win 11 home'),
('FX707ZE-0021B12700H', 39900, 'https://tw.buy.yahoo.com/gdsale/ASUS-FX707ZE-17-3吋電競筆電-i7-12700H-RTX3050Ti-8G-512G-9880778.html', 'https://s.yimg.com/zp/MerchandiseImages/7524A0EB5B-Gd-9880778.jpg', 'ASUS華碩', '12th Gen Intel® Core i7-12700H Processor 2.3 GHz', 'RTX 3050Ti', '8G', '2 最高32G', '512GB', '無', '2.6', '17.3吋', '1920 x 1080', 'Wi-Fi 6(802.11ax) 藍牙5.2', '56WHrs, 4S1P, 4-cell Li-ion', 'Win 11 home'),
('UX3402ZA-0042B1260P', 39900, 'https://tw.buy.yahoo.com/gdsale/ASUS-UX3402ZA-14吋2-8K筆電-i7-1260P-16G-512G-EVO-ZenB-9994607.html', 'https://s.yimg.com/zp/MerchandiseImages/A52843E9D5-Gd-9994607.jpg', 'ASUS華碩', 'Core i7-1260P Processor 2.1 GHz', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.39', '14.0吋', '2880 x 1800', 'Wi-Fi 6E(802.11ax) 藍牙5.2', '75WHrs', 'Win 11 home');
INSERT INTO `specifics_yahoo` (`nb_id`, `yahoo_price`, `yahoo_url`, `img_url`, `brand`, `cpu`, `gpu`, `ram`, `slot_max`, `SSD`, `HDD`, `weight`, `inch`, `resolution`, `internet_device`, `battery`, `windows_version`) VALUES
('B5302FEA-0091A1135G7', 39900, 'https://tw.buy.yahoo.com/gdsale/ASU-ExpertBook-B5-13-3吋-商用筆電-B5302FEA-0091A1135G7--9886978.html', 'https://s.yimg.com/zp/MerchandiseImages/7521c2e25f-Gd-9886978.jpg', 'ASUS華碩', 'Intel® Core i5-1135G7 Processor 2.4 GHz', 'Intel Iris Xᵉ Graphics', '16G(on board)', '1 最高48G', '512GB', '無', '1.3', '13.3吋', '1920 x 1080', 'Wi-Fi 6(802.11ax) 藍牙5.2', '66Whrs', 'Win10 Pro'),
('AN515-57-72Y9', 39000, 'https://tw.buy.yahoo.com/gdsale/福利品-Acer-AN515-57-72Y9-15吋筆電-i7-11800H-16GB-512G--9795380.html', 'https://s.yimg.com/zp/MerchandiseImages/5B11A2A856-SP-10507227.jpg', 'Acer宏碁', 'Intel® Core i7-11800H', 'RTX3060', '16G', '2 最高32G', '512GB', '無', '2.2', '15.6吋', '1920 x 1080', 'KillerWi-Fi6AX1650i802.11a/b/g/n+acR2+ax2x2MU-MIMO 藍牙5.1', '57Wh Li-ion battery', 'Win10 home'),
('Thinkpad T15 Gen2', 39900, 'https://tw.buy.yahoo.com/gdsale/Lenovo-T15-15-6吋商務筆電-i5-1135G7-MX450-2G獨顯-16G-512G-9614522.html', 'https://s.yimg.com/zp/MerchandiseImages/2F4030935D-SP-10150094.jpg', 'Lenovo聯想', 'i5-1135G7 四核心2.40 GHz（8M 快取記憶體，最高可達4.20 GHz）', 'MX450', '16G', '1, 已佔用1 最高40G', '512GB', '無', '1.82', '15.6吋', '(1920x1080) 300nits', 'Intel AX210 11ax, 2x2 藍牙5.2', '3 Cell', 'Win10 home'),
('ProBook 440 G8 (2Z5H1PA)', 39900, 'https://tw.buy.yahoo.com/gdsale/HP-惠普-ProBook-440-G8-14吋商用筆電-MX450-14FHD-i5-1135G7-9409189.html', 'https://s.yimg.com/zp/MerchandiseImages/BE846AD11A-SP-9564919.jpg', 'HP惠普', 'i5-1135G7', 'NVIDIA GeForce MX450', '8G', '2 最高32G', '512GB', '無', '1.38', '14.0吋', '1920 x 1080', 'Intel Dual Band Wi-Fi 6 AX201 802.11a/b/g/n/ac 藍牙5.0', '3 cell (45 WHr / 3.95Ah) / 11 hrs', 'Win10 Pro'),
('B7402FEA-0071A1155G7', 39900, 'https://tw.buy.yahoo.com/gdsale/ASUS-ExpertBook-B7-14吋-商用筆電-B7402FEA-0071A1155G7-i-9934745.html', 'https://s.yimg.com/zp/MerchandiseImages/1E4F4D6036-SP-11139156.jpg', 'ASUS華碩', 'Intel Core i5-1155G7 Processor 2.5 GHz', 'Intel Iris Xe Graphics', '16G(on board)', '1 最高32G', '512GB', '無', '1.44', '14.0吋', '1920 x 1080', 'Wi-Fi 6 (802.11ax) 藍牙5.2', '63Whrs', 'Win10 Pro'),
('ProBook 450 G8 (2Z5H3PA)', 39900, 'https://tw.buy.yahoo.com/gdsale/HP-惠普-ProBook-450-G8-15-6吋商用筆電-MX450-15-6FHD-i5-11-9409187.html', 'https://s.yimg.com/zp/MerchandiseImages/F6F5F57E70-SP-9565371.jpg', 'HP惠普', 'i5-1135G7', 'NVIDIA GeForce MX450', '8G', '2 最高32G', '512GB', '無', '1.74', '15.6吋', '1920 x 1080', 'Intel Dual Band Wi-Fi6 AX201 802.11a/b/g/n/ac(2x2) 藍牙5.0', '3 cell (45 WHr / 3.95Ah) / 11 hrs', 'Win10 Pro'),
('UX3402ZA-0072E1260P', 39900, 'https://tw.buy.yahoo.com/gdsale/ASUS-UX3402ZA-14吋2-8K筆電-i7-1260P-16G-512G-EVO-ZenB-9994608.html', 'https://s.yimg.com/zp/MerchandiseImages/7C5185ED3C-Gd-9994608.jpg', 'ASUS華碩', 'Core i7-1260P Processor 2.1 GHz', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.39', '14.0吋', '2880 x 1800', 'Wi-Fi 6E(802.11ax) 藍牙5.2', '75WHrs', 'Win 11 home'),
('PH317-54-731U', 39900, 'https://tw.buy.yahoo.com/gdsale/Acer-PH317-54-731U-17吋電競筆電-i7-10750H-RTX2060-16G-5-9125534.html', 'https://s.yimg.com/zp/MerchandiseImages/F0D2186E9B-Gd-9125534.jpg', 'Acer宏碁', 'Intel® Core i7-10750H', 'RTX2060', '16G', '2, 已佔用1 最高32G', '512GB', '無', '2.9', '17.3吋', '1920x1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.0', '59Wh 4-cell Li-ion battery', 'Win10 home'),
('Crosshair 17 A11UDK-457TW', 39090, 'https://tw.buy.yahoo.com/activity/onsale/combo?actid=368281', 'https://s.yimg.com/zp/MipImages/F0FE9EB8ED-MIP-368281.jpeg', 'MSI微星', 'i7-11800H', 'RTX 3050Ti', '16G', '2 最高64G', '1TB', '無', '2.6', '17.3吋', '1920x1080', '802.11 ax Wi-Fi 6 藍牙5.2', '53.5 Battery (Whr)/ 150W adapter', 'Win10 home'),
('A7 K1-BTW1150SB', 38999, 'https://tw.buy.yahoo.com/gdsale/技嘉-GIGABYTE-A7-K1-BTW1150SB-17-3吋筆電-R7-5800H-RTX-3-9959399.html', 'https://s.yimg.com/zp/MerchandiseImages/77971F90F3-SP-11126837.jpg', 'GIGABYTE技嘉', 'R7-5800H', 'RTX3060', '16G', '2 最高64G', '1TB', '無', '2.48', '17.3吋', '1920x1080', 'Intel® AX200 Wireless (相容802.11ax, a/b/g/n/ac/ax) 藍牙5.2', '48.96WHrs', 'Win 11 home'),
('14-5420-R2828STW', 38990, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-5420-14吋-高性能輕薄筆電-I7-1260P-16G-512G-M-9988146.html', 'https://s.yimg.com/zp/MerchandiseImages/3900B48442-SP-11294733.jpg', 'Dell戴爾', '12th Generation Intel® Core i7-1260P Processor', 'NVIDIA® GeForce® MX570 Graphics', '16G', '2 最高32G', '512GB', '無', '1.87', '14.0吋', '2240 x 1400', 'Intel® Wi-Fi 6 AX211 (Gig+) 藍牙4.0', '4-Cell Battery, 54 Whr (Integrated)', 'Win 11 home'),
('16-5620-R2828STW', 38990, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-5620-16吋-高性能輕薄筆電-I5-1240P-16G-512G-M-9987686.html', 'https://s.yimg.com/zp/MerchandiseImages/7DD5A9A6AE-SP-11293318.jpg', 'Dell戴爾', '12th Generation Intel® Core i7-1260P Processo', 'NVIDIA® GeForce® MX570 Graphics', '16G', '2 最高32G', '512GB', '無', '1.87', '16吋', '1920 x 1200', 'Intel® Wi-Fi 6 AX211 (Gig+) 藍牙4.0', '4-Cell Battery, 54 Whr (Integrated)', 'Win 11 home'),
('82AW002QTW', 38990, 'https://tw.buy.yahoo.com/gdsale/Lenovo-IdeaPad-Legion-5pi-15吋筆電-I5-10300H-8G-512G--9077656.html', 'https://s.yimg.com/zp/MerchandiseImages/E1971EC0F9-Gd-9077656.jpg', 'Lenovo聯想', 'CORE_I5-10300H_2.5G_4C_MB', 'GTX 1660Ti', '8G', '已佔用1 最高8G', '512GB', '無', '2.3', '15.6吋', '1920 x 1080', 'WLAN_2X2AX 藍牙5.0', '4CELL_80WH_INTERNAL', 'Win10 home'),
('G15-5520-R2648BTW', 38990, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-Gaming-G15-5520-15-6吋電競筆電-i5-12500H--9935562.html', 'https://s.yimg.com/zp/MerchandiseImages/A13CE73843-SP-11141092.jpg', 'Dell戴爾', '12thGen Intel® Corei5-12500H 10-Core Processor', 'NVIDIA® GeForce RTX3050 Ti', '16G', '2 最高32G', '512GB', '無', '2.437', '15.6吋', '1920 x 1080', 'Intel Wi-Fi 6 AX201, 2x2 802.11ax 藍牙4.0', '56 WHr, 3-Cell Battery (integrated)', 'Win 11 home'),
('G15-5520-R1748NTW', 38990, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-Gaming-G15-5520-15-6吋電競筆電-i7-12700H--9969577.html', 'https://s.yimg.com/zp/MerchandiseImages/4C72B1200B-SP-11245121.jpg', 'Dell戴爾', '12thGen Intel® Corei7-12700H 14-Core Processor', 'NVIDIA GeForce RTX 3050', '16G', '2 最高32G', '512GB', '無', '2.437', '15.6吋', '1920 x 1080', 'Intel Wi-Fi 6 AX201, 2x2 802.11ax 藍牙4.0', '86 WHr, 6-Cell Battery (integrated)', 'Win 11 home'),
('G15-5520-R1748BTW', 38990, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-Gaming-G15-5520-15-6吋電競筆電-i7-12700H--9960036.html', 'https://s.yimg.com/zp/MerchandiseImages/A13CE73843-SP-11215930.jpg', 'Dell戴爾', '12thGen Intel® Corei7-12700H 14-Core Processor', 'NVIDIA GeForce RTX 3050', '16G', '2 最高32G', '512GB', '無', '2.437', '15.6吋', '1920 x 1080', 'Intel Wi-Fi 6 AX201, 2x2 802.11ax 藍牙4.0', '86 WHr, 6-Cell Battery', 'Win 11 home'),
('Pavilion x360 Convert 14-dy0115TU', 38900, 'https://tw.buy.yahoo.com/gdsale/HP-星鑽翻轉-Pavilion-x360-14-dy0115TU-14吋翻轉筆電-i7-1165-9662738.html', 'https://s.yimg.com/zp/MerchandiseImages/4F3CC5F4A8-SP-10301491.jpg', 'HP惠普', 'Intel Core i7-1165 G7 Quad Core', 'Intel Iris Xe Graphics', '16G', '2 最高16G', '1TB', '無', '1.5', '14.0吋', '1920x1080', 'Intel Wi-Fi 6 AX 201 (2x2) 藍牙5.0', '標配 3cell 43Whr', 'Win10 home'),
('SummitE13FlipEvo A11MT-241TW', 38900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Summit-E13FlipEvo-A11MT-241TW-13吋翻轉商務筆電-i7-1-9732626.html', 'https://s.yimg.com/zp/MerchandiseImages/20C0B6E4DD-Gd-9732626.jpg', 'MSI微星', 'i7-1185G7', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '1TB', '無', '1.35', '13.4吋', '1920x1080', '802.11 ax Wi-Fi 6E 藍牙5.2', '70 Battery (Whr)/65W adapter', 'Win10 Pro'),
('UX435EAL-0252G1135G7', 38900, 'https://tw.buy.yahoo.com/gdsale/ASUS-UX435EAL-14吋筆電-i5-1135G7-16G-512G-EVO-Win-11-9895723.html', 'https://s.yimg.com/zp/MerchandiseImages/0ED5288A9C-Gd-9895723.jpg', 'ASUS華碩', 'Core i5-1135G7 Processor 2.4 GHz', 'Intel® Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '-', '14.0吋', '1920x1080', 'Wi-Fi 6(Gig+)(802.11ax) 藍牙5.0', '-', 'Win 11 home'),
('Pavilion Aero Laptop 13-be0153AU', 38900, 'https://tw.buy.yahoo.com/gdsale/HP-星鑽-Pavilion-Aero-13-be0153AU-13-3吋輕薄筆電-R7-5800U-9855562.html', 'https://s.yimg.com/zp/MerchandiseImages/8EBF0FDA42-SP-10892132.jpg', 'HP惠普', 'AMD Ryzen 7-5800U, 8 cores', 'AMD Radeon Graphics', '16G(on board)', '無(on board) 最高16G', '1TB', '無', '1', '13.3吋', 'WQXGA (2560x1600) IPS超廣角窄邊框 100% sRGB, 400nits', 'Realtak Cava Wi-Fi 6 ax2x2 藍牙5.2', '標配 3cell 43Whr', 'Win 11 home'),
('Crosshair 15 A11UDK-875TW', 38900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Crosshair-15-A11UDK-875TW-15吋創作者筆電-i7-11800H-9819824.html', 'https://s.yimg.com/zp/MerchandiseImages/3839C09E03-SP-10784342.jpg', 'MSI微星', 'i7-11800H', 'RTX 3050Ti', '16G', '2 最高64G', '1TB', '無', '2.25', '15.6吋', '1920x1080', '802.11 ax Wi-Fi 6 藍牙5.2', '53.5 Battery (Whr)/ 150W adapter', 'Win10 home'),
('PLT11T-00U003', 38900, 'https://tw.buy.yahoo.com/gdsale/Dynabook-X50W-J-15-6吋翻轉筆電-i5-1135G7-8G-512SSD-觸控筆-9395035.html', 'https://s.yimg.com/zp/MerchandiseImages/3f2a7ef138-Gd-9395035.jpg', 'Dynabook', 'Intel Core i5-1135G7', 'Intel Iris Xe Graphics', '8G', '2, 已佔用1 最高32G', '512GB', '無', '1.72', '15.6吋', '1920x1080', 'Wi-Fi6 Intel 11ax+acagn 藍牙5.1', '53Whs 4cell', 'Win10 home'),
('UX425EA-0662G1165G7', 38900, 'https://tw.buy.yahoo.com/gdsale/ASUS-UX425EA-14吋筆電-i7-1165G7-16G-512G-ZenBook-14-綠-9842109.html', 'https://s.yimg.com/zp/MerchandiseImages/46D825C4A0-Gd-9842109.jpg', 'ASUS華碩', 'Intel® Core i7-1165G7 Processor 2.8 GHz', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.17', '14.0吋', '1920x1080', 'Wi-Fi 6(Gig+)(802.11ax) 藍牙5.0', '67WHrs', 'Win 11 home'),
('B1500CEAE-0181A1165G7', 38800, 'https://tw.buy.yahoo.com/gdsale/ASU-ExpertBook-B1-15-6吋-商用筆電-B1500CEAE-0181A1165G7-9886975.html', 'https://s.yimg.com/zp/MerchandiseImages/fc04c5f5f8-Gd-9886975.jpg', 'ASUS華碩', 'Intel® Core i7-1165G7 Processor 2.8 GHz', 'Intel® Iris® Xe Graphics', '16G(on board)', '1 最高48G', '512GB', '2TB', '1.75', '15.6吋', '1920 x 1080', 'Wi-Fi 6(802.11ax) 藍牙5.2', '42WHrs，3S1P，3 芯鋰離子', 'Win10 Pro'),
('B5302FEA-0071A1135G7', 37999, 'https://tw.buy.yahoo.com/activity/onsale/combo?actid=368329', 'https://s.yimg.com/zp/MipImages/45B74363B3-MIP-368329.jpeg', 'ASUS華碩', 'Intel® Core i5-1135G7 Processor 2.4 GHz', 'Intel Iris Xᵉ Graphics', '16G(on board)', '1 最高48G', '512GB', '無', '1.3', '13.3吋', '1920 x 1080', 'Wi-Fi 6(802.11ax) 藍牙5.2', '66Whrs', 'Win10 Pro'),
('AN517-54-75TM', 37900, 'https://tw.buy.yahoo.com/gdsale/Acer-AN517-54-75TM-17吋筆電-i7-11800H-RTX3050Ti-16G-5-9566554.html', 'https://s.yimg.com/zp/MerchandiseImages/C4D1062775-SP-9997831.jpg', 'Acer宏碁', 'Intel® Core i7-11800H', 'RTX3050Ti', '16G', '2 最高32G', '512GB', '無', '2.7', '17.3吋', '1920x1080', 'KillerWi-Fi6AX1650i802.11a/b/g/n+acR2+ax2x2MU-MIMO 藍牙5.1', '57Wh Li-ion battery', 'Win10 home'),
('Yoga Duet 7i (82AS005NTW)', 37990, 'https://tw.buy.yahoo.com/gdsale/Lenovo-Yoga-Duet-7i-13吋2-in-1觸控筆電-I7-10510U-16G-51-9292591.html', 'https://s.yimg.com/zp/MerchandiseImages/579590DF2D-SP-9238791.jpg', 'Lenovo聯想', 'CORE_I7-10510U_1.8G_4C_MB', 'INTEGRATED_GRAPHICS', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '0.836', '13吋', '2160 x 1350', 'WLAN_2X2AX 藍牙5.0', '4 cell/42Wh/ 12hr', 'Win10 home'),
('16-5620-R3628STW', 37990, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-5620-16吋-高性能輕薄筆電-I5-1240P-16G-512G-M-10001233.html', 'https://s.yimg.com/zp/MerchandiseImages/7DD5A9A6AE-SP-11337415.jpg', 'Dell戴爾', '12th Generation Intel® Core i5-1240P Processor', 'NVIDIA® GeForce® MX570 Graphics', '16G', '2 最高32G', '512GB', '無', '1.87', '16吋', '3072 x 1920', 'Intel® Wi-Fi 6 AX211 (Gig+) 藍牙4.0', '4-Cell Battery, 54 Whr (Integrated)', 'Win 11 home'),
('G15-5511-R1648BTW', 37990, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-Gaming-G15-15-6吋電競筆電-i5-11400H-16G-5-9633425.html', 'https://s.yimg.com/zp/MerchandiseImages/73E8E7ADEB-SP-10214354.jpg', 'Dell戴爾', '11thGen Intel® Core i5-11400H Hex Core Processor', 'RTX3050', '16G', '2 最高32G', '512GB', '無', '2.437', '15.6吋', '1920 x 1080', 'Intel Wi-Fi 6 AX201, 2x2 802.11ax 藍牙4.0', '56 WHr, 3-Cell Battery (integrated)', 'Win10 home'),
('AN517-54-75F2', 37900, 'https://tw.buy.yahoo.com/gdsale/Acer-AN517-54-75F2-17吋筆電-i7-11800H-RTX3050Ti-16G-5-9748787.html', 'https://s.yimg.com/zp/MerchandiseImages/F523F95CFE-Gd-9748787.jpg', 'Acer宏碁', 'Intel® Core i7-11800H', 'RTX3050Ti', '16G', '2 最高32G', '512GB', '無', '2.7', '17.3吋', '1920x1080', 'KillerWi-Fi6AX1650i802.11a/b/g/n+acR2+ax2x2MU-MIMO 藍牙5.1', '57Wh Li-ion battery', 'Win10 home'),
('Sword 15 A12UC-014TW', 37900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Sword-15-A12UC-014TW-15-6吋電競筆電-i7-12700H-8G-9859073.html', 'https://s.yimg.com/zp/MerchandiseImages/A2923CE7F4-SP-10904328.jpg', 'MSI微星', 'i7-12700H', 'RTX 3050筆記型電腦GPU', '8G', '2 最高64G', '512GB', '無', '2.25', '15.6吋', '1920x1080, 144Hz', 'Gb LAN / 802.11 ax Wi-Fi 6 藍牙5.2', '53.5 Battery (Whr) / 180W adapter', 'Win 11 home'),
('UX3402ZA-0152E1260P', 37900, 'https://tw.buy.yahoo.com/gdsale/ASUS-UX3402ZA-14吋2-5K筆電-i7-1260P-16G-512GB-EVO-Zen-9994579.html', 'https://s.yimg.com/zp/MerchandiseImages/F6EEA664F4-Gd-9994579.jpg', 'ASUS華碩', 'Core i7-1260P Processor 2.1 GHz', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.39', '14.0吋', '2560 x 1600', 'Wi-Fi 6E(802.11ax) 藍牙5.2', '75WHrs', 'Win 11 home'),
('Prestige 15 A11SB-467TW', 37900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Prestige-15-A11SB-467TW-15吋創作者筆電-i7-1185G7-1-9667478.html', 'https://s.yimg.com/zp/MerchandiseImages/35956EC0A2-SP-10309105.jpg', 'MSI微星', 'i7-1185G7', 'MX450', '8G', '2 最高64G', '512GB', '無', '1.69', '15.6吋', '1920x1080', '802.11 ax Wi-Fi 6 藍牙5.1', '4-Cell 82 Battery (Whr) 90W adapter', 'Win10 home'),
('UX3402ZA-0032B1260P', 37900, 'https://tw.buy.yahoo.com/gdsale/ASUS-UX3402ZA-14吋2-5K筆電-i7-1260P-16G-512GB-EVO-Zen-9994584.html', 'https://s.yimg.com/zp/MerchandiseImages/87211ADD5D-Gd-9994584.jpg', 'ASUS華碩', 'Core i7-1260P Processor 2.1 GHz', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.39', '14.0吋', '2560 x 1600', 'Wi-Fi 6E(802.11ax) 藍牙5.2', '75WHrs', 'Win 11 home'),
('SF514-55GT-7030', 35900, 'https://tw.buy.yahoo.com/gdsale/福利品-Acer-SF514-55GT-7030-14吋筆電-9898757.html', 'https://s.yimg.com/zp/MerchandiseImages/B7D16E24E8-SP-10461242.jpg', 'Acer宏碁', 'Intel® Core i7-1165G7', 'MX350', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.050', '14.0吋', '1920 x 1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.1', '56Wh Li-ion battery', 'Win 11 home'),
('A5 K1-BTW2150SB', 36999, 'https://tw.buy.yahoo.com/gdsale/技嘉-GIGABYTE-A5-K1-BTW2150SB-15-6吋筆電-R7-5800H-RTX30-9911500.html', 'https://s.yimg.com/zp/MerchandiseImages/19D367B924-SP-11012205.jpg', 'GIGABYTE技嘉', 'AMD Ryzen 7 5800H 行動處理器 (3.2 GHz~4.4 GHz)', 'RTX3060', '16G', '2 最高64G', '1TB', '無', '2.12', '15.6吋', '1920x1080', 'Intel® AX200 Wireless 藍牙5.2', '高達 48.96WHrs', 'Win 11 home'),
('FX517ZC-0021D12650H', 36900, 'https://tw.buy.yahoo.com/gdsale/ASUS-FX517ZC-15-6吋電競筆電-i7-12650H-RTX-3050-8G-512G-9923277.html', 'https://s.yimg.com/zp/MerchandiseImages/634A362ABA-Gd-9923277.jpg', 'ASUS華碩', 'Core i7-12650H Processor 2.3 GHz', 'NVIDIA® GeForce RTX 3050', '8G', '2 最高32G', '512GB', '無', '2', '15.6吋', '1920 x 1080', 'Wi-Fi 6(802.11ax) 藍牙5.2', '76WHrs, 4S1P, 4-cell Li-ion', 'Win 11 home'),
('UX363EA-0392G1135G7', 36900, 'https://tw.buy.yahoo.com/gdsale/ASUS-UX363EA-13吋筆電-i5-1135G7-16G-512G-OLED觸控螢幕-Win-9723699.html', 'https://s.yimg.com/zp/MerchandiseImages/3A52545C3C-Gd-9723699.jpg', 'ASUS華碩', 'Core i5-1135G7 Processor 2.4 GHz', '-', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.3', '13.3吋', '1920x1080', '802.11ax 藍牙5.0', '-', 'Win10 home'),
('K3500PC-0062B11300H', 36900, 'https://tw.buy.yahoo.com/gdsale/ASUS-K3500PC-15-6吋筆電-i5-11300H-RTX-3050-16G-512GB-9694454.html', 'https://s.yimg.com/zp/MerchandiseImages/E56411C7B2-Gd-9694454.jpg', 'ASUS華碩', 'Core i5-11300H Processor 3.1 GHz', 'NVIDIA® GeForce® RTX 3050', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.65', '15.6吋', '1920 x 1080', 'Wi-Fi 6(802.11ax) 藍牙5.0', '63WHrs', 'Win10 home'),
('UX3402ZA-0082E1240P', 36900, 'https://tw.buy.yahoo.com/gdsale/ASUS-UX3402ZA-14吋2-8K筆電-i5-1240P-16G-512GB-EVO-Zen-9994582.html', 'https://s.yimg.com/zp/MerchandiseImages/C12E64D201-Gd-9994582.jpg', 'ASUS華碩', 'Core i5-1240P Processor 1.7 GHz', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.39', '14.0吋', '2880 x 1800', 'Wi-Fi 6E(802.11ax) 藍牙5.2', '75WHrs', 'Win 11 home'),
('K3500PC-0132S11300H', 36900, 'https://tw.buy.yahoo.com/gdsale/ASUS-K3500PC-15-6吋筆電-i5-11300H-RTX-3050-16G-512G-V-9832786.html', 'https://s.yimg.com/zp/MerchandiseImages/2CEA751533-Gd-9832786.jpg', 'ASUS華碩', 'Core i5-11300H Processor 3.1 GHz', 'NVIDIA® GeForce® RTX 3050', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.65', '15.6吋', '1920 x 1080', 'Wi-Fi 6(802.11ax) 藍牙5.0', '63WHrs', 'Win 11 home'),
('UX3402ZA-0062B1240P', 36900, 'https://tw.buy.yahoo.com/gdsale/ASUS-UX3402ZA-14吋2-8K筆電-i5-1240P-16G-512GB-EVO-Zen-9994583.html', 'https://s.yimg.com/zp/MerchandiseImages/C3B5EA4590-Gd-9994583.jpg', 'ASUS華碩', 'Core i5-1240P Processor 1.7 GHz', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.39', '14.0吋', '2880 x 1800', 'Wi-Fi 6E(802.11ax) 藍牙5.2', '75WHrs', 'Win 11 home'),
('PH315-53-728Z', 36900, 'https://tw.buy.yahoo.com/gdsale/AcerPH315-53-728Z15吋i711800H16G512GPredator黑-9597679.html', 'https://s.yimg.com/zp/MerchandiseImages/19CFAAE1CF-SP-10089870.jpg', 'Acer宏碁', 'i7-10870H', 'RTX 2070', '16G', '2 最高32G', '512GB', '無', '2.2', '15.6吋', '1920 x 1080', '802.11a/b/g/n/acR2+ax2x2MU-MIMOKillerWi-Fi6AX1650i 藍牙5.0', '59 Wh 4-cell Li-ion battery', 'Win10 home'),
('G513RC-0042F6800H', 36900, 'https://tw.buy.yahoo.com/gdsale/ASUS-G513RC-15-6吋電競筆電-R7-6800H-RTX-3050-8G-512G-Wi-9892895.html', 'https://s.yimg.com/zp/MerchandiseImages/E66EEC32BE-Gd-9892895.jpg', 'ASUS華碩', 'Ryzen 7 6800H Processor', 'RTX 3050', '8G', '2 最高32G', '512GB', '無', '-', '15.6吋', 'FHD (1920 x 1080)', 'Wi-Fi 6(802.11ax) 藍牙5.2', '-', 'Win 11 home'),
('AN515-57-710X', 36900, 'https://tw.buy.yahoo.com/gdsale/福利品-Acer-AN515-57-710X-15吋筆電-i7-11800H-16G-512G-S-9795361.html', 'https://s.yimg.com/zp/MerchandiseImages/9BB78C7E51-SP-10431679.jpg', 'Acer宏碁', 'Intel® Core i7-11800H', 'RTX3050Ti', '16G', '2 最高32G', '512GB', '無', '2.2', '15.6吋', '1920 x 1080', 'KillerWi-Fi6AX1650i802.11a/b/g/n+acR2+ax2x2MU-MIMO 藍牙5.1', '57Wh Li-ion battery', 'Win10 home'),
('FA507RE-0031B6800H', 36900, 'https://tw.buy.yahoo.com/gdsale/ASUS-FA507RE-15-6吋電競筆電-R7-6800H-RTX3050Ti-16G-512G-9974722.html', 'https://s.yimg.com/zp/MerchandiseImages/A3F4D15064-Gd-9974722.jpg', 'ASUS華碩', 'Ryzen 7 6800H Processor', 'NVIDIA® GeForce RTX 3050 Ti', '16G', '2 最高32G', '512GB', '無', '2.2', '15.6吋', '1920 x 1080', 'Wi-Fi 6(802.11ax) 藍牙5.2', '90WHrs, 4S1P, 4-cell Li-ion', 'Win 11 home'),
('B9450FA-3401A10610U', 36880, 'https://tw.buy.yahoo.com/gdsale/ASUS-ExpertBook-B9450FA-14吋-商用筆電-B9450FA-3401A1061-9732136.html', 'https://s.yimg.com/zp/MerchandiseImages/e3c184d918-Gd-9732136.jpg', 'ASUS華碩', 'Intel Core i7-10610U', 'Intel UHD Graphics 620', '16G(on board)', '無(on board) 最高16G', '1TB', '無', '0.99', '14.0吋', '1920 x 1080', 'Wi-Fi 6 (802.11ax) 藍牙5.0', '66Wh 4 芯鋰聚合物電池', 'Win10 Pro'),
('G15-5520-R1648BTW', 35990, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-Gaming-G15-5520-15-6吋電競筆電-i5-12500H--9947696.html', 'https://s.yimg.com/zp/MerchandiseImages/A13CE73843-SP-11174200.jpg', 'Dell戴爾', '12thGen Intel® Corei5-12500H 10-Core Processor', 'NVIDIA GeForce RTX 3050', '16G', '2 最高32G', '512GB', '無', '2.437', '15.6吋', '1920 x 1080', 'Intel Wi-Fi 6 AX201, 2x2 802.11ax 藍牙4.0', '56 WHr, 3-Cell Battery (integrated)', 'Win 11 home'),
('16-5620-R2628STW', 35990, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-5620-16吋-高性能輕薄筆電-I5-1240P-16G-512G-M-9987673.html', 'https://s.yimg.com/zp/MerchandiseImages/7DD5A9A6AE-SP-11293274.jpg', 'Dell戴爾', '12th Generation Intel® Core i5-1240P Processor', 'NVIDIA® GeForce® MX570 Graphics', '16G', '2 最高32G', '512GB', '無', '1.87', '16吋', '1920 x 1200', 'Intel® Wi-Fi 6 AX211 (Gig+) 藍牙4.0', '4-Cell Battery, 54 Whr (Integrated)', 'Win 11 home'),
('V16-5620-R1628ATW', 35990, 'https://tw.buy.yahoo.com/gdsale/DELL-Vostro-5620-16吋筆電-I5-1240P-16G-512G-MX570-Win-9982032.html', 'https://s.yimg.com/zp/MerchandiseImages/AB935C9384-SP-11277072.jpg', 'Dell戴爾', '12th Generation Intel® Core i5-1240P Processo', 'NVIDIA® GeForce® MX570 Graphics', '16G', '2 最高32G', '512GB', '無', '1.91', '16吋', '1920 x 1200', 'Intel® Wi-Fi 6 AX201 (Gig+) 藍牙4.0', '4-Cell Battery, 54 Whr (Integrated)', 'Windows 11 Pro'),
('G15-5520-R1648NTW', 35990, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-Gaming-G15-5520-15-6吋電競筆電-i5-12500H--9969558.html', 'https://s.yimg.com/zp/MerchandiseImages/4C72B1200B-SP-11245018.jpg', 'Dell戴爾', '12thGen Intel® Corei5-12500H 10-Core Processor', 'NVIDIA GeForce RTX 3050', '16G', '2 最高32G', '512GB', '無', '2.437', '15.6吋', '1920 x 1080', 'Intel Wi-Fi 6 AX201, 2x2 802.11ax 藍牙4.0', '56 WHr, 3-Cell Battery (integrated)', 'Win 11 home'),
('14-5420-R2628STW', 35990, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-5420-14吋-高性能輕薄筆電-I5-1240P-16G-512G-M-9987922.html', 'https://s.yimg.com/zp/MerchandiseImages/3900B48442-SP-11294401.jpg', 'Dell戴爾', '12th Generation Intel® Core i5-1240P Processor', 'NVIDIA® GeForce® MX570 Graphics', '16G', '2 最高32G', '512GB', '無', '1.87', '14.0吋', '2240 x 1400', 'Intel® Wi-Fi 6 AX211 (Gig+) 藍牙4.0', '4-Cell Battery, 54 Whr (Integrated)', 'Win 11 home'),
('FX506HEB-0042A11800H', 35900, 'https://tw.buy.yahoo.com/gdsale/ASUS-FX506HEB-15吋電競筆電-i7-11800H-RTX-3050Ti-8G-512G-9643124.html', 'https://s.yimg.com/zp/MerchandiseImages/1F268587DC-Gd-9643124.jpg', 'ASUS華碩', 'Intel® Core i7-11800H Processor 2.3 GHz', 'RTX3050Ti', '8G', '2 最高32G', '512GB', '無', '2.3', '15.6吋', '1920 x 1080', 'Wi-Fi 6(802.11ax) 藍牙5.2', '48WHrs, 3S1P, 3-cell Li-ion', 'Win10 home'),
('13-ay0537AU', 35900, 'https://tw.buy.yahoo.com/gdsale/HP-極羨-ENVY-x360-13-ay0537AU-13吋輕薄翻轉觸控筆電-R7-4700U-1-9733124.html', 'https://s.yimg.com/zp/MerchandiseImages/F99121E6AF-SP-10509442.jpg', 'HP惠普', 'AMD Ryzen 7-4700U', 'AMD Radeon Graphics', '16G(on board)', '已佔用1 最高16G', '512GB', '無', '1.3', '13.3吋', '1920x1080', 'Realtek 820.11ac 2x2 藍牙5.0', '3cell 51Whr', 'Win10 home'),
('Prestige 14Evo A11M-272TW', 35900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Prestige-14Evo-A11M-272TW-14吋-商務輕薄筆電-i7-1185-9332486.html', 'https://s.yimg.com/zp/MerchandiseImages/B2021A6071-Gd-9332486.jpg', 'MSI微星', 'i7-1185G7 Processor', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '1TB', '無', '1.29', '14.0吋', 'FHD (1920x1080)', '802.11 ax Wi-Fi 6 藍牙5.1', '65W adapter', 'Win10 home'),
('UM425QA-0062G5900HX', 35900, 'https://tw.buy.yahoo.com/gdsale/ASUS-UM425QA-14吋筆電-R9-5900HX-16G-512G-ZenBook-14-綠-9643127.html', 'https://s.yimg.com/zp/MerchandiseImages/f7d6280a37-Gd-9643127.jpg', 'ASUS華碩', 'AMD Ryzen 9 5900HX Processor 3.3GHz', 'AMD Radeon Vega 7 Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.3', '14.0吋', '1920x1080', 'Wi-Fi 6(Gig+)(802.11ax) 藍牙5.0', '63WHrs', 'Win10 home'),
('FA707RC-0021B6800H', 35900, 'https://tw.buy.yahoo.com/gdsale/ASUS-FA707RC-17吋電競筆電-R7-6800H-RTX3050-8GB-512G-TUF-9911055.html', 'https://s.yimg.com/zp/MerchandiseImages/19B689F29D-Gd-9911055.jpg', 'ASUS華碩', 'AMD Ryzen 7 6800H Processor (up to 4.7 GHz)', 'GeForce RTX 3050', '8G', '2 最高32G', '512GB', '無', '2.6', '17.3吋', '1920x1080', 'Wi-Fi 6 (802.11ax) 藍牙5.2', '56WHrs, 4S1P, 4-cell Li-ion', 'Win 11 home'),
('Prestige 14Evo A11M-271TW', 35900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Prestige-14Evo-A11M-271TW-14吋輕薄商務筆電-i7-1185G-9332485.html', 'https://s.yimg.com/zp/MerchandiseImages/4AAAC88873-Gd-9332485.jpg', 'MSI微星', 'i7-1185G7 Processor', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '1TB', '無', '1.29', '14.0吋', '1920x1080', '802.11 ax Wi-Fi 6 藍牙5.1', '65W adapter', 'Win10 home'),
('SFX16-51G-75ZR', 35900, 'https://tw.buy.yahoo.com/gdsale/Acer-SFX16-51G-75ZR-16吋輕薄效能筆電-i7-11390H-RTX3050Ti-9869787.html', 'https://s.yimg.com/zp/MerchandiseImages/F35F76EFA0-SP-10930415.jpg', 'Acer宏碁', 'i7-11390H', 'RTX 3050Ti', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.9', '16吋', '1920 x 1080', '802.11a/b/g/n/acR2+ax  2x2 MU-MIMO 藍牙5.1', '59 Wh 4-cell Li-ion battery', 'Win 11 home'),
('14s-dq2039TU', 34900, 'https://tw.buy.yahoo.com/gdsale/HP-超品-14s-dq2039TU-i7-1165-G7-16GB-1TB-PCIe-SSD-Wi-9755759.html', 'https://s.yimg.com/zp/MerchandiseImages/DDD63ADEE4-SP-10570342.jpg', 'HP惠普', 'i7-1165 G7', 'Intel Iris Xe Graphics', '16G', '2 最高16G', '1TB', '無', '1.47', '14.0吋', '1920x1080', 'Intel Wi-Fi 6 AX 201 (2x2) 藍牙5.0', '3cell 41WHr', 'Win10 home'),
('S435EA-0099E1165G7', 35900, 'https://tw.buy.yahoo.com/gdsale/ASUS-S435EA-14吋筆電-i7-1165G7-16G-512GB-SSD-VivoBook-9777705.html', 'https://s.yimg.com/zp/MerchandiseImages/e3016cdfd1-Gd-9777705.jpg', 'ASUS華碩', 'Intel® Core i7-1165G7 Processor 2.8 GHz', 'Intel Iris Xᵉ Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '-', '14.0吋', '1920x1080', 'Wi-Fi 6(Gig+)(802.11ax) 藍牙5.0', '-', 'Win 11 home'),
('ProBook 440 G8(2Z5H0PA)', 35900, 'https://tw.buy.yahoo.com/gdsale/HP-惠普-ProBook-440-G8-14吋商用筆電-14FHD-i5-1135G7-8G-1--9409188.html', 'https://s.yimg.com/zp/MerchandiseImages/BE846AD11A-SP-9564737.jpg', 'HP惠普', 'i5-1135G7', 'Intel Iris Xe Graphics', '8G', '2 最高32G', '512GB', '無', '1.38', '14.0吋', '1920 x 1080', 'Intel Dual Band Wi-Fi6 AX201 802.11a/b/g/n/ac(2x2) 藍牙5.0', '3 cell (45 WHr / 3.95Ah) / 12 hrs', 'Win10 Pro'),
('UX5401EA-0142G1135G7', 35900, 'https://tw.buy.yahoo.com/gdsale/ASUS-UX5401EA-14吋2K筆電-i5-1135G7-16G-512G-ZenBook-綠-9850376.html', 'https://s.yimg.com/zp/MerchandiseImages/a989f339bb-Gd-9850376.jpg', 'ASUS華碩', 'Intel® Core i5-1135G7 Processor 2.4 GHz', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.4', '14.0吋', '2560 x 1600', 'Wi-Fi 6(802.11ax) 藍牙5.0', '63WHrs', 'Win 11 home'),
('15s-fq4023TU', 35900, 'https://tw.buy.yahoo.com/gdsale/HP-超品-15s-fq4023TU-i7-1195-G7-16GB-1TB-PCIe-SSD-9830553.html', 'https://s.yimg.com/zp/MerchandiseImages/9CF31348BC-SP-10774238.jpg', 'HP惠普', 'i7-1195 G7', 'Intel® Iris® Xe Graphics', '4G', '2 最高16G', '1TB', '無', '1.69', '15.6吋', 'FHD(1920x1080)', 'Mediatek Wi-Fi6 ax2x2 藍牙5.2', '3cell 41WHr', 'Win 11 home'),
('15s-fq2007TU (2M7H7PA)', 35900, 'https://tw.buy.yahoo.com/gdsale/HP-惠普-超品-15s-fq2007TU-15-6吋-窄邊框筆電-i7-1165-G7-16G-1-9508248.html', 'https://s.yimg.com/zp/MerchandiseImages/62482FA10D-SP-9844502.jpg', 'HP惠普', '11th Gen Intel Core i7-1165 G7 Quad Core', 'Intel® Iris® Xe Graphics', '16G', '無(on board) 最高16G', '1TB', '無', '1.74', '15.6吋', '1920x1080', 'Intel Wi-Fi 6 AX 201 (2x2) 藍牙5.0', '標配 3cell 41Whr', 'Win10 home'),
('ProBook 430 G8 (2Z5G8PA)', 35900, 'https://tw.buy.yahoo.com/gdsale/HP-惠普-ProBook-430-G8-13-3吋商用筆電-13-3FHD-i5-1135G7-8-9409180.html', 'https://s.yimg.com/zp/MerchandiseImages/26EAB6E26F-SP-9563657.jpg', 'HP惠普', 'i5-1135G7', 'Intel Iris Xe Graphics', '8G', '2 最高32G', '512GB', '無', '1.28', '13.3吋', '1920 x 1080', 'Intel Dual Band Wi-Fi6 AX201 802.11a/b/g/n/ac(2x2) 藍牙5.0', '3 cell (45 WHr / 3.95Ah) / 12 hrs', 'Win10 Pro'),
('X535LI-0323G10300H', 35888, 'https://tw.buy.yahoo.com/gdsale/ASUS-UX535LI-15-6吋筆電-i5-10300H-GTX1650Ti-16GB-512G-9787791.html', 'https://s.yimg.com/zp/MerchandiseImages/feffe0eb3d-Gd-9787791.jpg', 'ASUS華碩', 'Intel® Core i5-10300H Processor 2.5 GHz', 'GTX 1650Ti', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '2.00', '15.6吋', '1920 x 1080', 'Wi-Fi 6(802.11ax) 藍牙5.0', '96WHrs, 3S2P, 6-cell Li-ion', 'Win10 home'),
('Surface Laptop 4 i5/8G/512G', 35288, 'https://tw.buy.yahoo.com/gdsale/微軟-Microsoft-Surface-Laptop-4-13吋-i5-8G-512G白金-5BT-9487064.html', 'https://s.yimg.com/zp/MerchandiseImages/67C0D64AB8-SP-9779955.jpg', 'Microsoft微軟', 'Intel® Core i5-1135G7', 'Intel Iris Xe Graphics', '8G', '無(on board) 最高8G', '512GB', '無', '1', '13.5吋', '2256 x 1504 (201 PPI)', 'Wi-Fi 6： 相容於 802.11ax 藍牙5.0', '一般使用時間最長可達 19 小時', 'Win10 home'),
('4C8E9PA', 35000, 'https://tw.buy.yahoo.com/gdsale/HP-惠普-240-G8-14吋輕薄窄邊框商用筆電4C8E9PA-i7-1165G7-8G-512G-9731651.html', 'https://s.yimg.com/zp/MerchandiseImages/6E8A85F1B6-SP-10504981.jpg', 'HP惠普', 'Intel Core i7-1165G7', 'Intel Iris Xe Graphics', '8G', '2, 已佔用1 最高16G', '512GB', '無', '1.48', '14.0吋', '1920 x 1080', 'Intel AX201 ax 2x2 WiFi6 藍牙5.0', '3 cell 41 WHr/3.63Ah', 'Win10 Pro'),
('13-5320-R1808PTW', 34989, 'https://tw.buy.yahoo.com/activity/onsale/combo?actid=363154', 'https://s.yimg.com/zp/MipImages/DBE085CF65-MIP-363154.jpeg', 'Dell戴爾', '12th Generation Intel® Core i7-1260P Processor', 'Intel® Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.25', '13.3吋', '2560 x1600', 'Intel® Wi-Fi 6 AX211 (Gig+) 藍牙4.0', '4-Cell Battery, 54 Whr (Integrated)', 'Win 11 home'),
('UX3402ZA-0132E1240P', 34900, 'https://tw.buy.yahoo.com/gdsale/ASUS-UX3402ZA-14吋2-5K筆電-i5-1240P-16G-512GB-EVO-Zen-9994581.html', 'https://s.yimg.com/zp/MerchandiseImages/9D4E3AEAD6-Gd-9994581.jpg', 'ASUS華碩', 'Core i5-1240P Processor 1.7 GHz', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.39', '14.0吋', '2560 x 1600', 'Wi-Fi 6E(802.11ax) 藍牙5.2', '75WHrs', 'Win 11 home'),
('G5 KD-52TW123SO', 34900, 'https://tw.buy.yahoo.com/gdsale/技嘉-GIGABYTE-G5-KD-52TW123SO-15-6吋筆電-9807485.html', 'https://s.yimg.com/zp/MerchandiseImages/745502F453-SP-10739186.jpg', 'GIGABYTE技嘉', 'i5-11400H', 'RTX3060', '16G', '已佔用2 最高64G', '512GB', '無', '2.18', '15.6吋', '1920x1080', 'Intel® AX201 Wireless 藍牙5.2', '48.96WHrs', 'Win 11 home'),
('SFX14-41G-R9KE', 34900, 'https://tw.buy.yahoo.com/gdsale/Acer-SFX14-41G-R9KE-14吋筆電-R7-5800U-RTX3050Ti-16G-5-9655801.html', 'https://s.yimg.com/zp/MerchandiseImages/748486A455-SP-10276472.jpg', 'Acer宏碁', 'AMD Ryzen 7 5800U', 'RTX3050Ti', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.39', '14.0吋', '1920 x 1080', '802.11a/b/g/n+ax MU-MIMO RX technology 藍牙5.2', '59Wh Li-ion battery', 'Win10 home'),
('Sword 15 A11UC-073TW', 34900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Sword-15-A11UC-073TW-15-6吋電競筆電-i7-11800H-8G-9511586.html', 'https://s.yimg.com/zp/MerchandiseImages/88EC8C4996-SP-9852511.jpg', 'MSI微星', 'i7-11800H', 'RTX 3050筆記型電腦GPU', '8G', '2 最高64G', '512GB', '無', '2.1', '15.6吋', '1920x1080', 'Intel Wi-Fi 6 AX201 藍牙5.2', '53.5 Battery (Whr) / 150W adapter', 'Win10 home'),
('K3500PC-0102B11300H', 34900, 'https://tw.buy.yahoo.com/gdsale/ASUS-K3500PC-15-6吋筆電-i5-11300H-RTX-3050-16G-512GB-9696859.html', 'https://s.yimg.com/zp/MerchandiseImages/C2E621DCC8-Gd-9696859.jpg', 'ASUS華碩', 'Core i5-11300H Processor 3.1 GHz', 'NVIDIA® GeForce® RTX 3050', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.65', '15.6吋', '1920 x 1080', 'Wi-Fi 6(802.11ax) 藍牙5.0', '50WHrs', 'Win10 home'),
('SF514-55TA-718E', 34000, 'https://tw.buy.yahoo.com/gdsale/福利品-Acer-SF514-55TA-718E-14吋筆電-i7-1165G7-16G-512G--9606167.html', 'https://s.yimg.com/zp/MerchandiseImages/08CC5BBAF1-SP-9125861.jpg', 'Acer宏碁', 'Intel® Core i7-1165G7', '無', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.05', '14.0吋', '1920x1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.1', '56Wh Li-ion battery', 'Win10 home'),
('Victus by HP Laptop 16-d0664TX', 34900, 'https://tw.buy.yahoo.com/gdsale/HP-光影V-Victus-16-d0664TX-16-1吋電競筆電-i5-11400H-8G-RT-10001341.html', 'https://s.yimg.com/zp/MerchandiseImages/9A01CED153-SP-11335089.jpg', 'HP惠普', 'i5-11400H', 'RTX 3050', '8G', '2 最高32G', '512GB', '無', '2.46', '16吋', '1920x1080', 'Intel Wi-Fi 6 AX 201 (2x2) 藍牙5.0', '標配 4cell 70Whr', 'Win 11 home'),
('GF63 10UC-474TW', 34900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-GF63-10UC-474TW-15-6吋電競筆電-i7-10750H-8G-RTX30-9569784.html', 'https://s.yimg.com/zp/MerchandiseImages/539AAD9B54-SP-10010890.jpg', 'MSI微星', 'i7-10750H', 'RTX 3050', '8G', '2 最高64G', '512GB', '無', '1.86', '15.6吋', 'FHD (1920x1080)', '802.11 ax Wi-Fi 6 藍牙5.1', '51 Battery (Whr)150W adapter', 'Win10 home'),
('Alpha 15 B5EEK-023TW', 34900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Alpha-15-B5EEK-023TW-15吋電競筆電-Ryzen-7-5800H-1-9613047.html', 'https://s.yimg.com/zp/MerchandiseImages/E52267E307-SP-10131672.jpg', 'MSI微星', 'Ryzen 7 5800H', 'RX 6600M', '16G', '2 最高64G', '512GB', '無', '2.35', '15.6吋', '1920x1080', '802.11 ax Wi-Fi 6 藍牙5.1', '53.5 Battery (Whr)', 'Win10 home'),
('UX3402ZA-0052B1240P', 34900, 'https://tw.buy.yahoo.com/gdsale/ASUS-UX3402ZA-14吋2-5K筆電-i5-1240P-16G-512GB-EVO-Zen-9994580.html', 'https://s.yimg.com/zp/MerchandiseImages/D73017AA02-Gd-9994580.jpg', 'ASUS華碩', 'Core i5-1240P Processor 1.7 GHz', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.39', '14.0吋', '2560 x 1600', 'Wi-Fi 6E(802.11ax) 藍牙5.2', '75WHrs', 'Win 11 home'),
('dynabook EX40L-J PMM10T-04901W', 34900, 'https://tw.buy.yahoo.com/gdsale/dynabook-EX40L-J-14吋日系筆電-i7-1165G7-16GB-512GB-Win1-9636480.html', 'https://s.yimg.com/zp/MerchandiseImages/BE9A3B865C-SP-10224302.jpg', 'Dynabook', 'Intel Core i7-1165G7', 'Intel Iris Xe Graphics', '16G', '2, 已佔用1 最高32G', '512GB', '無', '1.47', '14.0吋', '1920*1080', 'Wi-Fi6 Intel 11ax+acagn 藍牙5.1', 'LI-Po 4-53Wh', 'Win10 home'),
('SF514-55TA-773B', 33900, 'https://tw.buy.yahoo.com/gdsale/福利品-Acer-SF514-55TA-773B-14吋筆電-i7-1165G7-16G-512G-9898768.html', 'https://s.yimg.com/zp/MerchandiseImages/B7D16E24E8-SP-10601569.jpg', 'Acer宏碁', 'Intel® Core i7-1165G7', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.050', '14.0吋', '1920 x 1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.1', '56Wh Li-ion battery', 'Win 11 home'),
('AN515-57-70G6', 34900, 'https://tw.buy.yahoo.com/gdsale/Acer-AN515-57-70G6-15吋筆電-i7-11800H-RTX3050Ti-16G-5-9566559.html', 'https://s.yimg.com/zp/MerchandiseImages/5B11A2A856-SP-9998583.jpg', 'Acer宏碁', 'Intel® Core i7-11800H', 'RTX3050Ti', '16G', '2 最高32G', '512GB', '無', '2.2', '15.6吋', '1920x1080', 'KillerWi-Fi6AX1650i802.11a/b/g/n+acR2+ax2x2MU-MIMO 藍牙5.1', '57Wh Li-ion battery', 'Win10 home'),
('Ideapad 5 Pro 16ACH6 82L500GATW', 33990, 'https://tw.buy.yahoo.com/gdsale/Lenovo-IdeaPad-5-Pro-16吋效能筆電-Ryzen-7-5800H-RTX3050-9973240.html', 'https://s.yimg.com/zp/MerchandiseImages/DFD5475236-SP-11252493.jpg', 'Lenovo聯想', 'Ryzen 7 5800H (8C/16T, 3.2/4.4GHz, 4MB L2/16MB L3)', 'GeForce RTX 3050', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.9', '16吋', '2560x1600,120Hz', 'Wi-Fi 6 11ax, 2x2 藍牙5.1', 'Integrated 75Wh', 'Win 11 home'),
('Yoga Slim 7i 82A10077TW', 33990, 'https://tw.buy.yahoo.com/gdsale/Lenovo-YOGA-Slim-7i-14吋效能輕薄筆電-i7-1065G7-8G-1TB-PCI-9536805.html', 'https://s.yimg.com/zp/MerchandiseImages/A5DBFBAA09-SP-9920921.jpg', 'Lenovo聯想', 'i7-1065G7 處理器（8M 快取記憶體，最高3.90 GHz）', 'Intel Iris Xe Graphics', '8G', '無(on board) 最高8G', '1TB', '無', '1.36', '14.0吋', '1920x1080', '802.11ax 2x2 藍牙5.0', '4 Cell', 'Win10 home'),
('V16-5620-R1528ATW', 33990, 'https://tw.buy.yahoo.com/gdsale/DELL-Vostro-5620-16吋筆電-I5-1240P-8G-512G-MX570-Win1-9984981.html', 'https://s.yimg.com/zp/MerchandiseImages/AB935C9384-SP-11287206.jpg', 'Dell戴爾', '12th Generation Intel® Core i5-1240P Processor', 'NVIDIA® GeForce® MX570 Graphics', '8G', '2 最高32G', '512GB', '無', '1.91', '16吋', '1920 x 1200', 'Intel® Wi-Fi 6 AX201 (Gig+) 藍牙4.0', '4-Cell Battery, 54 Whr (Integrated)', 'Windows 11 Pro'),
('FX506HM-0072B11400H', 33900, 'https://tw.buy.yahoo.com/gdsale/ASUS-FX506HM-15吋電競筆電-i5-11400H-RTX3060-8G-512G-戰魂黑-9952023.html', 'https://s.yimg.com/zp/MerchandiseImages/EB7E318A89-Gd-9952023.jpg', 'ASUS華碩', 'Core i5-11400H Processor 2.7 GHz', 'RTX3060', '8G', '2 最高32G', '512GB', '無', '2.3', '15.6吋', '1920 x 1080', 'Wi-Fi 6(802.11ax) 藍牙5.2', '90WHrs, 4S1P, 4-cell Li-ion', 'Win 11 home'),
('Prestige 14Evo A11MO-067TW', 33900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Prestige-14Evo-A11MO-067TW-14吋輕薄商務筆電-i7-1195-9850265.html', 'https://s.yimg.com/zp/MerchandiseImages/32C9C17751-SP-10791465.jpg', 'MSI微星', 'i7-1195G7', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '1TB', '無', '1.29', '14.0吋', '1920x1080', 'Killer ax Wi-Fi 6E 藍牙5.2', '65W adapter', 'Win10 home'),
('M3401QC-0118B5600H', 33900, 'https://tw.buy.yahoo.com/gdsale/ASUS-M3401QC-14吋筆電-R5-5600H-RTX-3050-16G-512G-Vivo-9832789.html', 'https://s.yimg.com/zp/MerchandiseImages/69C9708C2F-Gd-9832789.jpg', 'ASUS華碩', 'AMD Ryzen 5 5600H Mobile Processor', 'NVIDIA® GeForce® RTX 3050', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.4', '14.0吋', '2880 x 1800', 'Wi-Fi 6(802.11ax) 藍牙5.0', '63 WHrs', 'Win 11 home'),
('Prestige 14Evo A11MO-049TW', 33900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Prestige-14Evo-A11MO-049TW-14吋輕薄商務筆電-i7-1195-9822050.html', 'https://s.yimg.com/zp/MerchandiseImages/3610A8D20B-SP-10791058.jpg', 'MSI微星', 'i7-1195G7', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '1TB', '無', '1.29', '14.0吋', '1920x1080', 'Killer ax Wi-Fi 6E 藍牙5.2', '65W adapter', 'Win10 home'),
('XENIA14I5G11GXELX-BKCTW', 33900, 'https://tw.buy.yahoo.com/gdsale/ADATA威剛-XENIA-14I5G11GXELX-BKCTW-輕巧商用筆電-9733683.html', 'https://s.yimg.com/zp/MerchandiseImages/6E02AC09F5-SP-10507097.jpg', 'XPG', '第11代Intel® Core i5-1135G7', 'Intel Iris Xe 繪圖晶片', '16G', '已佔用2, 1 最高64G', '512GB', '無', '0.97', '14.0吋', '1920x1200', 'Wifi 6 AX201 藍牙5.1', '-', 'Win10 Pro'),
('AN515-55-51GB', 33900, 'https://tw.buy.yahoo.com/gdsale/Acer-AN515-55-51GB-15吋電競筆電-i5-10300H-GTX1650Ti-8G--9582889.html', 'https://s.yimg.com/zp/MerchandiseImages/376E359E12-Product-25401720.jpg', 'Acer宏碁', 'i5-10300H', 'GTX 1650Ti', '8G', '2, 已佔用1 最高32G', '512GB', '無', '2.3', '15.6吋', '1920x1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.0', '57Wh Li-ion battery', 'Win10 home'),
('Legion5Pi (82AW002TTW)', 33900, 'https://tw.buy.yahoo.com/gdsale/Lenovo-Legion-5Pi-15-6吋電競筆電-I7-10750H-16G-1TB-GTX1-9291978.html', 'https://s.yimg.com/zp/MerchandiseImages/C13C26012E-SP-9237062.jpg', 'Lenovo聯想', 'CORE_I7-10750H_2.6G_6C_MB', 'GTX 1660Ti', '16G', '2 最高16G', '1TB', '無', '2.3', '15.6吋', '1920x1080', 'WLAN_2X2AX 藍牙5.0', '4CELL_80WH_INTERNAL', 'Win10 home'),
('14s-dq4001TU', 33900, 'https://tw.buy.yahoo.com/gdsale/HP-超品-14s-dq4001TU-i7-1195-G7-16G-1T-PCIe-SSD-Win1-9838969.html', 'https://s.yimg.com/zp/MerchandiseImages/030C46456A-SP-10831471.jpg', 'HP惠普', 'i7-1195 G7', 'Intel Iris Xe Graphics', '16G', '2 最高16G', '1TB', '無', '1.47', '14.0吋', '1920x1080', 'Intel Wi-Fi 6 AX 201 (2x2) 藍牙5.0', '3cell 41WHr', 'Win 11 home'),
('FX516PE-0031A11370H', 33900, 'https://tw.buy.yahoo.com/gdsale/ASUS-FX516PE-15吋電競筆電-i7-11370H-RTX3050Ti-8GB-512G-9506867.html', 'https://s.yimg.com/zp/MerchandiseImages/2EE9914E59-Gd-9506867.jpg', 'ASUS華碩', 'Intel Core i7-11370H Processor 3.3 GHz', 'RTX3050Ti', '8G(on board)', '2 最高32G', '512GB', '無', '-', '15.6吋', 'FHD (1920 x 1080) 16:9', 'Wi-Fi 6(802.11ax) 藍牙5.1', '76WHrs, 4S1P, 4-cell Li-ion', 'Win10 home'),
('M3500QC-0112B5600H', 33680, 'https://tw.buy.yahoo.com/activity/onsale/combo?actid=338073', 'https://s.yimg.com/zp/MipImages/7D1B8A7D5C-MIP-338073.jpeg', 'ASUS華碩', 'AMD Ryzen 5 5600H Processor 3.3GHz', 'NVIDIA® GeForce® RTX 3050', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.65', '15.6吋', '1920 x 1080', 'Wi-Fi 6(802.11ax) 藍牙5.0', '63WHrs', 'Win10 home'),
('Surface Laptop 3 i5/8G/256G', 33189, 'https://tw.buy.yahoo.com/activity/onsale/combo?actid=363176', 'https://s.yimg.com/zp/MipImages/5B109C555C-MIP-363176.jpeg', 'Microsoft微軟', 'Quad-core 10th Gen Intel® Core i5-1035G7', 'Intel® Iris Plus Graphics', '8G', '無(on board) 最高8G', '256GB', '無', '1', '13.5吋', '2256 x 1504 (201 PPI)', 'Wi-Fi 6： 相容於 802.11ax 藍牙5.0', '一般裝置使用方式可達 11.5 小時', 'Win10 home'),
('SFX14-41G-R2CE', 32900, 'https://tw.buy.yahoo.com/gdsale/Acer-SFX14-41G-R2CE-14吋筆電-R7-5800U-RTX3050-16G-512-9597685.html', 'https://s.yimg.com/zp/MerchandiseImages/e5ea2667a2-Gd-9597685.jpg', 'Acer宏碁', 'AMD Ryzen 7 5800U', 'RTX3050', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.39', '14.0吋', '1920x1080', '802.11a/b/g/n+ax MU-MIMO RX technology 藍牙5.2', '59Wh Li-ion battery', 'Win10 home'),
('ThinkPad L15 Gen 2', 32990, 'https://tw.buy.yahoo.com/gdsale/Lenovo-ThinkPad-L15-Gen-2-15-6吋商務筆電-i5-1135G7-8G-1-9959021.html', 'https://s.yimg.com/zp/MerchandiseImages/D7F06F484F-SP-11209789.jpg', 'Lenovo聯想', 'i5-1135G7 (4C / 8T, 2.4 / 4.2GHz, 8MB)', 'Intel Iris Xe Graphics', '8G', '2, 已佔用1 最高64G', '256GB', '1TB', '1.98', '15.6吋', '1920x1080', 'RTL8852AE 11ax, 2x2 藍牙5.2', 'Integrated 45Wh', 'Win10 Pro'),
('16-5620-R1808CTW', 32990, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-5620-16吋-高性能輕薄筆電-I7-1260P-16G-512G-W-9990967.html', 'https://s.yimg.com/zp/MerchandiseImages/F96B8CCEF8-SP-11303560.jpg', 'Dell戴爾', '12th Generation Intel® Core i7-1260P Processor', 'Intel® Iris Xe Graphics', '16G', '2 最高32G', '512GB', '無', '1.87', '16吋', '1920 x 1200', 'Intel® Wi-Fi 6 AX211 (Gig+) 藍牙4.0', '4-Cell Battery, 54 Whr (Integrated)', 'Win 11 home'),
('Legion5i (82AU00ECTW)', 32990, 'https://tw.buy.yahoo.com/gdsale/Lenovo-Legion-5i-15-6吋電競筆電-I5-10300H-8G-512G-GTX16-9291655.html', 'https://s.yimg.com/zp/MerchandiseImages/A47E5355AC-SP-9236777.jpg', 'Lenovo聯想', 'Intel CORE I5-10300H 2.5G 4C MB', 'GTX 1650Ti', '8G', '1 最高8G', '512GB', '無', '2.3', '15.6吋', '1920x1080', 'WLAN_2X2AX 藍牙5.0', '4CELL_60WH', 'Win10 home'),
('ThinkPad P14s Gen2', 32990, 'https://tw.buy.yahoo.com/gdsale/Lenovo-ThinkPad-P14s-Gen-2-14吋商務筆電-Ryzen-5-PRO-565-9959019.html', 'https://s.yimg.com/zp/MerchandiseImages/DAE51CC684-SP-11210157.jpg', 'Lenovo聯想', 'Ryzen5 PRO 5650U(6C/12T,2.3/4.2GHz,3MB L2/16MB L3)', 'Integrated AMD Radeon Graphics', '16G', '1 最高48G', '512GB', '無', '1.55', '14.0吋', '1920x1080', 'Wi-Fi 6 11ax, 2x2 藍牙5.2', 'Integrated 50Wh', 'Win10 Pro'),
('16-5620-R1628STW', 32990, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-5620-16吋-高性能輕薄筆電-I5-1240P-16G-512G-M-10001076.html', 'https://s.yimg.com/zp/MerchandiseImages/7DD5A9A6AE-SP-11337038.jpg', 'Dell戴爾', '12th Generation Intel® Core i5-1240P Processor', 'NVIDIA® GeForce® MX570 Graphics', '16G', '2 最高32G', '512GB', '無', '1.87', '16吋', '1920 x 1200', 'Intel® Wi-Fi 6 AX211 (Gig+) 藍牙4.0', '4-Cell Battery, 54 Whr (Integrated)', 'Win 11 home'),
('14-5420-R1628STW', 32990, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-5420-14吋-高性能輕薄筆電-5-1240P-16G-512G-MX-9987899.html', 'https://s.yimg.com/zp/MerchandiseImages/3900B48442-SP-11294267.jpg', 'Dell戴爾', '12th Generation Intel® Core i5-1240P Processor', 'NVIDIA® GeForce® MX570 Graphics', '16G', '2 最高32G', '512GB', '無', '1.87', '14.0吋', '1920 x 1200', 'Intel® Wi-Fi 6 AX211 (Gig+) 藍牙4.0', '4-Cell Battery, 54 Whr (Integrated)', 'Win 11 home'),
('Swift5-SF514-54T-754W', 32900, 'https://tw.buy.yahoo.com/gdsale/Acer-SF514-54T-754W-14吋筆電-8900867.html', 'https://s.yimg.com/zp/MerchandiseImages/D29252878D-Gd-8900867.jpg', 'Acer宏碁', 'Ci7-1065G7', '-', '8G(on board)', '無(on board) 最高8G', '512GB', '無', '0.99', '14.0吋', '1920x1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.0', '56 Wh 4-cell Li-ion battery', 'Win10 home'),
('HP 240 G8 (326H4PA)', 32900, 'https://tw.buy.yahoo.com/gdsale/HP-惠普-240-G8-14吋商用筆電-14FHD-RX620-2G-i5-1035G1-8G-1-9409176.html', 'https://s.yimg.com/zp/MerchandiseImages/7E3A4CE937-SP-9563492.jpg', 'HP惠普', 'i5-1035G1', 'AMD Radeon 620', '8G', '2 最高16G', '512GB', '無', '1.48', '14.0吋', '1920 x 1080', 'Intel AX201 ax 2x2 WiFi6 藍牙5.0', '3 cell 41 WHr/3.63Ah', 'Win10 Pro'),
('Prestige 14Evo A11M-209TW', 32900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Prestige-14Evo-A11M-209TW-14吋輕薄商務筆電-i5-1135G-9291118.html', 'https://s.yimg.com/zp/MerchandiseImages/51BF4B81FD-Gd-9291118.jpg', 'MSI微星', 'i5-1135G7 Processor', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '1TB', '無', '1.29', '14.0吋', '1920x1080', '802.11 ax Wi-Fi 6 藍牙5.1', '65W adapter', 'Win10 home'),
('Prestige 14Evo A11M-210TW', 32900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Prestige-14Evo-A11M-210TW-14吋-商務輕薄筆電-i5-1135-9279053.html', 'https://s.yimg.com/zp/MerchandiseImages/478D4C0C27-Gd-9279053.jpg', 'MSI微星', 'i5-1135G7 Processor', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '1TB', '無', '1.29', '14.0吋', 'FHD (1920x1080)', '802.11 ax Wi-Fi 6 藍牙5.1', '65W adapter', 'Win10 home'),
('SFX14-41G-R6RW', 32900, 'https://tw.buy.yahoo.com/gdsale/Acer-SFX14-41G-R6RW-14吋輕薄筆電-R5-5500U-GTX1650-16G-5-9908971.html', 'https://s.yimg.com/zp/MerchandiseImages/EF2662484A-SP-11004414.jpg', 'Acer宏碁', 'AMD Ryzen 5 5500U', 'GTX 1650', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.39', '14.0吋', '1920x1080', '802.11a/b/g/n+ax MU-MIMO RX technology 藍牙5.2', '59Wh Li-ion battery', 'Win 11 home'),
('X712EQ-0098S1165G7', 32900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X712EQ-17吋輕薄筆電-i7-1165G7-MX350-8G-512G-Vivobo-9875118.html', 'https://s.yimg.com/zp/MerchandiseImages/18cf9b483b-Gd-9875118.jpg', 'ASUS華碩', 'Intel® Core i7-1165G7 Processor 2.8 GHz', 'MX350', '8G(on board)', '1 最高16G', '512GB', '無', '2.3', '17.3吋', '1920x1080', 'Wi-Fi 6(Gig+)(802.11ax) 藍牙5.0', '48WHrs', 'Win 11 home'),
('4T3M5PA', 32900, 'https://tw.buy.yahoo.com/gdsale/HP-惠普-240-G8-14吋輕薄窄邊框商用筆電4T3M5PA-i5-1135G7-8G-256G-9731650.html', 'https://s.yimg.com/zp/MerchandiseImages/97BD54B658-SP-10504979.jpg', 'HP惠普', 'Intel Core i5-1135G7', 'Intel Iris Xe Graphics', '8G', '2, 已佔用1 最高16G', '256GB', '1TB', '1.48', '14.0吋', '1920 x 1080', 'Realtek 802.11ac (2x2) 藍牙5.0', '3 cell 41 WHr/3.63Ah', 'Win10 Pro'),
('4T3M4PA', 32900, 'https://tw.buy.yahoo.com/gdsale/HP-惠普-240-G8-14吋輕薄窄邊框商用筆電4T3M4PA-I5-1135G7-8G-512G-9731649.html', 'https://s.yimg.com/zp/MerchandiseImages/2DE5F27F78-SP-10504975.jpg', 'HP惠普', 'Intel Core i5-1135G7', 'Intel Iris Xe Graphics', '8G', '2, 已佔用1 最高16G', '512GB', '無', '1.48', '14.0吋', '1920 x 1080', 'Realtek 802.11ac (2x2) 藍牙5.0', '3 cell 41 WHr/3.63Ah', 'Win10 Pro'),
('UX325EA-0302P1135G7', 32900, 'https://tw.buy.yahoo.com/gdsale/ASUS-UX325EA-13-3吋筆電-i5-1135G7-16G-512G-OLED-ZenBo-9831188.html', 'https://s.yimg.com/zp/MerchandiseImages/B32E0E0CF7-Gd-9831188.jpg', 'ASUS華碩', 'Intel® Core i5-1135G7 Processor 2.4 GHz', 'Intel® Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '-', '13.3吋', '1920x1080', 'Wi-Fi 6(Gig+)(802.11ax) 藍牙5.0', '-', 'Win 11 home'),
('SFX14-41G-R3S5', 32900, 'https://tw.buy.yahoo.com/gdsale/Acer-SFX14-41G-R3S5-14吋筆電-R7-5700U-RTX3050-16G-512-9777656.html', 'https://s.yimg.com/zp/MerchandiseImages/9d414dce9f-Gd-9777656.jpg', 'Acer宏碁', 'AMD Ryzen 7 5700U', 'RTX3050', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.39', '14.0吋', '1920x1080', '802.11a/b/g/n+ax MU-MIMO RX technology 藍牙5.2', '59Wh Li-ion battery', 'Win 11 home'),
('15-eg1015TX', 32900, 'https://tw.buy.yahoo.com/gdsale/HP-星鑽-Pavilion-15-eg1015TX-15-6吋輕薄筆電-i5-1155-G7-8G-9881684.html', 'https://s.yimg.com/zp/MerchandiseImages/791798FF69-SP-10982547.jpg', 'HP惠普', 'i5-1155 G7', 'MX450', '8G', '2 最高16G', '512GB', '無', '1.75', '15.6吋', '1920x1080', 'Mediatek Wi-Fi6 ax2x2 藍牙5.2', '3cell 41Whr', 'Win 11 home'),
('UX325EA-0392P1135G7', 32900, 'https://tw.buy.yahoo.com/gdsale/ASUS-UX325EA-13-3吋筆電-i5-1135G7-16G-512G-EVO-ZenBoo-9938336.html', 'https://s.yimg.com/zp/MerchandiseImages/B32E0E0CF7-Gd-9938336.jpg', 'ASUS華碩', 'Intel® Core i5-1135G7 Processor 2.4 GHz', 'Intel® Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '-', '13.3吋', '1920x1080', 'Wi-Fi 6(Gig+)(802.11ax) 藍牙5.0', '67WHrs', 'Win 11 home'),
('SFX14-41G-R8N5', 32900, 'https://tw.buy.yahoo.com/gdsale/Acer-SFX14-41G-R8N5-14吋筆電-R7-5800U-RTX3050-16G-512-9898402.html', 'https://s.yimg.com/zp/MerchandiseImages/EF2662484A-SP-10995650.jpg', 'Acer宏碁', 'AMD Ryzen 7 5800U', 'RTX3050', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.39', '14.0吋', '1920x1080', '802.11a/b/g/n+ax MU-MIMO RX technology 藍牙5.2', '59Wh Li-ion battery', 'Win 11 home'),
('UX325EA-0382G1135G7', 32900, 'https://tw.buy.yahoo.com/gdsale/ASUS-UX325EA-13-3吋筆電-i5-1135G7-16G-512G-EVO-ZenBoo-9938334.html', 'https://s.yimg.com/zp/MerchandiseImages/646BD96C08-Gd-9938334.jpg', 'ASUS華碩', 'Intel® Core i5-1135G7 Processor 2.4 GHz', 'Intel® Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '-', '13.3吋', '1920x1080', 'Wi-Fi 6(Gig+)(802.11ax) 藍牙5.0', '67WHrs', 'Win 11 home'),
('UX425EA-0672G1135G7', 32900, 'https://tw.buy.yahoo.com/gdsale/ASUS-UX425EA-14吋筆電-i5-1135G7-16G-512G-ZenBook-14-綠-9842110.html', 'https://s.yimg.com/zp/MerchandiseImages/1E0E134A66-Gd-9842110.jpg', 'ASUS華碩', 'Intel® Core i5-1135G7 Processor 2.4 GHz', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.17', '14.0吋', '1920x1080', 'Wi-Fi 6(Gig+)(802.11ax) 藍牙5.0', '67WHrs', 'Win 11 home'),
('Prestige 14Evo A11M-211TW', 32900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Prestige-14Evo-A11M-211TW-14吋輕薄商務筆電-i5-1135G-9291117.html', 'https://s.yimg.com/zp/MerchandiseImages/EE7D597990-Gd-9291117.jpg', 'MSI微星', 'i5-1135G7 Processor', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '1TB', '無', '1.29', '14.0吋', '1920x1080', '802.11 ax Wi-Fi 6 藍牙5.1', '65W adapter', 'Win10 home'),
('M3401QA-0088B5800H', 32900, 'https://tw.buy.yahoo.com/gdsale/ASUS-M3401QA-14吋筆電-R7-5800H-16G-512G-SSD-Vivobook-9711346.html', 'https://s.yimg.com/zp/MerchandiseImages/EDDD1F01CA-Gd-9711346.jpg', 'ASUS華碩', 'Ryzen 7 5800H Mobile Processor', 'AMD Radeon Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.4', '14.0吋', '2880 x 1800', 'Wi-Fi 6(802.11ax) 藍牙5.0', '63Whr', 'Win10 home'),
('UX325EA-0292G1135G7', 32900, 'https://tw.buy.yahoo.com/gdsale/ASUS-UX325EA-13-3吋筆電-i5-1135G7-16G-512G-OLED-ZenBo-9831189.html', 'https://s.yimg.com/zp/MerchandiseImages/646BD96C08-Gd-9831189.jpg', 'ASUS華碩', 'Intel® Core i5-1135G7 Processor 2.4 GHz', 'Intel® Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '-', '13.3吋', '1920x1080', 'Wi-Fi 6(Gig+)(802.11ax) 藍牙5.0', '-', 'Win 11 home'),
('SFX14-41G-R2FK', 32900, 'https://tw.buy.yahoo.com/gdsale/Acer-SFX14-41G-R2FK-14吋筆電-R7-5800U-RTX3050-16G-512-9597684.html', 'https://s.yimg.com/zp/MerchandiseImages/ee5978124f-Gd-9597684.jpg', 'Acer宏碁', 'AMD Ryzen 7 5800U', 'RTX3050', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.39', '14.0吋', '1920x1080', '802.11a/b/g/n+ax MU-MIMO RX technology 藍牙5.2', '59Wh Li-ion battery', 'Win10 home');
INSERT INTO `specifics_yahoo` (`nb_id`, `yahoo_price`, `yahoo_url`, `img_url`, `brand`, `cpu`, `gpu`, `ram`, `slot_max`, `SSD`, `HDD`, `weight`, `inch`, `resolution`, `internet_device`, `battery`, `windows_version`) VALUES
('UX425EA-0702P1135G7', 32900, 'https://tw.buy.yahoo.com/gdsale/ASUS-UX425EA-14吋筆電-i5-1135G7-16G-512G-ZenBook-14-W-9842112.html', 'https://s.yimg.com/zp/MerchandiseImages/E79B7B8C2B-Gd-9842112.jpg', 'ASUS華碩', 'Intel® Core i5-1135G7 Processor 2.4 GHz', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.17', '14.0吋', '1920x1080', 'Wi-Fi 6(Gig+)(802.11ax) 藍牙5.0', '67WHrs', 'Win 11 home'),
('B1500CEAE-0171A1135G7', 32880, 'https://tw.buy.yahoo.com/gdsale/ASU-ExpertBook-B1-15-6吋-商用筆電-B1500CEAE-0171A1135G7-9886974.html', 'https://s.yimg.com/zp/MerchandiseImages/fc04c5f5f8-Gd-9886974.jpg', 'ASUS華碩', 'Intel® Core i5-1135G7 Processor 2.4 GHz', 'Intel® Iris® Xe Graphics', '8G(on board)', '1 最高48G', '512GB', '無', '1.75', '15.6吋', '1920 x 1080', 'Wi-Fi 6(802.11ax) 藍牙5.2', '42WHrs，3S1P，3 芯鋰離子', 'Win10 Pro'),
('Legion5i (82AU00EETW)', 32019, 'https://tw.buy.yahoo.com/activity/onsale/combo?actid=368344', 'https://s.yimg.com/zp/MipImages/EC64C8B076-MIP-368344.jpeg', 'Lenovo聯想', 'Intel CORE I5-10300H 2.5G 4C MB', 'GTX 1650', '8G', '1 最高8G', '512GB', '無', '2.3', '15.6吋', '1920x1080', 'WLAN_2X2AX 藍牙5.0', '4CELL_60WH', 'Win10 home'),
('FX516PM-0231A11300H', 30999, 'https://tw.buy.yahoo.com/gdsale/ASUS-FX516PM-15吋電競筆電-i5-11300H-RTX-3060-8GB-512G-T-9911054.html', 'https://s.yimg.com/zp/MerchandiseImages/1ADCE33A37-Gd-9911054.jpg', 'ASUS華碩', 'Intel® Core i5-11300H Processor 3.1 GHz', 'RTX3060', '8G(on board)', '1 最高32G', '512GB', '無', '2', '15.6吋', '1920x1080', 'Wi-Fi 6 (802.11ax) 藍牙5.1', '76WHrs, 4S1P, 4-cell Li-ion', 'Win 11 home'),
('IdeaPad Gaming 3i 81Y40167TW', 31990, 'https://tw.buy.yahoo.com/gdsale/Lenovo-Gaming-3i-15-6吋電競筆電-i7-10750H-GTX1650Ti-4G獨-9516510.html', 'https://s.yimg.com/zp/MerchandiseImages/CB04833152-SP-9866917.jpg', 'Lenovo聯想', 'i7-10750H 六核心 2.60 GHz(12M 快取記憶體，最高可達 5.00 GHz)', 'GTX 1650Ti', '8G', '2, 已佔用1 最高64G', '512GB', '無', '2.2', '15.6吋', '1920x1080', 'WLAN_2X2AX 藍牙5.0', '3 Cell', 'Win10 home'),
('13-5320-R1608PTW', 31990, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-5320-13-3吋筆電-I5-1240P-16G-512G-Win11-9990937.html', 'https://s.yimg.com/zp/MerchandiseImages/7358C30389-SP-11303415.jpg', 'Dell戴爾', '12th Generation Intel® Core i5-1240P Processor', 'Intel® Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.25', '13.3吋', '2560 x1600', 'Intel® Wi-Fi 6 AX211 (Gig+) 藍牙4.0', '4-Cell Battery, 54 Whr (Integrated)', 'Win 11 home'),
('Pavilion x360 Convert 14-dy1004TU', 31900, 'https://tw.buy.yahoo.com/gdsale/HP-星鑽翻轉-Pavilion-x360-14-dy1004TU-14吋翻轉筆電-i5-1155-9827459.html', 'https://s.yimg.com/zp/MerchandiseImages/505620BEAD-SP-10805183.jpg', 'HP惠普', 'Intel Core i5-1155 G7 Quad Core', 'Intel Iris Xe Graphics', '16G', '2 最高16G', '512GB', '無', '1.5', '14.0吋', '1920x1080', 'Mediatek Wi-Fi6 ax2x2 藍牙5.2', '標配 3cell 43Whr', 'Win 11 home'),
('AV15-51R-73AP', 31900, 'https://tw.buy.yahoo.com/gdsale/Acer-AV15-51R-73AP-15吋環保效能筆電-i7-1195G7-16G-1TB-SSD-9864498.html', 'https://s.yimg.com/zp/MerchandiseImages/759F5BE5D2-SP-10912533.jpg', 'Acer宏碁', 'i7-1195G7', 'Intel Iris Xe Graphics', '16G(on board)', '1 最高16G', '1TB', '無', '1.8', '15.6吋', '1920 x 1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.1', '48 Wh 3-cell Li-ion battery', 'Win 11 home'),
('S3402ZA-0162E12500H', 31900, 'https://tw.buy.yahoo.com/gdsale/ASUS-S3402ZA-14吋2-8K筆電-i5-12500H-16G-512G-EVO-Vivo-9970010.html', 'https://s.yimg.com/zp/MerchandiseImages/F372958864-Gd-9970010.jpg', 'ASUS華碩', 'Core i5-12500H Processor 2.5 GHz', 'Intel Iris Xe Graphics', '16G', '1 最高16G', '512GB', '無', '-', '14.0吋', '2880 x 1800', 'Wi-Fi 6E(802.11ax) 藍牙5.2', '70WHrs', 'Win 11 home'),
('Swift5-SF514-54T-58EB', 31900, 'https://tw.buy.yahoo.com/gdsale/Acer-SF514-54T-58EB-14吋筆電-8860562.html', 'https://s.yimg.com/zp/MerchandiseImages/55160E5054-Gd-8860562.jpg', 'Acer宏碁', 'Intel Core i5-1035G1', '-', '8G(on board)', '無(on board) 最高8G', '512GB', '無', '0.99', '14.0吋', '1920x1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.0', '56 Wh 4-cell Li-ion battery', 'Win10 home'),
('HP 240 G8 (326H3PA)', 31900, 'https://tw.buy.yahoo.com/gdsale/HP-惠普-240-G8-14吋商用筆電-14FHD-i5-1035G1-8G-1-512GB-SS-9409172.html', 'https://s.yimg.com/zp/MerchandiseImages/77FB8B0982-SP-9563415.jpg', 'HP惠普', 'i5-1035G1', 'Intel® UHD Graphics 620', '8G', '2 最高16G', '512GB', '無', '1.48', '14.0吋', '1920 x 1080', 'Intel AX201 ax 2x2 WiFi6 藍牙5.0', '3 cell 41 WHr/3.63Ah', 'Win10 Pro'),
('S435EA-0089E1135G7', 31900, 'https://tw.buy.yahoo.com/gdsale/ASUS-S435EA-14吋筆電-i5-1135G7-16G-512GB-SSD-VivoBook-9777702.html', 'https://s.yimg.com/zp/MerchandiseImages/e3016cdfd1-Gd-9777702.jpg', 'ASUS華碩', 'Intel® Core i5-1135G7 Processor 2.4 GHz', 'Intel Iris Xᵉ Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '-', '14.0吋', '1920x1080', 'Wi-Fi 6(Gig+)(802.11ax) 藍牙5.0', '-', 'Win 11 home'),
('14-dv1019TU', 31900, 'https://tw.buy.yahoo.com/gdsale/HP-星鑽-Pavilion-14-dv1019TU-14吋輕薄筆電-i5-1135-G7-16G-9827460.html', 'https://s.yimg.com/zp/MerchandiseImages/CF1AFE170A-SP-10800946.jpg', 'HP惠普', 'i5-1155 G7', 'Intel Iris Xe Graphics', '16G', '2 最高16G', '512GB', '無', '1.41', '14.0吋', '1920x1080', 'Mediatek Wi-Fi6 ax2x2 藍牙5.2', '3cell 43Wh', 'Win 11 home'),
('Bravo 15 B5DD-249TW', 31900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Bravo-15-B5DD-249TW-15吋電競筆電-Ryzen-7-5800H-16-9901709.html', 'https://s.yimg.com/zp/MerchandiseImages/26B319B9D8-SP-11022668.jpg', 'MSI微星', 'Ryzen 7 5800H', 'RX 5500M', '16G', '2 最高64G', '512GB', '無', '2.35', '15.6吋', '1920x1080', 'Wi-Fi 6E 藍牙5.2', '53.5 Battery (Whr)', 'Win 11 home'),
('Victus by HP Laptop 16-0773AX', 31900, 'https://tw.buy.yahoo.com/gdsale/HP-光影V-Victus-16-0773AX-16-1吋電競筆電-R7-5800H-8G-RTX3-9911756.html', 'https://s.yimg.com/zp/MerchandiseImages/FF839613CC-SP-11068392.jpg', 'HP惠普', 'R7-5800H', 'RTX 3050', '8G', '2 最高32G', '512GB', '無', '2.46', '16吋', '1920x1080', 'Realtek Cava Wi-Fi 6 ax 2x2 藍牙5.2', '標配 4cell 70Whr', 'Win 11 home'),
('AN515-57-791E', 31900, 'https://tw.buy.yahoo.com/gdsale/Acer-AN515-57-791E-15吋筆電-i7-11800H-RTX3050-8G-512G-9711651.html', 'https://s.yimg.com/zp/MerchandiseImages/9bb78c7e51-Gd-9711651.jpg', 'Acer宏碁', 'Intel® Core i7-11800H', 'RTX3050', '8G', '2 最高32G', '512GB', '無', '2.2', '15.6吋', '1920 x 1080', 'KillerWi-Fi6AX1650i802.11a/b/g/n+acR2+ax2x2MU-MIMO 藍牙5.1', '57Wh Li-ion battery', 'Win10 home'),
('Victus by HP Laptop 16-d1049TX', 31900, 'https://tw.buy.yahoo.com/gdsale/HP-光影V-Victus-16-d1049TX-16-1吋電競筆電-i5-12500H-8G-GT-9939532.html', 'https://s.yimg.com/zp/MerchandiseImages/59FC716BD3-SP-11152165.jpg', 'HP惠普', 'i5-12500H', 'GTX 1650', '8G', '2 最高32G', '512GB', '無', '2.46', '16吋', '1920x1080', 'Wi-Fi 6 ax2x2 藍牙5.2', '標配 4cell 70Whr', 'Win 11 home'),
('S3502ZA-0152E12500H', 31900, 'https://tw.buy.yahoo.com/gdsale/ASUS-S3502ZA-15吋筆電-i5-12500H-16G-512G-EVO-Vivobook-9970007.html', 'https://s.yimg.com/zp/MerchandiseImages/4A645D8B26-Gd-9970007.jpg', 'ASUS華碩', 'Core i5-12500H Processor 2.5 GHz', 'Intel Iris Xe Graphics', '16G', '1 最高16G', '512GB', '無', '-', '其他尺寸', '1920 x 1080', 'Wi-Fi 6E(802.11ax) 藍牙5.2', '70WHrs', 'Win 11 home'),
('SF514-55GT-5551', 31900, 'https://tw.buy.yahoo.com/gdsale/Acer-SF514-55GT-5551-14吋筆電-i5-1135G7-MX350-16G-512-9768879.html', 'https://s.yimg.com/zp/MerchandiseImages/8711D447F5-Gd-9768879.jpg', 'Acer宏碁', 'Intel® Core i5-1135G7', 'MX350', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.050', '14.0吋', '1920 x 1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.1', '56Wh Li-ion battery', 'Win 11 home'),
('laptop3', 31599, 'https://tw.buy.yahoo.com/activity/onsale/combo?actid=361461', 'https://s.yimg.com/zp/MipImages/97ABFCFB7F-MIP-361461.jpeg', 'Microsoft微軟', 'Intel Core i5-1035G7', 'IrisPlus', '16G(on board)', '無(on board), 已佔用1 最高16G', '256GB', '無', '1.6', '15.4吋', '2496 x 1664', '802.11ax 藍牙5.0', '-', 'Win10 Pro'),
('Surface Pro 7', 31288, 'https://tw.buy.yahoo.com/gdsale/Surface-Pro-7-I5-8G-256-黑潮商務版遠距辦公促銷組合-8916088.html', 'https://s.yimg.com/zp/MerchandiseImages/47DAB6B5C6-Gd-8916088.jpg', 'Microsoft微軟', '1035G4', 'Intel® Iris® Plus', '8G', '已佔用1 最高8G', '256GB', '無', '0.77', '12.3吋', '2736x1824', 'WI-FI 6 藍牙5.0', '-', 'Win10 Pro'),
('15-5510-R4528STW', 30999, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-5000-15-6吋筆電-i5-11320H-16G-512G-MX45-9862674.html', 'https://s.yimg.com/zp/MerchandiseImages/87715B32AC-SP-10916261.jpg', 'Dell戴爾', '11th Generation Intel® Core i5-11320H Processor', 'NVIDIA® GeForce® MX450 Graphics', '16G', '2 最高32G', '512GB', '無', '1.633', '15.6吋', '1920 x 1080', 'Intel® Wi-Fi 6 AX201 2x2 (Gig+) 藍牙4.0', '4-Cell Battery, 54 Whr (Integrated)', 'Win 11 home'),
('14-5410-R4528STW', 30999, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-5000-14吋輕薄筆電-I5-11320H-16G-512G-MX45-9796011.html', 'https://s.yimg.com/zp/MerchandiseImages/77F1BC1E96-SP-10707067.jpg', 'Dell戴爾', '11th Generation Intel® Core i5-11320H Processor', 'NVIDIA® GeForce® MX450 Graphics', '16G', '2 最高32G', '512GB', '無', '1.461', '14.0吋', '1920 x 1080', 'Intel® Wi-Fi 6 AX201 2x2 (Gig+) 藍牙4.0', '4-Cell Battery, 54 Whr (Integrated)', 'Win 11 home'),
('16-5625-R1708STW', 30990, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-5625-16吋-高性能輕薄筆電-R7-5825U-16G-512G-W-9906365.html', 'https://s.yimg.com/zp/MerchandiseImages/97D4A8D56A-SP-11057538.jpg', 'Dell戴爾', 'AMD Ryzen 7 5825U 8-core/16-thread Processor', 'AMD Radeon  Graphics with shared graphics memory', '16G', '2 最高32G', '512GB', '無', '1.87', '16吋', '1920 x 1200', 'MediaTek Wi-Fi 6 2x2 藍牙4.0', '4-Cell Battery, 54 Whr (Integrated)', 'Win 11 home'),
('82AU0040TW', 30990, 'https://tw.buy.yahoo.com/gdsale/Lenovo-IdeaPad-Legion-5i-15吋筆電-I5-10300H-8G-1TB-25-9071404.html', 'https://s.yimg.com/zp/MerchandiseImages/0A51781B1C-Gd-9071404.jpg', 'Lenovo聯想', 'CORE_I5-10300H_2.5G_4C_MB', 'GTX 1650', '8G', '已佔用1 最高8G', '256GB', '1TB', '2.2', '15.6吋', '1920 x 1080', 'WLAN_2X2AX 藍牙5.0', '4CELL_60WH', 'Win10 home'),
('14-5425-R1708STW', 30989, 'https://tw.buy.yahoo.com/activity/onsale/combo?actid=363158', 'https://s.yimg.com/zp/MipImages/8A936AE675-MIP-363158.jpeg', 'Dell戴爾', 'AMD Ryzen 7 5825U 8-core/16-thread Processor', 'AMD Radeon  Graphics with shared graphics memory', '16G', '2 最高32G', '512GB', '無', '1.54', '14.0吋', '1920 x 1200', 'MediaTek Wi-Fi 6 2x2 藍牙4.0', '4-Cell Battery, 54 Whr (Integrated)', 'Win 11 home'),
('S513EQ-0862S1135G7', 30900, 'https://tw.buy.yahoo.com/gdsale/ASUS-S513EQ-15吋筆電-i5-1135G7-MX350-8G-8G-512G-OLED-9795004.html', 'https://s.yimg.com/zp/MerchandiseImages/bf4aa26090-Gd-9795004.jpg', 'ASUS華碩', 'Intel® Core i5-1135G7 Processor 2.4 GHz', 'MX350', '16G', '已佔用1 最高16G', '512GB', '無', '1.8', '15.6吋', '1920x1080', 'Wi-Fi 6(Gig+)(802.11ax) 藍牙5.0', '42WHrs', 'Win10 home'),
('AN517-52-76SP', 30900, 'https://tw.buy.yahoo.com/gdsale/福利品-Acer-AN517-52-76SP-17吋電競筆電-i7-10750H-GTX-1650-9248757.html', 'https://s.yimg.com/zp/MerchandiseImages/0C29D67594-Gd-9248757.jpg', 'Acer宏碁', 'Intel Core i7-10750H', 'GTX 1650Ti', '16G', '2, 已佔用2 最高32G', '512GB', '無', '2.7', '17.3吋', '1920X1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.0', '57.5 Wh 4-cell Li-ion battery', 'Win10 home'),
('S513EQ-0372K1135G7', 30900, 'https://tw.buy.yahoo.com/gdsale/ASUS-S513EQ-15吋筆電-i5-1135G7-MX350-8G-8G-512G-OLED-9795005.html', 'https://s.yimg.com/zp/MerchandiseImages/09FE4FBC99-SP-10702566.jpg', 'ASUS華碩', 'Intel® Core i5-1135G7 Processor 2.4 GHz', 'MX350', '16G', '已佔用1 最高16G', '512GB', '無', '1.8', '15.6吋', '1920x1080', 'Wi-Fi 6(Gig+)(802.11ax) 藍牙5.0', '42WHrs', 'Win10 home'),
('Prestige 14Evo A11MO-068TW', 30900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Prestige-14Evo-A11MO-068TW-14吋輕薄商務筆電-i5-1155-9822052.html', 'https://s.yimg.com/zp/MerchandiseImages/32C9C17751-SP-10791570.jpg', 'MSI微星', 'i5-1155G7', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '1TB', '無', '1.29', '14.0吋', '1920x1080', 'Killer ax Wi-Fi 6E 藍牙5.2', '65W adapter', 'Win10 home'),
('UM325UA-0062GR55500U', 30900, 'https://tw.buy.yahoo.com/gdsale/ASUS-UM325UA-13-3吋筆電-R5-5500U-16G-512G-OLED螢幕-ZenB-9670325.html', 'https://s.yimg.com/zp/MerchandiseImages/E5BA6739E8-Gd-9670325.jpg', 'ASUS華碩', 'AMD Ryzen 5 5500U Processor 2.1GHz', 'AMD Radeon Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '-', '13.3吋', '1920*1080', 'Wi-Fi 5(802.11ac) 藍牙4.2', '-', 'Win10 home'),
('Prestige 14Evo A11MO-059TW', 30900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Prestige-14Evo-A11MO-059TW-14吋輕薄商務筆電-i5-1155-9822051.html', 'https://s.yimg.com/zp/MerchandiseImages/3610A8D20B-SP-10791302.jpg', 'MSI微星', 'i5-1155G7', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '1TB', '無', '1.29', '14.0吋', '1920x1080', 'Killer ax Wi-Fi 6E 藍牙5.2', '65W adapter', 'Win10 home'),
('GF63 10UC-654TW', 30900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-GF63-10UC-654TW-15-6吋電競筆電-i7-10750H-8G-RTX30-9712871.html', 'https://s.yimg.com/zp/MerchandiseImages/539AAD9B54-SP-10450659.jpg', 'MSI微星', 'i7-10750H', 'RTX 3050', '8G', '2 最高64G', '512GB', '無', '1.86', '15.6吋', 'FHD (1920x1080)', '802.11 ax Wi-Fi 6 藍牙5.1', '51 Battery (Whr)150W adapter', 'Win10 home'),
('15-eg0038TX', 30900, 'https://tw.buy.yahoo.com/gdsale/HP-星鑽15-Pavilion-15-eg0038TX-15吋輕薄筆電-i5-1135-G7-8G-9321356.html', 'https://s.yimg.com/zp/MerchandiseImages/165158D123-SP-9314461.jpg', 'HP惠普', 'i5-1135 G7', 'MX450', '8G', '2 最高16G', '1TB', '無', '1.75', '15.6吋', '1920x1080', 'Intel Wi-Fi 6 AX 201 (2x2) 藍牙5.0', '3cell 41Wh', 'Win10 home'),
('S513EQ-0132D1135G7', 30900, 'https://tw.buy.yahoo.com/gdsale/ASUS-S513EQ-15吋筆電-i5-1135G7-MX350-8G-8G-512G-OLED-9590685.html', 'https://s.yimg.com/zp/MerchandiseImages/1AD3638DDD-Gd-9590685.jpg', 'ASUS華碩', 'Intel® Core i5-1135G7 Processor 2.4 GHz', 'MX350', '16G', '已佔用1 最高16G', '512GB', '無', '1.8', '15.6吋', '1920x1080', 'Wi-Fi 6(Gig+)(802.11ax) 藍牙5.0', '42WHrs', 'Win10 home'),
('Bravo 15 B5DD-031TW', 30900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Bravo-15-B5DD-031TW-15吋電競筆電-Ryzen-5-5600H-8G-9600033.html', 'https://s.yimg.com/zp/MerchandiseImages/EEF9DEA58B-SP-9957992.jpg', 'MSI微星', 'Ryzen 5 5600H', 'RX 5500M', '8G', '2 最高64G', '512GB', '無', '2.35', '15.6吋', '1920x1080', '802.11 ax Wi-Fi 6 藍牙5.1', '53.5 Battery (Whr)', 'Win10 home'),
('S513EQ-0142K1135G7', 30900, 'https://tw.buy.yahoo.com/gdsale/ASUS-S513EQ-15吋筆電-i5-1135G7-MX350-8G-8G-512G-OLED-9590680.html', 'https://s.yimg.com/zp/MerchandiseImages/DDE39FC555-Gd-9590680.jpg', 'ASUS華碩', 'Intel® Core i5-1135G7 Processor 2.4 GHz', 'MX350', '16G', '已佔用1 最高16G', '512GB', '無', '1.8', '15.6吋', '1920x1080', 'Wi-Fi 6(Gig+)(802.11ax) 藍牙5.0', '42WHrs', 'Win10 home'),
('S513EQ-0362D1135G7', 30900, 'https://tw.buy.yahoo.com/gdsale/ASUS-S513EQ-15吋筆電-i5-1135G7-MX350-8G-8G-512G-OLED-9795006.html', 'https://s.yimg.com/zp/MerchandiseImages/2598D50A77-Gd-9795006.jpg', 'ASUS華碩', 'Intel® Core i5-1135G7 Processor 2.4 GHz', 'MX350', '16G', '已佔用1 最高16G', '512GB', '無', '1.8', '15.6吋', '1920x1080', 'Wi-Fi 6(Gig+)(802.11ax) 藍牙5.0', '42WHrs', 'Win10 home'),
('Yoga Slim 7 Pro 82NC007GTW', 30690, 'https://tw.buy.yahoo.com/gdsale/Lenovo-Yoga-Slim-7i-Pro-14吋輕薄筆電-i7-11370H-16G-512G-9765283.html', 'https://s.yimg.com/zp/MerchandiseImages/ab9d94009e-Gd-9765283.jpg', 'Lenovo聯想', 'i7-11370H (4C / 8T, 3.3 / 4.8GHz, 12MB)', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.3', '14.0吋', '2880x1800', '11ax, 2x2 藍牙5.1', 'Integrated 61Wh', 'Win 11 home'),
('Yoga Slim 7 Pro 82NH008XTW', 30609, 'https://tw.buy.yahoo.com/gdsale/Lenovo-Yoga-Slim-7-Pro-14吋效能筆電-i5-11300H-16G-512G-9906176.html', 'https://s.yimg.com/zp/MerchandiseImages/F907014C34-SP-11051790.jpg', 'Lenovo聯想', 'i5-11300H (4C / 8T, 3.1 / 4.4GHz, 8MB)', 'Integrated Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.38', '14.0吋', '2880x1800', 'Wi-Fi 6 11ax, 2x2 藍牙5.1', 'Integrated 61Wh', 'Win 11 home'),
('Thinkpad L14', 30490, 'https://tw.buy.yahoo.com/gdsale/Lenovo-L14-14吋商務筆電-i5-1135G7-8G-512G-PCIe-SSD-Thin-9713601.html', 'https://s.yimg.com/zp/MerchandiseImages/74746C84DA-SP-10456214.jpg', 'Lenovo聯想', 'i5-1135G7 (4C / 8T, 2.4 / 4.2GHz, 8MB)', 'Intel Iris Xe Graphics', '8G', '2, 已佔用1 最高64G', '512GB', '無', '1.59', '14.0吋', '1920x1080', 'RTL8852AE 11ax, 2x2 藍牙5.2', 'Integrated 45Wh', 'Win10 Pro'),
('Katana GF66 11UD-1210TW', 29999, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Katana-GF66-11UD-1210TW-15-6吋電競筆電-i5-11400H-9874650.html', 'https://s.yimg.com/zp/MerchandiseImages/41038AB71F-SP-10953514.jpg', 'MSI微星', 'i5-11400H', 'RTX 3050Ti', '8G', '2 最高64G', '1TB', '無', '2.25', '15.6吋', 'FHD (1920x1080)', '802.11 ax Wi-Fi 6 藍牙5.2', '53.5 Battery (Whr)', 'Win 11 home'),
('15-5510-R3708STW', 29999, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-5000-15-6吋筆電-I5-11320H-16G-512G-Win1-9774641.html', 'https://s.yimg.com/zp/MerchandiseImages/AD427E7A62-SP-10638037.jpg', 'Dell戴爾', '11th Generation Intel® Core i7-11390H Processor', 'Intel® Iris Xe Graphics with shared graphics memor', '16G', '2 最高32G', '512GB', '無', '1.633', '15.6吋', '1920 x 1080', 'Intel® Wi-Fi 6 AX201 2x2 (Gig+) 藍牙4.0', '4-Cell Battery, 54 Whr (Integrated)', 'Win 11 home'),
('16-5620-R1608CTW', 29990, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-5620-16吋-高性能輕薄筆電-I5-1240P-16G-512G-W-9988019.html', 'https://s.yimg.com/zp/MerchandiseImages/56121F6F67-SP-11294552.jpg', 'Dell戴爾', '12th Generation Intel® Core i5-1240P Processor', 'Intel® Iris Xe Graphics with shared graphics', '16G', '2 最高32G', '512GB', '無', '1.87', '16吋', '1920 x 1200', 'Intel® Wi-Fi 6 AX211 (Gig+) 藍牙4.0', '4-Cell Battery, 54 Whr (Integrated)', 'Win 11 home'),
('Thinkpad L14 Gen2', 29990, 'https://tw.buy.yahoo.com/gdsale/Lenovo-L14-Gen-2-14吋商務筆電-Ryzen-7-PRO-5850U-8G-512G-9796857.html', 'https://s.yimg.com/zp/MerchandiseImages/F01C87E0B2-SP-10707690.jpg', 'Lenovo聯想', 'Ryzen 7 PRO 5850U(8C/16T,1.9/4.4GHz,4MB L2/16MB L3', 'AMD Radeon Graphics', '8G', '2, 已佔用1 最高64G', '512GB', '無', '1.59', '14.0吋', '1920x1080', 'RTL8852AE 11ax, 2x2 藍牙5.2', 'Integrated 45Wh', 'Win10 Pro'),
('IdeaPad Gaming3 82K10176TW', 29990, 'https://tw.buy.yahoo.com/gdsale/Lenovo-Gaming3-15-6吋電競筆電-i5-11320H-RTX3050-4G獨顯-8G-9928677.html', 'https://s.yimg.com/zp/MerchandiseImages/B3AFAE4E15-SP-11114676.jpg', 'Lenovo聯想', 'i5-11320H (4C / 8T, 3.2 / 4.5GHz, 8MB)', 'GeForce RTX3050', '8G', '2, 已佔用1 最高8G', '512GB', '無', '2.25', '15.6吋', '1920x1080,165Hz', 'Wi-Fi 6 11ax, 2x2 藍牙5.0', 'Integrated 45Wh', 'Win 11 home'),
('MateBook 14', 29990, 'https://tw.buy.yahoo.com/gdsale/HUAWEI-華為-MateBook-14吋筆電-i5-1135G7-16G-512G-SSD-W1-9858218.html', 'https://s.yimg.com/zp/MerchandiseImages/6d7d231d3c-Gd-9858218.jpg', 'HUAWEI華為', 'i5-1135G7', 'Intel iris XE Graphics', '16G', '1 最高16G', '512GB', '無', '1.49', '14.0吋', '1920 x 1080', '- 藍牙5.0', '-', 'Win10 home'),
('15-5515-R1708STW11', 29990, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-5000-15-6吋筆電-R7-5700U-8G-512G-Win11--9774733.html', 'https://s.yimg.com/zp/MerchandiseImages/AF52BAC8F3-SP-10638371.jpg', 'Dell戴爾', 'AMD Ryzen7 5700U 8 core/16-thread Mobile Processor', 'AMD Radeon  Graphics with shared graphics memory', '8G', '2 最高32G', '512GB', '無', '1.643', '15.6吋', '1920 x 1080', '802.11ac(wifi 5) 藍牙4.0', '4-Cell Battery, 54 Whr (Integrated)', 'Win 11 home'),
('81XA0017TW', 29990, 'https://tw.buy.yahoo.com/gdsale/Lenovo-IdeaPad-S540-13吋筆電-I7-10510U-8G-512G-MX250--9077794.html', 'https://s.yimg.com/zp/MerchandiseImages/74223B0C42-Gd-9077794.jpg', 'Lenovo聯想', 'CORE_I7-10510U_1.8G_4C_MB', 'MX250', '8G(on board)', '無(on board) 最高8G', '512GB', '無', '1.28', '13.3吋', '1920x1080', '802.11ax 2x2 藍牙5.0', '3CELL_56WH_INTERNAL', 'Win10 home'),
('Yoga Duet 7i (82AS005PTW)', 29990, 'https://tw.buy.yahoo.com/gdsale/Lenovo-Yoga-Duet-7i-13吋2-in-1觸控筆電-I5-10210U-8G-512-9292447.html', 'https://s.yimg.com/zp/MerchandiseImages/2FFB9EDC6D-SP-9238298.jpg', 'Lenovo聯想', 'CORE_I5-10210U_1.6G_4C_MB', 'INTEGRATED_GRAPHICS', '8G(on board)', '無(on board) 最高8G', '512GB', '無', '0.836', '13吋', '2160 x 1350', 'WLAN_2X2AX 藍牙5.0', '4 cell/42Wh/ 12hr', 'Win10 home'),
('Katana GF76 11UC-664TW', 29900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Katana-GF76-11UC-664TW-17-3吋電競筆電-i5-11400H-8-9945593.html', 'https://s.yimg.com/zp/MerchandiseImages/650FD4AA46-SP-11164426.jpg', 'MSI微星', 'i5-11400H', 'RTX 3050', '8G', '2 最高64G', '512GB', '無', '2.6', '17.3吋', '1920x1080', '802.11 ax Wi-Fi 6 藍牙5.2', '53.5 Battery (Whr) / 150W adapter', 'Win 11 home'),
('SFX14-41G-R0F4', 29900, 'https://tw.buy.yahoo.com/gdsale/福利品-Acer-SFX14-41G-R0F4-14吋筆電-R75700U-16G-512G-粉--9795357.html', 'https://s.yimg.com/zp/MerchandiseImages/68EFD7A9CB-SP-10001007.jpg', 'Acer宏碁', 'AMD Ryzen 7 5700U', 'GTX 1650', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.39', '14.0吋', '1920x1080', '802.11a/b/g/n+ax MU-MIMO RX technology 藍牙5.2', '59Wh Li-ion battery', 'Win10 home'),
('K513EQ-0972K1165G7', 29900, 'https://tw.buy.yahoo.com/gdsale/ASUS-K513EQ-15吋筆電-i7-1165G7-MX350-8G-512G-Win-11-V-9895734.html', 'https://s.yimg.com/zp/MerchandiseImages/5025b6638b-Gd-9895734.jpg', 'ASUS華碩', 'Core i7-1165G7 Processor 2.8 GHz', 'MX350', '8G(on board)', '1 最高16G', '512GB', '無', '1.8', '15.6吋', '1920x1080', 'Wi-Fi 6(Gig+)(802.11ax) 藍牙5.0', '42WHrs', 'Win 11 home'),
('FA506IC-0122B4800H', 29900, 'https://tw.buy.yahoo.com/gdsale/ASUS-FA506IC-15吋電競筆電-R7-4800HS-RTX3050-8GB-512G-TU-9911056.html', 'https://s.yimg.com/zp/MerchandiseImages/38F2B0618A-Gd-9911056.jpg', 'ASUS華碩', 'AMD Ryzen 7 4800H Processor 2.9 GHz', 'NVIDIA® GeForce RTX 3050', '8G', '2 最高32G', '512GB', '無', '2.3', '15.6吋', '1920x1080', 'Wi-Fi 6 (802.11ax) 藍牙5.1', '48WHrs, 3S1P, 3-cell Li-ion', 'Win 11 home'),
('X1403ZA-0171S12500H', 29900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X1403ZA-14吋2-8K筆電-i5-12500H-8G-512G-Vivobook-9994603.html', 'https://s.yimg.com/zp/MerchandiseImages/2E76529D8E-SP-11312418.jpg', 'ASUS華碩', 'Core i5-12500H Processor 2.5 GHz', 'Intel Iris Xe Graphics', '8G(on board)', '1 最高16G', '512GB', '無', '1.6', '14.0吋', '2880 x 1800', 'Wi-Fi 6(802.11ax) 藍牙5.0', '70WHrs', 'Win 11 home'),
('GF63 11SC-066TW', 29900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-GF63-11SC-066TW-15-6吋電競筆電-i7-11800H-8G-GTX16-9787705.html', 'https://s.yimg.com/zp/MerchandiseImages/AFE31F5C55-SP-10668091.jpg', 'MSI微星', 'i7-11800H', 'GTX 1650', '8G', '2 最高64G', '512GB', '無', '1.86', '15.6吋', '1920x1080, FHD', '802.11 ax Wi-Fi 6 藍牙5.1', '3-Cell / 51 Battery (Whr)', 'Win10 home'),
('FA506ICB-0132B4800H', 29900, 'https://tw.buy.yahoo.com/gdsale/ASUS-FA506ICB-15吋電競筆電-R7-4800H-RTX3050-8GB-512G-TU-9994611.html', 'https://s.yimg.com/zp/MerchandiseImages/C47C74BD61-Gd-9994611.jpg', 'ASUS華碩', 'AMD Ryzen 7 4800H Processor 2.9 GHz', 'NVIDIA® GeForce RTX 3050', '8G', '2 最高32G', '512GB', '無', '2.3', '15.6吋', '1920x1080', 'Wi-Fi 6 (802.11ax) 藍牙5.1', '48WHrs, 3S1P, 3-cell Li-ion', 'Win 11 home'),
('SF314-511-79MJ', 28999, 'https://tw.buy.yahoo.com/gdsale/福利品-Acer-SF314-511-79MJ-14吋筆電-Ci7-1165G7-16G-512G-9795367.html', 'https://s.yimg.com/zp/MerchandiseImages/7D8331965B-SP-10451304.jpg', 'Acer宏碁', 'Ci7-1165G7', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.2', '14.0吋', '1920x1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.1', '56Wh Li-ion battery', 'Win 11 home'),
('SFX14-41G-R0F4, SFX14-41G-R02A', 29900, 'https://tw.buy.yahoo.com/gdsale/Acer-SFX14-41G-14吋輕薄筆電-R7-5700U-GTX1650-16G-512G-S-9922428.html', 'https://s.yimg.com/zp/MerchandiseImages/B555AEC9F0-Gd-9922428.jpg', 'Acer宏碁', 'AMD Ryzen 7 5700U', 'GTX 1650', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.39', '14.0吋', '1920x1080', '802.11a/b/g/n+ax MU-MIMO RX technology 藍牙5.2', '59Wh Li-ion battery', 'Win10 home'),
('K513EQ-0992S1165G7', 29900, 'https://tw.buy.yahoo.com/gdsale/ASUS-K513EQ-15吋筆電-i7-1165G7-MX350-8G-512G-Win-11-V-9895733.html', 'https://s.yimg.com/zp/MerchandiseImages/1e5b15e794-Gd-9895733.jpg', 'ASUS華碩', 'Core i7-1165G7 Processor 2.8 GHz', 'MX350', '8G(on board)', '1 最高16G', '512GB', '無', '1.8', '15.6吋', '1920x1080', 'Wi-Fi 6(Gig+)(802.11ax) 藍牙5.0', '42WHrs', 'Win 11 home'),
('15-ec2040AX', 29900, 'https://tw.buy.yahoo.com/gdsale/HP-光影-Pavilion-Gaming-15-ec2040AX-15吋電競筆電-R5-5600H-9855563.html', 'https://s.yimg.com/zp/MerchandiseImages/311855B0CC-SP-10891886.jpg', 'HP惠普', 'Ryzen 5 5600H', 'RTX 3050', '8G', '2 最高16G', '512GB', '無', '1.98', '15.6吋', '1920x1080', 'Realtek Wi-Fi 6 (ax 2x2) 藍牙5.2', '標配 3cell 52.5Whr', 'Win 11 home'),
('Pavilion x360 Convert 14-dy1005TU', 29900, 'https://tw.buy.yahoo.com/gdsale/HP-星鑽翻轉-Pavilion-x360-14-dy1005TU-14吋翻轉筆電-i5-1155-9819825.html', 'https://s.yimg.com/zp/MerchandiseImages/D96BD1112B-SP-10779194.jpg', 'HP惠普', 'Intel Core i5-1155 G7 Quad Core', 'Intel Iris Xe Graphics', '8G', '2 最高16G', '512GB', '無', '1.5', '14.0吋', '1920x1080', 'Mediatek Wi-Fi6 ax2x2 藍牙5.2', '標配 3cell 43Whr', 'Win 11 home'),
('G7 GD-51TW123SO', 29900, 'https://tw.buy.yahoo.com/gdsale/技嘉-GIGABYTE-G7-GD-51TW123SO-17-3吋筆電-i5-11400H-RTX3-9870830.html', 'https://s.yimg.com/zp/MerchandiseImages/E3D605BA5D-SP-10930583.jpg', 'GIGABYTE技嘉', '第11代Intel® Core i5-11400H (2.7GHz~4.5GHz)', 'RTX3050', '16G', '2 最高64G', '512GB', '無', '2.38', '17.3吋', '1920x1080', 'Intel® AX200 Wireless 藍牙5.2', '48.96WHrs', 'Win 11 home'),
('AN515-55-52P4', 29900, 'https://tw.buy.yahoo.com/gdsale/Acer-AN515-55-52P4-15吋電競筆電-i5-10300H-RTX-2060-8G-5-9146473.html', 'https://s.yimg.com/zp/MerchandiseImages/F88CFEE70A-Gd-9146473.jpg', 'Acer宏碁', 'i5-10300H', 'RTX 2060', '8G', '2, 已佔用1 最高32G', '512GB', '無', '2.3', '15.6吋', '1920x1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.0', '57Wh Li-ion battery', 'Win10 home'),
('K513EQ-0982D1165G7', 29900, 'https://tw.buy.yahoo.com/gdsale/ASUS-K513EQ-15吋筆電-i7-1165G7-MX350-8G-512G-Win-11-V-9895730.html', 'https://s.yimg.com/zp/MerchandiseImages/97b18d7335-Gd-9895730.jpg', 'ASUS華碩', 'Core i7-1165G7 Processor 2.8 GHz', 'MX350', '8G(on board)', '1 最高16G', '512GB', '無', '1.8', '15.6吋', '1920x1080', 'Wi-Fi 6(Gig+)(802.11ax) 藍牙5.0', '42WHrs', 'Win 11 home'),
('15s-du3008TX (2M7H3PA)', 29900, 'https://tw.buy.yahoo.com/gdsale/HP-惠普-超品-15s-du3008TX-15-6吋-窄邊框筆電-i5-1135G7-16G-51-9508249.html', 'https://s.yimg.com/zp/MerchandiseImages/131C765CEC-SP-9843969.jpg', 'HP惠普', '11th Gen Intel Core i5-1135 G7 Quad Core', 'Nvidia GeForce MX450', '16G', '無(on board) 最高16G', '512GB', '無', '1.74', '15.6吋', '1920x1080', 'Intel Wi-Fi 6 AX 201 (2x2) 藍牙5.0', '標配 3cell 41Whr', 'Win10 home'),
('FA506IC-0032A4800H', 29900, 'https://tw.buy.yahoo.com/gdsale/ASUS-FA506IC-15吋電競筆電-R7-4800H-RTX-3050-8G-512GB-TU-9630508.html', 'https://s.yimg.com/zp/MerchandiseImages/8C73BC76C3-Gd-9630508.jpg', 'ASUS華碩', 'AMD Ryzen 7 4800H Processor 2.9 GHz', 'RTX3050', '8G', '2, 已佔用1 最高32G', '512GB', '無', '2.3', '15.6吋', '1920 x 1080', 'Wi-Fi 6(802.11ax)+Bluetooth 5.1 (Dual band) 2*2 藍牙5.1', '48WHrs,  3S1P,  3-cell Li-ion', 'Win10 home'),
('SF514-55TA-5884', 29900, 'https://tw.buy.yahoo.com/gdsale/Acer-SF514-55TA-5884-14吋筆電-Ci5-1135G7-8G-512G-SSD-9864500.html', 'https://s.yimg.com/zp/MerchandiseImages/B30850D203-SP-10911475.jpg', 'Acer宏碁', 'i5-1135G7', 'Intel Iris Xe Graphics', '8G(on board)', '無(on board) 最高8G', '512GB', '無', '1.050', '14.0吋', '1920 x 1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.1', '56Wh Li-ion battery', 'Win 11 home'),
('X1403ZA-0161B12500H', 29900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X1403ZA-14吋2-8K筆電-i5-12500H-8G-512G-Vivobook-9994604.html', 'https://s.yimg.com/zp/MerchandiseImages/2E76529D8E-SP-11312378.jpg', 'ASUS華碩', 'Core i5-12500H Processor 2.5 GHz', 'Intel Iris Xe Graphics', '8G(on board)', '1 最高16G', '512GB', '無', '1.6', '14.0吋', '2880 x 1800', 'Wi-Fi 6(802.11ax) 藍牙5.0', '70WHrs', 'Win 11 home'),
('Katana GF76 11UC-485TW', 29900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Katana-GF76-11UC-485TW-17-3吋電競筆電-i5-11400H-8-9787704.html', 'https://s.yimg.com/zp/MerchandiseImages/3C90BDE028-SP-10669162.jpg', 'MSI微星', 'i5-11400H', 'RTX 3050', '8G', '2 最高64G', '512GB', '無', '2.6', '17.3吋', '1920x1080', '802.11 ax Wi-Fi 6 藍牙5.2', '53.5 Battery (Whr) / 150W adapter', 'Win10 home'),
('dynabook EX40L-J PMM10T-04E01Y', 29900, 'https://tw.buy.yahoo.com/gdsale/dynabook-EX40L-J-14吋日系筆電-i5-1135G7-8GB-512GB-Win10-9636481.html', 'https://s.yimg.com/zp/MerchandiseImages/3295CC2DB4-SP-10224336.jpg', 'Dynabook', 'Intel Core i5-1135G7', 'Intel Iris Xe Graphics', '8G', '2, 已佔用1 最高32G', '512GB', '無', '1.47', '14.0吋', '1920*1080', 'Wi-Fi6 Intel 11ax+acagn 藍牙5.1', 'LI-Po 4-53Wh', 'Win10 home'),
('SFX14-41G-R2VG', 29900, 'https://tw.buy.yahoo.com/gdsale/Acer-SFX14-41G-R2VG-14吋筆電-R5-5600U-RTX3050-16G-512-9655802.html', 'https://s.yimg.com/zp/MerchandiseImages/68EFD7A9CB-SP-10276625.jpg', 'Acer宏碁', 'AMD Ryzen 5 5600U', 'RTX3050', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.39', '14.0吋', '1920 x 1080', '802.11a/b/g/n+ax MU-MIMO RX technology 藍牙5.2', '59Wh Li-ion battery', 'Win10 home'),
('TP470EA-0222K1165G7', 29900, 'https://tw.buy.yahoo.com/gdsale/ASUS-TP470EA-14吋翻轉觸控筆電-i7-1165G7-16G-512G-Vivobook-9850379.html', 'https://s.yimg.com/zp/MerchandiseImages/C477B46466-SP-10877969.jpg', 'ASUS華碩', 'Intel® Core i7-1165G7 Processor 2.8 GHz', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '-', '14.0吋', '1920 x 1080', 'Wi-Fi 6(Gig+)(802.11ax) 藍牙5.0', '-', 'Win 11 home'),
('15s-eq2003AU', 29900, 'https://tw.buy.yahoo.com/gdsale/HP-超品-15s-eq2003AU-R7-5700U-8GB-1TB-PCIe-SSD-W10-F-9722091.html', 'https://s.yimg.com/zp/MerchandiseImages/25E9B5B2FA-SP-10055698.jpg', 'HP惠普', 'Ryzen 7-5700U', 'AMD Radeon Graphics', '8G', '2 最高16G', '1TB', '無', '1.69', '15.6吋', '1920x1080', 'Wi-Fi 6 802.11 ax (1x2) 藍牙5.2', '3cell 41WHr', 'Win10 home'),
('AN515-57-57N7', 28900, 'https://tw.buy.yahoo.com/gdsale/Acer-AN515-57-57N7-15吋筆電-i5-11400H-RTX3050-8G-512G-9696736.html', 'https://s.yimg.com/zp/MerchandiseImages/9bb78c7e51-Gd-9696736.jpg', 'Acer宏碁', 'Intel® Core i5-11400H', 'RTX3050', '8G', '2 最高32G', '512GB', '無', '2.2', '15.6吋', '1920 x 1080', 'KillerWi-Fi6AX1650i802.11a/b/g/n+acR2+ax2x2MU-MIMO 藍牙5.1', '57Wh Li-ion battery', 'Win10 home'),
('X1603ZA-0281B12700H', 29900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X1603ZA-16吋筆電-i7-12700H-8G-512G-Iris-Xe-Vivob-9970013.html', 'https://s.yimg.com/zp/MerchandiseImages/4BCE8CF968-Gd-9970013.jpg', 'ASUS華碩', 'Core i7-12700H Processor 2.3 GHz', 'Intel Iris Xe Graphics', '8G(on board)', '1 最高16G', '512GB', '無', '1.87', '16吋', '1920 x 1200', 'Wi-Fi 6(802.11ax) 藍牙5.2', '50WHrs', 'Win 11 home'),
('SFX14-41G-R02A', 29900, 'https://tw.buy.yahoo.com/gdsale/VIP-Acer-SFX14-41G-R02A-14吋筆電-R7-5700U-GTX1650-16G-9685810.html', 'https://s.yimg.com/zp/MerchandiseImages/C3A4BE6777-Gd-9685810.jpg', 'Acer宏碁', 'AMD Ryzen 7 5700U', 'GTX 1650', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.39', '14.0吋', '1920x1080', '802.11a/b/g/n+ax MU-MIMO RX technology 藍牙5.2', '59Wh Li-ion battery', 'Win10 home'),
('AN515-57-53T5', 28999, 'https://tw.buy.yahoo.com/gdsale/福利品-Acer-AN515-57-53T5-15吋筆電-i5-11400H-RTX3050-4G--9702450.html', 'https://s.yimg.com/zp/MerchandiseImages/5EF83A6088-SP-10091200.jpg', 'Acer宏碁', 'Intel® Core i5-11400H', 'RTX3050', '8G', '2 最高32G', '512GB', '無', '2.2', '15.6吋', '1920 x 1080', 'KillerWi-Fi6AX1650i802.11a/b/g/n+acR2+ax2x2MU-MIMO 藍牙5.1', '57Wh Li-ion battery', 'Win10 home'),
('PBS41T-01400F', 28999, 'https://tw.buy.yahoo.com/gdsale/dynabook-EX50L-J-15-6吋多工高效筆電-i7-1165G7-512G-SSD-16-9347125.html', 'https://s.yimg.com/zp/MerchandiseImages/48df6b0e4a-Gd-9347125.jpg', 'Dynabook', 'Intel Core i7-1165G7', 'Intel Iris Xe Graphics', '16G', '2, 已佔用2 最高16G', '512GB', '無', '1.85', '15.6吋', '1920x1080', 'Wi-Fi 6 藍牙5.0', '38Whs 4cell', 'Win10 home'),
('PBS41T-01200F', 28999, 'https://tw.buy.yahoo.com/gdsale/dynabook-EX50L-J-15-6吋高效筆電-i7-1165G7-512G-16-耀眼藍-9347123.html', 'https://s.yimg.com/zp/MerchandiseImages/e100c9d3b7-Gd-9347123.jpg', 'Dynabook', 'Intel Core i7-1165G7', 'Intel Iris Xe Graphics', '16G', '2, 已佔用2 最高16G', '512GB', '無', '1.85', '15.6吋', '1920x1080', 'Wi-Fi 6 藍牙5.0', '38Whs 4cell', 'Win10 home'),
('V14-5410-R3528ATW', 28999, 'https://tw.buy.yahoo.com/gdsale/DELL-Vostro-5410-14吋筆電-I5-11320H-8G-256G-MX450-Win-9799548.html', 'https://s.yimg.com/zp/MerchandiseImages/534C99EAEB-SP-10717964.jpg', 'Dell戴爾', '11th Generation Intel® Core i5-11320H Processor', 'NVIDIA® GeForce® MX450 Graphics', '8G', '2 最高32G', '256GB', '無', '1.435', '14.0吋', '1920 x 1080', 'Intel® Wi-Fi 6 AX201 2x2 (Gig+) 藍牙4.0', '4-Cell Battery, 54 Whr (Integrated)', 'Windows 11 Pro'),
('ThinkPad L14 20U5S01Y00', 28990, 'https://tw.buy.yahoo.com/gdsale/Lenovo-L14-14吋商務筆電-Ryzen-7-PRO-4750U-8G-512G-PCIe-9493299.html', 'https://s.yimg.com/zp/MerchandiseImages/4DB52FE517-SP-9797520.jpg', 'Lenovo聯想', 'Ryzen7 PRO 4750U 八核 1.7 GHz(8M 快取記憶體，最高可達 4.1GHz)', 'AMD Radeon Graphics', '8G', '2, 已佔用1 最高64G', '512GB', '無', '1.6', '14.0吋', '1920 x 1080', 'WiFi 6 802.11 AX 藍牙5.0', '3 Cell', 'Win10 Pro'),
('IdeaPad Gaming 3i 15IHU6 82K10173TW', 28990, 'https://tw.buy.yahoo.com/gdsale/Lenovo-Gaming-3i-15-6吋電競筆電-i5-11320H-RTX3050Ti-4G獨-9962725.html', 'https://s.yimg.com/zp/MerchandiseImages/8B7D4C5628-SP-11213436.jpg', 'Lenovo聯想', 'i5-11320H (4C / 8T, 3.2 / 4.5GHz, 8MB)', 'GeForce RTX 3050Ti', '8G', '2, 已佔用1 最高64G', '512GB', '無', '2.25', '15.6吋', '1920x1080, 120Hz', 'Wi-Fi 6 11ax, 2x2 藍牙5.0', 'Integrated 45Wh', 'Win 11 home'),
('X513EP-0741W1165G7 幻彩白', 28900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X513EP-15吋筆電-i7-1165G7-MX330-8G-512G-Win-11-H-9863457.html', 'https://s.yimg.com/zp/MerchandiseImages/4506adde89-Gd-9863457.jpg', 'ASUS華碩', 'Core i7-1165G7 Processor 2.8 GHz', 'MX330', '8G(on board)', '1 最高16G', '512GB', '無', '-', '15.6吋', '1920x1080', 'Wi-Fi 6(Gig+)(802.11ax) 藍牙5.0', '42WHrs 電池', 'Win 11 home'),
('G5 GD-51TW123SO', 28900, 'https://tw.buy.yahoo.com/gdsale/技嘉-GIGABYTE-G5-GD-51TW123SO-15-6吋電競筆電-i5-11400H-RT-9870831.html', 'https://s.yimg.com/zp/MerchandiseImages/E6521F0F1B-SP-10930389.jpg', 'GIGABYTE技嘉', '第11代Intel® Core i5-11400H (2.7GHz~4.5GHz)', 'RTX3050', '16G', '2 最高64G', '512GB', '無', '2.03', '15.6吋', '1920x1080', 'Intel® AX200 Wireless 藍牙5.2', '48.96WHrs', 'Win 11 home'),
('AN515-57-517T', 28900, 'https://tw.buy.yahoo.com/gdsale/Acer-AN515-57-517T-15-6吋電競筆電-i5-11400H-RTX3050-8G-9873559.html', 'https://s.yimg.com/zp/MerchandiseImages/139987CB5A-SP-10929433.jpg', 'Acer宏碁', 'i5-11400H', 'RTX 3050', '8G', '2 最高32G', '512GB', '無', '2.2', '15.6吋', '1920 x 1080', 'Killer Wi-Fi 6 AX 1650i 802.11 a/b/g/n+acR2+ax 2x2 藍牙5.1', '57Wh Li-ion battery', 'Win 11 home'),
('FA706IC-0062B4600H', 28900, 'https://tw.buy.yahoo.com/gdsale/ASUS-FA706IC-17吋電競筆電-R5-4600H-RTX-3050-8G-512G-Win-9923325.html', 'https://s.yimg.com/zp/MerchandiseImages/DB0E4A2A00-Gd-9923325.jpg', 'ASUS華碩', 'AMD Ryzen 5 4600H Processor', 'RTX 3050', '8G', '2 最高32G', '512GB', '無', '2.6', '17.3吋', '1920x1080', 'Wi-Fi 6(802.11ax) 藍牙5.1', '90WHrs, 4S1P, 4-cell Li-ion', 'Win 11 home'),
('X1503ZA-0121S12500H', 28900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X1503ZA-15-6吋筆電-i5-12500H-8G-512G-Vivobook-15-9994601.html', 'https://s.yimg.com/zp/MerchandiseImages/2E76529D8E-SP-11308743.jpg', 'ASUS華碩', 'Core i5-12500H Processor 2.5 GHz', 'Intel Iris Xe Graphics', '8G(on board)', '1 最高16G', '512GB', '無', '1.7', '15.6吋', '1920 x 1080', 'Wi-Fi 6(802.11ax) 藍牙5.0', '70WHrs', 'Win 11 home'),
('X712EQ-0068S1135G7', 28900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X712EQ-17吋輕薄筆電-i5-1135G7-MX350-8G-512G-Vivobo-9875117.html', 'https://s.yimg.com/zp/MerchandiseImages/18cf9b483b-Gd-9875117.jpg', 'ASUS華碩', 'Intel® Core i5-1135G7 Processor 2.4 GHz', 'MX350', '8G(on board)', '1 最高16G', '512GB', '無', '2.3', '17.3吋', '1920x1080', 'Wi-Fi 6(Gig+)(802.11ax) 藍牙5.0', '48WHrs', 'Win 11 home'),
('GF63 Thin 11SC-475TW', 28900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-GF63-Thin-11SC-475TW-15-6吋電競筆電-i7-11800H-8G-9889394.html', 'https://s.yimg.com/zp/MerchandiseImages/AFE31F5C55-SP-11003342.jpg', 'MSI微星', 'i7-11800H', 'GTX 1650', '8G', '2 最高64G', '512GB', '無', '1.86', '15.6吋', '1920x1080', '802.11 ax Wi-Fi 6 藍牙5.1', '3-Cell / 51 Battery (Whr)', 'Win 11 home'),
('X1503ZA-0111B12500H', 28900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X1503ZA-15-6吋筆電-i5-12500H-8G-512G-Vivobook-15-9994602.html', 'https://s.yimg.com/zp/MerchandiseImages/2E76529D8E-SP-11308737.jpg', 'ASUS華碩', 'Core i5-12500H Processor 2.5 GHz', 'Intel Iris Xe Graphics', '8G(on board)', '1 最高16G', '512GB', '無', '1.7', '15.6吋', '1920 x 1080', 'Wi-Fi 6(802.11ax) 藍牙5.0', '70WHrs', 'Win 11 home'),
('M3401QA-0118S5600H', 28900, 'https://tw.buy.yahoo.com/gdsale/ASUS-M3401QA-14吋筆電-R5-5600H-16G-512G-Vivobook-Pro-9850370.html', 'https://s.yimg.com/zp/MerchandiseImages/798529BBCD-Gd-9850370.jpg', 'ASUS華碩', 'AMD Ryzen 5 5600H Mobile Processor', 'AMD Radeon Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.4', '14.0吋', '2880 x 1800', 'Wi-Fi 6(802.11ax) 藍牙5.0', '63Whr', 'Win10 home'),
('X513EP-0731K1165G7', 28900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X513EP-15吋筆電-i7-1165G7-MX330-8G-512G-Win-11-H-9863461.html', 'https://s.yimg.com/zp/MerchandiseImages/73001527e3-Gd-9863461.jpg', 'ASUS華碩', 'Intel® Core i7-1165G7 Processor 2.8 GHz', 'MX330', '8G(on board)', '1 最高16G', '512GB', '無', '-', '15.6吋', '1920x1080', 'Wi-Fi 6(Gig+)(802.11ax) 藍牙5.0', '42WHrs 電池', 'Win 11 home'),
('Modern 14 B11MO-830TW', 28900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Modern-14-B11MO-830TW-14吋創作者筆電-i7-1195G7-16G-9793243.html', 'https://s.yimg.com/zp/MerchandiseImages/09F4039AE6-SP-10694933.jpg', 'MSI微星', 'i7-1195G7', 'Intel UHD Graphics', '16G', '2, 已佔用1 最高64G', '512GB', '無', '1.3', '14.0吋', '1920x1080', '802.11 ax Wi-Fi 6 藍牙5.1', '39/52 Battery (Whr) /65W adapter', 'Win10 home'),
('SF514-55T-56MP', 27999, 'https://tw.buy.yahoo.com/gdsale/福利品-Acer-SF514-55T-56MP-14吋筆電-i5-1135G7-8G-金--9439015.html', 'https://s.yimg.com/zp/MerchandiseImages/418E10FF9C-Gd-9439015.jpg', 'Acer宏碁', 'Intel Core i5-1135G7', 'Intel® Iris® Xe Graphics', '8G(on board)', '無(on board) 最高8G', '512GB', '無', '1.05', '14.0吋', '1920x1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.1', '56Wh Li-ion battery', 'Win10 home'),
('V16-5625-R1508ATW', 27990, 'https://tw.buy.yahoo.com/gdsale/DELL-Vostro-5625-16吋筆電-R5-5625U-8G-512G-Win11P-灰-9969795.html', 'https://s.yimg.com/zp/MerchandiseImages/68F24C1EB8-SP-11245586.jpg', 'Dell戴爾', 'AMD® Ryzen5 5625U, 19 MB cache, 6 core', 'AMD Radeon  Graphics', '8G', '2 最高16G', '512GB', '無', '1.91', '16吋', '1920 x 1200', 'MediaTek Wi-Fi 6 藍牙4.0', '4-Cell Battery, 54 Whr (Integrated)', 'Windows 11 Pro'),
('B9450FA-3441A10210U', 27990, 'https://tw.buy.yahoo.com/gdsale/ASUS-ExpertBook-B9450FA-14吋-商用筆電-B9450FA-3441A1021-9935166.html', 'https://s.yimg.com/zp/MerchandiseImages/13ADF59DD0-SP-11140169.jpg', 'ASUS華碩', 'Intel® Core i5-10210U Processor 1.6 GHz', 'Intel UHD 620', '16G(on board)', '無(on board) 最高16G', '256GB', '無', '0.99', '14.0吋', '1920 x 1080', 'Wi-Fi 6(802.11ax) 藍牙5.0', '66Whrs', 'Win10 home'),
('M3502QA-0022K5600H', 27900, 'https://tw.buy.yahoo.com/gdsale/ASUS-M3502QA-15-6吋筆電-R5-5600H-8G-512G-Vivobook-S-1-9970014.html', 'https://s.yimg.com/zp/MerchandiseImages/36DCCA9235-Gd-9970014.jpg', 'ASUS華碩', 'Ryzen 5 5600H Mobile Processor', 'AMD Radeon Graphics', '8G(on board)', '1 最高16G', '512GB', '無', '-', '15.6吋', '1920 x 1080', 'Wi-Fi 6(802.11ax) 藍牙5.0', '50WHrs', 'Win 11 home'),
('S513EQ-0212S1135G7', 27900, 'https://tw.buy.yahoo.com/gdsale/ASUS-S513EQ-15吋筆電-i5-1135G7-MX350-8G-512G-VivoBook-9590686.html', 'https://s.yimg.com/zp/MerchandiseImages/139ABA8014-Gd-9590686.jpg', 'ASUS華碩', 'Intel® Core i5-1135G7 Processor 2.4 GHz', 'MX350', '8G(on board)', '1 最高16G', '512GB', '無', '1.8', '15.6吋', '1920x1080', 'Wi-Fi 6(Gig+)(802.11ax) 藍牙5.0', '42WHrs', 'Win10 home'),
('SF316-51-577U', 25900, 'https://tw.buy.yahoo.com/gdsale/Acer-SF316-51-577U-16吋筆電-i5-11300H-16G-512G-SSD-Sw-9522839.html', 'https://s.yimg.com/zp/MerchandiseImages/CE3F1DD92C-Gd-9522839.jpg', 'Acer宏碁', 'i5-11300H', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.7', '16吋', '1920x1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.1', '56Wh Li-ion battery', 'Win10 home'),
('SF514-55T-54WK', 27900, 'https://tw.buy.yahoo.com/gdsale/Acer-SF514-55T-54WK-輕薄觸控14吋筆電-i5-1135G7-8G-512GB-S-9896231.html', 'https://s.yimg.com/zp/MerchandiseImages/76f02cccaf-Gd-9896231.jpg', 'Acer宏碁', 'Ci5-1135G7', 'Intel Iris Xe Graphics', '8G(on board)', '無(on board) 最高8G', '512GB', '無', '1.050', '14.0吋', '1920 x 1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.1', '56Wh Li-ion battery', 'Win 11 home'),
('AN515-45-R02E', 27900, 'https://tw.buy.yahoo.com/gdsale/Acer-AN515-45-R02E-15吋獨顯電競筆電-R7-5800H-GTX1650-16G-9908969.html', 'https://s.yimg.com/zp/MerchandiseImages/48d680bb78-Gd-9908969.jpg', 'Acer宏碁', 'AMD Ryzen 7 5800H', 'GTX 1650', '16G', '2 最高32G', '512GB', '無', '2.2', '15.6吋', '1920 x 1080', '802.11 a/b/g/n+acR2+ax 2x2 MU-MIMO 藍牙5.1', '57Wh Li-ion battery', 'Win10 home'),
('S433EA-0428G1135G7', 27900, 'https://tw.buy.yahoo.com/gdsale/ASUS-S433EA-14吋筆電-i5-1135G7-16G-512G-Win-11-Home-V-9863459.html', 'https://s.yimg.com/zp/MerchandiseImages/0be128efdd-Gd-9863459.jpg', 'ASUS華碩', 'Core i5-1135G7 Processor 2.4 GHz', 'Intel® Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.4', '14.0吋', '1920x1080', 'Wi-Fi 6(Gig+)(802.11ax) 藍牙5.0', '50WHrs', 'Win 11 home'),
('S433EA-0418W1135G7', 27900, 'https://tw.buy.yahoo.com/gdsale/ASUS-S433EA-14吋筆電-i5-1135G7-16G-512G-Win-11-Home-V-9863458.html', 'https://s.yimg.com/zp/MerchandiseImages/a22241813b-Gd-9863458.jpg', 'ASUS華碩', 'Core i5-1135G7 Processor 2.4 GHz', 'Intel® Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.4', '14.0吋', '1920x1080', 'Wi-Fi 6(Gig+)(802.11ax) 藍牙5.0', '50WHrs', 'Win 11 home'),
('HP 240 G8 (326G0PA)', 27900, 'https://tw.buy.yahoo.com/gdsale/HP-惠普-240-G8-14吋商用筆電-14HD-i5-1035G1-8G-1-256GB-SSD-9409151.html', 'https://s.yimg.com/zp/MerchandiseImages/77FB8B0982-SP-9563360.jpg', 'HP惠普', 'i5-1035G1', 'Intel® UHD Graphics 620', '8G', '2 最高16G', '256GB', '無', '1.48', '14.0吋', '1366 x 768', 'Intel AX201 ax 2x2 WiFi6 藍牙5.0', '3 cell 41 WHr/3.63Ah', 'Win10 Pro'),
('Pavilion Aero Laptop 13-be0818AU', 27900, 'https://tw.buy.yahoo.com/gdsale/HP-星鑽-Pavilion-Aero-13-be0818AU-13-3吋輕薄筆電-R5-5600U-9822096.html', 'https://s.yimg.com/zp/MerchandiseImages/F2519A3355-SP-10791646.jpg', 'HP惠普', 'AMD Ryzen 5-5600U, 6 cores', 'AMD Integrated SoC', '8G(on board)', '無(on board) 最高8G', '256GB', '無', '1', '13.3吋', '1920x1200 IPS超廣角窄邊框  100% sRGB, 400nits', 'Realtak Cava Wi-Fi 6 ax2x2 藍牙5.2', '標配 3cell 43Whr', 'Win10 home'),
('S513EQ-0352S1135G7', 27790, 'https://tw.buy.yahoo.com/activity/onsale/combo?actid=363141', 'https://s.yimg.com/zp/MipImages/33178CFCE4-MIP-363141.jpeg', 'ASUS華碩', 'Intel® Core i5-1135G7 Processor 2.4 GHz', 'MX350', '8G(on board)', '1 最高16G', '512GB', '無', '1.8', '15.6吋', '1920x1080', 'Wi-Fi 6(Gig+)(802.11ax) 藍牙5.0', '42WHrs', 'Win10 home'),
('X515EP-0171G1165G7', 26900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X515EP-15吋筆電-i7-1165G7-MX330-8G-512GB-Laptop-9603448.html', 'https://s.yimg.com/zp/MerchandiseImages/92147B7349-Gd-9603448.jpg', 'ASUS華碩', 'Core i7-1165G7 Processor 2.8 GHz', 'MX 330', '8G(on board)', '1 最高32G', '512GB', '無', '1.8', '15.6吋', '1920x1080', 'Wi-Fi 5(802.11ac) 藍牙4.1', '37WHrs, 2S1P, 2-cell Li-ion', 'Win10 home'),
('Surface Pro 7+ i5/8G/128G', 27588, 'https://tw.buy.yahoo.com/gdsale/微軟Surface-Pro-7-i5-8G-128G-白金平板-TFN-00009-不含筆-鼠-9891858.html', 'https://s.yimg.com/zp/MerchandiseImages/DF4FD2B155-SP-11012985.jpg', 'Microsoft微軟', 'i5-1135G7', 'Intel Iris Xe Graphics', '8G', '無(on board) 最高8G', '128GB', '無', '0.889', '12.3吋', '2736 x 1824 (267 PPI)', 'Wi-Fi 6： 相容於 802.11ax 藍牙5.0', '-', 'Win 11 home'),
('Yoga 6 13ALC6 82ND00AXTW', 27549, 'https://tw.buy.yahoo.com/gdsale/Lenovo-Yoga-6-13-3吋觸控筆電-Ryzen-7-5700U-16G-512G-PCI-9865061.html', 'https://s.yimg.com/zp/MerchandiseImages/8488996D40-SP-10925165.jpg', 'Lenovo聯想', 'Ryzen 7 5700U (8C/16T, 1.8/4.3GHz, 4MB L2/8MB L3)', 'Integrated AMD Radeon Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.31', '13.3吋', '1920x1080', 'Wi-Fi 6 11ax, 2x2 藍牙5.0', 'Integrated 60Wh', 'Win 11 home'),
('4F1U8PA', 27500, 'https://tw.buy.yahoo.com/gdsale/HP-惠普-240-G8-14吋輕薄窄邊框商用筆電4F1U8PA-I5-1135G7-8G-500G-9731648.html', 'https://s.yimg.com/zp/MerchandiseImages/2E3EB1465E-SP-10504973.jpg', 'HP惠普', 'Intel Core i5-1135G7', 'Intel Iris Xe Graphics', '8G', '2, 已佔用1 最高16G', '無', '500GB', '1.48', '14.0吋', '1366 x 768', 'Intel AX201 ax 2x2 WiFi6 藍牙5.0', '3 cell 41 WHr/3.63Ah', 'Win10 Pro'),
('15-3511-D1828STW', 26999, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-3000-15-6吋筆電-i7-1165G7-16G-512G-MX-3-9685396.html', 'https://s.yimg.com/zp/MerchandiseImages/15FE0815A4-Gd-9685396.jpg', 'Dell戴爾', '11th Generation Intel Core i7-1165G7, 12 MB 4 Core', 'NVIDIA® GeForce® MX350', '16G', '2 最高16G', '512GB', '無', '1.73', '15.6吋', '1920 x 1080', '802.11ac 藍牙4.0', '3-cell, 41 Wh, lithium-polymer (integrated)', 'Win10 home'),
('IdeaPad Gaming 3i 15IHU6 82K10172TW', 26990, 'https://tw.buy.yahoo.com/gdsale/Lenovo-Gaming-3i-15-6吋電競筆電-i5-11320H-RTX3050-4G獨顯-9962726.html', 'https://s.yimg.com/zp/MerchandiseImages/68EB7E7225-SP-11213271.jpg', 'Lenovo聯想', 'i5-11320H (4C / 8T, 3.2 / 4.5GHz, 8MB)', 'GeForce RTX 3050', '8G', '2, 已佔用1 最高64G', '512GB', '無', '2.25', '15.6吋', '1920x1080, 120Hz', 'Wi-Fi 6 11ax, 2x2 藍牙5.0', 'Integrated 45Wh', 'Win 11 home'),
('16-5625-R1608STW', 26990, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-5625-16吋-高性能輕薄筆電-R5-5625U-16G-512G-W-9906375.html', 'https://s.yimg.com/zp/MerchandiseImages/97D4A8D56A-SP-11057595.jpg', 'Dell戴爾', 'AMD Ryzen 5 5625U 6-core/12-thread Processor', 'AMD Radeon  Graphics with shared graphics memory', '16G', '2 最高32G', '512GB', '無', '1.87', '16吋', '1920 x 1200', 'MediaTek Wi-Fi 6 2x2 藍牙4.0', '4-Cell Battery, 54 Whr (Integrated)', 'Win 11 home'),
('14-5415-R1608STW11', 24990, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-5000-14吋筆電-R5-5500U-8G-256G-Win11-白金-9762719.html', 'https://s.yimg.com/zp/MerchandiseImages/9DD5B3CD6E-SP-10597733.jpg', 'Dell戴爾', 'AMD Ryzen5 5500U 6-core/12-thread Mobile Processor', 'AMD Radeon  Graphics with shared graphics memory', '8G', '2 最高32G', '256GB', '無', '1.442', '14.0吋', '1920 x 1080', '802.11ac(wifi 5) 藍牙4.0', '4-Cell Battery, 54 Whr (Integrated)', 'Win 11 home'),
('14-5425-R1608STW', 26990, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-5425-14吋-高性能輕薄筆電-R5-5625U-16G-512G-W-9906397.html', 'https://s.yimg.com/zp/MerchandiseImages/8A554C1506-SP-11057666.jpg', 'Dell戴爾', 'AMD Ryzen 5 5625U 6-core/12-thread Processor', 'AMD Radeon  Graphics with shared graphics memory', '16G', '2 最高32G', '512GB', '無', '1.54', '14.0吋', '1920 x 1200', 'MediaTek Wi-Fi 6 2x2 藍牙4.0', '4-Cell Battery, 54 Whr (Integrated)', 'Win 11 home'),
('Yoga 7 82N7003ETW', 26990, 'https://tw.buy.yahoo.com/gdsale/Lenovo-Yoga-7-14吋觸控筆電-Ryzen-5-5600U-16G-512G-PCIe-9865056.html', 'https://s.yimg.com/zp/MerchandiseImages/472E373CB2-SP-10923369.jpg', 'Lenovo聯想', 'Ryzen 5 5600U (6C/12T, 2.3/4.2GHz, 3MB L2/16MB L3)', 'Integrated AMD Radeon Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.45', '14.0吋', '1920x1080', 'Wi-Fi 6 11ax, 2x2 藍牙5.0', 'Integrated 71Wh', 'Win10 home'),
('X515EP-0251S1165G7', 26900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X515EP-15吋筆電-i7-1165G7-MX330-8G-512G-Win-11-L-9887187.html', 'https://s.yimg.com/zp/MerchandiseImages/5061CF6D5E-Gd-9887187.jpg', 'ASUS華碩', 'Core i7-1165G7 Processor 2.8 GHz', 'MX 330', '8G(on board)', '1 最高32G', '512GB', '無', '1.8', '15.6吋', '1920x1080', 'Wi-Fi 5(802.11ac) 藍牙4.1', '37WHrs, 2S1P, 2-cell Li-ion', 'Win 11 home'),
('SF314-511-553Y', 26900, 'https://tw.buy.yahoo.com/gdsale/Acer-SF314-511-553Y-14吋筆電-i5-1135G7-16G-512G-SSD-w-9898409.html', 'https://s.yimg.com/zp/MerchandiseImages/BB3C05DEE2-SP-11004594.jpg', 'Acer宏碁', 'i5-1135G7', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.2', '14.0吋', '1920 x 1080', '802.11 a/b/g/n+acR2+ax 2x2 MU-MIMO 藍牙5.1', '56Wh Li-ion battery', 'Win 11 home'),
('X413EA-0441W1165G7', 26900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X413EA-14吋筆電-i7-1165G7-16G-512G-Win-11-Vivobo-9892917.html', 'https://s.yimg.com/zp/MerchandiseImages/6F6FB58466-Gd-9892917.jpg', 'ASUS華碩', 'Core i7-1165G7 Processor 2.8 GHz', '-', '16G', '無(on board) 最高16G', '512GB', '無', '1.4', '14.0吋', '1920x1080', 'Wi-Fi 6(802.11ax) 藍牙5.0', '42WHrs', 'Win 11 home'),
('X515EP-0231G1165G7', 26900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X515EP-15吋筆電-i7-1165G7-MX330-8G-512G-Win-11-L-9887186.html', 'https://s.yimg.com/zp/MerchandiseImages/5E0B6CF687-Gd-9887186.jpg', 'ASUS華碩', 'Core i7-1165G7 Processor 2.8 GHz', 'MX 330', '8G(on board)', '1 最高32G', '512GB', '無', '1.8', '15.6吋', '1920x1080', 'Wi-Fi 5(802.11ac) 藍牙4.1', '37WHrs, 2S1P, 2-cell Li-ion', 'Win 11 home'),
('SF314-511-513K, SF314-511-553Y', 26900, 'https://tw.buy.yahoo.com/gdsale/Acer-Swift-3-SF314-511-14吋輕薄筆電-i5-1135G7-16G-512G--10002540.html', 'https://s.yimg.com/zp/MerchandiseImages/61174EE24F-SP-10874457.jpg', 'Acer宏碁', 'i5-1135G7', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.2', '14.0吋', '1920 x 1080', '802.11 a/b/g/n+acR2+ax  2x2 MU-MIMO, 802.11 a/b/g/n+acR2+ax 2x2 MU-MIMO 藍牙5.1', '56Wh Li-ion battery', 'Win 11 home'),
('X413EA-0431K1165G7', 26900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X413EA-14吋筆電-i7-1165G7-16G-512G-Win-11-Vivobo-9892916.html', 'https://s.yimg.com/zp/MerchandiseImages/4DB5B6F42F-Gd-9892916.jpg', 'ASUS華碩', 'Core i7-1165G7 Processor 2.8 GHz', '-', '16G', '無(on board) 最高16G', '512GB', '無', '1.4', '14.0吋', '1920x1080', 'Wi-Fi 6(802.11ax) 藍牙5.0', '42WHrs', 'Win 11 home'),
('SFX14-41G-R4QU', 26900, 'https://tw.buy.yahoo.com/gdsale/Acer-SFX14-41G-R4QU-14吋筆電-R5-5500U-GTX1650-16G-512-9860575.html', 'https://s.yimg.com/zp/MerchandiseImages/68EFD7A9CB-SP-10000816.jpg', 'Acer宏碁', 'AMD Ryzen 5 5500U', 'GTX 1650', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.39', '14.0吋', '1920x1080', '802.11a/b/g/n+ax MU-MIMO RX technology 藍牙5.2', '59Wh Li-ion battery', 'Win10 home'),
('SFX14-41G-R4QU, SFX14-41G-R47W', 26900, 'https://tw.buy.yahoo.com/gdsale/Acer-SFX14-41G-14吋輕薄筆電-R5-5500U-GTX1650-16G-512G-S-9922430.html', 'https://s.yimg.com/zp/MerchandiseImages/B555AEC9F0-Gd-9922430.jpg', 'Acer宏碁', 'AMD Ryzen 5 5500U', 'GTX 1650', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.39', '14.0吋', '1920x1080', '802.11a/b/g/n+ax MU-MIMO RX technology 藍牙5.2', '59Wh Li-ion battery', 'Win10 home');
INSERT INTO `specifics_yahoo` (`nb_id`, `yahoo_price`, `yahoo_url`, `img_url`, `brand`, `cpu`, `gpu`, `ram`, `slot_max`, `SSD`, `HDD`, `weight`, `inch`, `resolution`, `internet_device`, `battery`, `windows_version`) VALUES
('HP 超品15', 26900, 'https://tw.buy.yahoo.com/gdsale/HP-超品15s-du3005TX-i5-1135-G7-8GB-MX350-2G-512G-SSD-9345825.html', 'https://s.yimg.com/zp/MerchandiseImages/bdf673fb0a-Gd-9345825.jpg', 'HP惠普', 'Core i5-1135 G7 Quad Core', 'MX350', '8G', '2 最高16G', '512GB', '無', '1.74', '15.6吋', '1920x1080', 'Intel Wi-Fi 6 AX 201 (2x2) 藍牙5.0', '3cell 41WHr', 'Win 11 home'),
('SF314-511-513K', 26500, 'https://tw.buy.yahoo.com/gdsale/福利品-AcerSF314-511-513K-14吋筆電-i5-1135G7-16G-512G-S-9933777.html', 'https://s.yimg.com/zp/MerchandiseImages/61174EE24F-SP-10874457.jpg', 'Acer宏碁', 'i5-1135G7', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.2', '14.0吋', '1920 x 1080', '802.11 a/b/g/n+acR2+ax  2x2 MU-MIMO 藍牙5.1', '56Wh Li-ion battery', 'Win 11 home'),
('SFX14-41G-R47W', 26900, 'https://tw.buy.yahoo.com/gdsale/Acer-SFX14-41G-R47W-14吋筆電-R5-5500U-GTX1650-16G-512-9839910.html', 'https://s.yimg.com/zp/MerchandiseImages/68efd7a9cb-Gd-9839910.jpg', 'Acer宏碁', 'AMD Ryzen 5 5500U', 'GTX 1650', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.39', '14.0吋', '1920x1080', '802.11a/b/g/n+ax MU-MIMO RX technology 藍牙5.2', '59Wh Li-ion battery', 'Win10 home'),
('IdeaPad Gaming3 82K100WHTW', 26526, 'https://tw.buy.yahoo.com/gdsale/Lenovo-Gaming3-15-6吋電競筆電-i5-11300H-RTX3050-4G獨顯-8G-9926341.html', 'https://s.yimg.com/zp/MerchandiseImages/1F14A8E0FD-SP-11109125.jpg', 'Lenovo聯想', 'i5-11300H (4C / 8T, 3.1 / 4.4GHz, 8MB)', 'GeForce RTX3050', '8G', '2, 已佔用1 最高64G', '512GB', '無', '2.25', '15.6吋', '1920x1080,120Hz', 'Wi-Fi 6 11ax, 2x2 藍牙5.0', 'Integrated 45Wh', 'Win 11 home'),
('dynabook CS50L-JB PYS45T-003001', 25999, 'https://tw.buy.yahoo.com/gdsale/dynabook-CS50L-JB-黑曜藍-i7-1165G7-16GB-512GB-Wi-Fi-6-9818395.html', 'https://s.yimg.com/zp/MerchandiseImages/3A2EB88A0F-SP-10775775.jpg', 'Dynabook', 'i7-1165G7', 'Intel Iris Xe Graphics', '16G', '2, 已佔用1 最高32G', '512GB', '無', '1.79', '15.6吋', '1920*1080', 'Intel Wifi 6 : Intel 11ax+acagn+BT-M.2 1216(2x2) 藍牙5.0', '2cell 45.6Wh', 'Win10 home'),
('IdeaPad 5 15ITL05 82FG01G0TW', 25990, 'https://tw.buy.yahoo.com/gdsale/Lenovo-IdeaPad-5-15-6吋效能筆電-i5-1135G7-MX450-2G獨顯-16-9977293.html', 'https://s.yimg.com/zp/MerchandiseImages/A0B6F680C5-SP-11260576.jpg', 'Lenovo聯想', 'i5-1135G7 (4C / 8T, 2.4 / 4.2GHz, 8MB)', 'GeForce MX450', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.66', '15.6吋', '1920x1080', 'Wi-Fi 6 11ax, 2x2 藍牙5.1', 'Integrated 57Wh', 'Win 11 home'),
('15-3511-R1608STW', 25990, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-3000-15-6吋筆電-i5-1135G7-16G-512G-Win-9685397.html', 'https://s.yimg.com/zp/MerchandiseImages/C1D6D81F3D-Gd-9685397.jpg', 'Dell戴爾', '11th Generation Intel Core i5-1135G7, 8 MB, 4 Core', 'Intel Iris Xe Graphics', '16G', '2 最高16G', '512GB', '無', '1.69', '15.6吋', '1920 x 1080', '802.11ac 藍牙4.0', '3-cell, 41 Wh, lithium-polymer (integrated)', 'Win10 home'),
('Yoga Slim 7 82A300MATW', 25990, 'https://tw.buy.yahoo.com/gdsale/Lenovo-Yoga-Slim-7-14吋效能筆電-i5-1135G7-8G-512G-PCIe-9874646.html', 'https://s.yimg.com/zp/MerchandiseImages/708E850C0D-SP-10954358.jpg', 'Lenovo聯想', 'i5-1135G7 (4C / 8T, 2.4 / 4.2GHz, 8MB)', 'Integrated Intel Iris Xe Graphics', '8G(on board)', '無(on board) 最高8G', '512GB', '無', '1.36', '14.0吋', '1920x1080', 'Wi-Fi 6 11ax, 2x2 藍牙5.0', 'Integrated 60.7Wh', 'Win 11 home'),
('V15-3525-R2608BTW', 25990, 'https://tw.buy.yahoo.com/activity/onsale/combo?actid=363171', 'https://s.yimg.com/zp/MipImages/D83A8B35E9-MIP-363171.jpeg', 'Dell戴爾', 'AMD Ryzen5 5625U, 19 MB cache, 6 core, 12 threads', 'Integrated: AMD Radeon Graphics', '16G', '2 最高16G', '512GB', '無', '1.69', '15.6吋', '1920 x 1080', '802.11ac 藍牙4.0', '3-cell, 41 Wh, lithium-polymer (integrated)', 'Windows 11 Pro'),
('IdeaPad Flex 5 14ITL05 82HS00WRTW', 25990, 'https://tw.buy.yahoo.com/gdsale/Lenovo-IdeaPad-Flex-5-14吋效能筆電-i5-1135G7-MX450-2G獨顯-9906175.html', 'https://s.yimg.com/zp/MerchandiseImages/C7B4FF5964-SP-11050597.jpg', 'Lenovo聯想', 'i5-1135G7 (4C / 8T, 2.4 / 4.2GHz, 8MB)', 'GeForce MX450', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.5', '14.0吋', '1920x1080', '11ac, 2x2 藍牙5.0', '65W Round Tip (3-pin)', 'Win 11 home'),
('15-5515-R1508STW', 25990, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-5000-15-6吋筆電-R5-5500U-8G-256G-Win10--9697633.html', 'https://s.yimg.com/zp/MerchandiseImages/010F7BCF5F-SP-10411254.jpg', 'Dell戴爾', 'AMD Ryzen5 5500U 6-core/12-thread Mobile Processor', 'AMD Radeon  Graphics with shared graphics memory', '8G', '2 最高32G', '256GB', '無', '1.643', '15.6吋', '1920 x 1080', 'Intel® Wi-Fi 6 AX200 2x2 (Gig+) 藍牙4.0', '4-Cell Battery, 54 Whr (Integrated)', 'Win10 home'),
('IdeaPad Gaming3 15IHU6 82K201AYTW', 25990, 'https://tw.buy.yahoo.com/activity/onsale/combo?actid=363169', 'https://s.yimg.com/zp/MipImages/660022490C-MIP-363169.jpeg', 'Lenovo聯想', 'Ryzen 5 5600H (6C/12T, 3.3/4.2GHz, 3MB L2/16MB L3)', 'GeForce RTX 3050', '8G', '2, 已佔用1 最高64G', '512GB', '無', '2.25', '15.6吋', '1920x1080, 120Hz', 'Wi-Fi 6 11ax, 2x2 藍牙5.0', 'Integrated 45Wh', 'Win 11 home'),
('K513EQ-0962S1135G7', 25900, 'https://tw.buy.yahoo.com/gdsale/ASUS-K513EQ-15吋筆電-i5-1135G7-MX350-8G-512G-Win-11-V-9895731.html', 'https://s.yimg.com/zp/MerchandiseImages/1e5b15e794-Gd-9895731.jpg', 'ASUS華碩', 'Core i5-1135G7 Processor 2.4 GHz', 'MX350', '8G(on board)', '1 最高16G', '512GB', '無', '1.8', '15.6吋', '1920x1080', 'Wi-Fi 6(Gig+)(802.11ax) 藍牙5.0', '42WHrs', 'Win 11 home'),
('HP 240 G8 (2G5H3PA)', 25900, 'https://tw.buy.yahoo.com/gdsale/HP-惠普-240-G8-14吋商用筆電-14HD-RX620-2G-i5-1035G1-8G-1--9409157.html', 'https://s.yimg.com/zp/MerchandiseImages/77FB8B0982-SP-9563385.jpg', 'HP惠普', 'i5-1035G1', 'AMD Radeon 620', '8G', '2 最高16G', '無', '500GB', '1.48', '14.0吋', '1366 x 768', 'Intel AX201 ax 2x2 WiFi6 藍牙5.0', '3 cell 41 WHr/3.63Ah', 'Win10 Pro'),
('dynabook CS40L-JG PYS48T-002001', 25900, 'https://tw.buy.yahoo.com/gdsale/dynabook-CS40L-JG-迷霧金-i7-1165G7-16GB-512GB-Wi-Fi-6-9848613.html', 'https://s.yimg.com/zp/MerchandiseImages/94AC8DCD12-SP-10873582.jpg', 'Dynabook', 'i7-1165G7', 'Intel Iris Xe Graphics', '16G', '2, 已佔用1 最高32G', '512GB', '無', '1.5', '14.0吋', '1920*1080', 'Intel Wifi 6 : Intel 11ax+acagn+BT-M.2 1216(2x2) 藍牙5.0', '2cell 45.6Wh', 'Win 11 home'),
('dynabook CS40L-JW PYS48T-001001', 25900, 'https://tw.buy.yahoo.com/gdsale/dynabook-CS40L-JW-雪漾白-i7-1165G7-16GB-512GB-Wi-Fi-6-9818392.html', 'https://s.yimg.com/zp/MerchandiseImages/49F2DC79B2-SP-10775863.jpg', 'Dynabook', 'i7-1165G7', 'Intel Iris Xe Graphics', '16G', '2, 已佔用1 最高32G', '512GB', '無', '1.5', '14.0吋', '1920*1080', 'Intel Wifi 6 : Intel 11ax+acagn+BT-M.2 1216(2x2) 藍牙5.0', '2cell 45.6Wh', 'Win 11 home'),
('FX506LHB-0291B10300H', 25900, 'https://tw.buy.yahoo.com/gdsale/ASUS-FX506LHB-15-6吋電競筆電-i5-10300H-GTX-1650-8G-512G-9994612.html', 'https://s.yimg.com/zp/MerchandiseImages/20750B6F8A-Gd-9994612.jpg', 'ASUS華碩', 'Core i5-10300H Processor 2.5 GHz', 'GTX 1650', '8G', '2 最高32G', '512GB', '無', '2.3', '15.6吋', '1920 x 1080', 'Wi-Fi 6(802.11ax) 藍牙5.2', '48WHrs, 3S1P, 3-cell Li-ion', 'Win 11 home'),
('K513EQ-0942K1135G7', 25900, 'https://tw.buy.yahoo.com/gdsale/ASUS-K513EQ-15吋筆電-i5-1135G7-MX350-8G-512G-Win-11-V-9895732.html', 'https://s.yimg.com/zp/MerchandiseImages/5025b6638b-Gd-9895732.jpg', 'ASUS華碩', 'Core i5-1135G7 Processor 2.4 GHz', 'MX350', '8G(on board)', '1 最高16G', '512GB', '無', '1.8', '15.6吋', '1920x1080', 'Wi-Fi 6(Gig+)(802.11ax) 藍牙5.0', '42WHrs', 'Win 11 home'),
('K513EQ-0952D1135G7', 25900, 'https://tw.buy.yahoo.com/gdsale/ASUS-K513EQ-15吋筆電-i5-1135G7-MX350-8G-512G-Win-11-V-9895729.html', 'https://s.yimg.com/zp/MerchandiseImages/97b18d7335-Gd-9895729.jpg', 'ASUS華碩', 'Core i5-1135G7 Processor 2.4 GHz', 'MX350', '8G(on board)', '1 最高16G', '512GB', '無', '1.8', '15.6吋', '1920x1080', 'Wi-Fi 6(Gig+)(802.11ax) 藍牙5.0', '42WHrs', 'Win 11 home'),
('A515-57G-51A9', 25900, 'https://tw.buy.yahoo.com/gdsale/Acer-A515-57G-51A9-15-6吋獨顯筆電-i5-1235U-8G-512GB-MX5-9988591.html', 'https://s.yimg.com/zp/MerchandiseImages/D2DCF716AB-SP-11295470.jpg', 'Acer宏碁', 'i5-1235U', 'MX550', '8G', '2 最高32G', '512GB', '無', '1.8', '15.6吋', '1920x1080', '802.11 a/b/g/n/ac/ax 2x2 MU-MIMO 藍牙5.2', '50Wh Li-ion battery', 'Win 11 home'),
('FX506LH-0281B10300H', 25900, 'https://tw.buy.yahoo.com/gdsale/ASUS-FX506LH-15-6吋電競筆電-i5-10300H-GTX-1650-8G-512G-9892912.html', 'https://s.yimg.com/zp/MerchandiseImages/1344B50B6A-Gd-9892912.jpg', 'ASUS華碩', 'Core i5-10300H Processor 2.5 GHz', 'GTX 1650', '8G', '2 最高32G', '512GB', '無', '2.3', '15.6吋', '1920 x 1080', 'Wi-Fi 6(802.11ax) 藍牙5.2', '48WHrs,  3S1P,  3-cell Li-ion', 'Win 11 home'),
('X1603ZA-0131B12500H', 25900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X1603ZA-16吋筆電-i5-12500H-8G-512G-Iris-Xe-Vivob-9970008.html', 'https://s.yimg.com/zp/MerchandiseImages/9C7C7A50A2-Gd-9970008.jpg', 'ASUS華碩', 'Core i5-12500H Processor 2.5 GHz', 'Intel Iris Xe Graphics', '8G(on board)', '1 最高16G', '512GB', '無', '1.87', '16吋', '1920 x 1200', 'Wi-Fi 6(802.11ax) 藍牙5.2', '50WHrs', 'Win 11 home'),
('dynabook CS40L-JB PYS48T-003001', 25900, 'https://tw.buy.yahoo.com/gdsale/dynabook-CS40L-JB-黑曜藍-i7-1165G7-16GB-512GB-Wi-Fi-6-9818394.html', 'https://s.yimg.com/zp/MerchandiseImages/AE01777FAC-SP-10775824.jpg', 'Dynabook', 'i7-1165G7', 'Intel Iris Xe Graphics', '16G', '2, 已佔用1 最高32G', '512GB', '無', '1.5', '14.0吋', '1920*1080', 'Intel Wifi 6 : Intel 11ax+acagn+BT-M.2 1216(2x2) 藍牙5.0', '2cell 45.6Wh', 'Win 11 home'),
('dynabook CS50L-JW PYS45T-001001', 25888, 'https://tw.buy.yahoo.com/gdsale/dynabook-CS50L-JW-雪漾白-i7-1165G7-16GB-512GB-Wi-Fi-6-9738439.html', 'https://s.yimg.com/zp/MerchandiseImages/7B34D2F73F-Product-28699267.jpg', 'Dynabook', 'i7-1165G7', 'Intel Iris Xe Graphics', '16G', '2, 已佔用1 最高32G', '512GB', '無', '1.79', '15.6吋', '1920*1080', 'Intel Wifi 6 : Intel 11ax+acagn+BT-M.2 1216(2x2) 藍牙5.0', '2cell 45.6Wh', 'Win10 home'),
('SF314-511-545L', 25888, 'https://tw.buy.yahoo.com/gdsale/福利品-Acer-SF314-511-545L-14吋筆電-i5-1135G7-16G-512G-S-9581459.html', 'https://s.yimg.com/zp/MerchandiseImages/61174EE24F-SP-9828477.jpg', 'Acer宏碁', 'i5-1135G7', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.2', '14.0吋', '1920 x 1080', '802.11 a/b/g/n+acR2+ax  2x2 MU-MIMO 藍牙5.1', '56Wh Li-ion battery', 'Win10 home'),
('SF314-511-5417', 25888, 'https://tw.buy.yahoo.com/gdsale/福利品-Acer-SF314-511-5417-14吋筆電-Ci5-1135G7-16G-512G--9620007.html', 'https://s.yimg.com/zp/MerchandiseImages/BB3C05DEE2-SP-10037897.jpg', 'Acer宏碁', 'i5-1135G7', 'Intel Iris Xe Graphics', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.2', '14.0吋', '1920 x 1080', '802.11 a/b/g/n+acR2+ax 2x2 MU-MIMO 藍牙5.1', '56Wh Li-ion battery', 'Win10 home'),
('Modern 15 A10M-663TW', 24999, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Modern-15-A10M-663TW-商務筆電-i7-10510U-8G-512G-9720390.html', 'https://s.yimg.com/zp/MerchandiseImages/FEC6810DA7-Gd-9720390.jpg', 'MSI微星', 'i7-10510U', 'Intel UHD Graphics', '8G', '2 最高64G', '512GB', '無', '1.6', '15.6吋', '1920x1080', '802.11 ax Wi-Fi 6 藍牙5.0', '65W adapter', 'Win10 home'),
('V15-3525-R1608BTW', 24990, 'https://tw.buy.yahoo.com/gdsale/DELL-Vostro-3000-15吋筆電-R5-5625U-8G-512G-Win11P-碳黑-9932467.html', 'https://s.yimg.com/zp/MerchandiseImages/5809010C8D-SP-11131728.jpg', 'Dell戴爾', 'AMD Ryzen5 5625U, 19 MB cache, 6 core, 12 threads', 'Integrated: AMD Radeon Graphics', '8G', '2 最高16G', '512GB', '無', '1.69', '15.6吋', '1920 x 1080', '802.11ac 藍牙4.0', '3-cell, 41 Wh, lithium-polymer (integrated)', 'Windows 11 Pro'),
('14-5425-R1508STW', 24990, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-5425-14吋-高性能輕薄筆電-R5-5625U-8G-512G-Wi-9906116.html', 'https://s.yimg.com/zp/MerchandiseImages/8A554C1506-SP-11056716.jpg', 'Dell戴爾', 'AMD Ryzen 5 5625U 6-core/12-thread Processor', 'AMD Radeon  Graphics with shared graphics memory', '8G', '2 最高32G', '512GB', '無', '1.54', '14.0吋', '1920 x 1200', 'MediaTek Wi-Fi 6 2x2 藍牙4.0', '4-Cell Battery, 54 Whr (Integrated)', 'Win 11 home'),
('16-5625-R1508STW', 24990, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-5625-16吋-高性能輕薄筆電-R5-5625U-8G-512G-Wi-9906356.html', 'https://s.yimg.com/zp/MerchandiseImages/97D4A8D56A-SP-11057445.jpg', 'Dell戴爾', 'AMD Ryzen 5 5625U 6-core/12-thread Processor', 'AMD Radeon  Graphics with shared graphics memory', '8G', '2 最高32G', '512GB', '無', '1.87', '16吋', '1920 x 1200', 'MediaTek Wi-Fi 6 2x2 藍牙4.0', '4-Cell Battery, 54 Whr (Integrated)', 'Win 11 home'),
('A515-56G-58U0', 20999, 'https://tw.buy.yahoo.com/gdsale/福利品-Acer-A515-56G-58U0-15吋筆電-i5-1135G7-MX350-黑--9795346.html', 'https://s.yimg.com/zp/MerchandiseImages/E646A4EE7C-SP-9125695.jpg', 'Acer宏碁', 'Intel® Core i5-1135G7', 'MX350', '8G(on board)', '1 最高24G', '512GB', '無', '1.7', '15.6吋', '1920x1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.1', '48Wh Li-ion battery', 'Win10 home'),
('X513EP-0701K1135G7', 24900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X513EP-15吋筆電-i5-1135G7-MX330-8G-512G-Win-11-H-9863460.html', 'https://s.yimg.com/zp/MerchandiseImages/73001527e3-Gd-9863460.jpg', 'ASUS華碩', 'Intel® Core i5-1135G7 Processor 2.4 GHz', 'MX330', '8G(on board)', '1 最高16G', '512GB', '無', '-', '15.6吋', '1920x1080', 'Wi-Fi 6(Gig+)(802.11ax) 藍牙5.0', '42WHrs 電池', 'Win 11 home'),
('X1402ZA-0051B1240P', 24900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X1402ZA-14吋筆電-i5-1240P-8G-512G-Vivobook-15-午夜-9994598.html', 'https://s.yimg.com/zp/MerchandiseImages/2E76529D8E-SP-11312741.jpg', 'ASUS華碩', 'Core i5-1240P Processor 1.7 GHz', '-', '8G(on board)', '1 最高16G', '512GB', '無', '1.5', '14.0吋', '1920 x 1080', 'Wi-Fi 6(802.11ax) 藍牙5.0', '42Whs 3cell, 鋰電池', 'Win 11 home'),
('XENIAXe15TI5G11GXELX-SGCUS', 24900, 'https://tw.buy.yahoo.com/gdsale/威剛-XPG-XENIAXe15TI5G11GXELX-SGCUS-15-6吋筆電-9913793.html', 'https://s.yimg.com/zp/MerchandiseImages/59197D6F90-SP-11064066.jpg', 'XPG', 'Intel® Core i5-1135G7', 'Intel Iris Xe Graphics', '8G', '無(on board) 最高8G', '1TB', '無', '1.65', '15.6吋', '1920x1080', 'Intel® Wi-Fi 6 AX201 藍牙5.1', '73.41Whr, 支援快速充電', 'Win10 home'),
('SF314-59-53H4', 24900, 'https://tw.buy.yahoo.com/gdsale/Acer-SF314-59-53H4-14吋筆電-i5-1135G7-8G-512G-SSD-Swi-9269840.html', 'https://s.yimg.com/zp/MerchandiseImages/018C13AFDB-Gd-9269840.jpg', 'Acer宏碁', 'Intel® Core i5-1135G7', 'Intel® Iris® Xe Graphics', '8G(on board)', '無(on board) 最高8G', '512GB', '無', '1.37', '14.0吋', '1920x1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.1', '57Wh Li-ion battery', 'Win10 home'),
('X513EP-0711W1135G7', 24900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X513EP-15吋筆電-i5-1135G7-MX330-8G-512G-Win-11-H-9863462.html', 'https://s.yimg.com/zp/MerchandiseImages/4506adde89-Gd-9863462.jpg', 'ASUS華碩', 'Intel® Core i5-1135G7', 'MX330', '8G(on board)', '1 最高16G', '512GB', '無', '-', '15.6吋', '1920x1080', 'Wi-Fi 6(Gig+)(802.11ax) 藍牙5.0', '42WHrs 電池', 'Win 11 home'),
('Swift3-SF314-57-787W', 24900, 'https://tw.buy.yahoo.com/gdsale/Acer-SF314-57-787W-14吋筆電--8859732.html', 'https://s.yimg.com/zp/MerchandiseImages/3E6B6E2190-Gd-8859732.jpg', 'Acer宏碁', 'Intel Core i7-1065G7', 'Intel® UHD Graphics', '8G', '無(on board) 最高8G', '512GB', '無', '1.19', '14.0吋', '1920x1080', 'Intel® AX201 (2x2/160) Wi-Fi 6 Gig+ 藍牙5.0', '48 Wh 4200 mAh', 'Win10 home'),
('SF314-59-50FZ', 24900, 'https://tw.buy.yahoo.com/gdsale/Acer-SF314-59-53H4-14吋筆電-i5-1135G7-8G-512G-SSD-Swi-9269770.html', 'https://s.yimg.com/zp/MerchandiseImages/A6526F64F7-Gd-9269770.jpg', 'Acer宏碁', 'Intel® Core i5-1135G7', 'Intel® Iris® Xe Graphics', '8G(on board)', '無(on board) 最高8G', '512GB', '無', '1.37', '14.0吋', '1920x1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.1', '57Wh Li-ion battery', 'Win10 home'),
('AV15-51-775Y', 24900, 'https://tw.buy.yahoo.com/gdsale/Acer-AV15-51-775Y-15吋環保效能筆電-i7-1195G7-8G-512G-SSD-9864496.html', 'https://s.yimg.com/zp/MerchandiseImages/E4C2C20941-SP-10918118.jpg', 'Acer宏碁', 'i7-1195G7', 'Intel Iris Xe Graphics', '8G(on board)', '1 最高24G', '512GB', '無', '1.8', '15.6吋', '1920 x 1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.1', '48 Wh 3-cell Li-ion battery', 'Win 11 home'),
('15-dk2805TX', 24900, 'https://tw.buy.yahoo.com/gdsale/HP-光影-Gaming-15-dk2805TX-15-6吋電競筆電-i5-11300H-8G-GT-9609086.html', 'https://s.yimg.com/zp/MerchandiseImages/8680339669-SP-10129899.jpg', 'HP惠普', 'i5-11300H', 'GTX 1650', '8G', '2 最高32G', '512GB', '無', '2.23', '15.6吋', '1920x1080', 'Intel Wi-Fi 6 AX 201 (2x2) 藍牙5.0', '標配 3cell 52.5Whr', 'Win 11 home'),
('AN515-56-58V1', 24888, 'https://tw.buy.yahoo.com/activity/onsale/combo?actid=361455', 'https://s.yimg.com/zp/MipImages/CCA43C72C0-MIP-361455.jpeg', 'Acer宏碁', 'i5-11300H', 'GTX 1650', '8G', '1 最高32G', '512GB', '無', '2.2', '15.6吋', '1920x1080', '802.11 a/b/g/n+acR2+ax 2x2 MU-MIMO 藍牙5.1', '57Wh Li-ion battery', 'Win10 home'),
('X1502ZA-0091S1240P', 24900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X1502ZA-15-6吋筆電-i5-1240P-8G-512G-Vivobook-15-9994596.html', 'https://s.yimg.com/zp/MerchandiseImages/B1547DD5B2-SP-11312667.jpg', 'ASUS華碩', 'Core i5-1240P Processor 1.7 GHz', '-', '8G(on board)', '1 最高16G', '512GB', '無', '1.7', '15.6吋', '1920 x 1080', 'Wi-Fi 6(802.11ax) 藍牙5.0', '42Whs 3cell, 鋰電池', 'Win 11 home'),
('A515-56G-51HB', 24900, 'https://tw.buy.yahoo.com/gdsale/Acer-A515-56G-51HB-15吋筆電-i5-1135G7-MX350-8G-512G-S-9251735.html', 'https://s.yimg.com/zp/MerchandiseImages/94FFD14403-Gd-9251735.jpg', 'Acer宏碁', 'Intel® Core i5-1135G7', 'MX350', '8G(on board)', '1 最高24G', '512GB', '無', '1.7', '15.6吋', '1920x1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.1', '48Wh Li-ion battery', 'Win10 home'),
('X1402ZA-0071S1240P', 24900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X1402ZA-14吋筆電-i5-1240P-8G-512G-Vivobook-15-冰河-9994595.html', 'https://s.yimg.com/zp/MerchandiseImages/2E76529D8E-SP-11312755.jpg', 'ASUS華碩', 'Core i5-1240P Processor 1.7 GHz', '-', '8G(on board)', '1 最高16G', '512GB', '無', '1.5', '14.0吋', '1920 x 1080', 'Wi-Fi 6(802.11ax) 藍牙5.0', '42Whs 3cell, 鋰電池', 'Win 11 home'),
('Ideapad 5 14ITL05 82FE018JTW', 24486, 'https://tw.buy.yahoo.com/gdsale/Lenovo-Ideapad-5-14吋效能筆電-i5-1135G7-MX450-2G獨顯-16G-9928708.html', 'https://s.yimg.com/zp/MerchandiseImages/C7C4D60C41-SP-11114669.jpg', 'Lenovo聯想', 'i5-1135G7 (4C / 8T, 2.4 / 4.2GHz, 8MB)', 'GeForce MX450', '16G(on board)', '無(on board) 最高16G', '512GB', '無', '1.39', '14.0吋', '1920x1080', 'Wi-Fi 6 11ax, 2x2 藍牙5.1', 'Integrated 56.5Wh', 'Win 11 home'),
('15-3511-D1628STW', 23999, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-3000-15-6吋筆電-i5-1135G7-16G-512G-MX-3-9685399.html', 'https://s.yimg.com/zp/MerchandiseImages/15FE0815A4-Gd-9685399.jpg', 'Dell戴爾', '11th Generation Intel Core i5-1135G7, 8 MB, 4 Core', 'NVIDIA® GeForce® MX350', '16G', '2 最高16G', '512GB', '無', '1.73', '15.6吋', '1920 x 1080', '802.11ac 藍牙4.0', '3-cell, 41 Wh, lithium-polymer (integrated)', 'Win10 home'),
('15-3525-R2608STW', 23990, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-3000-15-6吋筆電-R5-5625U-16G-512G-Win11-9985387.html', 'https://s.yimg.com/zp/MerchandiseImages/756B32DB3A-SP-11287904.jpg', 'Dell戴爾', 'AMD Ryzen5 5625U, 19 MB cache, 6 core, 12 threads', 'AMD Radeon Graphics', '16G', '2 最高16G', '512GB', '無', '1.68', '15.6吋', '1920 x 1080', '802.11ac 藍牙4.0', '3-cell, 41 Wh, lithium-polymer (integrated)', 'Win 11 home'),
('A515-57-52NZ', 23900, 'https://tw.buy.yahoo.com/gdsale/Acer-A515-57-52NZ-15-6吋筆電-i5-1235U-8G-512GB-win-11-9988569.html', 'https://s.yimg.com/zp/MerchandiseImages/D2DCF716AB-SP-11295625.jpg', 'Acer宏碁', 'i5-1235U', '無', '8G', '2 最高32G', '512GB', '無', '1.76', '15.6吋', '1920x1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.2', '50Wh Li-ion battery', 'Win 11 home'),
('A514-54-54LF', 19900, 'https://tw.buy.yahoo.com/gdsale/Acer-A514-54-54LF-14吋筆電-i5-1135G7-8G-512G-SSD-銀-W1-9860572.html', 'https://s.yimg.com/zp/MerchandiseImages/a76a7ec986-Gd-9846675.jpg', 'Acer宏碁', 'Intel® Core i5-1135G7', 'Intel Iris Xe Graphics', '8G(on board)', '1 最高24G', '512GB', '無', '1.45', '14.0吋', '1920x1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.1', '48Wh Li-ion battery', 'Win 11 home'),
('Modern 14 B10MW-666TW', 23900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Modern-14-B10MW-666TW-14吋創作者筆電-i7-10510U-8G-9901710.html', 'https://s.yimg.com/zp/MerchandiseImages/4077044E4E-SP-11042602.jpg', 'MSI微星', 'i7-10510U', 'Intel UHD Graphics', '8G', '2, 已佔用1 最高32G', '512GB', '無', '1.3', '14.0吋', '1920x1080', '802.11 ac Wi-Fi 藍牙5.0', '39/52 Battery (Whr) /65W adapter', 'Win10 Pro'),
('A315-58G-54EK', 23900, 'https://tw.buy.yahoo.com/gdsale/Acer-A315-58G-54EK-15吋筆電-i5-1135G7-MX350-8G-256G-1-9900892.html', 'https://s.yimg.com/zp/MerchandiseImages/847207AA1D-SP-10996946.jpg', 'Acer宏碁', 'Intel® Core i5-1135G7', 'MX350', '8G(on board)', '1 最高16G', '256GB', '1TB', '1.7', '15.6吋', '1920 x 1080', '802.11a/b/g/n/ac 1x1 MU-MIMO 藍牙5.0', '36Wh Li-ion battery', 'Win 11 home'),
('Modern 14 B11M-667TW', 23900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Modern-14-B11M-667TW-14吋創作者筆電-i5-1155G7-8G-5-9760109.html', 'https://s.yimg.com/zp/MerchandiseImages/1fe5bcb4d7-Gd-9760109.jpg', 'MSI微星', 'i5-1155G7', 'Intel Iris Xe Graphics', '8G', '1 最高32G', '512GB', '無', '1.3', '14.0吋', '1920x1080', '802.11 ax Wi-Fi 6 藍牙5.1', '3-Cell 65W adapter', 'Win10 home'),
('X413EP-0021W1135G7', 23900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X413EP-14吋筆電-i5-1135G7-8G-512G-SSD-MX330-Vivo-9333660.html', 'https://s.yimg.com/zp/MerchandiseImages/FDCE9FA6D2-Gd-9333660.jpg', 'ASUS華碩', 'Intel® Core i5-1135G7', 'MX330', '8G(on board)', '1 最高8G', '512GB', '無', '-', '14.0吋', '1920x1080', 'Wi-Fi 6(Gig+)(802.11ax) 藍牙5.0', '-', 'Win10 home'),
('U4 UD-50TW823SO', 23500, 'https://tw.buy.yahoo.com/gdsale/技嘉-GIGABYTE-U4-UD-50TW823SO-14吋輕薄筆電-i5-1155G7-16G-9865548.html', 'https://s.yimg.com/zp/MerchandiseImages/FFC8E8238C-SP-10926780.jpg', 'GIGABYTE技嘉', '第11代Intel® Core i5-1155G7 (2.5GHz~4.5GHz)', 'Intel Iris Xe Graphics', '16G', '2 最高64G', '512GB', '無', '0.99', '14.0吋', '1920x1080', 'WIFI: Intel® AX201 Wireless 藍牙5.2', '鋰離子電池 36Wh', 'Win 11 home'),
('81Y4005VTW', 23490, 'https://tw.buy.yahoo.com/gdsale/Lenovo-IdeaPad-Gaming-3i-15吋筆電-I5-10300H-8G-1TB-GT-9046337.html', 'https://s.yimg.com/zp/MerchandiseImages/7CBDE2029D-Gd-9046337.jpg', 'Lenovo聯想', 'CORE_I5-10300H_2.5G_4C_MB', 'GTX 1650', '8G', '已佔用1 最高8G', '無', '1TB', '2.2', '15.6吋', '1920 x 1080', 'WLAN_2X2AX 藍牙5.0', '3CELL_45WH_INTERNAL', 'Win10 home'),
('PBS41T-01100E', 22999, 'https://tw.buy.yahoo.com/gdsale/dynabook-EX50L-J-15-6吋多工筆電-i5-1135G7-512G-SSD-8G藍-9347126.html', 'https://s.yimg.com/zp/MerchandiseImages/184352da4d-Gd-9347126.jpg', 'Dynabook', 'Intel Core i5-1135G7', 'Intel Iris Xe Graphics', '8G', '2, 已佔用1 最高16G', '512GB', '無', '1.85', '15.6吋', '1920x1080', 'Wi-Fi 6 藍牙5.0', '38Whs 4cell', 'Win10 home'),
('T3300KA-0192KN6000', 22990, 'https://tw.buy.yahoo.com/gdsale/ASUS-T3300KA-13-3吋二合一平板電腦-N6000-8G-128G-SSD-Vivobo-9964671.html', 'https://s.yimg.com/zp/MerchandiseImages/84FC39538E-Gd-9964671.jpg', 'ASUS華碩', 'Pentium® Silver N6000 Processor 1.1 GHz', '無', '8G(on board)', '無(on board) 最高8G', '128GB', '無', '0.78', '13.3吋', '1920x1080', 'Wi-Fi 6(802.11ax) 藍牙5.2', '50Whs 3cell', 'Win 11 home S模式'),
('IdeaPad 3 15ITL6 82H802GSTW', 22990, 'https://tw.buy.yahoo.com/gdsale/Lenovo-IdeaPad-3-15-6吋效能筆電-i5-1135G7-MX350-2G獨顯-8G-9991122.html', 'https://s.yimg.com/zp/MerchandiseImages/E485E75DB8-SP-11302224.jpg', 'Lenovo聯想', 'i5-1135G7 (4C / 8T, 2.4 / 4.2GHz, 8MB)', 'GeForce MX350', '8G', '1 最高40G', '512GB', '無', '1.65', '15.6吋', '1920x1080', '11ac, 2x2 藍牙5.0', 'Integrated 38Wh', 'Win 11 home'),
('B1500CEAE-0191A1115G4', 22990, 'https://tw.buy.yahoo.com/gdsale/ASU-ExpertBook-B1-15-6吋-商用筆電-B1500CEAE-0191A1115G4-9886976.html', 'https://s.yimg.com/zp/MerchandiseImages/fc04c5f5f8-Gd-9886976.jpg', 'ASUS華碩', 'Intel® Core i3-1115G4 Processor 3.0 GHz', 'Intel® Iris® Xe Graphics +MX330/2G', '16G(on board)', '1 最高48G', '512GB', '2TB', '1.75', '15.6吋', '1920 x 1080', 'Wi-Fi 6(802.11ax) 藍牙5.2', '42WHrs，3S1P，3 芯鋰離子', 'Win10 Pro'),
('Ideapad 3 15ITL6 82H802GRTW', 22990, 'https://tw.buy.yahoo.com/gdsale/Lenovo-IdeaPad-3-15-6吋效能筆電-i5-1135G7-MX350-2G獨顯-8G-9974391.html', 'https://s.yimg.com/zp/MerchandiseImages/5AFC105982-SP-11254736.jpg', 'Lenovo聯想', 'i5-1135G7 (4C / 8T, 2.4 / 4.2GHz, 8MB)', 'GeForce MX350', '8G', '1 最高40G', '512GB', '無', '1.65', '15.6吋', '1920x1080', '11ac, 2x2 藍牙5.0', 'Integrated 38Wh', 'Win 11 home'),
('15-3525-R1608STW', 22990, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-3000-15-6吋筆電-R5-5625U-8G-512G-Win11--9985140.html', 'https://s.yimg.com/zp/MerchandiseImages/756B32DB3A-SP-11287756.jpg', 'Dell戴爾', 'AMD Ryzen5 5625U, 19 MB cache, 6 core, 12 threads', 'AMD Radeon Graphics', '8G', '2 最高16G', '512GB', '無', '1.68', '15.6吋', '1920 x 1080', '802.11ac 藍牙4.0', '3-cell, 41 Wh, lithium-polymer (integrated)', 'Win 11 home'),
('B1400CEAE-0521A1115G4', 22990, 'https://tw.buy.yahoo.com/gdsale/ASU-ExpertBook-B1400-14吋-商用筆電-B1400CEAE-0521A1115G-9886973.html', 'https://s.yimg.com/zp/MerchandiseImages/63f3a254fb-Gd-9886973.jpg', 'ASUS華碩', 'Intel® Core i3-1115G4 Processor 3.0 GHz', 'Intel® UHD graphics', '8G(on board)', '1 最高48G', '256GB', '無', '1.45', '14.0吋', '1366 x 768', 'Wi-Fi 6(802.11ax) 藍牙5.2', '42WHrs，3S1P，3 芯鋰離子', 'Win10 Pro'),
('Surface Go 3 6500Y/8G/128G', 16699, 'https://tw.buy.yahoo.com/activity/onsale/combo?actid=357443', 'https://s.yimg.com/zp/MipImages/FDB6628998-MIP-357443.jpeg', 'Microsoft微軟', '6500Y', 'Intel® UHD Graphics 615', '8G', '無(on board) 最高8G', '128GB', '無', '0.544', '10.5吋', '1920 x 1280 (220 PPI)', 'Wi-Fi 6： 相容於 IEEE 802.11 a/b/g/n/ac/ax 藍牙5.0', '一般裝置使用方式可達 11 小時', 'Win 11 home S模式'),
('A315-58G-50M5', 22900, 'https://tw.buy.yahoo.com/gdsale/Acer-A315-58G-50M5-15吋筆電-i5-1135G7-MX350-8G-256G-1-9584532.html', 'https://s.yimg.com/zp/MerchandiseImages/78E36B5E2B-Gd-9584532.jpg', 'Acer宏碁', 'Intel® Core i5-1135G7', 'MX350', '8G(on board)', '1 最高16G', '256GB', '1TB', '1.7', '15.6吋', '1920 x 1080', '802.11a/b/g/n/ac 藍牙5.0', '36Wh Li-ion battery', 'Win10 home'),
('X415EP-0091G1135G7', 22900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X415EP-14吋筆電-i5-1135G7-MX330-8G-512G-Win-11-H-9863424.html', 'https://s.yimg.com/zp/MerchandiseImages/1774dcff07-Gd-9863424.jpg', 'ASUS華碩', 'Intel® Core i5-1135G7 Processor 2.4 GHz', 'MX 330', '8G', '已佔用1 最高16G', '512GB', '無', '1.59', '14.0吋', '1920x1080', 'Wi-Fi 5(802.11ac) 藍牙4.1', '32WHrs, 2S1P, 2-cell Li-ion', 'Win 11 home'),
('Nitro -AN515-54-56KU', 22900, 'https://tw.buy.yahoo.com/gdsale/Acer-AN515-54-56KU-15吋電競筆-8882117.html', 'https://s.yimg.com/zp/MerchandiseImages/4298312A8C-Gd-8882117.jpg', 'Acer宏碁', 'Intel Core i5-9300H', 'GTX 1050', '8G', '2, 已佔用1 最高32G', '256GB', '無', '2.3', '15.6吋', '1920x1080', '802.11a/b/g/n/ac 藍牙5.0', '55Wh 3580mAh', 'Win10 home'),
('X515EP-0221G1135G7', 22900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X515EP-15吋筆電-i5-1135G7-MX330-8G-512G-Win-11-H-9863425.html', 'https://s.yimg.com/zp/MerchandiseImages/C4B34F6081-Gd-9863425.jpg', 'ASUS華碩', 'Intel® Core i5-1135G7 Processor 2.4 GHz', 'MX 330', '8G', '已佔用1 最高16G', '512GB', '無', '1.8', '15.6吋', '1920x1080', 'Wi-Fi 5(802.11ac) 藍牙4.1', '37Whs 2cell, 鋰電池', 'Win 11 home'),
('14s-dq4005TU', 22900, 'https://tw.buy.yahoo.com/gdsale/HP-超品-14s-dq4005TU-i5-1155-G7-8GB-512GB-PCIe-SSD-W-9828759.html', 'https://s.yimg.com/zp/MerchandiseImages/736F84799B-SP-10809188.jpg', 'HP惠普', 'i5-1155 G7', 'Intel Iris Xe Graphics', '8G', '2 最高16G', '512GB', '無', '1.47', '14.0吋', '1920x1080', 'Intel Wi-Fi 6 AX 201 (2x2) 藍牙5.0', '3cell 41WHr', 'Win 11 home'),
('X415EP-0081S1135G7', 22900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X415EP-14吋筆電-i5-1135G7-MX330-8G-512G-Laptop-冰-9590724.html', 'https://s.yimg.com/zp/MerchandiseImages/9FE2D5457D-Gd-9590724.jpg', 'ASUS華碩', 'Intel® Core i5-1135G7 Processor 2.4 GHz', 'MX 330', '8G', '已佔用1 最高16G', '512GB', '無', '1.59', '14.0吋', '1920x1080', 'Wi-Fi 5(802.11ac) 藍牙4.1', '32WHrs, 2S1P, 2-cell Li-ion', 'Win10 home'),
('A315-58G-52YG', 22900, 'https://tw.buy.yahoo.com/gdsale/Acer-A315-58G-52YG-15吋筆電-i5-1135G7-MX350-8G-256G-1-9529581.html', 'https://s.yimg.com/zp/MerchandiseImages/847207AA1D-SP-9884490.jpg', 'Acer宏碁', 'Intel® Core i5-1135G7', 'MX350', '8G(on board)', '1 最高16G', '256GB', '1TB', '1.7', '15.6吋', '1920 x 1080', '802.11a/b/g/n/ac 藍牙5.0', '36Wh Li-ion battery', 'Win10 home'),
('X515EP-0241S1135G7', 22900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X515EP-15吋筆電-i5-1135G7-MX330-8G-512G-Win-11-H-9863422.html', 'https://s.yimg.com/zp/MerchandiseImages/6C71B19E48-Gd-9863422.jpg', 'ASUS華碩', 'Intel® Core i5-1135G7 Processor 2.4 GHz', 'MX 330', '8G', '已佔用1 最高16G', '512GB', '無', '1.8', '15.6吋', '1920x1080', 'Wi-Fi 5(802.11ac) 藍牙4.1', '37Whs 2cell, 鋰電池', 'Win 11 home'),
('Modern 15 A5M-092TW', 22900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Modern-15-A5M-092TW-15吋商務筆電-R7-5700U-8G-512G-9775410.html', 'https://s.yimg.com/zp/MerchandiseImages/BA6C02B2EC-SP-10640038.jpg', 'MSI微星', 'Ryzen 7 5700U', 'AMD Radeon Graphics', '8G', '1 最高64G', '512GB', '無', '1.6', '15.6吋', '1920x1080', '802.11 ax Wi-Fi 6 藍牙5.2', '3-Cell 65W adapter', 'Win 11 home'),
('Modern 15 A11MU-1028TW', 22900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Modern-15-A11MU-1028TW-商務筆電-i5-1155-G7-8G-51-10000489.html', 'https://s.yimg.com/zp/MerchandiseImages/D4EA5BE282-SP-11318082.jpg', 'MSI微星', 'i5-1155G7', 'Intel UHD Graphics', '8G', '2 最高64G', '512GB', '無', '1.6', '15.6吋', '1920x1080', '802.11 ax Wi-Fi 6 藍牙5.1', '65W adapter', 'Win 11 home'),
('X513EA-0031W1135G7', 22900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X513EA-15吋筆電-i5-1135G7-8G-512G-Win-11-Home-Vi-9938340.html', 'https://s.yimg.com/zp/MerchandiseImages/4506ADDE89-SP-11133443.jpg', 'ASUS華碩', 'Intel® Core i5-1135G7', 'Intel Iris Xe Graphics', '8G(on board)', '1 最高16G', '512GB', '無', '1.7', '15.6吋', '1920x1080', 'Wi-Fi 6(802.11ax) 藍牙5.0', '42WHrs', 'Win 11 home'),
('A515-56G-536P', 22900, 'https://tw.buy.yahoo.com/gdsale/Acer-A515-56G-536P-15吋筆電-i5-1135G7-MX350-8G-512G-S-9898403.html', 'https://s.yimg.com/zp/MerchandiseImages/4F7D2D3431-SP-11002268.jpg', 'Acer宏碁', 'Intel® Core i5-1135G7', 'MX350', '8G(on board)', '1 最高24G', '512GB', '無', '1.7', '15.6吋', '1920x1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.1', '48Wh Li-ion battery', 'Win 11 home'),
('A517-52-57JX', 22900, 'https://tw.buy.yahoo.com/gdsale/Acer-A517-52-57JX-17-3吋筆電-i5-1135G7-4G-1T-256G-Asp-9988594.html', 'https://s.yimg.com/zp/MerchandiseImages/3C689A88D2-SP-11291423.jpg', 'Acer宏碁', 'i5-1135G7', 'Intel Iris Xe Graphics', '4G(on board)', '無(on board) 最高20G', '256GB', '1TB', '2.27', '17.3吋', '1920x1080', '802.11a/b/g/n/ac 1x1 MU-MIMO 藍牙5.0', '48Wh 3-cell Li-ion battery', 'Win10 home'),
('A515-56G-58A7, A515-56G-536P', 22900, 'https://tw.buy.yahoo.com/gdsale/Acer-A515-56G-15吋效能筆電-i5-1135G7-MX350-8G-512G-SSD--9922429.html', 'https://s.yimg.com/zp/MerchandiseImages/71CECE74A7-Gd-9922429.jpg', 'Acer宏碁', 'i5-1135G7, Intel® Core i5-1135G7', 'MX350', '8G(on board)', '1 最高24G', '512GB', '無', '1.7', '15.6吋', '1920 x 1080, 1920x1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.1', '48Wh Li-ion battery', 'Win 11 home'),
('X513EA-0021K1135G7', 22900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X513EA-15吋筆電-i5-1135G7-8G-512G-Win-11-Home-Vi-9938341.html', 'https://s.yimg.com/zp/MerchandiseImages/73001527E3-SP-11133509.jpg', 'ASUS華碩', 'Intel® Core i5-1135G7', 'Intel Iris Xe Graphics', '8G(on board)', '1 最高16G', '512GB', '無', '1.7', '15.6吋', '1920x1080', 'Wi-Fi 6(802.11ax) 藍牙5.0', '42WHrs', 'Win 11 home'),
('A515-56G-58A7', 22900, 'https://tw.buy.yahoo.com/gdsale/Acer-A515-56G-58A7-15吋筆電-i5-1135G7-MX350-8G-512G-S-9864499.html', 'https://s.yimg.com/zp/MerchandiseImages/DEBF8B691E-SP-10911864.jpg', 'Acer宏碁', 'i5-1135G7', 'MX350', '8G(on board)', '1 最高24G', '512GB', '無', '1.7', '15.6吋', '1920 x 1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.1', '48Wh Li-ion battery', 'Win 11 home'),
('X415EP-0101S1135G7', 22900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X415EP-14吋筆電-i5-1135G7-MX330-8G-512G-Win-11-H-9863423.html', 'https://s.yimg.com/zp/MerchandiseImages/63906aae75-Gd-9863423.jpg', 'ASUS華碩', 'Intel® Core i5-1135G7 Processor 2.4 GHz', 'MX 330', '8G', '已佔用1 最高16G', '512GB', '無', '1.59', '14.0吋', '1920x1080', 'Wi-Fi 5(802.11ac) 藍牙4.1', '32WHrs, 2S1P, 2-cell Li-ion', 'Win 11 home'),
('A315-58G-585X', 22688, 'https://tw.buy.yahoo.com/activity/onsale/combo?actid=361458', 'https://s.yimg.com/zp/MipImages/FAB3C60D8A-MIP-361458.jpeg', 'Acer宏碁', 'Intel® Core i5-1135G7', 'MX350', '8G(on board)', '1 最高16G', '256GB', '1TB', '1.7', '15.6吋', '1920 x 1080', '802.11a/b/g/n/ac 藍牙5.0', '36Wh Li-ion battery', 'Win 11 home'),
('V15-3525-R1508BTW', 21999, 'https://tw.buy.yahoo.com/gdsale/DELL-Vostro-3000-15吋筆電-R5-5625U-8G-256G-Win11P-碳黑-9932461.html', 'https://s.yimg.com/zp/MerchandiseImages/5809010C8D-SP-11131661.jpg', 'Dell戴爾', 'AMD Ryzen5 5625U, 19 MB cache, 6 core, 12 threads', 'Integrated: AMD Radeon Graphics', '8G', '2 最高16G', '256GB', '無', '1.69', '15.6吋', '1920 x 1080', '802.11ac 藍牙4.0', '3-cell, 41 Wh, lithium-polymer (integrated)', 'Windows 11 Pro'),
('15-3525-R1508STW', 21990, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-3000-15-6吋筆電-R5-5625U-8G-256G-Win11--9985135.html', 'https://s.yimg.com/zp/MerchandiseImages/756B32DB3A-SP-11287704.jpg', 'Dell戴爾', 'AMD Ryzen5 5625U, 19 MB cache, 6 core, 12 threads', 'AMD Radeon Graphics', '8G', '2 最高16G', '256GB', '無', '1.68', '15.6吋', '1920 x 1080', '802.11ac 藍牙4.0', '3-cell, 41 Wh, lithium-polymer (integrated)', 'Win 11 home'),
('A514-54G-513S', 21499, 'https://tw.buy.yahoo.com/activity/onsale/combo?actid=365262', 'https://s.yimg.com/zp/MipImages/E127DAEB76-MIP-365262.jpeg', 'Acer宏碁', 'Intel® Core i5-1135G7', 'MX350', '8G(on board)', '1 最高24G', '512GB', '無', '1.45', '14.0吋', '1920 x 1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.1', '48Wh Li-ion battery', 'Win10 home'),
('A514-54G-58HW', 21900, 'https://tw.buy.yahoo.com/gdsale/Acer-A514-54G-58HW-14吋筆電-i5-1135G7-MX350-8G-512G-S-9900998.html', 'https://s.yimg.com/zp/MerchandiseImages/28640BBA1B-SP-11002926.jpg', 'Acer宏碁', 'Intel® Core i5-1135G7', 'MX350', '8G(on board)', '1 最高24G', '512GB', '無', '1.45', '14.0吋', '1920 x 1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.1', '48Wh Li-ion battery', 'Win 11 home'),
('A514-54G-580X', 21900, 'https://tw.buy.yahoo.com/gdsale/Acer-A514-54G-580X-14吋筆電-i5-1135G7-MX350-8G-512G-藍-9277023.html', 'https://s.yimg.com/zp/MerchandiseImages/C1C8996F22-Gd-9277023.jpg', 'Acer宏碁', 'Intel® Core i5-1135G7', 'MX350', '8G(on board)', '1 最高24G', '512GB', '無', '1.45', '14.0吋', '1920 x 1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.1', '48Wh Li-ion battery', 'Win10 home'),
('A514-54G-50R0', 21900, 'https://tw.buy.yahoo.com/gdsale/Acer-A514-54G-50R0-14吋筆電-i5-1135G7-MX350-8G-512G-S-9988597.html', 'https://s.yimg.com/zp/MerchandiseImages/46E9FA8D37-SP-11291247.jpg', 'Acer宏碁', 'Intel® Core i5-1135G7', 'MX350', '8G(on board)', '1 最高24G', '512GB', '無', '1.45', '14.0吋', '1920 x 1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.1', '48Wh Li-ion battery', 'Win 11 home'),
('A514-54G-58HW, A514-54G-50TE, A514-54G-50R0', 21900, 'https://tw.buy.yahoo.com/gdsale/Acer-Aspire-5-A514-54G-14吋筆電-i5-1135G7-MX350-8G-51-10007567.html', 'https://s.yimg.com/zp/MerchandiseImages/F9705C8724-Gd-10007567.jpg', 'Acer宏碁', 'Intel® Core i5-1135G7', 'MX350', '8G(on board)', '1 最高24G', '512GB', '無', '1.45', '14.0吋', '1920 x 1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.1', '48Wh Li-ion battery', 'Win 11 home'),
('A514-54G-51WH', 21559, 'https://tw.buy.yahoo.com/activity/onsale/combo?actid=365252', 'https://s.yimg.com/zp/MipImages/07945B8014-MIP-365252.jpeg', 'Acer宏碁', 'Intel® Core i5-1135G7', 'MX350', '8G(on board)', '1 最高24G', '512GB', '無', '1.45', '14.0吋', '1920x1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.1', '48Wh Li-ion battery', 'Win10 home'),
('A514-54G-50Q7', 21900, 'https://tw.buy.yahoo.com/gdsale/Acer-A514-54G-513S-14吋筆電-i5-1135G7-MX350-8G-512G-S-9716088.html', 'https://s.yimg.com/zp/MerchandiseImages/F9705C8724-Gd-9716088.jpg', 'Acer宏碁', 'Intel® Core i5-1135G7', 'MX350', '8G(on board)', '1 最高24G', '512GB', '無', '1.45', '14.0吋', '1920 x 1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.1', '48Wh Li-ion battery', 'Win10 home'),
('IdeaPad 3 15ITL6 82H802GPTW', 20990, 'https://tw.buy.yahoo.com/gdsale/Lenovo-IdeaPad-3-15-6吋效能筆電-i5-1135G7-8G-512G-PCIe-9991119.html', 'https://s.yimg.com/zp/MerchandiseImages/464F649B81-SP-11301942.jpg', 'Lenovo聯想', 'i5-1135G7 (4C / 8T, 2.4 / 4.2GHz, 8MB)', 'Intel Iris Xe Graphics', '8G', '1 最高40G', '512GB', '無', '1.65', '15.6吋', '1920x1080', '11ac, 2x2 藍牙5.0', 'Integrated 38Wh', 'Win 11 home'),
('IdeaPad 3 15ITL6 82H802GQTW', 20990, 'https://tw.buy.yahoo.com/gdsale/Lenovo-IdeaPad-3-15-6吋效能筆電-i5-1135G7-8G-512G-PCIe-9991120.html', 'https://s.yimg.com/zp/MerchandiseImages/13EF098E19-SP-11300987.jpg', 'Lenovo聯想', 'i5-1135G7 (4C / 8T, 2.4 / 4.2GHz, 8MB)', 'Intel Iris Xe Graphics', '8G', '1 最高40G', '512GB', '無', '1.65', '15.6吋', '1920x1080', '11ac, 2x2 藍牙5.0', 'Integrated 38Wh', 'Win 11 home'),
('Modern 14 B11M-697TW', 20900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Modern-14-B11M-697TW-14吋創作者筆電-i5-1155G7-8G-5-9883657.html', 'https://s.yimg.com/zp/MerchandiseImages/16AB1F0B63-SP-10985917.jpg', 'MSI微星', 'i5-1155G7', 'Intel Iris Xe Graphics', '8G', '1 最高32G', '512GB', '無', '1.3', '14.0吋', '1920x1080', '802.11 ax Wi-Fi 6 藍牙5.2', '3-Cell 65W adapter', 'Win 11 home'),
('X415EA-0351S1135G7', 20900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X415EA-14吋筆電-i5-1135G7-8G-512G-Laptop-Win11-冰-9777706.html', 'https://s.yimg.com/zp/MerchandiseImages/F71D394E38-SP-10635818.jpg', 'ASUS華碩', 'Intel® Core i5-1135G7 Processor 2.4 GHz', 'Intel Iris Xᵉ Graphics', '8G', '已佔用1 最高16G', '512GB', '無', '1.59', '14.0吋', '1920 x 1080', 'Wi-Fi 5(802.11ac) 藍牙4.1', '32WHrs, 2S1P, 2-cell Li-ion', 'Win 11 home'),
('AV15-51-53J9', 20888, 'https://tw.buy.yahoo.com/gdsale/福利品-Acer-AV15-51-53J9-15吋筆電-Ci5-1155G7-8G-512G-SS-9898758.html', 'https://s.yimg.com/zp/MerchandiseImages/A8423CBE13-SP-10451876.jpg', 'Acer宏碁', 'Intel® Core i5-1155G7', 'Intel Iris Xe Graphics', '8G(on board)', '1 最高24G', '512GB', '無', '1.8', '15.6吋', '1920x1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.1', '48 Wh 3-cell Li-ion battery', 'Win 11 home'),
('X415EA-0151S1135G7', 20900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X415EA-14吋筆電-i5-1135G7-8G-512G-Laptop-冰柱銀-9590727.html', 'https://s.yimg.com/zp/MerchandiseImages/9FE2D5457D-Gd-9590727.jpg', 'ASUS華碩', 'Intel® Core i5-1135G7 Processor 2.4 GHz', 'Intel Iris Xᵉ Graphics', '8G', '已佔用1 最高16G', '512GB', '無', '1.59', '14.0吋', '1920 x 1080', 'Wi-Fi 5(802.11ac) 藍牙4.1', '32WHrs, 2S1P, 2-cell Li-ion', 'Win10 home'),
('A515-55G-5797', 20900, 'https://tw.buy.yahoo.com/gdsale/送8G記憶體-Acer-A515-55G-5797-15吋筆電-i5-1035G1-MX350-4G-9181005.html', 'https://s.yimg.com/zp/MerchandiseImages/E35B3EEE0C-Gd-9181005.jpg', 'Acer宏碁', 'Intel® Core i5-1035G1', 'MX350', '4G(on board)', '1 最高20G', '512GB', '無', '1.8', '15.6吋', '1920x1080', '802.11a/b/g/n/ac/ax 2x2 MU-MIMO 藍牙5.0', '48 Wh 3-cell Li-ion battery', 'Win10 home'),
('X415EA-0341G1135G7', 20900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X415EA-14吋筆電-i5-1135G7-8G-512G-Laptop-Win11-星-9777704.html', 'https://s.yimg.com/zp/MerchandiseImages/87C521D73D-SP-10635728.jpg', 'ASUS華碩', 'Intel® Core i5-1135G7 Processor 2.4 GHz', 'Intel Iris Xᵉ Graphics', '8G', '已佔用1 最高16G', '512GB', '無', '1.59', '14.0吋', '1920 x 1080', 'Wi-Fi 5(802.11ac) 藍牙4.1', '32WHrs, 2S1P, 2-cell Li-ion', 'Win 11 home'),
('X415EA-0131G1135G7', 20900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X415EA-14吋筆電-i5-1135G7-8G-512G-Laptop-星空灰-9590726.html', 'https://s.yimg.com/zp/MerchandiseImages/EA957FA034-Gd-9590726.jpg', 'ASUS華碩', 'Intel® Core i5-1135G7 Processor 2.4 GHz', 'Intel Iris Xᵉ Graphics', '8G', '已佔用1 最高16G', '512GB', '無', '1.59', '14.0吋', '1920 x 1080', 'Wi-Fi 5(802.11ac) 藍牙4.1', '32WHrs, 2S1P, 2-cell Li-ion', 'Win10 home'),
('X515EA-0271G1135G7', 20900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X515EA-15吋筆電-i5-1135G7-8G-512G-Laptop-Win-11-9876159.html', 'https://s.yimg.com/zp/MerchandiseImages/3A060C7489-Gd-9876159.jpg', 'ASUS華碩', 'Intel® Core i5-1135G7 Processor 2.4 GHz', 'Intel Iris Xe Graphics', '8G', '已佔用1 最高16G', '512GB', '無', '1.79', '15.6吋', '1920x1080', 'Wi-Fi 5(802.11ac) 藍牙4.1', '37Whs 2cell, 鋰電池', 'Win 11 home'),
('A315-58-59QH', 20900, 'https://tw.buy.yahoo.com/gdsale/Acer-A315-58-59QH-15-6吋筆電-i5-1135G7-8G-512G-SSD-wi-9966085.html', 'https://s.yimg.com/zp/MerchandiseImages/256CC0657F-SP-11235289.jpg', 'Acer宏碁', 'i5-1135G7', '無', '8G(on board)', '1 最高16G', '512GB', '無', '1.7', '15.6吋', '1920 x 1080', '802.11a/b/g/n/ac 1x1 MU-MIMO 藍牙5.0', '36Wh Li-ion battery', 'Win 11 home'),
('X413EA-0201W1135G7', 20900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X413EA-14吋筆電-i5-1135G7-8G-512G-VivoBook-14-幻彩-9787789.html', 'https://s.yimg.com/zp/MerchandiseImages/3D3F3C02F3-Gd-9787789.jpg', 'ASUS華碩', 'Core i5-1135G7 Processor 2.4 GHz', '-', '8G(on board)', '無(on board) 最高8G', '512GB', '無', '1.4', '14.0吋', '1920x1080', 'Wi-Fi 6(802.11ax) 藍牙5.0', '42WHrs, 3S1P, 3-cell Li-ion', 'Win10 home'),
('X413EA-0211K1135G7', 20900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X413EA-14吋筆電-i5-1135G7-8G-512G-VivoBook-14-酷玩-9787788.html', 'https://s.yimg.com/zp/MerchandiseImages/635BAFA3CB-Gd-9787788.jpg', 'ASUS華碩', 'Core i5-1135G7 Processor 2.4 GHz', '-', '8G(on board)', '無(on board) 最高8G', '512GB', '無', '1.4', '14.0吋', '1920x1080', 'Wi-Fi 6(802.11ax) 藍牙5.0', '42WHrs, 3S1P, 3-cell Li-ion', 'Win10 home'),
('X515EA-0171S1135G7', 20900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X515EA-15吋筆電-i5-1135G7-8G-512G-Laptop-Win-11-9876158.html', 'https://s.yimg.com/zp/MerchandiseImages/456A6633E1-Gd-9876158.jpg', 'ASUS華碩', 'Intel® Core i5-1135G7 Processor 2.4 GHz', 'Intel Iris Xe Graphics', '8G(on board)', '1 最高16G', '512GB', '無', '1.8', '15.6吋', '1920x1080', 'Wi-Fi 5(802.11ac) 藍牙4.1', '37Whs 2cell,  鋰電池', 'Win 11 home'),
('T3300KA-0112KN6000', 18990, 'https://tw.buy.yahoo.com/gdsale/ASUS-T3300KA-13-3吋二合一平板電腦-N6000-4G-128G-eMMC-Vivob-9816181.html', 'https://s.yimg.com/zp/MerchandiseImages/6F198B6C03-Gd-9816181.jpg', 'ASUS華碩', 'Silver N6000 Processor 1.1 GHz', '無', '4G', '無(on board) 最高4G', '128GB', '無', '0.78', '13.3吋', '1920x1080', 'Wi-Fi 6(802.11ax) 藍牙5.2', '50Whs 3cell', 'Win 11 home S模式'),
('Ideapad 3 14ITL6 82H701BATW', 20413, 'https://tw.buy.yahoo.com/gdsale/Lenovo-IdeaPad-3-14吋輕薄筆電-i5-1135G7-8G-512G-PCIe-SS-9959020.html', 'https://s.yimg.com/zp/MerchandiseImages/F4B6059617-SP-11210705.jpg', 'Lenovo聯想', 'i5-1135G7 (4C / 8T, 2.4 / 4.2GHz, 8MB)', 'Intel Iris Xe Graphics', '8G', '1 最高40G', '512GB', '無', '1.41', '14.0吋', '1920x1080', '11ac, 2x2 藍牙5.0', 'Integrated 38Wh', 'Win 11 home'),
('Ideapad 3 14ITL6 82H701B9TW', 20413, 'https://tw.buy.yahoo.com/gdsale/Lenovo-IdeaPad-3-14吋輕薄筆電-i5-1135G7-8G-512G-PCIe-SS-9959025.html', 'https://s.yimg.com/zp/MerchandiseImages/9DFBFE2A7A-SP-11210607.jpg', 'Lenovo聯想', 'i5-1135G7 (4C / 8T, 2.4 / 4.2GHz, 8MB)', 'Intel Iris Xe Graphics', '8G', '1 最高40G', '512GB', '無', '1.41', '14.0吋', '1920x1080', '11ac, 2x2 藍牙5.0', 'Integrated 38Wh', 'Win 11 home'),
('A514-54-57ZX', 19900, 'https://tw.buy.yahoo.com/gdsale/Acer-A514-54-57ZX-14吋筆電-i51135G7-8G-512G-SSD-UMA-W-9846672.html', 'https://s.yimg.com/zp/MerchandiseImages/b5bd61058a-Gd-9846672.jpg', 'Acer宏碁', 'Intel® Core i5-1135G7', 'Intel Iris Xe Graphics', '8G(on board)', '1 最高24G', '512GB', '無', '1.45', '14.0吋', '1920x1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.1', '48Wh Li-ion battery', 'Win 11 home'),
('Modern 14 B5M-067TW', 19900, 'https://tw.buy.yahoo.com/gdsale/MSI微星-Modern-14-B5M-067TW-14吋創作者筆電-R5-5500-8G-256G-9775409.html', 'https://s.yimg.com/zp/MerchandiseImages/708E1DE808-Gd-9775409.jpg', 'MSI微星', 'Ryzen 5 5500U', 'AMD Radeon Graphics', '8G', '1 最高64G', '256GB', '無', '1.3', '14.0吋', '1920x1080', '802.11 ax Wi-Fi 6 藍牙5.2', '3-Cell 65W adapter', 'Win 11 home'),
('15-3515-D1508STW', 19900, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-3000-15-6吋筆電-R5-3500U-8G-256G-Win10-9716910.html', 'https://s.yimg.com/zp/MerchandiseImages/4CBBAA6A42-Gd-9716910.jpg', 'Dell戴爾', 'AMD® Ryzen5 3500U, 4 MB Cache, 4 Core', 'AMD Radeon Graphics', '8G', '2 最高16G', '256GB', '無', '1.69', '15.6吋', '1920 x 1080', '802.11ac 藍牙4.0', '3-cell, 41 Wh, lithium-polymer (integrated)', 'Win10 home'),
('A514-54-58KP', 19900, 'https://tw.buy.yahoo.com/gdsale/福利品-Acer-A514-54-58KP-14吋筆電-i5-1135G7-8G-512G-SSD--9898327.html', 'https://s.yimg.com/zp/MerchandiseImages/8A9BD06FEC-SP-9996545.jpg', 'Acer宏碁', 'Intel® Core i5-1135G7', 'Intel Iris Xe Graphics', '8G(on board)', '1 最高24G', '512GB', '無', '1.45', '14.0吋', '1920x1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.1', '48Wh Li-ion battery', 'Win10 home'),
('A514-54-57ZX, A514-54-54LF', 19900, 'https://tw.buy.yahoo.com/gdsale/Acer-A514-54-14吋效能筆電-i51135G7-8G-512G-SSD-UMA-W11--9922363.html', 'https://s.yimg.com/zp/MerchandiseImages/AD0A26D3A4-Gd-9922363.jpg', 'Acer宏碁', 'Intel® Core i5-1135G7', 'Intel Iris Xe Graphics', '8G(on board)', '1 最高24G', '512GB', '無', '1.45', '14.0吋', '1920x1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.1', '48Wh Li-ion battery', 'Win 11 home'),
('dynabook CS40L-JW PYS48T-004002', 19888, 'https://tw.buy.yahoo.com/gdsale/dynabook-CS40L-JW-雪漾白-i5-1135G7-8GB-512GB-Wi-Fi-6-9818393.html', 'https://s.yimg.com/zp/MerchandiseImages/6359B5057F-SP-10775881.jpg', 'Dynabook', 'i5-1135G7', 'Intel Iris Xe Graphics', '8G', '2, 已佔用1 最高32G', '512GB', '無', '1.5', '14.0吋', '1920*1080', 'Intel Wifi 6 : Intel 11ax+acagn+BT-M.2 1216(2x2) 藍牙5.0', '2cell 45.6Wh', 'Win 11 home'),
('dynabook CS50L-JW PYS45T-004002', 19888, 'https://tw.buy.yahoo.com/gdsale/dynabook-CS50L-JW-雪漾白-i5-1135G7-8GB-512GB-Wi-Fi-6-9818396.html', 'https://s.yimg.com/zp/MerchandiseImages/CE732A73BC-SP-10775781.jpg', 'Dynabook', 'i5-1135G7', 'Intel Iris Xe Graphics', '8G', '2, 已佔用1 最高32G', '512GB', '無', '1.79', '15.6吋', '1920*1080', 'Intel Wifi 6 : Intel 11ax+acagn+BT-M.2 1216(2x2) 藍牙5.0', '2cell 45.6Wh', 'Win10 home'),
('dynabook CS50L-JB PYS45T-006002', 19888, 'https://tw.buy.yahoo.com/gdsale/dynabook-CS50L-JB-黑曜藍-i5-1135G7-8GB-512GB-Wi-Fi-6-9818391.html', 'https://s.yimg.com/zp/MerchandiseImages/6A334C0819-SP-10775782.jpg', 'Dynabook', 'i5-1135G7', 'Intel Iris Xe Graphics', '8G', '2, 已佔用1 最高32G', '512GB', '無', '1.79', '15.6吋', '1920*1080', 'Intel Wifi 6 : Intel 11ax+acagn+BT-M.2 1216(2x2) 藍牙5.0', '2cell 45.6Wh', 'Win10 home'),
('A514-54-551Y', 19800, 'https://tw.buy.yahoo.com/gdsale/福利品-Acer-A514-54-551Y14吋筆電-i5-1135G7-8G-512G-Aspi-9795339.html', 'https://s.yimg.com/zp/MerchandiseImages/6692bd0953-Gd-9795339.jpg', 'Acer宏碁', 'Intel® Core i5-1135G7', 'Intel Iris Xe Graphics', '8G(on board)', '1 最高24G', '512GB', '無', '1.45', '14.0吋', '1920x1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.1', '48Wh Li-ion battery', 'Win10 home'),
('Slim 5', 19500, 'https://tw.buy.yahoo.com/gdsale/Lenovo-聯想-14吋輕薄筆電-Slim-5-藍色-R5-5500U-8G-512G-SSD-9742089.html', 'https://s.yimg.com/zp/MerchandiseImages/643B59ACA2-SP-10535024.jpg', 'Lenovo聯想', '5500U', 'AMD Radeon Graphics', '8G', '無(on board) 最高8G', '512GB', '無', '1.39', '14.0吋', '1920x1080', 'Wi-Fi 5(802.11ac) 藍牙5.0', '44.5Wh', 'Win10 home'),
('Aspire 3-A315-57G-51LH', 18900, 'https://tw.buy.yahoo.com/gdsale/Acer-A315-57G-51LH-15吋筆電-i5-1035G1-MX330-4G-256G-S-9850607.html', 'https://s.yimg.com/zp/MerchandiseImages/1149E008B9-SP-8787223.jpg', 'Acer宏碁', 'i5-1035G1', 'MX330', '4G(on board)', '1 最高20G', '256GB', '1TB', '1.9', '15.6吋', '1920x1080', '802.11a/b/g/n/ac 1x1 MU-MIMO 藍牙5.0', '36 Wh 3220 mAh', 'Win10 home'),
('X712EA-0028S7505', 18900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X712EA-17吋筆電-Pentium-Gold-7505-8G-256G-Win-11-9938365.html', 'https://s.yimg.com/zp/MerchandiseImages/FD61AD3CA0-SP-11140478.jpg', 'ASUS華碩', 'Intel® Pentium® Gold 7505 Processor 2.0 GHz', 'Intel Iris Xe Graphics', '8G(on board)', '1 最高16G', '256GB', '無', '2.3', '17.3吋', '1920x1080', 'Wi-Fi 6(802.11ax) 藍牙5.0', '32Whs 2cell,  鋰電池', 'Win 11 home'),
('Aspire3-A315-57G-54CL', 18900, 'https://tw.buy.yahoo.com/gdsale/送8G記憶體-Acer-A315-57G-54CL-15吋筆電-i5-1035G1-MX330-4G-9279436.html', 'https://s.yimg.com/zp/MerchandiseImages/3D8EE35A01-SP-8787463.jpg', 'Acer宏碁', 'i5-1035G1', 'MX330', '4G(on board)', '1 最高20G', '256GB', '1TB', '1.9', '15.6吋', '1920x1080', '802.11a/b/g/n/ac 1x1 MU-MIMO 藍牙5.0', '36 Wh 3220 mAh', 'Win10 home'),
('4E4B7PA', 18900, 'https://tw.buy.yahoo.com/gdsale/HP-惠普-240-G8-14吋輕薄窄邊框商用筆電4E4B7PA-i3-1125G4-4G-128G-9731646.html', 'https://s.yimg.com/zp/MerchandiseImages/01941445C0-SP-10504966.jpg', 'HP惠普', 'Intel Core i3-1125G4', 'Intel® UHD Graphics', '4G', '2, 已佔用1 最高16G', '128GB', '無', '1.48', '14.0吋', '1366 x 768', 'Intel AX201 ax 2x2 WiFi6 藍牙5.0', '3 cell 41 WHr/3.63Ah', 'Win10 Pro'),
('Aspire 3-A315-57G-51LH, Aspire3-A315-57G-54CL', 18900, 'https://tw.buy.yahoo.com/gdsale/Acer-A315-57G-51LH-15吋筆電-i5-1035G1-MX330-4G-256G-S-9844015.html', 'https://s.yimg.com/zp/MerchandiseImages/7BD9940D4D-Gd-9844015.jpg', 'Acer宏碁', 'i5-1035G1', 'MX330', '4G(on board)', '1 最高20G', '256GB', '1TB', '1.9', '15.6吋', '1920x1080', '802.11a/b/g/n/ac 1x1 MU-MIMO 藍牙5.0', '36 Wh 3220 mAh', 'Win10 home'),
('Surface Go 3 6500Y/4G/64G', 12288, 'https://tw.buy.yahoo.com/gdsale/微軟-Microsoft-Surface-Go-3-10-5吋-6500Y-4G-64G-不含鍵盤-9748448.html', 'https://s.yimg.com/zp/MerchandiseImages/C828555D9D-SP-10558227.jpg', 'Microsoft微軟', '6500Y', 'Intel® UHD Graphics 615', '4G', '無(on board) 最高4G', '64GB', '無', '0.544', '10.5吋', '1920 x 1280 (220 PPI)', 'Wi-Fi 6： 相容於 IEEE 802.11 a/b/g/n/ac/ax 藍牙5.0', '一般裝置使用方式可達 11 小時', 'Win 11 home S模式'),
('A514-54-34EP', 17900, 'https://tw.buy.yahoo.com/gdsale/Acer-A514-54-34EP14吋筆電-i3-1115G4-8G-256G-SSD-Aspir-9509750.html', 'https://s.yimg.com/zp/MerchandiseImages/52FEDACA71-SP-9829406.jpg', 'Acer宏碁', 'Intel® Corei3-1115G4', '-', '8G(on board)', '1 最高24G', '256GB', '無', '1.45', '14.0吋', '1920 x 1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.1', '48Wh Li-ion battery', 'Win10 home'),
('X515EA-0281G1115G4', 17900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X515EA-15吋筆電-i3-1115G4-4G-128GB-Laptop-Win11-9832006.html', 'https://s.yimg.com/zp/MerchandiseImages/5BA9B09082-Gd-9832006.jpg', 'ASUS華碩', 'Intel® Core i3-1115G4  Processor 2.4 GHz', 'Intel® UHD Graphics', '4G(on board)', '1 最高12G', '128GB', '無', '1.8', '15.6吋', '1920x1080', 'Wi-Fi 5(802.11ac) 藍牙4.1', '37Whs 2cell, 鋰電池', 'Win 11 home S模式');
INSERT INTO `specifics_yahoo` (`nb_id`, `yahoo_price`, `yahoo_url`, `img_url`, `brand`, `cpu`, `gpu`, `ram`, `slot_max`, `SSD`, `HDD`, `weight`, `inch`, `resolution`, `internet_device`, `battery`, `windows_version`) VALUES
('X515EA-0201G1115G4', 17900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X515EA-15吋筆電-i3-1115G4-4G-128G-Laptop-Win10-S-9676136.html', 'https://s.yimg.com/zp/MerchandiseImages/E3DBFDFEC4-Gd-9676136.jpg', 'ASUS華碩', 'Intel® Core i3-1115G4  Processor 2.4 GHz', 'Intel® UHD Graphics', '4G(on board)', '1 最高12G', '128GB', '無', '1.8', '15.6吋', '1920x1080', 'Wi-Fi 5(802.11ac) 藍牙4.1', '37Whs 2cell, 鋰電池', 'Windows 10 Home S (S模式)'),
('dynabook CS40L-H (00F002)', 16999, 'https://tw.buy.yahoo.com/gdsale/dynabook-CS40L-H-曜石黑-i5-1035G1-8GB-512GB-Wi-Fi-6-9533205.html', 'https://s.yimg.com/zp/MerchandiseImages/B54711C645-Gd-9533205.jpg', 'Dynabook', 'i5-1035G1', 'Integrated Intel® UHD', '8G', '1, 已佔用1 最高16G', '512GB', '無', '1.49', '14.0吋', '1920*1080', 'Wi-Fi 6  Intel 11ax+acagn+BT-M.2 1216(2x2)-HsP2 藍牙4.2', '45 Whs 2cell', 'Win10 home'),
('A317-33-C6ZM', 16388, 'https://tw.buy.yahoo.com/gdsale/福利品-Acer-A317-33-C6ZM筆電-N5100-8G-256G-1TB-Win-11-9898763.html', 'https://s.yimg.com/zp/MerchandiseImages/5A40193E95-SP-10930235.jpg', 'Acer宏碁', 'Quad Core N5100', 'UMA', '8G', '2 最高16G', '256GB', '1TB', '2.6', '17.3吋', '1920 x 1080', '802.11a/b/g/n/ac 1x1 MU-MIMO 藍牙5.0', '36Wh Li-ion battery', 'Win 11 home'),
('HP 240 G8 (32C53PA)', 16900, 'https://tw.buy.yahoo.com/gdsale/HP-惠普-240-G8-14吋商用筆電-14HD-CelN4020-4G-1-256GB-SSD--9409145.html', 'https://s.yimg.com/zp/MerchandiseImages/77FB8B0982-SP-9563246.jpg', 'HP惠普', 'Celeron N4020', 'Intel® UHD Graphics 600', '4G', '1 最高16G', '256GB', '無', '1.48', '14.0吋', '366 x 768', 'Realtek 802.11ac (2x2) 藍牙5.0', '3 cell 41 WHr/3.63Ah', 'Win10 home'),
('Surface Go 2 STQ-00010', 16688, 'https://tw.buy.yahoo.com/gdsale/微軟-Surface-Go-2-4425Y-8G-128G-不含鍵盤-筆-9022416.html', 'https://s.yimg.com/zp/MerchandiseImages/71137BD845-Product-25657354.jpg', 'Microsoft微軟', '4425Y', 'Intel® UHD Graphics 615', '8G(on board)', '無(on board) 最高8G', '128GB', '無', '0.544', '其他尺寸', '1920 x 1280 (220 PPI) 解析度', 'WiFi： IEEE 802.11a/b/g/n/ac/ax 藍牙5.0', '依照官方原廠標示', 'Windows 10 Home S (S模式)'),
('X415EA-0451G1115G4', 16490, 'https://tw.buy.yahoo.com/gdsale/ASUS-X415EA-14吋筆電-i3-1115G4-4G-128GB-Laptop-Win11-9832007.html', 'https://s.yimg.com/zp/MerchandiseImages/87C521D73D-SP-10813085.jpg', 'ASUS華碩', 'Intel® Core i3-1115G4  Processor 2.4 GHz', 'Intel® UHD Graphics', '4G(on board)', '1 最高12G', '128GB', '無', '1.8', '14.0吋', '1920x1080', 'Wi-Fi 5(802.11ac) 藍牙4.1', '32WHrs, 2S1P, 2-cell Li-ion', 'Win 11 home S模式'),
('Surface Laptop Go i5/8G/128G', 15999, 'https://tw.buy.yahoo.com/activity/onsale/combo?actid=354877', 'https://s.yimg.com/zp/MipImages/CA11870C80-MIP-354877.jpeg', 'Microsoft微軟', 'i5-1035G1', 'Intel® UHD Graphics', '8G', '無(on board) 最高8G', '128GB', '無', '1.11', '12.3吋', '1536 x 1024 (148 PPI)', 'Wi-Fi 6： 相容於 802.11ax 藍牙5.0', '一般裝置使用方式可達 13 小時', 'Windows 10 Home S (S模式)'),
('15-3515-D1608STW', 15999, 'https://tw.buy.yahoo.com/gdsale/DELL-Inspiron-3000-15-6吋筆電-R5-3500U-8G-512G-Win-10-9685398.html', 'https://s.yimg.com/zp/MerchandiseImages/E5F192B0F9-SP-10369233.jpg', 'Dell戴爾', 'AMD® Ryzen5 3500U, 4 MB Cache, 4 Core', 'AMD Radeon Graphics', '8G', '2 最高16G', '512GB', '無', '1.69', '15.6吋', '1920 x 1080', '802.11ac 藍牙4.0', '3-cell, 41 Wh, lithium-polymer (integrated)', 'Win10 home'),
('15s-fq3019TU', 13499, 'https://tw.buy.yahoo.com/activity/onsale/combo?actid=365242', 'https://s.yimg.com/zp/MipImages/AE0E579A0E-MIP-365242.jpeg', 'HP惠普', 'N6000', 'Intel® UHD Graphics', '4G', '2 最高8G', '256GB', '無', '1.65', '15.6吋', 'HD (1366x768)', 'Realtek Wi-Fi 6 (ax 1x2) 藍牙5.2', '3cell 41WHr', 'Win 11 home'),
('BR1100FKA-0041AN5100', 14988, 'https://tw.buy.yahoo.com/gdsale/ASUS-BR1100FKA-11吋教育商用筆電-N5100-8G-128G-EMMC-Expert-9794011.html', 'https://s.yimg.com/zp/MerchandiseImages/1F0390588F-SP-10695248.jpg', 'ASUS華碩', 'Intel® Celeron® N5100 Processor 1.1 GHz', 'Intel® UHD Graphics', '8G(on board)', '無(on board) 最高8G', '128GB', '無', '1.4', '11.6吋', '1366 x 768', 'Wi-Fi 6(802.11ax) 藍牙5.0', '42WHrs, 3S1P, 3-cell Li-ion', 'Win10 home'),
('dynabook CS40L-H PYS38T-00J002', 14900, 'https://tw.buy.yahoo.com/gdsale/dynabook-CS40L-H-曜石黑-i3-1005G1-8GB-128GB-Wi-Fi-6-9848614.html', 'https://s.yimg.com/zp/MerchandiseImages/C639F8B7A5-SP-10873351.jpg', 'Dynabook', 'Intel Core i3-1005G1', 'Integrated Intel® UHD', '8G', '1, 已佔用1 最高16G', '128GB', '無', '1.49', '14.0吋', '1366x768', 'Wi-Fi 6  Intel 11ax+acagn+BT-M.2 1216(2x2)-HsP2 藍牙4.2', '45 Whs 2cell', 'Win10 home'),
('E410KA-0171PN5100', 14900, 'https://tw.buy.yahoo.com/gdsale/ASUS-E410KA-14吋筆電-N5100-8G-256G-Win11-Home-Laptop-9951988.html', 'https://s.yimg.com/zp/MerchandiseImages/BEDE23BA66-Gd-9951988.jpg', 'ASUS華碩', 'Intel® Celeron® N5100 Processor 1.1 GHz', '-', '8G(on board)', '無(on board) 最高8G', '256GB', '無', '1.3', '14.0吋', '1920 x 1080', 'Wi-Fi 5(802.11ac) 藍牙4.2', '42WHrs, 3S1P, 3-cell Li-ion', 'Win 11 home'),
('E410KA-0161WN5100', 14900, 'https://tw.buy.yahoo.com/gdsale/ASUS-E410KA-14吋筆電-N5100-8G-256G-Win11-Home-Laptop-9951989.html', 'https://s.yimg.com/zp/MerchandiseImages/CA80E72564-Gd-9951989.jpg', 'ASUS華碩', 'Intel® Celeron® N5100 Processor 1.1 GHz', '-', '8G(on board)', '無(on board) 最高8G', '256GB', '無', '1.3', '14.0吋', '1920 x 1080', 'Wi-Fi 5(802.11ac) 藍牙4.2', '42WHrs, 3S1P, 3-cell Li-ion', 'Win 11 home'),
('X515KA-0201GN5100', 14788, 'https://tw.buy.yahoo.com/activity/onsale/combo?actid=365243', 'https://s.yimg.com/zp/MipImages/6B5320506F-MIP-365243.jpeg', 'ASUS華碩', 'Intel® Celeron® N5100 Processor 1.1 GHz', 'Intel Iris Xᵉ Graphics', '4G', '2, 已佔用1 最高8G', '256GB', '無', '1.79', '15.6吋', '1920 x 1080', 'Wi-Fi 5(802.11ac) 藍牙4.1', '37Whs 2cell, 鋰電池', 'Win 11 home'),
('Surface Go 2', 14488, 'https://tw.buy.yahoo.com/gdsale/Surface-Go-2-4425Y-4G-64G-商務版-9318286.html', 'https://s.yimg.com/zp/MerchandiseImages/776CCE2DFA-Product-26884359.jpg', 'Microsoft微軟', '4425Y', 'Intel® UHD Graphics 615', '4G', '無(on board) 最高4G', '64GB', '無', '0.544', '10.5吋', '1920 x 1280 (220 PPI)', 'Wi-Fi：相容於 IEEE 802.11 a/b/g/n/ac/ax 藍牙5.0', '-', 'Win10 Pro'),
('A315-34-C5PN', 12788, 'https://tw.buy.yahoo.com/activity/onsale/combo?actid=365215', 'https://s.yimg.com/zp/MipImages/3BBCC55D96-MIP-365215.jpeg', 'Acer宏碁', 'N4120', 'UHD Graphics 600', '4G(on board)', '1 最高8G', '256GB', '無', '1.9', '15.6吋', '1920 x 1080', '802.11a/b/g/n/ac 藍牙4.1', '36Wh Li-ion battery', 'Win 11 home'),
('Aspire 3-A315-34-C76J', 10999, 'https://tw.buy.yahoo.com/gdsale/福利品-Acer-A315-34-C76J-15吋筆電-N4120-4G-256G-SSD-9278276.html', 'https://s.yimg.com/zp/MerchandiseImages/1C5B8FB259-SP-8571895.jpg', 'Acer宏碁', 'Intel® Celeron® N4120', 'Intel® UHD Graphics 600', '4G(on board)', '無(on board) 最高8G', '256GB', '無', '1.9', '15.6吋', '1366x768', '802.11a/b/g/n/ac 藍牙4.1', '37 Wh 4810 mAh', 'Win10 home'),
('15s', 13900, 'https://tw.buy.yahoo.com/gdsale/HP-超品-15s-fq3018TU-N6000-4GB-256GB-PCIe-SSD-W11-HD-9763307.html', 'https://s.yimg.com/zp/MerchandiseImages/EEE2F44290-Gd-9763307.jpg', 'HP惠普', 'N6000', 'Intel® UHD Graphics', '4G', '1 最高8G', '256GB', '無', '1.65', '15.6吋', 'HD (1366x768)', 'Realtek Wi-Fi 6 (ax 1x2) 藍牙5.2', '3cell 41WHr', 'Win 11 home'),
('TP1400KA-0071BN4500', 13900, 'https://tw.buy.yahoo.com/gdsale/ASUS-TP1400KA-14吋觸控2IN1筆電-N4500-4G-128G-eMMC-Vivob-9875119.html', 'https://s.yimg.com/zp/MerchandiseImages/107FA20AE3-SP-10957687.jpg', 'ASUS華碩', 'Intel® Celeron® N4500 Processor 1.1 GHz', '無', '4G(on board)', '無(on board) 最高4G', '128GB', '無', '1.49', '14.0吋', '1920 x 1080', '802.11ac 藍牙4.1', '39Whs 2cell', 'Win 11 home S模式'),
('Surface Go 2 STV-00010', 11288, 'https://tw.buy.yahoo.com/gdsale/微軟-Surface-Go-2-4425Y-4G-64G-不含鍵盤-筆-9023188.html', 'https://s.yimg.com/zp/MerchandiseImages/71137BD845-Product-25659168.jpg', 'Microsoft微軟', '4425Y', 'Intel® UHD Graphics 615', '4G(on board)', '無(on board) 最高4G', '64GB', '無', '0.544', '其他尺寸', '1920 x 1280 (220 PPI) 解析度', 'WiFi： IEEE 802.11a/b/g/n/ac/ax 藍牙5.0', '依照官方原廠標示', 'Windows 10 Home S (S模式)'),
('RRX-00010', 13488, 'https://tw.buy.yahoo.com/gdsale/Microsoft-微軟-Surface-Go2-RRX-00010-M-4G-64G-W10P-9935881.html', 'https://s.yimg.com/zp/MerchandiseImages/94403117D9-SP-11142381.jpg', 'Microsoft微軟', '8100Y', 'Intel Iris Xe Graphics', '4G(on board)', '無(on board) 最高4G', '64GB', '無', '0.544', '10.5吋', '(1920 x 1280 )(220 PPI)', '相容於 IEEE 802.11 a/b/g/n/ac/ax +藍牙無線 5.0 藍牙5.0', '依照官方原廠標示', 'Win10 Pro'),
('X515MA-0521SN4020', 12900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X515MA-15吋筆電-N4020-4G-256G-Win-11-Laptop-冰河銀-9887184.html', 'https://s.yimg.com/zp/MerchandiseImages/9BCDC35444-SP-10987996.jpg', 'ASUS華碩', 'Celeron® N4020 Processor 1.1 GHz', '-', '4G', '1 最高12G', '256GB', '無', '1.8', '15.6吋', '1920 x 1080', 'Wi-Fi 5(802.11ac) 藍牙4.1', '37WHrs, 2S1P, 2-cell Li-ion', 'Win 11 home'),
('SF114-34-C9V9', 12900, 'https://tw.buy.yahoo.com/gdsale/Acer-SF114-34-C9V9-14吋輕薄筆電-N5100-4G-256G-SSD-Swift-9702507.html', 'https://s.yimg.com/zp/MerchandiseImages/7c9f93e746-Gd-9702507.jpg', 'Acer宏碁', 'N5100', 'Intel® UHD Graphics 600', '4G(on board)', '無(on board) 最高4G', '256GB', '無', '1.3', '14.0吋', '1920x1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.1', '48Wh Li-ion battery', 'Win10 home'),
('X515MA-0491GN4020', 12900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X515MA-15吋筆電-N4020-4G-256G-Win-11-Laptop-星空灰-9887185.html', 'https://s.yimg.com/zp/MerchandiseImages/0029B18A1E-SP-10988013.jpg', 'ASUS華碩', 'Celeron® N4020 Processor 1.1 GHz', '-', '4G', '1 最高12G', '256GB', '無', '1.8', '15.6吋', '1920 x 1080', 'Wi-Fi 5(802.11ac) 藍牙4.1', '37WHrs, 2S1P, 2-cell Li-ion', 'Win 11 home'),
('SF114-34-C3XJ, SF114-34-C7WH, SF114-34-C9V9, SF114', 12900, 'https://tw.buy.yahoo.com/gdsale/Acer-SF114-34-C3XJ-14吋輕薄筆電-N5100-4G-256G-Swift1-多色-9765938.html', 'https://s.yimg.com/zp/MerchandiseImages/4CA3995777-Gd-9765938.jpg', 'Acer宏碁', 'N5100', 'Intel® UHD Graphics 600', '4G(on board)', '無(on board) 最高4G', '256GB', '無', '1.3', '14.0吋', '1920x1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.1', '48Wh Li-ion battery', 'Win10 home'),
('X515MA-0371GN4020', 12900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X515MA-15吋筆電-N4020-4G-256G-SSD-Laptop-星空灰-9565052.html', 'https://s.yimg.com/zp/MerchandiseImages/C45D2D69AC-Gd-9565052.jpg', 'ASUS華碩', 'Celeron® N4020 Processor 1.1 GHz', '-', '4G', '1 最高12G', '256GB', '無', '1.8', '15.6吋', '1920 x 1080', 'Wi-Fi 5(802.11ac) 藍牙4.1', '37WHrs, 2S1P, 2-cell Li-ion', 'Win10 home'),
('SF114-34-C7WH', 12900, 'https://tw.buy.yahoo.com/gdsale/Acer-SF114-34-C7WH-14吋輕薄筆電-N5100-4G-256G-SSD-Swift-9516958.html', 'https://s.yimg.com/zp/MerchandiseImages/aff0a52ca1-Gd-9516958.jpg', 'Acer宏碁', 'N5100', 'Intel® UHD Graphics 600', '4G(on board)', '無(on board) 最高4G', '256GB', '無', '1.3', '14.0吋', '1920x1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.1', '48Wh Li-ion battery', 'Win10 home'),
('A314-35-C5A3', 12900, 'https://tw.buy.yahoo.com/gdsale/Acer-A314-35-C5A3-14吋筆電-N5100-4G-256G-SSD-UMA-Win1-9864380.html', 'https://s.yimg.com/zp/MerchandiseImages/C9F1BC108D-SP-10920499.jpg', 'Acer宏碁', 'Quad Core N5100', 'UMA', '4G', '2 最高16G', '256GB', '無', '1.45', '14.0吋', '1366 x 768', '802.11a/b/g/n/ac 1x1 MU-MIMO 藍牙5.0', '36Wh Li-ion battery', 'Win 11 home'),
('SF114-34-C0JD', 11900, 'https://tw.buy.yahoo.com/gdsale/福利品-Acer-SF114-34-C0JD-14吋輕薄筆電-N5100-4G-256G-SSD-S-9555484.html', 'https://s.yimg.com/zp/MerchandiseImages/792612D4FD-Gd-9555484.jpg', 'Acer宏碁', 'N5100', 'Intel® UHD Graphics 600', '4G(on board)', '無(on board) 最高4G', '256GB', '無', '1.3', '14.0吋', '1920x1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.1', '48Wh Li-ion battery', 'Win10 home'),
('SF114-34-C3XJ', 12900, 'https://tw.buy.yahoo.com/gdsale/Acer-SF114-34-C3XJ-14吋輕薄筆電-N5100-4G-256G-SSD-Swift-9702513.html', 'https://s.yimg.com/zp/MerchandiseImages/DCFF991866-Gd-9702513.jpg', 'Acer宏碁', 'N5100', 'Intel® UHD Graphics 600', '4G(on board)', '無(on board) 最高4G', '256GB', '無', '1.3', '14.0吋', '1920x1080', '802.11a/b/g/n/acR2+ax 2x2 MU-MIMO 藍牙5.1', '48Wh Li-ion battery', 'Win10 home'),
('CM3000DVA-0031AMT8183', 12880, 'https://tw.buy.yahoo.com/gdsale/ASUS-CM3000DVA-10-5吋2合1商用教育筆電-MediaTek-8183-4G-128-9794010.html', 'https://s.yimg.com/zp/MerchandiseImages/D1E1DDE3DC-SP-10696280.jpg', 'ASUS華碩', 'MediaTek Kompanio 500(8183) 2.0 GHz', 'Arm Mali-G72 MP3', '4G(on board)', '無(on board) 最高4G', '128GB', '無', '0.51', '10.5吋', '(1920 x 1200) 16:10', 'Wi-Fi 5(802.11ac) 藍牙4.2', '27WHrs, 1S2P, 2-cell Li-ion', 'Chrome'),
('E410MA-0801PN4020', 11900, 'https://tw.buy.yahoo.com/gdsale/ASUS-E410MA-14吋筆電-N4020-4G-128G-eMMC-Win-10-Home-S-9704973.html', 'https://s.yimg.com/zp/MerchandiseImages/1BD5C91BE7-Gd-9704973.jpg', 'ASUS華碩', 'Intel® Celeron® N4020 Processor 1.1 GHz', '-', '4G(on board)', '無(on board) 最高4G', '128GB', '無', '1.3', '14.0吋', '1920 x 1080', '802.11ac 藍牙4.1', '-', 'Windows 10 Home S (S模式)'),
('E410MA-0631WN4020', 11900, 'https://tw.buy.yahoo.com/gdsale/ASUS-E410MA-14吋筆電-N4020-4G-128G-eMMC-LapTop-夢幻白-9573249.html', 'https://s.yimg.com/zp/MerchandiseImages/888C563B93-Gd-9573249.jpg', 'ASUS華碩', 'Intel® Celeron® N4020 Processor 1.1 GHz', '-', '4G(on board)', '無(on board) 最高4G', '128GB', '無', '1.3', '14.0吋', '1920X1080', '802.11ac 藍牙4.1', '-', 'Windows 10 Home S (S模式)'),
('A314-35-C6QZ', 11900, 'https://tw.buy.yahoo.com/gdsale/Acer-A314-35-C6QZ-14吋筆電-N5100-4G-256G-SSD-Aspire3-9579452.html', 'https://s.yimg.com/zp/MerchandiseImages/2FBCA32145-Gd-9579452.jpg', 'Acer宏碁', 'Celeron N5100', 'Intel Iris Xe Graphics', '4G', '2 最高16G', '256GB', '無', '1.45', '14.0吋', '1366 x 768', '802.11a/b/g/n/ac 1x1 MU-MIMO 藍牙5.0', '36Wh Li-ion battery', 'Win10 home'),
('TP401MA-0351AN4020', 11900, 'https://tw.buy.yahoo.com/gdsale/ASUS-TP401MA-14吋筆電-N4020-4G-128G-eMMC-觸控翻轉-Vivoboo-9757688.html', 'https://s.yimg.com/zp/MerchandiseImages/e807b2e035-Gd-9757688.jpg', 'ASUS華碩', 'Celeron® N4020 1.1GHz (4M Cache, up to 2.8 GHz)', '無', '4G', '無(on board) 最高4G', '128GB', '無', '1.49', '14.0吋', '1920 x 1080', '802.11ac 藍牙4.1', '36Whs 2cell', 'Windows 10 Home S (S模式)'),
('TP401MA-0291AN4020', 11900, 'https://tw.buy.yahoo.com/gdsale/ASUS-TP401MA-14吋筆電-N4020-4G-128G-eMMC-觸控翻轉-Vivoboo-9676138.html', 'https://s.yimg.com/zp/MerchandiseImages/14AF5FAFF9-Gd-9676138.jpg', 'ASUS華碩', 'Celeron® N4020 1.1GHz (4M Cache,  up to 2.8 GHz)', '無', '4G', '無(on board) 最高4G', '128GB', '無', '1.49', '14.0吋', '1920 x 1080', '802.11ac 藍牙4.1', '36Whs 2cell', 'Windows 10 Home S (S模式)'),
('E410MA-0811BN4020', 11900, 'https://tw.buy.yahoo.com/gdsale/ASUS-E410MA-14吋筆電-N4020-4G-128G-eMMC-Win-10-Home-S-9704974.html', 'https://s.yimg.com/zp/MerchandiseImages/446087AB7F-Gd-9704974.jpg', 'ASUS華碩', 'Intel® Celeron® N4020 Processor 1.1 GHz', '-', '4G(on board)', '無(on board) 最高4G', '128GB', '無', '1.3', '14.0吋', '1920 x 1080', '802.11ac 藍牙4.1', '-', 'Windows 10 Home S (S模式)'),
('E410MA-0791WN4020', 11900, 'https://tw.buy.yahoo.com/gdsale/ASUS-E410MA-14吋筆電-N4020-4G-128G-eMMC-Win-10-Home-S-9704975.html', 'https://s.yimg.com/zp/MerchandiseImages/9492DE21BA-Gd-9704975.jpg', 'ASUS華碩', 'Intel® Celeron® N4020 Processor 1.1 GHz', '-', '4G(on board)', '無(on board) 最高4G', '128GB', '無', '1.3', '14.0吋', '1920 x 1080', '802.11ac 藍牙4.1', '-', 'Windows 10 Home S (S模式)'),
('Surface Laptop Go i5/4G/64G', 11499, 'https://tw.buy.yahoo.com/activity/onsale/combo?actid=365213', 'https://s.yimg.com/zp/MipImages/2DCA8BF67A-MIP-365213.jpeg', 'Microsoft微軟', 'i5-1035G1', 'Intel® UHD Graphics', '4G', '無(on board) 最高8G', '64GB', '無', '1.11', '12.3吋', '1536 x 1024 (148 PPI)', 'Wi-Fi 6： 相容於 802.11ax 藍牙5.0', '一般裝置使用方式可達 13 小時', 'Windows 10 Home S (S模式)'),
('X415MA-0311GN4020', 10900, 'https://tw.buy.yahoo.com/gdsale/ASUS-X415MA-14吋筆電-N4020-4G-128G-SSD-Laptop-星空灰-9550651.html', 'https://s.yimg.com/zp/MerchandiseImages/169900C675-Gd-9550651.jpg', 'ASUS華碩', 'Celeron® N4020 Processor 1.1 GHz', '-', '4G', '1, 已佔用1 最高8G', '128GB', '無', '1.6', '14.0吋', '1920 x 1080', 'Wi-Fi 5(802.11ac) 藍牙4.1', '37WHrs,  2S1P,  2-cell Li-ion', 'Windows 10 Home S (S模式)');

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `yahoo_pchome`
-- (請參考以下實際畫面)
--
DROP VIEW IF EXISTS `yahoo_pchome`;
CREATE TABLE `yahoo_pchome` (
`nb_id` varchar(50)
,`yahoo_price` int(10)
,`yahoo_url` varchar(100)
,`pchome_price` varchar(10)
,`pchome_url` varchar(100)
);

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `yahoo_sinya`
-- (請參考以下實際畫面)
--
DROP VIEW IF EXISTS `yahoo_sinya`;
CREATE TABLE `yahoo_sinya` (
`nb_id` varchar(50)
,`yahoo_price` int(10)
,`yahoo_url` varchar(100)
,`sinya_price` varchar(9)
,`sinya_stu_price` varchar(9)
,`sinya_url` varchar(50)
);

-- --------------------------------------------------------

--
-- 將檢視表 `all_platform` 結構匯出成資料表
--
DROP TABLE IF EXISTS `all_platform`;
CREATE TABLE`all_platform`(
    `nb_id` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
    `yahoo_price` int(10) NOT NULL,
    `yahoo_url` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
    `sinya_price` varchar(9) COLLATE utf8_general_ci DEFAULT NULL,
    `sinya_url` varchar(50) COLLATE utf8_general_ci DEFAULT NULL,
    `sinya_stu_price` varchar(9) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `pchome_url` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `pchome_price` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL
);

-- --------------------------------------------------------

--
-- 將檢視表 `yahoo_pchome` 結構匯出成資料表
--
DROP TABLE IF EXISTS `yahoo_pchome`;
CREATE TABLE`yahoo_pchome`(
    `nb_id` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
    `yahoo_price` int(10) NOT NULL,
    `yahoo_url` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
    `pchome_price` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
    `pchome_url` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
);

-- --------------------------------------------------------

--
-- 將檢視表 `yahoo_sinya` 結構匯出成資料表
--
DROP TABLE IF EXISTS `yahoo_sinya`;
CREATE TABLE`yahoo_sinya`(
    `nb_id` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
    `yahoo_price` int(10) NOT NULL,
    `yahoo_url` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
    `sinya_price` varchar(9) COLLATE utf8_general_ci DEFAULT NULL,
    `sinya_stu_price` varchar(9) COLLATE utf8mb4_general_ci NOT NULL,
    `sinya_url` varchar(50) COLLATE utf8_general_ci DEFAULT NULL
);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`fav_id`);

--
-- 資料表索引 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`m_Id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `favorite`
--
ALTER TABLE `favorite`
  MODIFY `fav_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;


--
-- 元資料
--
USE `phpmyadmin`;

--
-- 資料表 all_platform 的元資料
--

--
-- 資料表新增資料前，先清除舊資料 `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- 資料表新增資料前，先清除舊資料 `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- 資料表新增資料前，先清除舊資料 `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- 資料表 article 的元資料
--

--
-- 資料表新增資料前，先清除舊資料 `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- 資料表新增資料前，先清除舊資料 `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- 資料表新增資料前，先清除舊資料 `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- 資料表 comment 的元資料
--

--
-- 資料表新增資料前，先清除舊資料 `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- 資料表新增資料前，先清除舊資料 `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- 資料表新增資料前，先清除舊資料 `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- 資料表 favorite 的元資料
--

--
-- 資料表新增資料前，先清除舊資料 `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- 資料表新增資料前，先清除舊資料 `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- 資料表新增資料前，先清除舊資料 `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- 資料表 forum 的元資料
--

--
-- 資料表新增資料前，先清除舊資料 `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- 資料表新增資料前，先清除舊資料 `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- 資料表新增資料前，先清除舊資料 `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- 資料表 member 的元資料
--

--
-- 資料表新增資料前，先清除舊資料 `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- 資料表新增資料前，先清除舊資料 `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- 資料表新增資料前，先清除舊資料 `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- 資料表 pchome 的元資料
--

--
-- 資料表新增資料前，先清除舊資料 `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- 資料表新增資料前，先清除舊資料 `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- 資料表新增資料前，先清除舊資料 `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- 資料表 sinya 的元資料
--

--
-- 資料表新增資料前，先清除舊資料 `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- 資料表新增資料前，先清除舊資料 `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- 傾印資料表的資料 `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'laptop', 'sinya', '{\"sorted_col\":\"nb_id\"}', '2022-04-23 10:22:53');

--
-- 資料表新增資料前，先清除舊資料 `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- 資料表 sinya_stu 的元資料
--

--
-- 資料表新增資料前，先清除舊資料 `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- 資料表新增資料前，先清除舊資料 `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- 資料表新增資料前，先清除舊資料 `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- 資料表 specifics_yahoo 的元資料
--

--
-- 資料表新增資料前，先清除舊資料 `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- 資料表新增資料前，先清除舊資料 `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- 傾印資料表的資料 `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'laptop', 'specifics_yahoo', '{\"sorted_col\":\"`nb_id` ASC\"}', '2022-05-19 09:28:17');

--
-- 資料表新增資料前，先清除舊資料 `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- 資料表 yahoo_pchome 的元資料
--

--
-- 資料表新增資料前，先清除舊資料 `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- 資料表新增資料前，先清除舊資料 `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- 資料表新增資料前，先清除舊資料 `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- 資料表 yahoo_sinya 的元資料
--

--
-- 資料表新增資料前，先清除舊資料 `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- 資料表新增資料前，先清除舊資料 `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- 資料表新增資料前，先清除舊資料 `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- 資料庫 laptop 的元資料
--

--
-- 資料表新增資料前，先清除舊資料 `pma__bookmark`
--

TRUNCATE TABLE `pma__bookmark`;
--
-- 資料表新增資料前，先清除舊資料 `pma__relation`
--

TRUNCATE TABLE `pma__relation`;
--
-- 資料表新增資料前，先清除舊資料 `pma__savedsearches`
--

TRUNCATE TABLE `pma__savedsearches`;
--
-- 資料表新增資料前，先清除舊資料 `pma__central_columns`
--

TRUNCATE TABLE `pma__central_columns`;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
