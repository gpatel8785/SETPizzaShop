<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThankYouPage.aspx.cs" Inherits="SETPizzaShop.ThankYouPage" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SET Pizza Shop - Thank You</title>

    <!-- Include Bootstrap and Custom Styles -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="Content/styles.css">
</head>
<body>
    <div class="container text-center mt-5">
        <h1 class="display-4 text-white py-3 headerstyle" >SET Pizza Shop</h1>

        <!-- Conditional Image Display -->
        <div class="mt-4">
            <img id="thankYouImage" src="" alt="Order Status" class="img-fluid rounded" style="max-height: 300px; object-fit: cover;">
        </div>

        <div class="card mx-auto mt-4" style="max-width: 600px;">
            <div class="card-header bg-dark text-white">
                <h4>Thank You!</h4>
            </div>
            <div class="card-body">
                <p id="thankYouMessage" class="lead text-primary"></p>
                <p class="mt-4">We hope to see you again soon at SET Pizza Shop!</p>
            </div>
        </div>
        <div class="mt-4">
            <a href="PizzashopPage.aspx" class="btn btn-primary">Order Again</a>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const userName = "<%= Session["UserName"] ?? "Customer" %>";
            const action = "<%= Request.QueryString["action"] ?? "unknown" %>";
            //FOr set thank you message along with the associated Image to page
            const thankYouMessage = document.getElementById("thankYouMessage");
            const thankYouImage = document.getElementById("thankYouImage");

            if (action === "confirm") {
                thankYouMessage.textContent = `Thank you, ${userName}, for your order! Your pizza will be ready shortly.`;
                thankYouImage.src = "Content/images/order-confirmation.jpg"; // Confirmation Image
            } else if (action === "cancel") {
                thankYouMessage.textContent = `Sorry to see you go, ${userName}. Your order has been cancelled.`;
                thankYouImage.src = "Content/images/pizza_cancelled_order.jpg"; // Cancellation Image
            } else {
                thankYouMessage.textContent = `Thank you for visiting Us, ${userName}.`;
                thankYouImage.src = "Content/images/thank-you.jpg"; // Default Image
            }
        });
    </script>
</body>
</html>
