<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebFormVisitor.aspx.cs" Inherits="WebApplicationVOne.WebFormVisitor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <table>
        <tr>
            <td>
                <asp:TextBox ID="tbApplicationID" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="btnFindApplication" runat="server" Text="Find" OnClick="btnFindApplication_Click" />
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <asp:GridView ID="GridViewApplicantion" runat="server" AutoGenerateColumns="False" DataKeyNames="ApplicationPK" DataSourceID="SqlDataSourceApplication">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                        <asp:BoundField DataField="ApplicationPK" HeaderText="ApplicationPK" InsertVisible="False" ReadOnly="True" SortExpression="ApplicationPK" visible="false"/>
                        <asp:TemplateField HeaderText="ReferenceID" SortExpression="ReferenceID">
                            <EditItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("ReferenceID") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("ReferenceID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Visit Description" SortExpression="VisitDescription">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" BackColor="Gold" Style="min-width: 500px; min-height: 200px;" Text='<%# Bind("VisitDescription") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" BackColor="Gold" Text='<%# Bind("VisitDescription") %>'></asp:Label>
                            </ItemTemplate>
                            <ControlStyle Width="500px" />
                            <HeaderStyle Width="500px" />
                            <ItemStyle Width="500px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Size" HeaderText="Size" SortExpression="Size"  />
                        <asp:BoundField DataField="POC" HeaderText="POC" SortExpression="POC" />
                        <asp:TemplateField HeaderText="ApplicationStatusFK" SortExpression="ApplicationStatusFK">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlApplicationStatus" runat="server" SelectedValue='<%# Bind("ApplicationStatusFK") %>' DataSourceID="SqlDataSourceApplicationStatus" DataTextField="StatusName" DataValueField="ApplicationStatusPK">
                                </asp:DropDownList>

                            </EditItemTemplate>
                            <ItemTemplate>
                                <%-- 
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ApplicationStatusFK") %>'></asp:Label>
                                --%>
                                <asp:DropDownList ID="ddlApplicationStatus" runat="server" SelectedValue='<%# Bind("ApplicationStatusFK") %>' DataSourceID="SqlDataSourceApplicationStatus" DataTextField="StatusName" DataValueField="ApplicationStatusPK">
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="lastupdated" HeaderText="lastupdated" SortExpression="lastupdated" />
                        <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" />
                        
                        <asp:ButtonField CommandName="Memo1" HeaderText="Memo1" ShowHeader="True" Text="Memo1" />
                        <asp:ButtonField CommandName="Memo2" HeaderText="Memo3" ShowHeader="True" Text="Memo2" />
                        
                    </Columns>
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSourceApplicationStatus" runat="server" ConnectionString="<%$ ConnectionStrings:OakwoodConnectionString %>" SelectCommand="SELECT * FROM [tblApplicationStatus]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:SqlDataSource ID="SqlDataSourceApplication" runat="server" ConnectionString="<%$ ConnectionStrings:OakwoodConnectionString %>" DeleteCommand="DELETE FROM [tblVisitApplication] WHERE [ApplicationPK] = @ApplicationPK"
                    InsertCommand="INSERT INTO [tblVisitApplication] ([ReferenceID], [VisitDescription], [Size], [POC], [ApplicationStatusFK], [lastupdated], [Active]) VALUES (@ReferenceID, @VisitDescription, @Size, @POC, @ApplicationStatusFK, @lastupdated, @Active)"
                    SelectCommand="SELECT * FROM [tblVisitApplication] where cast([ReferenceID] as varchar(255)) = @ReferenceID"
                    UpdateCommand="UPDATE [tblVisitApplication] SET [ReferenceID] = @ReferenceID, [VisitDescription] = @VisitDescription, [Size] = @Size, [POC] = @POC, [ApplicationStatusFK] = @ApplicationStatusFK, [lastupdated] = @lastupdated, [Active] = @Active WHERE [ApplicationPK] = @ApplicationPK">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="tbApplicationID" Name="ReferenceID" PropertyName="Text" Type="String" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="ApplicationPK" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ReferenceID" Type="Object" />
                        <asp:Parameter Name="VisitDescription" Type="String" />
                        <asp:Parameter Name="Size" Type="Int32" />
                        <asp:Parameter Name="POC" Type="String" />
                        <asp:Parameter Name="ApplicationStatusFK" Type="Int32" />
                        <asp:Parameter Name="lastupdated" Type="DateTime" />
                        <asp:Parameter Name="Active" Type="Boolean" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ReferenceID" />
                        <asp:Parameter Name="VisitDescription" Type="String" />
                        <asp:Parameter Name="Size" Type="Int32" />
                        <asp:Parameter Name="POC" Type="String" />
                        <asp:Parameter Name="ApplicationStatusFK" Type="Int32" />
                        <asp:Parameter Name="lastupdated" Type="DateTime" />
                        <asp:Parameter Name="Active" Type="Boolean" />
                        <asp:Parameter Name="ApplicationPK" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridViewApplicant" runat="server" AutoGenerateColumns="False" DataKeyNames="ApplicantPK" DataSourceID="SqlDataSourceApplicant">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                        <asp:BoundField DataField="ApplicantPK" HeaderText="ApplicantPK" InsertVisible="False" ReadOnly="True" SortExpression="ApplicantPK" Visible="False" />
                        <asp:BoundField DataField="ApplicantReferenceID" HeaderText="Applicant ReferenceI D" SortExpression="ApplicantReferenceID" />

                        <asp:BoundField DataField="passportnumber" HeaderText="Passport number" SortExpression="passportnumber" />
                        <asp:BoundField DataField="passportExpiry" HeaderText="Passport Expiry" SortExpression="passportExpiry" />
                        <asp:BoundField DataField="lastupdated" HeaderText="lastupdated" SortExpression="lastupdated" />
                        <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" />
                        <asp:TemplateField HeaderText="" SortExpression="ApplicationFK">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Visible="false" Text='<%# Bind("ApplicationFK") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Visible="false" Text='<%# Bind("ApplicationFK") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="0px" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>

        </tr>
        <tr>
            <td colspan="2">
                <asp:SqlDataSource ID="SqlDataSourceApplicant" runat="server" ConnectionString="<%$ ConnectionStrings:OakwoodConnectionString %>" 
                    SelectCommand="SELECT * FROM [tblApplicant] WHERE ([ApplicationFK] = @ApplicationFK)" 
                    DeleteCommand="DELETE FROM [tblApplicant] WHERE [ApplicantPK] = @ApplicantPK" 
                    InsertCommand="INSERT INTO [tblApplicant] ([ApplicantReferenceID], [ApplicationFK], [passportnumber], [passportExpiry], [lastupdated], [Active]) VALUES (@ApplicantReferenceID, @ApplicationFK, @passportnumber, @passportExpiry, @lastupdated, @Active)" 
                    UpdateCommand="UPDATE [tblApplicant] SET [ApplicantReferenceID] = @ApplicantReferenceID, [ApplicationFK] = @ApplicationFK, [passportnumber] = @passportnumber, [passportExpiry] = @passportExpiry, [lastupdated] = @lastupdated, [Active] = @Active WHERE [ApplicantPK] = @ApplicantPK">
                    <DeleteParameters>
                        <asp:Parameter Name="ApplicantPK" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ApplicantReferenceID" Type="Object" />
                        <asp:Parameter Name="ApplicationFK" Type="Int32" />
                        <asp:Parameter Name="passportnumber" Type="String" />
                        <asp:Parameter Name="passportExpiry" Type="String" />
                        <asp:Parameter Name="lastupdated" Type="DateTime" />
                        <asp:Parameter Name="Active" Type="Boolean" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewApplicantion" Name="ApplicationFK" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ApplicantReferenceID" />
                        <asp:Parameter Name="ApplicationFK" Type="Int32" />
                        <asp:Parameter Name="passportnumber" Type="String" />
                        <asp:Parameter Name="passportExpiry" Type="String" />
                        <asp:Parameter Name="lastupdated" Type="DateTime" />
                        <asp:Parameter Name="Active" Type="Boolean" />
                        <asp:Parameter Name="ApplicantPK" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>


                <asp:GridView ID="GridViewSiteVisit" runat="server" AutoGenerateColumns="False" DataKeyNames="ApplicantSiteVisit" DataSourceID="SqlDataSourceSiteVisit" OnRowEditing="GridViewSiteVisit_RowEditing" OnRowUpdating="GridViewSiteVisit_RowUpdating">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                        <asp:BoundField DataField="ApplicantSiteVisit" HeaderText="ApplicantSiteVisit" InsertVisible="False" ReadOnly="True" SortExpression="ApplicantSiteVisit" visible="false"/>
                        <asp:BoundField DataField="ApplicantSiteVisitReferenceID" HeaderText="ApplicantSiteVisitReferenceID" SortExpression="ApplicantSiteVisitReferenceID" />

                        <asp:TemplateField HeaderText="SiteFK" SortExpression="SiteFK">
                            <EditItemTemplate>
                               <asp:DropDownList ID="ddlSite" runat="server" SelectedValue='<%# Bind("SiteFK") %>'  DataSourceID="SqlDataSourceSite" DataTextField="SiteName" DataValueField="SitePK">
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlSite" runat="server" SelectedValue='<%# Bind("SiteFK") %>'  DataSourceID="SqlDataSourceSite" DataTextField="SiteName" DataValueField="SitePK">
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Arrival DT" SortExpression="arrivalDT">
                            <EditItemTemplate>
                                <asp:TextBox ID="tbArrivalDT" runat="server" DataFormatString="{0:dd/MM/yyyy hh:mm:ss}" Text='<%# Bind("arrivalDT") %>' TextMode="DateTime"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server"   Text='<%# Bind("arrivalDT") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="departureDT" HeaderText="departureDT" SortExpression="departureDT" />
                        <asp:BoundField DataField="lastupdated" HeaderText="lastupdated" SortExpression="lastupdated" />
                        <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" />
                        <asp:TemplateField HeaderText="" SortExpression="ApplicantFK">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Visible="false"  Text='<%# Bind("ApplicantFK") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Visible="false"  Text='<%# Bind("ApplicantFK") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="0px" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceSite" runat="server" ConnectionString="<%$ ConnectionStrings:OakwoodConnectionString %>" SelectCommand="SELECT [SitePK] , [SiteName] FROM [tblSite]"></asp:SqlDataSource>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceSiteVisit" runat="server" ConnectionString="<%$ ConnectionStrings:OakwoodConnectionString %>" 
                    DeleteCommand="DELETE FROM [tblApplicantSiteVisit] WHERE [ApplicantSiteVisit] = @ApplicantSiteVisit" 
                    InsertCommand="INSERT INTO [tblApplicantSiteVisit] ([ApplicantSiteVisitReferenceID], [ApplicantFK], [SiteFK], [arrivalDT], [departureDT], [lastupdated], [Active]) VALUES (@ApplicantSiteVisitReferenceID, @ApplicantFK, @SiteFK, @arrivalDT, @departureDT, @lastupdated, @Active)" 
                    SelectCommand="SELECT * FROM [tblApplicantSiteVisit] WHERE ([ApplicantFK] = @ApplicantFK)" 
                    UpdateCommand="UPDATE [tblApplicantSiteVisit] SET [ApplicantSiteVisitReferenceID] = @ApplicantSiteVisitReferenceID, [ApplicantFK] = @ApplicantFK, [SiteFK] = @SiteFK, [arrivalDT] = cast(@arrivalDT as datetime), [departureDT] = @departureDT, [lastupdated] = @lastupdated, [Active] = @Active WHERE [ApplicantSiteVisit] = @ApplicantSiteVisit">

                    <DeleteParameters>
                        <asp:Parameter Name="ApplicantSiteVisit" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ApplicantSiteVisitReferenceID" Type="Object" />
                        <asp:Parameter Name="ApplicantFK" Type="Int32" />
                        <asp:Parameter Name="SiteFK" Type="Int32" />
                        <asp:Parameter Name="arrivalDT" Type="DateTime" />
                        <asp:Parameter Name="departureDT" Type="DateTime" />
                        <asp:Parameter Name="lastupdated" Type="DateTime" />
                        <asp:Parameter Name="Active" Type="Boolean" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewApplicant" Name="ApplicantFK" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ApplicantSiteVisitReferenceID"  /> <%-- REMEMBER REMOVE Type="Object" --%>
                        <asp:Parameter Name="ApplicantFK" Type="Int32" />
                        <asp:Parameter Name="SiteFK" Type="Int32" />
                        <asp:Parameter Name="arrivalDT" Type="DateTime" />
                        <asp:Parameter Name="departureDT" Type="DateTime" />
                        <asp:Parameter Name="lastupdated" Type="DateTime" />
                        <asp:Parameter Name="Active" Type="Boolean" />
                        <asp:Parameter Name="ApplicantSiteVisit" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td>Passport Number: </td>
                                <td>
                                     <asp:Label ID="Label1" runat="server" Visible="true" Text='<%# Bind("passportnumber") %>'></asp:Label>
                                </td>


                            </tr>
                            <tr>
                                <td>Passport Expiry: </td>
                                <td>
                                     <asp:Label ID="Label3" runat="server" Visible="true" Text='<%# Bind("passportExpiry") %>'></asp:Label>
                                </td>
                            </tr>
                          
                        </table>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OakwoodConnectionString %>" SelectCommand="SELECT * FROM [tblApplicant]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
