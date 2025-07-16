// FILE          : LandingPage.aspx.cs
// PROJECT       : SETPizzaShop
// PROGRAMMER    : Gaurav Patel
// FIRST VERSION : 12-12-2024
// DESCRIPTION   : Handles the LandingPage functionality, including gathering user name input and validation.

using System;
using System.Web.UI.WebControls;

namespace SETPizzaShop
{
    public partial class LandingPage : System.Web.UI.Page
    {
        // FUNCTION      : Page_Load
        // DESCRIPTION   : Initializes the page.
        // PARAMETERS    : 
        //   sender (object) : Source of the event.
        //   e (EventArgs)   : Event data.
        // RETURNS       : void
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // FUNCTION      : btnSubmit_Click
        // DESCRIPTION   : Validates the name input, separates first and last name, and saves it to the session.
        // PARAMETERS    : 
        //   sender (object) : Source of the event.
        //   e (EventArgs)   : Event data.
        // RETURNS       : void
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string fullName = txtName.Text.Trim();

                if (string.IsNullOrWhiteSpace(fullName))
                {
                    ShowToast("Name cannot be empty. Please enter your full name.", "danger");
                    return;
                }

                // Split and validate first and last name
                string[] nameParts = fullName.Split(' ');
                if (nameParts.Length != 2 || string.IsNullOrWhiteSpace(nameParts[0]) || string.IsNullOrWhiteSpace(nameParts[1]))
                {
                    ShowToast("Invalid name format. Please enter both first and last name.", "danger");
                    return;
                }

                // Save to session
                Session["FirstName"] = nameParts[0].Trim();
                Session["LastName"] = nameParts[1].Trim();
                Session["UserName"] = fullName;

                ShowToast("Name saved successfully. Redirecting to order page...", "success");
                Response.Redirect("PizzaOrder.aspx");
            }
            catch (Exception ex)
            {
                ShowToast($"An error occurred: {ex.Message}", "danger");
            }
        }

        // FUNCTION      : cvNameFormat_ServerValidate
        // DESCRIPTION   : Validates the name format to ensure it has one space and only alphabetic characters.
        // PARAMETERS    : 
        //   source (object)  : Source of the validation event.
        //   args (ServerValidateEventArgs) : Validation event arguments.
        // RETURNS       : void
        protected void cvNameFormat_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string fullName = args.Value.Trim();
            string[] nameParts = fullName.Split(' ');

            // Validate name has exactly two parts and both are alphabetic
            args.IsValid = nameParts.Length == 2 &&
                           IsAlphabetic(nameParts[0]) &&
                           IsAlphabetic(nameParts[1]);
        }

        // FUNCTION      : IsAlphabetic
        // DESCRIPTION   : Checks if a string contains only alphabetic characters.
        // PARAMETERS    : 
        //   input (string) : The string to validate.
        // RETURNS       : bool : True if alphabetic, false otherwise.
        private bool IsAlphabetic(string input)
        {
            foreach (char c in input)
            {
                if (!char.IsLetter(c))
                {
                    return false;
                }
            }
            return true;
        }

        // FUNCTION      : ShowToast
        // DESCRIPTION   : Displays a toast notification to the user.
        // PARAMETERS    : 
        //   message (string) : The message to display.
        //   type (string)    : The type of the notification (success, danger, warning).
        // RETURNS       : void
        private void ShowToast(string message, string type)
        {
            string script = $@"
                <script>
                    const toastMessage = document.getElementById('toastMessage');
                    const toastNotification = document.getElementById('toastNotification');
                    toastMessage.innerText = '{message}';
                    toastNotification.classList.remove('bg-primary', 'bg-danger', 'bg-success');
                    toastNotification.classList.add('bg-{type}');
                    new bootstrap.Toast(toastNotification).show();
                </script>";
            ClientScript.RegisterStartupScript(this.GetType(), "Toast", script, false);
        }
    }
}
