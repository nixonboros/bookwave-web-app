<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/styles.css">
        <title> Shopping cart</title>
    </head>
    <body>
        <jsp:include page="nav-header.jsp"/>

        <main>
            <h1 class="formTitle">Your Shopping Cart</h1>
    
            <section class="cart-details animated">
                <table>
                    <thead>
                        <tr>
                            <th>Item ID</th>
                            <th>Item Name</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Total</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>101</td>
                            <td>Book 1</td>
                            <td>1</td>
                            <td>$15.99</td>
                            <td>$15.99</td>
                            <td><button class="button">Remove</button></td>
                        </tr>
                        <tr>
                            <td>102</td>
                            <td>Book 2</td>
                            <td>2</td>
                            <td>$12.99</td>
                            <td>$25.98</td>
                            <td><button class="button">Remove</button></td>
                        </tr>
                    </tbody>
                </table>
    
                <div class="ticket-actions">
                    <a href="checkout.jsp" class="button">Proceed to Checkout</a>
                </div>
            </section>
        </main>
    </body>
</html>