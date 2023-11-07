<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebFormAirports.aspx.cs" Inherits="WebApplicationVOne.WebFormAirports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row row-eq-height">
            <div class="col-md-6">
                <div class="customDiv">
                    <br />


                    <div>
                        <table cellspacing="0" rules="all" border="1" id="tabVisitPurpose" style="border-collapse: collapse;">
                            <tr>
                                <th scope="col">Visit Purpose</th>
                            </tr>
                            <tr>
                                <td style="width: 600px;">
                                    <asp:TextBox ID="tbVisitPurpose" runat="server" BackColor="Gold" Style="min-width: 500px; min-height: 200px;" TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>


                    <h2 class="text-primary">Continent</h2>
                    <asp:GridView ID="GridViewContinent" runat="server" AutoGenerateColumns="False" DataKeyNames="ContinentID" DataSourceID="SqlDataSourceContinent" AllowPaging="True" ShowFooter="True">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                            <asp:TemplateField HeaderText="ContinentID" InsertVisible="False" SortExpression="ContinentID">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ContinentID") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ContinentID") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:LinkButton ID="LinkButtonFooterInsert" OnClick="LinkButtonFooterInsert" runat="server">Insert</asp:LinkButton>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="TextBoxFooterContientName" runat="server"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Active" SortExpression="Active">
                                <EditItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Active") %>' />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Active") %>' Enabled="false" />
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:CheckBox ID="CheckBoxFooterContientActive" runat="server" />
                                </FooterTemplate>
                            </asp:TemplateField>
                        </Columns>

                        <EmptyDataTemplate>
                            <table>
                                <tr>
                                    <th></th>
                                    <th>Name</th>
                                    <th>Active</th>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="LinkButtonEmptyDataInsert" OnClick="LinkButtonEmptyDataInsert" runat="server">Insert</asp:LinkButton>
                                    </td>

                                    <td>
                                        <asp:TextBox ID="TextBoxEmptyDataContientName" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="CheckBoxEmptyDataContientActive" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>

                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceContinent" runat="server" ConnectionString="<%$ ConnectionStrings:AirlineConnectionString %>"
                        DeleteCommand="DELETE FROM [Continent] WHERE [ContinentID] = @ContinentID"
                        InsertCommand="INSERT INTO [Continent] ([Name], [Active]) VALUES (@Name, @Active)"
                        SelectCommand="SELECT * FROM [Continent]"
                        UpdateCommand="UPDATE [Continent] SET [Name] = @Name, [Active] = @Active WHERE [ContinentID] = @ContinentID">
                        <DeleteParameters>
                            <asp:Parameter Name="ContinentID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="Active" Type="Boolean" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="Active" Type="Boolean" />
                            <asp:Parameter Name="ContinentID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>

            <div class="col-md-6">
                <div class="customDiv">
                    <h2 class="text-primary">Country</h2>
                    <asp:GridView ID="GridViewCountry" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="CountryID" DataSourceID="SqlDataSourceCountry" ShowFooter="True">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:TemplateField HeaderText="CountryID" InsertVisible="False" SortExpression="CountryID">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("CountryID") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("CountryID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="200px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Continent Name" SortExpression="ContinentID">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownListContinents" runat="server" DataSourceID="SqlDataSourceContinents" DataTextField="Name" DataValueField="ContinentID" SelectedValue='<%# Bind("ContinentID") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceContinents" runat="server" ConnectionString="<%$ ConnectionStrings:AirlineConnectionString %>" SelectCommand="SELECT DISTINCT [ContinentID], [Name] FROM [Continent]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("ContinentName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceCountry" runat="server" ConnectionString="<%$ ConnectionStrings:AirlineConnectionString %>"
                        DeleteCommand="DELETE FROM [Country] WHERE [CountryID] = @CountryID"
                        InsertCommand="INSERT INTO [Country] ([Name], [ContinentID], [Active]) VALUES (@Name, @ContinentID, @Active)"
                        SelectCommand="SELECT CountryID, [Country].[Name] Name,  [Country].[ContinentID] ContinentID, [Continent].Name ContinentName, [Country].[Active] Active  FROM [Country] INNER JOIN [Continent] ON ([Continent].ContinentID = [Country].[ContinentID])"
                        UpdateCommand="UPDATE [Country] SET [Name] = @Name, [ContinentID] = @ContinentID, [Active] = @Active WHERE [CountryID] = @CountryID">
                        <DeleteParameters>
                            <asp:Parameter Name="CountryID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="ContinentID" Type="Int32" />
                            <asp:Parameter Name="Active" Type="Boolean" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="ContinentID" Type="Int32" />
                            <asp:Parameter Name="Active" Type="Boolean" />
                            <asp:Parameter Name="CountryID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
        <div class="row row-eq-height">
            <div class="col-md-6">
                <div class="customDiv">
                    <h2 class="text-primary">Airport</h2>
                    <asp:GridView ID="GridViewAirport" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="AirportID" DataSourceID="SqlDataSourceAirport">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="AirportID" HeaderText="AirportID" InsertVisible="False" ReadOnly="True" SortExpression="AirportID" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="CountryID" HeaderText="CountryID" SortExpression="CountryID" />
                            <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceAirport" runat="server" ConnectionString="<%$ ConnectionStrings:AirlineConnectionString %>" DeleteCommand="DELETE FROM [Airport] WHERE [AirportID] = @AirportID" InsertCommand="INSERT INTO [Airport] ([Name], [CountryID], [Active]) VALUES (@Name, @CountryID, @Active)" SelectCommand="SELECT * FROM [Airport]" UpdateCommand="UPDATE [Airport] SET [Name] = @Name, [CountryID] = @CountryID, [Active] = @Active WHERE [AirportID] = @AirportID">
                        <DeleteParameters>
                            <asp:Parameter Name="AirportID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="CountryID" Type="Int32" />
                            <asp:Parameter Name="Active" Type="Boolean" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="CountryID" Type="Int32" />
                            <asp:Parameter Name="Active" Type="Boolean" />
                            <asp:Parameter Name="AirportID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>

            <div class="col-md-6">
                <div class="customDiv">
                    <h2 class="text-primary">Airline</h2>
                    <div class="btn-group btn-group-justified">
                        <asp:LinkButton ID="LinkButton1" runat="server"> <span Class="glyphicon glyphicon-search btn btn-primary"> Search</span></asp:LinkButton>
                        <asp:LinkButton ID="LinkButton2" runat="server"> <span Class="glyphicon glyphicon-cloud-upload btn btn-primary"> Upload</span></asp:LinkButton>
                        <asp:LinkButton ID="LinkButton3" runat="server"> <span Class="glyphicon glyphicon-plus btn btn-primary"> Add</span></asp:LinkButton>
                        <asp:LinkButton ID="LinkButton4" runat="server"> <span Class="glyphicon glyphicon-minus btn btn-primary"> Subtract</span></asp:LinkButton>
                    </div>
                    <pre>
                        <p>This page.</p>
                        <p>Is a discussion about <kbd>CNTL</kbd> <kbd>ALT</kbd></p>
                        <asp:Button ID="Button1" runat="server" Text="HTML" OnClick="Button1_Click"></asp:Button>
                        <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click" OnClientClick="target ='_blank';" ></asp:Button>
                    </pre>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
