<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewPartner.aspx.cs" Inherits="QLDoiTacQuocTe.NewPartner" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .dxucControl_Aqua,
.dxucEditArea_Aqua
{
	font: 12px Tahoma, Geneva, sans-serif;
}
.dxucTextBox_Aqua
{
	background-color: white;
	border: 1px solid #AECAF0;
	padding: 1px 2px;
}
.dxucTextBox_Aqua .dxucEditArea_Aqua
{
	margin: 0px;
	background-color: white;
}

.dxWeb_ucClearButton_Aqua {
    background-position: -100px -123px;
    width: 16px;
    height: 16px;
}
.dxWeb_rpHeaderTopLeftCorner_Aqua,
.dxWeb_rpHeaderTopRightCorner_Aqua,
.dxWeb_rpBottomLeftCorner_Aqua,
.dxWeb_rpBottomRightCorner_Aqua,
.dxWeb_rpTopLeftCorner_Aqua,
.dxWeb_rpTopRightCorner_Aqua,
.dxWeb_rpGroupBoxBottomLeftCorner_Aqua,
.dxWeb_rpGroupBoxBottomRightCorner_Aqua,
.dxWeb_rpGroupBoxTopLeftCorner_Aqua,
.dxWeb_rpGroupBoxTopRightCorner_Aqua,
.dxWeb_mHorizontalPopOut_Aqua,
.dxWeb_mVerticalPopOut_Aqua,
.dxWeb_mVerticalPopOutRtl_Aqua,
.dxWeb_mSubMenuItem_Aqua,
.dxWeb_mSubMenuItemChecked_Aqua,
.dxWeb_mScrollUp_Aqua,
.dxWeb_mScrollUpDisabled_Aqua,
.dxWeb_mScrollDown_Aqua,
.dxWeb_mScrollDownDisabled_Aqua,
.dxWeb_tcScrollLeft_Aqua,
.dxWeb_tcScrollRight_Aqua,
.dxWeb_tcScrollLeftHover_Aqua,
.dxWeb_tcScrollRightHover_Aqua,
.dxWeb_tcScrollLeftPressed_Aqua,
.dxWeb_tcScrollRightPressed_Aqua,
.dxWeb_tcScrollLeftDisabled_Aqua,
.dxWeb_tcScrollRightDisabled_Aqua,
.dxWeb_nbCollapse_Aqua,
.dxWeb_nbExpand_Aqua,
.dxWeb_splVSeparator_Aqua,
.dxWeb_splVSeparatorHover_Aqua,
.dxWeb_splHSeparator_Aqua,
.dxWeb_splHSeparatorHover_Aqua,
.dxWeb_splVCollapseBackwardButton_Aqua,
.dxWeb_splVCollapseBackwardButtonHover_Aqua,
.dxWeb_splHCollapseBackwardButton_Aqua,
.dxWeb_splHCollapseBackwardButtonHover_Aqua,
.dxWeb_splVCollapseForwardButton_Aqua,
.dxWeb_splVCollapseForwardButtonHover_Aqua,
.dxWeb_splHCollapseForwardButton_Aqua,
.dxWeb_splHCollapseForwardButtonHover_Aqua,
.dxWeb_pcCloseButton_Aqua,
.dxWeb_pcPinButton_Aqua,
.dxWeb_pcRefreshButton_Aqua,
.dxWeb_pcCollapseButton_Aqua,
.dxWeb_pcMaximizeButton_Aqua,
.dxWeb_pcSizeGrip_Aqua,
.dxWeb_pcSizeGripRtl_Aqua,
.dxWeb_pPopOut_Aqua,
.dxWeb_pPopOutDisabled_Aqua,
.dxWeb_pPopOutHover_Aqua,
.dxWeb_pPopOutPressed_Aqua,
.dxWeb_pAll_Aqua,
.dxWeb_pAllDisabled_Aqua,
.dxWeb_pPrev_Aqua,
.dxWeb_pPrevDisabled_Aqua,
.dxWeb_pNext_Aqua,
.dxWeb_pNextDisabled_Aqua,
.dxWeb_pLast_Aqua,
.dxWeb_pLastDisabled_Aqua,
.dxWeb_pFirst_Aqua,
.dxWeb_pFirstDisabled_Aqua,
.dxWeb_tiBackToTop_Aqua,
.dxWeb_smBullet_Aqua,
.dxWeb_tvColBtn_Aqua,
.dxWeb_tvColBtnRtl_Aqua,
.dxWeb_tvExpBtn_Aqua,
.dxWeb_tvExpBtnRtl_Aqua,
.dxWeb_fmFolder_Aqua,
.dxWeb_fmFolderLocked_Aqua,
.dxWeb_fmCreateButton_Aqua,
.dxWeb_fmMoveButton_Aqua,
.dxWeb_fmRenameButton_Aqua,
.dxWeb_fmDeleteButton_Aqua,
.dxWeb_fmRefreshButton_Aqua,
.dxWeb_fmDwnlButton_Aqua,
.dxWeb_fmCreateButtonDisabled_Aqua,
.dxWeb_fmMoveButtonDisabled_Aqua,
.dxWeb_fmRenameButtonDisabled_Aqua,
.dxWeb_fmDeleteButtonDisabled_Aqua,
.dxWeb_fmRefreshButtonDisabled_Aqua,
.dxWeb_fmDwnlButtonDisabled_Aqua,
.dxWeb_ucClearButton_Aqua,
.dxWeb_ucClearButtonDisabled_Aqua,
.dxWeb_isPrevBtnHor_Aqua,
.dxWeb_isNextBtnHor_Aqua,
.dxWeb_isPrevBtnVert_Aqua,
.dxWeb_isNextBtnVert_Aqua,
.dxWeb_isPrevPageBtnHor_Aqua,
.dxWeb_isNextPageBtnHor_Aqua,
.dxWeb_isPrevPageBtnVert_Aqua,
.dxWeb_isNextPageBtnVert_Aqua,
.dxWeb_isPrevBtnHorDisabled_Aqua,
.dxWeb_isNextBtnHorDisabled_Aqua,
.dxWeb_isPrevBtnVertDisabled_Aqua,
.dxWeb_isNextBtnVertDisabled_Aqua,
.dxWeb_isPrevPageBtnHorDisabled_Aqua,
.dxWeb_isNextPageBtnHorDisabled_Aqua,
.dxWeb_isPrevPageBtnVertDisabled_Aqua,
.dxWeb_isNextPageBtnVertDisabled_Aqua,
.dxWeb_isDot_Aqua,
.dxWeb_isDotDisabled_Aqua,
.dxWeb_isDotSelected_Aqua,
.dxWeb_fmGvHeaderFilter_Aqua,
.dxWeb_fmGvHeaderFilterActive_Aqua,
.dxWeb_fmThumbnailCheck_Aqua
 {
    background-repeat: no-repeat;
    background-color: transparent;
    display:block;
}
.dxucBrowseButton_Aqua
{
	padding: 3px 11px 4px;
	border: 1px solid #A3C0E8;	
}
.dxucBrowseButton_Aqua,
.dxucBrowseButton_Aqua a
{
	color: #2C4D79;
	cursor: pointer;
	white-space: nowrap;
	text-decoration: none;
}
.dxucControl_Aqua .dxucBrowseButton_Aqua a
{
	color: #2C4D79;
}
.dxbButton_Aqua
{
	color: #2C4D79;
	font: normal 12px Tahoma, Geneva, sans-serif;
	vertical-align: middle;
	border: 1px solid #A3C0E8;	
	padding: 1px;
	cursor: pointer;
}
.dxeTrackBar_Aqua, 
.dxeIRadioButton_Aqua, 
.dxeButtonEdit_Aqua, 
.dxeTextBox_Aqua, 
.dxeRadioButtonList_Aqua, 
.dxeCheckBoxList_Aqua, 
.dxeMemo_Aqua, 
.dxeListBox_Aqua, 
.dxeCalendar_Aqua, 
.dxeColorTable_Aqua
{
	-webkit-tap-highlight-color: rgba(0,0,0,0);
}

.dxeTextBox_Aqua,
.dxeButtonEdit_Aqua,
.dxeIRadioButton_Aqua,
.dxeRadioButtonList_Aqua,
.dxeCheckBoxList_Aqua
{
    cursor: default;
}

.dxeTextBox_Aqua,
.dxeMemo_Aqua
{
	background-color: White;
	border: 1px Solid #AECAF0;
}
.dxeTextBoxSys, 
.dxeMemoSys 
{
    border-collapse:separate!important;
}

.dxeTextBoxSys td.dxic 
{
    *padding-left: 3px;
    *padding-top: 2px;
    *padding-bottom: 1px;
}

.dxeTextBoxSys td.dxic,
.dxeButtonEditSys td.dxic 
{
    padding: 3px 3px 2px 3px;
    overflow: hidden;
}

.dxeButtonEditSys .dxeEditAreaSys,
.dxeButtonEditSys td.dxic,
.dxeTextBoxSys td.dxic,
.dxeMemoSys td,
.dxeEditAreaSys
{
	width: 100%;
}

td.dxic
{
	font-size: 0;
}
.dxeTextBox_Aqua .dxeEditArea_Aqua
{
	background-color: White;
}
.dxeEditArea_Aqua
{
	font: 12px Tahoma, Geneva, sans-serif;
	border: 1px solid #A0A0A0;
}

.dxeEditAreaSys 
{
    height: 14px;
    line-height: 14px;
    border: 0px!important;
	padding: 0px 1px 0px 0px; /* B146658 */
    background-position: 0 0; /* iOS Safari */
}
.dxeMemoSys td 
{ 
    *padding: 0px; 
}
.dxeMemoSys td 
{
    padding-right: 7px\0/;
}
.dxeMemoSys td 
{
    padding: 0px 6px 0px 0px;
}
.dxeMemoEditArea_Aqua
{
	background-color: White;
	font: 12px Tahoma, Geneva, sans-serif;
	outline: none;
}

.dxeMemoEditAreaSys 
{
    *margin: -1px 0px;
    *padding-right: 4px;
}
.dxeMemoEditAreaSys 
{
    padding-right: 4px\0/;
}
.dxeMemoEditAreaSys 
{
    padding: 3px 3px 0px 3px;
    margin: 0px;
    border-width: 0px;
	display: block;
	resize: none;
}
        .auto-style1
        {
            width: 67px;
        }
    </style>
</head>
<body>
    <span style="color: #0000FF; font-family: Tahoma; font-size: medium"><strong>Register New Partner Infomation</strong></span><form id="form1" runat="server">
    <table style="width: 73%">
        <tr>
            <td style="margin-left: 40px;" class="auto-style1">Country</td>
            <td>
                <dx:ASPxComboBox ID="cboCountry" runat="server" DataSourceID="SqlDataSource1" TextField="Country_Name" ValueField="Country_ID">
                </dx:ASPxComboBox>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QLDoiTacConnectionString %>" SelectCommand="SELECT [Country_ID], [Country_Name] FROM [Countries] ORDER BY [Country_Name]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="margin-left: 40px;" class="auto-style1">Logo<br />
                <dx:ASPxImage ID="ASPxImagePartnerLogo" runat="server" Height="240px" Width="320px">
                </dx:ASPxImage>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="margin-left: 40px;" class="auto-style1">
                <dx:ASPxUploadControl ID="ASPxUploadPartnerLogo" runat="server"  Width="320px" Height="16px">
                </dx:ASPxUploadControl>
            </td>
            <td>
                <dx:ASPxButton ID="btnUploadPartnerLogo" runat="server" OnClick="btnUploadPartnerLogo_Click" Text="Upload Image">
                </dx:ASPxButton>
            </td>
        </tr>
    </table>
    <br />
    <table style="width: 100%">
        <tr>
            <td style="width: 173px">Partner Name</td>
            <td>
                <dx:ASPxTextBox ID="txtPartnerName" runat="server" Width="100%">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 173px; height: 23px;">Partner Address</td>
            <td style="height: 23px">
                <dx:ASPxTextBox ID="txtPartnerAddress" runat="server" Width="100%">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 173px">Partner Phone</td>
            <td>
                <dx:ASPxTextBox ID="txtPartnerPhone" runat="server" Width="100%">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 173px">Parter Fax</td>
            <td>
                <dx:ASPxTextBox ID="txtPartnerFax" runat="server" Width="100%">
                </dx:ASPxTextBox>

            </td>
        </tr>
        <tr>
            <td style="width: 173px">Email</td>
            <td>
                <dx:ASPxTextBox ID="txtPartnerEmail" runat="server" Width="100%">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 173px">Website</td>
            <td>
                <dx:ASPxTextBox ID="txtPartnerWebsite" runat="server" Width="100%">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 173px">Sector</td>
            <td>
                <dx:ASPxTextBox ID="txtPartnerSector" runat="server" Width="100%">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 173px">Product</td>
            <td>
                <dx:ASPxTextBox ID="txtPartnerProduct" runat="server" Width="100%">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 173px">Contact Name</td>
            <td>
                <dx:ASPxTextBox ID="txtPartnerContactName" runat="server" Width="100%">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 173px">Contact Phone</td>
            <td>
                <dx:ASPxTextBox ID="txtPartnerContactPhone" runat="server" Width="100%">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 173px">Contact Email</td>
            <td>
                <dx:ASPxTextBox ID="txtPartnerContactEmail" runat="server" Width="100%">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 173px">Other Infomation</td>
            <td>
                <dx:ASPxMemo ID="txtPartnerOtherInfo" runat="server" Height="71px" Theme="Aqua" Width="100%">
                </dx:ASPxMemo>
            </td>
        </tr>
        <tr>
            <td style="width: 168px; height: 27px;"></td>
            <td style="height: 27px">
                <dx:ASPxButton ID="btnPartnerSave" runat="server" Text="Save" OnClick="btnPartnerSave_Click">
                </dx:ASPxButton>
            </td>
        </tr>
    </table>

    <div>
    
    </div>
    </form>
</body>
</html>
