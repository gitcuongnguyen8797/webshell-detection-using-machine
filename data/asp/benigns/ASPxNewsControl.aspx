<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>

<script runat="server">
    public class DataObject {
        public string Text { get; set; }
        public string HeaderText { get; set; }
        public string NavigateUrl { get; set; }
        public string ImageUrl { get; set; }
        public DateTime Date { get; set; }
    }
    protected void Page_Load(object sender, EventArgs e) {
        ASPxNewsControl1.Enabled = !chbDisabled.Checked;
        chbShowLoadingPanel.Enabled = !chbDisabled.Checked;
        lblShowLoadingPanel.Enabled = !chbDisabled.Checked;
        ASPxNewsControl1.PagerSettings.EllipsisMode = (PagerEllipsisMode)Enum.Parse(typeof(PagerEllipsisMode),
            cbxEllipsisMode.SelectedItem.Value.ToString());
        ASPxNewsControl1.ItemSettings.ShowContentAsLink = cbContentAsLink.Checked;
        ASPxNewsControl1.ItemSettings.ShowHeaderAsLink = cbHeaderAsLink.Checked;
        ASPxNewsControl1.ItemSettings.DateHorizontalPosition = (DateHorizontalPosition)Enum.Parse(typeof(DateHorizontalPosition),
            cbxDateHorizontalPosition.SelectedItem.Value.ToString());
        ASPxNewsControl1.ItemSettings.DateVerticalPosition = (DateVerticalPosition)Enum.Parse(typeof(DateVerticalPosition),
            cbxDateVerticalPosition.SelectedItem.Value.ToString());
        ASPxNewsControl1.ItemSettings.ImagePosition = (DevExpress.Web.ASPxHeadline.ImagePosition)Enum.Parse(typeof(DevExpress.Web.ASPxHeadline.ImagePosition),
            cbxImagePosition.SelectedItem.Value.ToString());
        ASPxNewsControl1.ItemSettings.TailPosition = (TailPosition)Enum.Parse(typeof(TailPosition),
            cbxTailPosition.SelectedItem.Value.ToString());
        ASPxNewsControl1.ItemSettings.TailImagePosition = (TailImagePosition)Enum.Parse(typeof(TailImagePosition),
            cbxTailImagePosition.SelectedItem.Value.ToString());
        ASPxNewsControl1.RightToLeft = chbRtl.Checked ? DefaultBoolean.True : DefaultBoolean.False;
        RtlContainer.RightToLeft = ASPxNewsControl1.RightToLeft;

        ASPxNewsControl1.PagerSettings.RenderMode =
           (ControlRenderMode)Enum.Parse(typeof(ControlRenderMode), cbxPagerRenderMode.Value.ToString());
        
        ASPxNewsControl1.DataSource = CreateDataSource();
        ASPxNewsControl1.DataBind();

        ShowOptions();
    }
    protected override void LoadOptions() {
        LoadOption<ControlRenderMode>("RenderMode", delegate(ControlRenderMode value) { cbxPagerRenderMode.Value = Enum.GetName(typeof(ControlRenderMode), value); }, ControlRenderMode.Classic);
        LoadOption<PagerEllipsisMode>("EllipsisMode", delegate(PagerEllipsisMode value) { cbxEllipsisMode.Value = Enum.GetName(typeof(PagerEllipsisMode), value); }, PagerEllipsisMode.InsideNumeric);
        LoadOption<bool>("ContentAsLink", delegate(bool value) { cbContentAsLink.Checked = value; }, false);
        LoadOption<bool>("HeaderAsLink", delegate(bool value) { cbHeaderAsLink.Checked = value; }, false);
        LoadOption<DateHorizontalPosition>("DateHorizontalPosition", delegate(DateHorizontalPosition value) { cbxDateHorizontalPosition.Value = Enum.GetName(typeof(DateHorizontalPosition), value); }, DateHorizontalPosition.Right);
        LoadOption<DateVerticalPosition>("DateVerticalPosition", delegate(DateVerticalPosition value) { cbxDateVerticalPosition.Value = Enum.GetName(typeof(DateVerticalPosition), value); }, DateVerticalPosition.Header);
        LoadOption<DevExpress.Web.ASPxHeadline.ImagePosition>("ImagePosition", delegate(DevExpress.Web.ASPxHeadline.ImagePosition value) { cbxImagePosition.Value = Enum.GetName(typeof(DevExpress.Web.ASPxHeadline.ImagePosition), value); }, DevExpress.Web.ASPxHeadline.ImagePosition.Left);
        LoadOption<TailPosition>("TailPosition", delegate(TailPosition value) { cbxTailPosition.Value = Enum.GetName(typeof(TailPosition), value); }, TailPosition.Inline);
        LoadOption<TailImagePosition>("TailImagePosition", delegate(TailImagePosition value) { cbxTailImagePosition.Value = Enum.GetName(typeof(TailImagePosition), value); }, TailImagePosition.AfterTailText);
        LoadOption<bool>("Disabled", delegate(bool value) { chbDisabled.Checked = value; }, false);
        LoadOption<bool>("Rtl", delegate(bool value) { chbRtl.Checked = value; }, false);
    }
    protected override void SaveOptions() {
        SaveOption<ControlRenderMode>("RenderMode", delegate() { return (ControlRenderMode)Enum.Parse(typeof(ControlRenderMode), cbxPagerRenderMode.Value.ToString()); });
        SaveOption<PagerEllipsisMode>("EllipsisMode", delegate() { return (PagerEllipsisMode)Enum.Parse(typeof(PagerEllipsisMode), cbxEllipsisMode.Value.ToString()); });
        SaveOption<bool>("ContentAsLink", delegate() { return cbContentAsLink.Checked; });
        SaveOption<bool>("HeaderAsLink", delegate() { return cbHeaderAsLink.Checked; });
        SaveOption<DateHorizontalPosition>("DateHorizontalPosition", delegate() { return (DateHorizontalPosition)Enum.Parse(typeof(DateHorizontalPosition), cbxDateHorizontalPosition.Value.ToString()); });
        SaveOption<DateVerticalPosition>("DateVerticalPosition", delegate() { return (DateVerticalPosition)Enum.Parse(typeof(DateVerticalPosition), cbxDateVerticalPosition.Value.ToString()); });
        SaveOption<DevExpress.Web.ASPxHeadline.ImagePosition>("ImagePosition", delegate() { return (DevExpress.Web.ASPxHeadline.ImagePosition)Enum.Parse(typeof(DevExpress.Web.ASPxHeadline.ImagePosition), cbxImagePosition.Value.ToString()); });
        SaveOption<TailPosition>("TailPosition", delegate() { return (TailPosition)Enum.Parse(typeof(TailPosition), cbxTailPosition.Value.ToString()); });
        SaveOption<TailImagePosition>("TailImagePosition", delegate() { return (TailImagePosition)Enum.Parse(typeof(TailImagePosition), cbxTailImagePosition.Value.ToString()); });
        SaveOption<bool>("Disabled", delegate() { return chbDisabled.Checked; });
        SaveOption<bool>("Rtl", delegate() { return chbRtl.Checked; });
    }
    protected DataObject[] CreateDataSource() {
        int recordCount = 7;
        DataObject[] data = new DataObject[recordCount];
        for(int i = 0; i < recordCount; i++) {
            data[i] = new DataObject
            {
                Text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ligula mauris, suscipit ac aliquet in, tincidunt at dui. Integer at orci a orci laoreet tempus quis at nunc.",
                HeaderText = i == 1 ? "Long Long Long Long Long Long Long Header Text" : "Header Text",
                NavigateUrl = "#",
                ImageUrl = "~/Images/sample-image50x50.gif",
                Date = DateTime.Now.AddDays(i)
            };
        }
        return data;
    }
</script>
<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="phHead">
    <script type="text/javascript" src="Scripts/PreviewHelpers/Menu.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/PopupMenu.js"></script>
	<script type="text/javascript" src="Scripts/PreviewHelpers/Pager.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/DataView.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/NewsControl.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" runat="Server">
    <dx:ASPxNewsControl ID="ASPxNewsControl1" runat="server" TextField="Text" HeaderTextField="HeaderText"
        NavigateUrlField="NavigateUrl" ImageUrlField="ImageUrl" DateField="Date" ShowBackToTop="true"
        RowPerPage="2" ClientInstanceName="ASPxNewsControl1" Width="500px">
        <ClientSideEvents Init="function(s, e) { new ASPxNewsControlPreviewHelper(s); }" />
        <ItemSettings TailText="Tail Text">
        </ItemSettings>
        <PagerSettings NumericButtonCount="3" Position="TopAndBottom">
			<PageSizeItemSettings Visible="true" Items="2,4" />
        </PagerSettings>
    </dx:ASPxNewsControl>

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
            <td colspan="2">
                <dx:ASPxLabel runat="server" ID="lblPagerSettings" Text="Pager settings" CssClass="label" SkinID="Option" Font-Bold="true">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="ASPxLabel2" CssClass="label" SkinID="Option" Text="Ellipsis mode: "
                    AssociatedControlID="cbxEllipsisMode">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox SelectedIndex="1" ID="cbxEllipsisMode" runat="server" CssClass="editor dropDown" SkinID="Option"
                    AutoPostBack="True" Width="120px">
                    <Items>
                        <dx:ListEditItem Value="None" Text="None" />
                        <dx:ListEditItem Value="InsideNumeric" Text="InsideNumeric" />
                        <dx:ListEditItem Value="OutsideNumeric" Text="OutsideNumeric" />
                    </Items>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
           <td>
                <dx:ASPxLabel ID="lblPagerRenderMode" runat="server" SkinID="Option" CssClass="label" Text="Render mode:"
                    AssociatedControlID="cbxPagerRenderMode">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbxPagerRenderMode" SkinID="Option" CssClass="editor dropDown"
                    AutoPostBack="true" SelectedIndex="0" Width="120px">
                    <Items>
                        <dx:ListEditItem Text="Classic" Value="Classic"></dx:ListEditItem>
                        <dx:ListEditItem Text="Lightweight" Value="Lightweight"></dx:ListEditItem>
                    </Items>
                </dx:ASPxComboBox>
            </td> 
        </tr>
        <tr>
            <td colspan="2">
                <dx:ASPxLabel runat="server" ID="lblBehavior" Text="Behavior" CssClass="label" SkinID="Option" Font-Bold="true">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblShowContentAsLink" CssClass="label" SkinID="Option" Text="Show content as a link: "
                    AssociatedControlID="cbContentAsLink">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="cbContentAsLink" CssClass="editor" SkinID="Option"
                    AutoPostBack="true">
                </dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblHeaderAsLink" CssClass="label" SkinID="Option" Text="Show header as a link: "
                    AssociatedControlID="cbHeaderAsLink">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="cbHeaderAsLink" CssClass="editor" SkinID="Option"
                    AutoPostBack="true">
                </dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <dx:ASPxLabel runat="server" ID="lblLayout" Text="Layout" CssClass="label" SkinID="Option" Font-Bold="true">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
           <td>
                <dx:ASPxLabel ID="lblDateHorizontalPosition" runat="server" SkinID="Option" CssClass="label" Text="Date horizontal position:"
                    AssociatedControlID="cbxDateHorizontalPosition">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbxDateHorizontalPosition" SkinID="Option" CssClass="editor dropDown"
                    AutoPostBack="true" SelectedIndex="0" Width="120px">
                    <Items>
                        <dx:ListEditItem Text="Left" Value="Left"></dx:ListEditItem>
                        <dx:ListEditItem Text="Right" Value="Right"></dx:ListEditItem>
                        <dx:ListEditItem Text="OutsideLeft" Value="OutsideLeft"></dx:ListEditItem>
                        <dx:ListEditItem Text="OutsideRight" Value="OutsideRight"></dx:ListEditItem>
                    </Items>
                </dx:ASPxComboBox>
            </td> 
        </tr>
        <tr>
           <td>
                <dx:ASPxLabel ID="lblDateVerticalPosition" runat="server" SkinID="Option" CssClass="label" Text="Date vertical position:"
                    AssociatedControlID="cbxDateVerticalPosition">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbxDateVerticalPosition" SkinID="Option" CssClass="editor dropDown"
                    AutoPostBack="true" SelectedIndex="0" Width="120px">
                    <Items>
                        <dx:ListEditItem Text="Top" Value="Top"></dx:ListEditItem>
                        <dx:ListEditItem Text="Header" Value="Header"></dx:ListEditItem>
                        <dx:ListEditItem Text="BelowHeader" Value="BelowHeader"></dx:ListEditItem>
                        <dx:ListEditItem Text="Bottom" Value="Bottom"></dx:ListEditItem>
                    </Items>
                </dx:ASPxComboBox>
            </td> 
        </tr>
        <tr>
           <td>
                <dx:ASPxLabel ID="lblImagePosition" runat="server" SkinID="Option" CssClass="label" Text="Image position:"
                    AssociatedControlID="cbxImagePosition">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbxImagePosition" SkinID="Option" CssClass="editor dropDown"
                    AutoPostBack="true" SelectedIndex="0" Width="120px">
                    <Items>
                        <dx:ListEditItem Text="Left" Value="Left"></dx:ListEditItem>
                        <dx:ListEditItem Text="Right" Value="Right"></dx:ListEditItem>
                    </Items>
                </dx:ASPxComboBox>
            </td> 
        </tr>
        <tr>
           <td>
                <dx:ASPxLabel ID="lblTailPosition" runat="server" SkinID="Option" CssClass="label" Text="Tail position:"
                    AssociatedControlID="cbxTailPosition">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbxTailPosition" SkinID="Option" CssClass="editor dropDown"
                    AutoPostBack="true" SelectedIndex="0" Width="120px">
                    <Items>
                        <dx:ListEditItem Text="Inline" Value="Inline"></dx:ListEditItem>
                        <dx:ListEditItem Text="NewLine" Value="NewLine"></dx:ListEditItem>
                        <dx:ListEditItem Text="KeepWithLastWord" Value="KeepWithLastWord"></dx:ListEditItem>
                    </Items>
                </dx:ASPxComboBox>
            </td> 
        </tr>
        <tr>
           <td>
                <dx:ASPxLabel ID="lblTailImagePosition" runat="server" SkinID="Option" CssClass="label" Text="Tail image position:"
                    AssociatedControlID="cbxTailImagePosition">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbxTailImagePosition" SkinID="Option" CssClass="editor dropDown"
                    AutoPostBack="true" SelectedIndex="0" Width="120px">
                    <Items>
                        <dx:ListEditItem Text="AfterTailText" Value="AfterTailText"></dx:ListEditItem>
                        <dx:ListEditItem Text="BeforeTailText" Value="BeforeTailText"></dx:ListEditItem>
                    </Items>
                </dx:ASPxComboBox>
            </td> 
        </tr>
        <tr>
            <td colspan="2">
                <dx:ASPxLabel runat="server" ID="lblMisc" Text="Misc" CssClass="label" SkinID="Option" Font-Bold="true">
                </dx:ASPxLabel>
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
                <dx:ASPxLabel runat="server" ID="lblShowLoadingPanel" CssClass="label" SkinID="Option" Text="Show loading panel: " 
                    AssociatedControlID="chbShowLoadingPanel">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbShowLoadingPanel" CssClass="editor" SkinID="Option" ClientInstanceName="chbShowLoadingPanel">
                    <ClientSideEvents CheckedChanged="function(s,e){ ASPxTBHelper.SetControlLoadingPanelVisibility(ASPxNewsControl1, s.GetChecked()); }"
                        Init="function(s,e){ ASPxTBHelper.SetControlLoadingPanelVisibility(ASPxNewsControl1, s.GetChecked()); }" />
                </dx:ASPxCheckBox>
            </td>
        </tr>
    </table>
</asp:Content>
