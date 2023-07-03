<!DOCTYPE html>
<html lang="de">

<?php include "connect.php"; $kategorija=$_GET["kategorija"]; ?>

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

        <?php $kategorija = $_GET["kategorija"]; ?>

        <div class="imglogo">
            <img src="Slike/logo.png" alt="SternLogo">
        </div>

        <div class="navTitle">
            <div class="logo">
                <img src="Slike/stern.png" alt="Stern">
            </div>
            <nav>
                <ul>
                <ul>
                    <li><a href="index.php">Home</a></li>
                    <li><a href="kategorija.php?id=politik" <?php if ($kategorija == "politik") echo "class=\"selected\""; ?>>Politik</a></li>
                    <li><a href="kategorija.php?id=gesundheit" <?php if ($kategorija == "gesundheit") echo "class='selected'"; ?>>Gesundheit</a></li>
                    <li><a href="adminForma.php">Administracija</a></li>
                    <li><a href="registracija.php">Registracija</a></li>
                    <li><a href="unos.html">Unos</a></li>
                </ul>
                </ul>

            </nav>
        </div>


    </header>
    <main>

        <?php

        

        
        $query = "SELECT * FROM vijesti WHERE kategorija='$kategorija' AND arhiva=0";
        $result = mysqli_query($dbc, $query);

        if ($result == true) {
            while ($row = mysqli_fetch_array($result)) {
                $id = $_GET['id'];
                if ($id == $row['id']) {

        ?>

                    <section>
                        <div class="newsTitleWrapper">
                            <h2><?php echo $row["naslov"]; ?></h2>
                            <span><?php echo $row["datum"]; ?></span>
                        </div>
                        <h3 class="articleSubtitle"><?php echo $row["sazetak"]; ?></h3>
                        <div class="newsImg"><?php echo '<img src="Slike/' . $row['slika'] . '">'; ?></div>
                        <article class="vijest">
                            <p>
                                <?php echo $row['tekst']; ?>
                            </p>
                        </article>

                    </section>

        <?php
                }
            }
        } else {
            echo "Request fail";
        }
        mysqli_close($dbc);
        ?>

    </main>

    <footer>
        <p>Luka Pajković, Programiranje Web Aplikacija - TVZ, 2023.</p>
    </footer>

</body>






</html>