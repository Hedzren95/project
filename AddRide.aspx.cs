using System;
using VirtualAdventurePark.Models;

namespace VirtualAdventurePark
{
    public partial class AddRide : System.Web.UI.Page
    {
        private VirtualAdventureParkContext db = new VirtualAdventureParkContext();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnAddRide_Click(object sender, EventArgs e)
        {
            var ride = new Ticket
            {
                Name = txtName.Text,
                Description = txtDescription.Text,
                Price = decimal.Parse(txtPrice.Text),
                Category = ddlCategory.SelectedValue
            };

            db.Tickets.Add(ride);
            db.SaveChanges();

            Response.Redirect("Default.aspx");
        }
    }
}