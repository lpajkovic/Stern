-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jun 24, 2023 at 09:11 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stern`
--
CREATE DATABASE IF NOT EXISTS `stern` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `stern`;

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `id` int(11) NOT NULL,
  `ime` varchar(255) NOT NULL,
  `prezime` varchar(255) NOT NULL,
  `korisnicko_ime` varchar(255) NOT NULL,
  `lozinka` varchar(255) NOT NULL,
  `razina` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`id`, `ime`, `prezime`, `korisnicko_ime`, `lozinka`, `razina`) VALUES
(1, 'admin', 'admin', 'admin', '$2y$10$9I1QtFlHRl3U.XJcmz2rHu4QcsLOJPv8/p/ei1vakO8aRgna4Eh2G', 1),
(2, 'user', 'user', 'user', '$2y$10$v3vOG3ypsAW4806VxiJ1NOnvQ60MQWkwKcXfaaw2YCWhG0O2vdHWu', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vijesti`
--

CREATE TABLE `vijesti` (
  `id` int(11) NOT NULL,
  `datum` varchar(32) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `naslov` varchar(255) CHARACTER SET latin2 COLLATE latin2_croatian_ci NOT NULL,
  `opis` varchar(255) CHARACTER SET latin2 COLLATE latin2_croatian_ci NOT NULL,
  `sazetak` text CHARACTER SET latin2 COLLATE latin2_croatian_ci NOT NULL,
  `tekst` text CHARACTER SET latin2 COLLATE latin2_croatian_ci NOT NULL,
  `slika` varchar(64) CHARACTER SET latin2 COLLATE latin2_croatian_ci NOT NULL,
  `kategorija` varchar(64) CHARACTER SET latin2 COLLATE latin2_croatian_ci NOT NULL,
  `arhiva` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vijesti`
--

INSERT INTO `vijesti` (`id`, `datum`, `naslov`, `opis`, `sazetak`, `tekst`, `slika`, `kategorija`, `arhiva`) VALUES
(1, '22.06.2023.', 'Zehn Männer und eine Frau: Diese Republikaner wollen ins Weiße Haus einziehen', 'PRÄSIDENTSCHAFTSWAHL 2024', 'Ein ganzer Pool von Republikanern hat bereits seine Präsidentschaftsambitionen öffentlich gemacht. Klarer Favorit für die Kandidatur ist Donald Trump, der alle Umfragen deutlich anführt. Unter den Bewerbern ist nur eine Frau.', 'Im Rennen um die Kandidatur der Republikaner bei den US-Präsidentschaftswahlen 2024 sind neben Donald Trump eine ganze Reihe weiterer politischer Schwergewichte am Start. Aber auch einige ziemlich unbekannte Anwärter wollen für ihre Partei ins Weiße Haus einziehen. Dafür müssen sie allerdings erst einmal die Vorwahlen der \"Grand Old Party\" gewinnen ? und dabei den Ex-Präsidenten aus dem Feld räumen, der in allen Umfragen weit vorne liegt.\r\n<br><br>\r\nDie Vorwahlsaison der Republikaner beginnt voraussichtlich im Februar 2024 in den Bundesstaaten Iowa und New Hampshire. Eine erste Fernsehdebatte der republikanischen Bewerber ist für den 23. August 2024 angesetzt. Falls nötig, soll am Tag darauf ein zweites Streitgespräch veranstaltet werden. Um daran teilnehmen zu dürfen, müssen die Bewerber Wahlkampfspenden von 40.000 Einzelspendern erhalten haben ? eine relativ hohe Zahl, die dazu dienen soll, das Teilnehmerfeld zu verkleinern. Außerdem müssen sie mindestens ein Prozent Unterstützung in drei nationalen Umfragen vorweisen ? oder ein Prozent in zwei nationalen Umfragen und ein Prozent in zwei frühen Umfragen von denen je eine aus den Bundesstaaten Iowa, New Hampshire, Nevada und South Carolina stammt.\r\n<br><br>\r\nStattfinden wird die erste Debatte in Milwaukee, im Bundesstaat Wisconsin, wo die GOP im kommenden Jahr auch ihren Nominierungsparteitag abhalten wird. Das zeigt die große Bedeutung dieses umkämpften Bundesstaates, der wahrscheinlich auch 2024 über Sieg oder Niederlage der Präsidentschaftskandidaten mitentscheiden wird. Wer genau vor den Kameras erscheinen wird, ist noch unklar. Trump hat bereits infrage gestellt, dass er angesichts seines großen Umfragevorsprungs überhaupt mitdebattieren sollte.\r\n<br><br>\r\nDer Sieger oder die Siegerin der Vorwahlen fordert dann am 5. November nächsten Jahres den Kandidaten der Demokraten heraus, bei dem es sich voraussichtlich um Amtsinhaber Joe Biden handeln wird.', 'vijest1.jpg', 'politik', 0),
(2, '22.06.2023.', 'China in Berlin: Schwierige Gespräche zwischen Partnern und Rivalen', 'REGIERUNGSKONSULTATIONEN', 'China ist für Deutschland Partner, Rivale und Wettbewerber. So steht es jedenfalls in der neuen Nationalen Sicherheitsstrategie. Doch wie passt das zusammen? Der heutige Tag könnte ein paar Hinweise bringen.', 'Die Regierungen Deutschlands und Chinas beraten am Dienstag in Berlin über die weitere Zusammenarbeit ihrer beiden Länder in schwierigen Zeiten. Zehn chinesische und neun deutsche Regierungsvertreter kommen unter Leitung von Kanzler Olaf Scholz (SPD) und Ministerpräsident Li Qiang im Kanzleramt zusammen, um sich vor allem mit dem Kampf gegen den Klimawandel und dem damit verbundenen Umbau der Wirtschaft zu befassen. Es dürfte aber auch um die Handelsbeziehungen und den russischen Angriffskrieg gegen die Ukraine gehen, in dem China versucht zu vermitteln und auf Verhandlungen dringt.\r\n<br><br>\r\nDie Bundesregierung organisiert Regierungskonsultationen regelmäßig mit besonders engen Partnern oder Ländern, die für sie wirtschaftlich oder strategisch besonders wichtig sind. Die Ampel-Regierung hat sich in den vergangenen Monaten bereits mit den Regierungen von Spanien und den Niederlanden, Japan und Indien getroffen. Die Regierungskonsultationen mit China dürften aber die bisher spannendsten werden ? und die schwierigsten.\r\n<br><br>\r\nSeit dem letzten physischen Treffen 2018 haben sich die Beziehungen beider Länder deutlich verschlechtert. Die zunehmende Einschränkung von Freiheitsrechten in China, der Umgang mit Minderheiten, aber vor allem das Großmachtstreben Pekings im Indopazifik ? inklusive der Invasionsdrohungen gegen Taiwan ? haben in Berlin größte Besorgnis ausgelöst.\r\n<br><br>\r\nDer Schock des russischen Angriffskriegs gegen die Ukraine hat zudem dazu geführt, dass die Bundesregierung die wirtschaftliche Abhängigkeit von China reduzieren will. Ein so böses Erwachen wie beim russischen Gas, auf das man sich trotz aller Warnsignale zu lange verlassen hat, will man nicht noch einmal erleben.', 'vijest2.jpg', 'politik', 0),
(3, '21.06.2023.', 'Lambsdorff wird neuer deutscher Botschafter in Russland', 'DIPLOMATIE', 'Es ist ein besonders schwieriger diplomatischer Posten: Alexander Graf Lambsdorff geht nach Moskau. Der FDP-Politiker hat langjährige Erfahrung im Auswärtigen Dienst.', 'Der FDP-Politiker Alexander Graf Lambsdorff wird neuer deutscher Botschafter in Russland. Ein Sprecher des Auswärtigen Amtes in Berlin bestätigte in der Nacht, dass die russische Regierung ihre Zustimmung, das sogenannte Agrément, für die Personalie gegeben habe. \"Der Dienstantritt ist für diesen Sommer vorgesehen\", sagte der Sprecher weiter. Lambsdorff soll auf Géza Andreas von Geyr folgen, der derzeit Botschafter in Moskau ist. Seit Beginn des russischen Angriffskrieges auf die Ukraine im Februar gilt der Posten als besonders schwierig.\r\n<br><br>\r\nLambsdorff ist Vize-Vorsitzender der FDP-Bundestagsfraktion. Vor seiner Karriere in der FDP war Lambsdorff ab 1995 bereits im Auswärtigen Dienst und für das Auswärtige Amt tätig. Von 2000 bis 2003 arbeitete er in der Presseabteilung der Deutschen Botschaft in Washington D.C., von 2003 bis 2004 war er im Russlandreferat des Auswärtigen Amts beschäftigt. Lambsdorff gehörte von 2004 bis 2017 dem Europäischen Parlament an, zuletzt als Vizepräsident.', 'vijest3.jpg', 'politik', 0),
(4, '20.06.2023.', 'Warum Teebaumöl-Shampoo gereizte Kopfhaut, Schuppen und fettiges Haar lindern soll', 'GESUNDE HAARE', 'Seine Heimat ist Australien, der Bekanntheitsgrad geht jedoch weit darüber hinaus: Der Teebaum ist ein beliebtes Gewächs, aus dessen Blättern ein ätherisches Öl gewonnen wird, das eine heilende Wirkung haben soll. Es war also nur eine Frage der Zeit, bis die Kosmetikindustrie darauf aufmerksam wurde.', 'Genau genommen wird das ätherische Öl nicht nur aus einem Baum gewonnen, sondern aus den Blättern verschiedener Teebaum-Arten. Aufgrund seiner antiseptischen, antibakteriellen und fungiziden (pilztötenden) Eigenschaften wird Teebaumöl als Heilmittel eingesetzt. Aber auch in der Naturkosmetik findet es immer häufiger Verwendung ? zum Beispiel in Shampoos. Die darin enthaltenen Wirkstoffe sollen Kopfhautreizungen lindern und Schuppen sowie fettigem Haar entgegenwirken. Trotzdem gilt es auch hier einige Pflegehinweise zu beachten.\r\n<br><br>\r\nAuch wenn die positiven Eigenschaften von Teebaumöl unumstritten sind, sollten Sie diese Punkte vor der ersten Anwendung bedenken: Die ätherischen Öle haben eine austrocknende Wirkung auf die Kopfhaut, aus diesem Grund eignet sich das Shampoo besonders gut für schnell fettendes Haar. Im Umkehrschluss bedeutet das aber auch, dass Sie das Haarmittel mit Vorsicht genießen müssen, wenn Sie zu einer trockenen Kopfhaut neigen. In dem Fall ist es ratsam, ein Teebaumöl-Shampoo nur einmal alle zwei Wochen anzuwenden. Das hat den Vorteil, dass Sie dem Juckreiz entgegenwirken können, ohne Ihre Kopfhaut auszutrocknen.\r\n<br><br>\r\nAngewendet wird Teebaumöl-Shampoo wie jedes andere Haarwaschmittel auch. Damit es seine Wirkung entfalten kann, sollten Sie das Produkt mit kreisenden Bewegungen in die Kopfhaut einmassieren und kurz einziehen lassen ? dadurch werden vor allem Bakterien und Pilze unschädlich gemacht, die mitunter Kopfhautreizungen verursachen können. Anschließend spülen Sie das Shampoo wieder sorgfältig aus. Wenn Sie keine trockene Kopfhaut haben, können Sie das natürliche Haarwaschmittel regelmäßig anwenden. Andernfalls wird empfohlen, Teebaumöl zum gewöhnlichen Shampoo nur ergänzend einzusetzen.', 'vijest4.jpg', 'gesundheit', 0),
(5, '21.06.2023.', 'Schlafen bei Hitze: Diese Tipps sorgen für eine erholsame Nacht', 'SOMMERNÄCHTE', 'Wenn die Temperaturen steigen, steigt zwar oft auch unsere Laune ? unsere Schlafqualität nimmt aber oftmals bei der Wärme ab. Wir haben Tipps, wie das Schlafen bei Hitze angenehmer wird.', 'Viele haben den Sommer sehnsüchtig erwartet, wissen aber auch, dass die Nächte bei Wärme nicht unbedingt angenehm sind. Damit Sie den Sommer in vollen Zügen genießen können, haben wir Tipps, um das Schlafen bei Hitze angenehmer zu machen. \r\n<br><br>\r\nUm bei der Sommerhitze im wahrsten Sinne des Wortes einen kühlen Kopf zu bewahren, ist die Anschaffung eines Kühlkissens sinnvoll. Diese Kissen haben meist spezielle Geleinlagen, damit Wärme und Feuchtigkeit vom Körper weggeleitet werden und Sie im Schlaf nicht durch den Schweiß an Kopf und Nacken gestört werden. Zudem sorgen Kühlkissen für eine bessere Zirkulation, da sie extra für den Schlaf bei Hitze gemacht sind. Manche Modelle lohnen sich auch für den Einsatz das ganze Jahr über. Und: Wer sich nicht extra ein neues Kissen anschaffen möchte, kann auch zu einem kühlenden Kissenbezug greifen. \r\n<br><br>\r\nNicht nur am Kopf, auch am Körper macht sich die Wärme nachts natürlich bemerkbar. Ohne Bettwäsche zu schlafen, ist aber meist nicht die Lösung ? zumal das auch für viele Menschen wenig gemütlich ist. Und: Auch bei hohen Temperaturen kann der Körper nachts auskühlen, wenn der Schweiß nicht aufgenommen wird. Eine leichte Sommerdecke und atmungsaktive Schlafkleidung aus beispielsweise Leinen oder Baumwolle, die die Feuchtigkeit aufnimmt, sind gut geeignet. Abhilfe für ein angenehmes Schlafen bei Hitze schafft auch kühlende Bettwäsche. Ein Bettbezug aus Satin kann in Sommernächten beispielsweise sehr angenehm sein, ebenso eine kühlende Matratzenauflage.\r\n<br><br>\r\nBesonders kalte Getränke oder eine besonders kalte Dusche sind an heißen Sommertagen keine gute Idee, auch wenn man denkt, genau das würde bei der Hitze helfen. Stattdessen ziehen sich aber die Gefäße zusammen und die Wärme staut sich im Körper. Bei kalten Duschen muss der Körper arbeiten und erhitzt sich zusätzlich. Besser ist es, vor dem Schlafengehen lauwarm zu duschen ? am besten mit einem beruhigenden Duschgel, etwa mit Lavendelöl. Auch Wechselduschen mit warmem und etwas kühlerem (nicht kaltem) Wasser können vor dem Einschlafen hilfreich sein, um besser mit der Hitze im Schlaf umgehen zu können.\r\n<br><br>\r\nDamit im Schlafzimmer aber erst gar keine Hitze beim Schlafen entstehen kann, ist es wichtig, sie durch die passende Abdunkelung zurückzuhalten. Geeignet sind etwa Metall- oder Thermo-Rollos, die bereits tagsüber heruntergezogen werden sollten, um die Hitze fernzuhalten. Zusätzlich sollten Sie während der Nacht darauf achten, dass Energiequellen ausgeschaltet werden, also wirklich alle Stecker gezogen werden und nirgendwo mehr Licht zu sehen ist. Auch das hilft, um erholsam durch die Nacht zu kommen und wenig Hitze den Schlaf stören zu lassen. \r\n<br><br>\r\nUm gut in die Nacht im Sommer zu starten, hilft es, statt einem üppigen Abendessen mehrere kleine Portionen zu sich zu nehmen. Dabei sind vor allem Gemüse, Obst, mageres Fleisch oder auch Fisch geeignet, um später erholsam bei Hitze schlafen zu können. Scharf gewürzte und fettige Speisen, Alkohol und Koffein sollten vor einer Sommernacht tabu sein, wenn Sie entspannt durch die Nacht kommen möchten. Besser geeignet sind zum Einschlafen beruhigende Kräutertees, etwa mit Melisse oder Lavendel. Und: Schwitzen Sie in der Nacht viel, kann ein Salbeitee helfen, denn er reduziert die Schweißproduktion. Den Tag über sollten Sie besonders im Sommer sowieso möglichst viel trinken. ', 'vijest5.jpg', 'gesundheit', 0),
(6, '19.06.2023.', 'Pflege ist teuer, nicht alle können sich im Alter eine gute leisten - diese Pflegetagegeld-Versicherungen empfiehlt Warentest', 'STIFTUNG WARENTEST', 'Wer pflegebedürftig ist, ist bestenfalls wohlhabend, denn gute Pflege ist teuer. Eine Pflegetagegeld-Versicherung kann helfen, die hohen Kosten abzufedern. Aber auch die muss erst einmal bezahlt werden. Stiftung Warentest hat geprüft, welche Policen sich rechnen können.', 'Der menschliche Körper ist ein Verschleißteil, spätestens im Alter bekommt das jeder zu spüren. Je älter der Mensch wird, desto wahrscheinlicher ist es, dass er irgendwann auf die Hilfe anderer angewiesen ist. Das kann schnell ins Geld gehen, Pflege ist teuer. Viele können sich die eigene Pflegebedürftigkeit allein nicht leisten und sind auf die Unterstützung von Familie oder Staat angewiesen. Wer sich gegen diesen Fall absichern will, kann eine private Zusatzversicherung abschließen. Aber auch diese muss erst einmal finanziert werden. Stiftung Warentest hat sich durch den Dschungel der Pflegetagegeld-Versicherungen geschlagen und geprüft, welche Policen sich lohnen können.\r\n<br><br>\r\nSich im Alter die Pflege nicht leisten zu können, die man sich wünscht, ist keine schöne Zukunftsperspektive. Oftmals aber ist genau das der Fall. Eine Pflegetagegeld-Versicherung kann, wenn es die richtige ist, diese finanzielle Lücke schließen. Sobald ein Pflegegrad festgestellt wird, zahlt die Versicherung täglich oder monatlich eine vereinbarte Summe. Das Geld ist nicht leistungsgebunden und kann nach eigenem Ermessen verwendet werden. So ist nicht nur das Minimum an Pflege abgedeckt, sondern Betroffene können sich auch gewisse Extras leisten, die ihnen das Leben leichter machen.\r\n<br><br>\r\nDas Problem: Nicht jeder kann es sich leisten, eine solche teure Zusatzversicherung abzuschließen. Eingezahlt wird mitunter über Jahrzehnte, zudem steigen die Beiträge im Verlauf ? und das für Versicherte unplanbar. \"Versicherte zahlen die Beiträge lebenslang, oft auch, wenn sie selbst pflegebedürftig sind\", so die Stiftung Warentest. Selten sei es möglich, die Pflegetagegeld-Versicherung zu pausieren. Und wer die Police kündigt, schießt sein investiertes Geld in den Wind ? das Geld sei dann weg. Die Stiftung Warentest rät daher von einem zu frühen Abschluss einer Pflegetagegeld-Versicherung ab. Warten bis zu den ersten gesundheitlichen Problemen sollte man aber bestenfalls auch nicht. Je nach Gesundheitszustand kann es schlimmstenfalls sogar passieren, dass der Anbieter Versicherungswillige ablehnt.\r\n<br><br>\r\nFür den Test von 24 Versicherungen ging Warentest davon aus, dass die Police mit 55 Jahren abgeschlossen wird und der monatliche Beitrag bei rund 115 Euro liegt. Die genannte Maximalsumme, die monatlich ausgezahlt wird, gilt für den höchsten Pflegegrad. Die PG von Hansemerkur überzeugte am meisten. Die Leistungen der Versicherung sind großzügig und decken den von Stiftung Warentest definierten Finanzbedarf mit 113 Prozent mehr als vollständig ab. Bis zu 2784 Euro werden monatlich ausgezahlt. Ebenfalls ordentlich ist das, was die Policen von Allianz, DKV und Huk Coburg bieten. Sie kompensieren den Bedarf zu mehr als 85 Prozent. Am schlechtesten schnitt die SDK ab. Versicherte können maximal mit 1000 Euro monatlich rechnen.', 'vijest6.jpg', 'gesundheit', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `korisnicko_ime` (`korisnicko_ime`);

--
-- Indexes for table `vijesti`
--
ALTER TABLE `vijesti`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `vijesti`
--
ALTER TABLE `vijesti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
