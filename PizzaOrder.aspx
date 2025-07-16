<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PizzaOrder.aspx.cs" Inherits="SETPizzaShop.PizzaOrder" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SET Pizza Shop - Order</title>

    <!-- Include Bootstrap and jQuery -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Custom Styles -->
    <link rel="stylesheet" href="Content/styles.css">

    <!-- Custom Scripts -->
    <script src="Scripts/pizza.js"></script>
</head>
<body>
    <div class="container text-center mt-5">
        <!-- Header -->
        <h1 class="display-4 text-white py-3 headerstyle" >SET Pizza Shop</h1>
        <p class="lead">Ciao <span id="userName" class="text-primary"></span>! Customize your pizza below:</p>

        <!-- Toast Notification -->
        <div class="toast-container position-fixed top-0 end-0 p-3">
            <div id="toastNotification" class="toast align-items-center text-white bg-primary border-0" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="d-flex">
                    <div id="toastMessage" class="toast-body"></div>
                    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
            </div>
        </div>

        <!-- Toppings Form -->
        <form id="toppings-form">
            <div class="row justify-content-center">
                <!-- Topping 1 -->
                <div class="col-md-6 col-lg-4 mb-4">
                    <div class="card  cardmaster">
                        <img src="Content/images/topping-pepperoni.jpg" class="card-img-top topping-img" alt="Pepperoni" >
                        <div class="card-body">
                            <h5 class="card-title">Pepperoni<br>($1.50)</h5>
                            <input type="checkbox" class="form-check-input" id="topping0" value="Pepperoni">
                            <label class="form-check-label" for="topping0">Add Pepperoni</label>
                        </div>
                    </div>
                </div>
                <!-- Topping 2 -->
                <div class="col-md-6 col-lg-4 mb-4">
                    <div class="card cardmaster">
                        <img src="Content/images/topping-mushrooms.jpg" class="card-img-top topping-img" alt="Mushrooms" >
                        <div class="card-body">
                            <h5 class="card-title">Mushrooms ($1.00)</h5>
                            <input type="checkbox" class="form-check-input" id="topping1" value="Mushrooms">
                            <label class="form-check-label" for="topping1">Add Mushrooms</label>
                        </div>
                    </div>
                </div>
                <!-- Topping 3 -->
                <div class="col-md-6 col-lg-4 mb-4">
                    <div class="card cardmaster">
                        <img src="Content/images/topping-olives.jpg" class="card-img-top topping-img" alt="Green Olives">
                        <div class="card-body">
                            <h5 class="card-title">Green Olives ($1.00)</h5>
                            <input type="checkbox" class="form-check-input" id="topping2" value="Green Olives">
                            <label class="form-check-label" for="topping2">Add Green Olives</label>
                        </div>
                    </div>
                </div>
                <!-- Topping 4 -->
                <div class="col-md-6 col-lg-4 mb-4">
                    <div class="card cardmaster">
                        <img src="Content/images/topping-peppers.jpg" class="card-img-top topping-img" alt="Green Peppers" style="height:140px; border-radius: 8px;">
                        <div class="card-body">
                            <h5 class="card-title">Green Peppers ($1.00)</h5>
                            <input type="checkbox" class="form-check-input" id="topping3" value="Green Peppers">
                            <label class="form-check-label" for="topping3">Add Green Peppers</label>
                        </div>
                    </div>
                </div>
                <!-- Topping 5 -->
                <div class="col-md-6 col-lg-4 mb-4">
                    <div class="card cardmaster">
                        <img src="Content/images/topping-cheese.jpg" class="card-img-top topping-img" alt="Double Cheese">
                        <div class="card-body">
                            <h5 class="card-title">Double Cheese ($2.25)</h5>
                            <input type="checkbox" class="form-check-input" id="topping4" value="Double Cheese">
                            <label class="form-check-label" for="topping4">Add Double Cheese</label>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Total and Submit -->
            <div class="mt-4">
                <h4>Total Price: <span id="totalPrice" class="text-success">$10.00</span></h4>
                <button type="button" id="submit-order" class="btn btn-primary mt-3">Make It!</button>
            </div>
        </form>
    </div>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const userName = "<%= Session["FirstName"] ?? "" %>";
            document.getElementById("userName").textContent = userName;
        });
    </script>
</body>
</html>
