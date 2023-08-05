<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e) {
        LayoutGroup rootGroup = formLayout.Items[0] as LayoutGroup;        
        rootGroup.GroupBoxDecoration = (GroupBoxDecoration)Enum.Parse(typeof(GroupBoxDecoration), groupBoxDecorationComboBox.Text);
        formLayout.RightToLeft = chbRtl.Checked ? DefaultBoolean.True : DefaultBoolean.False;
        rootGroup.Items[rootGroup.Items.Count - 1].HorizontalAlign = chbRtl.Checked ? FormLayoutHorizontalAlign.Left : FormLayoutHorizontalAlign.Right;
        formLayoutContainer.Style[HtmlTextWriterStyle.TextAlign] = chbRtl.Checked ? "right" : "left";
        ShowOptions();
    }
   
    protected override void LoadOptions() {
        LoadOption<GroupBoxDecoration>("GroupBoxDecoration", delegate(GroupBoxDecoration value) { groupBoxDecorationComboBox.Text = value.ToString(); }, GroupBoxDecoration.Box);
        LoadOption<bool>("Rtl", delegate(bool value) { chbRtl.Checked = value; }, false);
    }
    protected override void SaveOptions() {
        SaveOption<GroupBoxDecoration>("GroupBoxDecoration", delegate() { return (GroupBoxDecoration)Enum.Parse(typeof(GroupBoxDecoration), groupBoxDecorationComboBox.Text); });
        SaveOption<bool>("Rtl", delegate() { return chbRtl.Checked; });
    }
</script>

<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" runat="Server">
    <div runat="server" id="formLayoutContainer">
        <dx:ASPxFormLayout runat="server" ID="formLayout" RequiredMarkDisplayMode="All">
            <Items>
                <dx:LayoutGroup Caption="Group Caption">
                    <Items>
                        <dx:LayoutItem Caption="Name:" HelpText="Please, enter your login name">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxTextBox runat="server" ID="nameTextBox" Width="200" ClientInstanceName="clientNameTextBox">
                                        <ValidationSettings RequiredField-IsRequired="true" Display="Dynamic" ErrorDisplayMode="Text" />
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Email:" HelpText="Please, enter your e-mail">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxTextBox runat="server" ID="emailTextBox" Width="200">
                                        <ValidationSettings RequiredField-IsRequired="true" Display="Dynamic" ErrorDisplayMode="Text" />
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Description:" HelpText="Leave a little bit of information</br>about yourself">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxMemo runat="server" ID="descriptionMemo" Width="200" Height="50" />
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:TabbedLayoutGroup Width="100%">
                            <Items>
                                <dx:LayoutGroup Caption="Tab1">
                                    <Items>
                                        <dx:LayoutItem Caption="Item1">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer>                                            
                                                    <dx:ASPxTextBox runat="server" Width="100%" />
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>    
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:LayoutGroup>
                                <dx:LayoutGroup Caption="Tab2">
                                    <Items>
                                        <dx:LayoutItem Caption="Item2">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer>                                            
                                                    <dx:ASPxTextBox runat="server" Width="100%" />
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>    
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:LayoutGroup>
                            </Items>
                        </dx:TabbedLayoutGroup>
                        <dx:EmptyLayoutItem />
                        <dx:LayoutItem ShowCaption="false" Width="100" RequiredMarkDisplayMode="Hidden">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxButton runat="server" ID="submitButton" Text="Submit" Width="100" />
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:LayoutGroup> 
            </Items>
        </dx:ASPxFormLayout>
    </div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="phOptions" runat="server">
    <table>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" SkinID="Option" CssClass="label" Text="Right to left:" AssociatedControlID="chbRtl" />
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbRtl" AutoPostBack="true" SkinID="Option" CssClass="editor" />
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" SkinID="Option" CssClass="label" Text="Group Box Decoration:" AssociatedControlID="groupBoxDecorationComboBox" />
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="groupBoxDecorationComboBox" SelectedIndex="0" AutoPostBack="true" SkinID="Option" CssClass="editor">
                    <Items>
                        <dx:ListEditItem Text="Box" Value="0" />
                        <dx:ListEditItem Text="HeadingLine" Value="1" />
                        <dx:ListEditItem Text="None" Value="2" />
                    </Items>
                </dx:ASPxComboBox> 
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        if (clientHelpTextsDisplayMode.GetSelectedIndex() === 1)
            clientNameTextBox.helpTextObj.show();
    </script>   
</asp:Content>
