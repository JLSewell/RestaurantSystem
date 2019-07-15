<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewDishesSold.aspx.cs" Inherits="RestaurantSystem.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <h1 style="color:white; text-align:center">
        View Number of Dishes Ordered</h1>
    <p>
        &nbsp;</p>
    <p style="display:block; text-align:center">
        <asp:Label ID="Label2" runat="server" Text="View Dish: " ForeColor="White"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="name">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT CAST(dishes.dish_Id AS varchar(50)) + ' ' + dishes.dish_Name AS name FROM dishes"></asp:SqlDataSource>
    </p>
    <p style="display:block; text-align:center">
        <asp:Label ID="Label3" runat="server" Text="Sold between: " ForeColor="White"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;<asp:Label ID="Label4" runat="server" Text="and " ForeColor="White"></asp:Label>
&nbsp;<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    &nbsp;<asp:Label ID="Label5" runat="server" ForeColor="White" Text="(DD/MMM/YYYY)"></asp:Label>
    </p>
    <p style="display:block; text-align:center">
        &nbsp;</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BorderColor="White" BorderStyle="Double" ForeColor="White" GridLines="Vertical" HorizontalAlign="Center">
            <Columns>
                <asp:BoundField DataField="restaurant_Name" HeaderText="restaurant_Name" SortExpression="restaurant_Name" />
                <asp:BoundField DataField="dish_Name" HeaderText="dish_Name" SortExpression="dish_Name" />
                <asp:BoundField DataField="Total_Sold" HeaderText="Total_Sold" ReadOnly="True" SortExpression="Total_Sold" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT restaurant.restaurant_Name, dishes.dish_Name, SUM(order_dishes.quantity) AS Total_Sold FROM customer_order INNER JOIN order_dishes ON customer_order.order_Id = order_dishes.order_Id INNER JOIN restaurant ON customer_order.restaurant_Id = restaurant.restaurant_Id INNER JOIN dishes ON order_dishes.dish_Id = dishes.dish_Id GROUP BY dishes.dish_Name, restaurant.restaurant_Name"></asp:SqlDataSource>
    </p>
    <p style="display:block; text-align:center">
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" />
    </p>
    <p style="display:block; text-align:center">
        <asp:Label ID="Label6" runat="server" ForeColor="#CC0000"></asp:Label>
    </p>


</asp:Content>
