<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

    <title>Products - Bookstore</title>
</head>
<body>
    <jsp:include page="nav-header.jsp"/>
    <a href="shipment_table.jsp" class="back-arrow">
        <img src="images/back-arrow.png" alt="Back" />
    </a>
    <main>
        <section class="form-section animated">
            <h1>Shipment Tracking</h1>
            <p>Order number</p>
        </section>

            <ul>
                <li>
                    <div class="gap"></div>
                    <div class="progress one">
                        <i class="uil uil-check"></i>
                    </div>
                    <p>Shipping Soon</p>
                </li>
                <li>
                    <div class="gap"></div>
                    <div class="progress two">
                        <i class="uil uil-check"></i>
                    </div>
                    <p>Shipped</p>
                </li>
                <li>
                    <div class="gap"></div>
                    <div class="progress three">
                        <i class="uil uil-check"></i>
                    </div>
                    <p>On the way</p>
                </li>
                <li>
                    <div class="gap"></div>
                    <div class="progress four">
                        <i class="uil uil-check"></i>
                    </div>
                    <p>Out for delivery</p>
                </li>
                <li>
                    <div class="gap"></div>
                    <div class="progress five">
                        <i class="uil uil-check"></i>
                    </div>
                    <p>Delivered</p>
                </li>
            </ul>
    
    </main>

   <script>
        const one = document.querySelector(".one");
        const two = document.querySelector(".two");
        const three = document.querySelector(".three");
        const four = document.querySelector(".four");
        const five = document.querySelector(".five");

        one.onclick = function() {
            one.classList.add("active");
            two.classList.remove("active");
            three.classList.remove("active");
            four.classList.remove("active");
            five.classList.remove("active");
        }

        two.onclick = function() {
            one.classList.add("active");
            two.classList.add("active");
            three.classList.remove("active");
            four.classList.remove("active");
            five.classList.remove("active");
        }
        three.onclick = function() {
            one.classList.add("active");
            two.classList.add("active");
            three.classList.add("active");
            four.classList.remove("active");
            five.classList.remove("active");
        }
        four.onclick = function() {
            one.classList.add("active");
            two.classList.add("active");
            three.classList.add("active");
            four.classList.add("active");
            five.classList.remove("active");
        }
        five.onclick = function() {
            one.classList.add("active");
            two.classList.add("active");
            three.classList.add("active");
            four.classList.add("active");
            five.classList.add("active");
        }
   </script>
</body>
</html>