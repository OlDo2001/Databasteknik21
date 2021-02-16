<!doctype html>
<html lang="sv">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="../WebShop-Bootstrap/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
  <style> 
        textarea {
            width: 100%;
            height:200px;
            padding: 12px 20px;
            box-sizing: border-box;
            border: 2px solid #ccc;
            border-radius: 4px;
            background-color: #f8f8f8;
            font-size: 16px;
            resize: none;
        }
        img {
            width: 50%;
            display: block;
            margin-left: auto;
            margin-right: auto;
            margin-top: auto;
            margin-bottom: auto;
            padding: 20px 0;
        }
  </style>
  <title>Bokhandel</title>
</head>

<body class="container">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">   
        <div class="container">
            <a class="navbar-brand" href="../index.php">Home</a>
            <a class="navbar-brand" href="../contactForm/index.php" target='_blank'>Kontakt</a>
            <a href="/Databasteknik21/Projektarbete/contactForm/Admin/index.php" class="btn btn-primary btn-lg" role="button">Admin</a>
        </div>
</nav>

<?php

$title = "";
$author = "";
$price = "";
if ($_SERVER["REQUEST_METHOD"] == "GET"){
require_once ('../database.php');

$productID = $_GET['product_id'];
$stmt = $conn->prepare("SELECT *, authors.author 
                        FROM (products INNER JOIN authors ON products.author = authors.authors_id) 
                        WHERE products.product_id = $productID");

$stmt->execute();
$result = $stmt->fetchAll();

echo "Din bestälning: <br>";
 $table = "<div class='container'><div class='row' style='padding:60px'>
  <table class='table table-primary'>
  <tr><h3>Varukorg</h3></tr>
  <tr>
      <th></th>
      <th>Namn</th>
      <th>Förtfattare</th>
      <th>Pris</th>
  </tr>
  ";

  
  foreach($result as $key => $value){

  $id = $value['product_id'];  // Detta är en primärnyckel
  $table .= "
      <tr>
          <td><img src='../images/$value[image]' style='width: 50%'></td>
          <td>$value[title]</td>
          <td>$value[author]</td>
          <td>$value[price]</td> 
     </tr>
  ";
$title = $value['title'];
$author = $value['author'];
$price = $value['price'];

  }
}
$table .= "</table></div></div>";
echo $table;


if ($_SERVER["REQUEST_METHOD"] == "POST"){

require_once("../database.php");
//require_once("header.php");

$customer_name = $_POST['customer_name'];
$email = $_POST['email'];
$tel = $_POST['tel'];
$address = $_POST['address'];


$customer_name = filter_var($customer_name, FILTER_SANITIZE_STRING);
$tel = filter_var($tel, FILTER_SANITIZE_STRING);
$address = filter_var($address, FILTER_SANITIZE_STRING);
// Remove all illegal characters from email
$email = filter_var($email, FILTER_SANITIZE_EMAIL);
// Validate e-mail
if (!filter_var($email, FILTER_VALIDATE_EMAIL) === false) {
  //echo("$epost is a valid email address");

// Skapa en SQL-sats (förbereda en sats)


$stmt = $conn->prepare("INSERT INTO customers (customer_name, email, tel, address)
                      VALUES (:customer_name ,:email, :tel, :address)");

// Binda parametrar (binda variabler med platshållare)
$stmt->bindParam(':customer_name', $customer_name);
$stmt->bindParam(':email', $email);
$stmt->bindParam(':tel', $tel);
$stmt->bindParam(':address', $address);

// Kör SQL-sats
$stmt->execute();

$last_id = $conn->lastInsertId();

// Hämta sista id som infogats auto-increment
//if ($_SERVER["REQUEST_METHOD"] == "GET"){
  //require_once ('../database.php');

//$productID = $_GET['product_id'];
$_SERVER["REQUEST_METHOD"] = "GET";{
  require_once ('../database.php');

  $productID = $_GET['product_id'];

$stmt = $conn->prepare("INSERT INTO orders (customer, product)
VALUES (:customer_id,:product_id)");
$stmt->bindParam(':customer_id', $last_id);
$stmt->bindParam(':product_id', $productID);

$stmt->execute();

$last_id = $conn->lastInsertId();

}

//echo "<p>$name har sparats i databasen med id=$last_id</p>";

/*$message = "<div class='alert alert-success' role='alert'>
          <p>$name har sparats i databasen med id=$last_id</p>
          </div>";  */
/*$confirm = "<div  action='conformSida.php'class='alert alert-success' role='alert'>
          <h2><hr><hr>Tack, $customer_name, för din beställning!</h2><br><hr><h4>Boken är på väg till dig. <hr></h4></p>
          </div>";  */           

  //if(isset($message)) echo $message;
  if(isset($confirm)) echo $confirm; 
  } else {
  $epostarror = "<div class='alert alert-danger' role='alert'>
                  <h2>Du har anget ett ogiltigt email!</h2>
              </div>";

  echo $epostarror;
}
}
?>

<h4>Skriv dina uppgifter för att beställa boken:</h4>
<form action="confirmSida.php" class="row" method="post">
 

<div class="col-md-12 my-2">
  <label for="bok">Bok</label>
  <input type="text" id="bok" class="form-control" name= "bok" value="<?php echo $title ?>" disabled> 
</div>

<div class="col-md-6 my-2">
  <label for="author">Förtfattare</label>
  <input type="text" id="author" class="form-control" name= "Färtfattare" value="<?php echo $author ?>" disabled> 
</div>

<div class="col-md-6 my-2">
  <label for="price">Pris</label>
  <input type="text" id="price" class="form-control" name= "Pris" value="<?php echo $price ?>" disabled> 
</div>



<div class="col-md-6 my-2">
  <label for="name">Namn</label>
  <input type="text" id="name" class="form-control" name="customer_name" placeholder="Ditt namn.." required> 
</div>

<div class="col-md-6 my-2">
  <label for="epost">E-mail</label> 
  <input type="email" id="epost"class="form-control" name="email" placeholder="Ditt mail.."required>
</div>

<div class="col-md-6 my-2">
  <label for="tel">Telefon</label> 
  <input type="text" id="tel"class="form-control" name="tel" placeholder="Ditt telefonnummer.."required>
</div>

<div class="col-md-12 my-2">
  <label for="adress">Adress</label>
  <textarea type="text" id="adress" name="address" placeholder="Skriv din adress" required></textarea>
</div>

<div class="col-md-4 my-2">
  <input type="submit" value="Beställa" class="form-control btn btn-outline-dark">
</div>
</form>

<hr>
<footer class="text-center text-muted">
 Copyright &copy; Olga Domorod & Jovana Hurra <?php echo date('Y'); ?>
</footer>

</body>
</html>

