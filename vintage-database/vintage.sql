-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        11.4.2-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- vintage 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `vintage` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `vintage`;

-- 테이블 vintage.cart_tb 구조 내보내기
CREATE TABLE IF NOT EXISTS `cart_tb` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `fix_cover` varchar(255) DEFAULT NULL,
  `fix_brand` varchar(255) DEFAULT NULL,
  `fix_name` varchar(255) DEFAULT NULL,
  `fix_size` varchar(255) DEFAULT NULL,
  `fix_price` int(255) DEFAULT NULL,
  `fix_discount_rate` double DEFAULT NULL,
  `fix_discount_amount` int(11) DEFAULT NULL,
  `item_uid` int(11) NOT NULL,
  `member_uid` int(11) NOT NULL,
  `order_uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `item_uid` (`item_uid`),
  KEY `member_uid` (`member_uid`),
  KEY `order_uid` (`order_uid`),
  CONSTRAINT `cart_tb_ibfk_1` FOREIGN KEY (`item_uid`) REFERENCES `item_tb` (`uid`),
  CONSTRAINT `cart_tb_ibfk_2` FOREIGN KEY (`member_uid`) REFERENCES `member_tb` (`uid`),
  CONSTRAINT `cart_tb_ibfk_3` FOREIGN KEY (`order_uid`) REFERENCES `order_tb` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 vintage.cart_tb:~0 rows (대략적) 내보내기
DELETE FROM `cart_tb`;

-- 테이블 vintage.comment_tb 구조 내보내기
CREATE TABLE IF NOT EXISTS `comment_tb` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `write_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `modify_date` timestamp NULL DEFAULT NULL,
  `post_uid` int(11) NOT NULL,
  `member_uid` int(11) NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `member_uid` (`member_uid`),
  KEY `comment_tb_ibfk_1` (`post_uid`),
  CONSTRAINT `comment_tb_ibfk_1` FOREIGN KEY (`post_uid`) REFERENCES `post_tb` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_tb_ibfk_2` FOREIGN KEY (`member_uid`) REFERENCES `member_tb` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 vintage.comment_tb:~7 rows (대략적) 내보내기
DELETE FROM `comment_tb`;
INSERT INTO `comment_tb` (`uid`, `content`, `write_date`, `modify_date`, `post_uid`, `member_uid`) VALUES
	(1, '네 직수입 제품입니다.', '2024-08-19 05:41:51', NULL, 2, 1),
	(2, '곧 됩니다.', '2024-08-19 08:18:45', NULL, 9, 1),
	(3, '해드리겠습니다.', '2024-08-19 08:19:01', NULL, 10, 1),
	(4, '알겠습니다.', '2024-08-19 09:31:08', NULL, 11, 1),
	(5, '알아서 하세요. 항상 VINTAGE를 사랑해주셔서 감사드립니다. ^^', '2024-08-19 09:31:28', NULL, 12, 1),
	(6, '있을 수도 있고 없을 수도 있습니다.', '2024-08-19 09:32:29', NULL, 22, 1),
	(7, '의미없는 답변을 해드렸습니다.', '2024-08-20 08:32:26', NULL, 29, 1);

-- 테이블 vintage.coupon_tb 구조 내보내기
CREATE TABLE IF NOT EXISTS `coupon_tb` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `discount_rate` double NOT NULL DEFAULT 1,
  `discount_amount` int(11) NOT NULL DEFAULT 0,
  `member_uid` int(11) NOT NULL,
  `order_uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `member_uid` (`member_uid`),
  KEY `order_uid` (`order_uid`),
  CONSTRAINT `coupon_tb_ibfk_1` FOREIGN KEY (`member_uid`) REFERENCES `member_tb` (`uid`),
  CONSTRAINT `coupon_tb_ibfk_2` FOREIGN KEY (`order_uid`) REFERENCES `order_tb` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 vintage.coupon_tb:~0 rows (대략적) 내보내기
DELETE FROM `coupon_tb`;

-- 테이블 vintage.dibs_tb 구조 내보내기
CREATE TABLE IF NOT EXISTS `dibs_tb` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `item_uid` int(11) NOT NULL,
  `member_uid` int(11) NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `item_uid` (`item_uid`),
  KEY `member_uid` (`member_uid`),
  CONSTRAINT `dibs_tb_ibfk_1` FOREIGN KEY (`item_uid`) REFERENCES `item_tb` (`uid`),
  CONSTRAINT `dibs_tb_ibfk_2` FOREIGN KEY (`member_uid`) REFERENCES `member_tb` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 vintage.dibs_tb:~0 rows (대략적) 내보내기
DELETE FROM `dibs_tb`;

-- 테이블 vintage.item_tb 구조 내보내기
CREATE TABLE IF NOT EXISTS `item_tb` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `cover` varchar(255) NOT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `brand` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `size` varchar(255) DEFAULT NULL,
  `size_detail` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `discount_rate` double NOT NULL DEFAULT 1,
  `discount_amount` int(11) NOT NULL DEFAULT 0,
  `condition` varchar(255) DEFAULT NULL,
  `category1` varchar(255) NOT NULL,
  `category2` varchar(255) DEFAULT NULL,
  `category3` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `display_yn` char(1) NOT NULL DEFAULT 'y',
  `md_yn` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 vintage.item_tb:~96 rows (대략적) 내보내기
DELETE FROM `item_tb`;
INSERT INTO `item_tb` (`uid`, `date`, `cover`, `detail`, `brand`, `name`, `size`, `size_detail`, `price`, `discount_rate`, `discount_amount`, `condition`, `category1`, `category2`, `category3`, `gender`, `display_yn`, `md_yn`) VALUES
	(1, '2024-08-06 04:02:02', 'https://blacktreeshop.com/web/product/big/A/i1480.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1480.jpg', '라퍼지스토어', '페이크 레더 투웨이 자켓', 'M', '68(가슴), 74(기장), 85(팔)', 60000, 0.9, 0, NULL, 'MAN/WOMAN', 'OUTER', '자켓/점퍼', 'MAN', 'y', 'y'),
	(2, '2024-08-06 04:04:48', 'https://blacktreeshop.com/web/product/big/A/i1479.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1479.jpg', 'NOU', '가먼트 다잉 롱 자켓', 'XL', '68(가슴), 74(기장), 85(팔)', 35000, 0.9, 0, NULL, 'MAN/WOMAN', 'OUTER', '자켓/점퍼', NULL, 'y', 'n'),
	(3, '2024-08-06 04:05:42', 'https://blacktreeshop.com/web/product/big/A/i1478.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1478.jpg', '저널 스탠다드', '자켓', 'L', '68(가슴), 74(기장), 85(팔)', 30000, 1, 0, NULL, 'MAN/WOMAN', 'OUTER', '자켓/점퍼', NULL, 'y', 'n'),
	(4, '2024-08-06 04:07:03', 'https://blacktreeshop.com/web/product/big/A/i1451.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1451.jpg', '나이키', '나이츠 스타디움 동계 점퍼', 'M', '68(가슴), 74(기장), 85(팔)', 80000, 1, 0, NULL, 'MAN/WOMAN', 'OUTER', '자켓/점퍼', NULL, 'y', 'n'),
	(5, '2024-08-06 04:09:08', 'https://blacktreeshop.com/web/product/big/A/i1450.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1450.jpg', 'ANGELO GARBASUS', '자켓', 'XL', '68(가슴), 74(기장), 85(팔)', 40000, 0.9, 0, NULL, 'MAN/WOMAN', 'OUTER', '자켓/점퍼', NULL, 'y', 'n'),
	(6, '2024-08-06 04:10:18', 'https://blacktreeshop.com/web/product/big/A/i1449.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1449.jpg', '커스텀멜로우', '자켓', '95', '68(가슴), 74(기장), 85(팔)', 40000, 1, 0, NULL, 'MAN/WOMAN', 'OUTER', '자켓/점퍼', 'MAN', 'y', 'y'),
	(7, '2024-08-06 04:11:13', 'https://blacktreeshop.com/web/product/big/A/i1447.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1447.jpg', '에디 바우어', '자켓', 'L', '68(가슴), 74(기장), 85(팔)', 35000, 1, 0, NULL, 'MAN/WOMAN', 'OUTER', '자켓/점퍼', 'MAN', 'y', 'n'),
	(8, '2024-08-06 04:12:29', 'https://blacktreeshop.com/web/product/big/A/i1446.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1446.jpg', '널디', '져지', 'S', '68(가슴), 74(기장), 85(팔)', 30000, 1, 0, NULL, 'MAN/WOMAN', 'OUTER', '자켓/점퍼', NULL, 'y', 'n'),
	(9, '2024-08-06 04:15:00', 'https://blacktreeshop.com/web/product/big/A/i1381.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1381.jpg', '디미트리 블랙', '코튼 블레이저', '3', '68(가슴), 74(기장), 85(팔)', 35000, 0.9, 0, NULL, 'MAN/WOMAN', 'OUTER', '자켓/점퍼', 'MAN', 'y', 'n'),
	(10, '2024-08-06 04:16:04', 'https://blacktreeshop.com/web/product/big/A/i1343.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1343.jpg', 'US ARMY', 'M65 자켓', 'M', '68(가슴), 74(기장), 85(팔)', 50000, 0.9, 0, NULL, 'MAN/WOMAN', 'OUTER', '자켓/점퍼', 'MAN', 'y', 'n'),
	(11, '2024-08-06 04:17:16', 'https://blacktreeshop.com/web/product/big/A/i1342.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1342.jpg', 'US ARMY', 'M1943 SEMS 자켓', '40R', '68(가슴), 74(기장), 85(팔)', 95000, 0.9, 0, NULL, 'MAN/WOMAN', 'OUTER', '자켓/점퍼', 'MAN', 'y', 'n'),
	(12, '2024-08-06 04:18:52', 'https://blacktreeshop.com/web/product/big/A/i1341.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1341.jpg', '노티카', '자켓', 'XL', '68(가슴), 74(기장), 85(팔)', 35000, 1, 0, NULL, 'MAN/WOMAN', 'OUTER', '자켓/점퍼', 'MAN', 'y', 'n'),
	(13, '2024-08-06 05:05:43', 'https://blacktreeshop.com/web/product/big/A/i1525.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1525.jpg', 'AUGUSTA', '웜업', 'M', '68(가슴), 74(기장), 85(팔)', 20000, 1, 0, NULL, 'MAN/WOMAN', 'OUTER', '바람막이/져지', NULL, 'y', 'n'),
	(14, '2024-08-06 05:06:40', 'https://blacktreeshop.com/web/product/big/202408/d9e763c41925cf27f03fd8d10f081ab5.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1524.jpg', '나이키', '웜업', 'XL', '68(가슴), 74(기장), 85(팔)', 15000, 1, 0, NULL, 'MAN/WOMAN', 'OUTER', '바람막이/져지', NULL, 'y', 'n'),
	(15, '2024-08-06 05:07:39', 'https://blacktreeshop.com/web/product/big/A/i1476.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1476.jpg', '베러 댄 라이프', '부스터 슈트 자켓 XL', 'XL', '68(가슴), 74(기장), 85(팔)', 18000, 1, 0, NULL, 'MAN/WOMAN', 'OUTER', '바람막이/져지', NULL, 'y', 'n'),
	(16, '2024-08-06 05:16:25', 'https://blacktreeshop.com/web/product/big/A/i1475.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1475.jpg', '아식스', '져지', '95', '68(가슴), 74(기장), 85(팔)', 35000, 1, 0, NULL, 'MAN/WOMAN', 'OUTER', '바람막이/져지', NULL, 'y', 'n'),
	(17, '2024-08-06 05:27:45', 'https://blacktreeshop.com/web/product/big/A/i1378.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1378.jpg', '아디다스', '80S 바람막이', 'M', '68(가슴), 74(기장), 85(팔)', 40000, 1, 0, NULL, 'MAN/WOMAN', 'OUTER', '바람막이/져지', NULL, 'y', 'n'),
	(18, '2024-08-06 05:28:46', 'https://blacktreeshop.com/web/product/big/A/i1334.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1334.jpg', '엔비에이', '뉴욕 닉스 바람막이', 'M', '68(가슴), 74(기장), 85(팔)', 30000, 1, 0, NULL, 'MAN/WOMAN', 'OUTER', '바람막이/져지', NULL, 'y', 'n'),
	(19, '2024-08-06 05:29:40', 'https://blacktreeshop.com/web/product/big/A/i1328.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/upload/NNEditor/20240717/i1328.jpg', '푸마', '바람막이', 'L', '68(가슴), 74(기장), 85(팔)', 30000, 1, 0, NULL, 'MAN/WOMAN', 'OUTER', '바람막이/져지', NULL, 'y', 'n'),
	(20, '2024-08-06 05:30:43', 'https://blacktreeshop.com/web/product/big/A/i1578.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1578.jpg', '브루네로 쿠치넬리', '리버시블 코트', '54', '68(가슴), 74(기장), 85(팔)', 2100000, 0.9, 0, NULL, 'MAN/WOMAN', 'OUTER', '코트', 'MAN', 'y', 'y'),
	(21, '2024-08-06 05:35:45', 'https://blacktreeshop.com/web/product/big/A/i1547.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1547.jpg', '앤 드뮐미스터', '코트', 'M', '68(가슴), 74(기장), 85(팔)', 280000, 0.9, 0, NULL, 'MAN/WOMAN', 'OUTER', '코트', 'MAN', 'y', 'y'),
	(22, '2024-08-06 05:36:30', 'https://blacktreeshop.com/web/product/big/A/i609.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i609.jpg', '유니클로', '트렌치 코트', 'XL', '68(가슴), 74(기장), 85(팔)', 65000, 0.9, 0, NULL, 'MAN/WOMAN', 'OUTER', '코트', 'MAN', 'y', 'y'),
	(23, '2024-08-06 05:38:25', 'https://blacktreeshop.com/web/product/big/A/i1549.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1549.jpg', '나이키', '에어로로프트 베스트', 'S', '68(가슴), 74(기장), 85(팔)', 35000, 1, 0, NULL, 'MAN/WOMAN', 'OUTER', '자켓/점퍼', NULL, 'y', 'n'),
	(24, '2024-08-06 05:39:14', 'https://blacktreeshop.com/web/product/big/A/i1548.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1548.jpg', 'WHERE MI', 'USA 레더 자켓', 'L', '68(가슴), 74(기장), 85(팔)', 95000, 1, 0, NULL, 'MAN/WOMAN', 'OUTER', '자켓/점퍼', NULL, 'y', 'y'),
	(25, '2024-08-06 05:42:21', 'https://blacktreeshop.com/web/product/big/A/i1554.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1554.jpg', '나이키', '숏 팬츠', 'M', '34(허리), 32.5(허벅지), 96.8(기장), 19.5(밑단), 37(밑위)', 25000, 1, 0, NULL, 'MAN/WOMAN', 'BOTTOM', '바지', NULL, 'y', 'n'),
	(26, '2024-08-06 05:43:21', 'https://blacktreeshop.com/web/product/big/A/i1552.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1552.jpg', '나미리아', '팬츠', '25', '34(허리), 32.5(허벅지), 96.8(기장), 19.5(밑단), 37(밑위)', 95000, 1, 0, NULL, 'MAN/WOMAN', 'BOTTOM', '바지', 'WOMAN', 'y', 'y'),
	(27, '2024-08-06 05:44:25', 'https://blacktreeshop.com/web/product/big/A/i1551.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1551.jpg', '리바이스', '501 데님 팬츠', '32', '34(허리), 32.5(허벅지), 96.8(기장), 19.5(밑단), 37(밑위)', 25000, 0.9, 0, NULL, 'MAN/WOMAN', 'BOTTOM', '청바지', NULL, 'y', 'n'),
	(28, '2024-08-06 05:45:13', 'https://blacktreeshop.com/web/product/big/A/i1550.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1550.jpg', '리바이스', '550 데님 팬츠', '32', '34(허리), 32.5(허벅지), 96.8(기장), 19.5(밑단), 37(밑위)', 60000, 0.9, 0, NULL, 'MAN/WOMAN', 'BOTTOM', '청바지', NULL, 'y', 'n'),
	(29, '2024-08-06 05:45:51', 'https://blacktreeshop.com/web/product/big/A/i1396.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1396.jpg', '자라', '데님 스커트', '28', '35.5(허리), 91.7(기장)', 20000, 1, 0, NULL, 'MAN/WOMAN', 'BOTTOM', '스커트', 'WOMAN', 'y', 'n'),
	(30, '2024-08-06 05:58:03', 'https://blacktreeshop.com/web/product/big/A/h9761.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/h9761.jpg', '버버리', '노바 체크 플리츠 스커트', '28', '35.5(허리), 91.7(기장)', 159000, 0.9, 0, NULL, 'MAN/WOMAN', 'BOTTOM', '스커트', 'WOMAN', 'y', 'y'),
	(31, '2024-08-06 05:58:46', 'https://blacktreeshop.com/web/product/big/A/h7731.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/h7731.jpg', '자라', '카고 데님 스커트', 'S', '35.5(허리), 91.7(기장)', 38000, 1, 0, NULL, 'MAN/WOMAN', 'BOTTOM', '스커트', 'WOMAN', 'y', 'n'),
	(32, '2024-08-06 05:59:53', 'https://blacktreeshop.com/web/product/big/A/h5087.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/h5087.jpg', 'SOIEGREGE', '스커트', '25', '35.5(허리), 91.7(기장)', 20000, 0.8, 0, NULL, 'MAN/WOMAN', 'BOTTOM', '스커트', 'WOMAN', 'y', 'n'),
	(33, '2024-08-06 06:00:36', 'https://blacktreeshop.com/web/product/big/A/h1469.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/h1469.jpg', 'VINTAGE', '스트라이프 패치워크 스커트', '26', '35.5(허리), 91.7(기장)', 15000, 0.8, 0, NULL, 'MAN/WOMAN', 'BOTTOM', '스커트', 'WOMAN', 'y', 'n'),
	(34, '2024-08-06 06:02:23', 'https://blacktreeshop.com/web/product/big/A/i1463.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1463.jpg', 'VINTAGE', '차콜 린넨 숏 팬츠', 'M', '34(허리), 32.5(허벅지), 96.8(기장), 19.5(밑단), 37(밑위)', 15000, 1, 0, NULL, 'MAN/WOMAN', 'BOTTOM', '바지', NULL, 'y', 'n'),
	(35, '2024-08-06 06:03:50', 'https://blacktreeshop.com/web/product/big/A/i1539.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1539.jpg', '꼼데가르송 플레이', '가디건', 'S', '48.5(어깨), 57.7(가슴), 75(기장), 26.5(팔)', 60000, 1, 0, NULL, 'MAN/WOMAN', 'TOP', '니트/가디건', 'WOMAN', 'y', 'n'),
	(36, '2024-08-06 06:05:23', 'https://blacktreeshop.com/web/product/big/A/i1538.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1538.jpg', '니티드', '가디건', 'L', '48.5(어깨), 57.7(가슴), 75(기장), 26.5(팔)', 30000, 1, 0, NULL, 'MAN/WOMAN', 'TOP', '니트/가디건', NULL, 'y', 'n'),
	(37, '2024-08-06 06:06:47', 'https://blacktreeshop.com/web/product/big/A/i1537.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1537.jpg', '폴로 랄프 로렌', '니트 베스트', '우먼스 S', '48.5(어깨), 57.7(가슴), 75(기장), 26.5(팔)', 80000, 1, 0, NULL, 'MAN/WOMAN', 'TOP', '니트/가디건', 'WOMAN', 'y', 'y'),
	(38, '2024-08-06 06:08:40', 'https://blacktreeshop.com/web/product/big/A/i1439.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1439.jpg', 'LAYRA', '가디건', '우먼스 L', '48.5(어깨), 57.7(가슴), 75(기장), 26.5(팔)', 20000, 1, 0, NULL, 'MAN/WOMAN', 'TOP', '니트/가디건', 'WOMAN', 'y', 'n'),
	(39, '2024-08-06 06:09:52', 'https://blacktreeshop.com/web/product/big/A/i1438.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1438.jpg', '오와이', '니트', 'F', '48.5(어깨), 57.7(가슴), 75(기장), 26.5(팔)', 35000, 1, 0, NULL, 'MAN/WOMAN', 'TOP', '니트/가디건', NULL, 'y', 'n'),
	(40, '2024-08-06 06:11:04', 'https://blacktreeshop.com/web/product/big/A/i1375.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1375.jpg', '스컬프터', '니트', 'S', '48.5(어깨), 57.7(가슴), 75(기장), 26.5(팔)', 20000, 1, 0, NULL, 'MAN/WOMAN', 'TOP', '니트/가디건', 'WOMAN', 'y', 'n'),
	(41, '2024-08-06 06:12:18', 'https://blacktreeshop.com/web/product/big/A/i1556.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1556.jpg', '폴로 랄프 로렌', '가디건', 'KID 4Y', '33(어깨), 36(가슴), 73.5(기장), 36(팔)', 15000, 0.9, 0, NULL, 'KID', NULL, NULL, NULL, 'y', 'n'),
	(42, '2024-08-06 06:16:29', 'https://blacktreeshop.com/web/product/big/A/i1555.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1555.jpg', '아디다스', '트레이닝 셋업', 'KID 85', '31.5(가슴), 41.5(기장), 43.5(팔)', 35000, 1, 0, NULL, 'KID', NULL, NULL, NULL, 'y', 'n'),
	(43, '2024-08-06 06:17:25', 'https://blacktreeshop.com/web/product/big/A/i1400.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1400.jpg', '버버리', '퀄팅 점퍼', 'KID 6Y', '32(어깨), 41(가슴), 43.5(기장)', 45000, 1, 0, NULL, 'KID', NULL, NULL, NULL, 'y', 'n'),
	(44, '2024-08-06 06:17:59', 'https://blacktreeshop.com/web/product/big/A/i1380.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1380.jpg', '나이키 에어 조던', '점퍼', 'KID S', '31.5(가슴), 41.5(기장), 43.5(팔)', 60000, 0.5, 0, NULL, 'KID', NULL, NULL, NULL, 'y', 'n'),
	(45, '2024-08-06 06:18:46', 'https://blacktreeshop.com/web/product/big/A/i1241.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1241.jpg', '뉴발란스', '래쉬가드', 'KID 130', '31.5(가슴), 41.5(기장), 43.5(팔)', 25000, 0.5, 0, NULL, 'KID', NULL, NULL, NULL, 'y', 'n'),
	(46, '2024-08-06 06:19:27', 'https://blacktreeshop.com/web/product/big/A/i1206.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1206.jpg', '폴로 랄프 로렌', '니트 베스트', 'KID 4Y', '33(어깨), 36(가슴), 73.5(기장), 36(팔)', 25000, 0.5, 0, NULL, 'KID', NULL, NULL, NULL, 'y', 'n'),
	(47, '2024-08-06 06:20:03', 'https://blacktreeshop.com/web/product/big/A/i1205.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1205.jpg', '폴로 랄프 로렌', '니트 베스트', 'KID 6Y', '32(어깨), 41(가슴), 43.5(기장)', 25000, 0.5, 0, NULL, 'KID', NULL, NULL, NULL, 'y', 'n'),
	(48, '2024-08-06 06:20:57', 'https://blacktreeshop.com/web/product/big/A/i1204.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1204.jpg', '폴로 랄프 로렌', '가디건', 'KID 6Y', '32(어깨), 41(가슴), 43.5(기장)', 30000, 0.5, 0, NULL, 'KID', NULL, NULL, NULL, 'y', 'y'),
	(49, '2024-08-06 06:21:48', 'https://blacktreeshop.com/web/product/big/A/i1001.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1001.jpg', '폴로 랄프 로렌', '셔츠', 'KID 3Y', '32(어깨), 41(가슴), 43.5(기장)', 25000, 0.5, 0, NULL, 'KID', NULL, NULL, NULL, 'y', 'n'),
	(50, '2024-08-06 06:23:36', 'https://blacktreeshop.com/web/product/big/A/i1409.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1409.jpg', '나이키', '메쉬 캡', NULL, NULL, 40000, 1, 0, NULL, 'ACC', '모자', NULL, NULL, 'y', 'y'),
	(51, '2024-08-06 06:24:38', 'https://blacktreeshop.com/web/product/big/A/i1408.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1408.jpg', '파렌하이트', '메쉬 캡', NULL, NULL, 30000, 1, 0, NULL, 'ACC', '모자', NULL, NULL, 'y', 'n'),
	(52, '2024-08-06 06:25:28', 'https://blacktreeshop.com/web/product/big/A/i1407.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1407.jpg', '벤데이비스', '트러커 캡', NULL, NULL, 30000, 1, 0, NULL, 'ACC', '모자', NULL, NULL, 'y', 'n'),
	(53, '2024-08-06 07:06:22', 'https://blacktreeshop.com/web/product/big/A/i1406.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1406.jpg', '아이 필 럭키', '캡', NULL, NULL, 80000, 0.9, 0, NULL, 'ACC', '모자', NULL, NULL, 'y', 'n'),
	(54, '2024-08-06 07:07:35', 'https://blacktreeshop.com/web/product/big/A/i1361.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1361.jpg', '더 콜디스트 모먼트', '캡', NULL, NULL, 30000, 0.9, 0, NULL, 'ACC', '모자', NULL, NULL, 'y', 'n'),
	(55, '2024-08-06 07:10:25', 'https://blacktreeshop.com/web/product/big/A/i1580.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1580.jpg', '아일랜드 슬리퍼', 'PT223', '9', NULL, 60000, 0.9, 0, NULL, 'ACC', '신발', NULL, NULL, 'y', 'n'),
	(56, '2024-08-06 07:11:11', 'https://blacktreeshop.com/web/product/big/A/i1404.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/upload/NNEditor/20240724/i1404.jpg', '컨버스 X 어 콜드 월', '척 70 하이 스니커즈', '230', NULL, 85000, 1, 0, NULL, 'ACC', '신발', NULL, NULL, 'y', 'n'),
	(57, '2024-08-06 07:12:25', 'https://blacktreeshop.com/web/product/big/A/i1352.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1352.jpg', '컨버스', '척 70 너티컬 트리블럭', '290', NULL, 75000, 1, 0, NULL, 'ACC', '신발', NULL, NULL, 'y', 'n'),
	(58, '2024-08-06 07:14:21', 'https://blacktreeshop.com/web/product/big/A/i1405.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1405.jpg', '나이키', '웨이스트 백', NULL, '20.6(가로), 13.5(세로)', 40000, 0.9, 0, NULL, 'ACC', '가방', NULL, NULL, 'y', 'n'),
	(59, '2024-08-06 07:15:02', 'https://blacktreeshop.com/web/product/big/A/i1403.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1403.jpg', '키플링', '미니 백팩', NULL, '20.6(가로), 13.5(세로)', 50000, 1, 0, NULL, 'ACC', '가방', NULL, NULL, 'y', 'n'),
	(60, '2024-08-06 07:15:49', 'https://blacktreeshop.com/web/product/big/A/i1560.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1560.jpg', '펜디', '넥타이', NULL, '9.5(폭), 148(길이)', 40000, 1, 0, NULL, 'ACC', '넥타이', NULL, NULL, 'y', 'n'),
	(61, '2024-08-06 07:16:33', 'https://blacktreeshop.com/web/product/big/A/i1559.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1559.jpg', '살바토레 페라가모', '넥타이', NULL, '9.5(폭), 148(길이)', 40000, 0.9, 0, NULL, 'ACC', '넥타이', NULL, NULL, 'y', 'n'),
	(62, '2024-08-06 07:17:09', 'https://blacktreeshop.com/web/product/big/A/i1558.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1558.jpg', '셀린느', '넥타이', NULL, '9.5(폭), 148(길이)', 40000, 0.9, 0, NULL, 'ACC', '넥타이', NULL, NULL, 'y', 'n'),
	(63, '2024-08-06 07:17:41', 'https://blacktreeshop.com/web/product/big/A/i1557.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1557.jpg', '샤넬', '넥타이', NULL, '9.5(폭), 148(길이)', 85000, 0.9, 0, NULL, 'ACC', '넥타이', NULL, NULL, 'y', 'n'),
	(64, '2024-08-06 07:18:10', 'https://blacktreeshop.com/web/product/big/A/i1506.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1506.jpg', '모스키노', '넥타이', NULL, '9.5(폭), 148(길이)', 30000, 1, 0, NULL, 'ACC', '넥타이', NULL, NULL, 'y', 'n'),
	(65, '2024-08-06 07:18:51', 'https://blacktreeshop.com/web/product/medium/A/i1505.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1505.jpg', '랑방', '넥타이', NULL, '9.5(폭), 148(길이)', 30000, 1, 0, NULL, 'ACC', '넥타이', NULL, NULL, 'y', 'n'),
	(66, '2024-08-06 07:19:15', 'https://blacktreeshop.com/web/product/big/A/i1353.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1353.jpg', '타미힐피거', '벨트', NULL, '4(폭), 105(길이)', 30000, 0.9, 0, NULL, 'ACC', 'ETC', NULL, NULL, 'y', 'n'),
	(67, '2024-08-06 07:19:58', 'https://blacktreeshop.com/web/product/big/A/i718.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i718.jpg', '코치', '실크 100 스카프', NULL, '53(가로), 53(세로)', 40000, 1, 0, NULL, 'ACC', 'ETC', NULL, NULL, 'y', 'n'),
	(68, '2024-08-06 07:22:09', 'https://blacktreeshop.com/web/product/medium/A/i1523.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1523.jpg', '엠쥐오', 'MUST GO ON 셔츠', 'L', '48.5(어깨), 57.7(가슴), 75(기장), 26.5(팔)', 50000, 1, 0, NULL, 'MAN/WOMAN', 'TOP', '셔츠', NULL, 'y', 'n'),
	(69, '2024-08-06 07:23:39', 'https://blacktreeshop.com/web/product/big/A/i1522.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1522.jpg', '아페쎄', 'X NATACHA RAMSAY LEVI 데님 셔츠', '38', '48.5(어깨), 57.7(가슴), 75(기장), 26.5(팔)', 70000, 0.9, 2000, NULL, 'MAN/WOMAN', 'TOP', '셔츠', NULL, 'y', 'y'),
	(70, '2024-08-06 07:25:00', 'https://blacktreeshop.com/web/product/big/A/i1521.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1521.jpg', '폴로 랄프 로렌', '웨스턴 데님 셔츠', 'M', '48.5(어깨), 57.7(가슴), 75(기장), 26.5(팔)', 75000, 0.9, 2000, NULL, 'MAN/WOMAN', 'TOP', '셔츠', NULL, 'y', 'n'),
	(71, '2024-08-06 07:27:45', 'https://blacktreeshop.com/web/product/big/A/i1520.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1520.jpg', '컬럼비아', '화이트 셔츠', 'M', '48.5(어깨), 57.7(가슴), 75(기장), 26.5(팔)', 40000, 0.75, 0, NULL, 'MAN/WOMAN', 'TOP', '셔츠', NULL, 'y', 'n'),
	(72, '2024-08-06 07:30:36', 'https://blacktreeshop.com/web/product/big/A/i1519.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1519.jpg', '언어펙티드', '하와이안 반팔 셔츠', 'L', '48.5(어깨), 57.7(가슴), 75(기장), 26.5(팔)', 45000, 0.75, 0, NULL, 'MAN/WOMAN', 'TOP', '셔츠', NULL, 'y', 'n'),
	(73, '2024-08-06 07:32:07', 'https://blacktreeshop.com/web/product/big/A/i490.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i490.jpg', '타미힐피거', '가디건', 'XL', '48.5(어깨), 57.7(가슴), 75(기장), 26.5(팔)', 85000, 0.75, 0, NULL, 'MAN/WOMAN', 'TOP', '니트/가디건', 'MAN', 'y', 'n'),
	(74, '2024-08-06 08:20:22', 'https://blacktreeshop.com/web/product/big/A/i1535.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1535.jpg', '이벳 필드', '반집업 맨투맨', 'S', '48.5(어깨), 57.7(가슴), 75(기장), 26.5(팔)', 20000, 0.7, 0, NULL, 'MAN/WOMAN', 'TOP', '맨투맨/후드', NULL, 'y', 'n'),
	(75, '2024-08-06 08:21:16', 'https://blacktreeshop.com/web/product/big/A/i1534.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1534.jpg', '나이키', '맨투맨', 'L', '48.5(어깨), 57.7(가슴), 75(기장), 26.5(팔)', 20000, 0.75, 0, NULL, 'MAN/WOMAN', 'TOP', '맨투맨/후드', NULL, 'y', 'n'),
	(76, '2024-08-06 08:22:18', 'https://blacktreeshop.com/web/product/big/A/i1533.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1533.jpg', '아웃스탠딩', '맨투맨', 'S', '48.5(어깨), 57.7(가슴), 75(기장), 26.5(팔)', 20000, 0.75, 0, NULL, 'MAN/WOMAN', 'TOP', '맨투맨/후드', NULL, 'y', 'n'),
	(77, '2024-08-06 08:22:58', 'https://blacktreeshop.com/web/product/big/A/i1532.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1532.jpg', '아웃스탠딩', '맨투맨', 'S', '48.5(어깨), 57.7(가슴), 75(기장), 26.5(팔)', 25000, 0.75, 0, NULL, 'MAN/WOMAN', 'TOP', '맨투맨/후드', NULL, 'y', 'n'),
	(78, '2024-08-06 08:24:08', 'https://blacktreeshop.com/web/product/big/A/i1531.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1531.jpg', '아웃스탠딩', '맨투맨', 'L', '48.5(어깨), 57.7(가슴), 75(기장), 26.5(팔)', 25000, 0.5, 0, NULL, 'MAN/WOMAN', 'TOP', '맨투맨/후드', NULL, 'y', 'n'),
	(79, '2024-08-06 08:24:56', 'https://blacktreeshop.com/web/product/big/A/i1530.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1530.jpg', '송지오 옴므', '맨투맨', '100', '48.5(어깨), 57.7(가슴), 75(기장), 26.5(팔)', 95000, 1, 0, NULL, 'MAN/WOMAN', 'TOP', '맨투맨/후드', 'MAN', 'y', 'n'),
	(80, '2024-08-06 08:25:37', 'https://blacktreeshop.com/web/product/big/A/i1536.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1536.jpg', '챔피온', '크롭 후드', '우먼스 S', '48.5(어깨), 57.7(가슴), 75(기장), 26.5(팔)', 25000, 0.9, 0, NULL, 'MAN/WOMAN', 'TOP', '맨투맨/후드', 'WOMAN', 'y', 'n'),
	(81, '2024-08-06 08:26:29', 'https://blacktreeshop.com/web/product/big/A/i1434.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1434.jpg', '레드캡', '블랙 크롭 워크 셔츠', '2XL', '48.5(어깨), 57.7(가슴), 75(기장), 26.5(팔)', 30000, 0.9, 0, NULL, 'MAN/WOMAN', 'TOP', '셔츠', 'WOMAN', 'y', 'n'),
	(82, '2024-08-06 08:27:34', 'https://blacktreeshop.com/web/product/big/A/i1433.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1433.jpg', '레드캡', '워크 크롭 반팔 셔츠', '2XL', '48.5(어깨), 57.7(가슴), 75(기장), 26.5(팔)', 30000, 0.9, 0, NULL, 'MAN/WOMAN', 'TOP', '셔츠', 'WOMAN', 'y', 'n'),
	(83, '2024-08-06 08:28:21', 'https://blacktreeshop.com/web/product/big/A/i1432.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1432.jpg', '컬럼비아', 'PFG 크롭 반팔 셔츠', 'L', '48.5(어깨), 57.7(가슴), 75(기장), 26.5(팔)', 30000, 0.9, 0, NULL, 'MAN/WOMAN', 'TOP', '셔츠', 'WOMAN', 'y', 'n'),
	(84, '2024-08-06 08:29:17', 'https://blacktreeshop.com/web/product/big/A/i1431.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1431.jpg', '컬럼비아', '체크 PFG 크롭셔츠', 'L', '48.5(어깨), 57.7(가슴), 75(기장), 26.5(팔)', 30000, 0.5, 0, NULL, 'MAN/WOMAN', 'TOP', '셔츠', 'WOMAN', 'y', 'n'),
	(85, '2024-08-06 08:29:56', 'https://blacktreeshop.com/web/product/big/A/i1441.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1441.jpg', '아디다스', '코튼 원피스', '우먼스 S', '42.5(어깨), 51(가슴), 123(기장), 53.5(팔)', 25000, 0.75, 0, NULL, 'MAN/WOMAN', 'DRESS', NULL, 'WOMAN', 'y', 'n'),
	(86, '2024-08-06 08:32:03', 'https://blacktreeshop.com/web/product/big/A/i1399.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1399.jpg', '아르켓', '플리츠 원피스', '38', '42.5(어깨), 51(가슴), 123(기장), 53.5(팔)', 30000, 0.75, 0, NULL, 'MAN/WOMAN', 'DRESS', NULL, 'WOMAN', 'y', 'n'),
	(87, '2024-08-06 08:32:50', 'https://blacktreeshop.com/web/product/big/A/i1398.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1398.jpg', '폴로 랄프 로렌', '데님 원피스', '16', '42.5(어깨), 51(가슴), 123(기장), 53.5(팔)', 40000, 1, 0, NULL, 'MAN/WOMAN', 'DRESS', NULL, 'WOMAN', 'y', 'n'),
	(88, '2024-08-06 08:33:29', 'https://blacktreeshop.com/web/product/big/A/i1397.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1397.jpg', 'AMY COMPANY', '원피스', 'F', '42.5(어깨), 51(가슴), 123(기장), 53.5(팔)', 20000, 0.75, 0, NULL, 'MAN/WOMAN', 'DRESS', NULL, 'WOMAN', 'y', 'n'),
	(89, '2024-08-11 05:12:50', 'https://blacktreeshop.com/web/product/big/A/i1665.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1665.jpg', '트래셔', '반팔 티셔츠', 'S', '48.5(어깨), 57.7(가슴), 75(기장), 26.5(팔)', 20000, 1, 0, NULL, 'MAN/WOMAN', 'TOP', '티셔츠', NULL, 'y', 'n'),
	(90, '2024-08-11 05:14:11', 'https://blacktreeshop.com/web/product/big/A/i1664.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1664.jpg', '칼하트 WIP', '반팔 티셔츠', 'L', '48.5(어깨), 57.7(가슴), 75(기장), 26.5(팔)', 35000, 1, 0, NULL, 'MAN/WOMAN', 'TOP', '티셔츠', NULL, 'y', 'n'),
	(91, '2024-08-11 05:15:11', 'https://blacktreeshop.com/web/product/big/A/i1663.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1663.jpg', '나이키', '프로컴뱃 기능성 반팔 티셔츠', 'L', '48.5(어깨), 57.7(가슴), 75(기장), 26.5(팔)', 20000, 1, 0, NULL, 'MAN/WOMAN', 'TOP', '티셔츠', 'MAN', 'y', 'n'),
	(92, '2024-08-11 05:16:08', 'https://blacktreeshop.com/web/product/big/A/i1662.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1662.jpg', '나이키', '베스킷볼 농구 메쉬 슬리브리스', '100', '48.5(어깨), 57.7(가슴), 75(기장), 26.5(팔)', 40000, 1, 0, NULL, 'MAN/WOMAN', 'TOP', '티셔츠', NULL, 'y', 'n'),
	(93, '2024-08-11 05:17:50', 'https://blacktreeshop.com/web/product/big/A/i1597.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1597.jpg', '구찌', '반팔 카라 티셔츠', 'M', '48.5(어깨), 57.7(가슴), 75(기장), 26.5(팔)', 200000, 0.9, 0, NULL, 'MAN/WOMAN', 'TOP', '티셔츠', NULL, 'y', 'y'),
	(94, '2024-08-11 05:17:54', 'https://blacktreeshop.com/web/product/big/A/i1595.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i1595.jpg', '휠라', '네이비 반팔 티셔츠', 'XL', '48.5(어깨), 57.7(가슴), 75(기장), 26.5(팔)', 15000, 1, 0, NULL, 'MAN/WOMAN', 'TOP', '티셔츠', NULL, 'y', 'n'),
	(95, '2024-08-11 05:18:45', 'https://blacktreeshop.com/web/product/big/A/h723.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/h723.jpg', '다즐린', '원피스', 'F', '42.5(어깨), 51(가슴), 123(기장), 53.5(팔)', 15000, 0.8, 0, NULL, 'MAN/WOMAN', 'DRESS', NULL, 'WOMAN', 'y', 'n'),
	(96, '2024-08-11 05:25:20', 'https://blacktreeshop.com/web/product/big/A/i292.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i292.jpg', '0608웨어', '팬츠', '46', '34(허리), 32.5(허벅지), 96.8(기장), 19.5(밑단), 37(밑위)', 100000, 1, 0, NULL, 'MAN/WOMAN', 'BOTTOM', '바지', 'MAN', 'y', 'y'),
	(97, '2024-08-11 05:29:04', 'https://blacktreeshop.com/web/product/big/A/i289.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i289.jpg', '브룩스 브라더스', '턴업 치노 팬츠', '30', '34(허리), 32.5(허벅지), 96.8(기장), 19.5(밑단), 37(밑위)', 40000, 1, 0, NULL, 'MAN/WOMAN', 'BOTTOM', '바지', 'MAN', 'y', 'n'),
	(98, '2024-08-11 05:30:13', 'https://blacktreeshop.com/web/product/big/A/i580.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i580.jpg', '폴로 랄프 로렌', '네이비 퀄팅 자켓', 'KID 4Y', '33(어깨), 36(가슴), 73.5(기장), 36(팔)', 35000, 1, 0, NULL, 'KID', NULL, NULL, NULL, 'y', 'y'),
	(99, '2024-08-11 07:44:00', 'https://blacktreeshop.com/web/product/big/A/i571.jpg', 'https://cafe24.poxo.com/ec01/yht187/PqYAeXr9cC3ewV7j5+hci+tRIF5xSPrhzUnhJqVTByHHryXRQzy3ySfBH6S3yl+jHo+7prRawNrnzJqRIpxytg==/_/web/product/yang/i571.jpg', '버버리', '셔츠', 'KID 8Y', '31.5(가슴), 41.5(기장), 43.5(팔)', 35000, 1, 0, NULL, 'KID', NULL, NULL, NULL, 'y', 'n');

-- 테이블 vintage.member_tb 구조 내보내기
CREATE TABLE IF NOT EXISTS `member_tb` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `mail` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `phone_alt` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `birth` date NOT NULL,
  `solar_yn` char(1) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `address_detail` varchar(255) NOT NULL,
  `join_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `point` int(11) NOT NULL DEFAULT 0,
  `point_total` int(11) NOT NULL DEFAULT 0,
  `rank` varchar(255) NOT NULL DEFAULT 'bronze',
  `sms_yn` char(1) NOT NULL,
  `mail_yn` char(1) NOT NULL,
  `authority` varchar(255) NOT NULL DEFAULT 'role_user',
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `withdraw_date` timestamp NULL DEFAULT NULL,
  `refund_bank` varchar(255) DEFAULT NULL,
  `refund_account` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `mail` (`mail`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 vintage.member_tb:~8 rows (대략적) 내보내기
DELETE FROM `member_tb`;
INSERT INTO `member_tb` (`uid`, `mail`, `password`, `phone`, `phone_alt`, `name`, `birth`, `solar_yn`, `gender`, `zip`, `address`, `address_detail`, `join_date`, `point`, `point_total`, `rank`, `sms_yn`, `mail_yn`, `authority`, `status`, `withdraw_date`, `refund_bank`, `refund_account`) VALUES
	(1, 'mosaek2@gmail.com', '3dnQfprtm!Vi', '010-3002-0014', '', '권혁민', '1991-05-26', 'y', 'male', '05287', '서울 강동구 상일로 74 (상일동, 고덕리엔파크3단지아파트)', '339동 1203호', '2024-08-05 08:52:32', 0, 0, 'bronze', 'n', 'n', 'role_admin', 'active', NULL, NULL, NULL),
	(10, 'gyuri10144@gmail.com', 'rlaalwls71', '010-3910-1649', '', '김규리', '1997-10-14', 'y', 'female', '05287', '서울 강동구 상일로 74 (상일동, 고덕리엔파크3단지아파트)', '339동 1203호', '2024-08-16 02:44:25', 0, 0, 'bronze', 'n', 'n', 'role_user', 'active', NULL, NULL, NULL),
	(11, 'mijin@naver.com', 'rlaalwls71', '010-7121-6803', '', '김미진', '1992-02-14', 'y', 'female', '05287', '서울 강동구 상일로 74 (상일동, 고덕리엔파크3단지아파트)', '339동 1203호', '2024-08-16 02:47:30', 0, 0, 'bronze', 'y', 'n', 'role_user', 'active', NULL, NULL, NULL),
	(12, 'hitori@naver.com', 'rlaalwls71', '010-5102-1362', '', '김경모', '1991-12-01', 'y', 'male', '05287', '서울 강동구 상일로 74 (상일동, 고덕리엔파크3단지아파트)', '339동 1203호', '2024-08-16 03:04:02', 0, 0, 'bronze', 'n', 'n', 'role_user', 'active', NULL, NULL, NULL),
	(13, 'koala@naver.com', 'rlaalwls71', '010-1592-6535', '', '장기현', '1991-10-01', 'y', 'male', '05287', '서울 강동구 상일로 74 (상일동, 고덕리엔파크3단지아파트)', '339동 1203호', '2024-08-16 03:05:23', 0, 0, 'bronze', 'y', 'y', 'role_user', 'active', NULL, NULL, NULL),
	(27, 'ojhro@hanmail.net', 'rlaalwls71', '010-9045-1526', '', '정혜련', '1965-02-24', 'y', 'female', '05287', '서울 강동구 상일로 74 (상일동, 고덕리엔파크3단지아파트)', '339동 1203호', '2024-08-19 01:02:29', 0, 0, 'bronze', 'y', 'y', 'role_user', 'active', NULL, NULL, NULL),
	(28, 'yoonjiya@naver.com', 'rlaalwls71', '010-2626-1526', '', '권윤지', '1993-05-14', 'y', 'female', '05287', '서울 강동구 상일로 74 (상일동, 고덕리엔파크3단지아파트)', '339동 1203호', '2024-08-19 01:47:14', 0, 0, 'bronze', 'y', 'n', 'role_user', 'active', NULL, NULL, NULL);

-- 테이블 vintage.order_tb 구조 내보내기
CREATE TABLE IF NOT EXISTS `order_tb` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `addressee` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `address_detail` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `phone_alt` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `point` int(11) NOT NULL DEFAULT 0,
  `charge` int(11) NOT NULL,
  `payment` int(11) NOT NULL,
  `method` varchar(255) NOT NULL,
  `depositor` varchar(255) DEFAULT NULL,
  `courier` varchar(255) DEFAULT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 vintage.order_tb:~0 rows (대략적) 내보내기
DELETE FROM `order_tb`;

-- 테이블 vintage.post_tb 구조 내보내기
CREATE TABLE IF NOT EXISTS `post_tb` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `board` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext DEFAULT NULL,
  `write_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `delete_yn` char(1) NOT NULL DEFAULT 'n',
  `delete_date` timestamp NULL DEFAULT NULL,
  `modify_date` timestamp NULL DEFAULT NULL,
  `fix_yn` char(1) NOT NULL DEFAULT 'n',
  `answer_yn` char(1) NOT NULL DEFAULT 'n',
  `member_uid` int(11) NOT NULL,
  `item_uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `member_uid` (`member_uid`),
  KEY `item_uid` (`item_uid`),
  CONSTRAINT `post_tb_ibfk_1` FOREIGN KEY (`member_uid`) REFERENCES `member_tb` (`uid`),
  CONSTRAINT `post_tb_ibfk_2` FOREIGN KEY (`item_uid`) REFERENCES `item_tb` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 vintage.post_tb:~17 rows (대략적) 내보내기
DELETE FROM `post_tb`;
INSERT INTO `post_tb` (`uid`, `board`, `title`, `content`, `write_date`, `delete_yn`, `delete_date`, `modify_date`, `fix_yn`, `answer_yn`, `member_uid`, `item_uid`) VALUES
	(1, 'notice', '업데이트 시간 안내', '업데이트 시간 안내', '2024-08-15 08:16:42', 'n', NULL, NULL, 'n', 'n', 1, NULL),
	(2, 'qna', '직수입 제품인가요?', '그런가요?', '2024-08-15 08:17:33', 'n', NULL, NULL, 'n', 'y', 10, 80),
	(3, 'review', 'example_review_title', NULL, '2024-08-15 08:17:55', 'n', NULL, NULL, 'n', 'n', 1, NULL),
	(4, 'notice', '무료배송 기준 금액 변경 안내 (개정일 : 2023년 11월 28일)', NULL, '2024-08-15 08:46:47', 'n', NULL, NULL, 'y', 'n', 1, NULL),
	(5, 'notice', '회원 등급제 안내 (개정일 : 2024년 05월 08일) ', NULL, '2024-08-16 01:13:07', 'n', NULL, NULL, 'y', 'n', 1, NULL),
	(6, 'notice', '배송 조회가 되지 않는 경우', NULL, '2024-08-16 01:16:48', 'n', NULL, NULL, 'n', 'n', 1, NULL),
	(7, 'notice', '세일 기간 공지사항', NULL, '2024-08-16 01:18:05', 'n', NULL, NULL, 'n', 'n', 1, NULL),
	(8, 'notice', '택배 발송 안내', NULL, '2024-08-16 01:18:29', 'n', NULL, NULL, 'n', 'n', 1, NULL),
	(9, 'qna', '배송 관련 문의', '언제 되나요?', '2024-08-16 03:01:06', 'n', NULL, NULL, 'n', 'y', 11, NULL),
	(10, 'qna', '환불하고 싶어요', '해줘', '2024-08-16 03:01:48', 'n', NULL, NULL, 'n', 'y', 12, 69),
	(11, 'qna', '환불 문의', '환불 부탁드립니다..', '2024-08-16 03:08:23', 'n', NULL, '2024-08-19 06:51:40', 'n', 'y', 1, 91),
	(12, 'qna', '로그인 화면에서 오류가 생기는데', '어떻게 하나요?', '2024-08-16 03:10:21', 'n', NULL, NULL, 'n', 'y', 13, NULL),
	(22, 'qna', '다른 사이즈 입고 계획이 있을까요?', '옷은 넘 이쁜데 혹시 M 사이즈 입고 계획이 있을까요?', '2024-08-19 06:39:42', 'n', NULL, '2024-08-19 06:39:53', 'n', 'y', 28, 8),
	(26, 'qna', '환불 가능 기간', '안녕하세요~ 산지 1년 조금 넘었는데 혹시 환불 될까요?', '2024-08-19 09:42:23', 'n', NULL, NULL, 'n', 'n', 10, 54),
	(27, 'qna', '반품 확인', '확인 부탁드려요..', '2024-08-19 09:43:38', 'n', NULL, NULL, 'n', 'n', 11, NULL),
	(28, 'qna', 'test', 'test...', '2024-08-20 07:34:32', 'y', '2024-08-20 07:39:56', '2024-08-20 07:39:50', 'n', 'n', 1, 57),
	(29, 'qna', 'test222', 'test333', '2024-08-20 08:29:59', 'y', '2024-08-21 03:45:12', '2024-08-21 03:45:07', 'n', 'y', 1, 21);

-- 테이블 vintage.view_tb 구조 내보내기
CREATE TABLE IF NOT EXISTS `view_tb` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `item_uid` int(11) NOT NULL,
  `member_uid` int(11) NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `item_uid` (`item_uid`),
  KEY `member_uid` (`member_uid`),
  CONSTRAINT `view_tb_ibfk_1` FOREIGN KEY (`item_uid`) REFERENCES `item_tb` (`uid`),
  CONSTRAINT `view_tb_ibfk_2` FOREIGN KEY (`member_uid`) REFERENCES `member_tb` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 vintage.view_tb:~0 rows (대략적) 내보내기
DELETE FROM `view_tb`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
