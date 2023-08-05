<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>

<script runat="server">
    public class DataObject {
        public int Column0 { get; set; }
        public string Column1 { get; set; }
        public string Column2 { get; set; }
        public string GroupedColumn { get; set; }
        public string Preview { get; set; }
    }
    protected void Page_Load(object sender, EventArgs e) {
        ASPxGridView1.Enabled = !chbDisabled.Checked;    
        chbShowLoadingPanel.Enabled = !chbDisabled.Checked;
        lblShowLoadingPanel.Enabled = !chbDisabled.Checked;
        chbShowCustWindow.Enabled = !chbDisabled.Checked;
        lblShowCustWindow.Enabled = !chbDisabled.Checked;
        ASPxGridView1.SettingsBehavior.EnableCustomizationWindow = !chbDisabled.Checked;
        
        ASPxGridView1.RightToLeft = chbRtl.Checked ? DefaultBoolean.True : DefaultBoolean.False;
        RtlContainer.RightToLeft = ASPxGridView1.RightToLeft;
        
        ASPxGridView1.SettingsEditing.Mode = (GridViewEditingMode)Enum.Parse(typeof(GridViewEditingMode), (string)cbEditFormMode.Value);
        ASPxGridView1.Settings.ShowTitlePanel = chbShowTitle.Checked;
        ASPxGridView1.Settings.ShowGroupPanel = chbShowGroupPanel.Checked;
        ASPxGridView1.SettingsDetail.ShowDetailRow = chbShowDetailRow.Checked;
        ASPxGridView1.Settings.ShowPreview = chbShowPreview.Checked;
        ASPxGridView1.Settings.ShowFilterBar = chbShowFilterBar.Checked ? GridViewStatusBarMode.Visible : GridViewStatusBarMode.Hidden;
        ASPxGridView1.Settings.ShowStatusBar = chbShowStatusBar.Checked ? GridViewStatusBarMode.Visible : GridViewStatusBarMode.Hidden;
        ASPxGridView1.SettingsPager.RenderMode = (ControlRenderMode)Enum.Parse(typeof(ControlRenderMode),
                cbxPagerRenderMode.Value.ToString());
        ASPxGridView1.SettingsPager.Position = (PagerPosition)Enum.Parse(typeof(PagerPosition),
                cbxPagerPosition.Value.ToString());
        (ASPxGridView1.Columns["CommandColumn"] as GridViewCommandColumn).ButtonType =
            (ButtonType)Enum.Parse(typeof(ButtonType), cbxCommandButtonType.Value.ToString());
        ASPxGridView1.SettingsLoadingPanel.Mode = (GridViewLoadingPanelMode)Enum.Parse(typeof(GridViewLoadingPanelMode),
                cbxLoadingPanelMode.Value.ToString());
        

        ASPxGridView1.DataSource = CreateDataSource();
        ASPxGridView1.DataBind();
        ASPxGridView1.ExpandRow(0);
        ASPxGridView1.DetailRows.ExpandRow(1);
        ASPxGridView1.Selection.SelectRow(3);
        ASPxGridView1.FocusedRowIndex = 1;
        
        ShowOptions();
    }
    protected override void LoadOptions() {
        LoadOption<GridViewEditingMode>("EditMode", delegate(GridViewEditingMode value) { cbEditFormMode.Value = Enum.GetName(typeof(GridViewEditingMode), value); }, GridViewEditingMode.EditForm);
        LoadOption<ControlRenderMode>("PagerRenderMode", delegate(ControlRenderMode value) { cbxPagerRenderMode.Value = Enum.GetName(typeof(ControlRenderMode), value); }, ControlRenderMode.Classic);
        LoadOption<PagerPosition>("PagerPostion", delegate(PagerPosition value) { cbxPagerPosition.Value = Enum.GetName(typeof(PagerPosition), value); }, PagerPosition.TopAndBottom);
        LoadOption<GridViewLoadingPanelMode>("LoadingPanelMode", delegate(GridViewLoadingPanelMode value) { cbxLoadingPanelMode.Value = Enum.GetName(typeof(GridViewLoadingPanelMode), value); }, GridViewLoadingPanelMode.ShowAsPopup);
        LoadOption<ButtonType>("ButtonType", delegate(ButtonType value) { cbxCommandButtonType.Value = Enum.GetName(typeof(ButtonType), value); }, ButtonType.Link);
        LoadOption<bool>("ShowTitle", delegate(bool value) { chbShowTitle.Checked = value; }, true);
        LoadOption<bool>("ShowGroupPanel", delegate(bool value) { chbShowGroupPanel.Checked = value; }, true);
        LoadOption<bool>("ShowFilterBar", delegate(bool value) { chbShowFilterBar.Checked = value; }, true);
        LoadOption<bool>("ShowPreview", delegate(bool value) { chbShowPreview.Checked = value; }, false);
        LoadOption<bool>("ShowDetailRow", delegate(bool value) { chbShowDetailRow.Checked = value; }, false);
        LoadOption<bool>("ShowStatusBar", delegate(bool value) { chbShowStatusBar.Checked = value; }, false);
        LoadOption<bool>("Disabled", delegate(bool value) { chbDisabled.Checked = value; }, false);
        LoadOption<bool>("Rtl", delegate(bool value) { chbRtl.Checked = value; }, false);
    }
    protected override void SaveOptions() {
        SaveOption<GridViewEditingMode>("EditMode", delegate() { return (GridViewEditingMode)Enum.Parse(typeof(GridViewEditingMode), cbEditFormMode.Value.ToString()); });
        SaveOption<ControlRenderMode>("PagerRenderMode", delegate() { return (ControlRenderMode)Enum.Parse(typeof(ControlRenderMode), cbxPagerRenderMode.Value.ToString()); });
        SaveOption<PagerPosition>("PagerPostion", delegate() { return (PagerPosition)Enum.Parse(typeof(PagerPosition), cbxPagerPosition.Value.ToString()); });
        SaveOption<GridViewLoadingPanelMode>("LoadingPanelMode", delegate() { return (GridViewLoadingPanelMode)Enum.Parse(typeof(GridViewLoadingPanelMode), cbxLoadingPanelMode.Value.ToString()); });
        SaveOption<ButtonType>("ButtonType", delegate() { return (ButtonType)Enum.Parse(typeof(ButtonType), cbxCommandButtonType.Value.ToString()); });
        SaveOption<bool>("ShowTitle", delegate() { return chbShowTitle.Checked; });
        SaveOption<bool>("ShowGroupPanel", delegate() { return chbShowGroupPanel.Checked; });
        SaveOption<bool>("ShowFilterBar", delegate() { return chbShowFilterBar.Checked; });
        SaveOption<bool>("ShowPreview", delegate() { return chbShowPreview.Checked; });
        SaveOption<bool>("ShowDetailRow", delegate() { return chbShowDetailRow.Checked; });
        SaveOption<bool>("ShowStatusBar", delegate() { return chbShowStatusBar.Checked; });
        SaveOption<bool>("Disabled", delegate() { return chbDisabled.Checked; });
        SaveOption<bool>("Rtl", delegate() { return chbRtl.Checked; });
    }
    protected DataObject[] CreateDataSource() {
        int recordCount = 50;
        DataObject[] data = new DataObject[recordCount];
        for(int i = 0; i < recordCount; i++) {
            data[i] = new DataObject
            {
                Column0 = i,
                Column1 = i % 2 == 0 ? "Data Row" : "Alternative Data Row",
                Column2 = i % 2 == 0 ? "Data Row" : "Alternative Data Row",
                GroupedColumn = "Groupped Row " + (i / 3).ToString(),
                Preview = "Preview"
            };
        }
        return data;
    }
</script>
<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="phHead">
    <script type="text/javascript" src="Scripts/PreviewHelpers/CheckBox.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/PopupControl.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/Menu.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/PopupMenu.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/Pager.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/GridView.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" runat="Server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" KeyFieldName="Column0"
        PreviewFieldName="Preview" Width="800px" ClientInstanceName="gv">
        <ClientSideEvents Init="function(s, e) { new ASPxGridViewPreviewHelper(s); }" />
        <Columns>
            <dx:GridViewCommandColumn Name="CommandColumn" VisibleIndex="0" ShowSelectCheckbox="true">
                <NewButton Visible="true" Text="New" Image-Url="Images/sample-image14x14.gif">
                </NewButton>
                <EditButton Visible="true" Text="Edit" Image-Url="Images/sample-image14x14.gif">
                </EditButton>
                <UpdateButton Visible="true" Text="Update" Image-Url="Images/sample-image14x14.gif">
                </UpdateButton>
                <CancelButton Visible="true" Text="Cancel" Image-Url="Images/sample-image14x14.gif">
                </CancelButton>
                <DeleteButton Visible="true" Text="Delete" Image-Url="Images/sample-image14x14.gif">
                </DeleteButton>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Column0" Caption="Column" VisibleIndex="1" SortOrder="Ascending">
                <Settings HeaderFilterMode="CheckedList" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Column1" Caption="Column" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Column2" Caption="Column" VisibleIndex="3"
                Visible="false">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="GroupedColumn" Caption="Grouped Column" VisibleIndex="4"
                GroupIndex="0" SortOrder="Descending">
            </dx:GridViewDataTextColumn>
        </Columns>
        <Templates>
            <DetailRow>
                Detail Row
            </DetailRow>
            <TitlePanel>
                Title panel
            </TitlePanel>
        </Templates>
        <GroupSummary>
            <dx:ASPxSummaryItem FieldName="Column0" ShowInGroupFooterColumn="Column0" SummaryType="Max" />
        </GroupSummary>
        <TotalSummary>
            <dx:ASPxSummaryItem FieldName="Column0" SummaryType="Count" />
        </TotalSummary>
        <SettingsBehavior AllowFocusedRow="true"  EnableRowHotTrack="true" />
        <SettingsDetail ShowDetailRow="true" />
        <SettingsEditing Mode="EditForm" />
        <SettingsCustomizationWindow Enabled="true" />
        <Settings ShowFilterRow="True" ShowGroupPanel="True" ShowPreview="true" ShowFooter="true"
            ShowFilterBar="Visible" ShowFilterRowMenu="true" ShowHeaderFilterButton="true" ShowTitlePanel="true"
            ShowGroupFooter="VisibleAlways" />
        <SettingsPager PageSize="5" Position="TopAndBottom">
            <AllButton Visible="true"></AllButton>
            <FirstPageButton Visible="true"></FirstPageButton>
            <LastPageButton Visible="true"></LastPageButton>
            <PrevPageButton Visible="true"></PrevPageButton>
            <NextPageButton Visible="true"></NextPageButton>
			<PageSizeItemSettings Visible="true" Items="5, 10, 20"></PageSizeItemSettings>
        </SettingsPager>
        <Styles>
            <AlternatingRow Enabled="True">
            </AlternatingRow>
        </Styles>
    </dx:ASPxGridView>
    <script type="text/javascript">
        ASPxTBHelper.OnSelectionModeChanged = function (selectionMode) {
            if(!ASPxClientControl.GetControlCollection().GetByName('chbShowLoadingPanel'))
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
                <dx:ASPxLabel runat="server" ID="lblEditFormMode" CssClass="label" SkinID="Option"
                    Text="Edit form mode:" AssociatedControlID="cbEditFormMode">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbEditFormMode" AutoPostBack="true" CssClass="editor dropDown"
                    SkinID="Option" SelectedIndex="1" Width="165px">
                    <Items>
                        <dx:ListEditItem Text="Inline" Value="Inline" />
                        <dx:ListEditItem Text="EditForm" Value="EditForm" />
                        <dx:ListEditItem Text="EditFormAndDisplayRow" Value="EditFormAndDisplayRow" />
                        <dx:ListEditItem Text="PopupEditForm" Value="PopupEditForm" />
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
                    AutoPostBack="true" SelectedIndex="0" Width="165px">
                    <Items>
                        <dx:ListEditItem Text="Classic" Value="Classic"></dx:ListEditItem>
                        <dx:ListEditItem Text="Lightweight" Value="Lightweight"></dx:ListEditItem>
                    </Items>
                </dx:ASPxComboBox>
            </td> 
        </tr>
        <tr>
           <td>
                <dx:ASPxLabel ID="lblPagerPosition" runat="server" SkinID="Option" CssClass="label" Text="Pager position:"
                    AssociatedControlID="cbxPagerPosition">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbxPagerPosition" SkinID="Option" CssClass="editor dropDown"
                    AutoPostBack="true" SelectedIndex="0" Width="165px">
                    <Items>
                        <dx:ListEditItem Text="TopAndBottom" Value="TopAndBottom"></dx:ListEditItem>
                        <dx:ListEditItem Text="Top" Value="Top"></dx:ListEditItem>
                        <dx:ListEditItem Text="Bottom" Value="Bottom"></dx:ListEditItem>
                    </Items>
                </dx:ASPxComboBox>
            </td> 
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblCommandButtonType" SkinID="Option" CssClass="label"
                    Text="Command button type:" AssociatedControlID="cbxCommandButtonType">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbxCommandButtonType" SkinID="Option" CssClass="editor"
                    AutoPostBack="true" SelectedIndex="0">
                    <Items>
                        <dx:ListEditItem Text="Link" Value="Link" />
                        <dx:ListEditItem Text="Button" Value="Button" />
                        <dx:ListEditItem Text="Image" Value="Image" />
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
                <dx:ASPxCheckBox runat="server" ID="chbShowCustWindow" CssClass="editor" SkinID="Option">
                    <ClientSideEvents
                        CheckedChanged="function(s, e) { ASPxTBHelper.GetControlPreviewHelper(gv.name).SetCustomizationWindowVisibility(s.GetChecked()); }" />
                </dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblShowTitle" CssClass="label" SkinID="Option"
                    Text="Show title:" AssociatedControlID="chbShowTitle">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbShowTitle" CssClass="editor" SkinID="Option" AutoPostBack="true"
                    Checked="true">
                </dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblShowGroupPanel" CssClass="label" SkinID="Option"
                    Text="Show group panel:" AssociatedControlID="chbShowGroupPanel">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbShowGroupPanel" CssClass="editor" SkinID="Option" AutoPostBack="true"
                    Checked="true">
                </dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblShowPreview" CssClass="label" SkinID="Option"
                    Text="Show preview row:" AssociatedControlID="chbShowPreview">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbShowPreview" CssClass="editor" SkinID="Option" AutoPostBack="true"
                    Checked="true">
                </dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblShowDetailRow" CssClass="label" SkinID="Option"
                    Text="Show detail row:" AssociatedControlID="chbShowDetailRow">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbShowDetailRow" CssClass="editor" SkinID="Option" AutoPostBack="true">
                </dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblShowFilterBar" CssClass="label" SkinID="Option"
                    Text="Show filter bar:" AssociatedControlID="chbShowFilterBar">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbShowFilterBar" CssClass="editor" SkinID="Option" AutoPostBack="true"
                    Checked="true">
                </dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblShowStatusBar" CssClass="label" SkinID="Option"
                    Text="Show status bar:" AssociatedControlID="chbShowStatusBar">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbShowStatusBar" CssClass="editor" SkinID="Option" AutoPostBack="true">
                </dx:ASPxCheckBox>
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
                <dx:ASPxLabel ID="lblLoadingPanelMode" runat="server" SkinID="Option" CssClass="label" Text="Loading panel mode:"
                    AssociatedControlID="cbxLoadingPanelMode">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbxLoadingPanelMode" SkinID="Option" CssClass="editor dropDown"
                    AutoPostBack="true" SelectedIndex="0" Width="165px">
                    <Items>
                        <dx:ListEditItem Text="ShowAsPopup" Value="ShowAsPopup"></dx:ListEditItem>
                        <dx:ListEditItem Text="ShowOnStatusBar" Value="ShowOnStatusBar"></dx:ListEditItem>
                    </Items>
                </dx:ASPxComboBox>
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
                    <ClientSideEvents CheckedChanged="function(s, e) { ASPxTBHelper.SetControlLoadingPanelVisibility(gv, s.GetChecked()); }" 
                        Init="function(s,e){ ASPxTBHelper.SetControlLoadingPanelVisibility(gv, s.GetChecked()); }" />
                </dx:ASPxCheckBox>
            </td>
        </tr>
    </table>
</asp:Content>
