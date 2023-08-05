<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e) {
        ASPxImageSlider1.Enabled = !chbDisabled.Checked;
        ASPxImageSlider1.SettingsImageArea.NavigationDirection = (NavigationDirection)Enum.Parse(typeof(NavigationDirection), (string)cbxSlideAnimationDirection.Value);
        ASPxImageSlider1.SettingsNavigationBar.Mode = (NavigationBarMode)Enum.Parse(typeof(NavigationBarMode), (string)cbxNavigationBarMode.Value);
        ASPxImageSlider1.SettingsNavigationBar.Position = (NavigationBarPosition)Enum.Parse(typeof(NavigationBarPosition), (string)cbxNavigationBarPosition.Value);
        
        ShowOptions();
    }
    protected override void LoadOptions() {
        LoadOption<NavigationDirection>("SlideAnimationDirection", delegate(NavigationDirection value) { cbxSlideAnimationDirection.Value = Enum.GetName(typeof(NavigationDirection), value); }, NavigationDirection.Horizontal);
        LoadOption<NavigationBarMode>("NavigationBarMode", delegate(NavigationBarMode value) { cbxNavigationBarMode.Value = Enum.GetName(typeof(NavigationBarMode), value); }, NavigationBarMode.Thumbnails);
        LoadOption<NavigationBarPosition>("NavigationBarPosition", delegate(NavigationBarPosition value) { cbxNavigationBarPosition.Value = Enum.GetName(typeof(NavigationBarPosition), value); }, NavigationBarPosition.Bottom);
        LoadOption<bool>("Disabled", delegate(bool value) { chbDisabled.Checked = value; }, false);
    }
    protected override void SaveOptions() {
        SaveOption<NavigationDirection>("SlideAnimationDirection", delegate() { return (NavigationDirection)Enum.Parse(typeof(NavigationDirection), cbxSlideAnimationDirection.Value.ToString()); });
        SaveOption<NavigationBarMode>("NavigationBarMode", delegate() { return (NavigationBarMode)Enum.Parse(typeof(NavigationBarMode), cbxNavigationBarMode.Value.ToString()); });
        SaveOption<NavigationBarPosition>("NavigationBarPosition", delegate() { return (NavigationBarPosition)Enum.Parse(typeof(NavigationBarPosition), cbxNavigationBarPosition.Value.ToString()); });
        SaveOption<bool>("Disabled", delegate() { return chbDisabled.Checked; });
    }
</script>

<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" runat="Server">
   <dx:ASPxImageSlider ID="ASPxImageSlider1" runat="server" Width="400px" Height="300px">
        <Items>
            <dx:ImageSliderItem ImageUrl="~\Images\sample-image200x200.gif" ThumbnailUrl="~\Images\sample-image50x50.gif" />
            <dx:ImageSliderItem ImageUrl="~\Images\sample-image200x200.gif" ThumbnailUrl="~\Images\sample-image50x50.gif" />
            <dx:ImageSliderItem ImageUrl="~\Images\sample-image200x200.gif" ThumbnailUrl="~\Images\sample-image50x50.gif" />
            <dx:ImageSliderItem ImageUrl="~\Images\sample-image200x200.gif" ThumbnailUrl="~\Images\sample-image50x50.gif" />
            <dx:ImageSliderItem ImageUrl="~\Images\sample-image200x200.gif" ThumbnailUrl="~\Images\sample-image50x50.gif" />
            <dx:ImageSliderItem ImageUrl="~\Images\sample-image200x200.gif" ThumbnailUrl="~\Images\sample-image50x50.gif" />
            <dx:ImageSliderItem ImageUrl="~\Images\sample-image200x200.gif" ThumbnailUrl="~\Images\sample-image50x50.gif" />
            <dx:ImageSliderItem ImageUrl="~\Images\sample-image200x200.gif" ThumbnailUrl="~\Images\sample-image50x50.gif" />
        </Items>
    </dx:ASPxImageSlider>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="phOptions" runat="server">
    <table>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblSlideAnimationDirection" runat="server" SkinID="Option" CssClass="label" Text="Navigation Direction:"
                    AssociatedControlID="cbxSlideAnimationDirection">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbxSlideAnimationDirection" SkinID="Option" CssClass="editor dropDown"
                    AutoPostBack="true" SelectedIndex="0">
                    <Items>
                        <dx:ListEditItem Text="Horizontal" Value="Horizontal"></dx:ListEditItem>
                        <dx:ListEditItem Text="Vertical" Value="Vertical"></dx:ListEditItem>
                    </Items>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblNavigationBarMode" runat="server" SkinID="Option" CssClass="label" Text="Navigation Bar Mode:"
                    AssociatedControlID="cbxNavigationBarMode">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbxNavigationBarMode" SkinID="Option" CssClass="editor dropDown"
                    AutoPostBack="true" SelectedIndex="0">
                    <Items>
                        <dx:ListEditItem Text="Thumbnails" Value="Thumbnails"></dx:ListEditItem>
                        <dx:ListEditItem Text="Dots" Value="Dots"></dx:ListEditItem>
                    </Items>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblNavigationBarPosition" runat="server" SkinID="Option" CssClass="label" Text="Navigation Bar Position:"
                    AssociatedControlID="cbxNavigationBarPosition">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbxNavigationBarPosition" SkinID="Option" CssClass="editor dropDown"
                    AutoPostBack="true" SelectedIndex="0">
                    <Items>
                        <dx:ListEditItem Text="Bottom" Value="Bottom"></dx:ListEditItem>
                        <dx:ListEditItem Text="Top" Value="Top"></dx:ListEditItem>
                        <dx:ListEditItem Text="Left" Value="Left"></dx:ListEditItem>
                        <dx:ListEditItem Text="Right" Value="Right"></dx:ListEditItem>
                    </Items>
                </dx:ASPxComboBox>
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