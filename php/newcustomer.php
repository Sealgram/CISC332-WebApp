<!DOCTYPE html>
<html>
    <head>
        <title>CISC 332 Web App- Liam Seagram- Add New Customer</title>
        <link href="../css/style.css" rel="stylesheet">
    </head>
    <body>
        <header>
            <nav>
                <ul>
                    <li><a href="../restaurant.html">Restaurant</a></li>
                    <li><a href="../html/orders.html">List All Orders on a Date</a></li>
                    <li><a href="../html/newcustomer.html">Add New Customer</a></li>
                    <li><a href="orderdates.php">Show Orders on Dates</a></li>
                    <li><a href="../html/employeeschedule.html">Show Employee Schedule</a></li>
                </ul>
            </nav>    
        </header>
        <main>
            <section id="addcustomer">
                <div class="section-inner">
                    <?php
                    $hostname = "localhost";
                    $db="restaurantdb";
                    $username="root";
                    $password="";

                    $dbc = new PDO("mysql:host=$hostname;dbname=$db", $username, $password);

                    $inputEmailf = $_POST["inputEmail"];
                    $inputEmailf .="'";
                    $inputEmail = "'" . $inputEmailf;

                    $inputFNamef = $_POST["inputFName"];
                    $inputFNamef .="'";
                    $inputFName = "'" . $inputFNamef;

                    $inputMInitialf = $_POST["inputMInitial"];
                    $inputMInitialf .="'";
                    $inputMInitial = "'" . $inputMInitialf;

                    $inputLNamef = $_POST["inputLName"];
                    $inputLNamef .="'";
                    $inputLName = "'" . $inputLNamef;

                    $inputAddressf = $_POST["inputAddress"];
                    $inputAddressf .="'";
                    $inputAddress = "'" . $inputAddressf;

                    $inputPhoneNumf = $_POST["inputPhoneNum"];
                    $inputPhoneNumf .="'";
                    $inputPhoneNum = "'" . $inputPhoneNumf;

                    $inputRestaurantf = $_POST["inputRestaurant"];
                    $inputRestaurantf .="'";
                    $inputRestaurant = "'" . $inputRestaurantf;

                    $sqlQuery = "
                    insert into Customer values
                    ($inputEmail, 5, $inputFName, $inputMInitial, $inputLName, $inputAddress, $inputPhoneNum, $inputRestaurant)
                    ;";

                    $dbc->query($sqlQuery);

                    echo "
                        <ul>
                            <li>Customer Email: $inputEmail</li>
                            <li>Customer Fist Name: $inputFName</li>
                            <li>Customer Middle Initial: $inputMInitial</li>
                            <li>Customer Last Name: $inputLName</li>
                            <li>Customer Address: $inputAddress</li>
                            <li>Customer Phone Number: $inputPhoneNum</li>
                            <li>Customer Restaurant: $inputRestaurant</li>
                        </ul>";
                    $dbc = null;
                    ?>
                    <div align="center">
                        <a href="../html/newcustomer.html">
                            <br>
                            <br>
                            <button>Back</button>
                        </a>
                    </div>
                </div>       
            </section>
        </main>
        <footer>
            CISC 332 Databases Web Application Assignment, <br>Liam Seagram, 20205234
        </footer>
    </body>
</html>