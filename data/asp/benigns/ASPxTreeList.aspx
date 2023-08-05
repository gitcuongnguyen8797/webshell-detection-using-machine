<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>

<script runat="server">
    public class DataObject {
        public int Column0 { get; set; }
        public string Column1 { get; set; }
        public string Column2 { get; set; }
        public int GrouppedColumn { get; set; }
        public string Preview { get; set; }
    }
    protected void Page_Load(object sender, EventArgs e) {
        ASPxTreeList1.Enabled = !chbDisabled.Checked;
        chbShowLoadingPanel.Enabled = !chbDisabled.Checked;
        lblShowLoadingPanel.Enabled = !chbDisabled.Checked;
        chbShowCustWindow.Enabled = !chbDisabled.Checked;
        lblShowCustWindow.Enabled = !chbDisabled.Checked;
        ASPxTreeList1.RightToLeft = chbRtl.Checked ? DefaultBoolean.True : DefaultBoolean.False;
        RtlContainer.RightToLeft = ASPxTreeList1.RightToLeft;

        (ASPxTreeList1.Columns["CommandColumn"] as TreeListCommandColumn).ButtonType =
            (ButtonType)Enum.Parse(typeof(ButtonType), cbxCommandButtonType.Value.ToString());

        ASPxTreeList1.SettingsEditing.Mode =
            (TreeListEditMode)Enum.Parse(typeof(TreeListEditMode), cbxEditFormMode.Value.ToString());
        ASPxTreeList1.SettingsPager.RenderMode = (ControlRenderMode)Enum.Parse(typeof(ControlRenderMode),
            cbxPagerRenderMode.Value.ToString());

        ASPxTreeList1.Styles.AlternatingNode.Enabled = DefaultBoolean.True;
        ASPxTreeList1.DataSource = CreateDataSource();
        ASPxTreeList1.DataBind();
        ASPxTreeList1.Nodes[0].Expanded = true;
        ASPxTreeList1.Nodes[1].Selected = true;

        ShowOptions();
    }
    protected override void LoadOptions() {
        LoadOption<TreeListEditMode>("EditMode", delegate(TreeListEditMode value) { cbxEditFormMode.Value = Enum.GetName(typeof(TreeListEditMode), value); }, TreeListEditMode.EditForm);
        LoadOption<ButtonType>("ButtonType", delegate(ButtonType value) { cbxCommandButtonType.Value = Enum.GetName(typeof(ButtonType), value); }, ButtonType.Link);
        LoadOption<ControlRenderMode>("RenderMode", delegate(ControlRenderMode value) { cbxPagerRenderMode.Value = Enum.GetName(typeof(ControlRenderMode), value); }, ControlRenderMode.Classic);
        LoadOption<bool>("Disabled", delegate(bool value) { chbDisabled.Checked = value; }, false);
        LoadOption<bool>("Rtl", delegate(bool value) { chbRtl.Checked = value; }, false);
    }
    protected override void SaveOptions() {
        SaveOption<TreeListEditMode>("EditMode", delegate() { return (TreeListEditMode)Enum.Parse(typeof(TreeListEditMode), cbxEditFormMode.Value.ToString()); });
        SaveOption<ButtonType>("ButtonType", delegate() { return (ButtonType)Enum.Parse(typeof(ButtonType), cbxCommandButtonType.Value.ToString()); });
        SaveOption<ControlRenderMode>("RenderMode", delegate() { return (ControlRenderMode)Enum.Parse(typeof(ControlRenderMode), cbxPagerRenderMode.Value.ToString()); });
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
                GrouppedColumn = i % 2 == 0 ? -1 : i - 1,
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
    <script type="text/javascript" src="Scripts/PreviewHelpers/TreeList.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" runat="Server">
    <dx:ASPxTreeList ID="ASPxTreeList1" runat="server" AutoGenerateColumns="False" KeyFieldName="Column0"
        Visible="true" PreviewFieldName="Preview" ParentFieldName="GrouppedColumn" Width="800px"
        ClientInstanceName="tv">
        <ClientSideEvents Init="function(s, e) { new ASPxTreeListPreviewHelper(s); }" />
        <Columns>
            <dx:TreeListCommandColumn Name="CommandColumn" VisibleIndex="0">
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
            </dx:TreeListCommandColumn>
            <dx:TreeListTextColumn FieldName="Column0" Caption="Column 0" VisibleIndex="1">
            </dx:TreeListTextColumn>
            <dx:TreeListTextColumn FieldName="Column1" Caption="Column 1" VisibleIndex="2">
            </dx:TreeListTextColumn>
            <dx:TreeListTextColumn FieldName="Column2" Caption="Column 2" VisibleIndex="3" Visible="false">
            </dx:TreeListTextColumn>
        </Columns>
        <Summary>
            <dx:TreeListSummaryItem FieldName="Column0" ShowInColumn="Column0" SummaryType="Count" />
        </Summary>
        <SettingsCustomizationWindow Enabled="true" />
        <Settings ShowPreview="true" ShowFooter="true" GridLines="Both" ShowGroupFooter="true"
            ShowColumnHeaders="true" ShowTreeLines="true" />
        <SettingsPager PageSize="5" Mode="ShowPager" Position="TopAndBottom">
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
        </SettingsPager>
        <SettingsBehavior AllowFocusedNode="true" />
        <SettingsSelection Enabled="true" />
    </dx:ASPxTreeList>
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
                <dx:ASPxLabel runat="server" ID="lblEditFormMode" SkinID="Option" CssClass="label"
                    Text="Edit form mode:" AssociatedControlID="cbxEditFormMode">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbxEditFormMode" SkinID="Option" CssClass="editor"
                    AutoPostBack="true" SelectedIndex="0">
                    <Items>
                        <dx:ListEditItem Text="Inline" Value="Inline" />
                        <dx:ListEditItem Text="EditForm" Value="EditForm" />
                        <dx:ListEditItem Text="EditFormAndDisplayNode" Value="EditFormAndDisplayNode" />
                        <dx:ListEditItem Text="PopupEditForm" Value="PopupEditForm" />
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
                <dx:ASPxComboBox runat="server" ID="cbxPagerRenderMode" SkinID="Option" CssClass="editor"
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
                    <ClientSideEvents CheckedChanged="function(s, e) { ASPxTBHelper.GetControlPreviewHelper(tv.name).SetCustomizationWindowVisibility(s.GetChecked()); }" />
                </dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblRtl" SkinID="Option" CssClass="label" Text="Right to left:">
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
                <dx:ASPxCheckBox runat="server" ID="chbDisabled" SkinID="Option" Checked="false"
                    CssClass="editor" AutoPostBack="true">
                </dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblShowLoadingPanel" SkinID="Option" CssClass="label"
                    Text="Show loading panel: ">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbShowLoadingPanel" CssClass="editor" SkinID="Option"
                    ClientInstanceName="chbShowLoadingPanel">
                    <ClientSideEvents CheckedChanged="function(s, e) { ASPxTBHelper.SetControlLoadingPanelVisibility(tv, s.GetChecked()); }"
                        Init="function(s,e){ ASPxTBHelper.SetControlLoadingPanelVisibility(tv, s.GetChecked()); }" />
                </dx:ASPxCheckBox>
            </td>
        </tr>
    </table>
</asp:Content>
