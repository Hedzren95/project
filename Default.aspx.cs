using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using VirtualAdventurePark.Models;

namespace VirtualAdventurePark
{
    public partial class Default : System.Web.UI.Page
    {
        private VirtualAdventureParkContext db = new VirtualAdventureParkContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCategories();
                BindTickets();
                BindCart();
            }
        }

        private void BindCategories()
        {
            var categories = db.Tickets.Select(t => t.Category).Distinct().ToList();
            categories.Insert(0, "All");
            ddlCategory.DataSource = categories;
            ddlCategory.DataBind();
        }

        private void BindTickets(string category = "All")
        {
            var tickets = category == "All" ? db.Tickets.ToList() : db.Tickets.Where(t => t.Category == category).ToList();
            gvTickets.DataSource = tickets;
            gvTickets.DataBind();
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindTickets(ddlCategory.SelectedValue);
        }

        protected void gvTickets_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                int ticketID = (int)gvTickets.DataKeys[index].Value;
                var ticket = db.Tickets.Find(ticketID);
                List<CartItem> cart = Session["Cart"] as List<CartItem> ?? new List<CartItem>();
                var cartItem = cart.FirstOrDefault(c => c.Ticket.TicketID == ticketID);
                if (cartItem != null)
                {
                    cartItem.Quantity++;
                }
                else
                {
                    cart.Add(new CartItem { Ticket = ticket, Quantity = 1 });
                }
                Session["Cart"] = cart;
                BindCart();
            }
        }

        private void BindCart()
        {
            List<CartItem> cart = Session["Cart"] as List<CartItem> ?? new List<CartItem>();
            gvCart.DataSource = cart.Select(c => new
            {
                c.Ticket.Name,
                c.Ticket.Description,
                c.Ticket.Price,
                c.Ticket.Category,
                c.Quantity
            }).ToList();
            gvCart.DataBind();
        }

        protected void gvCart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            List<CartItem> cart = Session["Cart"] as List<CartItem> ?? new List<CartItem>();
            int index = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "UpdateQuantity")
            {
                GridViewRow row = gvCart.Rows[index];
                TextBox txtQuantity = (TextBox)row.FindControl("txtQuantity");
                int quantity = int.Parse(txtQuantity.Text);
                cart[index].Quantity = quantity;
            }
            else if (e.CommandName == "RemoveItem")
            {
                cart.RemoveAt(index);
            }

            Session["Cart"] = cart;
            BindCart();
        }

        protected void btnConfirmOrder_Click(object sender, EventArgs e)
        {
            List<CartItem> cart = Session["Cart"] as List<CartItem> ?? new List<CartItem>();
            if (cart.Count > 0)
            {
                var order = new Order
                {
                    OrderDate = DateTime.Now,
                    TotalPrice = cart.Sum(c => c.Ticket.Price * c.Quantity),
                    OrderItems = cart.Select(c => new OrderItem
                    {
                        TicketID = c.Ticket.TicketID,
                        Quantity = c.Quantity
                    }).ToList()
                };

                db.Orders.Add(order);
                db.SaveChanges();

                Session["Cart"] = new List<CartItem>(); // Clear the cart
                BindCart();

                var orderSummary = $"Number of tickets: {cart.Sum(c => c.Quantity)}<br/>Total Price: ${cart.Sum(c => c.Ticket.Price * c.Quantity)}";
                lblOrderSummary.Text = orderSummary;
                lblSuccessMessage.Text = "Order confirmed successfully!";
            }
        }
    }

    public class CartItem
    {
        public Ticket Ticket { get; set; }
        public int Quantity { get; set; }
    }
}
