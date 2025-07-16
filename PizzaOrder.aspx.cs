// FILE          : PizzaOrder.aspx.cs
// PROJECT       : SETPizzaShop
// PROGRAMMER    : Gaurav Patel
// FIRST VERSION : 12-12-2024
// DESCRIPTION   : Ventures in assigning the right toppings and the mechanism for updating prices for toppings.

using System;
using System.Security.Cryptography;
using System.Web;
using System.Web.Script.Serialization;
using WebGrease.Css.Ast.Animation;

namespace SETPizzaShop
{
    public partial class PizzaOrder : System.Web.UI.Page
    {
        // FUNCTION      : Page_Load
        // DESCRIPTION   : This script is used to initiate the page and responding to AJAX requests.
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Start the conversation by addressing the user by his/her first name
                string fullName = Session["UserName"]?.ToString();
                if (string.IsNullOrWhiteSpace(fullName))
                {
                    Response.Redirect("LandingPage.aspx");
                }
                string firstName = fullName.Split(' ')[0];
                Session["FirstName"] = firstName;
                //Response.Write($"<script>$('#userName').text('{firstName}');</script>");
            }
            string action = Request.QueryString["action"];

            if (action == "calculateTotal")
            {
                CalculateTotal(Request.QueryString["filename"]);
            }
            else if (action == "")
            {
                SaveOrder(Request.QueryString["filename"]);
            }
        }

        // FUNCTION      : CalculateTotal
        // DESCRIPTION   : In charge of receiving and treating AJAX requests to determine the price according to the toppings.
        protected void CalculateTotal(string filename)
        {
            try
            {
                string toppings = filename;
                double totalPrice = 10.00; // Base price

                // Compute price by chosen toppings
                if (!string.IsNullOrWhiteSpace(toppings))
                {
                    var toppingList = toppings.Split(',');
                    foreach (var topping in toppingList)
                    {
                        if (topping.Trim() == "Mushrooms" || topping.Trim() == "Green Olives" || topping.Trim() == "Green Peppers")
                            totalPrice += 1.00;
                        else if (topping.Trim() == "Pepperoni")
                        {
                            totalPrice += 1.50;
                        }
                        else if (topping.Trim() == "Double Cheese")
                            totalPrice += 2.25;
                    }
                }

                Session["SelectedToppings"] = toppings;
                Session["TotalPrice"] = totalPrice.ToString("0.00");
                // Return the calculated price
                var response = new { Total = totalPrice.ToString("0.00") };
                SendJsonResponse(response);
            }
            catch (Exception ex)
            {
                SendJsonResponse(new { error = $"Error calculating total: {ex.Message}" });
            }
        }

        // FUNCTION      : SaveOrder
        // DESCRIPTION   : Stores the selected toppings into a session and the total price using Ajax technology.
        // PARAMETERS    : None
        // RETURNS       : void
        private void SaveOrder(string toppings)
        {
            try
            {
                double totalPrice = 10.00; // Base price

                if (!string.IsNullOrEmpty(toppings))
                {
                    var toppingList = toppings.Split(',');
                    foreach (var topping in toppingList)
                    {
                        if (topping.Trim() == "Mushrooms" || topping.Trim() == "Green Olives" || topping.Trim() == "Green Peppers")
                            totalPrice += 1.00;
                        else if (topping.Trim() == "Pepperoni")
                        {
                            totalPrice += 1.50;
                        }
                        else if (topping.Trim() == "Double Cheese")
                            totalPrice += 2.25;
                    }
                }

                Session["SelectedToppings"] = toppings;
                Session["TotalPrice"] = totalPrice.ToString("0.00");

                SendJsonResponse(new { success = true });
            }
            catch (Exception ex)
            {
                SendJsonResponse(new { error = $"Error saving order: {ex.Message}" });
            }
        }

        // FUNCTION      : SendJsonResponse
        // DESCRIPTION   : Sends a JSON response back to the client.
        //   data (object) : Data to send as JSON.
        private void SendJsonResponse(object data)
        {
            try
            {
                var serializer = new JavaScriptSerializer();
                string jsonResponse = serializer.Serialize(data);

                Response.Clear();
                Response.ContentType = "application/json";
                Response.Write(jsonResponse);
                Response.Flush();
            }
            catch (Exception ex)
            {
                // Log or handle any unexpected errors
                Response.Clear();
                Response.ContentType = "application/json";
                Response.Write($"{{\"error\":\"An error occurred: {ex.Message}\"}}");
            }
            finally
            {
                Response.Close(); // Graceful completion
            }
        }

        // FUNCTION      : SubmitOrder
        // DESCRIPTION   : Storing the selected toppings and total price into the session and moving to OrderConfirmation.aspx page.
        protected void SubmitOrder(object sender, EventArgs e)
        {
            string[] selectedToppings = Request.Form["toppings"]?.Split(',');
            double totalPrice = 10.00; // Base price

            if (selectedToppings != null)
            {
                foreach (var topping in selectedToppings)
                {
                    if (topping.Trim() == "Mushrooms" || topping.Trim() == "Green Olives" || topping.Trim() == "Green Peppers")
                        totalPrice += 1.00;
                    else if (topping.Trim() == "Pepperoni")
                    {
                        totalPrice += 1.50;
                    }
                    else if (topping.Trim() == "Double Cheese")
                        totalPrice += 2.25;
                }
            }

            // Store order details in session
            Session["SelectedToppings"] = string.Join(", ", selectedToppings ?? Array.Empty<string>());
            Session["TotalPrice"] = totalPrice.ToString("0.00");

            // Redirect to OrderConfirmation.aspx
            Response.Redirect("OrderConfirmation.aspx");
        }
    }
}
