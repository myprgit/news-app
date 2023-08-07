-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Aug 07, 2023 at 03:47 PM
-- Server version: 8.0.32
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `news_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int NOT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date` datetime NOT NULL,
  `title` text NOT NULL,
  `url` text NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `category`, `source`, `author`, `date`, `title`, `url`, `content`, `created_at`, `updated_at`) VALUES
(331, 'US', 'THE NEW YORK TIMES', 'KAROUN DEMIRJIAN', '2023-08-01 00:27:55', 'Biden Cancels Space Command Move to Alabama Amid Tuberville Feud', 'https://www.nytimes.com/2023/07/31/us/biden-space-force-alabama-colorado.html', 'The Pentagon announced on Monday that President Biden had canceled an order by former President Donald J. Trump to move the United States Space Command headquarters to Alabama, prompting an outcry from Republicans who accused him of acting out of political spite amid a fierce partisan standoff over the Pentagon’s abortion access policies.', '2023-08-07 06:27:46', '2023-08-07 06:27:46'),
(332, 'Arts', 'THE NEW YORK TIMES', 'ELISABETH VINCENTELLI', '2023-08-01 01:15:10', 'Paul Reubens Was More Than Pee-wee. Here are 8 Great Performances.', 'https://www.nytimes.com/2023/07/31/arts/television/paul-reuben-pee-wee-herman-movies-tv-shows.html', 'Paul Reubens, who died on Sunday at age 70, will always be remembered for his beloved alter ego, the perpetually childlike Pee-wee Herman — a character so popular that it was able to carry a stage show, movies and a TV series. But Reubens also made memorable impressions playing a variety of supporting characters of the big and small screens — like Penguin’s father in “Batman Returns” and the turtleneck-wearing fixer Mr. Vargas in “The Blacklist,” just to name a few out of dozens.', '2023-08-07 06:27:46', '2023-08-07 06:27:46'),
(333, 'Crosswords & Games', 'THE NEW YORK TIMES', 'SAM CORBIN', '2023-08-01 02:00:07', 'Crunch Muscles, for Short', 'https://www.nytimes.com/2023/07/31/crosswords/daily-puzzle-2023-08-01.html', 'Jump to: Today’s Theme | Tricky Clues | Solving Tip', '2023-08-07 06:27:46', '2023-08-07 06:27:46'),
(334, 'US', 'THE NEW YORK TIMES', 'MAGGIE HABERMAN', '2023-08-01 03:00:04', 'After Paying Lawyers, Trump’s PAC Is Nearly Broke', 'https://www.nytimes.com/2023/07/31/us/politics/trump-pac-filing.html', 'Former President Donald J. Trump’s political action committee, which began last year with $105 million, now has less than $4 million left in its account after paying tens of millions of dollars in legal fees for Mr. Trump and his associates.', '2023-08-07 06:27:46', '2023-08-07 06:27:46'),
(335, 'Briefing', 'THE NEW YORK TIMES', 'NATASHA FROST', '2023-08-01 03:39:08', 'Tuesday Briefing', 'https://www.nytimes.com/2023/07/31/briefing/ukraine-strikes-trump-myanmar.html', 'A Times investigation found evidence that at least three different Ukrainian-made drone models had been used in attacks inside Russia, including Moscow, indicating a Ukrainian role in strikes that Kyiv has denied carrying out or declined to claim responsibility for. Ukraine is racing to scale up its drone fleet, and to attack more frequently in Russia.', '2023-08-07 06:27:46', '2023-08-07 06:27:46'),
(336, 'Science', 'THE NEW YORK TIMES', 'KATRINA MILLER', '2023-08-01 04:01:13', 'Move Over, Men: Women Were Hunters, Too', 'https://www.nytimes.com/2023/08/01/science/anthropology-women-hunting.html', 'It’s often viewed as a given: Men hunted, women gathered. After all, the anthropological reasoning went, men were naturally more aggressive, whereas the slower pace of gathering was ideal for women, who were mainly focused on caretaking.', '2023-08-07 06:27:46', '2023-08-07 06:27:46'),
(337, 'World', 'THE NEW YORK TIMES', 'NEIL MACFARQUHAR', '2023-08-01 04:01:14', 'Putin’s Crackdown Leaves Transgender Russians Bracing for Worse', 'https://www.nytimes.com/2023/08/01/world/europe/russia-transgender-ban.html', 'Jan Dvorkin had raised and nurtured his adopted son in Moscow for seven years until, one day in May, the Russian authorities notified him they were revoking custody. A woman Mr. Dvorkin knew had filed an official complaint, saying that because he was transgender and gay, he was an unfit parent.', '2023-08-07 06:27:46', '2023-08-07 06:27:46'),
(338, 'Corrections', 'THE NEW YORK TIMES', '', '2023-08-01 04:10:40', 'Quotation of the Day: Scientists Revive Two Roundworms That Were Encased in Siberian Permafrost for 46,000 Years', 'https://www.nytimes.com/2023/08/01/pageoneplus/quotation-of-the-day-scientists-revive-two-roundworms-that-were-encased-in-siberian-permafrost-for-46000-years.html', '“That’s the interest of science. You end somewhere you didn’t presume.”', '2023-08-07 06:27:46', '2023-08-07 06:27:46'),
(339, 'Corrections', 'THE NEW YORK TIMES', '', '2023-08-01 04:18:36', 'Corrections: Aug. 1, 2023', 'https://www.nytimes.com/2023/08/01/pageoneplus/corrections-aug-1-2023.html', 'A picture caption with an article on Friday about the 70th anniversary of the armistice that halted the Korean War misstated the length of that conflict. It lasted about three years and one month, not less than three years.', '2023-08-07 06:27:46', '2023-08-07 06:27:46'),
(340, 'US', 'THE NEW YORK TIMES', '', '2023-08-01 04:19:08', 'Topline Results: July 2023 Times/Siena Poll of Registered Voters', 'https://www.nytimes.com/interactive/2023/08/01/us/elections/times-siena-poll-registered-voters-toplines.html', 'Responses from a survey of 1,329 registered voters nationwide, including an oversample of 818 registered Republican voters, conducted July 23-27, 2023', '2023-08-07 06:27:46', '2023-08-07 06:27:46'),
(341, '', 'THE WASHINGTON POST', 'ISABELLE KHURSHUDYAN', '2023-08-06 06:34:33', 'Ukraine\'s elite Alpha division uses technology to fight Russian forces - The Washington Post - The Washington Post', 'https://www.washingtonpost.com/world/2023/08/06/ukraine-special-forces-alpha-counteroffensive/', 'Minefields are now preventing special operators from sneaking behind enemy lines, forcing Ukraine\'s most elite soldiers to rely on technology.', '2023-08-07 06:27:46', '2023-08-07 06:27:46'),
(342, '', 'FORBES', 'ALFRED KONUWA', '2023-08-06 04:20:40', 'WWE SummerSlam 2023 Results: Winners And Grades From Ford Field - Forbes', 'https://www.forbes.com/sites/alfredkonuwa/2023/08/06/wwe-summerslam-2023-results-winners-and-grades-from-ford-field/', 'WWE SummerSlam 2023 results with Roman Reigns vs. Jey Uso in a Tribal Combat main event.', '2023-08-07 06:27:46', '2023-08-07 06:27:46'),
(343, '', 'KTLA LOS ANGELES', 'VIVIAN CHOW', '2023-08-06 04:08:38', 'Winning $82 million Super Lotto Plus ticket sold in Southern California - KTLA Los Angeles', 'https://ktla.com/news/local-news/winning-82-million-super-lotto-plus-ticket-drawn-in-southern-california/', 'Southern California’s newest millionaire was crowned Saturday night after one winning ticket hit all six numbers for the $82 million Super Lotto Plus jackpot. Saturday’s winning numbers were 17, 19, 23, 31, 33 with Mega number 14.  The winning ticket was sold…', '2023-08-07 06:27:46', '2023-08-07 06:27:46'),
(344, '', 'NBC BAY AREA', 'CAMERON LALLANA', '2023-08-06 03:52:40', 'Contra Costa Health investigates Richmond spa over possible link with Legionnaires\' Disease deaths - NBC Bay Area', 'https://www.nbcbayarea.com/news/local/contra-costa-health-investigates-east-bay-spa/3289205/', 'Contra Costa Health is investigating a Richmond spa potentially linked with two deaths associated with Legionnaires\'s Disease, the agency said Saturday.', '2023-08-07 06:27:46', '2023-08-07 06:27:46'),
(345, '', 'NBC SOUTHERN CALIFORNIA', 'BRIAN ZEPEDA VAZQUEZ', '2023-08-06 03:28:46', 'Health officials warn of rise in Valley Fever infections across California - NBC Southern California', 'https://www.nbclosangeles.com/news/health-wellness/health-officials-warn-of-rise-in-valley-fever-infections-across-california/3200352/', 'California public health officials urge caution as high rainfall this past winter could lead to an increase in Valley fever infections across the state.', '2023-08-07 06:27:46', '2023-08-07 06:27:46'),
(346, '', 'DW (ENGLISH)', 'DEUTSCHE WELLE', '2023-08-06 03:12:15', 'Nigeria Senate cautions against Niger military intervention - DW (English)', 'https://www.dw.com/en/nigeria-senate-cautions-against-niger-military-intervention/a-66450388', 'ECOWAS chair Nigeria set a deadline for Sunday for Niger\'s coup leaders to cede power or face military intervention. But the Senate leader urged President Tinubu to continue diplomatic efforts as the ultimatum neared.', '2023-08-07 06:27:46', '2023-08-07 06:27:46'),
(347, '', 'WTOP', 'IVY LYONS', '2023-08-06 03:00:00', '‘This is not a warzone.’ DC police chief says 3 dead, 2 injured in mass shooting - WTOP', 'https://wtop.com/crime/2023/08/war-zone-5-injured-deadly-southeast-mass-shooting-dc-police-say/', 'Officers responded to a shooting near the intersection of Good Hope Road and 16th Street SE before 9 p.m.', '2023-08-07 06:27:46', '2023-08-07 06:27:46'),
(348, '', 'CBS SPORTS', '', '2023-08-06 02:54:00', 'White Sox\'s Tim Anderson and Guardians\' José Ramírez trade punches during brawl at Progressive Field - CBS Sports', 'https://www.cbssports.com/mlb/news/white-soxs-tim-anderson-and-guardians-jose-ramirez-trade-punches-during-brawl-at-progressive-field/', 'Ramírez appeared to be upset with Anderson after sliding into second base', '2023-08-07 06:27:46', '2023-08-07 06:27:46'),
(349, '', 'CNN', 'DAN HECHING', '2023-08-06 02:26:00', 'Angus Cloud’s mother says the ‘Euphoria’ star ‘did not intend to end his life’ - CNN', 'https://www.cnn.com/2023/08/05/entertainment/angus-cloud-cause-of-death-mother-euphoria/index.html', 'The mother of “Euphoria” star Angus Cloud, who died Monday at age 25, has shared more details about his cause of death.', '2023-08-07 06:27:46', '2023-08-07 06:27:46'),
(350, '', 'CBS NEWS', '', '2023-08-06 02:19:00', 'Justice Department requests protective order in Trump election interference case to limit his public comments - CBS News', 'https://www.cbsnews.com/news/donald-trump-election-interference-case-justice-department-requests-protective-order/', 'The order would limit what information former President Donald Trump and his legal team could share publicly about the case brought by special counsel Jack Smith.', '2023-08-07 06:27:46', '2023-08-07 06:27:46'),
(351, 'World', 'THE GUARDIAN', '', '2023-08-07 06:24:07', 'Russia-Ukraine war live: US and German air defence systems producing ‘significant results’, Zelenskiy says', 'https://www.theguardian.com/world/live/2023/aug/07/russia-ukraine-war-live-us-german-air-defence-systems-producing-significant-results-zelenskiy-says', 'Russia-Ukraine war live: US and German air defence systems producing ‘significant results’, Zelenskiy says', '2023-08-07 06:27:46', '2023-08-07 06:27:46'),
(352, 'Australia', 'THE GUARDIAN', '', '2023-08-07 06:23:10', 'Australia politics live: leaking of Sofronoff report ahead of official release ‘a significant lapse of judgment’, ACT government says', 'https://www.theguardian.com/australia-news/live/2023/aug/07/australia-politics-live-indigenous-voice-to-parliament-question-time-anthony-albanese-peter-dutton-sofronoff-lehrmann-act-andrew-barr', 'Australia politics live: leaking of Sofronoff report ahead of official release ‘a significant lapse of judgment’, ACT government says', '2023-08-07 06:27:46', '2023-08-07 06:27:46'),
(353, 'Travel', 'THE GUARDIAN', '', '2023-08-07 06:00:34', 'A local’s guide to Reykjavík, Iceland: the best bars, cafes, beaches and geothermal pools', 'https://www.theguardian.com/travel/2023/aug/07/a-locals-guide-to-reykjavik-iceland-the-best-bars-cafes-beaches-and-geothermal-pools', 'A local’s guide to Reykjavík, Iceland: the best bars, cafes, beaches and geothermal pools', '2023-08-07 06:27:46', '2023-08-07 06:27:46'),
(354, 'Money', 'THE GUARDIAN', '', '2023-08-07 06:00:33', 'How to get better at DIY without spending a fortune', 'https://www.theguardian.com/money/2023/aug/07/better-diy-best-tools-jobs', 'How to get better at DIY without spending a fortune', '2023-08-07 06:27:46', '2023-08-07 06:27:46'),
(355, 'Environment', 'THE GUARDIAN', '', '2023-08-07 06:00:33', 'Progress on slowing deforestation could boost climate efforts, say experts', 'https://www.theguardian.com/environment/2023/aug/07/progress-on-slowing-deforestation-could-boost-climate-efforts-say-experts-aoe', 'Progress on slowing deforestation could boost climate efforts, say experts', '2023-08-07 06:27:46', '2023-08-07 06:27:46'),
(356, 'Books', 'THE GUARDIAN', '', '2023-08-07 06:00:33', 'Caret by Adam Mars-Jones review – God is in the detail', 'https://www.theguardian.com/books/2023/aug/07/caret-by-adam-mars-jones-review-god-is-in-the-detail-john-cromer', 'Caret by Adam Mars-Jones review – God is in the detail', '2023-08-07 06:27:46', '2023-08-07 06:27:46'),
(357, 'Opinion', 'THE GUARDIAN', '', '2023-08-07 06:00:32', 'Email makes my fingers tingle and my stomach drop with dread. Can’t we go back to pigeons? | Emma Beddington', 'https://www.theguardian.com/commentisfree/2023/aug/07/email-dread-pigeons-message-inbox', 'Email makes my fingers tingle and my stomach drop with dread. Can’t we go back to pigeons? | Emma Beddington', '2023-08-07 06:27:46', '2023-08-07 06:27:46'),
(358, 'Television & radio', 'THE GUARDIAN', '', '2023-08-07 05:20:31', 'TV tonight: Adrien Brody stars in second season of big LA Lakers drama', 'https://www.theguardian.com/tv-and-radio/2023/aug/07/tv-tonight-adrian-brody-stars-in-second-season-of-big-la-lakers-drama', 'TV tonight: Adrien Brody stars in second season of big LA Lakers drama', '2023-08-07 06:27:46', '2023-08-07 06:27:46'),
(359, 'Sport', 'THE GUARDIAN', '', '2023-08-07 05:06:30', 'Ruthless Diamonds exude belief as netball dominance of years gone by returns | Megan Maurice', 'https://www.theguardian.com/sport/blog/2023/aug/07/netball-world-cup-2023-winner-australia-diamonds-vs-england', 'Ruthless Diamonds exude belief as netball dominance of years gone by returns | Megan Maurice', '2023-08-07 06:27:46', '2023-08-07 06:27:46'),
(360, 'Business', 'THE GUARDIAN', '', '2023-08-07 05:00:32', 'London pulls away from rest of Britain in competitiveness index', 'https://www.theguardian.com/business/2023/aug/07/london-south-east-competitiveness-index-investors', 'London pulls away from rest of Britain in competitiveness index', '2023-08-07 06:27:46', '2023-08-07 06:27:46'),
(361, '', 'CNN', 'BENJAMIN BROWN', '2023-08-06 14:04:00', 'At least 30 killed, 67 injured after train derails in Pakistan - CNN', 'https://www.cnn.com/2023/08/06/asia/pakistan-train-derails-intl/index.html', 'At least 30 people were killed and 67 injured after a train derailed in Pakistan on Sunday, according to public broadcaster Radio Pakistan.', '2023-08-07 15:05:26', '2023-08-07 15:05:26'),
(362, '', 'YOUTUBE', '', '2023-08-06 14:00:08', 'SummerSlam Rundown: WWE\'s The Bump, August 6, 2023 - WWE', 'https://www.youtube.com/watch?v=W4JwkoVF41M', 'Hear from new WWE Women\'s Champion IYO SKY and Damage CTRL after SKY\'s SummerSlam win as Kayla Braxton, Matt Camp, Ryan Pappolla and Megan Morant recap all o...', '2023-08-07 15:05:26', '2023-08-07 15:05:26'),
(363, '', 'REUTERS', 'REUTERS', '2023-08-06 13:57:00', 'Musk says fight with Zuckerberg will be live-streamed on X - Reuters', 'https://www.reuters.com/technology/musk-says-fight-with-zuckerberg-will-be-live-streamed-x-2023-08-06/', 'Elon Musk said in a social media post that his proposed cage fight with Meta <a href=\"https://www.reuters.com/markets/companies/META.O\" target=\"_blank\">(META.O)</a> CEO Mark Zuckerberg would be live-streamed on social media platform X, formerly known as Twitt…', '2023-08-07 15:05:26', '2023-08-07 15:05:26'),
(364, '', 'THE ATHLETIC', 'JON GREENBERG', '2023-08-06 13:31:36', 'Greenberg: Tim Anderson’s nightmare season takes a KO in Cleveland - The Athletic', 'https://theathletic.com/4752707/2023/08/06/tim-anderson-jose-ramirez-indians-white-sox-fight/', 'Already arguably the least productive hitter in baseball, Anderson squared up to fight José Ramírez and became a league-wide punching bag.', '2023-08-07 15:05:26', '2023-08-07 15:05:26'),
(365, '', 'FORBES', 'PAUL TASSI', '2023-08-06 12:38:01', '‘Baldur’s Gate 3’ Prepared For 100,000 Concurrent Players, They’ve Gotten 700,000 - Forbes', 'https://www.forbes.com/sites/paultassi/2023/08/06/baldurs-gate-3-prepared-for-100000-concurrent-players-theyve-gotten-700000/', 'Larian’s Swen Vincke posted a tweet yesterday showing the game hitting 500,000 concurrent players, making it the third most played game on all of Steam He said that he told IT to only expect 100,000 concurrents at max.', '2023-08-07 15:05:26', '2023-08-07 15:05:26'),
(366, '', 'CNN', 'AIMEE LEWIS', '2023-08-06 12:08:00', 'US knocked out of Women’s World Cup after penalty shootout loss to Sweden - CNN', 'https://www.cnn.com/2023/08/05/football/usa-sweden-womens-world-cup-2023-spt-intl/index.html', 'The US’ participation in the Women’s World Cup is over, ending in the cruelest of defeats.', '2023-08-07 15:05:26', '2023-08-07 15:05:26'),
(367, '', 'INVESTOR\'S BUSINESS DAILY', 'INVESTOR\'S BUSINESS DAILY', '2023-08-06 11:52:00', 'What To Do After Market Skids; 5 Stocks Near Buy Points - Investor\'s Business Daily', 'https://www.investors.com/market-trend/stock-market-today/dow-jones-futures-what-to-as-market-rally-skids-5-stocks-near-buy-points/', 'Socks setting up include Tesla and Nvidia.', '2023-08-07 15:05:26', '2023-08-07 15:05:26'),
(368, '', 'BLOOMBERG', 'NANCY COOK', '2023-08-06 11:37:08', 'DeSantis Camp Hit by Gloom as Aides Worry Race Is Slipping Away - Bloomberg', 'https://www.bloomberg.com/news/articles/2023-08-06/desantis-camp-hit-by-gloom-as-aides-worry-race-is-slipping-away', 'Ron DeSantis promised a reset of his presidential campaign. Many of his campaign staffers are still waiting.', '2023-08-07 15:05:26', '2023-08-07 15:05:26'),
(369, '', 'INDIA TODAY', 'INDIATODAY', '2023-08-06 11:25:10', 'iPhone 15 launch date leaked - India Today', 'https://www.indiatoday.in/visualstories/technology/iphone-15-launch-date-leaked-54119-06-08-2023', 'iPhone 15 is expected to launch in the third week of September 2023. Here is everything we know so far about the upcoming new gen iPhone lineup.', '2023-08-07 15:05:26', '2023-08-07 15:05:26'),
(370, '', 'WIRED', 'DAVID NIELD', '2023-08-06 11:00:00', 'How to Automatically Delete Passcode Texts on Android and iOS - WIRED', 'https://www.wired.com/story/how-to-automatically-delete-passcode-texts-android-ios/', 'Here’s one simple way to reduce your security risk while logging in.', '2023-08-07 15:05:26', '2023-08-07 15:05:26'),
(371, 'Politics', 'THE GUARDIAN', '', '2023-08-07 15:03:46', 'First asylum seekers arrive on Bibby Stockholm barge in Dorset – UK politics live', 'https://www.theguardian.com/politics/live/2023/aug/07/small-boats-home-office-asylum-seekers-ascension-island-rwanda-policy-uk-politics-live-latest', 'First asylum seekers arrive on Bibby Stockholm barge in Dorset – UK politics live', '2023-08-07 15:05:27', '2023-08-07 15:05:27'),
(372, 'US', 'THE GUARDIAN', '', '2023-08-07 15:03:19', 'Trump faces deadline to respond after threat on social media drew protective order – live', 'https://www.theguardian.com/us-news/live/2023/aug/07/trump-social-post-jan-6-biden-desantis-2024-latest-news', 'Trump faces deadline to respond after threat on social media drew protective order – live', '2023-08-07 15:05:27', '2023-08-07 15:05:27'),
(373, 'World', 'THE GUARDIAN', '', '2023-08-07 14:59:00', 'Russia-Ukraine war live: Ukraine detains informer accused of helping Russia plot attack on Zelenskiy, says security service', 'https://www.theguardian.com/world/live/2023/aug/07/russia-ukraine-war-live-us-german-air-defence-systems-producing-significant-results-zelenskiy-says', 'Russia-Ukraine war live: Ukraine detains informer accused of helping Russia plot attack on Zelenskiy, says security service', '2023-08-07 15:05:27', '2023-08-07 15:05:27'),
(374, 'UK', 'THE GUARDIAN', '', '2023-08-07 14:55:37', 'First occupants of Bibby Stockholm barge taken onboard', 'https://www.theguardian.com/uk-news/2023/aug/07/first-occupants-of-bibby-stockholm-barge-taken-onboard', 'First occupants of Bibby Stockholm barge taken onboard', '2023-08-07 15:05:27', '2023-08-07 15:05:27'),
(375, 'World', 'THE GUARDIAN', '', '2023-08-07 14:53:33', 'Spanish lottery ticket seller faces charges of defrauding winner of €4.7m', 'https://www.theguardian.com/world/2023/aug/07/spanish-lottery-ticket-seller-faces-jail-on-charges-of-defrauding-winner-of-47m', 'Spanish lottery ticket seller faces charges of defrauding winner of €4.7m', '2023-08-07 15:05:27', '2023-08-07 15:05:27'),
(376, 'US', 'THE GUARDIAN', '', '2023-08-07 14:34:04', 'White mother sues Southwest Airlines after human trafficking accusation', 'https://www.theguardian.com/us-news/2023/aug/07/southwest-airlines-lawsuit-mother-human-trafficking', 'White mother sues Southwest Airlines after human trafficking accusation', '2023-08-07 15:05:27', '2023-08-07 15:05:27'),
(377, 'Stage', 'THE GUARDIAN', '', '2023-08-07 14:32:51', '‘I never knew what horrors were happening in there’: the show giving Woodhill prisoners’ bereaved families a voice', 'https://www.theguardian.com/stage/2023/aug/07/woodhill-prison-deaths', '‘I never knew what horrors were happening in there’: the show giving Woodhill prisoners’ bereaved families a voice', '2023-08-07 15:05:27', '2023-08-07 15:05:27'),
(378, 'UK', 'THE GUARDIAN', '', '2023-08-07 14:32:40', 'UK may try to send small boat arrivals to Ascension Island, minister confirms', 'https://www.theguardian.com/uk-news/2023/aug/07/uk-may-try-to-send-small-boat-arrivals-to-ascension-island-minister-confirms', 'UK may try to send small boat arrivals to Ascension Island, minister confirms', '2023-08-07 15:05:27', '2023-08-07 15:05:27'),
(379, 'US', 'THE GUARDIAN', '', '2023-08-07 14:31:27', 'DeSantis says Trump ‘of course lost’ in 2020 when pressed in interview', 'https://www.theguardian.com/us-news/2023/aug/07/desantis-trump-lost-2020-election', 'DeSantis says Trump ‘of course lost’ in 2020 when pressed in interview', '2023-08-07 15:05:27', '2023-08-07 15:05:27'),
(380, 'Opinion', 'THE GUARDIAN', '', '2023-08-07 14:30:42', 'Will Donald Trump be jailed before his trial? | Robert Reich', 'https://www.theguardian.com/commentisfree/2023/aug/07/will-donald-trump-be-jailed-before-trial', 'Will Donald Trump be jailed before his trial? | Robert Reich', '2023-08-07 15:05:27', '2023-08-07 15:05:27');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mehmet', 'mehmetyapar@windowslive.com', NULL, '$2y$10$RD68eAUlhPu7RzRIQagIM.bRgUJd1Mz8LESVSrZMPhmg81rGn44EK', '261gVxheC0BQyrL7F31Yp120SrqjiXT2lIcv0kxc8CPCEKO72rtKkcMPftfF', '2023-08-01 13:58:44', '2023-08-01 13:58:44');

-- --------------------------------------------------------

--
-- Table structure for table `user_authors`
--

CREATE TABLE `user_authors` (
  `id` int NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `author` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_authors`
--

INSERT INTO `user_authors` (`id`, `user_id`, `author`, `is_active`, `created_at`, `updated_at`) VALUES
(21, 1, 'NANCY COOK', 1, '2023-08-07 15:11:49', '2023-08-07 15:11:49');

-- --------------------------------------------------------

--
-- Table structure for table `user_categories`
--

CREATE TABLE `user_categories` (
  `id` int NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `category` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_sources`
--

CREATE TABLE `user_sources` (
  `id` int NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `source` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_authors`
--
ALTER TABLE `user_authors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_categories`
--
ALTER TABLE `user_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_sources`
--
ALTER TABLE `user_sources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=381;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_authors`
--
ALTER TABLE `user_authors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `user_categories`
--
ALTER TABLE `user_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_sources`
--
ALTER TABLE `user_sources`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_authors`
--
ALTER TABLE `user_authors`
  ADD CONSTRAINT `user_authors_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `user_categories`
--
ALTER TABLE `user_categories`
  ADD CONSTRAINT `user_categories_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `user_sources`
--
ALTER TABLE `user_sources`
  ADD CONSTRAINT `user_sources_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
