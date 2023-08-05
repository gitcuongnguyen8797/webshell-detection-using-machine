<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>

<script runat="server">
    public class DataObject {
        public string Column0 { get; set; }
        public string Column1 { get; set; }
        public string Column2 { get; set; }
        public string Column3 { get; set; }
        public string Column4 { get; set; }
        public string Column5 { get; set; }
        public string Column6 { get; set; }
        public string Column7 { get; set; }
    }
    protected void Page_Load(object sender, EventArgs e) {
        Pivot.Enabled = !chbDisabled.Checked;
        chbShowLoadingPanel.Enabled = !chbDisabled.Checked;
        lblShowLoadingPanel.Enabled = !chbDisabled.Checked;
        chbShowCustWindow.Enabled = !chbDisabled.Checked;
        lblShowCustWindow.Enabled = !chbDisabled.Checked;
        Pivot.OptionsView.DataHeadersDisplayMode =
            (PivotDataHeadersDisplayMode)Enum.Parse(typeof(PivotDataHeadersDisplayMode), cbxHeaderDispaleyMode.Value.ToString());
        Pivot.OptionsCustomization.CustomizationFormStyle =
            (CustomizationFormStyle)Enum.Parse(typeof(CustomizationFormStyle), cbxCustFormStyle.Value.ToString());
        Pivot.OptionsPager.RenderMode =
            (ControlRenderMode)Enum.Parse(typeof(ControlRenderMode), cbxPagerRenderMode.Value.ToString());

        Pivot.DataSource = CreateDataSource();
        Pivot.CollapseAllRows();
        Pivot.CollapseAllColumns();
        Pivot.ExpandValue(false, new object[] { "Cell_30" });
        Pivot.ExpandValue(true, new object[] { "Cell_10" });
        
        ShowOptions();
    }
    protected override void LoadOptions() {
        LoadOption<PivotDataHeadersDisplayMode>("HeadersDisplayMode", delegate(PivotDataHeadersDisplayMode value) { cbxHeaderDispaleyMode.Value = Enum.GetName(typeof(PivotDataHeadersDisplayMode), value); }, PivotDataHeadersDisplayMode.Default);
        LoadOption<CustomizationFormStyle>("CustomizationFormStyle", delegate(CustomizationFormStyle value) { cbxCustFormStyle.Value = Enum.GetName(typeof(CustomizationFormStyle), value); }, CustomizationFormStyle.Excel2007);
        LoadOption<ControlRenderMode>("RenderMode", delegate(ControlRenderMode value) { cbxPagerRenderMode.Value = Enum.GetName(typeof(ControlRenderMode), value); }, ControlRenderMode.Classic);
        LoadOption<bool>("Disabled", delegate(bool value) { chbDisabled.Checked = value; }, false);
    }
    protected override void SaveOptions() {
        SaveOption<PivotDataHeadersDisplayMode>("HeadersDisplayMode", delegate() { return (PivotDataHeadersDisplayMode)Enum.Parse(typeof(PivotDataHeadersDisplayMode), cbxHeaderDispaleyMode.Value.ToString()); });
        SaveOption<CustomizationFormStyle>("CustomizationFormStyle", delegate() { return (CustomizationFormStyle)Enum.Parse(typeof(CustomizationFormStyle), cbxCustFormStyle.Value.ToString()); });
        SaveOption<ControlRenderMode>("RenderMode", delegate() { return (ControlRenderMode)Enum.Parse(typeof(ControlRenderMode), cbxPagerRenderMode.Value.ToString()); });
        SaveOption<bool>("Disabled", delegate() { return chbDisabled.Checked; });
    }
    protected DataObject[] CreateDataSource() {
        int recordCount = 6;
        DataObject[] res = new DataObject[recordCount];
        for(int i = 0; i < recordCount; i++) {
            res[i] = new DataObject
            {
                Column0 = "Cell_0" + i.ToString(),
                Column1 = "Cell_1" + i.ToString(),
                Column2 = "Cell_2" + i.ToString(),
                Column3 = "Cell_3" + i.ToString(),
                Column4 = "Cell_4" + i.ToString(),
                Column5 = "Cell_5" + i.ToString(),
                Column6 = "Cell_6" + i.ToString(),
                Column7 = "Cell_7" + i.ToString()
            };
        }
        return res;
    }
</script>
<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="phHead">
    <script type="text/javascript" src="Scripts/PreviewHelpers/CheckBox.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/Menu.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/PopupMenu.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/Pager.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/PopupControl.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/PivotGrid.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" runat="Server">
    <dx:ASPxPivotGrid runat="server" ID="Pivot" ClientInstanceName="pivot">
        <ClientSideEvents Init="function(s, e) { new ASPxPivotGridPreviewHelper(s); }" CustomizationFieldsVisibleChanged="function(s, e) { chbShowCustWindow.SetChecked(pivot.GetCustomizationFieldsVisibility()); }" />
        <Fields>
            <dx:PivotGridField FieldName="Column0">
            </dx:PivotGridField>
            <dx:PivotGridField FieldName="Column1" ID="C1" Area="ColumnArea" AreaIndex="0" GroupIndex="0"
                InnerGroupIndex="0">
            </dx:PivotGridField>
            <dx:PivotGridField FieldName="Column2" Area="ColumnArea" ID="prefilterColumn" AreaIndex="1"
                GroupIndex="0" InnerGroupIndex="1" SortOrder="Descending">
            </dx:PivotGridField>
            <dx:PivotGridField FieldName="Column3" ID="C3" Area="RowArea" AreaIndex="0" GroupIndex="1"
                InnerGroupIndex="0">
            </dx:PivotGridField>
            <dx:PivotGridField FieldName="Column4" ID="C4" Area="RowArea" AreaIndex="1" GroupIndex="1"
                InnerGroupIndex="1">
            </dx:PivotGridField>
            <dx:PivotGridField FieldName="Column5" ID="C5" Area="DataArea">
            </dx:PivotGridField>
            <dx:PivotGridField FieldName="Column6" ID="C6" Area="DataArea" Visible="False">
            </dx:PivotGridField>
        </Fields>
        <Groups>
            <dx:PivotGridWebGroup Caption="Group 0" />
            <dx:PivotGridWebGroup Caption="Group 1" />
        </Groups>
        <OptionsView ShowColumnGrandTotalHeader="True" ShowColumnGrandTotals="True" ShowColumnHeaders="True"
            ShowColumnTotals="True" ShowContextMenus="true" ShowCustomTotalsForSingleValues="True"
            ShowDataHeaders="True" DataHeadersPopupMinCount="1" ShowFilterHeaders="True"
            ShowFilterSeparatorBar="True" ShowGrandTotalsForSingleValues="True" ShowHorizontalScrollBar="false"
            ShowRowGrandTotalHeader="True" ShowRowGrandTotals="True" ShowRowHeaders="True"
            ShowRowTotals="True" ShowTotalsForSingleValues="True" />
        <OptionsCustomization AllowDrag="false" AllowDragInCustomizationForm="false" AllowSort="true"
            AllowSortInCustomizationForm="true" />
        <OptionsPager RowsPerPage="5">
            <AllButton Visible="true">
            </AllButton>
            <FirstPageButton Visible="true">
            </FirstPageButton>
            <LastPageButton Visible="true">
            </LastPageButton>
            <PrevPageButton Visible="true">
            </PrevPageButton>
            <NextPageButton Visible="true">
            </NextPageButton>
			<PageSizeItemSettings Visible="true" Items="5, 10, 20">
			</PageSizeItemSettings>
        </OptionsPager>
        <Prefilter Enabled="True" CriteriaString="[prefilterColumn] <> 'fake'" />
    </dx:ASPxPivotGrid>
    <script type="text/javascript">
        ASPxTBHelper.OnSelectionModeChanged = function (selectionMode) {
            if (!ASPxClientControl.GetControlCollection().GetByName('chbShowLoadingPanel'))
                return;

            if (!selectionMode)
                chbShowLoadingPanel.SetChecked(false);
        };
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="phOptions" runat="server">
    <table>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblHeaderDispaleyMode" CssClass="label" SkinID="Option"
                    Text="Data headers display mode:" AssociatedControlID="cbxHeaderDispaleyMode">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbxHeaderDispaleyMode" AutoPostBack="true" CssClass="editor dropDown"
                    SkinID="Option" SelectedIndex="0">
                    <Items>
                        <dx:ListEditItem Text="Default" Value="Default" />
                        <dx:ListEditItem Text="Popup" Value="Popup" />
                    </Items>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblPagerRenderMode" runat="server" SkinID="Option" CssClass="label"
                    Text="Pager render mode:" AssociatedControlID="cbxPagerRenderMode">
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
                <dx:ASPxLabel runat="server" ID="lblCustFormStyle" CssClass="label" SkinID="Option"
                    Text="Customization window style:" AssociatedControlID="cbxCustFormStyle">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbxCustFormStyle" AutoPostBack="true" CssClass="editor dropDown"
                    SkinID="Option" SelectedIndex="1">
                    <Items>
                        <dx:ListEditItem Text="Simple" Value="Simple" />
                        <dx:ListEditItem Text="Excel2007" Value="Excel2007" />
                    </Items>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblShowCustWindow" CssClass="label" SkinID="Option"
                    Text="Show customization window:" AssociatedControlID="chbShowCustWindow">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbShowCustWindow" ClientInstanceName="chbShowCustWindow"
                    CssClass="editor" SkinID="Option">
                    <ClientSideEvents CheckedChanged="function(s, e) { pivot.ChangeCustomizationFieldsVisibility(); }" />
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
                <dx:ASPxCheckBox runat="server" ID="chbDisabled" SkinID="Option" Checked="false"
                    CssClass="editor" AutoPostBack="true">
                </dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblShowLoadingPanel" CssClass="label" SkinID="Option"
                    Text="Show loading panel:" AssociatedControlID="chbShowLoadingPanel">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbShowLoadingPanel" CssClass="editor" SkinID="Option"
                    ClientInstanceName="chbShowLoadingPanel">
                    <ClientSideEvents CheckedChanged="function(s, e) { ASPxTBHelper.SetControlLoadingPanelVisibility(pivot, s.GetChecked()); }" 
                        Init="function(s,e){ ASPxTBHelper.SetControlLoadingPanelVisibility(pivot, s.GetChecked()); }" />
                </dx:ASPxCheckBox>
            </td>
        </tr>
    </table>
</asp:Content>
