using System.ComponentModel.DataAnnotations;

namespace VirtualAdventurePark.Models
{
    public class Ticket
    {
        [Key]
        public int TicketID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public string Category { get; set; }
    }
}