<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/styles.css">
        <title>Shipping table</title>
    </head>
    <body>
        <jsp:include page="nav-header.jsp"/>

        <main>
            <h1 class="formTitle">Shipping Table</h1>
                    <table>
                        <thead>
                            <tr>
                                <th>Shipment ID</th>
                                <th>Order ID</th>
                                <th>Shipping Date</th>
                                <th>Shipping Progress</th>
                                <th>Shipping Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>000000</td>
                                <td>000000</td>
                                <td>2024-09-02</td>
                                <td><a href="shipment_tracking.jsp">View</a></td>
                                <td>Completed</td>

                            </tr>
                            <tr>
                                <td>000001</td>
                                <td>000001</td>
                                <td>2024-09-05</td>
                                <td><a href="shipment_tracking.jsp">View</a></td>
                                <td>In Progress</td>

                            </tr>
                        </tbody>
                    </table>
        </main>
    </body>
</html>
