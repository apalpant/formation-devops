<!doctype html>
<html lang="fr">
<head>
  <meta charset="utf-8">
  <title>Titre de la page</title>
  <link rel="stylesheet" href="style.css">
  <script src="script.js"></script>
</head>
<body>
    <h1>Apache</h1>
    <?php

    
        $servername = "127.0.0.1";
        $username = "root";
        $password = "password";
        $dbname = "ansible";

        try {
        $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        echo "Connected successfully to MariaDb";
        } catch(PDOException $e) {
        echo "Connection failed: " . $e->getMessage();
        }

        $message = "PHP musketeers works !";
        echo "<p>". $message . "</p>"


    ?>
</body>
</html>