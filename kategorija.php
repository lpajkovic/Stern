<!DOCTYPE html>
<html lang="de">

<head>
    <meta charset="utf-8">
    <meta name="description" content="Stern">
    <meta name="author" content="Luka Pajković">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stern</title>
    <link rel="stylesheet" type="text/css" href="style.css">

</head>

<body>

    <header>

        <?php $kategorija=$_GET["id"]; ?>

        <div class="imglogo">
            <img src="Slike/logo.png" alt="SternLogo">
        </div>

        <div class="navTitle">
            <div class="logo">
                <img src="Slike/stern.png" alt="Stern">
            </div>
            <nav>
            <ul>
                    <li><a href="index.php">Home</a></li>
                    <li><a href="kategorija.php?id=politik" <?php if ($kategorija == "politik") echo "class=\"selected\""; ?>>Politik</a></li>
                    <li><a href="kategorija.php?id=gesundheit" <?php if ($kategorija == "gesundheit") echo "class='selected'"; ?>>Gesundheit</a></li>
                    <li><a href="adminForma.php">Administracija</a></li>
                    <li><a href="registracija.php">Registracija</a></li>
                    <li><a href="unos.html">Unos</a></li>
                </ul>

            </nav>
        </div>


    </header>
    <main>

        <?php
        include "connect.php";
        define("UPLPATH", "Slike/");
        
        ?>


        <section>
            <h2><?php echo strtoupper($kategorija); ?> ></h2>
            <div class="articleWrap">
                <?php

                $query = "SELECT * FROM vijesti WHERE arhiva=0 AND kategorija='$kategorija' ORDER BY datum DESC;";
                $result = mysqli_query($dbc, $query);
                
                $i = 0;
                while ($row = $result->fetch_assoc()) {

                    echo '<article>';
                    echo '<img src="Slike/' . $row["slika"] . '">';
                    echo '<h3>';
                    echo '<span class="miniTitle"><a>' . $row["opis"] . '</a></span>';
                    echo '<span class="bigTitle">';
                    echo "<a href=\"clanak.php?id=" . $row["id"] . "&kategorija=$kategorija\">" . $row["naslov"] . "</a></span>";
                    echo '</h3>';
                    echo '</article>';
                }

                ?>

            </div>
        </section>
        
    </main>

    <footer>
        <p>Luka Pajković, Programiranje Web Aplikacija - TVZ, 2023.</p>
    </footer>

</body>






</html>