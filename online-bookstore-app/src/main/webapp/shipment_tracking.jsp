<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="images/book-logo.png">
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/layout.css">
    <link rel="stylesheet" href="css/components.css">
    <link rel="stylesheet" href="css/shipment.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

    <title>Shipment Tracking - Bookstore</title>
</head>
<body>
    <jsp:include page="nav-header.jsp"/>
    <main>
        <div class="shipment-boundary">
            <div class="shipment-card">
                <a href="UserOrderDashboardServlet" class="back-arrow">
                    <img src="images/back-arrow.png" alt="Back" />
                </a>
                <h1 class="shipment-title">Shipment Tracking</h1>
                <div class="shipment-info">
                    <span>Order Number: <strong>100001</strong></span>
                    <span>Expected Delivery: <strong>3 Days</strong></span>
                </div>
                <div class="shipment-stepper">
                    <div class="step completed">
                        <div class="circle"><span>&#10003;</span></div>
                        <div class="label">Processing</div>
                    </div>
                    <div class="line completed"></div>
                    <div class="step completed">
                        <div class="circle"><span>&#10003;</span></div>
                        <div class="label">Shipped</div>
                    </div>
                    <div class="line completed"></div>
                    <div class="step completed">
                        <div class="circle"><span>&#10003;</span></div>
                        <div class="label">On the way</div>
                    </div>
                    <div class="line"></div>
                    <div class="step">
                        <div class="circle"></div>
                        <div class="label">Out for delivery</div>
                    </div>
                    <div class="line"></div>
                    <div class="step">
                        <div class="circle"></div>
                        <div class="label">Delivered</div>
                    </div>
                </div>
            </div>
        </div>
    </main>

   <script>
        const one = document.querySelector(".one");
        const two = document.querySelector(".two");
        const three = document.querySelector(".three");

        one.classList.add("active");
        two.classList.add("active");
        three.classList.add("active");
   </script>
</body>
</html>