<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="VirtualAdventurePark.Default" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>Virtual Adventure Park</title>
    <link rel="stylesheet" type="text/css" href="Content/Site.css" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }
        .card {
            margin: 10px;
            width: 18rem;
        }
    </style>
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
                <div class="card-container">
                    <asp:Repeater ID="rptTickets" runat="server">
                        <ItemTemplate>
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title"><%# Eval("Name") %></h5>
                                    <p class="card-text"><%# Eval("Description") %></p>
                                    <p class="card-text"><strong>Price:</strong> <%# Eval("Price", "{0:C}") %></p>
                                    <p class="card-text"><strong>Category:</strong> <%# Eval("Category") %></p>
                                    <asp:Button ID="btnAddToCart" runat="server" CssClass="btn btn-primary" Text="Add to Cart" CommandArgument='<%# Eval("TicketID") %>' OnClick="AddToCart_Click" />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
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
