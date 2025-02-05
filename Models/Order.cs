using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace VirtualAdventurePark.Models
{
    public class Order
    {
        [Key]
        public int OrderID { get; set; }
        public DateTime OrderDate { get; set; }
        public decimal TotalPrice { get; set; }
        public virtual ICollection<OrderItem> OrderItems { get; set; }
    }

    public class OrderItem
    {
        [Key]
        public int OrderItemID { get; set; }
        public int OrderID { get; set; }
        public int TicketID { get; set; }
        public int Quantity { get; set; }
        public virtual Ticket Ticket { get; set; }
    }
}