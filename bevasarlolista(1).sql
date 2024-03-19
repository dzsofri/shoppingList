-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Már 19. 22:01
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `bevasarlolista`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `lista`
--

CREATE TABLE `lista` (
  `id` int(11) NOT NULL,
  `category` text NOT NULL,
  `productname` text NOT NULL,
  `amount` int(10) NOT NULL,
  `unitprice` int(10) NOT NULL,
  `price` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `lista`
--

INSERT INTO `lista` (`id`, `category`, `productname`, `amount`, `unitprice`, `price`) VALUES
(11, 'vegetables', 'lemon', 2, 3160, 6320),
(12, 'dairy', 'spinach quiche', 8, 107, 856);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `mock_data`
--

CREATE TABLE `mock_data` (
  `id` int(11) NOT NULL,
  `category` text NOT NULL,
  `productname` text NOT NULL,
  `price` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `mock_data`
--

INSERT INTO `mock_data` (`id`, `category`, `productname`, `price`) VALUES
(1, 'dairy', 'yakitori skewers', 2137),
(2, 'grains', 'oatmeal cookies', 1139),
(3, 'sweets', 'mango salsa', 2006),
(4, 'beverages', 'garlic bread', 2710),
(5, 'frozen foods', 'waffle', 3802),
(6, 'grains', 'french fries', 4640),
(7, 'meat', 'french fries', 3967),
(8, 'condiments', 'salad', 4500),
(9, 'vegetables', 'lemon', 3160),
(10, 'fruits', 'mango salsa', 4470),
(11, 'sweets', 'mushroom risotto', 3212),
(12, 'dairy', 'ziti', 2595),
(13, 'fruits', 'mango', 122),
(14, 'dairy', 'sushi', 4807),
(15, 'dairy', 'spinach quiche', 107),
(16, 'snacks', 'egg salad', 2484),
(17, 'fruits', 'yogurt', 1475),
(18, 'fruits', 'macaroni', 617),
(19, 'sweets', 'yogurt', 1898),
(20, 'grains', 'veggie burger', 3824),
(21, 'condiments', 'ziti pasta', 3344),
(22, 'frozen foods', 'quesadilla', 907),
(23, 'frozen foods', 'queso dip', 2461),
(24, 'vegetables', 'ravioli', 4236),
(25, 'meat', 'lemon', 2111),
(26, 'vegetables', 'quinoa', 1702),
(27, 'frozen foods', 'french fries', 1630),
(28, 'grains', 'vietnamese pho', 3634),
(29, 'dairy', 'quesadilla', 320),
(30, 'condiments', 'lobster bisque', 1412),
(31, 'grains', 'quesadilla grande', 2494),
(32, 'dairy', 'nachos supreme', 3113),
(33, 'beverages', 'udon', 3692),
(34, 'dairy', 'lasagna', 3981),
(35, 'grains', 'kale salad', 2117),
(36, 'beverages', 'zucchini', 902),
(37, 'fruits', 'hamburger', 2673),
(38, 'dairy', 'garlic bread', 2873),
(39, 'vegetables', 'xmas cookies', 2304),
(40, 'fruits', 'fajita', 4917),
(41, 'grains', 'xiao long bao dumplings', 185),
(42, 'dairy', 'banana', 4569),
(43, 'condiments', 'yogurt parfait', 1926),
(44, 'frozen foods', 'yogurt', 845),
(45, 'grains', 'apple', 2614),
(46, 'snacks', 'yogurt parfait', 295),
(47, 'vegetables', 'quesadilla grande', 1834),
(48, 'fruits', 'ramen', 597),
(49, 'vegetables', 'lemon', 4274),
(50, 'grains', 'orange', 389),
(51, 'grains', 'grapes', 1479),
(52, 'condiments', 'pepperoni pizza', 506),
(53, 'dairy', 'nachos supreme', 1649),
(54, 'vegetables', 'taco salad', 4227),
(55, 'snacks', 'ice cream sundae', 1147),
(56, 'meat', 'nachos', 575),
(57, 'meat', 'egg salad', 1053),
(58, 'fruits', 'bagel', 291),
(59, 'vegetables', 'ziti', 1041),
(60, 'snacks', 'honeydew melon', 2870),
(61, 'sweets', 'hummus', 4206),
(62, 'sweets', 'doughnut holes', 1246),
(63, 'snacks', 'iceberg lettuce', 2737),
(64, 'condiments', 'macaroni', 3431),
(65, 'condiments', 'taco', 4446),
(66, 'meat', 'yakitori skewers', 2853),
(67, 'sweets', 'egg salad', 2897),
(68, 'condiments', 'ziti pasta', 4564),
(69, 'meat', 'chocolate cake', 978),
(70, 'snacks', 'pizza', 4601),
(71, 'frozen foods', 'lasagna', 4892),
(72, 'fruits', 'ramen noodles', 4210),
(73, 'snacks', 'xmas cookies', 4924),
(74, 'sweets', 'honeydew melon', 3141),
(75, 'frozen foods', 'gnocchi', 3218),
(76, 'grains', 'udon soup', 414),
(77, 'fruits', 'doughnut', 2982),
(78, 'vegetables', 'pepperoni pizza', 1381),
(79, 'vegetables', 'honeydew melon', 1967),
(80, 'dairy', 'egg', 3989),
(81, 'fruits', 'orange', 1449),
(82, 'beverages', 'sushi', 3210),
(83, 'dairy', 'oatmeal raisin cookies', 4811),
(84, 'vegetables', 'ice cream', 2103),
(85, 'snacks', 'honeydew melon', 3391),
(86, 'dairy', 'ramen noodles', 3741),
(87, 'beverages', 'chocolate cake', 1516),
(88, 'snacks', 'toast', 3584),
(89, 'frozen foods', 'sushi roll', 160),
(90, 'sweets', 'ramen noodles', 2338),
(91, 'vegetables', 'chicken nuggets', 3119),
(92, 'frozen foods', 'oatmeal cookies', 1007),
(93, 'frozen foods', 'dumplings', 1479),
(94, 'fruits', 'garlic bread', 4083),
(95, 'vegetables', 'udon soup', 3524),
(96, 'snacks', 'yakitori skewers', 310),
(97, 'frozen foods', 'ziti pasta', 2165),
(98, 'meat', 'rice', 3332),
(99, 'vegetables', 'garlic bread', 1948),
(100, 'beverages', 'xiao long bao', 1019);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `lista`
--
ALTER TABLE `lista`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `mock_data`
--
ALTER TABLE `mock_data`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `lista`
--
ALTER TABLE `lista`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT a táblához `mock_data`
--
ALTER TABLE `mock_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
