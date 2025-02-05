namespace AdventureParkSystem.Migrations
{
    using System;
    using System.Data.Entity.Migrations;

    public partial class AddOrdersAndOrderItems : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Orders",
                c => new
                {
                    OrderID = c.Int(nullable: false, identity: true),
                    OrderDate = c.DateTime(nullable: false),
                    TotalPrice = c.Decimal(nullable: false, precision: 18, scale: 2),
                })
                .PrimaryKey(t => t.OrderID);

            CreateTable(
                "dbo.OrderItems",
                c => new
                {
                    OrderItemID = c.Int(nullable: false, identity: true),
                    OrderID = c.Int(nullable: false),
                    TicketID = c.Int(nullable: false),
                    Quantity = c.Int(nullable: false),
                })
                .PrimaryKey(t => t.OrderItemID)
                .ForeignKey("dbo.Orders", t => t.OrderID, cascadeDelete: true)
                .ForeignKey("dbo.Tickets", t => t.TicketID, cascadeDelete: true)
                .Index(t => t.OrderID)
                .Index(t => t.TicketID);
        }

        public override void Down()
        {
            DropForeignKey("dbo.OrderItems", "TicketID", "dbo.Tickets");
            DropForeignKey("dbo.OrderItems", "OrderID", "dbo.Orders");
            DropIndex("dbo.OrderItems", new[] { "TicketID" });
            DropIndex("dbo.OrderItems", new[] { "OrderID" });
            DropTable("dbo.OrderItems");
            DropTable("dbo.Orders");
        }
    }
}
