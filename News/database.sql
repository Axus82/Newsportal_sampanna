SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `assignment1`
--
-- --------------------------------------------------------
--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(5) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp(),
  `admin_image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `full_name`, `username`, `email`, `password`, `reg_date`, `admin_image`) VALUES
(1, 'Sujita Parajuli', 'sujita', 'sujitaparajuli@gmail.com', '3b6f3d0fc9d4cc902bb843d8a1900c485b0b4f3c', '2022-09-24 22:51:13', '');

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id` int(5) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `category` varchar(100) NOT NULL,
  `publishDate` datetime NOT NULL DEFAULT current_timestamp(),
  `image` varchar(100) NOT NULL,
  `publishedBy` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`id`, `title`, `content`, `category`, `publishDate`, `image`, `publishedBy`) VALUES
(1, 'LAMBORGGINI-AVENTADOR', 'Launched in 2011, the Lamborghini Aventador quickly became one of the brands most recognizable and successful supercars. Named after a fighting bull, like many of Lamborghinis cars, the Aventador is designed to deliver an unparalleled driving experience while embodying the bold, aggressive aesthetics that Lamborghini is known for.', 'Automobiles', '2025-01-24 22:51:50', 'lambo.jpg', 'Sampanna Bista'),
(2, 'WHAT IS 3D GAMING?', '3D gaming refers to video games that are designed using three-dimensional graphics, allowing players to experience a game world with depth and space. Unlike 2D games, where everything is flat, 3D games simulate environments, characters, and objects that appear to have height, width, and depth—creating a more lifelike and engaging experience.', 'Technology', '2025-01-24 22:52:15', 'gaming.jpg', 'Sampanna Bista'),
(3, 'EVOLUTION OF NEPALI CRICKET', 'Mens National Team: ODI Status and World Cup Qualifiers: In March 2018, Nepal secured One Day International ODI status for the first time by defeating Papua New Guinea during the World Cup Qualifiers in Zimbabwe. This achievement marked a pivotal moment in Nepals cricket history, elevating the teams status in international cricket.', 'Games', '2022-09-24 22:52:51', 'cricket.jpg', 'Sujita Parajuli'),
(4, 'REALISTIC HOLOGRAPHS', 'The Nvidia GeForce RTX 5090, unveiled at CES 2025, represents a significant advancement in GPU technology, offering unparalleled performance for gaming, AI applications, and content creation. Nvidia claims that the RTX 5090 delivers up to twice the performance of the RTX 4090 in certain scenarios, particularly when utilizing DLSS 4 technology. In gaming benchmarks, the RTX 5090 has demonstrated significant improvements, achieving over 100 frames per second in titles like Cyberpunk 2077 at 4K resolution.', 'Technology', '2025-01-24 22:58:17', 'rtx.jpg', 'Sampanna Bista'),
(5, 'LIONEL MESSI- FACE OF FOOTBALL', 'Lionel Messi, often regarded as one of the greatest footballers of all time, is an Argentine professional footballer. He was born on June 24, 1987, in Rosario, Argentina. Messi is known for his incredible dribbling, vision, passing, and goal-scoring abilities, which have earned him numerous awards, including multiple Ballon dOr titles. Messi began his professional career at FC Barcelona, where he spent over 20 years, becoming the clubs all-time top scorer and leading them to numerous La Liga and Champions League victories.', 'Sports', '2022-09-24 23:14:12', 'messi.jpg', 'Sampanna Bista');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(5) NOT NULL,
  `category` varchar(100) NOT NULL,
  `postedDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category`, `postedDate`) VALUES
(1, 'Entertainment', '2022-09-24 22:51:13'),
(2, 'Automobiles', '2022-09-24 22:51:13'),
(3, 'Technology', '2022-09-24 22:51:13'),
(4, 'Games', '2022-09-24 22:52:28'),
(5, 'Politics', '2022-09-24 22:54:37');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(5) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `commentText` varchar(200) NOT NULL,
  `newsId` int(5) NOT NULL,
  `comment_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(5) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp(),
  `user_image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `full_name`, `username`, `email`, `password`, `reg_date`, `user_image`) VALUES
(1, 'Apshan Paudel', 'apshan', 'apshanpaudel@gmail.com', 'dfe4fa3c1965591cc105080ffe2def149fded9b8', '2022-09-24 22:51:13', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

