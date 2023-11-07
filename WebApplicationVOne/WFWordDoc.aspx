<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WFWordDoc.aspx.cs" Inherits="WebApplicationVOne.WFWordDoc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    Write your name: <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />

</asp:Content>
