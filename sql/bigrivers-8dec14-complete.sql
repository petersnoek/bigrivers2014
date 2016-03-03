-- phpMyAdmin SQL Dump
-- version 4.2.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 08, 2014 at 10:23 AM
-- Server version: 5.5.36-cll-lve
-- PHP Version: 5.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bigrivers`
--

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

CREATE TABLE IF NOT EXISTS `artist` (
`id` int(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext,
  `image` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `ytchannel` varchar(255) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `twitter` varchar(255) NOT NULL,
  `genre` varchar(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `created` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `author` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE IF NOT EXISTS `event` (
`id` int(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `short_description` varchar(500) NOT NULL,
  `description` varchar(5000) NOT NULL,
  `image` varchar(255) NOT NULL,
  `start` varchar(100) NOT NULL,
  `end` varchar(100) NOT NULL,
  `date` int(11) NOT NULL,
  `event_date` varchar(20) NOT NULL,
  `display_date` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `ticket` int(1) NOT NULL COMMENT 'Option iif event needs tickets 1 is true 0 is false',
  `location` varchar(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `created` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `author` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `title`, `short_description`, `description`, `image`, `start`, `end`, `date`, `event_date`, `display_date`, `price`, `ticket`, `location`, `status`, `created`, `modified`, `author`) VALUES
(39, 'Big Rivers Muziek', '<p>3 dagen lang genieten van Big Rivers Muziek: 9 binnen- en buiten podia in het centrum van Dordrecht. Een biertje drinken bij &eacute;&eacute;n van de barretjes en lekker snacken op het foodplein, maar daarna snel weer naar een bandje kijken: dat is het gevoel van Big Rivers!</p>', '<p>3 dagen lang genieten van Big Rivers Muziek: 9 binnen- en buiten podia in het centrum van Dordrecht. Een biertje drinken bij &eacute;&eacute;n van de barretjes en lekker snacken op het foodplein, maar daarna snel weer naar een bandje kijken: dat is het gevoel van Big Rivers!&nbsp;</p><p>&nbsp;</p>', '39.png', '', '', 1405116000, '12-07-2014', '10/11/12 juli', '', 1, '', 1, 1403017192, 1411564814, 'Liselotte'),
(40, 'Big Rivers Indoor', '<p>Big Rivers Indoor 3 zalen vol met muziek in Bibelot zaterdag 14 maart 2015</p>', '<p>Op zaterdag 14 maart zal voor de 2e keer in samenwerking met poppodium Bibelot Big Rivers Indoor worden gehouden. Direct na de eerste editie moesten we aan het publiek wel beloven hiermee door te gaan. En ja hoor het gaat weer gebeuren in de 3 zalen van Bibelot. Momenteel wordt er koorsachtig gewerkt aan de programmering, Want het moet zeker zo leuk zijn als vorig jaar en het liefst nog een schepje er boven op.</p><p>De avond zal wederom worden afgelsoten met een waanzinnige 70&#39;s party in de Mainstage.</p><p>Blijf ons volgen. Zodra de kaartverkoop wordt opgestart laten we dit weten. Like in ieder geval onze facebookpagina:&nbsp;https://www.facebook.com/bigriversdordrecht?fref=ts dan wordt je in ieder geval op de hoogte gehouden.</p><p>&nbsp;</p>', '', '19.00', '03.00', 0, '14 maart 2015', '14 maart 2015  ', '€ 8,50', 0, 'Bibelot', 1, 1411564329, 1411564556, 'Liselotte');

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE IF NOT EXISTS `genre` (
`id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`id`, `genre_id`, `artist_id`) VALUES
(1, 24, 63),
(2, 23, 66),
(3, 26, 66),
(4, 27, 66),
(5, 23, 67),
(6, 26, 67),
(7, 27, 67),
(8, 29, 67),
(9, 30, 67),
(10, 31, 67),
(11, 24, 68),
(12, 25, 68),
(13, 24, 69),
(14, 25, 69),
(15, 24, 70),
(16, 25, 70),
(17, 24, 71),
(18, 25, 71),
(19, 23, 72),
(20, 24, 72),
(21, 25, 72),
(22, 23, 73),
(23, 24, 73),
(24, 25, 73),
(25, 23, 74),
(26, 24, 74),
(27, 25, 74),
(28, 23, 62),
(29, 24, 62),
(30, 22, 63),
(31, 1, 64),
(32, 22, 64),
(33, 23, 64),
(34, 23, 65),
(35, 24, 66),
(36, 25, 66),
(37, 25, 67),
(38, 22, 68),
(39, 22, 72),
(40, 22, 73),
(41, 23, 77),
(42, 24, 83),
(43, 25, 83),
(44, 28, 84),
(45, 31, 84),
(46, 29, 85),
(47, 22, 86),
(48, 26, 86),
(49, 22, 87),
(50, 31, 90);

-- --------------------------------------------------------

--
-- Table structure for table `genre_cat`
--

CREATE TABLE IF NOT EXISTS `genre_cat` (
`id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `genre_cat`
--

INSERT INTO `genre_cat` (`id`, `name`) VALUES
(1, 'Jazz'),
(22, 'Blues'),
(23, 'Rock'),
(24, 'Metal'),
(25, 'Pop'),
(26, 'Reggae'),
(27, 'Hiphop'),
(28, 'latin'),
(29, 'Punk'),
(30, 'Country'),
(31, 'Ska');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
`id` int(255) NOT NULL,
  `title` varchar(512) NOT NULL,
  `body` longtext,
  `created` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `author` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `performance`
--

CREATE TABLE IF NOT EXISTS `performance` (
`id` int(11) NOT NULL,
  `description` longtext,
  `start` varchar(100) NOT NULL,
  `end` varchar(100) NOT NULL,
  `stage_id` int(255) NOT NULL,
  `performance_date` varchar(10) NOT NULL,
  `artist_id` int(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `created` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `author` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=148 ;

--
-- Dumping data for table `performance`
--

INSERT INTO `performance` (`id`, `description`, `start`, `end`, `stage_id`, `performance_date`, `artist_id`, `status`, `created`, `modified`, `author`) VALUES
(43, '<p>Bijna 35 jaar na het overlijden van Elvis Presley is zijn muziek voor het grote publiek nog steeds actueel. De muziek van Elvis is nog steeds even krachtig als voorheen en een grote inspiratie voor veel artiesten en zangers van nu. Nu op het Big Rivers Festival 18-07-2014 Concerten van &rsquo;Elvis Returns&rsquo; doen de oude tijden van de jaren &rsquo;70 in Vegas en Hawaii bij herleven.&nbsp;</p>', '20:00', '21:30', 14, '18-07-2014', 94, 1, 1402914607, 1403011338, 'Rianne'),
(44, '<div id="tabs-4"><p>Al bijna 25 jaar timmeren zij aan de weg, als &eacute;&eacute;n van de bekendste dialectbands van Nederland. Eind 2009 mochten zij vol trots de prijs &quot;Beste dialectband van Nederland&quot; in ontvangst nemen. Zelf noemen zij hun genre &#39;Rock &#39;n Loll&#39;.</p></div><div id="tabs-5">&nbsp;</div>', '22:30', '24:00', 14, '18-07-2014', 95, 1, 1402914780, 1403012827, 'Rianne'),
(45, '<div id="tabs-4"><p>THEM LEWIS BOYS: A TRIBUTE TO JERRY LEE - THE WILD ONE De band Them Lewis Boys, met pianist Jeroen Sweers achter het klavier, brengt een spectaculair eerbetoon aan de nog levende rock &#39;n&#39; roll legende uit de jaren 50 Jerry Lee Lewis.&nbsp;</p></div><div id="tabs-5">&nbsp;</div>', '18:00', '19:30', 14, '19-07-2014', 96, 1, 1402915099, 1403094708, 'Rianne'),
(46, '<div id="tabs-4"><p>De drie zoetgevooisde zangeressen in pin-upstijl en hun gevetkuifde live band steken de muziek van tegenwoordig in het oude lievelingsjasje, van Rock &amp; Roll, om roemruchte tijden te doen herleven.</p></div><div id="tabs-5"><div id="tabs-4"><p>&nbsp;</p></div><div id="tabs-5">&nbsp;</div></div>', '20:00', '21:30', 14, '19-07-2014', 97, 1, 1402915293, 1403094749, 'Rianne'),
(47, '<div id="tabs-4"><p>Met een mix van allerlei muziekstijlen wordt elke zaal, feesttent, club of festival omgetoverd in een groot feest. Wat je ziet, is volop theater en absurditeiten. Wat je hoort, is een stuwend lekker in het gehoorliggend eigen BZB-geluid.</p></div><div id="tabs-5">&nbsp;</div>', '22:30', '24:00', 14, '19-07-2014', 99, 1, 1402915384, 1403094790, 'Rianne'),
(48, '<div id="tabs-4"><p>Deze coverband doet vele grote bands uit de jaren &#39;60 herleven. De band heeft vorig seizoen een een tour langs de Nederlandse theaters gemaakt, speelde meer dan 25 keer op de TT in Assen, toert door Nederland met Armand en Dutch Neil Young als The Happy Hippies.</p></div>', '16:00', '17:30', 14, '20-07-2014', 100, 1, 1402915562, 1402915562, 'Rianne'),
(49, '<div id="tabs-4"><p>Undercover is een echte live band. Rauw en puur zoals de Stones zijn. Zonder een kopie te willen zijn van de Rolling Stones heeft Undercover een zanger met een net zo energieke performance als Mick Jagger en worden de legen- darische riffs van Keith Richards in authentieke stemming gespeeld.&nbsp;</p></div><div id="tabs-5">&nbsp;</div>', '18:00', '19:30', 14, '20-07-2014', 101, 1, 1402915634, 1402915634, 'Rianne'),
(50, '<p>Vanaf het eerste moment was duidelijk dat naast de muzikale vaardigheden ook de passie voor muziek een permanente &lsquo;gast&rsquo; van de band zal zijn. Ontstaan vanuit de passie voor muziek van de The Beatles en met de intentie om samen te spelen op het podium en een lacht te cre&euml;ren op de gezichten van het publiek.</p>', '20:00', '22:00', 14, '20-07-2014', 102, 1, 1402915791, 1402915791, 'Rianne'),
(51, '<div id="tabs-4"><p>Deze jonge band uit Sneek heeft het publiek speelt&nbsp;een aanstekelijke mix van Funk, Jazz en Hip Hop. F</p></div>', '20:45', '21:45', 15, '18-07-2014', 103, 1, 1402915963, 1402915963, 'Rianne'),
(52, '<div id="tabs-4"><p>Sinds de start in 2009 mag Laura Vane &amp; The Vipertones zich verheugen op een trouwe fanbase over de gehele wereld. Vanuit de &lsquo;underground&rsquo; Soul &amp; Funk scene - waar de eerste twee albums met overweldigend enthousiasme werden ontvangen - veroverden zij de harten van vele fans. Nu - anno 2014 &ndash; verschuift de bekende retro-soulstijl van de band langzaam naar iets rauwers, waarbij de band zich laat verleiden tot meer eigentijdse popliedjes.&nbsp;</p></div><div id="tabs-5">&nbsp;</div>', '22:45', '24:00', 15, '18-07-2014', 104, 1, 1402916050, 1402916050, 'Rianne'),
(53, '<div id="tabs-4"><p>Met haar karakteristieke, soms rauwe sound weet zij zichzelf te onderscheiden. Haar muziek varieert van intieme ballads tot &lsquo;shouting&rsquo; blues thema&rsquo;s.&nbsp;</p></div><div id="tabs-5">&nbsp;</div>', '15:00', '15:45', 15, '19-07-2014', 105, 1, 1402916158, 1402916158, 'Rianne'),
(54, '<div id="tabs-4"><p>&#39;Mijn muziek, dat zijn eigenlijk allemaal verhalen die we muzikaal vertolken. In sommige stukken spelen we zelfs een bepaalde rol of figuur, zoals Gandalf de tovenaar uit de Lord of the Rings&#39; . Zo beschrijft Alex Koo, jonge jazzpianist met gedeelde Belgische en Japanse roots en wonend in Den Haag, zijn muziek.&nbsp;</p></div>', '15:00', '16:00', 15, '20-07-2014', 106, 1, 1402916218, 1403096472, 'Rianne'),
(55, '<div id="tabs-4"><p>Het rijke arsenaal aan composities is gefundeerd op een uiterst swingende &eacute;n solide ritmesectie. Zeven blazers staan garant voor een compleet kleurenpalet.&nbsp;</p></div>', '19:00', '20:30', 15, '20-07-2014', 107, 1, 1402916292, 1403096567, 'Rianne'),
(56, '<div id="tabs-4"><p>Dat Salsa macho-muziek is die ook macho gespeeld moet worden weten we; dat Salsa ook heel goed door 5 &#39;macha&#39;s&#39; vertolkt wordt is minder bekend.. Toch laat Leticia y su Rumbadam&nbsp;al ruim 18 jaar Nederland (en de buurlanden) op zijn grondvesten trillen met ALL FEMALE SALSABAND LETICIA Y SU RUMBADAMA.</p></div>', '20:00', '21:30', 16, '18-07-2014', 108, 1, 1402916517, 1402916517, 'Rianne'),
(57, '<p>De band gaat uit van New Orleans-jazz, doch in de loop der jaren heeft de band door invloeden van de orkestleden zelf een geheel eigen stijl ontwikkeld, die door de Amerikaanse jazzjournalist Bill Bacin eenvoudigweg werd omschreven als de Dirty Dozen Sound, een mengelmoes van NO/Billy Holiday/Louis Prima/Jabbo Smith/Cajun/Creole/Swing en alles waar jazz van te maken is.&nbsp;</p>', '14:00', '15:30', 16, '19-07-2014', 109, 1, 1402916604, 1403094844, 'Rianne'),
(58, '<div id="tabs-4"><p>They are crazy&hellip; They are insane&hellip; and they are absolutely amazing live on stage. With authentic zoot-suits, flamboyance, Cadillac&rsquo;s, dancers and cheap whisky. Jazz Connection is a true follower of the Jumpin&rsquo; Jive style that hit America&rsquo;s black postwar population.&nbsp;</p></div><div id="tabs-5">&nbsp;</div>', '16:30', '19:00', 16, '19-07-2014', 110, 1, 1402916696, 1403094888, 'Rianne'),
(59, '<p>Orquesta Poder Latino Een op zwepende Zuid-Amerikaanse Latijn muziek, gebracht door een spetterend orkest met een kleurrijke show van de zangers.&nbsp;</p>', '20:00', '21:30', 16, '19-07-2014', 111, 1, 1402916742, 1402916742, 'Rianne'),
(60, '<div id="tabs-4"><p>Team Latino is een moderne en vernieuwende formatie bestaande uit muzikanten met diverse muzikale en culturele achtergronden uit Zuid-Amerika, nl. Cuba en Chili. Deze dynamische band brengt een opwindende mix van Salsa, Merengue Cumbia en Bachata met authentieke geluiden, en met als extra&#39;tje een moderne touch.&nbsp;</p></div><div id="tabs-5">&nbsp;</div>', '22:30', '24:00', 16, '19-07-2014', 112, 1, 1402916808, 1402916808, 'Rianne'),
(62, '<div id="tabs-4"><p>KINGS OF THE BONGO are a band formed by musicians from some top bands, who have joined together to play the music of MANU CHAO. Grabbing the lyrics and melodies of MANU CHAO and bringing them to all kind of rhythms like Salsa, Ska, Rock, Reggea, KINGS OF THE BONGO represents an opportunity to HAVE A LITTLE TRIP TO SOUTH AMERICA and GO LOCO ON THE DANCE FLOOR!!!&nbsp;</p></div>', '18:30', '20:00', 16, '20-07-2014', 113, 1, 1402916949, 1402916949, 'Rianne'),
(63, '<div id="tabs-4"><p>Skapiche?! is een tien-persoons formatie die &#39;Uptempo Party Ska&#39; speelt. Hoewel het hoofddoel is om elk optreden om te toveren tot &#39;a real skanking party&#39;, nemen ze de muziek ook serieus.&nbsp;</p></div><div id="tabs-5">&nbsp;</div>', '20:30', '21:30', 17, '18-07-2014', 115, 1, 1402918870, 1402918870, 'Rianne'),
(64, '<div id="tabs-4"><p>WE ReaDY De band WE ReaDY is een vijf mans formatie die muziek uit de jaren &#39;50 tot op heden op energieke wijze presenteert. WE ReaDY speelt Funk, Soul en Pop covers met hun eigen flavour!&nbsp;</p></div>', '15:45', '16:45', 17, '19-07-2014', 116, 1, 1402918976, 1403005692, 'Rianne'),
(65, '<div id="tabs-4"><p>&lsquo;Got my mojo working! I&rsquo;ve got my mojo working!&rsquo; 1957. Muddy Waters zingt de longen uit zijn lijf. De nieuwe, opwindende beat overvalt Amerika in razendsnel tempo. Een jaar later gaat ook Europa plat. Festivals staan in lichterlaaie.&nbsp;</p></div><div id="tabs-5">&nbsp;</div>', '17:30', '18:45', 17, '19-07-2014', 117, 1, 1402919121, 1402919121, 'Rianne'),
(67, '<div id="tabs-4"><p>The Originators spelen en schrijven liedjes in de typische stijl van de Northern Soul uit de jaren &lsquo;60/&rsquo;70 en laten tijden van legendarische clubs als Blackpool Mecca en Wigan Casino herleven.&nbsp;</p></div><div id="tabs-5">&nbsp;</div>', '19:45', '21:30', 17, '19-07-2014', 118, 1, 1402919235, 1403094466, 'Rianne'),
(68, '<div id="tabs-4"><p>Een eerbetoon aan de band die er in is geslaagd om de perfecte combinatie te maken tussen symfonische rock en popmuziek.</p></div><div id="tabs-5">&nbsp;</div>', '22:30', '24:00', 17, '19-07-2014', 119, 1, 1402919367, 1403094511, 'Rianne'),
(69, '<p>Willy&#39;s Caribbean Steelband verandert elk feest in een ongelofelijke happening.<br />De groep is gespecialiseerd in het zuid-amerikaans repertoire zoals soca,calipso,merengue,salsa,reggae,ballets, top 40 en kerstliedjes.<br /><!--[if !supportLineBreakNewLine]--><br /><!--[endif]--></p>', '16:00', '17:30', 0, '20-07-2014', 138, 1, 1402919505, 1402919560, 'Rianne'),
(70, '<div id="tabs-4"><p>Heavylight is emotioneel en energiek. En altijd interactief met het publiek.&nbsp;HeavyLight heeft een on-Nederlandse Nederlandse stijl. Gevoelsmuziek. Met een vleugje Muse, een link naar Kings of Leon, een vlaagje Pink Floyd, maar ook dubstep en een paar vette covers gaan ze niet uit de weg. Smaak en Smoel. HeavyLight.</p></div><div id="tabs-5">&nbsp;</div>', '20:30', '21:30', 18, '18-07-2014', 120, 1, 1402919687, 1402919687, 'Rianne'),
(71, '<div id="tabs-4"><p>Sommige mensen zijn geboren om op een podium te staan. Elle is er &eacute;&eacute;n van. Haar nieuwe werk is, voorzichtig gezegd, dynamischer en muzikaler dan wat ze ooit heeft laten horen. Er is nu misschien ruimte voor een zachte noot, maar zoals altijd blijft ze genadeloos.</p></div><div id="tabs-5">&nbsp;</div>', '22:30', '23:45', 18, '18-07-2014', 121, 1, 1402919784, 1402919784, 'Rianne'),
(72, '<div id="tabs-4"><p>With Skin Attached is a proud grandson of rhythm &amp; blues, singing at the top of his lungs and very much looking forward to tomorrow. The new Beans &amp; Fatback album With Skin Attached is a lyrical manifesto for a much-maligned genre: rhythm &amp; blues, the precursor to soul, rock &amp; roll, and pop.&nbsp;</p></div><div id="tabs-5">&nbsp;</div>', '19:00', '20:00', 18, '20-07-2014', 122, 1, 1402919872, 1403096786, 'Rianne'),
(73, '<div id="tabs-4"><p>Imaginary Western speelt een mix van Blues Blues-rock &eacute;n rockabilly.Rock&amp;Roll.&nbsp;</p></div>', '19:30', '21:00', 20, '18-07-2014', 130, 1, 1402920150, 1403011752, 'Rianne'),
(74, '<div id="tabs-4"><p>Dat het snel kan gaan met een bluesband bewijzen The BluesBones. Begonnen in 2011, en na slechts 2 echte optredens gevraagd worden om aan de Belgische Blues Challenge 2012 deel te nemen. Vervolgens door het publiek tot beste band verkozen te worden.</p></div><div id="tabs-5">&nbsp;</div>', '22:00', '24:00', 20, '18-07-2014', 131, 1, 1402920281, 1402994356, 'Rianne'),
(75, '<div id="tabs-4"><p>Different Shades Of Blues Lekker in het gehoor liggende liedjes, dat zijn de nummers van DSOB. Veelal covers die op eigen wijze worden gespeeld en vaak vanuit de blues komend, maar ook country en jazz-invloeden zijn hoorbaar.&nbsp;</p></div>', '15:00', '16:00', 20, '19-07-2014', 132, 1, 1402920399, 1403096084, 'Rianne'),
(76, '<div id="tabs-4"><p>Silverback is eind 2011 opgericht als kwartet en is na een aantal bandwisselingen in 2013 als trio doorgegaan. De roots en inspiratie van de muzikanten ligt in de 70-er jaren en bluesrock is de gekozen muziekrichting. De band speelt overwegend covers van minder bekende artiesten zoals Arc Angels, Storyville en Doyle Bramhall II.</p></div><div id="tabs-5">&nbsp;</div>', '16:45', '17:45', 20, '19-07-2014', 133, 1, 1402920547, 1403096159, 'Rianne'),
(77, '<div id="tabs-4"><p>Meer dan 50 jaar na de eerste hits van Johnny Cash weten deze Eindhovenaren de swing, sfeer en rebellie van een optreden van deze legendarische Amerikaanse outlaw verbluffend goed te raken. De songs die Johnny Cash zelf met zoveel liefde en bevlogenheid wist te brengen worden opnieuw leven ingeblazen door de Def Americans.&nbsp;</p></div><div id="tabs-5">&nbsp;</div>', '16:00', '17:30', 20, '20-07-2014', 134, 1, 1402920640, 1403096879, 'Rianne'),
(78, '<p><!--[if gte mso 9]><xml>\r\n <w:WordDocument>\r\n  <w:View>Normal</w:View>\r\n  <w:Zoom>0</w:Zoom>\r\n  <w:TrackMoves/>\r\n  <w:TrackFormatting/>\r\n  <w:HyphenationZone>21</w:HyphenationZone>\r\n  <w:PunctuationKerning/>\r\n  <w:ValidateAgainstSchemas/>\r\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n  <w:DoNotPromoteQF/>\r\n  <w:LidThemeOther>EN-US</w:LidThemeOther>\r\n  <w:LidThemeAsian>JA</w:LidThemeAsian>\r\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\r\n  <w:Compatibility>\r\n   <w:BreakWrappedTables/>\r\n   <w:SnapToGridInCell/>\r\n   <w:WrapTextWithPunct/>\r\n   <w:UseAsianBreakRules/>\r\n   <w:DontGrowAutofit/>\r\n   <w:SplitPgBreakAndParaMark/>\r\n   <w:EnableOpenTypeKerning/>\r\n   <w:DontFlipMirrorIndents/>\r\n   <w:OverrideTableStyleHps/>\r\n  </w:Compatibility>\r\n  <m:mathPr>\r\n   <m:mathFont m:val="Cambria Math"/>\r\n   <m:brkBin m:val="before"/>\r\n   <m:brkBinSub m:val="--"/>\r\n   <m:smallFrac m:val="off"/>\r\n   <m:dispDef/>\r\n   <m:lMargin m:val="0"/>\r\n   <m:rMargin m:val="0"/>\r\n   <m:defJc m:val="centerGroup"/>\r\n   <m:wrapIndent m:val="1440"/>\r\n   <m:intLim m:val="subSup"/>\r\n   <m:naryLim m:val="undOvr"/>\r\n  </m:mathPr></w:WordDocument>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="true"\r\n  DefSemiHidden="true" DefQFormat="false" DefPriority="99"\r\n  LatentStyleCount="276">\r\n  <w:LsdException Locked="false" Priority="0" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Normal"/>\r\n  <w:LsdException Locked="false" Priority="9" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="heading 1"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 2"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 3"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 4"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 5"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 6"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 7"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 8"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 9"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 1"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 2"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 3"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 4"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 5"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 6"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 7"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 8"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 9"/>\r\n  <w:LsdException Locked="false" Priority="35" QFormat="true" Name="caption"/>\r\n  <w:LsdException Locked="false" Priority="10" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Title"/>\r\n  <w:LsdException Locked="false" Priority="1" Name="Default Paragraph Font"/>\r\n  <w:LsdException Locked="false" Priority="11" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtitle"/>\r\n  <w:LsdException Locked="false" SemiHidden="false" UnhideWhenUsed="false"\r\n   QFormat="true" Name="Strong"/>\r\n  <w:LsdException Locked="false" Priority="20" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="59" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Table Grid"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Placeholder Text"/>\r\n  <w:LsdException Locked="false" Priority="1" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="No Spacing"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 1"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Revision"/>\r\n  <w:LsdException Locked="false" Priority="34" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="List Paragraph"/>\r\n  <w:LsdException Locked="false" Priority="29" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Quote"/>\r\n  <w:LsdException Locked="false" Priority="30" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Quote"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="19" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="21" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="31" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Reference"/>\r\n  <w:LsdException Locked="false" Priority="32" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Reference"/>\r\n  <w:LsdException Locked="false" Priority="33" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Book Title"/>\r\n  <w:LsdException Locked="false" Priority="37" Name="Bibliography"/>\r\n  <w:LsdException Locked="false" Priority="39" QFormat="true" Name="TOC Heading"/>\r\n </w:LatentStyles>\r\n</xml><![endif]--><!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\ntable.MsoNormalTable\r\n	{mso-style-name:Standaardtabel;\r\n	mso-tstyle-rowband-size:0;\r\n	mso-tstyle-colband-size:0;\r\n	mso-style-noshow:yes;\r\n	mso-style-priority:99;\r\n	mso-style-parent:"";\r\n	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;\r\n	mso-para-margin:0cm;\r\n	mso-para-margin-bottom:.0001pt;\r\n	mso-pagination:widow-orphan;\r\n	font-size:10.0pt;\r\n	font-family:Calibri;}\r\n</style>\r\n<![endif]--><!--StartFragment-->Bij Caribbean Fever staat het plezier voorop en dat is te zien en te horen!&nbsp; Het repertoire bestaat uit Zuid-Amerikaanse muziekstijlen zoals Soca, Zouk, Kaseco, Dancehall, Reggaeton, Bachhatta&rsquo;s, Hindipop. Maar ook top 40 muziek behoort tot het repertoire.<!--EndFragment--></p>', '22:30', '0:00', 16, '18-07-2014', 139, 1, 1402920703, 1402920703, 'melissa'),
(79, '<div id="tabs-4"><p>Lucky Faces speelt acoustische rock en pop classics met een knipoog afgewisseld met eigen nummers. Je moet dan denken aan muziek van onder andere R.E.M., Neil Young, Bryan Adams, Anouk, U2, Metallica, Bob Seger, Lynyrd Skynyrd, Steppenwolf, Genesis, Phil Collins, Bad Company, Skunk Anansie, Alanis Morisette, Peter de Vries etc.&nbsp;</p></div><div id="tabs-5">&nbsp;</div>', '21:00', '', 21, '18-07-2014', 135, 1, 1402920815, 1402920815, 'Rianne'),
(80, '<p>.</p>', '14:30', '15:30', 14, '20-07-2014', 141, 1, 1402927682, 1403014349, 'Rianne'),
(81, '<p>.</p>', '13:30', '14:15', 15, '19-07-2014', 142, 1, 1402927776, 1402927776, 'Rianne'),
(82, '<p>.</p>', '16:30', '18:00', 15, '19-07-2014', 143, 1, 1402927832, 1402927832, 'Rianne'),
(83, '<div id="tabs-4"><p>Het sextet The Houdini&#39;s al een kwart eeuw lang een toonaangevend Nederlands hardbop ensemble. De zes muzikanten hebben meer dan tien internationaal albumuitgaven op hun naam staan en touren door Europa, de Verenigde Staten, Canada en Australi&euml;.&nbsp;</p></div><div id="tabs-5">&nbsp;</div>', '16:45', '18:00', 15, '20-07-2014', 144, 1, 1402928161, 1403096522, 'Rianne'),
(84, '<p>Het is hard, het is dansbaar en zo Hollands als &eacute;&eacute;n koekje bij de koffie: Andere Koek! Ska-punk, Nederlandstalige teksten, koper en een vleugje metal hebben hen in zes jaar gesmeed tot de ultieme feestmachine. In de hoogste versnelling blaast Andere Koek! iedereen van zijn sokken.</p><p>&nbsp;</p>', '19:00', '20:00', 17, '18-07-2014', 145, 1, 1402928532, 1402928532, 'Rianne'),
(85, '<p>.</p>', '14:30', '15:15', 17, '19-07-2014', 146, 1, 1402928621, 1402928621, 'Rianne'),
(86, '<p>.</p>', '22:30', '24:00', 17, '18-07-2014', 147, 1, 1402928681, 1403012854, 'Rianne'),
(88, '<p>Rock, gewoon rock. Dat is wat de 5th Pine laat horen tijdens de energieke optredens.</p>', '16:30', '17:00', 18, '19-07-2014', 149, 1, 1402928802, 1403095675, 'Rianne'),
(89, '<p>.</p>', '17:30', '18:00', 18, '19-07-2014', 150, 1, 1402928847, 1403095722, 'Rianne'),
(91, '<p>.</p>', '18:30', '19:15', 18, '19-07-2014', 152, 1, 1402928941, 1403095763, 'Rianne'),
(92, '<p>.</p>', '21:15', '22:15', 18, '19-07-2014', 153, 1, 1402929012, 1403095834, 'Rianne'),
(93, '<p>De single &lsquo;Aaaaah!&rsquo; deed denken aan de sixties, maar de Haagse boys zijn juist n&uacute; relevant, zo bleek wel tijdens hun succesvolle clubtour In Nederland. Wijt het aan de weemoed en de kwaliteit.&nbsp;</p>', '23:00', '24:00', 18, '19-07-2014', 154, 1, 1402929232, 1403095862, 'Rianne'),
(94, '<div id="tabs-4"><p>Boudewijn &#39;Boss&#39; van Trigt is een muzikale duizendpoot uit Haarlem, die zijn sporen vooral heeft verdiend in reggae- en skabands.Boss een ode aan de Jamaicaanse muziek van de jaren 60 en 70.&nbsp;</p></div><div id="tabs-5">&nbsp;</div>', '17:15', '18:15', 18, '20-07-2014', 155, 1, 1402929405, 1402929405, 'Rianne'),
(96, '<p>.</p>', '20:30', '21:30', 19, '18-07-2014', 167, 1, 1403005027, 1403169224, 'Rianne'),
(97, '<p>Indoor optreden</p>', '23:00', '24:00', 19, '18-07-2014', 156, 1, 1403005099, 1403169567, 'Rianne'),
(99, '<p>.</p>', '20:15', '21:30', 15, '19-07-2014', 173, 1, 1403006113, 1403094590, 'Rianne'),
(100, '<div id="tabs-4"><p>Deze jonge afroband speelt een mix van afrobeat en jazz en speelde zo&rsquo;n beetje ieder festival in Belgi&euml; plat. De band vindt het nu de hoogste tijd om Nederland te veroveren.&nbsp;De afrobeat van Shakara United drijft op bas, percussie en blazers en kent lang uitgesponnen nummers met ruimte voor veel improvisatie.&nbsp;</p></div>', '22:30', '24:00', 15, '19-07-2014', 174, 1, 1403006501, 1403094641, 'Rianne'),
(101, '<p>.</p>', '19:45', '20:30', 18, '19-07-2014', 169, 1, 1403012367, 1403095794, 'Rianne'),
(102, '<div id="tabs-4"><p>Sugar Mama speelt sinds &#39;86 hun eigen soort blues, boogie, rock &#39;n roll en aanverwante muziek</p><p>&nbsp;</p></div><div id="tabs-5">&nbsp;</div>', '13:00', '13:45', 19, '19-07-2014', 124, 1, 1403012991, 1403169622, 'Rianne'),
(103, '<p>.</p>', '16:00', '17:00', 19, '19-07-2014', 166, 1, 1403013029, 1403013029, 'Rianne'),
(104, '<p>.</p>', '15:00', '16:00', 19, '20-07-2014', 125, 1, 1403013115, 1403169931, 'Rianne'),
(105, '<p>Rough &rsquo;n Ready brengt Classic Rock met een knipoog, afgewisseld met eigen werk.&nbsp;</p>', '19:15', '20:15', 19, '19-07-2014', 126, 1, 1403013204, 1403170016, 'Rianne'),
(106, '<div id="tabs-4"><p>&lsquo;De Wet&rsquo; is een Rauw Rotterdams Blues Roots Rock Trio. De Band is ge&iuml;nspireerd door klassieke vuige blues, oude Motown en de gitaarhelden uit de jaren 70. Drie gasten, niet te veel spullen mee, maar wel knallen.&nbsp;</p></div>', '21:00', '22:00', 19, '19-07-2014', 127, 1, 1403013311, 1403170067, 'Rianne'),
(107, '<div id="tabs-4"><p>De Nederlandse blues-rock formatie Rob Orlemans &amp; Half Past Midnight&nbsp;behoort tot&nbsp;de top van het blues en rock genre.&nbsp;</p></div><div id="tabs-5">&nbsp;</div>', '22:45', '24:00', 19, '19-07-2014', 128, 1, 1403013437, 1403170116, 'Rianne'),
(108, '<div id="tabs-4"><p>Rock coverband XL a tribuite to rock XL a tribuite to rock is een classic rock coverband die zowel de bekende covers speelt, maar ook zeergoede nummers speelt die misschien iets minder bekend zijn maar wel geweldig mooi zijn, wat een verrassend goed afwisselend repertoire oplevert.&nbsp;</p></div>', '20:00', '21:30', 21, '19-07-2014', 162, 1, 1403013516, 1403095937, 'Rianne'),
(109, '<p>.</p>', '22:30', '24:00', 21, '19-07-2014', 163, 1, 1403013565, 1403095964, 'Rianne'),
(110, '<p>.</p>', '13:00', '14:15', 20, '19-07-2014', 159, 1, 1403013662, 1403096038, 'Rianne'),
(111, '<div id="tabs-4"><p>Met nummers van The Beatles, Golden Earring, The Eagles, The Stones, Status Quo en Bryan Adams wisten zij vele feesttenten, kroegen en zalen te vullen. Inmiddels bestaat Frok al 22 jaar en hebben de heren de nodige podiumervaring opgedaan.&nbsp;</p></div><div id="tabs-5">&nbsp;</div>', '15:30', '16:30', 21, '20-07-2014', 136, 1, 1403013746, 1403013761, 'Rianne'),
(112, '<p>.</p>', '18:30', '19:45', 20, '19-07-2014', 140, 1, 1403013962, 1403096207, 'Rianne'),
(113, '<p>.</p>', '20:30', '21:45', 20, '19-07-2014', 160, 1, 1403014015, 1403096312, 'Rianne'),
(114, '<div id="tabs-4"><p>De band wordt nu al o.a. een topband en een mogelijke afsluiter voor festivals genoemd. Neem de blues, voeg er een dikke blazerssectie aan toe, gooi er wat soul door heen en je krijgt Little Steve &amp; the Big Beat. Met vurig gitaarspel, sterke vocalen, een gierende saxofoon en een strakke ritme sektie cre&euml;ren ze een traditioneel geluid dat toch eigentijds klinkt.&nbsp;</p></div><div id="tabs-5">&nbsp;</div>', '22:30', '24:00', 20, '19-07-2014', 175, 1, 1403014262, 1403096339, 'Rianne'),
(115, '<p>.</p>', '16:00', '17:30', 16, '20-07-2014', 138, 1, 1403014785, 1403014785, 'Rianne'),
(116, '<p>.</p>', '14:15', '15:15', 20, '20-07-2014', 161, 1, 1403014841, 1403096833, 'Rianne'),
(117, '<p>.</p>', '14:30', '15:15', 18, '20-07-2014', 170, 1, 1403014957, 1403096695, 'Rianne'),
(118, '<p>.</p>', '15:45', '16:30', 18, '20-07-2014', 171, 1, 1403014999, 1403096739, 'Rianne'),
(119, '<div id="tabs-4"><p>De naam is een knipoog naar &eacute;&eacute;n van de oorspronkelijke inwoners van Amerika, de Crow Indianen, tevens een saluut aan &eacute;&eacute;n van de grote voorbeelden, de band Little Feat en niet te vergeten de kraaienpoten welke alle bandleden inmiddels bezitten. Crow&#39;s Feet is liefhebber van Amerikaanse Rootsmuziek.&nbsp;</p></div><div id="tabs-5">&nbsp;</div>', '13:00', '14:15', 19, '20-07-2014', 129, 1, 1403015404, 1403170178, 'Rianne'),
(120, '<p>.</p>', '16:45', '17:45', 19, '20-07-2014', 157, 1, 1403015444, 1403170222, 'Rianne'),
(121, '<p>.</p>', '18:30', '19:45', 19, '20-07-2014', 158, 1, 1403015489, 1403170291, 'Rianne'),
(122, '<p>.</p>', '13:30', '14:30', 21, '20-07-2014', 164, 1, 1403015540, 1403015540, 'Rianne'),
(123, '<p>Ariemith speelt vnl rock en blues met een hoog &quot;humor en toeters en bellen&quot; gehalte waardoor de band zich graag laat bestempelen als een &quot;rock and loll&quot; band.&nbsp;</p>', '17:15', '18:15', 21, '20-07-2014', 165, 1, 1403015576, 1403166998, 'Rianne'),
(124, '<div id="tabs-4"><p>Rush Order maakt&nbsp;er een sport van om van Guilty Pleasures leuke Rock geori&euml;nteerde nummers te maken, met de nadruk op kwaliteit, plezier en performance.</p></div>', '19:00', '20:15', 21, '20-07-2014', 137, 1, 1403015643, 1403015643, 'Rianne'),
(125, '<p>Net als voorgaande jaren zal aMeezing, onder leiding van John Stinissen, een zangfeest zijn met pop/rockliedjes, Nederlandse smartlappen, opera aria&rsquo;s en meer. Het thema &lsquo;Not a hard Days Night&rsquo; zal ook terugkomen tijdens aMeezing, er zal een &lsquo;The Beatles&rsquo;-medley ten gehore gebracht worden, samen met The Bits.<br />De Dordtse Phil zal aMeezing openen met een eigen concert en zal het begeleidingsorkest zijn voor de winnaars van de Silver Talentshow en uiteraard het projectkoor dat uit 80 dames en heren bestaat. Tijdens aMeezing zal ook OUD (Official Ukulele Orchestra Dordrecht) onderdeel zijn van aMeezing.</p>', '13:00', '17:00', 14, '19-07-2014', 176, 1, 1403015842, 1403015842, 'Rianne'),
(126, '<p>.</p>', '15:30', '16:00', 18, '19-07-2014', 177, 1, 1403095351, 1403095623, 'Rianne'),
(127, '<p>.</p>', '18:45', '19:45', 19, '18-07-2014', 178, 1, 1403169136, 1403169136, 'Rianne'),
(128, '<p>Battle of Blues is een band die er gewoon gaat staan, geen vaste afspraken maar gewoon blues recht uit het hart zoals het ook bedoeld is.</p>', '22:00', '23:00', 19, '18-07-2014', 179, 1, 1403169492, 1403169492, 'Rianne'),
(129, '<p>.</p>', '14:30', '15:15', 19, '19-07-2014', 180, 1, 1403169798, 1403169798, 'Rianne'),
(130, '<p>.</p>', '17:45', '18:30', 19, '19-07-2014', 181, 1, 1403169872, 1403169872, 'Rianne'),
(131, '<p>Rubber moving Legs of Island, het vroegere dj collectief van Micro, die jaren in Dordrecht en omstreken leuke feesten organiseerde, zal vanaf 14.00 uur draaien.Deze middag zal in het teken staan van Vinyl, zij draaien the Groove met Afrikaanse en Zuid-Amerikaanse invloeden, soul to the bones.</p><p>Naast dit zal deze middag het terrein ingericht zijn voor families, met een luchtkussen, limonade/ kleurtafel zullen we ook aan de kinderen ijsjes uitdelen tevens kunnen de kinderen geschminkt worden.</p><p>Met deze middag&nbsp;willen Merz en Big Rivers je het ultieme relaxte vakantie gevoel geven.<br />Bij mooi weer kan iedereen genieten van de locatie aan het water met luchtbedden en andere vertier.</p>', '12:00', '21:30', 17, '20-07-2014', 182, 1, 1403179345, 1403179345, 'Rianne'),
(132, '<div id="tabs-4"><p>De muziek is ontzettend dansbaar en past bij de smaak van jongeren in deze tijd. Toch heeft het ook verwijzingen naar de 80&#39;s.&nbsp;</p></div>', '14:30', '15:00', 18, '19-07-2014', 151, 1, 1403180143, 1403180143, 'Rianne'),
(133, '<p>Demo Jazz/Berlesque/Street</p>', '19:00', '20:00', 16, '18-07-2014', 183, 1, 1403783077, 1403783077, 'Rianne'),
(134, '<p>Demo Jazz/Berlesque/Street</p>', '15:30', '16:30', 16, '19-07-2014', 183, 1, 1403783109, 1403783109, 'Rianne'),
(135, '<p>Workshop en demo LA Style</p>', '21:30', '22:30', 16, '18-07-2014', 184, 1, 1403783267, 1403783267, 'Rianne'),
(136, '<p>Workshop en Demo LA Style.</p>', '21:30', '22:30', 16, '19-07-2014', 184, 1, 1403783315, 1403783371, 'Rianne'),
(137, '<p>Demo sportief paaldansen</p>', '13:00', '14:00', 16, '19-07-2014', 185, 1, 1403792604, 1403792604, 'Rianne'),
(138, '<p>Demo sportief paaldansen.</p>', '15:00', '16:00', 16, '20-07-2014', 185, 1, 1403792656, 1403792656, 'Rianne'),
(139, '<p>Demo Cubaanse Salsa</p>', '19:00', '20:00', 16, '19-07-2014', 186, 1, 1403792847, 1403792847, 'Rianne'),
(140, '<p>Workshop Zouk en demo cursisten.</p>', '17:30', '18:30', 16, '20-07-2014', 187, 1, 1403793125, 1403793125, 'Rianne'),
(141, '<div id="tabs-4"><p>Wesley, Niels and JJ, hebben alle drie gespeeld in de succesvolle Nederlandse blues band &#39;Big Blind&#39;. Ze zijn opnieuw samengekomen om een vet repertoire Blues neer te zetten.</p></div><div id="tabs-5">&nbsp;</div>', '00:00', '01:30', 12, '18-07-2014', 188, 1, 1404737154, 1404737154, 'Rianne'),
(142, '<div id="tabs-4"><p>Randy&rsquo;s Boogie Squad was een vijfmans formatie opgericht in de zomer van 1996.&nbsp;</p></div>', '00:00', '01:30', 12, '19-07-2014', 189, 1, 1404737375, 1404737375, 'Rianne'),
(143, '<div id="tabs-4"><p>&nbsp;</p></div><div id="tabs-5">&nbsp;</div>', '00:00', '01:30', 11, '18-07-2014', 102, 1, 1404737534, 1404737534, 'Rianne'),
(144, '<div><p>Lekker ouderwets knallen op de disco-avond om Big Rivers af te sluiten!<br />Dj Bootsy Paul (Rollerskate Disco Energiehal, Nightown) draaide voor Wipneus en Pim en is daarnaast de stadion Dj van Feyenoord.&nbsp;<br />Met zijn discokneiters zal hij Dolhuis op zijn kop zetten en zorgen voor een spetterend einde het Big Rivers Festival!</p><div>&nbsp;</div></div>', '00:00', '01:30', 11, '19-07-2014', 190, 1, 1404737620, 1404737656, 'Rianne'),
(145, '<p>Kingston Kitchen heeft een reputatie opgebouwd als internationale live band met zijn eigen stijl van jazz old school en Ska. De band grijpt terug naar het geluid van de ska uit de vroege jaren zestig, maar voert het een tandje verder en gaat door waar anderen stoppen. De band begon in 2004 nadat Dr. Ring Ding en leden van de Rotterdam Ska-Jazz foundation hun muzikale krachten samen brachten. Dankzij de combinatie van aanstekelijke nummers en energieke live-optredens is Kingston Kitchen ondertussen welbekend in het Europese muziekcircuit.</p>', '23:00', '03:30', 22, '18-07-2014', 191, 1, 1404737873, 1404737873, 'Rianne'),
(146, '<p>Dance event, Drym&#39;n&#39;bass, dubstep</p><p>&nbsp;</p>', '23:00', '04:30', 22, '19-07-2014', 192, 1, 1404738009, 1404738009, 'Rianne'),
(147, '<p>Playlist, tijdens aMeezing Big Rivers:</p><div><ul><li>Volare</li><li>Top of the World</li><li>Jambalaya</li><li>Ring of fire</li><li>Karma Chameleon</li><li>Rawhide</li><li>Runaway</li><li>Sweet Caroline</li></ul></div>', '14:25', '14:55', 14, '19-07-2014', 193, 1, 1405584518, 1405584518, 'Rianne');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
`id` int(255) NOT NULL,
  `type` varchar(32) NOT NULL,
  `title` varchar(128) NOT NULL,
  `body` longtext NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `created` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `author` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `type`, `title`, `body`, `status`, `created`, `modified`, `author`) VALUES
(1, 'page', 'Parkeren, overnachten en vervoer', '<p><strong>Parkeren</strong></p><p>Je kunt natuurlijk proberen te&nbsp;<a target="_blank" href="http://www.parkeerlijn.nl/dordrecht/">parkeren</a>&nbsp;in een van de 5 parkeergarages die we hier in Dordrecht hebben. Veel handiger is het om je auto te parkeren op een van de grote parkeerplaatsen aan de rand van het centrum. Het is gratis en er is een overvloed aan ruimte. Volg hiervoor de borden parkeren Weeskinderendijk of Energiehuis. Deze parkeerplaatsen liggen op slechts 10 minuten lopen van de podia. Vanaf parkeerplaats Energiehuis gaat er ook een pendelbus. Let wel op de laatste retourbus.</p><p><strong>Hotel en B&amp;B</strong></p><p>Wil je niets van het festival missen of meer van het prachtige centrum van Dordrecht en omgeving zien? Boek dan een weekendje weg en blijf overnachten in een van de hotels die Dordrecht rijk is..</p><p>Je kunt hiervoor prima terecht bij:</p><ul><li><div style="text-align:justify"><a target="_blank" href="http://www.postillionhotels.com/hotels/postillion-hotel-dordrecht">Postillion Hotel</a>: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;078-6184444</div></li><li><div style="text-align:justify"><a target="_blank" href="http://www.innercityhotel.nl/">Innercity Hotel</a>: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 078-6526522</div></li><li><div style="text-align:justify"><a target="_blank" href="http://www.bellevuegroothoofd.nl/default.asp?page_id=55">Hotel Bellevue</a>: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 078-6332500</div></li><li><div style="text-align:justify"><a target="_blank" href="http://www.vandervalkhoteldordrecht.nl/nl/?gclid=CImP-5_5kLgCFXDMtAodumcAsQ">Van der Valk Hotel</a>: &nbsp; &nbsp; 078-8700800</div></li></ul><p>Voorts zijn er diverse B&amp;B&rsquo;s in Dordrecht en vaak in de directe omgeving van het festival. Ga hiervoor naar de website van het&nbsp;<a target="_blank" href="http://www.vvvzhz.nl/">VVV</a>&nbsp;of bezoek &nbsp;&quot;Intree&quot; gelegen aan de Spuiboulevard 99.</p><p><strong>Vervoer</strong></p><p>In Dordrecht zijn er verschillende manieren om je te laten vervoeren.</p><p>Allereerst natuurlijk de gewone taxi.</p><ul><li><a target="_blank" href="http://www.taxicentraledordrecht.nl/">Taxi Centrale Dordrecht</a>: &nbsp; &nbsp;0800-0134</li><li><a target="_blank" href="http://www.citydordt.nl/">Taxibedrijf City Dordrecht</a>: &nbsp;078-6177440</li><li><a target="_blank" href="http://www.taxistam.nl/">Taxi Stam</a>: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;078-6162111</li></ul><p>Van en naar de overkant van de rivier (Sliedrecht, Zwijndrecht, Papendrecht en Hendrik Ido Ambacht) neem je de&nbsp;<a target="_blank" href="http://www.waterbus.nl/landing.php">waterbus</a>. Kom je uit Rotterdam? Neem dan de&nbsp;<a target="_blank" href="http://www.aqualiner.nl/">Aqualiner</a>&nbsp;of de&nbsp;<a target="_blank" href="http://www.ns.nl/">trein</a>.</p><p>En vergeet niet als je er ben een prachtig tochtje te maken door het centrum van de stad met de Fluisterboot. Bezie Dordrecht op zijn mooist vanaf het water. Een geweldige rondvaart waarbij zelfs een geboren Dordtenaar opeens toerist in eigen stad is.</p><ul><li><div style="text-align:justify"><a target="_blank" href="http://www.destroper.com/rondvaartboot.html">Fluisterboot</a>: 078-6130094 (dagelijks van 11.00 tot 17.00 uur)</div></li></ul><p>Uiteraard is het ook mogelijk om per koets rond te rijden in het prachtige historisch centrum van Dordrecht.</p><ul><li><a target="_blank" href="http://stapvoets.com/">Stapvoets per koets</a>: 06-41559330</li></ul>', 1, 1402660895, 1411565334, 'Liselotte'),
(2, 'page', 'Over Big Rivers', '<p>Het Big Rivers Festival had zijn eerste editie in 1998 onder de naam Bluesfestival Dordrecht. Stichting Big Rivers is opgericht op 27 juni 2001.</p><p>De Stichting Big Rivers heeft als doelstelling: het organiseren van culturele evenementen in de breedste zin des woords, welke evenementen mede tot doel hebben het promoten en mede onder de aandacht brengen van de stad Dordrecht.</p><p><strong>Bestuur Stichting Big Rivers:</strong></p><ul><li>Voorzitter: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a href="mailto:wstevens@upcmail.nl">Drs. W. Stevens</a></li><li>Secretaris: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<a href="mailto:george@bigrivers.nl">G. Reppel</a></li><li>Penningmeester: &nbsp; &nbsp; <a href="mailto:cgbakker@euronet.nl">C. Bakker</a></li><li>Lid: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a href="mailto:jwverspuij@hotmail.com">J. Verspuij</a></li><li>Functie: vacant</li></ul><p>Erevoorzitter van Stichting Big Rivers is: Leo de Zwart, mede oprichter van het festival, oud bestuurslid van Stichting Big Rivers en van 1998 tot 2010 programmeur van het Big Rivers Festival.</p><p><strong>Comit&eacute; van Aanbeveling:</strong></p><ul><li>D. van Wijngaarden, directeur poppodium Bibelot</li><li>D. Ten veen, Oud-wethouder cultuur gemeente Dordrecht</li><li>M. Croese, directeur Classic Young Masters</li><li>MR. M.A.V. van Aardenne, Advocaat</li></ul><p>De organisatie van het Big Rivers Festival bestaat uit:</p><p><strong>Festivalco&ouml;rdinatie&nbsp;</strong></p><p><a href="http://www.basdezwart.nl/">Bas de Zwart Evenementen</a></p><p><strong>Festivalbureau</strong></p><ul><li>Festival directie:&nbsp;<a href="mailto:info@basdezwart.nl">Bas de Zwart&nbsp;Evenementen</a></li><li>Productieleider:<a href="mailto:matthijs@bigrivers.nl">&nbsp;Matthijs Hoffman</a></li><li>Programma co&ouml;rdinator:&nbsp;<a target="_blank" href="mailto:ifor@bigrivers.nl">Ifor Schrauwen</a></li><li>Stagiair communicatie: vacant (zie vacature)</li><li>Stagiair administratieve zaken: vacant (zie vacature)</li></ul><p>Big Rivers is geregistreerd als ANBI&nbsp;</p>', 1, 1402660940, 1411565128, 'Liselotte'),
(3, 'page', 'Contact', '<div><strong>(Postadres) Stichting Big Rivers</strong><br />Postbus 1060<br />3300 BB Dordrecht</div><div><strong>(Bezoekadres) Festivalbureau Big Rivers</strong><br />Slikveld 1<br />3311 VT Dordrecht<br /><br />Tel: (078-) 614 41 82<br />E-mail:&nbsp;<a href="mailto:info@bigrivers.nl">info@bigrivers.nl</a></div>', 1, 1402661064, 1411047014, 'Liselotte'),
(4, 'page', 'Merchandise', '<p><strong>Duurzame merchandise kleding</strong></p><p>Ook bij Big Rivers denken wij aan duurzaamheid. We zijn daarom in zee gegaan met Stanley &amp; Stella, een toonaangevend bedrijf dat kwalitatieve en modieuze kleding produceert op duurzame wijze. Duurzaam ondernemen is dan ook een kernwaarde die Stanley &amp; Stella op alle vlakken toepast. Van de keuze van de vezels, de productie, de distributie tot de verpakking. Zij maken kleding om van te houden, ontworpen een optimale pasvorm en vervaardigd door vakmensen die eerlijk worden beloond.</p><p>Stanley en Stella ken je misschien van de film &lsquo;A streetcar named Desire&rsquo;, een klassieker van de jaren vijftig. Die film heeft een blijvend beeld nagelaten van een jonge Marlon Brando in de rol van Stanley die zijn T-shirt droeg zoals geen andere dat ooit v&oacute;&oacute;r hem had gedaan. Een beeld dat sindsdien het eenvoudige T-shirt heeft verheven tot een trendsetter en een middel om zich uit te drukken. Een boodschap waaruit blijkt dat trendy ook synoniem kan zijn van duurzaamheid. En dat we de natuurlijke rijkdommen kunnen benutten zonder het milieu te belasten.</p><p><strong>Collectie Big Rivers 2014</strong><br />Met de unieke Big Rivers bedrukking op jouw Stanley en Stella t-shirt, verzorgd door het vakkundige team van Intergift B.V., kun jij geweldig voor de dag komen en laten zien wat jouw boodschap is over het festival en over duurzaamheid.</p><p>Combineer je jouw&nbsp;T-shirt met de trendy nieuwe cap, een gave button, een handige canvas draagtas en zo&rsquo;n bekende ketting, dan ben je helemaal &lsquo;de bom&rsquo; tijdens Big Rivers 2014. Tegelijk steun je met je aankopen jouw leukste festival, die het elk jaar moet doen met minder financi&euml;le middelen om het festival te organiseren.</p><p><strong>&nbsp;DE MERCHANDISE-STANDS ZIJN TE VINDEN TER HOOGTE VAN POFFERSALON VISSERS AAN DE GROENMARKT EN NAAST DE GROTE KERK, T.O. DE JAZZSOCIETEIT. DE OPBRENGST VAN DE OFFICI&Euml;LE MERCHANDISE WORDT GEBRUIKT OM VRIJWILLIGERS- EN ANDERE KOSTEN TE DEKKEN.&nbsp; </strong></p><p><strong>Steun Big Rivers</strong><br />Heb je geen behoefte aan merchandise-artikelen, en wil je ons toch steunen? Dan kun je een vrijblijvende donatie doen, klik op de &ldquo;blijf ons steunen&rdquo; knop. Of doe een gift aan het enthousiaste collecte-team, tijdens Big Rivers&nbsp;en ontvang voor je donatie een leuke sticker. Er zijn er drie, dus spaar ze allemaal!</p><p><strong>Uitdeelkettingen</strong><br />In het kader van verduurzamen &eacute;n zo min mogelijk kosten maken, is besloten dat we dit jaar geen kettingen gaan weggeven. Zo produceren we minder afval en hoeven we geen dozen uit USA te transporteren naar Nederland. Duurzaam!</p><p>Het lijkt ons geweldig &nbsp;als je de kettingen die je nog bewaart hebt van eerdere edities (en we weten dat je die nog ergens in een laatje of in de kast hebt liggen) meeneemt naar Big Rivers 2014 en deze ruilt met je mede-festivalgangers. Samen maken we dan onze slogan waar: &nbsp;<em>GEEF &amp; GENIET .</em></p>', 1, 1402661149, 1403080094, 'Rianne'),
(5, 'page', 'Big Rivers Tv', '<p>Bekijk hier de afleveringen terug van Big Rivers TV!</p><ul><li><a target="_blank" href="http://www.youtube.com/watch?feature=player_detailpage&amp;v=vteTO6dtTlU">Aflevering 1</a></li></ul><p>Met onder meer aandacht voor De Aftrap, Canto Ostinato, de vrijwilligster Miranda Groenendijk, de programmeur Reinier Zervaas en Dirk ten Veen van de Commissie van aanbeveling!</p><ul><li><a target="_blank" href="http://www.youtube.com/watch?v=g0bs7KAuPyc&amp;feature=youtu.be">Aflevering 2</a></li></ul><p>In deze uitzending speciale aandacht voor de Blues Cruise! Alle bands van de Blues Cruise 2013 worden in dit programma uitgelicht en tevens is er weer een leuke quiz met de vrijwilligster Norma Gijzen!</p><ul><li><a target="_blank" href="http://www.youtube.com/watch?v=sRghejKhh5M&amp;feature=youtu.be">Aflevering 3</a></li></ul><p>In deze aflevering twee live optredens van Lucky Faces en Charly Cruz! Daarnaast wordt Angela van Dijk onder handen genomen bij de schoonheidsspecialiste en verder komen David van Wijngaarden en Pieter Paul van der Hout aan het woord!</p><ul><li><a target="_blank" href="http://www.youtube.com/watch?v=TGGu8WAQvHQ&amp;feature=youtu.be">Aflevering 4</a></li></ul><p>In deze aflevering hebben we onder meer aandacht voor de zusjes Amber &amp; Daphne Lagarde als vrijwilligers van Big Rivers. Verteld Bas de Zwart over tribute bands. Martia Croese doet haar aanbeveling en hebben we twee live acts. En Swing preseneert samen met Sieto Zeeman de verschillende items aan elkaar.</p>', 1, 1402661264, 1402661264, 'Frank'),
(6, 'page', 'Stageplaatsen Big Rivers 2015', '<p>Het Big Rivers festival is het Dordtse open air stadsfeest, duurt 10 dagen en behelst onder meer: 3 dagen muziek met meer dan 80 acts op 9 verschillende podia, straattheater, Kids event, Po&euml;zie, een Meezing spektakel, een Silver Talentshow, een klassiek concert en een Blues Cruise. Het festival beleeft in 2015&nbsp;zijn 18e editie en trok afgelopen jaar meer dan 135.000 bezoekers. Het festival vindt plaats van 3&nbsp;tot en met 13&nbsp;juli 2015.</p><p><strong>Big Rivers 2015 zoekt stagiaires</strong></p><ul><li><strong>Functie 1: Stagiaire Algemene zaken</strong></li></ul><p>Het Big Rivers Festival 2015&nbsp; is op zoek naar:</p><p>Een stagiaire algemene zaken, die wil weten hoe een 10 daags muziek- en cultuurfestival wordt georganiseerd. Die een spin in het web wil zijn in een actieve en dynamische organisatie.</p><p>Het Big Rivers festival is het Dordtse stadsfeest, duurt 10 dagen en behelst onder meer:</p><p>3 dagen muziek met meer dan 80 acts, straattheater, Kinder event, Po&euml;zie, een Meezing spektakel, een Silver Talentshow, een klassiek concert&nbsp; en een Blues Cruise. Het festival beleeft in 2015 zijn 18e editie en trok afgelopen jaar meer dan 155.000 bezoekers.</p><p>Kijk voor meer informatie op www.bigrivers.nl en zoek naar de fotopagina&rsquo;s waar je het leukste evenement van Dordrecht kunt beleven.</p><p><strong>Functie omschrijving</strong></p><p>Op het festivalbureau ben je een van de mannen en vrouwen waar het gedurende de periode tussen februari en juli om gaat. Je krijgt alle mogelijkheden om je talenten ten volle te benutten. Er is een goede begeleiding en onze stagiaires maken deel uit van de organisatie. De stagiaire algemene zaken&nbsp; werkt actief mee aan:</p><p>&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;aanmaak van het algemeen draaiboek tbv de vergunningaanvraag</p><p>&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;assistent van de programmeurs waaronder contractering van de artiesten</p><p>&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ondersteuning van de productieleider</p><p>&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;tijdens het festival krijgt de stagiaire een passende functie met veel verantwoordelijkheid</p><p>Je dient beschikbaar te zijn in de periode tussen februari / maart&nbsp; en 16 juli. Stage uren zijn in overleg in&nbsp; te delen.</p><p>Wij zoeken een student: Algemene Cultuurwetenschappen of een HBO student Evenementen.</p><p>Heb je interesse bel dan gerust met de festival directeur Bas de Zwart. Je kunt hem bereiken onder: 078- 645.43.27 of 06-18.15.69.27 of per e-mail: bas@bigrivers.nl</p><p>-------------------------------------------------------------------------------</p><p><strong>Functie:&nbsp; Stagiaire Communicatie</strong></p><p>Het Big Rivers Festival &nbsp;2015 is op zoek naar:</p><p>Een stagiaire communicatie die wil weten hoe een 10 daags muziek- en cultuurfestival wordt georganiseerd. De communicator &nbsp;in een actieve en dynamische organisatie.</p><p>Het Big Rivers festival is het Dordtse stadsfeest, duurt 10 dagen en behelst onder meer:</p><p>3 dagen muziek met meer dan 80 acts, straattheater, kinderevent, Po&euml;zie, een Meezing spektakel, een Silver Talentshow, een klassiek concert&nbsp; en een Blues Cruise. Het festival beleeft in 2014 zijn 17e editie en trok afgelopen jaar meer dan 155.000 bezoekers.</p><p><strong>Functie omschrijving</strong></p><p>Op het festivalbureau ben je verantwoordelijk voor de uitvoering van het &nbsp;communicatieplan. Je krijgt alle mogelijkheden om je talenten ten volle uit te benutten. Er is een goede begeleiding en onze stagiaires maken deel uit van de organisatie. De stagiaire communicatie is verantwoordelijk voor:</p><p>&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;onderhouden en redactioneel uitbouwen van de website</p><p>&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;onderhouden en uitbouwen &nbsp;van de social media</p><p>&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;schrijven van persberichten</p><p>&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;het plannen en bij geschiktheid, het geven van interviews</p><p>&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;contact onderhouden met de media</p><p>&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Onderhouden contacten met vormgever en drukkerij</p><p>&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;tijdens het festival is de stagiaire verantwoordelijk voor de social media en communicatie&nbsp;</p><p>&nbsp;</p><p>Je dient beschikbaar te zijn in de periode tussen februari / maart&nbsp; en 16 juli. Stage uren zijn in overleg in&nbsp; te delen.</p><p>Wij zoeken een student: Algemene Cultuurwetenschappen of een HBO student Evenementen.</p><p>Heb je interesse bel dan gerust met de festival directeur Bas de Zwart. Je kunt hem bereiken onder: 078- 645.43.27 of 06-18.15.69.27 of per e-mail: bas@bigrivers.nl</p><p>-------------------------------------------------------------------------------</p>', 1, 1402661264, 1411046917, 'Liselotte'),
(7, 'page', 'Vacatures  2015', '<p><!--[if gte mso 9]><xml>\r\n <o:DocumentProperties>\r\n  <o:Revision>0</o:Revision>\r\n  <o:TotalTime>0</o:TotalTime>\r\n  <o:Pages>1</o:Pages>\r\n  <o:Words>280</o:Words>\r\n  <o:Characters>1546</o:Characters>\r\n  <o:Company>Bas De Zwart Evenementen</o:Company>\r\n  <o:Lines>12</o:Lines>\r\n  <o:Paragraphs>3</o:Paragraphs>\r\n  <o:CharactersWithSpaces>1823</o:CharactersWithSpaces>\r\n  <o:Version>14.0</o:Version>\r\n </o:DocumentProperties>\r\n <o:OfficeDocumentSettings>\r\n  <o:AllowPNG/>\r\n </o:OfficeDocumentSettings>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:WordDocument>\r\n  <w:View>Normal</w:View>\r\n  <w:Zoom>0</w:Zoom>\r\n  <w:TrackMoves/>\r\n  <w:TrackFormatting/>\r\n  <w:HyphenationZone>21</w:HyphenationZone>\r\n  <w:PunctuationKerning/>\r\n  <w:ValidateAgainstSchemas/>\r\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n  <w:DoNotPromoteQF/>\r\n  <w:LidThemeOther>NL</w:LidThemeOther>\r\n  <w:LidThemeAsian>JA</w:LidThemeAsian>\r\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\r\n  <w:Compatibility>\r\n   <w:BreakWrappedTables/>\r\n   <w:SnapToGridInCell/>\r\n   <w:WrapTextWithPunct/>\r\n   <w:UseAsianBreakRules/>\r\n   <w:DontGrowAutofit/>\r\n   <w:SplitPgBreakAndParaMark/>\r\n   <w:EnableOpenTypeKerning/>\r\n   <w:DontFlipMirrorIndents/>\r\n   <w:OverrideTableStyleHps/>\r\n   <w:UseFELayout/>\r\n  </w:Compatibility>\r\n  <m:mathPr>\r\n   <m:mathFont m:val="Cambria Math"/>\r\n   <m:brkBin m:val="before"/>\r\n   <m:brkBinSub m:val="--"/>\r\n   <m:smallFrac m:val="off"/>\r\n   <m:dispDef/>\r\n   <m:lMargin m:val="0"/>\r\n   <m:rMargin m:val="0"/>\r\n   <m:defJc m:val="centerGroup"/>\r\n   <m:wrapIndent m:val="1440"/>\r\n   <m:intLim m:val="subSup"/>\r\n   <m:naryLim m:val="undOvr"/>\r\n  </m:mathPr></w:WordDocument>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="true"\r\n  DefSemiHidden="true" DefQFormat="false" DefPriority="99"\r\n  LatentStyleCount="276">\r\n  <w:LsdException Locked="false" Priority="0" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Normal"/>\r\n  <w:LsdException Locked="false" Priority="9" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="heading 1"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 2"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 3"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 4"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 5"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 6"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 7"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 8"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 9"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 1"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 2"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 3"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 4"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 5"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 6"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 7"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 8"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 9"/>\r\n  <w:LsdException Locked="false" Priority="35" QFormat="true" Name="caption"/>\r\n  <w:LsdException Locked="false" Priority="10" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Title"/>\r\n  <w:LsdException Locked="false" Priority="1" Name="Default Paragraph Font"/>\r\n  <w:LsdException Locked="false" Priority="11" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtitle"/>\r\n  <w:LsdException Locked="false" Priority="22" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Strong"/>\r\n  <w:LsdException Locked="false" Priority="20" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="59" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Table Grid"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Placeholder Text"/>\r\n  <w:LsdException Locked="false" Priority="1" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="No Spacing"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 1"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Revision"/>\r\n  <w:LsdException Locked="false" Priority="34" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="List Paragraph"/>\r\n  <w:LsdException Locked="false" Priority="29" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Quote"/>\r\n  <w:LsdException Locked="false" Priority="30" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Quote"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="19" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="21" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="31" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Reference"/>\r\n  <w:LsdException Locked="false" Priority="32" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Reference"/>\r\n  <w:LsdException Locked="false" Priority="33" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Book Title"/>\r\n  <w:LsdException Locked="false" Priority="37" Name="Bibliography"/>\r\n  <w:LsdException Locked="false" Priority="39" QFormat="true" Name="TOC Heading"/>\r\n </w:LatentStyles>\r\n</xml><![endif]--><!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\ntable.MsoNormalTable\r\n	{mso-style-name:Standaardtabel;\r\n	mso-tstyle-rowband-size:0;\r\n	mso-tstyle-colband-size:0;\r\n	mso-style-noshow:yes;\r\n	mso-style-priority:99;\r\n	mso-style-parent:"";\r\n	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;\r\n	mso-para-margin:0cm;\r\n	mso-para-margin-bottom:.0001pt;\r\n	mso-pagination:widow-orphan;\r\n	font-size:12.0pt;\r\n	font-family:Cambria;\r\n	mso-ascii-font-family:Cambria;\r\n	mso-ascii-theme-font:minor-latin;\r\n	mso-hansi-font-family:Cambria;\r\n	mso-hansi-theme-font:minor-latin;}\r\n</style>\r\n<![endif]--><!--StartFragment--></p><p><strong>&nbsp;</strong></p><p><!--EndFragment--></p><p><strong>Wij zoeken ieder jaar weer een aantal vrijwilligers. Iets voor jou?</strong></p><p>Wat kun je gaan doen?</p><p><strong>Decoratie</strong>: Dit team decoreert de hele binnenstad, podia en cafe&rsquo;s in de Big Rivers kleuren. Bij het decoratieteam kun je nu al aansluiten, want zij zijn druk bezig met de voorbereidingen. Ben je creatief, kun vlaggen naaien, maskers schilderen? Het decoratieteam komt tot het festival (twee)wekelijks wisselend op maandag of dinsdag bij elkaar. Tijdens het festival zijn ze vooral druk op de donder- en vrijdag voor het muziekweekend en op maandag en dinsdag na het muziekweekend.</p><ul><li>Enthousiast en creatief</li><li>De mogelijkheid om je eigen creatieve idee&euml;n werkelijkheid te laten worden</li><li>Ervaring met een naaimachine en in het bezit zijn van een naaimachine heeft de voorkeur</li></ul><p><strong>Op- en Afbouwteam</strong>: Het op- en afbouwteam zorgt ervoor dat het festivalterrein, de locaties en backstages op- en afgebouwd wordt. Voor deze functie zijn enthousiasme, creativiteit en een gezonde werklust gewenst.</p><ul><li>Sjouwwerk</li><li>Opbouw en afbouw backstages bij podia</li><li>Plaatsen en verwijderen sponsorbanners</li><li>Hoogwerker of manitou certificaat is gewenst, niet verplicht</li></ul><p><strong>Electra</strong>: Je komt te werken in een klein team van specialisten op het gebied van elektrotechniek waarmee je zorgt draagt voor voldoende elektrische spanning op de diverse podia. Zonder elektriciteit kan een optreden immers niet doorgaan. Ook het oplossen van spontaan ontstane situaties hoort bij deze functie.</p><ul><li>Kennis van- of affiniteit met elektrotechniek</li><li>Het liefst enkele jaren werkervaring</li><li>Goede communicatieve vaardigheden</li><li>Snel inspringen op nieuwe klussen</li></ul><p><strong>Transport</strong>: Je haalt en brengt de artiesten naar het podium waar ze optreden. Ook kun je opgeroepen worden als er snel materiaal ergens naar toe gebracht moet worden. Een leuke gevarieerde functie waar je enkele jaren je rijbewijs B voor nodig hebt. Voor deze functie is het erg handig dat je de weg kent in Dordrecht. Je krijgt de beschikking over een portofoon om te communiceren met je transport collega&rsquo;s.</p><ul><li>Goede communicatievaardigheden</li><li>Bands ophalen en wegbrengen van/naar het verzamelpunt</li><li>Lossen en laden van festivalmateriaal</li><li>Snel inspringen op nieuwe klussen</li></ul><p><strong>Catering</strong>: Big Rivers verzorgt tijdens het muziekfestival dagelijks 750 maaltijden (lunch en diner). Als vrijwilliger help je met het bereiden en opscheppen van het eten voor de vrijwilligers en artiesten. Hier heb je dus niet te maken met publiek, maar werk je voor de Big Rivers vrijwilligers. Houd er rekening mee dat cateringwerkzaamheden zwaar kunnen zijn op piektijden.</p><ul><li>Assisteren bij het bereiden en opscheppen van de maaltijden</li><li>Afwassen en schoonmaken</li><li>Enige werkervaring gewenst</li></ul><p><strong>Merchandise</strong>: Ben je een verkooptalent? Dan zit je bij de merchandise goed. Op twee plaatsen op het festivalterrein worden onder andere de inmiddels beroemde Big Rivers kettingen verkocht.</p><ul><li>Voorraad bijhouden</li><li>Verkooppraatjes houden</li><li>Aantrekkelijk uitstallen van de merchandise</li></ul><p><strong>Festivalbureau&nbsp;/ Centrale post</strong>: Dit zijn 2 locaties waar alles in- en uitgaat. Op het festivalbureau komen artiesten en vrijwilligers zich melden en ontvangen zij hier informatie over het festival en speeltijden. Daarnaast krijgen ze hier kun eet- en consumptiebonnen. De Centrale Post (CP) is het zenuwcentrum van de organisatie. Zij zorgen ervoor dat alles in goede banen verloopt. Ben jij stressbestendig en kun je snel schakelen? Dan is dit iets voor jou. Een hectische, afwisselende functie.</p><ul><li>Ontvangen van artiesten en vrijwilligers (Festivalbureau)</li><li>Kennen alle festivallocaties en kunnen goed schakelen</li><li>Verbinden de verschillende teams met elkaar door middel van portofoon gesprekken (Centrale Post)</li></ul><p><strong>Stagemanager / Stagehand</strong>: De stagemanager is het gezicht van Big Rivers naar de bands toe. Hij/zij is gastheer/vrouw en ontvangt de bands bij het podium. De Stagemanager zorgt dat alles goed verloopt op het podium. Hiervoor heb je enige ervaring nodig. De Stagehand assisteert de Stagemanager.</p><ul><li>Ontvangen van de artiesten en eventueel helpen met het uitladen van de spullen van de band</li><li>In de gaten houden dat de soundcheck volgens schema verloopt</li><li>Voor zorgen dat de artiesten klaar zijn op een afgesproken tijdstip en het podium verlaten</li><li>Na afloop assisteren bij het inladen van de spullen van de band</li></ul><p><strong>Word vrijwilliger!</strong>&nbsp;Vrijwilliger bij Big Rivers zijn heeft zo zijn voordelen. Stuur een e-mail samen met je voorkeur voor vrijwilligerfunctie(s) naar&nbsp;<a href="mailto:vrijwilligers@bigrivers.nl">vrijwilligers@bigrivers.nl</a>. Je ontvangt dan zo spoedig mogelijk een reactie van onze vrijwilligerco&ouml;rdinator Dennis de Kriek. Bovendien ontvang je dan ook tot het festival maandelijks de Big Rivers nieuwsbrief voor vrijwilligers.</p>', 1, 1402661373, 1411046796, 'Liselotte'),
(8, 'page', 'Met ons', '<p><strong>1) Zonder vrijwilligers geen Big Rivers Festival!</strong></p><p>Big Rivers wordt in 2014 georganiseerd van 10&nbsp;tot en met 20&nbsp;juli, met het muziekfestival op 18, 19&nbsp;en 20&nbsp;juli. Als vrijwilliger van Big Rivers vragen we je minimaal 2 dagen in te zetten, uiteraard in overleg met je co&ouml;rdinator. Hiervoor krijg je het volgende terug:</p><ul><li>Een medewerker T-Shirt voor tijdens het festival</li><li>Een vrijwilligerspas waarmee je korting krijgt bij 250 organisaties in de Drechtsteden en bij 500 landelijke organisaties</li><li>Voldoende eten en drinken tijdens je inzet</li><li>Gratis toegang tot de afterparty incl. een aantal consumptiebonnen</li><li>Minimaal 2 keer per jaar een Big Rivers borrel</li><li>Een ontzettend gezellige tijd op het mooiste festival van Dordrecht</li></ul><p>We zijn momenteel met spoed op zoek naar vrijwilligers voor ons:</p><ul><li>Decoratieteam</li><li>Op- en afbouwteam</li></ul><p>Of bekijk alle&nbsp;<a href="http://localhost:8080/Blue%20Sky%20CMS/volunteer.php">vrijwilligersfunctie(s)</a>.</p><p><strong>Word vrijwilliger!</strong>&nbsp;Stuur een e-mail samen met je voorkeur voor vrijwilligersfunctie(s) naar<a href="mailto:vrijwilligers@bigrivers.nl">vrijwilligers@bigrivers.nl</a>. Je ontvangt dan zo spoedig mogelijk een reactie van onze vrijwilligersco&ouml;rdinator Dennis de Kriek. Bovendien ontvang je dan ook tot het festival maandelijks de Big Rivers nieuwsbrief voor vrijwilligers.</p><p><strong>2) Ieder jaar verwelkomt het Big Rivers Festival nieuwe stagiaires!</strong></p><p>Het Big Rivers Festival verwelkomt ieder jaar nieuwe stagiaires voor verschillende functies. Naast een zeer leerzame periode krijgen de stagiaires er altijd een gezellige en leuke tijd voor terug. Bij Big Rivers worden stagiaires uitgedaagd in hun eigen doen en kunnen.</p><p>Er zijn nog enkele&nbsp;<a href="http://localhost:8080/Blue%20Sky%20CMS/internship.php">stageplaatsen</a>. Houd de website regelmatig in de gaten voor de laatste updates.</p>', 1, 1402661407, 1402989982, 'Rianne');

-- --------------------------------------------------------

--
-- Table structure for table `sponsor`
--

CREATE TABLE IF NOT EXISTS `sponsor` (
`id` int(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `priority` int(1) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `created` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `author` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=92 ;

--
-- Dumping data for table `sponsor`
--

INSERT INTO `sponsor` (`id`, `title`, `image`, `url`, `priority`, `status`, `created`, `modified`, `author`) VALUES
(13, 'Bas de Zwart Evenementen', '13.png', 'http://www.basdezwart.nl/', 1, 1, 1402002317, 1402002317, 'Frank'),
(14, 'Drukkerij Jonkheer', '14.png', 'http://www.drukkerijjonkheer.nl/', 2, 1, 1402002357, 1402002357, 'Frank'),
(17, 'Da Vinci media', '17.png', 'http://www.davincimedia.nl/site/', 5, 1, 1402002575, 1402002575, 'Frank'),
(18, 'Dordrecht', '18.png', 'http://cms.dordrecht.nl/', 6, 1, 1402002600, 1402002600, 'Frank'),
(20, 'Grote Kerk Dordrecht', '20.png', 'http://www.grotekerk-dordrecht.nl/', 7, 1, 1402002685, 1402002685, 'Frank'),
(21, 'EHBO Dubbeldam', '21.png', 'http://www.ehbodubbeldam.nl/', 8, 1, 1402002717, 1402002717, 'Frank'),
(22, 'Dolhuis', '22.png', 'http://www.dolhuis.com/', 9, 1, 1402002759, 1402002759, 'Frank'),
(23, 'Velvet Music', '23.png', 'http://www.velvetmusic.nl/winkels/dordrecht.php#.UX5qwUiDSSo', 10, 1, 1402002817, 1402002817, 'Frank'),
(24, 'Popcentrale', '24.png', 'http://www.popcentrale.nl/', 11, 1, 1402002867, 1402663753, 'Rianne'),
(25, 'Cafe Restaurant Merz', '25.png', 'http://caferestaurantmerz.nl/', 12, 1, 1402002899, 1402002899, 'Frank'),
(26, 'Bibelot', '26.png', 'http://www.bibelot.net/', 13, 1, 1402002962, 1402002962, 'Frank'),
(27, 'Dolderman', '27.png', 'http://dolderman.eu/nl/homepage', 13, 1, 1402002996, 1402002996, 'Frank'),
(28, 'Stolk', '28.png', 'http://www.stolkhandelsonderneming.nl/', 13, 1, 1402003016, 1402003016, 'Frank'),
(29, 'Slurink', '29.png', '', 13, 1, 1402003057, 1402003057, 'Frank'),
(30, 'Jongen B.V.', '30.png', 'http://www.milieuboten.nl/', 13, 1, 1402003120, 1402003120, 'Frank'),
(33, 'Marcos Muziek', '33.png', 'http://www.marcosmuziek.nl/', 13, 1, 1402003225, 1402003225, 'Frank'),
(34, 'Rob van der Pas', '34.png', 'http://www.robvanderpas.nl/', 13, 1, 1402003259, 1402003259, 'Frank'),
(35, 'Louter Foto', '35.png', 'http://www.louterfoto.nl/', 13, 1, 1402003292, 1402003292, 'Frank'),
(36, 'Kooyker', '36.jpg', 'http://www.kooyker.com/site/', 13, 1, 1402003317, 1402003317, 'Frank'),
(38, 'Intergift', '38.png', 'http://www.intergift.nl/', 13, 1, 1402003380, 1402003380, 'Frank'),
(40, 'Fles & Mes', '40.png', 'http://www.flesenmes.nl/athena/site/php/index.php?action=start', 13, 1, 1402003481, 1402003481, 'Frank'),
(41, 'Bert Lanser', '41.png', 'http://www.bertlanser.nl/', 13, 1, 1402003503, 1402003503, 'Frank'),
(42, 'Peitsman', '42.png', 'http://www.peitsman.com/', 13, 1, 1402003521, 1402003521, 'Frank'),
(43, 'Mol verhuur', '43.png', 'http://molverhuur.nl/', 13, 1, 1402003551, 1402003551, 'Frank'),
(44, 'Riwal', '44.png', 'http://www.riwal.com/nederland/nl-nl', 13, 1, 1402003571, 1402003571, 'Frank'),
(45, 'Van Halen Events', '45.png', 'http://www.vanhalenevents.nl/#/nl/home', 13, 1, 1402003623, 1402003623, 'Frank'),
(47, 'ESJ', '47.png', 'https://esj.nl/start.html', 13, 1, 1402003683, 1402003683, 'Frank'),
(48, 'Woonbron', '48.png', 'http://www.woonbron.nl/Paginas/Default.aspx', 13, 1, 1402003719, 1402003719, 'Frank'),
(50, 'Nolle B.V.', '50.png', 'http://www.detelefoongids.nl/nolle-bv/11106902/5-1/', 13, 1, 1402003771, 1402003771, 'Frank'),
(51, 'Gertenbach Elektro', '51.png', 'http://www.gertenbach-elektro.nl/', 13, 1, 1402003795, 1402003795, 'Frank'),
(52, '4Cats', '52.jpg', 'http://www.4cats.nl/', 13, 1, 1402003811, 1402003811, 'Frank'),
(58, 'Praktijk L.I.S.A', '58.png', 'http://praktijklisa.nl/', 13, 1, 1402659803, 1402659803, 'Rianne'),
(59, 'Stichting de Wielborgh', '59.jpg', 'http://www.wielborgh.nl/', 13, 1, 1402659990, 1402659990, 'Rianne'),
(60, 'Ten Holter Noordam Advocaten', '60.jpg', 'http://www.tenholternoordam.nl/', 13, 1, 1402660455, 1402660455, 'Rianne'),
(61, 'Rabobank Drechtsteden', '61.jpg', 'https://www.rabobank.nl/particulieren/lokalebanken/drechtsteden/', 13, 1, 1402660541, 1402660541, 'Rianne'),
(62, 'Boekhandel de Nieuwe Bengel', '62.jpg', 'http://www.debengelonline.nl/', 13, 1, 1402662462, 1402662462, 'Rianne'),
(63, 'Eventkit', '63.png', 'http://eventkit.nl/', 13, 1, 1402662518, 1402662518, 'Rianne'),
(65, 'Den Witten Haen', '65.jpg', 'http://www.denwittenhaen.nl/', 13, 1, 1402663063, 1402663063, 'Rianne'),
(66, 'Podiumbouw Drechtsteden', '66.jpg', 'http://www.podiumbouw.nl/', 13, 1, 1402663230, 1402663230, 'Rianne'),
(67, 'ToBe Cultuurcentrum', '67.jpg', 'http://www.tobe.nl/', 13, 1, 1402663286, 1402663286, 'Rianne'),
(68, 'WN Productions', '68.jpg', 'http://www.wnproductions.nl/nieuw/index.php', 13, 1, 1402663570, 1402663570, 'Rianne'),
(70, 'Popunie', '70.jpg', 'http://www.popunie.nl/nieuws/actueel/', 13, 1, 1402663910, 1402663910, 'Rianne'),
(71, 'Lang Leve Kunst', '71.png', 'http://www.langlevekunst.nl/', 13, 1, 1402664096, 1402664096, 'Rianne'),
(72, 'Sena', '72.jpg', 'http://www.sena.nl/Home', 13, 1, 1402664144, 1402664144, 'Rianne'),
(73, 'BRASSOciety', '73.jpg', 'http://www.brassociety.com/', 13, 1, 1402664197, 1402664197, 'Rianne'),
(74, 'Fonds voor Cultuurparticipatie', '74.jpg', 'http://www.cultuurparticipatie.nl/', 13, 1, 1402666801, 1402666801, 'Rianne'),
(75, 'Walter Werkt', '75.jpg', '', 4, 1, 1402922925, 1402922925, 'Rianne'),
(76, 'Mirado VOF', '76.jpg', 'http://www.mirado.nl/', 13, 1, 1402922977, 1402922977, 'Rianne'),
(77, 'Brut', '77.jpg', 'http://www.ditisbrut.nl/', 13, 1, 1402923134, 1402923134, 'Rianne'),
(78, 'Partyservice Nederland', '78.jpg', 'http://www.partyservice.nl/', 13, 1, 1402991098, 1402991098, 'Rianne'),
(79, 'Dubbelsteyn bv. BMW', '79.png', 'http://www.dubbelsteynbmw.nl/bmw/index.php', 13, 1, 1403080636, 1403080636, 'Rianne'),
(80, 'Van Wijk voet & zorg', '80.jpg', 'http://www.vanwijkvoetenzorg.nl/', 13, 1, 1403080688, 1403080688, 'Rianne'),
(81, 'Steftiaan', '81.png', 'http://www.steftiaan.nl/', 13, 1, 1403168450, 1403168450, 'Rianne'),
(82, 'Simplus', '82.jpg', 'http://www.simplus.nl/', 13, 1, 1403168552, 1403168552, 'Rianne'),
(83, 'Key Music', '83.png', 'http://www.keymusic.com/nl/', 13, 1, 1403170748, 1403170748, 'Rianne'),
(84, 'Blis', '84.jpg', 'http://www.weareblis.com/', 3, 1, 1403619882, 1403619882, 'Rianne'),
(87, 'Dordt Centraal', '87.jpg', 'http://www.dordtcentraal.nl', 6, 1, 1403774651, 1403774651, 'Rianne'),
(88, 'Drechtstad FM', '88.png', '', 13, 1, 1404134844, 1404134844, 'Rianne'),
(89, 'RTV Dordrecht', '89.jpg', 'http://rtvdordrecht.nl/', 13, 1, 1404134876, 1404134876, 'Rianne'),
(91, 'vanMeel Lighting Sound & Support', '91.jpg', '', 13, 1, 1404391099, 1404391099, 'Rianne');

-- --------------------------------------------------------

--
-- Table structure for table `stage`
--

CREATE TABLE IF NOT EXISTS `stage` (
`id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `color_code` varchar(7) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `created` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `author` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `stage`
--

INSERT INTO `stage` (`id`, `name`, `location`, `color_code`, `status`, `created`, `modified`, `author`) VALUES
(14, 'Dordt Centraal/Jonkheer Stage', 'Grote Kerksplein', '#6bb52f', 1, 1402914031, 1403615527, 'frank'),
(15, 'Sena Summer Jazz Stage', 'Stadhuisplein', '#f99217', 1, 1402914040, 1403615566, 'frank'),
(18, 'Sena Young Talent Stage', 'Houttuinen', '#0a883a', 1, 1402914068, 1403615673, 'frank');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id` int(255) NOT NULL COMMENT 'Unique user id',
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(512) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT 'If user is active 1 if user is blocked 0',
  `created` int(11) NOT NULL COMMENT 'Timestamp when the user was created'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `salt`, `status`, `created`) VALUES
(19, 'frank', 'frank.vandriel@hotmail.com', 'c8e06867f5d5cf127b86be086c909923b75c3a81bbfde3dd79c753de022f89212d80b6362a5e9256b127b07847d55bdf8effbf4c1e15eb98354e7da936eca7dd', '244555101539043fa2091b', 1, 1401918776),
(21, 'Test', 'arthurvanstrien@gmail.com', '0e4d415f0261d1521a4adcbfd02f1d7a7d59e518aaa35ddaed2e46cfa3fb25107a6616d7d68cf6f7e3e7553e67bbdef7f3201007e71ff5ef05ff809882efac53', '16541385305396bc3aa01b7', 1, 1402387514),
(22, 'melissa', 'melissa@bigrivers.nl', '112c86eef16999006d86519834ec257923a5a248cdb4d2d697bd8f72ee53a5c4df8d9ae7368cc54ea4d47f2d8cbf8e4e0478c3d4ed88ef130de756c81e1a6909', '7861802945398291a5ad37', 1, 1402480922),
(23, 'Rianne', 'rianne@bigrivers.nl', 'b1638f0e634eb0430bf11e575f354060da65005350d871c04440f0c3721672fd1b63cbb4bc19f83ad2199508d1c5f2d9e86e0c278cf218443692361f3944d32b', '1165173559539833067df99', 1, 1402483462),
(25, 'admin', 'localhost@localhost.com', '308de19c5aef916eabafe249b2e1f952458f32fb4bd1143ba4959b372d1f085b60b05bd37f75c34c3dcae83bb65336b6a719c53be959da44fb448ff876a65562', '630676608539a243b88f28', 1, 1402610747),
(27, 'Liselotte', 'liselotte@bigrivers.nl', 'cea48bdaf07e7c29cfbcb749e2b554812af019e5238a2afb24a56ca49c8365bd7663addc0c3dffca25c0f183d4a90836c8700e05129b8fe154294279e91ff5cb', '576411166539ed9106d8f5', 1, 1402919184);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genre_cat`
--
ALTER TABLE `genre_cat`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `performance`
--
ALTER TABLE `performance`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sponsor`
--
ALTER TABLE `sponsor`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stage`
--
ALTER TABLE `stage`
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
-- AUTO_INCREMENT for table `artist`
--
ALTER TABLE `artist`
MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
MODIFY `id` int(255) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `genre_cat`
--
ALTER TABLE `genre_cat`
MODIFY `id` int(255) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `performance`
--
ALTER TABLE `performance`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=148;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
MODIFY `id` int(255) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `sponsor`
--
ALTER TABLE `sponsor`
MODIFY `id` int(255) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=92;
--
-- AUTO_INCREMENT for table `stage`
--
ALTER TABLE `stage`
MODIFY `id` int(255) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id` int(255) NOT NULL AUTO_INCREMENT COMMENT 'Unique user id',AUTO_INCREMENT=28;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
