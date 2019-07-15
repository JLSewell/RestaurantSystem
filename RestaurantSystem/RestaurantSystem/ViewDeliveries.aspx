<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewDeliveries.aspx.cs" Inherits="RestaurantSystem.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1 style="color:white; text-align:center">
    View Deliveries</h1>
<p>
    &nbsp;</p>
<p style="display:block; text-align:center">
&nbsp;<asp:Label ID="Label1" runat="server" Text="Choose your Restaurant: " ForeColor="White"></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="name" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT CAST(restaurant.restaurant_Id AS varchar(50)) + ' ' + restaurant.restaurant_Name AS name FROM restaurant"></asp:SqlDataSource>
</p>
<p style="display:block; text-align:center">
    &nbsp;
    <asp:Label ID="Label2" runat="server" Text="Search by delivery date: " ForeColor="White"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
    </p>
    <p style="display:block; text-align:center">
        &nbsp;</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BorderColor="White" BorderStyle="Double" ForeColor="White" GridLines="Vertical" HorizontalAlign="Center">
            <Columns>
                <asp:BoundField DataField="restaurant_Name" HeaderText="restaurant_Name" SortExpression="restaurant_Name" />
                <asp:BoundField DataField="delivery_Id" HeaderText="delivery_Id" SortExpression="delivery_Id" />
                <asp:BoundField DataField="ingredient_Id" HeaderText="ingredient_Id" InsertVisible="False" ReadOnly="True" SortExpression="ingredient_Id" />
                <asp:BoundField DataField="ingredient_Name" HeaderText="ingredient_Name" SortExpression="ingredient_Name" />
                <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                <asp:BoundField DataField="delivery_Date" HeaderText="delivery_Date" SortExpression="delivery_Date" />
            </Columns>
        </asp:GridView>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT restaurant.restaurant_Name, delivery.delivery_Id, ingredients.ingredient_Id, ingredients.ingredient_Name, delivery.quantity, delivery.delivery_Date FROM delivery INNER JOIN restaurant ON delivery.restaurant_Id = restaurant.restaurant_Id INNER JOIN ingredients ON delivery.ingredient_Id = ingredients.ingredient_Id WHERE (restaurant.restaurant_Id = 1)"></asp:SqlDataSource>
    </p>
    <p>
        <asp:Label ID="Label3" runat="server" ForeColor="#CC0000"></asp:Label>
    </p>
    <p>
        &nbsp;</p>
</asp:Content>
