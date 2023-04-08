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
            <section id="employeeschedule">
                <div class="section-inner">
                    <?php
                    $hostname = "localhost";
                    $db="restaurantdb";
                    $username="root";
                    $password="";
                    $schedule="";

                    $dbc = new PDO("mysql:host=$hostname;dbname=$db", $username, $password);

                    $EID = $_POST["InputEmployeeID"];

                    $sqlQuery = "
                    SELECT ESchedule
                    from employee
                    where EID = $EID
                    ;";

                    $pizza  = "piece1 piece2 piece3 piece4 piece5 piece6";
                    $pieces = explode(" ", $pizza);

                    $result = $dbc->query($sqlQuery);

                    if (!$result || $result->rowCount() < 1) {
                        echo "<br><h2>There is no employee in the system with that ID.</h2>";
                    }
                    
                    else if (is_array($result) || is_object($result)) {
                        foreach ($result as $row) {
                            $schedule = explode(", ", $row[0]);
                        }
                        echo "<h2>Employee $EID's Shifts from Monday to Friday:</h2>";
                        echo "<table>";
                        echo "
                            <tr>
                                <th>Monday</th>
                                <th>Tuesday</th>
                                <th>Wednesday</th>
                                <th>Thursday</th>
                                <th>Friday</th>
                            </tr>";
                        echo "
                            <tr>
                                <td>".$schedule[1]."</td>
                                <td>".$schedule[2]."</td>
                                <td>".$schedule[3]."</td>
                                <td>".$schedule[4]."</td>
                                <td>".$schedule[5]."</td>
                            </tr>";
                        echo "</table>";
                    }

                    $dbc = null;
                    ?>
                    <div align="center">
                        <a href="../html/employeeschedule.html">
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