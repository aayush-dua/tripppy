-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 22, 2021 at 12:23 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trip_booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `country_master`
--

CREATE TABLE `country_master` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(50) DEFAULT NULL,
  `country_iso_code` varchar(5) DEFAULT NULL,
  `country_isd_code` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `country_master`
--

INSERT INTO `country_master` (`country_id`, `country_name`, `country_iso_code`, `country_isd_code`) VALUES
(1, 'Afghanistan', 'AF', '93'),
(2, 'Albania', 'AL', '355'),
(3, 'Algeria', 'DZ', '213'),
(4, 'American Samoa', 'AS', '1-684'),
(5, 'Andorra', 'AD', '376'),
(6, 'Angola', 'AO', '244'),
(7, 'Anguilla', 'AI', '1-264'),
(8, 'Antarctica', 'AQ', '672'),
(9, 'Antigua and Barbuda', 'AG', '1-268'),
(10, 'Argentina', 'AR', '54'),
(11, 'Armenia', 'AM', '374'),
(12, 'Aruba', 'AW', '297'),
(13, 'Australia', 'AU', '61'),
(14, 'Austria', 'AT', '43'),
(15, 'Azerbaijan', 'AZ', '994'),
(16, 'Bahamas', 'BS', '1-242'),
(17, 'Bahrain', 'BH', '973'),
(18, 'Bangladesh', 'BD', '880'),
(19, 'Barbados', 'BB', '1-246'),
(20, 'Belarus', 'BY', '375'),
(21, 'Belgium', 'BE', '32'),
(22, 'Belize', 'BZ', '501'),
(23, 'Benin', 'BJ', '229'),
(24, 'Bermuda', 'BM', '1-441'),
(25, 'Bhutan', 'BT', '975'),
(26, 'Bolivia', 'BO', '591'),
(27, 'Bosnia and Herzegowina', 'BA', '387'),
(28, 'Botswana', 'BW', '267'),
(29, 'Bouvet Island', 'BV', '47'),
(30, 'Brazil', 'BR', '55'),
(31, 'British Indian Ocean Territory', 'IO', '246'),
(32, 'Brunei Darussalam', 'BN', '673'),
(33, 'Bulgaria', 'BG', '359'),
(34, 'Burkina Faso', 'BF', '226'),
(35, 'Burundi', 'BI', '257'),
(36, 'Cambodia', 'KH', '855'),
(37, 'Cameroon', 'CM', '237'),
(38, 'Canada', 'CA', '1'),
(39, 'Cape Verde', 'CV', '238'),
(40, 'Cayman Islands', 'KY', '1-345'),
(41, 'Central African Republic', 'CF', '236'),
(42, 'Chad', 'TD', '235'),
(43, 'Chile', 'CL', '56'),
(44, 'China', 'CN', '86'),
(45, 'Christmas Island', 'CX', '61'),
(46, 'Cocos (Keeling) Islands', 'CC', '61'),
(47, 'Colombia', 'CO', '57'),
(48, 'Comoros', 'KM', '269'),
(49, 'Congo Democratic Republic of', 'CG', '242'),
(50, 'Cook Islands', 'CK', '682'),
(51, 'Costa Rica', 'CR', '506'),
(52, 'Cote D\'Ivoire', 'CI', '225'),
(53, 'Croatia', 'HR', '385'),
(54, 'Cuba', 'CU', '53'),
(55, 'Cyprus', 'CY', '357'),
(56, 'Czech Republic', 'CZ', '420'),
(57, 'Denmark', 'DK', '45'),
(58, 'Djibouti', 'DJ', '253'),
(59, 'Dominica', 'DM', '1-767'),
(60, 'Dominican Republic', 'DO', '1-809'),
(61, 'Timor-Leste', 'TL', '670'),
(62, 'Ecuador', 'EC', '593'),
(63, 'Egypt', 'EG', '20'),
(64, 'El Salvador', 'SV', '503'),
(65, 'Equatorial Guinea', 'GQ', '240'),
(66, 'Eritrea', 'ER', '291'),
(67, 'Estonia', 'EE', '372'),
(68, 'Ethiopia', 'ET', '251'),
(69, 'Falkland Islands (Malvinas)', 'FK', '500'),
(70, 'Faroe Islands', 'FO', '298'),
(71, 'Fiji', 'FJ', '679'),
(72, 'Finland', 'FI', '358'),
(73, 'France', 'FR', '33'),
(75, 'French Guiana', 'GF', '594'),
(76, 'French Polynesia', 'PF', '689'),
(77, 'French Southern Territories', 'TF', NULL),
(78, 'Gabon', 'GA', '241'),
(79, 'Gambia', 'GM', '220'),
(80, 'Georgia', 'GE', '995'),
(81, 'Germany', 'DE', '49'),
(82, 'Ghana', 'GH', '233'),
(83, 'Gibraltar', 'GI', '350'),
(84, 'Greece', 'GR', '30'),
(85, 'Greenland', 'GL', '299'),
(86, 'Grenada', 'GD', '1-473'),
(87, 'Guadeloupe', 'GP', '590'),
(88, 'Guam', 'GU', '1-671'),
(89, 'Guatemala', 'GT', '502'),
(90, 'Guinea', 'GN', '224'),
(91, 'Guinea-bissau', 'GW', '245'),
(92, 'Guyana', 'GY', '592'),
(93, 'Haiti', 'HT', '509'),
(94, 'Heard Island and McDonald Islands', 'HM', '011'),
(95, 'Honduras', 'HN', '504'),
(96, 'Hong Kong', 'HK', '852'),
(97, 'Hungary', 'HU', '36'),
(98, 'Iceland', 'IS', '354'),
(99, 'India', 'IN', '91'),
(100, 'Indonesia', 'ID', '62'),
(101, 'Iran (Islamic Republic of)', 'IR', '98'),
(102, 'Iraq', 'IQ', '964'),
(103, 'Ireland', 'IE', '353'),
(104, 'Israel', 'IL', '972'),
(105, 'Italy', 'IT', '39'),
(106, 'Jamaica', 'JM', '1-876'),
(107, 'Japan', 'JP', '81'),
(108, 'Jordan', 'JO', '962'),
(109, 'Kazakhstan', 'KZ', '7'),
(110, 'Kenya', 'KE', '254'),
(111, 'Kiribati', 'KI', '686'),
(112, 'Korea, Democratic People\'s Republic of', 'KP', '850'),
(113, 'South Korea', 'KR', '82'),
(114, 'Kuwait', 'KW', '965'),
(115, 'Kyrgyzstan', 'KG', '996'),
(116, 'Lao People\'s Democratic Republic', 'LA', '856'),
(117, 'Latvia', 'LV', '371'),
(118, 'Lebanon', 'LB', '961'),
(119, 'Lesotho', 'LS', '266'),
(120, 'Liberia', 'LR', '231'),
(121, 'Libya', 'LY', '218'),
(122, 'Liechtenstein', 'LI', '423'),
(123, 'Lithuania', 'LT', '370'),
(124, 'Luxembourg', 'LU', '352'),
(125, 'Macao', 'MO', '853'),
(126, 'Macedonia, The Former Yugoslav Republic of', 'MK', '389'),
(127, 'Madagascar', 'MG', '261'),
(128, 'Malawi', 'MW', '265'),
(129, 'Malaysia', 'MY', '60'),
(130, 'Maldives', 'MV', '960'),
(131, 'Mali', 'ML', '223'),
(132, 'Malta', 'MT', '356'),
(133, 'Marshall Islands', 'MH', '692'),
(134, 'Martinique', 'MQ', '596'),
(135, 'Mauritania', 'MR', '222'),
(136, 'Mauritius', 'MU', '230'),
(137, 'Mayotte', 'YT', '262'),
(138, 'Mexico', 'MX', '52'),
(139, 'Micronesia, Federated States of', 'FM', '691'),
(140, 'Moldova', 'MD', '373'),
(141, 'Monaco', 'MC', '377'),
(142, 'Mongolia', 'MN', '976'),
(143, 'Montserrat', 'MS', '1-664'),
(144, 'Morocco', 'MA', '212'),
(145, 'Mozambique', 'MZ', '258'),
(146, 'Myanmar', 'MM', '95'),
(147, 'Namibia', 'NA', '264'),
(148, 'Nauru', 'NR', '674'),
(149, 'Nepal', 'NP', '977'),
(150, 'Netherlands', 'NL', '31'),
(151, 'Netherlands Antilles', 'AN', '599'),
(152, 'New Caledonia', 'NC', '687	'),
(153, 'New Zealand', 'NZ', '64'),
(154, 'Nicaragua', 'NI', '505'),
(155, 'Niger', 'NE', '227'),
(156, 'Nigeria', 'NG', '234'),
(157, 'Niue', 'NU', '683'),
(158, 'Norfolk Island', 'NF', '672'),
(159, 'Northern Mariana Islands', 'MP', '1-670'),
(160, 'Norway', 'NO', '47'),
(161, 'Oman', 'OM', '968'),
(162, 'Pakistan', 'PK', '92'),
(163, 'Palau', 'PW', '680'),
(164, 'Panama', 'PA', '507'),
(165, 'Papua New Guinea', 'PG', '675'),
(166, 'Paraguay', 'PY', '595'),
(167, 'Peru', 'PE', '51'),
(168, 'Philippines', 'PH', '63'),
(169, 'Pitcairn', 'PN', '64'),
(170, 'Poland', 'PL', '48'),
(171, 'Portugal', 'PT', '351'),
(172, 'Puerto Rico', 'PR', '1-787'),
(173, 'Qatar', 'QA', '974'),
(174, 'Reunion', 'RE', '262'),
(175, 'Romania', 'RO', '40'),
(176, 'Russian Federation', 'RU', '7'),
(177, 'Rwanda', 'RW', '250'),
(178, 'Saint Kitts and Nevis', 'KN', '1-869'),
(179, 'Saint Lucia', 'LC', '1-758'),
(180, 'Saint Vincent and the Grenadines', 'VC', '1-784'),
(181, 'Samoa', 'WS', '685'),
(182, 'San Marino', 'SM', '378'),
(183, 'Sao Tome and Principe', 'ST', '239'),
(184, 'Saudi Arabia', 'SA', '966'),
(185, 'Senegal', 'SN', '221'),
(186, 'Seychelles', 'SC', '248'),
(187, 'Sierra Leone', 'SL', '232'),
(188, 'Singapore', 'SG', '65'),
(189, 'Slovakia (Slovak Republic)', 'SK', '421'),
(190, 'Slovenia', 'SI', '386'),
(191, 'Solomon Islands', 'SB', '677'),
(192, 'Somalia', 'SO', '252'),
(193, 'South Africa', 'ZA', '27'),
(194, 'South Georgia and the South Sandwich Islands', 'GS', '500'),
(195, 'Spain', 'ES', '34'),
(196, 'Sri Lanka', 'LK', '94'),
(197, 'Saint Helena, Ascension and Tristan da Cunha', 'SH', '290'),
(198, 'St. Pierre and Miquelon', 'PM', '508'),
(199, 'Sudan', 'SD', '249'),
(200, 'Suriname', 'SR', '597'),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', '47'),
(202, 'Swaziland', 'SZ', '268'),
(203, 'Sweden', 'SE', '46'),
(204, 'Switzerland', 'CH', '41'),
(205, 'Syrian Arab Republic', 'SY', '963'),
(206, 'Taiwan', 'TW', '886'),
(207, 'Tajikistan', 'TJ', '992'),
(208, 'Tanzania, United Republic of', 'TZ', '255'),
(209, 'Thailand', 'TH', '66'),
(210, 'Togo', 'TG', '228'),
(211, 'Tokelau', 'TK', '690'),
(212, 'Tonga', 'TO', '676'),
(213, 'Trinidad and Tobago', 'TT', '1-868'),
(214, 'Tunisia', 'TN', '216'),
(215, 'Turkey', 'TR', '90'),
(216, 'Turkmenistan', 'TM', '993'),
(217, 'Turks and Caicos Islands', 'TC', '1-649'),
(218, 'Tuvalu', 'TV', '688'),
(219, 'Uganda', 'UG', '256'),
(220, 'Ukraine', 'UA', '380'),
(221, 'United Arab Emirates', 'AE', '971'),
(222, 'United Kingdom', 'GB', '44'),
(223, 'United States', 'US', '1'),
(224, 'United States Minor Outlying Islands', 'UM', '246'),
(225, 'Uruguay', 'UY', '598'),
(226, 'Uzbekistan', 'UZ', '998'),
(227, 'Vanuatu', 'VU', '678'),
(228, 'Vatican City State (Holy See)', 'VA', '379'),
(229, 'Venezuela', 'VE', '58'),
(230, 'Vietnam', 'VN', '84'),
(231, 'Virgin Islands (British)', 'VG', '1-284'),
(232, 'Virgin Islands (U.S.)', 'VI', '1-340'),
(233, 'Wallis and Futuna Islands', 'WF', '681'),
(234, 'Western Sahara', 'EH', '212'),
(235, 'Yemen', 'YE', '967'),
(236, 'Serbia', 'RS', '381'),
(238, 'Zambia', 'ZM', '260'),
(239, 'Zimbabwe', 'ZW', '263'),
(240, 'Aaland Islands', 'AX', '358'),
(241, 'Palestine', 'PS', '970'),
(242, 'Montenegro', 'ME', '382'),
(243, 'Guernsey', 'GG', '44-1481'),
(244, 'Isle of Man', 'IM', '44-1624'),
(245, 'Jersey', 'JE', '44-1534'),
(247, 'Curaçao', 'CW', '599'),
(248, 'Ivory Coast', 'CI', '225'),
(249, 'Kosovo', 'XK', '383');

-- --------------------------------------------------------

--
-- Table structure for table `hotel_address`
--

CREATE TABLE `hotel_address` (
  `hotel_address_id` int(11) NOT NULL,
  `hotel_id` int(11) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `effective_from_dt` date DEFAULT NULL,
  `effective_end_dt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Table structure for table `hotel_cost`
--

CREATE TABLE `hotel_cost` (
  `cost_type_id` int(11) NOT NULL,
  `cost_type_name` varchar(30) DEFAULT NULL,
  `effective_from_dt` date DEFAULT NULL,
  `effective_end_dt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hotel_images`
--

CREATE TABLE `hotel_images` (
  `hotel_image_id` int(11) NOT NULL,
  `hotel_id` int(11) DEFAULT NULL,
  `hotel_image_path` varchar(256) DEFAULT NULL,
  `effective_from_dt` date DEFAULT NULL,
  `effective_end_dt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hotel_master`
--

CREATE TABLE `hotel_master` (
  `hotel_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `cost_type_id` int(11) DEFAULT NULL,
  `hotel_name` varchar(50) DEFAULT NULL,
  `hotel_description` varchar(150) DEFAULT NULL,
  `hotel_rating` int(11) NOT NULL,
  `phone_no` varchar(15) DEFAULT NULL,
  `hotel_image_path` varchar(100) NOT NULL,
  `hotel_cost` decimal(10,2) NOT NULL,
  `sub_location` varchar(50) DEFAULT NULL,
  `effective_from_dt` date DEFAULT NULL,
  `effective_end_dt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hotel_master`
--

-- --------------------------------------------------------

--
-- Table structure for table `landmark_feature`
--

CREATE TABLE `landmark_feature` (
  `landmark_feature_id` int(11) NOT NULL,
  `landmark_id` int(11) DEFAULT NULL,
  `feature_description` varchar(256) DEFAULT NULL,
  `effective_from_dt` date DEFAULT NULL,
  `effective_end_dt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `landmark_images`
--

CREATE TABLE `landmark_images` (
  `landmark_image_id` int(11) NOT NULL,
  `landmark_id` int(11) DEFAULT NULL,
  `landmark_image_path` varchar(256) DEFAULT NULL,
  `effective_from_dt` date DEFAULT NULL,
  `effective_end_dt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `landmark_master`
--

CREATE TABLE `landmark_master` (
  `landmark_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `landmark_name` varchar(50) DEFAULT NULL,
  `landmark_description` varchar(256) DEFAULT NULL,
  `effective_from_dt` date DEFAULT NULL,
  `effective_end_dt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `location_master`
--

CREATE TABLE `location_master` (
  `location_id` int(11) NOT NULL,
  `location_name` varchar(50) DEFAULT NULL,
  `location_image_path` varchar(256) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `narration` varchar(256) DEFAULT NULL,
  `effective_from_dt` date DEFAULT NULL,
  `effective_end_dt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `location_master`
--

INSERT INTO `location_master` (`location_id`, `location_name`, `location_image_path`, `country_id`, `narration`, `effective_from_dt`, `effective_end_dt`) VALUES
(1, 'Goa', 'images/bg.jpg', 99, 'Goa is a good place', '2121-04-14', NULL),
(2, 'Kodaikanal', 'images/bg2.jpg', 99, 'jhskdd', '2121-04-14', '2121-04-14'),
(3, 'Ooty', 'images/bg3.jpg', 1, 'Hello', '2121-04-14', NULL),
(4, 'Udaipur', 'images/AIsol.png', 1, 'joking', '2121-04-14', NULL),
(5, 'Spiti', 'images/AIsol.png', 99, 'testing', '2121-04-20', NULL),
(6, 'Alleppey', '/tripppy/images/AIsol.png', 1, '', '2121-04-20', NULL),
(7, 'Coorg', '/tripppy/images/AIsol.png', 1, 'dskjlk', '2121-04-22', NULL),
(8, 'Katch', 'images/bg.jpg', 1, 'hghgh', '2121-04-22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_master`
--

CREATE TABLE `role_master` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(20) DEFAULT NULL,
  `effective_from_dt` date DEFAULT NULL,
  `effective_end_dt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role_master`
--

INSERT INTO `role_master` (`role_id`, `role_name`, `effective_from_dt`, `effective_end_dt`) VALUES
(1, 'Admin', '2021-03-26', NULL),
(2, 'User', '2021-03-26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `state_master`
--

CREATE TABLE `state_master` (
  `state_id` int(11) NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  `state_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `state_master`
--

INSERT INTO `state_master` (`state_id`, `country_id`, `state_name`) VALUES
(1, 99, 'ANDHRA PRADESH'),
(2, 99, 'ASSAM'),
(3, 99, 'ARUNACHAL PRADESH'),
(4, 99, 'GUJRAT'),
(5, 99, 'BIHAR'),
(6, 99, 'HARYANA'),
(7, 99, 'HIMACHAL PRADESH'),
(8, 99, 'JAMMU & KASHMIR'),
(9, 99, 'KARNATAKA'),
(10, 99, 'KERALA'),
(11, 99, 'MADHYA PRADESH'),
(12, 99, 'MAHARASHTRA'),
(13, 99, 'MANIPUR'),
(14, 99, 'MEGHALAYA'),
(15, 99, 'MIZORAM'),
(16, 99, 'NAGALAND'),
(17, 99, 'ORISSA'),
(18, 99, 'PUNJAB'),
(19, 99, 'RAJASTHAN'),
(20, 99, 'SIKKIM'),
(21, 99, 'TAMIL NADU'),
(22, 99, 'TRIPURA'),
(23, 99, 'UTTAR PRADESH'),
(24, 99, 'WEST BENGAL'),
(25, 99, 'GOA'),
(26, 99, 'PONDICHERY'),
(27, 99, 'LAKSHDWEEP'),
(28, 99, 'DAMAN & DIU'),
(29, 99, 'DADRA & NAGAR'),
(30, 99, 'CHANDIGARH'),
(31, 99, 'ANDAMAN & NICOBAR'),
(32, 99, 'UTTARANCHAL'),
(33, 99, 'JHARKHAND'),
(34, 99, 'CHATTISGARH'),
(35, 99, 'ASSAM');

-- --------------------------------------------------------

--
-- Table structure for table `user_master`
--

CREATE TABLE `user_master` (
  `user_id` int(11) NOT NULL,
  `email_id` varchar(50) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `full_name` varchar(50) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `effective_from_dt` date DEFAULT NULL,
  `effective_end_dt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_master`
--

INSERT INTO `user_master` (`user_id`, `email_id`, `password`, `full_name`, `role_id`, `effective_from_dt`, `effective_end_dt`) VALUES
(1, 'admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 'Admin Account', 1, NULL, NULL),
(3, 'aayush@gmail.com', '6bc80b9416b95aac0cf7757fc1bb1e65', 'Aayush Dua', 2, '2121-03-26', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `country_master`
--
ALTER TABLE `country_master`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `hotel_address`
--
ALTER TABLE `hotel_address`
  ADD PRIMARY KEY (`hotel_address_id`),
  ADD KEY `hotel_id` (`hotel_id`);

--
-- Indexes for table `hotel_cost`
--
ALTER TABLE `hotel_cost`
  ADD PRIMARY KEY (`cost_type_id`);

--
-- Indexes for table `hotel_images`
--
ALTER TABLE `hotel_images`
  ADD PRIMARY KEY (`hotel_image_id`),
  ADD KEY `hotel_id` (`hotel_id`);

--
-- Indexes for table `hotel_master`
--
ALTER TABLE `hotel_master`
  ADD PRIMARY KEY (`hotel_id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `cost_type_id` (`cost_type_id`);

--
-- Indexes for table `landmark_feature`
--
ALTER TABLE `landmark_feature`
  ADD PRIMARY KEY (`landmark_feature_id`),
  ADD KEY `landmark_id` (`landmark_id`);

--
-- Indexes for table `landmark_images`
--
ALTER TABLE `landmark_images`
  ADD PRIMARY KEY (`landmark_image_id`),
  ADD KEY `landmark_id` (`landmark_id`);

--
-- Indexes for table `landmark_master`
--
ALTER TABLE `landmark_master`
  ADD PRIMARY KEY (`landmark_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `location_master`
--
ALTER TABLE `location_master`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `country_id` (`country_id`);

--
-- Indexes for table `role_master`
--
ALTER TABLE `role_master`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `state_master`
--
ALTER TABLE `state_master`
  ADD PRIMARY KEY (`state_id`),
  ADD KEY `country_id` (`country_id`);

--
-- Indexes for table `user_master`
--
ALTER TABLE `user_master`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `country_master`
--
ALTER TABLE `country_master`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT for table `hotel_address`
--
ALTER TABLE `hotel_address`
  MODIFY `hotel_address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hotel_cost`
--
ALTER TABLE `hotel_cost`
  MODIFY `cost_type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotel_images`
--
ALTER TABLE `hotel_images`
  MODIFY `hotel_image_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotel_master`
--
ALTER TABLE `hotel_master`
  MODIFY `hotel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `landmark_feature`
--
ALTER TABLE `landmark_feature`
  MODIFY `landmark_feature_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `landmark_images`
--
ALTER TABLE `landmark_images`
  MODIFY `landmark_image_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `landmark_master`
--
ALTER TABLE `landmark_master`
  MODIFY `landmark_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `location_master`
--
ALTER TABLE `location_master`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `role_master`
--
ALTER TABLE `role_master`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `state_master`
--
ALTER TABLE `state_master`
  MODIFY `state_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `user_master`
--
ALTER TABLE `user_master`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hotel_address`
--
ALTER TABLE `hotel_address`
  ADD CONSTRAINT `hotel_address_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel_master` (`hotel_id`);

--
-- Constraints for table `hotel_images`
--
ALTER TABLE `hotel_images`
  ADD CONSTRAINT `hotel_images_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel_master` (`hotel_id`);

--
-- Constraints for table `hotel_master`
--
ALTER TABLE `hotel_master`
  ADD CONSTRAINT `hotel_master_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location_master` (`location_id`),
  ADD CONSTRAINT `hotel_master_ibfk_2` FOREIGN KEY (`cost_type_id`) REFERENCES `hotel_cost` (`cost_type_id`);

--
-- Constraints for table `landmark_feature`
--
ALTER TABLE `landmark_feature`
  ADD CONSTRAINT `landmark_feature_ibfk_1` FOREIGN KEY (`landmark_id`) REFERENCES `landmark_master` (`landmark_id`);

--
-- Constraints for table `landmark_images`
--
ALTER TABLE `landmark_images`
  ADD CONSTRAINT `landmark_images_ibfk_1` FOREIGN KEY (`landmark_id`) REFERENCES `landmark_master` (`landmark_id`);

--
-- Constraints for table `landmark_master`
--
ALTER TABLE `landmark_master`
  ADD CONSTRAINT `landmark_master_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location_master` (`location_id`);

--
-- Constraints for table `location_master`
--
ALTER TABLE `location_master`
  ADD CONSTRAINT `location_master_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country_master` (`country_id`);

--
-- Constraints for table `state_master`
--
ALTER TABLE `state_master`
  ADD CONSTRAINT `state_master_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country_master` (`country_id`);

--
-- Constraints for table `user_master`
--
ALTER TABLE `user_master`
  ADD CONSTRAINT `user_master_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role_master` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
