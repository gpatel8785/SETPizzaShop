$(document).ready(function () {
    // FUNCTION      : calculateTotal
    // DESCRIPTION   : Sends selected toppings to the server and updates the total price dynamically.
    function calculateTotal() {
        const selectedToppings = [];
        $("#toppings-form input:checked").each(function () {
            selectedToppings.push($(this).val());
        });

        $.post(`PizzaOrder.aspx?action=calculateTotal&filename=${encodeURIComponent(selectedToppings.join(","))}`, function (response) {
            if (response.error) {
                showToast(response.error, "danger");
                showToast(response, "success");
            } else {
                $("#totalPrice").text(`$${response.Total}`);
            }
        }).fail(() => showToast("Error getting total.", "danger"));
       
    }

    // FUNCTION      : showToast
    // DESCRIPTION   : Displays a toast notification for user feedback.
    function showToast(message, type) {
        const toastColors = {
            success: "bg-success",
            danger: "bg-danger",
            warning: "bg-warning",
            info: "bg-info"
        };

        const toastElement = $("#toastNotification");
        const toastBody = $("#toastMessage");

        toastBody.text(message);
        toastElement.removeClass("bg-primary bg-success bg-danger bg-warning bg-info")
            .addClass(toastColors[type] || "bg-primary");

        const toast = new bootstrap.Toast(toastElement[0]);
        toast.show();
    }

    // Attach events
    $("#toppings-form input").change(calculateTotal);
    $("#submit-order").click(() => {
        const selectedToppings = [];
        $("#toppings-form input:checked").each(function () {
            selectedToppings.push($(this).val());
        });

        $.post(`PizzaOrder.aspx?action=saveOrder&filename=${encodeURIComponent(selectedToppings.join(","))}`, function (response) {
            if (response.error) {
                showToast(response.error, "danger");
            } else {
                showToast("Order submitted successfully!", "success");
                setTimeout(() => {
                    window.location.href = "OrderConfirmation.aspx";
                }, 2000);
            }
        }).fail(() => showToast("Error getting total.", "danger"));

    }
    );
});
