﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WFWordDoc2.aspx.cs" Inherits="WebApplicationVOne.WFWordDoc2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            Write your name: <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
