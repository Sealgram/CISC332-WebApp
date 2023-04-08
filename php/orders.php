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
                    <li><a href="../index.html">Restaurant</a></li>
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

                    $datef = $_POST["inputDate"];
                    $datef .="'";
                    $date = "'" . $datef;

                    $sqlQuery = "
                    select customer.CFName, customer.CLName, ordercontains.CFitem, orders.OPrice, orders.OTip, employee.EFname 
                    from orders
                    join customer on customer.CEMail = orders.OCEmail
                    join ordercontains on ordercontains.CORID = orders.ORID
                    join employee on orders.ODEID = employee.EID
                    where orders.ODate = $date
                    ;";

                    $result = $dbc->query($sqlQuery);

                    if (!$result || $result->rowCount() < 1) {
                        echo "<br><h2>There were no orders on $date.</h2>";
                    }

                    else if (is_array($result) || is_object($result)) {
                        echo "<h2>All orders at all restaurants on $date:</h2>";
                        echo "<table>";
                        echo "
                            <tr>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Item Ordered</th>
                                <th>Order Total</th>
                                <th>Order Tip</th>
                                <th>Delivery Person</th>
                            </tr>";
                        foreach ($result as $row) {
                            echo "<tr>
                                    <td>".$row[0]."</td>
                                    <td>".$row[1]."</td>
                                    <td>".$row[2]."</td>
                                    <td>".$row[3]."</td>
                                    <td>".$row[4]."</td>
                                    <td>".$row[5]."</td>
                                </tr>";
                        }
                        echo "</table>";
                    }

                    $dbc = null;
                    ?>
                    <div align="center">
                        <a href="../html/orders.html">
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