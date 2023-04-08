<!DOCTYPE html>
<html>
    <head>
        <title>CISC 332 Web App- Liam Seagram- Orders</title>
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
            <section id="orders">
                <div class="section-inner">
                    <?php
                    $hostname = "localhost";
                    $db="restaurantdb";
                    $username="root";
                    $password="";

                    $dbc = new PDO("mysql:host=$hostname;dbname=$db", $username, $password);

                    $sqlQuery = "
                    select *
                    from customer;";

                    $result = $dbc->query($sqlQuery);

                    if (!$result || $result->rowCount() < 1) {
                        echo "<br><h2>No customers on record.</h2>";
                    }

                    else if (is_array($result) || is_object($result)) {
                        echo "<h2>All customers at all restaurants:</h2>";
                        echo "<table>";
                        echo "
                            <tr>
                                <th>Email</th>
                                <th>Credit</th>
                                <th>First Name</th>
                                <th>Initial</th>
                                <th>Last Name</th>
                                <th>Address</th>
                                <th>Phone Number</th>
                                <th>Customer Restaurant</th>
                            </tr>";
                        foreach ($result as $row) {
                            echo "<tr>
                                    <td>".$row[0]."</td>
                                    <td>".$row[1]."</td>
                                    <td>".$row[2]."</td>
                                    <td>".$row[3]."</td>
                                    <td>".$row[4]."</td>
                                    <td>".$row[5]."</td>
                                    <td>".$row[6]."</td>
                                    <td>".$row[7]."</td>
                                </tr>";
                        }
                        echo "</table>";
                    }

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