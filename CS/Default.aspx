<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function FocusedCardChanged(s, e) {
            dataview.PerformCallback(s.GetCardKey(s.GetFocusedCardIndex()));
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxCardView ID="ASPxCardView1" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource2"
         KeyFieldName="CategoryID" ClientInstanceName="cardview">
            <SettingsBehavior AllowFocusedCard="True" />
            <ClientSideEvents FocusedCardChanged="FocusedCardChanged" />
            <Columns>
                <dx:CardViewTextColumn FieldName="CategoryID" ReadOnly="True" VisibleIndex="0">
                </dx:CardViewTextColumn>
                <dx:CardViewTextColumn FieldName="CategoryName" VisibleIndex="1">
                </dx:CardViewTextColumn>
                <dx:CardViewTextColumn FieldName="Description" VisibleIndex="2">
                </dx:CardViewTextColumn>
            </Columns>
        </dx:ASPxCardView>
            <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/nwind.mdb"
                SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]">
            </asp:AccessDataSource>
        <dx:ASPxDataView ID="ASPxDataView1" runat="server" SettingsTableLayout-ColumnCount="1" DataSourceID="AccessDataSource1"
             SettingsTableLayout-RowsPerPage="1" ClientInstanceName="dataview" OnCustomCallback="ASPxDataView1_CustomCallback"
            OnLoad="ASPxDataView1_Load">
            <ItemTemplate>
                <b>ProductID</b>:
                <asp:Label ID="ProductIDLabel" runat="server" Text='<%# Eval("ProductID") %>' />
                <br />
                <b>ProductName</b>:
                <asp:Label ID="ProductNameLabel" runat="server" Text='<%# Eval("ProductName") %>' />
                <br />
                <b>CategoryID</b>:
                <asp:Label ID="CategoryIDLabel" runat="server" Text='<%# Eval("CategoryID") %>' />
                <br />
            </ItemTemplate>
        </dx:ASPxDataView>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT [ProductID], [ProductName], [CategoryID] FROM [Products] WHERE ([CategoryID] = @CategoryID)">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="CategoryID" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
    </div>
    </form>
</body>
</html>
