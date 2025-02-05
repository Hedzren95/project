using System;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using VirtualAdventurePark.Models;

namespace VirtualAdventurePark
{
    public partial class Login : System.Web.UI.Page
    {
        private VirtualAdventureParkContext db = new VirtualAdventureParkContext();

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;
            string passwordHash = ComputeSha256Hash(password);

            var user = db.Users.FirstOrDefault(u => u.Username == username && u.PasswordHash == passwordHash);

            if (user != null)
            {
                Session["UserID"] = user.UserID;
                Session["Username"] = user.Username;
                Session["Role"] = user.Role;
                Response.Redirect("Default.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid username or password.";
            }
        }

        private string ComputeSha256Hash(string rawData)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }
    }
}