-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Hostiteľ: 127.0.0.1
-- Čas generovania: Út 13.Jún 2017, 12:59
-- Verzia serveru: 5.7.14
-- Verzia PHP: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáza: `blog`
--

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `autori`
--

CREATE TABLE `autori` (
  `id` int(10) UNSIGNED NOT NULL,
  `meno` varchar(20) COLLATE utf8_slovak_ci NOT NULL,
  `priezvisko` varchar(30) COLLATE utf8_slovak_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

--
-- Sťahujem dáta pre tabuľku `autori`
--

INSERT INTO `autori` (`id`, `meno`, `priezvisko`) VALUES
(1, 'Michal', 'Dobsovic'),
(2, 'Peter', 'Novak');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `clanky`
--

CREATE TABLE `clanky` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(100) COLLATE utf8_slovak_ci NOT NULL,
  `autor` int(10) UNSIGNED NOT NULL,
  `datum` datetime NOT NULL,
  `nadpis` varchar(100) COLLATE utf8_slovak_ci NOT NULL,
  `perex` text COLLATE utf8_slovak_ci NOT NULL,
  `obsah` mediumtext COLLATE utf8_slovak_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

--
-- Sťahujem dáta pre tabuľku `clanky`
--

INSERT INTO `clanky` (`id`, `slug`, `autor`, `datum`, `nadpis`, `perex`, `obsah`) VALUES
(3, 'kto-je-dolezitejsi-ako-kocner-a-basternak', 1, '2017-06-13 14:43:53', 'Kto je dôležitejší ako Kočner a Bašternák', 'Na jednej strane dokážu zorganizovať pochody a zakladať vlastné médiá, na druhej strane riešia vzťahy, rodičov, sklamania a neúspech. ', '„Nebuďte smiešny a poskytnite ľuďom informácie, kto vás sponzoruje“ - Jaroslav Hutter\n„Naivita mladosti, ani nevedia za čo bojujú a kto ich vlastne podporuje - zneužíva. Cesta do pekla je dláždená dobrými úmyslami.“ - Tomrs Customovič\n"Sorošove deti, GLUPE SOPLANE, nevychované detiská.“\nA to sú len tie slušnejšie prívlastky, ktorými dnes ľudia na facebooku častujú mladých, ktorí organizovali protikorupčné pochody alebo otvorene hovoria svoj názor na stav v krajine, alebo aké správy im chodia do pošty.\nObjavujú sa v nich mnohé nechutné osobné útoky, príspevky plné nadávok a gramatických chýb, ktoré ich obviňujú z toho, že ich financujú mimovládne organizácie alebo večný strašiak hejslováckych síl Soros.\nAle práve naopak. Tí mladí nám dnes ukazujú, prečo práve oni sú budúcnosťou tejto krajiny.\n\n\nČítajte viac: https://komentare.sme.sk/c/20557180/nodhanajme-tie-glupe-soplane.html#ixzz4jszDKVB0'),
(4, 'studentska-redaktorka-pochod-je-len-zaciatok-nasa-generacia-zmeni-slovensko', 1, '2017-06-13 14:44:38', 'aaaŠtudentská redaktorka: Pochod je len začiatok, naša generácia zmení Slovensko', 'Študentka gymnázia MICHAELA WEBEROVÁ píše o protikorupčných protestoch a pomáha rovesníkom získať kvalitné vzdelanie.', 'Michaela Weberová má 18 rokov a už spoznala, aké je to byť terčom slovenských extrémistov a fanúšikov konšpiračných teórii.\nAko študentka Bilingválneho gymnázia C. S. Lewisa v Bratislave organizovala protest na podporu Stredoeurópskej univerzity v Maďarsku, tvorí obsah študentského online časopisu Heyou a súťažila v debatovaní.\nVerí, že jej generácia je plná aktívnych mladých ľudí, ktorí sa po čase dostanú do politiky a tretieho sektora, kde budú meniť Slovensko k lepšiemu. Dôkazom je podľa nej aj úspech protikorupčných pochodov.\nDenník SME v spolupráci so študentmi z časopisu Heyou bude v pondelok priebeh protestov sledovať minútu po minúte.\nAko sa darí vášmu časopisu?\n„Heyou pokrýva asi desať škôl a má niekoľko stoviek čitateľov prevažne z bratislavských gymnázií. Niekoľko prispievateľov pochádza aj z iných regiónov Slovenska.“\nPrečo ste sa rozhodli orientovať študentský časopis aj na politiku a spoločenské témy?\n„Vieme, že je dosť stredoškolákov, ktorých takéto témy zaujímajú. Už teraz čítajú denníky a časopisy, ktoré sú však orientované na dospelého čitateľa.\nNevideli sme médium, ktoré by prinášalo študentský pohľad na spoločenské problémy, prípadne vedu a techniku. Vnímali sme to ako dieru na trhu. Ja osobne to robím preto, lebo som sa zúčastňovala súťaží v debatovaní a to ma donútilo sledovať dianie v spoločnosti.“'),
(6, 'bbb', 1, '2017-06-13 14:52:50', 'xxx', 'yyy', 'zzz');

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `autori`
--
ALTER TABLE `autori`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `clanky`
--
ALTER TABLE `clanky`
  ADD PRIMARY KEY (`id`),
  ADD KEY `autor` (`autor`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `autori`
--
ALTER TABLE `autori`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pre tabuľku `clanky`
--
ALTER TABLE `clanky`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Obmedzenie pre exportované tabuľky
--

--
-- Obmedzenie pre tabuľku `clanky`
--
ALTER TABLE `clanky`
  ADD CONSTRAINT `clanky_ibfk_1` FOREIGN KEY (`autor`) REFERENCES `autori` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
