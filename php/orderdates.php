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
            <section id="Orders on Date">
                <div class="section-inner">
                    <?php
                    $hostname = "localhost";
                    $db="restaurantdb";
                    $username="root";
                    $password="";

                    $dbc = new PDO("mysql:host=$hostname;dbname=$db", $username, $password);

                    $sqlQuery = "
                    SELECT ODate, COUNT(*) AS Orders
                    FROM orders
                    GROUP BY ODate
                    ;";

                    $result = $dbc->query($sqlQuery);

                    if (!$result || $result->rowCount() < 1) {
                        echo "<br><h2>There are no orders.</h2>";
                    }

                    else if (is_array($result) || is_object($result)) {
                        echo "<h2>Amount of orders on each date:</h2>";
                        echo "<table>";
                        echo "
                            <tr>
                                <th>Date</th>
                                <th>Number of Orders</th>
                            </tr>";
                        foreach ($result as $row) {
                            echo "<tr>
                                    <td>".$row[0]."</td>
                                    <td>".$row[1]."</td>
                                </tr>";
                        }
                        echo "</table>";
                    }
                    ?>
                </div>       
            </section>
        </main>
        <footer>
            CISC 332 Databases Web Application Assignment, <br>Liam Seagram, 20205234
        </footer>
    </body>
</html>