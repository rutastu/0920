-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 27, 2023 at 04:37 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `youtube`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Fashion'),
(2, 'Comedy'),
(3, 'Movie Trailers'),
(4, 'Music'),
(5, 'News');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(1, 'vardenis', 'gmail@gmail.com', 'a29458ad544126743be83500dbcaffeb'),
(2, 'pavardenis', 'pavardenis@gmail.com', 'a29458ad544126743be83500dbcaffeb');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `url` varchar(150) DEFAULT NULL,
  `thumbnail_url` varchar(150) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `url`, `thumbnail_url`, `name`, `description`, `category_id`, `user_id`) VALUES
(1, 'https://www.youtube.com/embed/dAMXGCwbI8I?si=GzgfDAt3qMmcost2', 'https://img.youtube.com/vi/dAMXGCwbI8I/hqdefault.jpg', 'Laikykitės ten', 'Laidos viešnia – JAV Sandanso kino festivalyje apdovanojimą už geriausią režisūrą pelniusio filmo „Tu man nieko neprimeni“ (Slow) režisierė ir Lietuvos pretendentė siekti „Oskaro“ – Marija Kavtaradzė.\nO pagrindinę temą dedikavome krepšiniui. Kodėl jis yra toks svarbus kiekvieno lietuvio gyvenime? Kodėl į kiekvienas rungtynes vilčių dedame daugiau negu į naują iphoną? Ir kaip tokiose nesibaigiančiose pergalių-pralaimėjimų sūpynėse mūsų vis dar nepradėjo pykinti.', 5, 1),
(2, 'https://www.youtube.com/embed/ob48163wzCk?si=I2WAVcLgWp7GVzj2', 'https://img.youtube.com/vi/ob48163wzCk/hqdefault.jpg', 'Pabaiga kailinių žvėrelių verslui', 'Ketvirtadienį (rugsėjo 21 d.) Tiek žinių vedėjas Timūras pasakoja apie Ukrainos laimėjimus kare, intensyvią rusijos sparnuotųjų raketų ataką, Ukrainos ir Lenkijos besitęsiantį konfliktą, pagaliau uždraustą kailinių žvėrelių verslą ir Vilniaus geto metines. ', 5, 1),
(3, 'https://www.youtube.com/embed/sehEI6O0JYQ?si=Pua8-aRK2GOSE-Zd', 'https://img.youtube.com/vi/sehEI6O0JYQ/hqdefault.jpg', 'Drobiazko be pilietybės?', 'Ketvirtadienį (rugsėjo 14 d.) Tiek žinių vedėja Silvija pasakoja apie rusijoje prisičiuožinėjusią Margaritą Drobiazko, vėl degantį Krymą, gyvenimo įgūdžių pamokų netylantį šaršalą ir naudą rinkimams bei Lietuvą sukrėtusias nelaimes. ', 5, 1),
(4, 'https://www.youtube.com/embed/kWlN1HwpnPQ?si=1RMYslYZEj5zhoz9', 'https://img.youtube.com/vi/kWlN1HwpnPQ/hqdefault.jpg', 'Skaitmenizacijos prakeiksmas – kur dėti senas baterijas?', 'Laidoje „Tvari Lietuva\" Elektronikos platintojų asociacijos EPA vadovas Linas Ivanauskas papasakos, kaip taisyklingai atsikratyti elektronikos atliekų ir kurios iš jų kelia didžiausią galvos skausmą perdirbėjams.', 5, 2),
(5, 'https://www.youtube.com/embed/x-xTttimcNk?si=PgCyaEspcWVqoax0', 'https://img.youtube.com/vi/x-xTttimcNk/hqdefault.jpg', 'Pink Floyd - Comfortably Numb', 'Provided to YouTube by Pink Floyd', 4, 2),
(6, 'https://www.youtube.com/embed/53N99Nim6WE?si=SVwn_MW3Z4g5ciRM', 'https://img.youtube.com/vi/53N99Nim6WE/hqdefault.jpg', 'Echoes - Pink Floyd', 'Echoes - Pink Floyd. Released on: 1971-11-05', 4, 2),
(7, 'https://www.youtube.com/embed/QkF3oxziUI4?si=pzFD9ad_Ad5KUCxY', 'https://img.youtube.com/vi/QkF3oxziUI4/hqdefault.jpg', 'Led Zeppelin - Stairway To Heaven (Official Audio)', 'Led Zeppelin - Stairway To Heaven (Official Audio) remastered from Led Zeppelin IV.', 4, 2),
(23, 'https://www.youtube.com/embed/vk6014HuxcE?si=eEGavDvPSHA_Lnf3', 'https://img.youtube.com/vi/vk6014HuxcE/hqdefault.jpg', 'JAY-Z - Empire State Of Mind ft. Alicia Keys', 'Music video by JAY-Z performing Empire State Of Mind. 2014 S. Carter Enterprises, LLC., Distributed by Roc Nation Records, LLC. ', 4, 2),
(24, 'https://www.youtube.com/embed/uYPbbksJxIg?si=Zkr3mIPua6dkdgLj', 'https://img.youtube.com/vi/uYPbbksJxIg/hqdefault.jpg', 'Oppenheimer | New Trailer', 'Oppenheimer - In Theaters 7 21 23', 3, 2),
(25, 'https://www.youtube.com/embed/eFYUX9l-m5I?si=HV4TkRIlywrblV7K', 'https://img.youtube.com/vi/eFYUX9l-m5I/hqdefault.jpg', 'A MAN CALLED OTTO - Official Trailer (HD)', 'Discover what can happen when you let life in. See Tom Hanks as Otto in select theaters Christmas and starts everywhere January 13. ', 3, 2),
(26, 'https://www.youtube.com/embed/Ades3pQbeh8?si=sZY3bUVDhT0wuDuG', 'https://img.youtube.com/vi/Ades3pQbeh8/hqdefault.jpg', 'ONE PIECE | Official Trailer | Netflix', 'Free Yourselves. Take to the Seas. The Journey to find the ONE PIECE begins August 31. Only on Netflix.', 3, 2),
(27, 'https://www.youtube.com/embed/89dGC8de0CA?si=XbXJ1xaSPmTIIzj8', 'https://img.youtube.com/vi/89dGC8de0CA/hqdefault.jpg', 'Aerosmith - Dream On (Audio)', '\"Dream On\" appeared on Aerosmith\'s debut, self-titled album in 1973, the band\'s first global hit.', 4, 2),
(28, 'https://www.youtube.com/embed/bLvqoHBptjg?si=9MsEPSLRoMpvlCvG', 'https://img.youtube.com/vi/bLvqoHBptjg/hqdefault.jpg', 'Forrest Gump - Trailer', 'Stupid is as stupid does, says Forrest Gump (played by Tom Hanks in an Oscar-winning performance) as he discusses his relative level of intelligence with a stranger while waiting for a bus. ', 3, 2),
(29, 'https://www.youtube.com/embed/ssIY8NYwvh4?si=oLKvJ6F3X8Rff-fj', 'https://img.youtube.com/vi/ssIY8NYwvh4/hqdefault.jpg', 'The Office CPR Complete scene.', 'The Office US. Season 5 episode 14 \"Stress Relief: Part 1\"', 2, 2),
(30, 'https://www.youtube.com/embed/FmSndM1lmC0?si=mMiVasv5Im6QbB3N', 'https://img.youtube.com/vi/FmSndM1lmC0/hqdefault.jpg', '\'UGLY CHIC\' - THE PRADA STORY', 'Miuccia Prada is regarded as one of the most influential and enigmatic fashion designers of modern times. For nearly four decades she has displayed her penchant for setting trends and bucking the ideas of her fellow designers, the now 71-year-old together with her CEO partner Patrizio Bertelli has transformed was essentially a small family business into one of the world’s most renowned multi billion dollar fashion houses.', 1, 2),
(31, 'https://www.youtube.com/embed/mfhBM_Yay6w?si=Ov8XHbmG9dhj4eHd', 'https://img.youtube.com/vi/mfhBM_Yay6w/hqdefault.jpg', 'The Dramatic Chipmunk', 'The original 5 second short of the dramatic chipmunk. Da da daaaaaaaa!', 2, 1),
(32, 'https://www.youtube.com/embed/B6hF6w_sMlw?si=NF1Q-7zJbWILKQID', 'https://img.youtube.com/vi/B6hF6w_sMlw/hqdefault.jpg', 'Is Trisha Smarter Than A 5th Grader? - Frenemies #4', 'Become a member for access to the episodes a day early with no ads and no cuts', 2, 2),
(33, 'https://www.youtube.com/embed/tKB4h9gvmm0?si=AhduiM_mNorcwZh1', 'https://img.youtube.com/vi/tKB4h9gvmm0/hqdefault.jpg', 'asdfmovie2', 'Written and Directed by Thomas Ridgewell', 2, 2),
(34, 'https://www.youtube.com/embed/GPQ1i0Az8Ds?si=pLi5Qf2xjrsE-AM1', 'https://img.youtube.com/vi/GPQ1i0Az8Ds/hqdefault.jpg', 'Dolce & Gabbana | Spring Summer 2024 | Full Show', 'Dolce & Gabbana | Spring Summer 2024 by Domenico Dolce and Stefano Gabbana | Full Fashion Show in High Definition', 1, 2),
(35, 'https://www.youtube.com/embed/BVhYWjExdrs?si=ZWM-nxCQBN8IAJde', 'https://img.youtube.com/vi/BVhYWjExdrs/hqdefault.jpg', '4 ideas all designers need to hear', 'In this video, I am going to talk about why you should allow yourself the freedom of being “bad” at graphic design and how failure can be your biggest superpower in a creative world.', 1, 2),
(36, 'https://www.youtube.com/embed/GBjbRSyvjoI?si=EqeU_vwmaHPiftNA', 'https://img.youtube.com/vi/GBjbRSyvjoI/hqdefault.jpg', 'I Designed Business Cards for my Fav Pokemon', 'you guys LOVED my animal crossing design vid so i thought i\'d do one for my fav pokemon! hope you enjoy hehe i had a lot of fun making this one and i reckon this is some of my best design work i\'ve done on the channel?? ever?? maybe?? awesome', 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
