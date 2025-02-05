using System.Data.Entity;

namespace VirtualAdventurePark.Models
{
    public class VirtualAdventureParkContext : DbContext
    {
        public VirtualAdventureParkContext() : base("name=VirtualAdventureParkDB")
        {
        }

        public DbSet<Ticket> Tickets { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<OrderItem> OrderItems { get; set; }
        public DbSet<User> Users { get; set; }
    }
}