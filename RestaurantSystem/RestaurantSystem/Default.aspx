<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RestaurantSystem._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">



    <h1 style="color:white; text-align:center;">
        <br />
        Welcome to the Restaurant System.
    </h1>
    <p>
        &nbsp;</p>
    <p style="text-align:center; font-size: 20px;">
        <asp:Button ID="Button1" runat="server" Height="250px" Text="Restaurant Staff" Width="250px" OnClick="Button1_Click" />
&nbsp;
        <asp:Button ID="Button2" runat="server" Height="250px" Text="Supplier" Width="250px" OnClick="Button2_Click" />
    </p>



</asp:Content>
