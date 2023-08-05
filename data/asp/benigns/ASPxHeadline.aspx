<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e) {
        ASPxHeadline1.Enabled = !chbDisabled.Checked;
        ASPxHeadline1.RightToLeft = chbRtl.Checked ? DefaultBoolean.True : DefaultBoolean.False;
        RtlContainer.RightToLeft = ASPxHeadline1.RightToLeft;

        ASPxHeadline1.DateHorizontalPosition = (DateHorizontalPosition)Enum.Parse(typeof(DateHorizontalPosition),
            cbxDateHorizontalPosition.SelectedItem.Value.ToString());
        ASPxHeadline1.DateVerticalPosition = (DateVerticalPosition)Enum.Parse(typeof(DateVerticalPosition),
            cbxDateVerticalPosition.SelectedItem.Value.ToString());
        ASPxHeadline1.ImagePosition = (DevExpress.Web.ASPxHeadline.ImagePosition)Enum.Parse(typeof(DevExpress.Web.ASPxHeadline.ImagePosition),
            cbxImagePosition.SelectedItem.Value.ToString());
        ASPxHeadline1.TailPosition = (TailPosition)Enum.Parse(typeof(TailPosition),
            cbxTailPosition.SelectedItem.Value.ToString());
        ASPxHeadline1.TailImagePosition = (TailImagePosition)Enum.Parse(typeof(TailImagePosition),
            cbxTailImagePosition.SelectedItem.Value.ToString());
        ASPxHeadline1.ShowContentAsLink = cbContentAsLink.Checked;
        ASPxHeadline1.ShowHeaderAsLink = cbHeaderAsLink.Checked;
        
        ASPxHeadline1.Date = DateTime.Now;

        ShowOptions();
    }
    protected override void LoadOptions() {
        LoadOption<DateHorizontalPosition>("DateHorizontalPosition", delegate(DateHorizontalPosition value) { cbxDateHorizontalPosition.Value = Enum.GetName(typeof(DateHorizontalPosition), value); }, DateHorizontalPosition.Right);
        LoadOption<DateVerticalPosition>("DateVerticalPosition", delegate(DateVerticalPosition value) { cbxDateVerticalPosition.Value = Enum.GetName(typeof(DateVerticalPosition), value); }, DateVerticalPosition.Header);
        LoadOption<DevExpress.Web.ASPxHeadline.ImagePosition>("ImagePosition", delegate(DevExpress.Web.ASPxHeadline.ImagePosition value) { cbxImagePosition.Value = Enum.GetName(typeof(DevExpress.Web.ASPxHeadline.ImagePosition), value); }, DevExpress.Web.ASPxHeadline.ImagePosition.Left);
        LoadOption<TailPosition>("TailPosition", delegate(TailPosition value) { cbxTailPosition.Value = Enum.GetName(typeof(TailPosition), value); }, TailPosition.Inline);
        LoadOption<TailImagePosition>("TailImagePosition", delegate(TailImagePosition value) { cbxTailImagePosition.Value = Enum.GetName(typeof(TailImagePosition), value); }, TailImagePosition.AfterTailText);
        LoadOption<bool>("ContentAsLink", delegate(bool value) { cbContentAsLink.Checked = value; }, false);
        LoadOption<bool>("HeaderAsLink", delegate(bool value) { cbHeaderAsLink.Checked = value; }, false);
        LoadOption<bool>("Disabled", delegate(bool value) { chbDisabled.Checked = value; }, false);
        LoadOption<bool>("Rtl", delegate(bool value) { chbRtl.Checked = value; }, false);
    }
    protected override void SaveOptions() {
        SaveOption<DateHorizontalPosition>("DateHorizontalPosition", delegate() { return (DateHorizontalPosition)Enum.Parse(typeof(DateHorizontalPosition), cbxDateHorizontalPosition.Value.ToString()); });
        SaveOption<DateVerticalPosition>("DateVerticalPosition", delegate() { return (DateVerticalPosition)Enum.Parse(typeof(DateVerticalPosition), cbxDateVerticalPosition.Value.ToString()); });
        SaveOption<DevExpress.Web.ASPxHeadline.ImagePosition>("ImagePosition", delegate() { return (DevExpress.Web.ASPxHeadline.ImagePosition)Enum.Parse(typeof(DevExpress.Web.ASPxHeadline.ImagePosition), cbxImagePosition.Value.ToString()); });
        SaveOption<TailPosition>("TailPosition", delegate() { return (TailPosition)Enum.Parse(typeof(TailPosition), cbxTailPosition.Value.ToString()); });
        SaveOption<TailImagePosition>("TailImagePosition", delegate() { return (TailImagePosition)Enum.Parse(typeof(TailImagePosition), cbxTailImagePosition.Value.ToString()); });
        SaveOption<bool>("ContentAsLink", delegate() { return cbContentAsLink.Checked; });
        SaveOption<bool>("HeaderAsLink", delegate() { return cbHeaderAsLink.Checked; });
        SaveOption<bool>("Disabled", delegate() { return chbDisabled.Checked; });
        SaveOption<bool>("Rtl", delegate() { return chbRtl.Checked; });
    }
</script>

<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" runat="Server">
    <dx:ASPxHeadline ID="ASPxHeadline1" runat="server" Image-Url="~/Images/sample-image50x50.gif"  Width="500px"
        HeaderText="Sample Header Text" NavigateUrl="#" TailText="Sample Tail Text" TailPosition="NewLine"
        ContentText="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ligula mauris, suscipit ac aliquet in, tincidunt at dui. Integer at orci a orci laoreet tempus quis at nunc.">
    </dx:ASPxHeadline>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="phOptions" runat="server">
    <table>
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
            <td>
                <dx:ASPxLabel runat="server" ID="lblShowContentAsLink" CssClass="label" SkinID="Option" Text="Show content as a link:"
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
                <dx:ASPxLabel runat="server" ID="lblHeaderAsLink" CssClass="label" SkinID="Option" Text="Show header as a link:"
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
                <dx:ASPxCheckBox runat="server" ID="chbDisabled" SkinID="Option" Checked="false" CssClass="editor" AutoPostBack="true">
                </dx:ASPxCheckBox>
            </td>
        </tr>
    </table>
</asp:Content>