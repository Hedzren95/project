using System;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using VirtualAdventurePark.Models;

namespace VirtualAdventurePark
{
    public partial class Register : System.Web.UI.Page
    {
        private VirtualAdventureParkContext db = new VirtualAdventureParkContext();

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;
            string email = txtEmail.Text;

            if (db.Users.Any(u => u.Username == username))
            {
                lblMessage.Text = "Username already exists.";
                return;
            }

            string passwordHash = ComputeSha256Hash(password);

            User user = new User
            {
                Username = username,
                PasswordHash = passwordHash,
                Email = email,
                Role = "User"
            };

            db.Users.Add(user);
            db.SaveChanges();

            lblMessage.Text = "Registration successful!";
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