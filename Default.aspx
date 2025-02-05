<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="VirtualAdventurePark.Default" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>Virtual Adventure Park</title>
    <link rel="stylesheet" type="text/css" href="Content/Site.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <header>
                <h1>Virtual Adventure Park</h1>
                <nav>
    <ul class="nav-menu">
        <li><a href="Default.aspx">Home</a></li>
        <li><a href="AddRide.aspx">Add New Ride</a></li>
        <li><a href="OrderHistory.aspx">Order History</a></li>
        
    </ul>
</nav>
            </header>
       <section class="hero">
    <div class="hero-content">
        <h1>Welcome to Virtual Adventure Park</h1>
        <p>Experience the thrill of our amazing rides!</p>
        <a href="#tickets" class="btn btn-primary">Explore Rides</a>
    </div>
</section>

<section class="filter-section">
    <label for="ddlCategory">Filter by Category:</label>
    <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
    </asp:DropDownList>
</section>

<section class="tickets-section" id="tickets">
    <asp:GridView ID="gvTickets" runat="server" AutoGenerateColumns="False" DataKeyNames="TicketID" OnRowCommand="gvTickets_RowCommand">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Ride Name" />
            <asp:BoundField DataField="Description" HeaderText="Description" />
            <asp:BoundField DataField="Price" HeaderText="Price" />
            <asp:BoundField DataField="Category" HeaderText="Category" />
            <asp:ButtonField Text="Add to Cart" CommandName="AddToCart" />
        </Columns>
    </asp:GridView>
</section>
            <section class="cart-section">
                <h2>Cart</h2>
                <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False" OnRowCommand="gvCart_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Ride Name" />
                        <asp:BoundField DataField="Description" HeaderText="Description" />
                        <asp:BoundField DataField="Price" HeaderText="Price" />
                        <asp:BoundField DataField="Category" HeaderText="Category" />
                        <asp:TemplateField HeaderText="Quantity">
                            <ItemTemplate>
                                <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Eval("Quantity") %>' Width="50px" />
                                <asp:Button ID="btnUpdate" runat="server" CommandName="UpdateQuantity" CommandArgument='<%# Container.DataItemIndex %>' Text="Update" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:Button ID="btnRemove" runat="server" CommandName="RemoveItem" CommandArgument='<%# Container.DataItemIndex %>' Text="Remove" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:Button ID="btnConfirmOrder" runat="server" Text="Confirm Order" OnClick="btnConfirmOrder_Click" CssClass="btn btn-primary" />
                <asp:Label ID="lblOrderSummary" runat="server" Text="" CssClass="order-summary" />
                <asp:Label ID="lblSuccessMessage" runat="server" Text="" CssClass="success-message" />
            </section>

        </div>
    </form>
    
</body>
</html>
