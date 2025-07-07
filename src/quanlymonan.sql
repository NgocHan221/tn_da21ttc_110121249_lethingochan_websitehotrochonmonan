-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 07, 2025 lúc 12:28 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quanlymonan`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chedo`
--

CREATE TABLE `chedo` (
  `ma_chedo` int(11) NOT NULL,
  `ten_chedo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chedo`
--

INSERT INTO `chedo` (`ma_chedo`, `ten_chedo`) VALUES
(2, 'Thuần chay'),
(3, 'Tiểu đường'),
(5, 'Bình thường'),
(6, 'Hỗ trợ giảm cân'),
(8, 'Hỗ trợ tăng cân');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmuc`
--

CREATE TABLE `danhmuc` (
  `ma_danhmuc` int(11) NOT NULL,
  `ten_danhmuc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `danhmuc`
--

INSERT INTO `danhmuc` (`ma_danhmuc`, `ten_danhmuc`) VALUES
(1, 'Món chính'),
(2, 'Món phụ'),
(3, 'Mùa Tết'),
(4, 'Sinh nhật'),
(5, 'Các loại bánh'),
(6, 'Các món ăn miền Nam'),
(7, 'Các món ăn miền Bắc');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dinhduong`
--

CREATE TABLE `dinhduong` (
  `ma_dinhduong` int(11) NOT NULL,
  `hinh_anh` varchar(255) DEFAULT NULL,
  `ten_dinhduong` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `dinhduong`
--

INSERT INTO `dinhduong` (`ma_dinhduong`, `hinh_anh`, `ten_dinhduong`) VALUES
(2, 'uploads/images/nutrient_6838b39902c44.png', 'Giảm cân'),
(4, 'uploads/nutrients/nutrient_68334974183c4.png', 'Bổ thận'),
(5, 'uploads/nutrients/nutrient_68346017c330b.jpg', 'Bổ máu'),
(6, 'uploads/nutrients/nutrient_683462ffe8aba.png', 'Bổ gan'),
(7, 'uploads/nutrients/nutrient_6838b3c3bbaaf.png', 'Hỗ trợ trí não'),
(8, 'uploads/nutrients/nutrient_6838b3eb64984.png', 'Hỗ trợ xương khớp');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `ma_nguoidung` int(11) NOT NULL,
  `ma_monan` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `favorites`
--

INSERT INTO `favorites` (`id`, `ma_nguoidung`, `ma_monan`, `created_at`) VALUES
(7, 3, 13, '2025-06-06 08:44:47'),
(14, 3, 9, '2025-06-29 02:04:48');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `ma_nguoidung` int(11) NOT NULL,
  `ma_monan` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `content` text NOT NULL,
  `rating` float DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `is_admin` tinyint(1) DEFAULT 0,
  `is_deleted` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `feedback`
--

INSERT INTO `feedback` (`id`, `ma_nguoidung`, `ma_monan`, `parent_id`, `content`, `rating`, `created_at`, `is_admin`, `is_deleted`) VALUES
(9, 3, 9, NULL, 'Ngon', 5, '2025-06-02 02:12:24', 0, 0),
(10, 2, 9, NULL, 'Cũng được', 3, '2025-06-04 23:06:27', 0, 0),
(11, 3, 9, NULL, 'Cũng cũng', 4, '2025-06-16 07:34:11', 0, 0),
(12, 3, 10, NULL, 'Dễ làm', 5, '2025-06-27 06:04:04', 0, 0),
(13, 3, 10, NULL, 'Cũng cũng', 2, '2025-06-29 01:45:29', 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menu_suggestions`
--

CREATE TABLE `menu_suggestions` (
  `id` int(11) NOT NULL,
  `preservation_id` int(11) DEFAULT NULL,
  `meal` varchar(50) DEFAULT NULL,
  `dishes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`dishes`)),
  `calories` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `monan`
--

CREATE TABLE `monan` (
  `ma_monan` int(11) NOT NULL,
  `ten_monan` varchar(100) NOT NULL,
  `hinh_anh` varchar(255) DEFAULT NULL,
  `khau_phan` int(11) NOT NULL,
  `do_kho` enum('de','trung binh','kho') NOT NULL,
  `calo` int(11) DEFAULT NULL,
  `cong_thuc` text NOT NULL,
  `ma_danhmuc` int(11) DEFAULT NULL,
  `ma_chedo` int(11) DEFAULT NULL,
  `ma_dinhduong` int(11) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `ghi_chu` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `monan`
--

INSERT INTO `monan` (`ma_monan`, `ten_monan`, `hinh_anh`, `khau_phan`, `do_kho`, `calo`, `cong_thuc`, `ma_danhmuc`, `ma_chedo`, `ma_dinhduong`, `video`, `ghi_chu`) VALUES
(9, 'Bánh canh chay', 'uploads/images/banh-canh-chay.jpg', 1, 'de', 400, '<h3 data-start=\"2023\" data-end=\"2059\" id=\"isPasted\">Bước 1️⃣: Chuẩn bị nguy&ecirc;n liệu</h3><ul data-start=\"2060\" data-end=\"2266\"><li data-start=\"2060\" data-end=\"2123\"><p data-start=\"2062\" data-end=\"2123\">&nbsp; Rửa sạch nấm đ&ugrave;i g&agrave;, nấm rơm, cắt l&aacute;t mỏng hoặc x&eacute; sợi.</p></li><li data-start=\"2124\" data-end=\"2180\"><p data-start=\"2126\" data-end=\"2180\">&nbsp; C&agrave; rốt tỉa hoa hoặc th&aacute;i l&aacute;t để tạo m&agrave;u sắc đẹp.</p></li><li data-start=\"2181\" data-end=\"2222\"><p data-start=\"2183\" data-end=\"2222\">&nbsp; Đậu hũ cắt vu&ocirc;ng, chi&ecirc;n v&agrave;ng nhẹ.</p></li><li data-start=\"2223\" data-end=\"2266\"><p data-start=\"2225\" data-end=\"2266\">&nbsp; Rau ng&ograve;, h&agrave;nh l&aacute; rửa sạch, cắt nhỏ.</p></li></ul><p><br></p><h3 data-start=\"2273\" data-end=\"2302\" id=\"isPasted\">Bước 2️⃣: Nấu nước d&ugrave;ng</h3><ul data-start=\"2303\" data-end=\"2655\"><li data-start=\"2303\" data-end=\"2399\"><p data-start=\"2305\" data-end=\"2399\">&nbsp; Cho 5ml dầu ăn v&agrave;o nồi, phi thơm h&agrave;nh t&iacute;m (nếu ăn chay tuyệt đối d&ugrave;ng phần gốc h&agrave;nh l&aacute;).</p></li><li data-start=\"2400\" data-end=\"2491\"><p data-start=\"2402\" data-end=\"2491\">&nbsp; Cho nấm v&agrave; c&agrave; rốt v&agrave;o x&agrave;o sơ, n&ecirc;m 1/3 muỗng c&agrave; ph&ecirc; muối + 1 muỗng c&agrave; ph&ecirc; đường.</p></li><li data-start=\"2492\" data-end=\"2589\"><p data-start=\"2494\" data-end=\"2589\">&nbsp; Đổ 400ml nước lọc v&agrave;o nồi, đun s&ocirc;i rồi giảm nhỏ lửa hầm khoảng 10 ph&uacute;t cho ngọt nước.</p></li><li data-start=\"2590\" data-end=\"2655\"><p data-start=\"2592\" data-end=\"2655\">&nbsp; N&ecirc;m th&ecirc;m 1 muỗng canh nước tương, ti&ecirc;u xay cho vừa miệng.</p></li></ul><p><br></p><h3 data-start=\"2662\" data-end=\"2691\" id=\"isPasted\">Bước 3️⃣: Nấu b&aacute;nh canh</h3><ul data-start=\"2692\" data-end=\"2827\"><li data-start=\"2692\" data-end=\"2747\"><p data-start=\"2694\" data-end=\"2747\">&nbsp; Trụng 150g b&aacute;nh canh tươi qua nước s&ocirc;i, để r&aacute;o.</p></li><li data-start=\"2748\" data-end=\"2827\"><p data-start=\"2750\" data-end=\"2827\">&nbsp; Khi nước d&ugrave;ng s&ocirc;i lại, cho b&aacute;nh canh v&agrave;o nồi đun 1&ndash;2 ph&uacute;t cho n&oacute;ng đều.</p></li></ul><p><br></p><h3 data-start=\"2834\" data-end=\"2860\" id=\"isPasted\">Bước 4️⃣: Ho&agrave;n thiện</h3><ul data-start=\"2861\" data-end=\"3054\"><li data-start=\"2861\" data-end=\"2929\"><p data-start=\"2863\" data-end=\"2929\">&nbsp; M&uacute;c b&aacute;nh canh ra t&ocirc;, xếp đậu hũ chi&ecirc;n, nấm, c&agrave; rốt l&ecirc;n tr&ecirc;n.</p></li><li data-start=\"2930\" data-end=\"2994\"><p data-start=\"2932\" data-end=\"2994\">&nbsp; Rắc h&agrave;nh l&aacute;, ng&ograve; r&iacute; v&agrave; ch&uacute;t ti&ecirc;u xay để tăng hương thơm.</p></li><li data-start=\"2995\" data-end=\"3054\"><p data-start=\"2997\" data-end=\"3054\">&nbsp; Ăn k&egrave;m với ch&eacute;n nước tương v&agrave; v&agrave;i l&aacute;t ớt nếu th&iacute;ch.</p></li></ul>', 2, 2, 2, 'uploads/videos/Cách làm BÁNH CANH CHAY.mp4', 'Làm cho nhiều người ăn thì gấp đôi lượng nguyên liệu lên theo số người'),
(10, 'Bún trộn ngũ sắc', 'uploads/images/bun-tron-ngu-sac.jpg', 1, 'de', 420, '<h4 data-start=\"692\" data-end=\"720\" id=\"isPasted\"><strong data-start=\"697\" data-end=\"720\">Phần nước mắm trộn:</strong></h4><ul data-start=\"721\" data-end=\"994\"><li style=\"list-style-type: none;\"><ul style=\"list-style-type: none;\"><li style=\"list-style-type: none;\"><ul style=\"list-style-type: none;\"><li style=\"list-style-type: none;\"><ul style=\"list-style-type: none;\"><li data-start=\"721\" data-end=\"763\"><p data-start=\"723\" data-end=\"763\" style=\"text-align: left;\">Nước mắm: 15ml (~1 muỗng canh)</p></li><li data-start=\"764\" data-end=\"812\"><p data-start=\"766\" data-end=\"812\" style=\"text-align: left;\">Đường trắng: 10g (~1 muỗng canh vun)</p></li><li data-start=\"813\" data-end=\"863\"><p data-start=\"815\" data-end=\"863\" style=\"text-align: left;\">Nước cốt chanh: 10ml (~2 muỗng c&agrave; ph&ecirc;)</p></li><li data-start=\"864\" data-end=\"906\"><p data-start=\"866\" data-end=\"906\" style=\"text-align: left;\">Nước lọc: 30ml (~2 muỗng canh)</p></li><li data-start=\"907\" data-end=\"943\"><p data-start=\"909\" data-end=\"943\" style=\"text-align: left;\">Tỏi băm: 5g (~1 t&eacute;p nhỏ)</p></li><li data-start=\"944\" data-end=\"994\"><p data-start=\"946\" data-end=\"994\" style=\"text-align: left;\">Ớt băm: 1 quả nhỏ (t&ugrave;y khẩu vị ăn cay)</p></li><li data-start=\"748\" data-end=\"963\" id=\"isPasted\"><p data-start=\"751\" data-end=\"774\"><strong data-start=\"751\" data-end=\"773\">1. Sơ chế nguy&ecirc;n liệu</strong>:</p><ul data-start=\"778\" data-end=\"963\"><li data-start=\"778\" data-end=\"819\"><p data-start=\"780\" data-end=\"819\">B&uacute;n trụng nhanh qua nước s&ocirc;i, để r&aacute;o.</p></li><li data-start=\"823\" data-end=\"879\"><p data-start=\"825\" data-end=\"879\">C&agrave; rốt, dưa leo, bắp cải t&iacute;m rửa sạch, b&agrave;o/th&aacute;i sợi.</p></li><li data-start=\"883\" data-end=\"929\"><p data-start=\"885\" data-end=\"929\">Gi&aacute; đỗ trụng sơ qua nước s&ocirc;i rồi để nguội.</p></li><li data-start=\"933\" data-end=\"963\"><p data-start=\"935\" data-end=\"963\">Rau sống rửa sạch, để r&aacute;o.</p></li></ul></li><li data-start=\"965\" data-end=\"1077\"><p data-start=\"968\" data-end=\"986\"><strong data-start=\"968\" data-end=\"985\">2. Chuẩn bị thịt</strong>:</p><ul data-start=\"990\" data-end=\"1077\"><li data-start=\"990\" data-end=\"1077\"><p data-start=\"992\" data-end=\"1077\">Thịt heo ba chỉ luộc ch&iacute;n, cắt l&aacute;t mỏng hoặc x&agrave;o sơ với ch&uacute;t muối, ti&ecirc;u cho đậm đ&agrave;.</p></li></ul></li><li data-start=\"1079\" data-end=\"1249\"><p data-start=\"1082\" data-end=\"1104\"><strong data-start=\"1082\" data-end=\"1103\">3. Pha nước mắm trộn</strong>:</p><ul data-start=\"1108\" data-end=\"1249\"><li data-start=\"1108\" data-end=\"1249\"><p data-start=\"1110\" data-end=\"1249\">1 muỗng canh nước mắm + 1 muỗng canh đường + 1 muỗng canh nước cốt chanh + 2 muỗng canh nước lọc + tỏi, ớt băm nhuyễn. Khuấy đều cho tan.</p></li></ul></li><li data-start=\"1251\" data-end=\"1378\"><p data-start=\"1254\" data-end=\"1267\"><strong data-start=\"1254\" data-end=\"1266\">4. Trộn b&uacute;n</strong>:</p><ul data-start=\"1271\" data-end=\"1378\"><li data-start=\"1271\" data-end=\"1318\"><p data-start=\"1273\" data-end=\"1318\">Cho b&uacute;n, rau củ, thịt, rau sống v&agrave;o t&ocirc; lớn.</p></li><li data-start=\"1322\" data-end=\"1378\"><p data-start=\"1324\" data-end=\"1378\">Rưới đều nước mắm trộn, đảo nhẹ tay cho thấm gia vị.</p></li></ul></li><li data-start=\"1380\" data-end=\"1483\"><p data-start=\"1383\" data-end=\"1398\"><strong data-start=\"1383\" data-end=\"1397\">5. Ho&agrave;n thiện</strong>:</p><ul data-start=\"1402\" data-end=\"1483\"><li data-start=\"1402\" data-end=\"1483\"><p data-start=\"1404\" data-end=\"1483\">Cho b&uacute;n trộn ra dĩa/t&ocirc;, rắc h&agrave;nh phi, đậu phộng rang l&ecirc;n tr&ecirc;n v&agrave; thưởng thức.</p></li></ul></li></ul></li></ul></li></ul></li></ul>', 4, 6, NULL, 'uploads/videos/bun_tron_ngu_sac.mp4', 'Làm cho nhiều người ăn thì gấp đôi lượng nguyên liệu lên theo số người'),
(11, 'Lẩu cá kèo lá giang', 'uploads/images/lau-ca-keo-la-giang.jpg', 1, 'de', 380, '<h3 data-start=\"2025\" data-end=\"2059\" id=\"isPasted\">Bước 1️⃣: Sơ chế nguy&ecirc;n liệu</h3><ul data-start=\"2060\" data-end=\"2264\"><li data-start=\"2060\" data-end=\"2137\"><p data-start=\"2062\" data-end=\"2137\">&nbsp; C&aacute; k&egrave;o rửa sạch, ch&agrave; muối v&agrave; giấm để khử m&ugrave;i tanh, rửa lại nước lạnh.</p></li><li data-start=\"2138\" data-end=\"2181\"><p data-start=\"2140\" data-end=\"2181\">&nbsp; L&aacute; giang nhặt lấy l&aacute; non, rửa sạch.</p></li><li data-start=\"2182\" data-end=\"2223\"><p data-start=\"2184\" data-end=\"2223\">&nbsp; Thơm (dứa), c&agrave; chua cắt l&aacute;t mỏng.</p></li><li data-start=\"2224\" data-end=\"2264\"><p data-start=\"2226\" data-end=\"2264\">&nbsp; B&uacute;n tươi trụng nước s&ocirc;i, để r&aacute;o.</p></li></ul><p><br></p><h3 data-start=\"2271\" data-end=\"2302\" id=\"isPasted\">Bước 2️⃣: X&agrave;o thơm gia vị</h3><ul data-start=\"2303\" data-end=\"2437\"><li data-start=\"2303\" data-end=\"2382\"><p data-start=\"2305\" data-end=\"2382\">&nbsp; Cho&nbsp;tỏi băm + h&agrave;nh t&iacute;m băm v&agrave;o nồi với ch&uacute;t dầu ăn, phi thơm.</p></li><li data-start=\"2383\" data-end=\"2437\"><p data-start=\"2385\" data-end=\"2437\">&nbsp; Th&ecirc;m ớt sa tế để tạo m&ugrave;i thơm cay nồng.</p></li></ul><p><br></p><h3 data-start=\"2444\" data-end=\"2473\" id=\"isPasted\">Bước 3️⃣: Nấu nước d&ugrave;ng</h3><ul data-start=\"2474\" data-end=\"2662\"><li data-start=\"2474\" data-end=\"2518\"><p data-start=\"2476\" data-end=\"2518\">&nbsp; Đổ 250ml nước d&ugrave;ng v&agrave;o nồi, đun s&ocirc;i.</p></li><li data-start=\"2519\" data-end=\"2610\"><p data-start=\"2521\" data-end=\"2610\">&nbsp; Th&ecirc;m thơm, c&agrave; chua, l&aacute; giang, n&ecirc;m hạt n&ecirc;m (5g), đường (12.5g), nước mắm (15ml).</p></li><li data-start=\"2611\" data-end=\"2662\"><p data-start=\"2613\" data-end=\"2662\">&nbsp; Đun s&ocirc;i ~5 ph&uacute;t để nước c&oacute; vị chua nhẹ v&agrave; thơm.</p></li></ul><p><br></p><h3 data-start=\"2669\" data-end=\"2695\" id=\"isPasted\">Bước 4️⃣: Nấu c&aacute; k&egrave;o</h3><ul data-start=\"2696\" data-end=\"2786\"><li data-start=\"2696\" data-end=\"2786\"><p data-start=\"2698\" data-end=\"2786\">&nbsp; Khi ăn, thả c&aacute; k&egrave;o tươi v&agrave;o nồi nước đang s&ocirc;i, đậy nắp ~3&ndash;5 ph&uacute;t cho c&aacute; ch&iacute;n.</p></li></ul><p><br></p><h3 data-start=\"2793\" data-end=\"2820\" id=\"isPasted\">Bước 5️⃣: Thưởng thức</h3><ul data-start=\"2821\" data-end=\"2901\"><li data-start=\"2821\" data-end=\"2901\"><p data-start=\"2823\" data-end=\"2901\">&nbsp; Ăn k&egrave;m với b&uacute;n tươi, rau sống v&agrave; chấm c&aacute; với nước mắm ớt tỏi.</p></li></ul><p><br></p>', 1, NULL, 5, 'uploads/videos/video_686ac2d3220d9.mp4', 'Làm cho nhiều người ăn thì gấp đôi lượng nguyên liệu lên theo số người'),
(13, 'Canh chua cá lóc', 'uploads/images/Canh-chua-ca-loc-540-360.jpg.jpg', 1, 'de', 320, '<h3 data-start=\"2535\" data-end=\"2569\" id=\"isPasted\">Bước 1️⃣: Sơ chế nguy&ecirc;n liệu</h3><ul data-start=\"2570\" data-end=\"2777\"><li data-start=\"2570\" data-end=\"2640\"><p data-start=\"2572\" data-end=\"2640\">&nbsp; C&aacute; l&oacute;c l&agrave;m sạch, ch&agrave; muối &amp; giấm để khử tanh, cắt kh&uacute;c vừa ăn.</p></li><li data-start=\"2641\" data-end=\"2696\"><p data-start=\"2643\" data-end=\"2696\">&nbsp; Me chua dầm với &iacute;t nước n&oacute;ng, lọc lấy nước cốt.</p></li><li data-start=\"2697\" data-end=\"2777\"><p data-start=\"2699\" data-end=\"2777\">&nbsp; Sơ chế c&aacute;c loại rau: thơm, c&agrave; chua, bạc h&agrave;, gi&aacute; đỗ, rau om, rau ng&ograve; gai.</p></li></ul><p data-start=\"2699\" data-end=\"2777\"><br></p><h3 data-start=\"2784\" data-end=\"2815\" id=\"isPasted\">Bước 2️⃣: X&agrave;o thơm gia vị</h3><ul data-start=\"2816\" data-end=\"2945\"><li data-start=\"2816\" data-end=\"2877\"><p data-start=\"2818\" data-end=\"2877\">&nbsp; Cho 1.25ml dầu ăn v&agrave;o nồi, phi thơm&nbsp;tỏi băm.</p></li><li data-start=\"2878\" data-end=\"2945\"><p data-start=\"2880\" data-end=\"2945\">&nbsp; Cho c&agrave; chua v&agrave;o x&agrave;o mềm, th&ecirc;m thơm x&agrave;o c&ugrave;ng để dậy m&ugrave;i.</p></li></ul><p><br></p><h3 data-start=\"2952\" data-end=\"2981\" id=\"isPasted\">Bước 3️⃣: Nấu nước d&ugrave;ng</h3><ul data-start=\"2982\" data-end=\"3104\"><li data-start=\"2982\" data-end=\"3025\"><p data-start=\"2984\" data-end=\"3025\">&nbsp; Đổ 375ml nước lọc v&agrave;o nồi, đun s&ocirc;i.</p></li><li data-start=\"3026\" data-end=\"3104\"><p data-start=\"3028\" data-end=\"3104\">&nbsp; Th&ecirc;m nước cốt me, n&ecirc;m nước mắm (11ml), muối (1.25g), đường (2.5g).</p></li></ul><p><br></p><h3 data-start=\"3111\" data-end=\"3140\" id=\"isPasted\">Bước 4️⃣: Nấu c&aacute; v&agrave; rau</h3><ul data-start=\"3141\" data-end=\"3278\"><li data-start=\"3141\" data-end=\"3216\"><p data-start=\"3143\" data-end=\"3216\">&nbsp; Khi nước s&ocirc;i lại, thả&nbsp;c&aacute; l&oacute;c v&agrave;o nồi, nấu ~5 ph&uacute;t cho c&aacute; ch&iacute;n.</p></li><li data-start=\"3217\" data-end=\"3278\"><p data-start=\"3219\" data-end=\"3278\">&nbsp; Cho bạc h&agrave;, gi&aacute; đỗ v&agrave;o, nấu th&ecirc;m ~1 ph&uacute;t rồi tắt bếp.</p></li></ul><p><br></p><h3 data-start=\"3285\" data-end=\"3325\" id=\"isPasted\">Bước 5️⃣: Ho&agrave;n thiện &amp; thưởng thức</h3><ul data-start=\"3326\" data-end=\"3427\"><li data-start=\"3326\" data-end=\"3382\"><p data-start=\"3328\" data-end=\"3382\">&nbsp; Rắc rau om, rau ng&ograve; gai v&agrave; ớt tươi l&ecirc;n tr&ecirc;n.</p></li><li data-start=\"3383\" data-end=\"3427\"><p data-start=\"3385\" data-end=\"3427\">&nbsp; Ăn n&oacute;ng với cơm trắng hoặc b&uacute;n tươi.</p></li></ul><p>&nbsp;</p><p><br></p><p><br></p><p><br></p>', NULL, 5, 7, 'uploads/videos/video_686ad2568c0b3.mp4', 'Làm cho nhiều người ăn thì gấp đôi lượng nguyên liệu lên theo số người\r\nCó thể thay cá lóc bằng các loại sau để đảm bảo dinh dưỡng:\r\n  1. Ăn chay: Cá lóc → nấm, đậu hũ non\r\n  2. Giảm cân: Cá lóc → cá basa phi lê (ít béo)\r\n  3. Tăng dinh dưỡng: Thêm hến, tôm nhỏ để nước ngọt hơn\r\n'),
(14, 'Đùi ếch chiên', 'uploads/images/dui-ech-chien-8.jpg.jpg', 1, 'de', 420, '<h3 data-start=\"4088\" data-end=\"4129\" id=\"isPasted\">Bước 1️⃣: Sơ chế &amp; khử m&ugrave;i thịt ếch</h3><ul data-start=\"4130\" data-end=\"4240\"><li data-start=\"4130\" data-end=\"4204\"><p data-start=\"4132\" data-end=\"4204\">&nbsp; Rửa sạch 330g đ&ugrave;i ếch với muối hạt + rượu gừng + gừng đập dập.</p></li><li data-start=\"4205\" data-end=\"4240\"><p data-start=\"4207\" data-end=\"4240\">&nbsp; Rửa lại bằng nước sạch, để r&aacute;o.</p></li></ul><p><br></p><h3 data-start=\"4247\" data-end=\"4275\" id=\"isPasted\">Bước 2️⃣: Ướp thịt ếch</h3><ul data-start=\"4276\" data-end=\"4482\"><li data-start=\"4276\" data-end=\"4482\"><p data-start=\"4278\" data-end=\"4292\">&nbsp; Ướp ếch với:</p><ul data-start=\"4295\" data-end=\"4482\" style=\"font-weight: initial;\"><li data-start=\"4295\" data-end=\"4438\"><p data-start=\"4297\" data-end=\"4438\">&nbsp; Nước mắm (10ml), dầu h&agrave;o (5ml), bột n&ecirc;m (1.5g), đường (1.5g), ti&ecirc;u (0.7g), nghệ tươi (3g băm nhuyễn), sả băm (10g), h&agrave;nh tỏi băm (14g).</p></li><li data-start=\"4441\" data-end=\"4482\"><p data-start=\"4443\" data-end=\"4482\">&nbsp; Trộn đều, để thấm gia vị 30 ph&uacute;t.</p></li></ul></li></ul><p><br></p><h3 data-start=\"4489\" data-end=\"4525\" id=\"isPasted\">Bước 3️⃣: Tẩm bột &amp; chi&ecirc;n gi&ograve;n</h3><ul data-start=\"4526\" data-end=\"4680\"><li data-start=\"4526\" data-end=\"4569\"><p data-start=\"4528\" data-end=\"4569\">&nbsp; Lăn đ&ugrave;i ếch qua 65g bột chi&ecirc;n gi&ograve;n.</p></li><li data-start=\"4570\" data-end=\"4645\"><p data-start=\"4572\" data-end=\"4645\">&nbsp; Đun n&oacute;ng dầu, chi&ecirc;n đ&ugrave;i ếch đến khi v&agrave;ng gi&ograve;n, ch&iacute;n đều (5&ndash;7 ph&uacute;t).</p></li><li data-start=\"4646\" data-end=\"4680\"><p data-start=\"4648\" data-end=\"4680\">&nbsp; Gắp ra, để tr&ecirc;n giấy thấm dầu.</p></li></ul><p><br></p><h3 data-start=\"4687\" data-end=\"4715\" id=\"isPasted\">Bước 4️⃣: Pha sốt chấm</h3><ul data-start=\"4716\" data-end=\"4806\"><li data-start=\"4716\" data-end=\"4806\"><p data-start=\"4718\" data-end=\"4806\">&nbsp; Trộn tương ớt (7g), nước cốt chanh (10ml), đường (1.5g) để l&agrave;m sốt chấm chua ngọt.</p></li></ul><p><br></p><h3 data-start=\"4813\" data-end=\"4840\" id=\"isPasted\">Bước 5️⃣: Thưởng thức</h3><ul data-start=\"4841\" data-end=\"4914\"><li data-start=\"4841\" data-end=\"4914\"><p data-start=\"4843\" data-end=\"4914\">&nbsp; Xếp ếch chi&ecirc;n gi&ograve;n, dưa leo, l&aacute; lốt ra đĩa, ăn n&oacute;ng với sốt chấm.</p></li></ul>', NULL, 8, 8, 'uploads/videos/video_686ae0bf5b813.mp4', 'Làm cho nhiều người ăn thì gấp đôi lượng nguyên liệu lên theo số người'),
(15, 'Canh bí đao nấu sườn non', 'uploads/images/AGF-1791-canh-bi-dao-nau-suon-non.png.png', 4, 'de', 143, '<h4 data-start=\"438\" data-end=\"460\" id=\"isPasted\">???? Bước 1: Sơ chế</h4><ul data-start=\"461\" data-end=\"662\"><li data-start=\"461\" data-end=\"516\"><p data-start=\"463\" data-end=\"516\"><strong data-start=\"463\" data-end=\"475\">Sườn non</strong>: rửa sạch, chần qua nước s&ocirc;i để khử m&ugrave;i.</p></li><li data-start=\"517\" data-end=\"565\"><p data-start=\"519\" data-end=\"565\"><strong data-start=\"519\" data-end=\"529\">B&iacute; đao</strong>: gọt vỏ, bỏ ruột, cắt miếng vừa ăn.</p></li><li data-start=\"566\" data-end=\"662\"><p data-start=\"568\" data-end=\"662\"><strong data-start=\"568\" data-end=\"580\">H&agrave;nh t&iacute;m</strong>: băm nhỏ, phi thơm với &iacute;t dầu (t&ugrave;y chọn, c&oacute; thể nấu nước trong nếu ki&ecirc;ng dầu mỡ).</p></li></ul><h4 data-start=\"664\" data-end=\"693\">???? Bước 2: Nấu nước d&ugrave;ng</h4><ul data-start=\"694\" data-end=\"870\"><li data-start=\"694\" data-end=\"767\"><p data-start=\"696\" data-end=\"767\">Cho sườn v&agrave;o nồi c&ugrave;ng 1 l&iacute;t nước, ninh khoảng <strong data-start=\"742\" data-end=\"753\">20 ph&uacute;t</strong> cho sườn mềm.</p></li><li data-start=\"768\" data-end=\"828\"><p data-start=\"770\" data-end=\"828\">Th&ecirc;m <strong data-start=\"775\" data-end=\"785\">b&iacute; đao</strong> v&agrave;o, nấu tiếp 10 ph&uacute;t đến khi b&iacute; ch&iacute;n mềm.</p></li><li data-start=\"829\" data-end=\"870\"><p data-start=\"831\" data-end=\"870\">N&ecirc;m <strong data-start=\"835\" data-end=\"862\">muối, nước mắm, &iacute;t ti&ecirc;u</strong> vừa ăn.</p></li></ul><h4 data-start=\"872\" data-end=\"898\">???? Bước 3: Ho&agrave;n thiện</h4><ul data-start=\"899\" data-end=\"981\"><li data-start=\"899\" data-end=\"943\"><p data-start=\"901\" data-end=\"943\">Cho h&agrave;nh l&aacute;, ng&ograve; r&iacute; v&agrave;o trước khi tắt bếp.</p></li><li data-start=\"944\" data-end=\"981\"><p data-start=\"946\" data-end=\"981\">Rắc ti&ecirc;u xay l&ecirc;n mặt khi m&uacute;c ra t&ocirc;.</p></li></ul>', NULL, 5, 4, 'uploads/videos/canh bi dao suon non.mp4', NULL),
(16, 'Cơm gạo lứt trộn', 'uploads/images/com-gao-lut-tron.webp', 4, 'de', 288, '<h4 data-start=\"724\" data-end=\"750\" id=\"isPasted\">???? <strong data-start=\"732\" data-end=\"750\">Bước 1: Sơ chế</strong></h4><ul data-start=\"751\" data-end=\"985\"><li data-start=\"751\" data-end=\"810\"><p data-start=\"753\" data-end=\"810\">Gạo lứt ng&acirc;m trước 6&ndash;8 tiếng, nấu ch&iacute;n bằng nồi cơm điện.</p></li><li data-start=\"811\" data-end=\"864\"><p data-start=\"813\" data-end=\"864\">Nấm đ&ocirc;ng c&ocirc; v&agrave; nấm m&egrave;o ng&acirc;m nở, rửa sạch, th&aacute;i nhỏ.</p></li><li data-start=\"865\" data-end=\"914\"><p data-start=\"867\" data-end=\"914\">Ớt chu&ocirc;ng, h&agrave;nh boaro cắt sợi; gừng băm nhuyễn.</p></li><li data-start=\"915\" data-end=\"949\"><p data-start=\"917\" data-end=\"949\">Hạt sen luộc ch&iacute;n mềm, để ri&ecirc;ng.</p></li><li data-start=\"950\" data-end=\"985\"><p data-start=\"952\" data-end=\"985\">Đậu hũ v&agrave; ham chay cắt miếng nhỏ.</p></li></ul><h4 data-start=\"987\" data-end=\"1022\">???? <strong data-start=\"995\" data-end=\"1022\">Bước 2: X&agrave;o nguy&ecirc;n liệu</strong></h4><ul data-start=\"1023\" data-end=\"1233\"><li data-start=\"1023\" data-end=\"1068\"><p data-start=\"1025\" data-end=\"1068\">Phi thơm h&agrave;nh boaro + gừng với ch&uacute;t dầu ăn.</p></li><li data-start=\"1069\" data-end=\"1125\"><p data-start=\"1071\" data-end=\"1125\">Cho ham chay, đậu hũ, nấm, ớt chu&ocirc;ng, hạt sen v&agrave;o x&agrave;o.</p></li><li data-start=\"1126\" data-end=\"1192\"><p data-start=\"1128\" data-end=\"1192\">N&ecirc;m gia vị: muối, ti&ecirc;u, tương c&agrave;, tương ớt, dầu m&egrave;, &iacute;t sữa tươi.</p></li><li data-start=\"1193\" data-end=\"1233\"><p data-start=\"1195\" data-end=\"1233\">Trộn đều, rim lửa nhỏ 5 ph&uacute;t cho thấm.</p></li></ul><h4 data-start=\"1235\" data-end=\"1263\">???? <strong data-start=\"1243\" data-end=\"1263\">Bước 3: Trộn cơm</strong></h4><ul data-start=\"1264\" data-end=\"1364\"><li data-start=\"1264\" data-end=\"1321\"><p data-start=\"1266\" data-end=\"1321\">Cho cơm gạo lứt v&agrave;o chảo nguy&ecirc;n liệu, đảo đều 3&ndash;5 ph&uacute;t.</p></li><li data-start=\"1322\" data-end=\"1364\"><p data-start=\"1324\" data-end=\"1364\">Tắt bếp, rắc m&egrave; trắng, trang tr&iacute; ng&ograve; r&iacute;.</p></li></ul><h4 data-start=\"1366\" data-end=\"1430\">???? <strong data-start=\"1374\" data-end=\"1386\">D&ugrave;ng k&egrave;m</strong>: Dưa cải chua để tăng vị chua mặn tự nhi&ecirc;n.</h4>', NULL, 2, 2, 'uploads/videos/com gao luc tron.mp4', NULL),
(18, 'ưjdk', 'uploads/images/image_6861780bb72a3.png', 1, 'de', 322, '<p>smsdkklkcjkjcbjbj</p><p>sdsdsdjkcdkcdk</p><p>smsdlkcjclj sudio</p>', NULL, 5, 5, NULL, 'dfiddoscn'),
(19, 'dùiio', 'uploads/images/image_686182d1afbb2.jpg', 2, 'kho', 378, '<p>ứnkdshkchjd</p><p>skjcuicuiuisos</p><p>djdsdicdiucu</p>', NULL, 6, 7, NULL, 'dhdhjcjc subdud');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `monan_chedo`
--

CREATE TABLE `monan_chedo` (
  `ma_monan` int(11) NOT NULL,
  `ma_chedo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `monan_danhmuc`
--

CREATE TABLE `monan_danhmuc` (
  `ma_monan` int(11) NOT NULL,
  `ma_danhmuc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `monan_danhmuc`
--

INSERT INTO `monan_danhmuc` (`ma_monan`, `ma_danhmuc`) VALUES
(9, 6),
(10, 6),
(11, 6),
(13, 6),
(14, 6),
(15, 1),
(15, 6),
(16, 1),
(16, 6),
(18, 5),
(19, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `monan_dinhduong`
--

CREATE TABLE `monan_dinhduong` (
  `ma_monan` int(11) NOT NULL,
  `ma_dinhduong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `monan_nguyenlieu`
--

CREATE TABLE `monan_nguyenlieu` (
  `ma_monan` int(11) NOT NULL,
  `ma_nguyenlieu` int(11) NOT NULL,
  `so_gram` decimal(10,2) DEFAULT NULL,
  `don_vi` varchar(10) DEFAULT 'g'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `monan_nguyenlieu`
--

INSERT INTO `monan_nguyenlieu` (`ma_monan`, `ma_nguyenlieu`, `so_gram`, `don_vi`) VALUES
(9, 6, 50.00, 'g'),
(9, 7, 20.00, 'g'),
(9, 11, 30.00, 'g'),
(9, 16, 5.00, 'g'),
(9, 71, 150.00, 'g'),
(9, 72, 40.00, 'g'),
(10, 7, 30.00, 'g'),
(10, 25, 15.00, 'g'),
(10, 29, 120.00, 'g'),
(10, 31, 10.00, 'g'),
(10, 60, 40.00, 'g'),
(10, 61, 25.00, 'g'),
(10, 62, 20.00, 'g'),
(10, 64, 20.00, 'g'),
(10, 65, 80.00, 'g'),
(11, 4, 25.00, 'g'),
(11, 16, NULL, 'g'),
(11, 24, 7.50, 'g'),
(11, 27, 125.00, 'g'),
(11, 28, 50.00, 'g'),
(11, 29, 250.00, 'g'),
(11, 31, 2.50, 'g'),
(11, 75, 25.00, 'g'),
(13, 4, 50.00, 'g'),
(13, 16, 50.00, 'g'),
(13, 24, NULL, 'g'),
(13, 32, 150.00, 'g'),
(13, 33, 50.00, 'g'),
(13, 34, NULL, 'g'),
(13, 35, 12.50, 'g'),
(13, 62, 25.00, 'g'),
(13, 76, NULL, 'g'),
(14, 16, NULL, 'g'),
(14, 30, 10.00, 'g'),
(14, 37, 330.00, 'g'),
(14, 39, NULL, 'g'),
(14, 40, NULL, 'g'),
(14, 50, 5.00, 'g'),
(15, 31, NULL, 'g'),
(15, 41, NULL, 'g'),
(15, 42, NULL, 'g'),
(15, 43, NULL, 'g'),
(16, 14, NULL, 'g'),
(16, 16, NULL, 'g'),
(16, 44, NULL, 'g'),
(16, 45, NULL, 'g'),
(16, 46, NULL, 'g'),
(16, 47, NULL, 'g'),
(16, 48, NULL, 'g'),
(16, 49, NULL, 'g'),
(16, 50, NULL, 'g'),
(16, 51, NULL, 'g'),
(16, 52, NULL, 'g'),
(18, 13, 35.00, 'g'),
(18, 55, 23.00, 'g'),
(19, 15, 33.00, 'g'),
(19, 26, 238.00, 'g');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `monan_thanhphandinhduong`
--

CREATE TABLE `monan_thanhphandinhduong` (
  `ma_monan` int(11) NOT NULL,
  `ma_thanhphan` int(11) NOT NULL,
  `phantram` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `monan_thanhphandinhduong`
--

INSERT INTO `monan_thanhphandinhduong` (`ma_monan`, `ma_thanhphan`, `phantram`) VALUES
(9, 1, 10.00),
(9, 2, 50.00),
(9, 3, 5.00),
(9, 5, 3.00),
(9, 6, 5.00),
(9, 7, 4.00),
(10, 1, 18.00),
(10, 2, 55.00),
(10, 3, 7.00),
(10, 5, 12.00),
(10, 6, 10.00),
(10, 7, 5.00),
(11, 1, 25.00),
(11, 2, 45.00),
(11, 3, 6.00),
(11, 5, 3.00),
(11, 6, 8.00),
(11, 7, 6.00),
(13, 1, 30.00),
(13, 2, 25.00),
(13, 3, 6.00),
(13, 5, 3.00),
(13, 6, 5.00),
(13, 7, 5.00),
(14, 1, 40.00),
(14, 2, 30.00),
(14, 3, 5.00),
(14, 5, 3.00),
(14, 6, 15.00),
(14, 7, 3.00),
(15, 1, 55.88),
(15, 2, 13.88),
(15, 3, 5.15),
(15, 5, 2.76),
(15, 6, 40.38),
(15, 7, 6.45),
(16, 1, 59.74),
(16, 2, 128.30),
(16, 3, 5.90),
(16, 5, 5.47),
(16, 6, 28.58),
(16, 7, 11.46),
(18, 1, 12.00),
(18, 2, 38.00),
(18, 3, 32.00),
(18, 5, 23.00),
(18, 6, 21.00),
(18, 7, 30.00),
(19, 1, 27.00),
(19, 2, 10.00),
(19, 3, 20.00),
(19, 5, 26.00),
(19, 6, 29.00),
(19, 7, 37.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoidung`
--

CREATE TABLE `nguoidung` (
  `ma_nguoidung` int(11) NOT NULL,
  `ten_dangnhap` varchar(50) NOT NULL,
  `ho_ten` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `sdt` varchar(15) DEFAULT NULL,
  `mat_khau` varchar(255) NOT NULL,
  `vai_tro` enum('admin','nguoidung') NOT NULL DEFAULT 'nguoidung',
  `tuoi` int(11) DEFAULT NULL CHECK (`tuoi` >= 1 and `tuoi` <= 150),
  `chieu_cao` float DEFAULT NULL CHECK (`chieu_cao` >= 50 and `chieu_cao` <= 300),
  `can_nang` float DEFAULT NULL CHECK (`can_nang` >= 20 and `can_nang` <= 300),
  `gioi_tinh` enum('Nam','Nữ','Khác') DEFAULT 'Khác',
  `tinh_trang` varchar(50) DEFAULT 'Bình thường'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nguoidung`
--

INSERT INTO `nguoidung` (`ma_nguoidung`, `ten_dangnhap`, `ho_ten`, `email`, `sdt`, `mat_khau`, `vai_tro`, `tuoi`, `chieu_cao`, `can_nang`, `gioi_tinh`, `tinh_trang`) VALUES
(1, 'admin1', 'Nguyen Van A', 'lethingochan227tv@gmail.com', '0123456789', 'admin123', 'admin', NULL, NULL, NULL, 'Khác', 'Bình thường'),
(2, 'user1', 'Tran Thi A', 'user1@example.com', '0987654321', 'user123', 'nguoidung', 30, 165, 55, 'Khác', 'Tiểu đường'),
(3, 'NgocHan123', 'Lê Thị Ngọc Hân', 'iamngochan0111@gmail.com', '0393473484', '123456', 'nguoidung', 22, 157, 45, 'Nữ', 'Bình thường'),
(5, 'Huynh112', 'Lê Thị Ngọc Huỳnh', 'huynh12@gmail.com', '0812003469', '234', 'nguoidung', 18, 160, 50, 'Nữ', 'Bình thường'),
(6, 'Thuong0704', 'Nguyễn Hoàng Thương', 'nguyenhoangthuong@gmail.com', '0823727376', '07042003', 'nguoidung', 22, 170, 53, 'Nam', 'Bình thường'),
(7, 'QuyenNgo', 'Ngô Thanh Quyền', 'quyenngo@gmail.com', '0328393892', '112233', 'nguoidung', 22, 160, 45, 'Nam', 'Bình thường'),
(12, 'Anh223', 'Nguyễn Ngọc Ánh', 'lehan970331@gmail.com', '0828382381', '221144', 'nguoidung', 25, 170, 53, 'Nữ', 'Huyết áp thấp');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguyenlieu`
--

CREATE TABLE `nguyenlieu` (
  `ma_nguyenlieu` int(11) NOT NULL,
  `ten_nguyenlieu` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nguyenlieu`
--

INSERT INTO `nguyenlieu` (`ma_nguyenlieu`, `ten_nguyenlieu`) VALUES
(1, 'Gạo'),
(2, 'Thịt gà'),
(3, 'Rau cải'),
(4, 'Cà chua'),
(5, 'Chả lụa chay'),
(6, 'Đậu hũ'),
(7, 'Cà rốt'),
(8, 'Su hào'),
(9, 'Bắp mỹ'),
(10, 'Củ cải trắng'),
(11, 'Nấm rơm'),
(12, 'Tàu hũ ky chiên giòn'),
(13, 'Bánh canh bột lọc'),
(14, 'Hành boaro'),
(15, 'Bột năng'),
(16, 'Rau nêm(Rau ngò, hành lá, ngò rí)'),
(17, 'Bí đỏ'),
(20, 'Nấm đông cô tươi'),
(21, 'Cải bó xôi'),
(23, 'Hành tây'),
(24, 'Ớt sừng'),
(25, 'Đậu phộng rang'),
(26, 'Bún khô'),
(27, 'Cá kèo'),
(28, 'Thơm'),
(29, 'Bún tươi'),
(30, 'Sả'),
(31, 'Hành tím'),
(32, 'Cá lóc'),
(33, 'Bạc hà'),
(34, 'Giá'),
(35, 'Me vắt'),
(36, 'Tỏi phi'),
(37, 'Đùi ếch tươi to'),
(38, 'Ngò gai'),
(39, 'Mè đen'),
(40, 'Xà lách'),
(41, 'Sườn non'),
(42, 'Bí đao'),
(43, 'Ngò rí'),
(44, 'Gạo lứt'),
(45, 'Đậu hũ chiên'),
(46, 'Hạt sen'),
(47, 'Nấm đông cô khô'),
(48, 'Nấm mèo'),
(49, 'Ớt chuông'),
(50, 'Gừng'),
(51, 'Mè trắng rang'),
(52, 'Sữa tươi không đường'),
(53, 'Dưa cải chua'),
(55, 'Bánh canh bột gạo'),
(57, 'Lá lốt'),
(58, 'djkd'),
(60, 'Dưa leo'),
(61, 'Bắp cải tím'),
(62, 'Giá đỗ'),
(64, 'Rau sống (xà lách, húng quế, rau mùi)'),
(65, 'Thịt heo ba chỉ'),
(66, 'Củ dền'),
(67, 'Miến dong, phở tươi, bánh hỏi'),
(68, 'Bí đỏ, ớt chuông'),
(69, 'Bầu non, bí non, rau muống'),
(70, 'Ức gà, tôm, thịt bò'),
(71, 'Bánh canh tươi'),
(72, 'Nấm đùi gà'),
(73, 'Bánh phở hoặc miến dong'),
(74, 'Rau đắng'),
(75, 'Lá giang'),
(76, 'Tỏi băm'),
(77, 'Ớt sa tế'),
(78, 'Cá basa, cá diêu hồng'),
(79, 'Bột chiên giòn'),
(80, 'Ức gà, phi lê cá basa');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguyenlieu_thaythe`
--

CREATE TABLE `nguyenlieu_thaythe` (
  `id` int(11) NOT NULL,
  `ma_monan` int(11) NOT NULL,
  `ma_nguyenlieu_chinh` int(11) NOT NULL,
  `ma_nguyenlieu_thaythe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nguyenlieu_thaythe`
--

INSERT INTO `nguyenlieu_thaythe` (`id`, `ma_monan`, `ma_nguyenlieu_chinh`, `ma_nguyenlieu_thaythe`) VALUES
(12, 19, 26, 58),
(13, 18, 55, 57),
(14, 18, 13, 55),
(22, 9, 71, 73),
(23, 10, 61, 66),
(24, 10, 29, 67),
(25, 10, 7, 68),
(26, 10, 60, 69),
(27, 10, 65, 70),
(28, 13, 32, 78),
(29, 14, 37, 80);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `ma_nguoidung` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `is_read` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `notifications`
--

INSERT INTO `notifications` (`id`, `ma_nguoidung`, `message`, `created_at`, `is_read`) VALUES
(1, 1, 'Người dùng NgocHan123 đã thêm bình luận mới cho món ăn Canh chua.', '2025-05-26 19:50:49', 0),
(2, 3, 'Admin đã trả lời bình luận của bạn về món ăn.', '2025-05-26 19:51:34', 0),
(3, 1, 'Người dùng NgocHan123 đã thêm bình luận mới cho món ăn Bánh canh chay.', '2025-06-02 02:12:24', 0),
(4, 1, 'Người dùng user1 đã thêm bình luận mới cho món ăn Bánh canh chay.', '2025-06-04 23:06:27', 0),
(5, 1, 'Người dùng NgocHan123 đã thêm bình luận mới cho món ăn Bánh canh chay.', '2025-06-16 07:34:11', 0),
(6, 1, 'Người dùng NgocHan123 đã thêm bình luận mới cho món ăn Bún trộn ngũ sắc.', '2025-06-27 06:04:04', 0),
(7, 1, 'Người dùng NgocHan123 đã thêm bình luận mới cho món ăn Bún trộn ngũ sắc.', '2025-06-29 01:45:29', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `preservation`
--

CREATE TABLE `preservation` (
  `id` int(11) NOT NULL,
  `dish_id` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `ghi_chu` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `preservation`
--

INSERT INTO `preservation` (`id`, `dish_id`, `content`, `ghi_chu`) VALUES
(9, 10, '<h3 data-start=\"131\" data-end=\"170\" id=\"isPasted\"><strong data-start=\"138\" data-end=\"170\">V&igrave; sao tốt cho giảm c&acirc;n?</strong></h3><p data-start=\"171\" data-end=\"219\">✅ <strong data-start=\"173\" data-end=\"217\">a) Nhiều rau, &iacute;t b&uacute;n &rarr; Giảm calorie tổng</strong></p><p data-start=\"222\" data-end=\"309\">&nbsp; Rau củ (c&agrave; rốt, bắp cải t&iacute;m, dưa leo, gi&aacute; đỗ) chiếm đến 50&ndash;60% khối lượng m&oacute;n ăn.</p><p data-start=\"312\" data-end=\"414\">&nbsp; Rau nhiều chất xơ gi&uacute;p bạn no l&acirc;u, &iacute;t đ&oacute;i nhưng gần như kh&ocirc;ng cung cấp nhiều năng lượng.</p><p data-start=\"417\" data-end=\"524\">&nbsp; B&uacute;n (tinh bột) chỉ ~120g n&ecirc;n Carb kh&ocirc;ng qu&aacute; cao (~55g), thấp hơn so với ăn cơm/b&uacute;n b&ograve; huế (~90&ndash;100g).</p><p data-start=\"526\" data-end=\"560\">✅ <strong data-start=\"528\" data-end=\"558\">b) Chất b&eacute;o tốt, &iacute;t dầu mỡ</strong></p><p>&nbsp; M&oacute;n n&agrave;y kh&ocirc;ng chi&ecirc;n/x&agrave;o nhiều dầu, chỉ c&oacute; ch&uacute;t h&agrave;nh phi (~5&ndash;10g dầu).</p><p>&nbsp; Đậu phộng cung cấp <strong data-start=\"656\" data-end=\"682\">chất b&eacute;o kh&ocirc;ng b&atilde;o h&ograve;a</strong>, tốt cho tim mạch v&agrave; kh&ocirc;ng g&acirc;y t&iacute;ch mỡ bụng.</p><p data-start=\"731\" data-end=\"768\">✅ <strong data-start=\"733\" data-end=\"766\">c) Đạm vừa đủ để kh&ocirc;ng mất cơ</strong></p><p data-start=\"771\" data-end=\"862\">&nbsp; Thịt nạc/ức g&agrave; cung cấp 18&ndash;20g protein &rarr; đủ để duy tr&igrave; cơ bắp trong khi giảm c&acirc;n.</p><p data-start=\"865\" data-end=\"1001\">&nbsp; Nếu thay thịt ba chỉ bằng ức g&agrave; luộc hoặc t&ocirc;m th&igrave; lượng chất b&eacute;o giảm mạnh (~5g fat/m&oacute;n), calorie giảm xuống c&ograve;n 300&ndash;350 kcal.</p><p data-start=\"1003\" data-end=\"1048\">✅ <strong data-start=\"1005\" data-end=\"1046\">d) &Iacute;t đường, &iacute;t muối &rarr; Kh&ocirc;ng giữ nước</strong></p><p data-start=\"1051\" data-end=\"1166\">&nbsp; Đường chỉ c&oacute; trong phần nước mắm pha (~5&ndash;6g). Nếu giảm đường đi, m&oacute;n n&agrave;y kh&ocirc;ng l&agrave;m tăng đường huyết đột ngột.</p><p data-start=\"1169\" data-end=\"1278\">&nbsp; &Iacute;t muối hơn so với c&aacute;c m&oacute;n mặn kh&aacute;c (v&iacute; dụ b&uacute;n ri&ecirc;u, hủ tiếu). Giảm nguy cơ t&iacute;ch nước g&acirc;y tăng c&acirc;n giả.</p>', NULL),
(10, 9, '<p data-start=\"3624\" data-end=\"3653\" id=\"isPasted\">✅ <strong data-start=\"3626\" data-end=\"3638\">Giảm c&acirc;n</strong>: <strong data-start=\"3640\" data-end=\"3651\">Rất tốt</strong></p><ul data-start=\"3654\" data-end=\"3815\"><li data-start=\"3654\" data-end=\"3716\"><p data-start=\"3656\" data-end=\"3716\">&nbsp; &Iacute;t dầu mỡ, nhiều nấm v&agrave; rau &rarr; năng lượng thấp (~300 kcal).</p></li><li data-start=\"3717\" data-end=\"3763\"><p data-start=\"3719\" data-end=\"3763\">&nbsp; B&aacute;nh canh tươi chứa &iacute;t carb hơn cơm/trứng.</p></li><li data-start=\"3764\" data-end=\"3815\"><p data-start=\"3766\" data-end=\"3815\">&nbsp; Nấm v&agrave; đậu hũ gi&agrave;u đạm thực vật, hỗ trợ no l&acirc;u.</p></li></ul>', NULL),
(11, 11, '<p>C&aacute; k&egrave;o chứa <strong data-start=\"3794\" data-end=\"3814\" id=\"isPasted\">sắt, vitamin B12</strong>, hỗ trợ t&aacute;i tạo hồng cầu.</p><ul><li data-start=\"3665\" data-end=\"3713\" id=\"isPasted\"><p data-start=\"3667\" data-end=\"3713\">L&aacute; giang gi&uacute;p <strong data-start=\"3681\" data-end=\"3710\">thanh nhiệt, giải độc gan</strong>.</p></li><li data-start=\"3714\" data-end=\"3754\"><p data-start=\"3716\" data-end=\"3754\">C&aacute; k&egrave;o &iacute;t mỡ, tốt cho người gan yếu.</p></li></ul>', NULL),
(12, 14, '<p data-start=\"5884\" data-end=\"5922\" id=\"isPasted\"><strong data-start=\"5886\" data-end=\"5907\">Hỗ trợ xương khớp</strong>: <strong data-start=\"5909\" data-end=\"5920\">Rất tốt</strong></p><ul data-start=\"5923\" data-end=\"5975\"><li data-start=\"5923\" data-end=\"5975\"><p data-start=\"5925\" data-end=\"5975\">Gi&agrave;u <strong data-start=\"5930\" data-end=\"5948\">canxi, phospho</strong>, hỗ trợ xương chắc khỏe.</p></li></ul>', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `search_history`
--

CREATE TABLE `search_history` (
  `id` int(11) NOT NULL,
  `search_query` varchar(255) NOT NULL,
  `search_count` int(11) DEFAULT 1,
  `last_searched` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `search_history`
--

INSERT INTO `search_history` (`id`, `search_query`, `search_count`, `last_searched`) VALUES
(1, 'đùi, ếch, cá, kèo', 2, '2025-07-02 19:13:25'),
(3, 'gà, cà, chua, khoai, tây', 2, '2025-07-02 19:13:35');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thanhphandinhduong`
--

CREATE TABLE `thanhphandinhduong` (
  `ma_thanhphan` int(11) NOT NULL,
  `ten_thanhphan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `thanhphandinhduong`
--

INSERT INTO `thanhphandinhduong` (`ma_thanhphan`, `ten_thanhphan`) VALUES
(1, 'Protein'),
(2, 'Carbohydrate'),
(3, 'Vitamin'),
(5, 'Khoáng chất'),
(6, 'Chất béo'),
(7, 'Đường');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_menus`
--

CREATE TABLE `user_menus` (
  `id` int(11) NOT NULL,
  `ma_nguoidung` int(11) NOT NULL,
  `date` date NOT NULL,
  `meal` varchar(50) NOT NULL,
  `dishes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`dishes`)),
  `calories` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user_menus`
--

INSERT INTO `user_menus` (`id`, `ma_nguoidung`, `date`, `meal`, `dishes`, `calories`, `created_at`) VALUES
(2, 3, '2025-05-27', 'Trưa', '[\"5\"]', 437, '2025-05-27 23:27:43'),
(3, 3, '2025-05-27', 'Sáng', '[\"5\"]', 437, '2025-05-27 23:28:02'),
(4, 3, '2025-05-27', 'Chiều', '[\"7\"]', 244, '2025-05-27 23:28:46'),
(5, 3, '2025-05-27', 'Tối', '[\"5\"]', 437, '2025-05-27 23:28:55'),
(6, 3, '2025-05-27', 'Tối', '[\"8\"]', 452, '2025-05-27 23:29:13'),
(8, 3, '2025-05-27', 'Sáng', '[\"4\"]', 420, '2025-05-27 23:38:51'),
(9, 3, '2025-05-28', 'Trưa', '[\"5\"]', 437, '2025-05-28 01:13:29'),
(11, 3, '2025-05-28', 'Sáng', '[\"4\"]', 420, '2025-05-29 03:20:55'),
(12, 3, '2025-05-28', 'Sáng', '[\"8\"]', 452, '2025-05-29 03:21:13'),
(13, 3, '2025-06-02', 'Sáng', '[\"10\"]', 178, '2025-06-02 08:59:58'),
(17, 3, '2025-06-03', 'Sáng', '[\"16\"]', 288, '2025-06-02 09:03:32'),
(18, 3, '2025-05-27', 'Sáng', '[\"10\"]', 178, '2025-06-04 02:33:29'),
(19, 3, '2025-05-28', 'Chiều', '[\"10\"]', 178, '2025-06-04 03:45:08'),
(21, 3, '2025-06-03', 'Sáng', '[\"9\"]', 136, '2025-06-04 23:30:50'),
(25, 3, '2025-06-04', 'Sáng', '[\"13\",\"11\"]', 478, '2025-06-04 23:48:22'),
(27, 3, '2025-06-03', 'Trưa', '[\"13\"]', 133, '2025-06-06 06:56:03'),
(28, 3, '2025-06-02', 'Trưa', '[\"15\",\"14\"]', 321, '2025-06-13 06:39:44'),
(29, 3, '2025-06-02', 'Chiều', '[\"16\",\"11\"]', 633, '2025-06-13 06:40:07'),
(30, 3, '2025-06-05', 'Sáng', '[\"10\"]', 178, '2025-06-13 07:11:25'),
(31, 3, '2025-06-05', 'Trưa', '[\"13\"]', 133, '2025-06-13 07:11:37'),
(32, 3, '2025-06-05', 'Chiều', '[\"11\"]', 345, '2025-06-13 07:11:51'),
(33, 3, '2025-06-06', 'Sáng', '[\"9\"]', 136, '2025-06-13 07:12:07'),
(34, 3, '2025-06-06', 'Trưa', '[\"15\",\"14\"]', 321, '2025-06-13 07:12:23'),
(35, 3, '2025-06-06', 'Chiều', '[\"10\"]', 178, '2025-06-13 07:12:37'),
(36, 3, '2025-06-07', 'Sáng', '[\"10\"]', 178, '2025-06-13 07:12:56'),
(37, 3, '2025-06-07', 'Trưa', '[\"16\"]', 288, '2025-06-13 07:13:05'),
(38, 3, '2025-06-07', 'Chiều', '[\"13\"]', 133, '2025-06-13 07:13:14'),
(39, 3, '2025-06-08', 'Sáng', '[\"10\"]', 178, '2025-06-13 07:13:40'),
(40, 3, '2025-06-08', 'Trưa', '[\"15\"]', 143, '2025-06-13 07:13:46'),
(41, 3, '2025-06-08', 'Chiều', '[\"16\"]', 288, '2025-06-13 07:13:54'),
(42, 3, '2025-06-09', 'Sáng', '[\"13\"]', 133, '2025-06-13 07:14:13'),
(43, 3, '2025-06-09', 'Trưa', '[\"15\"]', 143, '2025-06-13 07:14:23'),
(44, 3, '2025-06-09', 'Chiều', '[\"11\"]', 345, '2025-06-13 07:14:30'),
(45, 3, '2025-07-01', 'Sáng', '[13]', 133, '2025-07-02 02:50:34'),
(46, 3, '2025-07-01', 'Trưa', '[15,13,16]', 564, '2025-07-02 02:50:46'),
(47, 3, '2025-07-01', 'Chiều', '[10,15,11]', 666, '2025-07-02 02:51:03');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chedo`
--
ALTER TABLE `chedo`
  ADD PRIMARY KEY (`ma_chedo`);

--
-- Chỉ mục cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`ma_danhmuc`);

--
-- Chỉ mục cho bảng `dinhduong`
--
ALTER TABLE `dinhduong`
  ADD PRIMARY KEY (`ma_dinhduong`);

--
-- Chỉ mục cho bảng `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ma_nguoidung` (`ma_nguoidung`,`ma_monan`),
  ADD KEY `ma_monan` (`ma_monan`);

--
-- Chỉ mục cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ma_nguoidung` (`ma_nguoidung`),
  ADD KEY `ma_monan` (`ma_monan`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Chỉ mục cho bảng `menu_suggestions`
--
ALTER TABLE `menu_suggestions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `preservation_id` (`preservation_id`);

--
-- Chỉ mục cho bảng `monan`
--
ALTER TABLE `monan`
  ADD PRIMARY KEY (`ma_monan`),
  ADD KEY `fk_monan_danhmuc` (`ma_danhmuc`),
  ADD KEY `fk_monan_chedo` (`ma_chedo`),
  ADD KEY `fk_monan_dinhduong` (`ma_dinhduong`);

--
-- Chỉ mục cho bảng `monan_chedo`
--
ALTER TABLE `monan_chedo`
  ADD PRIMARY KEY (`ma_monan`,`ma_chedo`),
  ADD KEY `ma_chedo` (`ma_chedo`);

--
-- Chỉ mục cho bảng `monan_danhmuc`
--
ALTER TABLE `monan_danhmuc`
  ADD PRIMARY KEY (`ma_monan`,`ma_danhmuc`),
  ADD KEY `ma_danhmuc` (`ma_danhmuc`);

--
-- Chỉ mục cho bảng `monan_dinhduong`
--
ALTER TABLE `monan_dinhduong`
  ADD PRIMARY KEY (`ma_monan`,`ma_dinhduong`),
  ADD KEY `ma_dinhduong` (`ma_dinhduong`);

--
-- Chỉ mục cho bảng `monan_nguyenlieu`
--
ALTER TABLE `monan_nguyenlieu`
  ADD PRIMARY KEY (`ma_monan`,`ma_nguyenlieu`),
  ADD KEY `ma_nguyenlieu` (`ma_nguyenlieu`);

--
-- Chỉ mục cho bảng `monan_thanhphandinhduong`
--
ALTER TABLE `monan_thanhphandinhduong`
  ADD PRIMARY KEY (`ma_monan`,`ma_thanhphan`),
  ADD KEY `ma_thanhphan` (`ma_thanhphan`);

--
-- Chỉ mục cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`ma_nguoidung`),
  ADD UNIQUE KEY `ten_dangnhap` (`ten_dangnhap`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Chỉ mục cho bảng `nguyenlieu`
--
ALTER TABLE `nguyenlieu`
  ADD PRIMARY KEY (`ma_nguyenlieu`);

--
-- Chỉ mục cho bảng `nguyenlieu_thaythe`
--
ALTER TABLE `nguyenlieu_thaythe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ma_monan` (`ma_monan`),
  ADD KEY `ma_nguyenlieu_chinh` (`ma_nguyenlieu_chinh`),
  ADD KEY `ma_nguyenlieu_thaythe` (`ma_nguyenlieu_thaythe`);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ma_nguoidung` (`ma_nguoidung`);

--
-- Chỉ mục cho bảng `preservation`
--
ALTER TABLE `preservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dish_id` (`dish_id`);

--
-- Chỉ mục cho bảng `search_history`
--
ALTER TABLE `search_history`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `search_query` (`search_query`);

--
-- Chỉ mục cho bảng `thanhphandinhduong`
--
ALTER TABLE `thanhphandinhduong`
  ADD PRIMARY KEY (`ma_thanhphan`);

--
-- Chỉ mục cho bảng `user_menus`
--
ALTER TABLE `user_menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ma_nguoidung` (`ma_nguoidung`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `chedo`
--
ALTER TABLE `chedo`
  MODIFY `ma_chedo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `ma_danhmuc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `dinhduong`
--
ALTER TABLE `dinhduong`
  MODIFY `ma_dinhduong` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `menu_suggestions`
--
ALTER TABLE `menu_suggestions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT cho bảng `monan`
--
ALTER TABLE `monan`
  MODIFY `ma_monan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `ma_nguoidung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `nguyenlieu`
--
ALTER TABLE `nguyenlieu`
  MODIFY `ma_nguyenlieu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT cho bảng `nguyenlieu_thaythe`
--
ALTER TABLE `nguyenlieu_thaythe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `preservation`
--
ALTER TABLE `preservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `search_history`
--
ALTER TABLE `search_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `thanhphandinhduong`
--
ALTER TABLE `thanhphandinhduong`
  MODIFY `ma_thanhphan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `user_menus`
--
ALTER TABLE `user_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`ma_nguoidung`) REFERENCES `nguoidung` (`ma_nguoidung`),
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`ma_monan`) REFERENCES `monan` (`ma_monan`);

--
-- Các ràng buộc cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`ma_nguoidung`) REFERENCES `nguoidung` (`ma_nguoidung`) ON DELETE CASCADE,
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`ma_monan`) REFERENCES `monan` (`ma_monan`) ON DELETE CASCADE,
  ADD CONSTRAINT `feedback_ibfk_3` FOREIGN KEY (`parent_id`) REFERENCES `feedback` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `menu_suggestions`
--
ALTER TABLE `menu_suggestions`
  ADD CONSTRAINT `menu_suggestions_ibfk_1` FOREIGN KEY (`preservation_id`) REFERENCES `preservation` (`id`);

--
-- Các ràng buộc cho bảng `monan`
--
ALTER TABLE `monan`
  ADD CONSTRAINT `fk_monan_chedo` FOREIGN KEY (`ma_chedo`) REFERENCES `chedo` (`ma_chedo`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_monan_danhmuc` FOREIGN KEY (`ma_danhmuc`) REFERENCES `danhmuc` (`ma_danhmuc`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_monan_dinhduong` FOREIGN KEY (`ma_dinhduong`) REFERENCES `dinhduong` (`ma_dinhduong`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `monan_chedo`
--
ALTER TABLE `monan_chedo`
  ADD CONSTRAINT `monan_chedo_ibfk_1` FOREIGN KEY (`ma_monan`) REFERENCES `monan` (`ma_monan`) ON DELETE CASCADE,
  ADD CONSTRAINT `monan_chedo_ibfk_2` FOREIGN KEY (`ma_chedo`) REFERENCES `chedo` (`ma_chedo`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `monan_danhmuc`
--
ALTER TABLE `monan_danhmuc`
  ADD CONSTRAINT `monan_danhmuc_ibfk_1` FOREIGN KEY (`ma_monan`) REFERENCES `monan` (`ma_monan`) ON DELETE CASCADE,
  ADD CONSTRAINT `monan_danhmuc_ibfk_2` FOREIGN KEY (`ma_danhmuc`) REFERENCES `danhmuc` (`ma_danhmuc`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `monan_dinhduong`
--
ALTER TABLE `monan_dinhduong`
  ADD CONSTRAINT `monan_dinhduong_ibfk_1` FOREIGN KEY (`ma_monan`) REFERENCES `monan` (`ma_monan`) ON DELETE CASCADE,
  ADD CONSTRAINT `monan_dinhduong_ibfk_2` FOREIGN KEY (`ma_dinhduong`) REFERENCES `dinhduong` (`ma_dinhduong`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `monan_nguyenlieu`
--
ALTER TABLE `monan_nguyenlieu`
  ADD CONSTRAINT `monan_nguyenlieu_ibfk_1` FOREIGN KEY (`ma_monan`) REFERENCES `monan` (`ma_monan`) ON DELETE CASCADE,
  ADD CONSTRAINT `monan_nguyenlieu_ibfk_2` FOREIGN KEY (`ma_nguyenlieu`) REFERENCES `nguyenlieu` (`ma_nguyenlieu`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `monan_thanhphandinhduong`
--
ALTER TABLE `monan_thanhphandinhduong`
  ADD CONSTRAINT `monan_thanhphandinhduong_ibfk_1` FOREIGN KEY (`ma_monan`) REFERENCES `monan` (`ma_monan`) ON DELETE CASCADE,
  ADD CONSTRAINT `monan_thanhphandinhduong_ibfk_2` FOREIGN KEY (`ma_thanhphan`) REFERENCES `thanhphandinhduong` (`ma_thanhphan`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `nguyenlieu_thaythe`
--
ALTER TABLE `nguyenlieu_thaythe`
  ADD CONSTRAINT `nguyenlieu_thaythe_ibfk_1` FOREIGN KEY (`ma_monan`) REFERENCES `monan` (`ma_monan`),
  ADD CONSTRAINT `nguyenlieu_thaythe_ibfk_2` FOREIGN KEY (`ma_nguyenlieu_chinh`) REFERENCES `nguyenlieu` (`ma_nguyenlieu`),
  ADD CONSTRAINT `nguyenlieu_thaythe_ibfk_3` FOREIGN KEY (`ma_nguyenlieu_thaythe`) REFERENCES `nguyenlieu` (`ma_nguyenlieu`);

--
-- Các ràng buộc cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`ma_nguoidung`) REFERENCES `nguoidung` (`ma_nguoidung`);

--
-- Các ràng buộc cho bảng `preservation`
--
ALTER TABLE `preservation`
  ADD CONSTRAINT `preservation_ibfk_1` FOREIGN KEY (`dish_id`) REFERENCES `monan` (`ma_monan`);

--
-- Các ràng buộc cho bảng `user_menus`
--
ALTER TABLE `user_menus`
  ADD CONSTRAINT `user_menus_ibfk_1` FOREIGN KEY (`ma_nguoidung`) REFERENCES `nguoidung` (`ma_nguoidung`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
