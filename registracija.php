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
                    <li><a href="adminForma.php">Administracija</a></li>
                    <li><a href="registracija.php" class="selected">Registracija</a></li>
                    <li><a href="unos.html">Unos</a></li>
                </ul>

            </nav>
        </div>


    </header>
    <main>




        <form method="POST" id="forma" name="forma">

            <div>
                <label for="ime"> Ime</label><br>
                <input type="text" name="ime" id="ime"><br>
            </div>
            <div>
                <label for="prezime"> Prezime</label><br>
                <input type="text" name="prezime"><br>
            </div>
            <div>
                <label for="username"> Username:</label><br>
                <input type="text" name="username"><br>
            </div>

            <div>
                <label for="password">Lozinka</label><br>
                <input type="password" name="pass" id="pass"><br>
            </div>
            <div>
                <label for="passCheck">Ponovljena lozinka</label><br>
                <input type="password" name="passCheck" id="passcheck"><br>
            </div>

            <div>
                <input type="submit" name="submit" value="Registriraj me">
            </div>
        </form>
        <?php

        include "connect.php";


        if (isset($_POST['submit'])) {

            $ime = $_POST['ime'];
            $prezime = $_POST['prezime'];
            $username = $_POST['username'];
            $lozinka = $_POST['pass'];
            $lozinka2 = $_POST['passCheck'];
            $hashed_password = password_hash($lozinka, CRYPT_BLOWFISH);
            $razina = 0;
            $registriranKorisnik = '';
            
            $sql = "SELECT korisnicko_ime FROM korisnik WHERE korisnicko_ime = ?";
            $stmt = mysqli_stmt_init($dbc);
            if (mysqli_stmt_prepare($stmt, $sql)) {
                mysqli_stmt_bind_param($stmt, 's', $username);
                mysqli_stmt_execute($stmt);
                mysqli_stmt_store_result($stmt);
            }
            if (mysqli_stmt_num_rows($stmt) > 0) {
                echo "<p class=\"warning\">Korisničko ime već postoji!</p><br>";;
            } elseif ($ime == "" || $prezime == "" || $_POST["username"]="" || $lozinka = "" || $lozinka2 = "") {
                echo "<p class=\"warning\">Molimo unesite sve potrebne podatke</p><br>";
            } elseif ($_POST['pass']!==$_POST['passCheck']) {
                exit( "<p class=\"warning\">Molimo da unesete lozinke koje su iste</p><br>");
            } else {

                $sql = "INSERT INTO korisnik (ime, prezime,korisnicko_ime, lozinka, razina) VALUES (?, ?, ?, ?, ?)";
                $stmt = mysqli_stmt_init($dbc);
                if (mysqli_stmt_prepare($stmt, $sql)) {
                    mysqli_stmt_bind_param(
                        $stmt,
                        'ssssi',
                        $ime,
                        $prezime,
                        $username,
                        $hashed_password,
                        $razina
                    );
                    mysqli_stmt_execute($stmt);
                    $registriranKorisnik = true;
                }
            }
            if ($registriranKorisnik == true) {
                echo "<p class=\"warning\">Korisnik je uspješno registriran!</p>";
            } else {
                echo "<p class=\"warning\">Registracija nije uspjela, probajte ponovo</p>";
            }

            

            mysqli_close($dbc);
        }
        ?>

    </main>

    <footer>
        <p>Luka Pajković, Programiranje Web Aplikacija - TVZ, 2023.</p>
    </footer>

</body>


</html>