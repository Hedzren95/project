<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="AdventureParkSystem.cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False">
    <Columns>
        <asp:BoundField DataField="RideName" HeaderText="Ride Name" />
        <asp:BoundField DataField="Description" HeaderText="Description" />
        <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" />
        <asp:BoundField DataField="AgeGroup" HeaderText="Age Group" />
    </Columns>
</asp:GridView>
        </div>
    </form>
</body>
</html>
