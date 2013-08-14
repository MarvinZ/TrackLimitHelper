<%@ Page Title="Track Limits Manager - BETA" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TrackLimitHelper._Default" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title"> 
                 
                     <h1><%: Title %></h1>               
            
            </hgroup>           
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">   

    <%--Tabs code--%>
       <div class="leWrapper">
        <telerik:RadTabStrip ID="RadTabStrip1" runat="server" Skin="Web20" MultiPageID="RadMultiPage1"
            SelectedIndex="0" Align="Justify" ReorderTabsOnSelect="True" Width="450px" >
            <Tabs>
                <telerik:RadTab Text="Change Limits" Selected="True">
                </telerik:RadTab>
                <telerik:RadTab Text="Tools">
                </telerik:RadTab>
              
                <telerik:RadTab runat="server" Text="Log">
                </telerik:RadTab>
              
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" CssClass="pageView"
            Width="100%">
            <telerik:RadPageView ID="RadPageView1" runat="server" Height="425px">
                <div class="containerC">
                    <h3>&nbsp;Select the track, then select the operation and press the go!!! button.</h3>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                           
     
     <script type="text/javascript">
         function OnClientClicked(button, args) {
             if (window.confirm("Are you sure you want to this?")) {
                 button.set_autoPostBack(true);
             }
             else {
                 button.set_autoPostBack(false);
             }
         }
    </script>
  
                    <asp:Panel ID="Panel2" runat="server" CssClass="MZCentered" HorizontalAlign="Center" Width="75%">
                        <asp:Label ID="Label5" runat="server" Text="Select the track: "></asp:Label>
                        &nbsp;&nbsp;<telerik:RadComboBox ID="RadComboBox1" Runat="server" DataSourceID="SqlDataSourceDB8" DataTextField="TrackName" DataValueField="TrackID" EmptyMessage="Select a track" EnableLoadOnDemand="True" EnableVirtualScrolling="True" Height="245px" MarkFirstMatch="True" Skin="Web20" Width="185px">
                        </telerik:RadComboBox>
                        &nbsp;<asp:Label ID="Label4" runat="server" Text="Select the operation: "></asp:Label>
                        &nbsp;
                        <telerik:RadDropDownList ID="RadDropDownList2" runat="server" Height="36px" SelectedText="Set to Major Event Limits" SelectedValue="Set to Major Events Limits" Skin="Web20" Width="185px">
                            <Items>
                                <telerik:DropDownListItem runat="server" Selected="True" Text="Set to Major Event Limits" Value="Set to Major Events Limits" />
                                <telerik:DropDownListItem runat="server" Text="Set to Track A Limits" Value="Set to Track A Limits" />
                                <telerik:DropDownListItem runat="server" Text="Set to Track B Limits" Value="Set to Track B Limits" />
                                <telerik:DropDownListItem runat="server" Text="Set to Track C Limits" Value="Set to Track C Limits" />
                                <telerik:DropDownListItem runat="server" Text="Set to Track D Limits" Value="Set to Track D Limits" />
                                <telerik:DropDownListItem runat="server" Text="Set to Track E Limits" Value="Set to Track E Limits" />
                                <telerik:DropDownListItem runat="server" Text="Reset to Original Limits" Value="Reset to Original Limits" />
                            </Items>
                        </telerik:RadDropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceDB8" runat="server" ConnectionString="<%$ ConnectionStrings:DB8-DGSDataRBLConnectionString %>" SelectCommand="SELECT [TrackID], [TrackName] FROM [Track]"></asp:SqlDataSource>
                        <p>
                        </p>
                        <br />
                        <br />
                        <telerik:RadButton ID="RadButton1" runat="server" Height="44px" OnClick="RadButton1_Click" OnClientClicked="OnClientClicked" Skin="Web20" Text="GO!!!" Width="405px">
                        </telerik:RadButton>
                        <br />
                        <br />
                        &nbsp;<asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Visible="False"></asp:Label>
                        <br />
                    </asp:Panel>
        
    <br />
    <br />
  
                </div>
                 
            </telerik:RadPageView>
            <telerik:RadPageView ID="RadPageView2" runat="server" Width="100%" Height="425px">
                  <h3>&nbsp;These are the tools</h3>
                  <br />

                  <br />
                  &nbsp;<asp:Panel ID="Panel1" runat="server" CssClass="MZCentered" Height="310px" Width="75%">
                      <p>
                           <asp:Label ID="Label2" runat="server" Text="Use this button only if new limitsets have been created. "></asp:Label>
                      &nbsp;
                      <telerik:RadButton ID="RadButton3" runat="server" Height="31px" OnClick="RadButton3_Click" OnClientClicked="OnClientClicked3" Skin="Web20" Text="Update New Limitsets 2!!!" Width="150px">
                      </telerik:RadButton>
                           <p>
                           </p>
                           <br />
                           <br />
                           <br />
                           <br />
                           <br />
                           <br />
                      </p>
                     
                  </asp:Panel>
                  <br />
                  <br />
                  <br />
                  <br />

    <script type="text/javascript">
        function OnClientClicked3(button, args) {
            if (window.confirm("DON'T DO THIS IF A TRACK IS NOT ON IT'S ORIGINAL VALUES!!! \n Are you sure you want to this?")) {
                button.set_autoPostBack(true);
            }
            else {
                button.set_autoPostBack(false);
            }
        }
    </script>           
            </telerik:RadPageView>
            <telerik:RadPageView ID="RadPageView3" runat="server" Height="425px">
                 <h3>&nbsp;This is the change log</h3>
                 <br />
                  

                  <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" AllowSorting="True" CellSpacing="0" CssClass="MZCentered" DataSourceID="ChangeProfileLimitsetLog" GridLines="None" HorizontalAlign="Justify" ShowFooter="True" Skin="Web20" Width="75%">
                      <ExportSettings ExportOnlyData="True">
                      </ExportSettings>
                      <ClientSettings>
                          <Animation AllowColumnReorderAnimation="True" AllowColumnRevertAnimation="True" ColumnReorderAnimationDuration="500" ColumnRevertAnimationDuration="500" />
                      </ClientSettings>
                      <MasterTableView AutoGenerateColumns="False" DataSourceID="ChangeProfileLimitsetLog"  CommandItemDisplay="Top" >
                          <CommandItemSettings ExportToPdfText="Export to PDF" ShowAddNewRecordButton="False" ShowExportToExcelButton="True" ShowExportToPdfButton="True" />
                          <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" Visible="True">
                              <HeaderStyle Width="20px" />
                          </RowIndicatorColumn>
                          <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" Visible="True">
                              <HeaderStyle Width="20px" />
                          </ExpandCollapseColumn>
                          <Columns>
                              <telerik:GridBoundColumn DataField="ChangeProfileLimitsetID" DataType="System.Int32" FilterControlAltText="Filter ChangeProfileLimitsetID column" HeaderText="ChangeProfileLimitsetID" ReadOnly="True" SortExpression="ChangeProfileLimitsetID" UniqueName="ChangeProfileLimitsetID" Visible="False">
                                  <ColumnValidationSettings>
                                      <ModelErrorMessage Text="" />
                                  </ColumnValidationSettings>
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="TrackName" FilterControlAltText="Filter TrackName column" HeaderText="Track" SortExpression="TrackName" UniqueName="TrackName">
                                  <ColumnValidationSettings>
                                      <ModelErrorMessage Text="" />
                                  </ColumnValidationSettings>
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="Operation" FilterControlAltText="Filter Operation column" HeaderText="Operation" SortExpression="Operation" UniqueName="Operation">
                                  <ColumnValidationSettings>
                                      <ModelErrorMessage Text="" />
                                  </ColumnValidationSettings>
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="ChangeDate" DataType="System.DateTime" FilterControlAltText="Filter ChangeDate column" HeaderText="Change Date" SortExpression="ChangeDate" UniqueName="ChangeDate">
                                  <ColumnValidationSettings>
                                      <ModelErrorMessage Text="" />
                                  </ColumnValidationSettings>
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="LoginName" FilterControlAltText="Filter LoginName column" HeaderText="Changed by" SortExpression="LoginName" UniqueName="LoginName">
                                  <ColumnValidationSettings>
                                      <ModelErrorMessage Text="" />
                                  </ColumnValidationSettings>
                              </telerik:GridBoundColumn>
                          </Columns>
                          <EditFormSettings>
                              <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                              </EditColumn>
                          </EditFormSettings>
                          <PagerStyle PageSizeControlType="RadComboBox" />
                      </MasterTableView>
                      <PagerStyle PageSizeControlType="RadComboBox" />
                      <FilterMenu EnableImageSprites="False">
                      </FilterMenu>
                 </telerik:RadGrid>
                 <asp:SqlDataSource ID="ChangeProfileLimitsetLog" runat="server" ConnectionString="<%$ ConnectionStrings:DB8-DGSDataRBLConnectionString %>" SelectCommand="_im_iq_mz_ProfileLimitsetChangeLog" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                  <br />
                  <br />
                  <br />
                  <br />
                  <br />
          
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </div>
            
</asp:Content>


