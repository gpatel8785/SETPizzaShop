// FILE          : OrderConfirmation.aspx.cs
// PROJECT       : SETPizzaShop
// PROGRAMMER    : Gaurav Patel
// FIRST VERSION : 12-12-2024
// DESCRIPTION   : Shows the summary of the order and offers an option to confirm the order or not.

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SETPizzaShop
{
    public partial class OrderConfirmation : System.Web.UI.Page
    {
        // FUNCTION      : Page_Load
        // DESCRIPTION   :  Shows the order summary on the basis of session data..
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve session data
                string fullName = Session["UserName"]?.ToString();
                string toppings = Session["SelectedToppings"]?.ToString();
                string totalPrice = Session["TotalPrice"]?.ToString();

                if (string.IsNullOrWhiteSpace(toppings))
                {
                    toppings = "The pizza (no toppings)"; 
                }
                if (string.IsNullOrWhiteSpace(totalPrice))
                {
                    totalPrice = "10.00";
                }
                //If the data stored in the session layer is unavailable, then one is taken to the order page
                if (string.IsNullOrWhiteSpace(fullName) || string.IsNullOrWhiteSpace(toppings) || string.IsNullOrWhiteSpace(totalPrice))
                {
                    Response.Redirect("PizzaOrder.aspx");
                }

                // Storing data to controls for showing
                Session["FirstName"] = fullName.Split(' ')[0];
            }
        }
    }
}