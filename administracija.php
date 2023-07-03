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
                    <li><a href="adminForma.php" class="selected">Administracija</a></li>
                    <li><a href="registracija.php">Registracija</a></li>
                    <li><a href="unos.html">Unos</a></li>
                    <li><a href="reset.php">Logout</a></li>
                </ul>

            </nav>
        </div>


    </header>
    <main>

        <?php
        session_start();
        include "connect.php";
        define("UPLPATH", "Slike/");
        $uspjesnaPrijava=false;
        $admin=false;
        // Provjera da li je korisnik došao s login forme 
        if (isset($_POST['submit'])) {

            
            
            // Provjera da li korisnik postoji u bazi uz zaštitu od SQL injectiona 
            $prijavaImeKorisnika = $_POST['username'];
            $prijavaLozinkaKorisnika = $_POST['lozinka'];
            
            $sql = "SELECT korisnicko_ime, lozinka, razina FROM korisnik WHERE korisnicko_ime = ?";
            $stmt = mysqli_stmt_init($dbc);
            if (mysqli_stmt_prepare($stmt, $sql)) {
                mysqli_stmt_bind_param($stmt, 's', $prijavaImeKorisnika);
                mysqli_stmt_execute($stmt);
                mysqli_stmt_store_result($stmt);
                
            }
            mysqli_stmt_bind_result($stmt, $imeKorisnika, $lozinkaKorisnika, $levelKorisnika);
            mysqli_stmt_fetch($stmt);
            
            //Provjera lozinke 
            if ((password_verify($_POST["lozinka"], $lozinkaKorisnika)) && mysqli_stmt_num_rows($stmt) > 0) {
                $uspjesnaPrijava = true;
                
                // Provjera da li je admin 
                if ($levelKorisnika == 1) {
                    $admin = true;
                    
                } else {
                    $admin = false;
                }
                
                //postavljanje session varijabli 
                $_SESSION['$username'] = $imeKorisnika;
                $_SESSION['$level'] = $levelKorisnika;
            } else {
                $uspjesnaPrijava = false;
            }
        }
        // Brisanje i promijena arhiviranosti 
        

        // Pokaži stranicu ukoliko je korisnik uspješno prijavljen i administrator je 
        if ($uspjesnaPrijava == true && $admin == true)  //|| isset($_SESSION['$username']) && $_SESSION['$level'] == 1) 
        {
            $query = "SELECT * FROM vijesti";
            $result = mysqli_query($dbc, $query);

            while ($row = mysqli_fetch_array($result)) {
                echo '<form enctype="multipart/form-data" action="" method="POST" class="adminForm">
            <div class="form-item"> <label for="title">Naslov vijesti:</label>
                <div class="form-field"> <input type="text" name="title" class="form-field-textual"
                        value="' . $row['naslov'] . '"> </div>
            </div>
            <div class="form-item"> <label for="about">Kratki sadržaj vijesti (do 50 znakova):</label>
                <div class="form-field"> <textarea name="about" id="" cols="30" rows="10"
                        class="form-field-textual">' . $row['sazetak'] . '</textarea> </div>
            </div>
            <div class="form-item"> <label for="content">Sadržaj vijesti:</label>
                <div class="form-field"> <textarea name="content" id="" cols="30" rows="10"
                        class="form-field-textual">' . $row['tekst'] . '</textarea> </div>
            </div>
            <div class="form-item"> <label for="pphoto">Slika:</label>
                <div class="form-field">

                <input type="file" class="input-text" id="pphoto" value="' . $row['slika'] . '" name="pphoto"/> <br>
                <img src="' . UPLPATH . $row['slika'] . '" width=100px> </div> </div> 
                <div class="form-item"> <label for="category">Kategorija vijesti:</label> 
                <div class="form-field"> 
                <select name="category" id="" class="form-field-textual" value="' . $row['kategorija'] . '"> 
                <option value="politik">Politik</option> 
                <option value="gesundheit">Gesundheit</option> </select> </div> </div> 
                <div class="form-item"> <label>Spremiti u arhivu: <div class="form-field">';
                if ($row['arhiva'] == 0) {
                    echo '<input type="checkbox" name="archive" id="archive"/> Arhiviraj?';
                } else {
                    echo '<input type="checkbox" name="archive" id="archive" checked/> Arhiviraj?';
                }
                echo '</div> </label> </div> </div> <div class="form-item-buttons"> <input type="hidden" name="id" class="form-field-textual" value="' . $row['id'] . '"> <button type="reset" value="Poništi">Poništi</button> <button type="submit" name="update" value="Prihvati"> Izmjeni</button> <button type="submit" name="delete" value="Izbriši"> Izbriši</button> </div> </form>';
            }
            // Pokaži poruku da je korisnik uspješno prijavljen, ali nije administrator 
        } else if ($uspjesnaPrijava == true && $admin == false) {
            echo '<p class="warning">Bok ' . $imeKorisnika . '! Uspješno ste prijavljeni, ali niste administrator.</p>';
        } else if (isset($_SESSION['$username']) && $_SESSION['$level'] == 0) {
            echo '<p class="warning">Bok ' . $_SESSION['$username'] . '! Uspješno ste prijavljeni, ali niste administrator.</p>';
        } else if ($uspjesnaPrijava == false) {
            echo "<p class=\"warning\">Niste uspješno prijavljeni</p>";
        }
        ?>

        <!--brisanje-->
        <?php
        if (isset($_POST['delete'])) {
            $id = $_POST['id'];
            $query = "DELETE FROM vijesti WHERE id=$id ";
            $result = mysqli_query($dbc, $query);
            header("Location:index.php");
        }
        ?>

        <!--update-->
        <?php

        if (isset($_POST['update'])) {
            $picture = $_FILES['pphoto']['name'];
            $title = $_POST['title'];
            $about = $_POST['about'];
            $content = $_POST['content'];
            $category = $_POST['category'];
            if (isset($_POST['archive'])) {
                $archive = 1;
            } else {
                $archive = 0;
            }
            $target_dir = 'Slike/' . $picture;
            move_uploaded_file($_FILES["pphoto"]["tmp_name"], $target_dir);
            $id = $_POST['id'];
            $query = "UPDATE vijesti SET naslov='$title', sazetak='$about', tekst='$content', slika='$picture', kategorija='$category', arhiva='$archive' WHERE id=$id ";
            $result = mysqli_query($dbc, $query);
            header("Location:index.php");
        }

        mysqli_close($dbc);
        ?>

    </main>

    <footer>
        <p>Luka Pajković, Programiranje Web Aplikacija - TVZ, 2023.</p>
    </footer>

</body>

</html>