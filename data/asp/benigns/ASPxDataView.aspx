<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>

<script runat="server">
    public class DataObject {
        public int Column0 { get; set; }
        public string Column1 { get; set; }
        public bool Column2 { get; set; }
    }
    protected void Page_Load(object sender, EventArgs e) {
        ASPxDataView1.Enabled = !chbDisabled.Checked;
        chbShowLoadingPanel.Enabled = !chbDisabled.Checked;
        lblShowLoadingPanel.Enabled = !chbDisabled.Checked;
        ASPxDataView1.Layout = (Layout)Enum.Parse(typeof(Layout), cbxLayout.Value.ToString());
        
        ASPxDataView1.RightToLeft = chbRtl.Checked ? DefaultBoolean.True : DefaultBoolean.False;
        RtlContainer.RightToLeft = ASPxDataView1.RightToLeft;

        ASPxDataView1.PagerSettings.RenderMode =
            (ControlRenderMode)Enum.Parse(typeof(ControlRenderMode), cbxPagerRenderMode.Value.ToString());

        ASPxDataView1.DataSource = CreateDataSource();
        ASPxDataView1.DataBind();
        
        ShowOptions();
    }
    protected override void LoadOptions() {
        LoadOption<Layout>("Layout", delegate(Layout value) { cbxLayout.Value = Enum.GetName(typeof(Layout), value); }, Layout.Table);
        LoadOption<ControlRenderMode>("RenderMode", delegate(ControlRenderMode value) { cbxPagerRenderMode.Value = Enum.GetName(typeof(ControlRenderMode), value); }, ControlRenderMode.Classic);
        LoadOption<bool>("Disabled", delegate(bool value) { chbDisabled.Checked = value; }, false);
        LoadOption<bool>("Rtl", delegate(bool value) { chbRtl.Checked = value; }, false);
    }
    protected override void SaveOptions() {
        SaveOption<Layout>("Layout", delegate() { return (Layout)Enum.Parse(typeof(Layout), cbxLayout.Value.ToString()); });
        SaveOption<ControlRenderMode>("RenderMode", delegate() { return (ControlRenderMode)Enum.Parse(typeof(ControlRenderMode), cbxPagerRenderMode.Value.ToString()); });
        SaveOption<bool>("Disabled", delegate() { return chbDisabled.Checked; });
        SaveOption<bool>("Rtl", delegate() { return chbRtl.Checked; });
    }
    protected DataObject[] CreateDataSource() {
        int recordCount = 5;
        DataObject[] data = new DataObject[recordCount];
        for(int i = 0; i < recordCount; i++) {
            data[i] = new DataObject { Column0 = i, Column1 = "Sample Data " + i.ToString(), Column2 = i % 2 == 0 };
        }

        return data;
    }
</script>

<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="phHead">
    <script type="text/javascript" src="Scripts/PreviewHelpers/Menu.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/PopupMenu.js"></script>
	<script type="text/javascript" src="Scripts/PreviewHelpers/Pager.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/DataView.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" runat="Server">
    <dx:ASPxDataView ID="ASPxDataView1" runat="server" ColumnCount="2" RowPerPage="2"
        ClientInstanceName="ASPxDataView1" HideEmptyRows="false">
        <ClientSideEvents Init="function(s,e) { new ASPxDataViewPreviewHelper(s); }" />
        <ItemStyle Height="50px" Width="150px" />
        <ItemTemplate>
            <b>Column 0</b>:
            <asp:Label ID="Column0Label" runat="server" Text='<%# Eval("Column0") %>' />
            <br />
            <b>Column 1</b>:
            <asp:Label ID="Column1Label" runat="server" Text='<%# Eval("Column1") %>' />
            <br />
            <b>Column 2</b>:
            <asp:Label ID="Column2Label" runat="server" Text='<%# Eval("Column2") %>' />
            <br />
        </ItemTemplate>
        <EmptyItemTemplate>
            Empty Item
        </EmptyItemTemplate>
        <PagerSettings ShowNumericButtons="true">
            <AllButton Visible="true" />
            <FirstPageButton Visible="true"/>
            <LastPageButton Visible="true"/>
            <NextPageButton Visible="true"/>
            <PrevPageButton Visible="true"/>
            <Summary Visible="false"/>
            <PageSizeItemSettings Visible="true" Items="2,4" />
        </PagerSettings>
    </dx:ASPxDataView>

    <script type="text/javascript">
        ASPxTBHelper.OnSelectionModeChanged = function(selectionMode) {
            if(!ASPxClientControl.GetControlCollection().GetByName('chbShowLoadingPanel'))
                return;

            if(!selectionMode)
                chbShowLoadingPanel.SetChecked(false);
        };
    </script>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="phOptions" runat="server">
    <table>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblLayout" CssClass="label" SkinID="Option" Text="Layout:"
                    AssociatedControlID="cbxLayout">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbxLayout" CssClass="editor dropDown" SkinID="Option" AutoPostBack="true"
                    SelectedIndex="0">
                    <Items>
                        <dx:ListEditItem Text="Table" Value="Table"/>
                        <dx:ListEditItem Text="Flow" Value="Flow"/>
                    </Items>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
           <td>
                <dx:ASPxLabel ID="lblPagerRenderMode" runat="server" SkinID="Option" CssClass="label" Text="Pager render mode:"
                    AssociatedControlID="cbxPagerRenderMode">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbxPagerRenderMode" SkinID="Option" CssClass="editor dropDown"
                    AutoPostBack="true" SelectedIndex="0">
                    <Items>
                        <dx:ListEditItem Text="Classic" Value="Classic"></dx:ListEditItem>
                        <dx:ListEditItem Text="Lightweight" Value="Lightweight"></dx:ListEditItem>
                    </Items>
                </dx:ASPxComboBox>
            </td> 
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblRtl" SkinID="Option" CssClass="label" Text="Right to left:"
                    AssociatedControlID="chbRtl">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbRtl" SkinID="Option" CssClass="editor" AutoPostBack="true">
                </dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblEnabled" SkinID="Option" CssClass="label" Text="Disabled:"
                    AssociatedControlID="chbDisabled">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbDisabled" SkinID="Option" Checked="false" CssClass="editor" AutoPostBack="true">
                </dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblShowLoadingPanel" CssClass="label" SkinID="Option" Text="Show loading panel: ">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbShowLoadingPanel" CssClass="editor" SkinID="Option" ClientInstanceName="chbShowLoadingPanel">
                    <ClientSideEvents CheckedChanged="function(s,e){ ASPxTBHelper.SetControlLoadingPanelVisibility(ASPxDataView1, s.GetChecked()); }"
                        Init="function(s,e){ ASPxTBHelper.SetControlLoadingPanelVisibility(ASPxDataView1, s.GetChecked()); }" />
                </dx:ASPxCheckBox>
            </td>
        </tr>
    </table>
</asp:Content>
