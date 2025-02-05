<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderHistory.aspx.cs" Inherits="VirtualAdventurePark.OrderHistory" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>Order History</title>
    <link rel="stylesheet" type="text/css" href="Content/Site.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Order History</h1>
            <asp:GridView ID="gvOrderHistory" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="OrderDate" HeaderText="Order Date" DataFormatString="{0:yyyy-MM-dd HH:mm}" />
                    <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" DataFormatString="{0:C}" />
                    <asp:TemplateField HeaderText="Items">
                        <ItemTemplate>
                            <ul>
                                <%# string.Join("", ((IEnumerable<VirtualAdventurePark.Models.OrderItem>)Eval("OrderItems")).Select(oi => $"<li>{oi.Ticket.Name} x {oi.Quantity}</li>")) %>
                            </ul>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>