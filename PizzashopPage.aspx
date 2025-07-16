<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PizzashopPage.aspx.cs" Inherits="SETPizzaShop.LandingPage" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SET Pizza Shop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="Content/styles.css">
</head>
<body>
    <!-- Toast Notification -->
    <div class="toast-container position-fixed top-0 end-0 p-3">
        <div id="toastNotification" class="toast align-items-center text-white bg-primary border-0" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="d-flex">
                <div id="toastMessage" class="toast-body"></div>
                <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
        </div>
    </div>

    <div class="container mt-5 text-center">
        <h1 class="display-4 text-white bg-orange py-3 headerstyle">SET Pizza Shop</h1>
        <div class="mt-5">
            <h3 class="mb-3">Welcome! Please enter your name to start ordering your pizza:</h3>
            <form id="landingForm" runat="server">
                <div class="mb-4">
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control w-50 mx-auto" placeholder="Enter your full name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="Name is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="cvNameFormat" runat="server" ControlToValidate="txtName" ErrorMessage="Please enter a valid full name (FirstName LastName)." CssClass="text-danger" Display="Dynamic" OnServerValidate="cvNameFormat_ServerValidate"></asp:CustomValidator>
                </div>
                <div>
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Start Order" OnClick="btnSubmit_Click" />
                </div>
            </form>
            <img src="Content/images/pizza-banner.png" style="width:100%;height:350px;margin:15px;" />
        </div>
    </div>
</body>
</html>
