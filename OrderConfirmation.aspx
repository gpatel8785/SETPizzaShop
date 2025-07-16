<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderConfirmation.aspx.cs" Inherits="SETPizzaShop.OrderConfirmation" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SET Pizza Shop - Order Confirmation</title>

    <!-- Include Bootstrap and Custom Styles -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="Content/styles.css">
</head>
<body>
    <div class="container text-center mt-5">
         <h1 class="display-4 text-white py-3 headerstyle">SET Pizza Shop</h1>
        <p class="lead">Ciao <span id="userName" class="text-primary"></span>! Here's your order summary:</p>

        <img src="Content/images/pizza-order-bg.jpeg" alt="Pizza Order Summary" class="img-fluid rounded mb-4" style="max-height: 300px; object-fit: cover;">

        <!-- Order Summary -->
        <div class="card mx-auto mt-4" style="max-width: 600px;">
            <div class="card-header bg-dark text-white">
                <h4>Your Pizza Order</h4>
            </div>
            <div class="card-body">
                <h5 class="card-title text-primary">Toppings</h5>
                <ul id="toppingList" class="list-group list-group-flush"></ul>
                <div class="mt-3">
                    <h5 class="text-success">Total Price: <span id="totalPrice"></span></h5>
                </div>
            </div>
        </div>

        <!-- Action Buttons -->
        <div class="mt-4">
            <button id="confirmOrder" class="btn btn-success">Confirm Order</button>
            <button id="cancelOrder" class="btn btn-danger">Cancel Order</button>
        </div>
    </div>

    <!-- Toast Notification -->
    <div class="toast-container position-fixed top-0 end-0 p-3">
        <div id="toastNotification" class="toast align-items-center text-white bg-primary border-0" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="d-flex">
                <div id="toastMessage" class="toast-body"></div>
                <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const toppings = "<%= Session["SelectedToppings"] ?? "" %>";
            //total prce get from sessiion;
            const totalPrice = "<%= Session["TotalPrice"] ?? "$0.00" %>";
            //full Name as Per requirement added in order confirmation page;
            const userName = "<%= Session["UserName"] ?? "" %>";

            // Populate order dsetails
            document.getElementById("userName").textContent = userName;
            document.getElementById("totalPrice").textContent = `$${totalPrice}`;
            const toppingList = toppings.split(",");
            const toppingListElement = document.getElementById("toppingList");
            toppingList.forEach(topping => {
                const li = document.createElement("li");
                li.textContent = topping;
                li.className = "list-group-item";
                toppingListElement.appendChild(li);
            });

            // Confirm Order
            document.getElementById("confirmOrder").addEventListener("click", function () {
                showToast("Order confirmed!", "success");
                setTimeout(() => window.location.href = "ThankYouPage.aspx?action=confirm", 2000);
            });

            // Cancel Order
            document.getElementById("cancelOrder").addEventListener("click", function () {
                showToast("Order canceled.", "danger");
                setTimeout(() => window.location.href = "ThankYouPage.aspx?action=cancel", 2000);
            });

            // Show toast notifications
            function showToast(message, type) {
                const toastColors = {
                    success: "bg-success",
                    danger: "bg-danger",
                    warning: "bg-warning",
                    info: "bg-info"
                };

                const toastElement = document.getElementById("toastNotification");
                const toastBody = document.getElementById("toastMessage");

                toastBody.textContent = message;
                toastElement.className = "toast align-items-center text-white border-0 " + (toastColors[type] || "bg-primary");
                const toast = new bootstrap.Toast(toastElement);
                toast.show();
            }
        });
    </script>
</body>
</html>
