using System;

namespace VirtualAdventurePark
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Clear the session
            Session.Clear();
            // Redirect to the login page
            Response.Redirect("Login.aspx");
        }
    }
}