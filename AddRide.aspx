<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddRide.aspx.cs" Inherits="VirtualAdventurePark.AddRide" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>Add New Ride</title>
    <link rel="stylesheet" type="text/css" href="Content/Site.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Add New Ride</h1>
            <div class="form-group">
                <label for="txtName">Ride Name:</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="txtDescription">Description:</label>
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
            </div>
            <div class="form-group">
                <label for="txtPrice">Price:</label>
                <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="ddlCategory">Category:</label>
                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control">
                    <asp:ListItem Value="Family Rides">Family Rides</asp:ListItem>
                    <asp:ListItem Value="Kiddie Rides">Kiddie Rides</asp:ListItem>
                    <asp:ListItem Value="Adults-Only Rides">Adults-Only Rides</asp:ListItem>
                    <asp:ListItem Value="Promotions">Promotions</asp:ListItem>
                </asp:DropDownList>
            </div>
            <asp:Button ID="btnAddRide" runat="server" Text="Add Ride" OnClick="btnAddRide_Click" CssClass="btn btn-primary" />
        </div>
    </form>
</body>
</html>