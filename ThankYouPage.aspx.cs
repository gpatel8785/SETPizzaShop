// FILE          : ThankYouPage.aspx.cs
// PROJECT       : SETPizzaShop
// PROGRAMMER    : Gaurav Patel
// FIRST VERSION : 12-12-2024
// DESCRIPTION   : Finally, if user entered ‘Confirm,’ it will display a message of thanks and if the user entered ‘Cancel,’ it will display a message of thanks.

using System;

namespace SETPizzaShop
{
    public partial class ThankYouPage : System.Web.UI.Page
    {
        // FUNCTION      : Page_Load
        // DESCRIPTION   : Building a thank you message according to the action taken by the users.
        // PARAMETERS    : 
        //   sender (object) : Source of the event.
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // It takes the last action of the user form the query string
                string action = Request.QueryString["action"];
                string userName = Session["UserName"]?.ToString() ?? "Customer";

                if (string.IsNullOrWhiteSpace(action))
                {
                    Response.Redirect("LandingPage.aspx");
                }

                // Store the thank you message to be shown
                Session["ThankYouMessage"] = action == "confirm"
                    ? $"Thank you, {userName}, for your order! Your pizza is almost ready soon it will be on your table waiting for you."
                    : $"Sorry to see you go, {userName}. Your order has been canceled.";
            }
        }
    }
}
