<!DOCTYPE html>
<html lang="de">

<head>
    <meta charset="utf-8">
    <meta name="description" content="Stern">
    <meta name="author" content="Luka Pajković">
    <title>Stern</title>
    <link rel="stylesheet" type="text/css" href="style.css">

</head>

<body>

    <?php

    include "connect.php";
    
    if(isset($_POST["slanje"])){
    $naslovVijesti = $_POST["title"];
    $opisVijest=$_POST["opis"];
    $kratkiSadrzaj = $_POST["about"];
    $sadrzajVijesti = $_POST["content"];
    $slika = $_FILES["pphoto"]["name"];;
    $kategorija = $_POST["category"];
    if(isset($_POST['arhiva'])){
        $arhiva=1;
    }else{
        $arhiva=0;
    }
    $target_dir = 'Slike/'.$slika;
    move_uploaded_file($_FILES["pphoto"]["tmp_name"], $target_dir);
    $datum = date("d.m.Y");

    $query="INSERT INTO vijesti (datum,naslov,opis,sazetak,tekst,slika,kategorija,arhiva) VALUES('$datum','$naslovVijesti','$opisVijest','$kratkiSadrzaj','$sadrzajVijesti','$slika','$kategorija','$arhiva');";
        $result=mysqli_query($dbc,$query) or die ("Error querying");

        if($result!=true){
            echo "<p class=\"warning\">Nije moguće unijeti vijest!</p><br>";
        }
    
        
        mysqli_close($dbc);
    }

    ?>


    <header>

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
                    <li><a href="kategorija.php?id=politik" <?php if ($kategorija == "politik") echo "class='selected'"; ?>>Politik</a></li>
                    <li><a href="kategorija.php?id=gesundheit" <?php if ($kategorija == "gesundheit") echo "class='selected'"; ?>>Gesundheit</a></li>
                    <li><a href="adminForma.php">Administracija</a></li>
                    <li><a href="registracija.php">Registracija</a></li>
                    <li><a href="unos.html">Unos</a></li>
                </ul>

            </nav>
        </div>


    </header>
    <main>

        <section>
            <div class="newsTitleWrapper">
                <h2><?php echo $naslovVijesti; ?></h2>
                <span><?php echo $datum; ?></span>
            </div>
            <h3 class="articleSubtitle"><?php echo $kratkiSadrzaj; ?></h3>
            <div class="newsImg"><?php echo "<img src=\"Slike/$slika\" alt=\"vijest\">"; ?></div>
            <article class="vijest">
                <p>
                    <?php echo $sadrzajVijesti; ?>
                </p>
            </article>

        </section>

    </main>

        

    <footer>
        <p>Luka Pajković, Programiranje Web Aplikacija - TVZ, 2023.</p>
    </footer>

</body>






</html>