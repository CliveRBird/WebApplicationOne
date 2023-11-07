<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplicationVOne._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>ASP.NET</h1>
        <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a>
        </p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Book your flight</h2>
            <p>
                Book your flight here, and add your comments.
            </p>
            <p>
                <a class="btn btn-default" href="WebFormAirports.aspx">Web Form Airports &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Create a Microsoft Word Document</h2>
            <p>
                Create a MS word document with Latin text.
            </p>
            <p>
                <asp:Button ID="btnCreateWordDoc" CssClass="btn btn-default" runat="server" Text="Create Word Doc" OnClick="btnCreateWordDoc_Click" />
            </p>
        </div>
        <div class="col-md-4">
            <h2>Bootstrap Gallery</h2>
            <p>
                Show Bootstrap Gallery Items.
            </p>
            <p>
                <a class="btn btn-default" href="WFGallery.aspx">Learn more &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
