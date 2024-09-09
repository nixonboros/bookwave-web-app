<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/styles.css">
        <title>Shipping Table - Bookstore</title>
    </head>
    <body>
        <jsp:include page="nav-header.jsp"/>

        <main>
            <section class="form-section animated">
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
                                    <td>10001</td>
                                    <td>10001</td>
                                    <td>2024-09-02</td>
                                    <td>In Progress</td>
                                    <td><a href="#" class="button">Edit</a></td>
                                </tr>
                                <tr>
                                    <td>10002</td>
                                    <td>10002</td>
                                    <td>2024-09-01</td>
                                    <td>Completed</td>
                                    <td><a href="#" class="button">Edit</a></td>

                                </tr>
                            </tbody>
                        </table>
            </section>
        </main>
    </body>
</html>
