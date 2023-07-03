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
                    <li><a href="kategorija.php?id=politik">Politik</a></li>
                    <li><a href="kategorija.php?id=gesundheit">Gesundheit</a></li>
                    <li><a href="administracija.php" class="selected">Administracija</a></li>
                    <li><a href="registracija.php">Registracija</a></li>
                    <li><a href="unos.html">Unos</a></li>
                </ul>

            </nav>
        </div>


    </header>
    <main>

        <?php
        session_start();
        include "connect.php";
        
        ?>


        <form method="post" id ="forma" action="administracija.php">
            <div>
            <label for="username"> Username:</label><br>
            <input type="text" name="username" id="username"><br>
            </div>

            <div>
            <label for="password">Lozinka:</label><br>
            <input type="password" name="lozinka" id="lozinka"><br>
            </div>
            

            <div>
            <input type="submit" name="submit" value="Prijava">
            </div>
        </form>

    </main>

    <footer>
        <p>Luka Pajković, Programiranje Web Aplikacija - TVZ, 2023.</p>
    </footer>

</body>

</html>