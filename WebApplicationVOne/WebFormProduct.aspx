<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebFormProduct.aspx.cs" Inherits="WebApplicationVOne.WebFormProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <p></p>
    <asp:GridView ID="grid1" runat="server" AutoGenerateColumns="false"
        DataKeyNames="ProductId,Category"
        OnRowDataBound="grid1_OnRowDataBound"
        OnRowEditing="grid1_OnRowEditing"
        OnRowUpdating="grid1_OnRowUpdating"
        OnRowDeleting="grid1_OnRowDeleting"
        OnRowCommand="grid1_OnRowCommand"
        ShowFooter="true"
        OnRowCancelingEdit="grid1_OnRowCancelingEdit"
        AllowSorting="true"
        OnSorting="grid1_OnSorting"
        AllowPaging="true"
        PageSize="8"
        OnPageIndexChanging="grid1_OnPageIndexChanging"
        EmptyDataText="No records Selected." >
        <Columns>
            <asp:TemplateField HeaderText="Product Name" SortExpression="name">
                <ItemTemplate>
                    <asp:Label ID="label1" runat="server" Text='<%#Bind("name") %>'>
                    </asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtName" runat="server" Text='<%#Eval("name") %>'>
                    </asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtNameInput" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Product No">
                <ItemTemplate>
                    <asp:Label ID="label2" runat="server"
                        Text='<%#Bind("ProductNumber") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtProductNo" runat="server"
                        Text='<%# Bind("ProductNumber") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtProductNumberInput" runat="server">
                    </asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Color" SortExpression="Color">
                <ItemTemplate>
                    <asp:Label ID="label3" runat="server" Text='<%#Eval("Color") %>'>
                    </asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtColor" runat="server"
                        Text='<%#Bind("Color") %>'>'</asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtColorInput" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Category" SortExpression="Category">
                <ItemTemplate>
                    <asp:Label ID="label4" runat="server"
                        Text='<%#Eval("Category") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlCategory" runat="server"
                        DataTextField="cat_desc" DataValueField="cat_desc">
                    </asp:DropDownList>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList ID="ddlCategoryInput" runat="server"
                        DataTextField="cat_desc" DataValueField="cat_desc">
                    </asp:DropDownList>

                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Cost" SortExpression="Cost">
                <ItemTemplate>
                    <asp:Label ID="label7" runat="server" Text='<%#Eval("Cost") %>'>
                    </asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtCost" runat="server"
                        Text='<%#Bind("Cost") %>'>'</asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtCostInput" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>


            <asp:TemplateField HeaderText="Edit" ShowHeader="false">
                <EditItemTemplate>
                    <asp:LinkButton ID="linkButton1" runat="server"
                        CausesValidation="true"
                        Text="Update" CommandName="update"></asp:LinkButton>
                    <asp:LinkButton ID="linkButton2" runat="server"
                        CausesValidation="false"
                        Text="Cancel" CommandName="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:LinkButton ID="linkButton2" runat="server"
                        CausesValidation="false"
                        Text="Add Record" CommandName="Add_Rec"></asp:LinkButton>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="linkButton1" runat="server"
                        CausesValidation="false"
                        Text="Edit" CommandName="Edit"></asp:LinkButton>
                </ItemTemplate>

            </asp:TemplateField>

            <asp:CommandField HeaderText="Delete" ShowDeleteButton="true"
                ShowHeader="true" />

            <asp:CommandField HeaderText="Select" ShowSelectButton="true"
                ShowHeader="true" />
        </Columns>



    </asp:GridView>
    <br />
    <br />
    <asp:Label ID="result" runat="server" ForeColor="Blue"></asp:Label>

    <br />
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

</asp:Content>
