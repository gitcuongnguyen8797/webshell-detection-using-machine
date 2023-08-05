<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>

<script runat="server">
    public class DataObject {
        public string Column0 { get; set; }
        public string Column1 { get; set; }
        public string Column2 { get; set; }
        public string Column3 { get; set; }
    }   

    protected void Page_Load(object sender, EventArgs e) {
        ASPxComboBox1.Enabled = !chbDisabled.Checked;
        
        chbShowLoadingPanel.Enabled = !chbDisabled.Checked;
        lblShowLoadingPanel.Enabled = !chbDisabled.Checked;
        
        lblShowError.Enabled = !chbDisabled.Checked;
        chbShowError.Enabled = !chbDisabled.Checked;

        ASPxComboBox1.ValidationSettings.EnableCustomValidation = chbShowError.Checked;
        ASPxComboBox1.IsValid = !chbShowError.Checked;
        
        ASPxComboBox1.Native = chbNative.Checked;
        ASPxComboBox1.RightToLeft = chbRtl.Checked ? DefaultBoolean.True : DefaultBoolean.False;
        RtlContainer.RightToLeft = ASPxComboBox1.RightToLeft;

        chbShowImageColumn.Enabled = chbMultipleColumns.Checked;
        if(chbMultipleColumns.Checked) {
            ASPxComboBox1.ImageUrlField = chbShowImageColumn.Checked ? "Column0" : "";
            ASPxComboBox1.ItemImage.Width = chbShowImageColumn.Checked ? Unit.Pixel(14) : Unit.Empty;
            ASPxComboBox1.ItemImage.Height = chbShowImageColumn.Checked ? Unit.Pixel(14) : Unit.Empty;

            ASPxComboBox1.Columns.Add("Column1");
            ASPxComboBox1.Columns.Add("Column3");
            ASPxComboBox1.Columns.Add("Column2");
            ASPxComboBox1.DataSource = CreateDataSource();
            ASPxComboBox1.DataBind();
        }

        ASPxComboBox1.SelectedItem = ASPxComboBox1.Items[0];
        ShowOptions();
    }
    protected override void LoadOptions() {
        LoadOption<bool>("Native", delegate(bool value) { chbNative.Checked = value; }, false);
        LoadOption<bool>("MultipleColumns", delegate(bool value) { chbMultipleColumns.Checked = value; }, false);
        LoadOption<bool>("ShowImageColumn", delegate(bool value) { chbShowImageColumn.Checked = value; }, false);
        LoadOption<bool>("ShowError", delegate(bool value) { chbShowError.Checked = value; }, false);
        LoadOption<bool>("Disabled", delegate(bool value) { chbDisabled.Checked = value; }, false);
        LoadOption<bool>("Rtl", delegate(bool value) { chbRtl.Checked = value; }, false);
    }
    protected override void SaveOptions() {
        SaveOption<bool>("Native", delegate() { return chbNative.Checked; });
        SaveOption<bool>("MultipleColumns", delegate() { return chbMultipleColumns.Checked; });
        SaveOption<bool>("ShowImageColumn", delegate() { return chbShowImageColumn.Checked; });
        SaveOption<bool>("ShowError", delegate() { return chbShowError.Checked; });
        SaveOption<bool>("Disabled", delegate() { return chbDisabled.Checked; });
        SaveOption<bool>("Rtl", delegate() { return chbRtl.Checked; });
    }
    protected DataObject[] CreateDataSource() {
        int itemCount = 50;
        DataObject[] res = new DataObject[itemCount];

        for(int i = 0; i < itemCount; i++) {
            res[i] = new DataObject { Column0 = "~/Images/sample-image14x14.gif", Column1 = string.Format("Item1{0}", i), Column2 = string.Format("Item2{0}", i), Column3 = string.Format("Item3{0}", i) };
        }

        return res;
    }
</script>

<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="phHead">
    <script type="text/javascript" src="Scripts/PreviewHelpers/PopupControl.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/DropDownEdit.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/ComboBox.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" runat="Server">
    <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" SelectedIndex="0" ClientInstanceName="cb" EnableViewState="false"
        ShowImageInEditBox="true" EnableCallbackMode="true">
        <ClientSideEvents Init="function(s, e) { new ASPxComboBoxPreviewHelper(s); }" />
        <ValidationSettings ErrorText="Sample error text">
        </ValidationSettings>
        <Items>
            <dx:ListEditItem Text="Item" Selected="true"/>
            <dx:ListEditItem Text="Item (with image)" ImageUrl="Images/sample-image14x14.gif"/>
        </Items>
    </dx:ASPxComboBox>

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
                <dx:ASPxLabel runat="server" ID="lblNative" CssClass="label" SkinID="Option" Text="Native:"
                    AssociatedControlID="chbNative">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbNative" CssClass="editor" SkinID="Option" AutoPostBack="true">
                </dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td>
               <dx:ASPxLabel runat="server" ID="lblMultipleColumns" CssClass="label" SkinID="Option" Text="Multiple columns:"
                    AssociatedControlID="chbMultipleColumns">
                </dx:ASPxLabel> 
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbMultipleColumns" CssClass="editor" SkinID="Option" Checked="false" AutoPostBack="true">
                </dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td>
               <dx:ASPxLabel runat="server" ID="lblShowImageColumn" CssClass="label" SkinID="Option" Text="Show image column:"
                AssociatedControlID="chbShowImageColumn">
                </dx:ASPxLabel> 
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbShowImageColumn" CssClass="editor" SkinID="Option" Checked="false" AutoPostBack="true">
                </dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblShowError" SkinID="Option" CssClass="label" Text="Show error frame:"
                    AssociatedControlID="chbShowError">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbShowError" SkinID="Option" CssClass="editor" AutoPostBack="true"
                    ClientInstanceName="chbShowError">
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
                <dx:ASPxLabel runat="server" ID="lblShowLoadingPanel" SkinID="Option" CssClass="label" Text="Show loading panel:"
                    AssociatedControlID="chbShowLoadingPanel">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbShowLoadingPanel" CssClass="editor" SkinID="Option" ClientInstanceName="chbShowLoadingPanel">
                    <ClientSideEvents CheckedChanged="function(s,e){ ASPxTBHelper.SetControlLoadingPanelVisibility(cb, s.GetChecked()); }" 
                        Init="function(s,e){ ASPxTBHelper.SetControlLoadingPanelVisibility(cb, s.GetChecked()); }" />
                </dx:ASPxCheckBox>
            </td>
        </tr>
    </table>
</asp:Content>
