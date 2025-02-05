using System;
using System.Linq;
using VirtualAdventurePark.Models; // Add this directive

namespace VirtualAdventurePark
{
    public partial class OrderHistory : System.Web.UI.Page
    {
        private VirtualAdventureParkContext db = new VirtualAdventureParkContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindOrderHistory();
            }
        }

        private void BindOrderHistory()
        {
            var orders = db.Orders.Include("OrderItems.Ticket").ToList();
            gvOrderHistory.DataSource = orders.Select(o => new
            {
                o.OrderDate,
                o.TotalPrice,
                OrderItems = o.OrderItems
            }).ToList();
            gvOrderHistory.DataBind();
        }
    }
}