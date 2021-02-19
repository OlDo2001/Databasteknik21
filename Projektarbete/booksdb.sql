-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 19, 2021 at 09:08 PM
-- Server version: 5.7.32
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `booksdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `authors_id` int(11) NOT NULL,
  `author` varchar(50) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`authors_id`, `author`) VALUES
(1, ' Frida Skattberg'),
(2, ' Fredrik Nylén'),
(3, ' Zeina Mourtada'),
(4, ' Jamie Oliver');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `tel` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  `address` varchar(250) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `email`, `tel`, `address`) VALUES
(73, 'Olga', 'olga@me.com', '123', 'Stockholm'),
(74, 'Olga', 'olga@me.com', '123', 'Stockholm'),
(75, 'Olga', 'olga@me.com', '123', 'Stockholm'),
(76, 'Olga', 'olga@me.com', '123', 'Stockholm'),
(77, 'Olga', 'olga@me.com', '123', 'Stockholm'),
(78, 'Misha', 'Misha@me.com', '345', 'Sverige');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `info` varchar(250) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `order_id` int(11) NOT NULL,
  `customer` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`order_id`, `customer`, `product`, `order_date`) VALUES
(63, 73, 8, '2021-02-19 21:57:00'),
(64, 74, 8, '2021-02-19 22:03:45'),
(65, 75, 8, '2021-02-19 22:03:51'),
(66, 76, 8, '2021-02-19 22:05:19'),
(67, 77, 8, '2021-02-19 22:05:22'),
(68, 78, 4, '2021-02-19 22:06:42');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `title` varchar(250) COLLATE utf8_swedish_ci NOT NULL,
  `author` int(11) NOT NULL,
  `description` varchar(500) COLLATE utf8_swedish_ci NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(50) COLLATE utf8_swedish_ci NOT NULL DEFAULT 'no-image.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `title`, `author`, `description`, `price`, `image`) VALUES
(1, 'Baka i långpanna deluxe', 1, 'Sveriges bakdrottning Frida Skattberg är tillbaka med en ny bok, och den här gången bjuder hon på enkla bakverk för många. Allt bakas i långpanna!', 177, 'baka-i-langpanna-deluxe.jpg'),
(2, 'Kladdkakor deluxe', 1, 'Här finns recept på himmelskt goda bakverk som exempelvis chokladkaka med nutellamaräng, dulce de leche med havssalt och kladdkakstårta.', 199, 'kladdkakor-deluxe.jpg'),
(3, 'Matbröd från tekakor och långpannebröd till fröknäcke och lingonlimpa', 2, 'Inget slår hembakat – och det behöver dessutom inte vara krångligt eller svårt. Tvärtom! I Matbröd har Fredrik Nylén samlat sina godaste matbröd för alla tillfällen.', 75, 'matbrod-fran-tekakor.jpg'),
(4, 'Baka med choklad', 2, 'Här hittar du enkla och tydliga recept på allt från kladdkakor, tårtor och desserter till småkakor och mjuka kakor – samt recept du kan göra helt utan ugn.', 105, 'baka-med-choklad.jpg'),
(5, 'Fredriks fika - bakat med glädje', 2, 'Här bjuder Fredrik Nylén på klassiskt fikabröd, sådant där som man tar fram när man ska bjuda någon på riktig fika.', 169, 'fredriks-fika-bakat-med-gladje.jpg'),
(6, 'Baka bullar : Älskade klassiker och nya favoriter', 2, 'Fredrik Nylén bjuder på ett fyrtiotal enkla recept, en massa tips som visar hur du lyckas med snurror eller flätning.', 210, 'baka-bullar.jpg'),
(7, 'Zeinas green kitchen : Gröna recept från olika delar av världen', 3, 'Zeina Mourtada är tillbaka med en ny kokbok, denna gång med skön och grön mat från olika delar av världen. Spännande, vackra, mustiga rätter som väcker nyfikenhet och matlagningslust.', 109, 'zeinas-green-kitchen.jpg'),
(8, 'Veckans matsedel : Middagsrecept från olika delar av världen', 3, 'I denna boken ligger fokus på vardagsmat som funkar. Det betyder relativt korta tillagningstider och praktiska veckomenyer att luta sig mot när tid och fantasi tryter.', 159, 'veckans-matsedel-middagsrecept.jpg'),
(9, 'Zeinas kitchen : recept från Mellanöstern', 3, 'Zeina har samlat omkring 80 recept. Här finns recept som annars kan vara svåra att hitta på svenska, och många recept är vegetariska, eller kan lätt omvandlas till det.', 111, 'zeinas-kitchen-recept.jpg'),
(10, 'Jamie lagar Italien : En hyllning till den goda italienska maten', 4, 'Boken innehåller över 130 smakrika recept, alla presenterade på det sätt som kännetecknar Jamie. Det är enkelt, inspirerande och oemotståndligt läckert.', 139, 'jamie-lagar-italien.jpg'),
(11, 'Vego : enkla & goda rätter för alla', 4, 'Fler och fler av oss vill äta mer grönt, det kan vara av hälsoskäl, för att minska utgifterna eller för planetens skull. De här genialiskt enkla recepten har hämtat inspiration från hela världen och är en hyllning till de ödmjuka och underbara grönsakerna.', 231, 'vego-enkla-goda-ratter-for-alla.jpg'),
(12, '5 ingredienser : snabb och enkel mat', 4, 'Fem ingredienser, det är allt du behöver komma ihåg när du står i matbutiken och ska komma på vad du ska laga för middag.', 231, 'jamies-supermat.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`authors_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer` (`customer`),
  ADD KEY `product` (`product`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `author` (`author`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `authors_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `customer` FOREIGN KEY (`customer`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product` FOREIGN KEY (`product`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `author` FOREIGN KEY (`author`) REFERENCES `authors` (`authors_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
