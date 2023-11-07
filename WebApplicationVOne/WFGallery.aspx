<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WFGallery.aspx.cs" Inherits="WebApplicationVOne.WFGallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<asp:HiddenField ID="hiddenFieldProductID" runat="server" />
    <div class="container-fluid">

        <div class="row row-eq-height">

            <div class="col-md-3">
                ABC
                <asp:TextBox ID="txtComment" runat="server"></asp:TextBox>
            </div>

            <div class="col-md-3">
                DEF
            </div>

            <div class="col-md-3">
                GHI
            </div>

            <div class="col-md-3">
                JKL
            </div>

        </div>

        <div class="row row-eq-height">

            <div class="col-md-3">
                ABC
            </div>

            <div class="col-md-3">
                DEF
            </div>

            <div class="col-md-3">
                GHI
            </div>

            <div class="col-md-3">
                JKL
            </div>

        </div>

        <div class="row row-eq-height">

            <div class="col-md-3">
                ABC
            </div>

            <div class="col-md-3">
                DEF
            </div>

            <div class="col-md-3">
                GHI
            </div>

            <div class="col-md-3">
                JKL
            </div>

        </div>

    </div>

    <div class="row row-eq-height">
        <div id="cd1" class="card-deck">
            <div class="card bg-primary">
                <div class="card-body text-center">
                    <p class="card-text">Some text inside the first card</p>
                </div>
            </div>
            <div class="card bg-warning">
                <div class="card-body text-center">
                    <p class="card-text">Some text inside the second card</p>
                </div>
            </div>
            <div class="card bg-success">
                <div class="card-body text-center">
                    <p class="card-text">Some text inside the third card</p>
                </div>
            </div>
            <div class="card bg-danger">
                <div class="card-body text-center">
                    <p class="card-text">Some text inside the fourth card</p>
                </div>
            </div>
        </div>
    </div>

    <asp:Button ID="Buttonx" runat="server" Text="ButtonX" OnClientClick="return func1();" />

    <script type="text/javascript">

        function func1() {

            $(document).ready(function () {

                alert("Hello world x");
                $("p").hide();

            });

        }
    </script>

    <h2 style="color: green;"></h2>
    <button>Click here..</button>
    <script>
        $(document).ready(function () {

            $("button").click(function () {
                $("h2").html("Hello... <b>Welcome to EDUCBA...!</b>");
            });
        });
    </script>

</asp:Content>
