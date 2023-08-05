<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>

<script runat="server">
    public class AppointmentDataObject {
        public int ID { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public string Subject { get; set; }
        public string RecurrenceInfo { get; set; }
        public string ReminderInfo { get; set; }
        public int EventType { get; set; }
        public int Label { get; set; }
        public int Status { get; set; }
        public int ResID { get; set; }
    }
    
    public class RecourseDataObject {
        public int ID { get; set; }
        public string Caption { get; set; }
    }

    DateTime startDate = new DateTime(2011, 8, 15, 0, 0, 0);
    
    protected void Page_Load(object sender, EventArgs e) {
        Scheduler.ActiveViewType =
            (DevExpress.XtraScheduler.SchedulerViewType)Enum.Parse(typeof(DevExpress.XtraScheduler.SchedulerViewType), cbxActiveView.Value.ToString());
        Scheduler.ClientSideEvents.ActiveViewChanged = "function(s, e) { cbxActiveView.SetValue(s.GetActiveViewType()); }";
        Scheduler.GroupType =
            (DevExpress.XtraScheduler.SchedulerGroupType)Enum.Parse(typeof(DevExpress.XtraScheduler.SchedulerGroupType), cbxGroupType.Value.ToString());
        Scheduler.OptionsForms.AppointmentFormVisibility =
            (SchedulerFormVisibility)Enum.Parse(typeof(SchedulerFormVisibility), cbxAppointmentFormVisibility.Value.ToString());
        Scheduler.OptionsForms.GotoDateFormVisibility =
            (SchedulerFormVisibility)Enum.Parse(typeof(SchedulerFormVisibility), cbxGotoDateFormVisibility.Value.ToString());

        Scheduler.ResourceDataSource = CreateResourceDataSource();
        Scheduler.AppointmentDataSource = CreateAppointmentDataSource();

        Scheduler.Start = startDate;
        Scheduler.DataBind();

        if(chbShowReminderForm.Checked)
            ShowReminderForm();
        
        ShowOptions();
    }
    protected override void LoadOptions() {
        LoadOption<DevExpress.XtraScheduler.SchedulerViewType>("ActiveView", delegate(DevExpress.XtraScheduler.SchedulerViewType value) { cbxActiveView.Value = Enum.GetName(typeof(DevExpress.XtraScheduler.SchedulerViewType), value); }, DevExpress.XtraScheduler.SchedulerViewType.Day);
        LoadOption<DevExpress.XtraScheduler.SchedulerGroupType>("GroupType", delegate(DevExpress.XtraScheduler.SchedulerGroupType value) { cbxGroupType.Value = Enum.GetName(typeof(DevExpress.XtraScheduler.SchedulerGroupType), value); }, DevExpress.XtraScheduler.SchedulerGroupType.Resource);
        LoadOption<SchedulerFormVisibility>("AppointmentFormVisibility", delegate(SchedulerFormVisibility value) { cbxAppointmentFormVisibility.Value = Enum.GetName(typeof(SchedulerFormVisibility), value); }, SchedulerFormVisibility.PopupWindow);
        LoadOption<SchedulerFormVisibility>("GotoDateFormVisibility", delegate(SchedulerFormVisibility value) { cbxGotoDateFormVisibility.Value = Enum.GetName(typeof(SchedulerFormVisibility), value); }, SchedulerFormVisibility.PopupWindow);
        LoadOption<bool>("ShowReminderForm", delegate(bool value) { chbShowReminderForm.Checked = value; }, false);
    }
    protected override void SaveOptions() {
        SaveOption<DevExpress.XtraScheduler.SchedulerViewType>("ActiveView", delegate() { return (DevExpress.XtraScheduler.SchedulerViewType)Enum.Parse(typeof(DevExpress.XtraScheduler.SchedulerViewType), cbxActiveView.Value.ToString()); });
        SaveOption<DevExpress.XtraScheduler.SchedulerGroupType>("GroupType", delegate() { return (DevExpress.XtraScheduler.SchedulerGroupType)Enum.Parse(typeof(DevExpress.XtraScheduler.SchedulerGroupType), cbxGroupType.Value.ToString()); });
        SaveOption<SchedulerFormVisibility>("AppointmentFormVisibility", delegate() { return (SchedulerFormVisibility)Enum.Parse(typeof(SchedulerFormVisibility), cbxAppointmentFormVisibility.Value.ToString()); });
        SaveOption<SchedulerFormVisibility>("GotoDateFormVisibility", delegate() { return (SchedulerFormVisibility)Enum.Parse(typeof(SchedulerFormVisibility), cbxGotoDateFormVisibility.Value.ToString()); });
        SaveOption<bool>("ShowReminderForm", delegate() { return chbShowReminderForm.Checked; });
    }

    protected void ShowReminderForm() {
        System.Reflection.MethodInfo showFormMethodInfo = typeof(ASPxScheduler).GetMethod("ShowForm", System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.NonPublic);
        showFormMethodInfo.Invoke(Scheduler, new object[] { DevExpress.Web.ASPxScheduler.Internal.SchedulerFormType.Reminder });
    }

    protected void Scheduler_RemindersFormShowing(object sender, EventArgs e) {
        chbShowReminderForm.Checked = false;
    }
    
    protected RecourseDataObject[] CreateResourceDataSource() {
        int count = 2;
        RecourseDataObject[] res = new RecourseDataObject[count];

        for(int i = 0; i < count; i++)
            res[i] = CreateResource(i, "Caption " + i);

        return res;
    }
    
    protected AppointmentDataObject[] CreateAppointmentDataSource() {
        int count = 20;
        AppointmentDataObject[] res = new AppointmentDataObject[count];

        res[0] = CreateAppointment(0, "Recurrence appointment", startDate, startDate.AddHours(1),
            @"<RecurrenceInfo Id=""51c81018-53fa-4d10-925f-2ed7f8408c75"" WeekDays=""127"" OccurenceCount=""5"" Range=""2"" Start=""8/15/2011 7:00:00"" End=""8/30/2012 7:00:00"" Type=""0"" Periodicity=""1"" />",
            1, 0, 1, 1
        );

        res[1] = CreateAppointment(1, "Recurrence Exception appointment", startDate.AddHours(12), startDate.AddHours(13),
            @"<RecurrenceInfo Id=""51c81018-53fa-4d10-925f-2ed7f8408c75"" Index='0' />", 3, 1, 2, 2);

        res[2] = CreateAppointment(0, "Recurrence appointment", startDate, startDate.AddHours(1),
            @"<RecurrenceInfo Id=""51c81018-53fa-4d10-925f-2ed7f8408c76"" WeekDays=""127"" OccurenceCount=""5"" Range=""2"" Start=""8/15/2011 7:00:00"" End=""8/15/2011 8:00:00"" Type=""0"" Periodicity=""1"" />",
            1, 0, 3, 3
        );

        int dateIncreaser = 0;
        for(int i = 3; i < count; i++) {
            DateTime start = startDate.AddDays(dateIncreaser).AddHours(9);
            dateIncreaser++;
            res[i] = CreateAppointment(i, "Simple appointment", start, start.AddHours(2), "", 0, 0, i + 1, i + 1);
        }

        return res;
    }

    protected RecourseDataObject CreateResource(int id, string caption) {
        return new RecourseDataObject {
            ID = id,
            Caption = caption
        };
    }

    protected AppointmentDataObject CreateAppointment(int id, string subject, DateTime? startDate, DateTime? endDate,
        string recurrenceInfo, int eventType, int resourceId, int label, int status) {
        return new AppointmentDataObject
        {
            ID = id,
            Subject = subject,
            StartDate = startDate,
            EndDate = endDate,
            RecurrenceInfo = recurrenceInfo,
            EventType = eventType,
            ResID = resourceId,
            Label = label,
            Status = status,
            ReminderInfo = "<Reminders><Reminder AlertTime=\"08/15/2012 11:55:18\" TimeBeforeStart=\"00:05:00\" /></Reminders>"
        };
    }
</script>

<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="phHead">
    <script type="text/javascript" src="Scripts/PreviewHelpers/CheckBox.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/PopupControl.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/Scheduler.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" runat="Server">
    <dx:ASPxScheduler runat="server" ID="Scheduler" GroupType="Resource" ClientInstanceName="scheduler"
        OnRemindersFormShowing="Scheduler_RemindersFormShowing">
        <ClientSideEvents Init="function(s, e) { new ASPxSchedulerPreviewHelper(s); }" />
        <ResourceNavigator EnableFirstLast="true" EnableIncreaseDecrease="true" EnablePrevNext="true"
            EnablePrevNextPage="true" EnableResourceComboBox="true" Visibility="Always"/>
        <Storage>
            <Resources>
                <Mappings ResourceId="ID" Caption="Caption" />
            </Resources>
            <Appointments> 
                <Mappings Start="StartDate" End="EndDate" Type="EventType" RecurrenceInfo="RecurrenceInfo" Subject="Subject"
                    ReminderInfo="ReminderInfo" AppointmentId="ID" ResourceId="ResID" Label="Label" Status="Status" />
            </Appointments>
        </Storage>
        <Views>
            <DayView ResourcesPerPage="2" VisibleTime-Start="05:00:00" VisibleTime-End="15:00:00">
                <DayViewStyles ScrollAreaHeight="250px" />
                <AppointmentDisplayOptions StartTimeVisibility="Always"
                    EndTimeVisibility="Always" ShowRecurrence="true" ShowReminder="true"
                    TimeDisplayType="Clock" StatusDisplayType="Bounds"/>
            </DayView>
            <WeekView ResourcesPerPage="1" ShowMoreButtons="true">
                <AppointmentDisplayOptions 
                    StartTimeVisibility="Auto"
                    EndTimeVisibility="Auto"
                    TimeDisplayType="Clock"
                    StatusDisplayType="Bounds"
                    ShowReminder="true"
                    ContinueArrowDisplayType="ArrowWithText"/>
            </WeekView>
            <WorkWeekView ResourcesPerPage="1" VisibleTime-Start="05:00:00" VisibleTime-End="15:00:00">
                <AppointmentDisplayOptions ShowReminder="true"/>
            </WorkWeekView>
            <MonthView ResourcesPerPage="1" ShowMoreButtons="true"></MonthView>
            <TimelineView ResourcesPerPage="1">
                <AppointmentDisplayOptions SnapToCellsMode="Always" ContinueArrowDisplayType="ArrowWithText"/>
            </TimelineView>
        </Views>
      
        <OptionsBehavior ShowDetailedErrorInfo="true" ShowRemindersForm="true" ShowTimeMarker="true"
            ShowViewNavigatorGotoDateButton="true" ShowViewSelector="true" ShowViewVisibleInterval="true" />
        <OptionsCustomization AllowAppointmentMultiSelect="true"  />
        <OptionsMenu EnableMenuScrolling="true" />
        <OptionsView  NavigationButtons-Visibility="Always" ShowOnlyResourceAppointments="false"/>
    </dx:ASPxScheduler>
     <script type="text/javascript">
        ASPxTBHelper.OnSelectionModeChanged = function (selectionMode) {
            if (!selectionMode)
                chbShowLoadingPanel.SetChecked(false);
        };
        ASPxTBHelper.OnPreviewHelpersReady = function() {
             scheduler.RecalcTimeMarker(); 
        };
    </script>
    </asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="phOptions" runat="server">
    <table>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblActiveView" runat="server" SkinID="Option" CssClass="label" Text="Active view type:"
                    AssociatedControlID="cbxActiveView">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbxActiveView" SkinID="Option" CssClass="editor dropDown"
                    AutoPostBack="true" SelectedIndex="0" Width="120px" ClientInstanceName="cbxActiveView">
                    <Items>
                        <dx:ListEditItem Text="Day" Value="Day"></dx:ListEditItem>
                        <dx:ListEditItem Text="Week" Value="Week"></dx:ListEditItem>
                        <dx:ListEditItem Text="Month" Value="Month"></dx:ListEditItem>
                        <dx:ListEditItem Text="WorkWeek" Value="WorkWeek"></dx:ListEditItem>
                        <dx:ListEditItem Text="Timeline" Value="Timeline"></dx:ListEditItem>
                    </Items>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblGroupType" runat="server" SkinID="Option" CssClass="label" Text="Group type:"
                    AssociatedControlID="cbxGroupType">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbxGroupType" SkinID="Option" CssClass="editor dropDown"
                    AutoPostBack="true" SelectedIndex="1" Width="120px">
                    <Items>
                        <dx:ListEditItem Text="None" Value="None"></dx:ListEditItem>
                        <dx:ListEditItem Text="Resource" Value="Resource"></dx:ListEditItem>
                        <dx:ListEditItem Text="Date" Value="Date"></dx:ListEditItem>                        
                    </Items>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblAppointmentFormVisibility" runat="server" SkinID="Option" CssClass="label" Text="Appointment form visibility:"
                    AssociatedControlID="cbxAppointmentFormVisibility">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbxAppointmentFormVisibility" SkinID="Option" CssClass="editor dropDown"
                    AutoPostBack="true" SelectedIndex="2" Width="120px">
                    <Items>
                        <dx:ListEditItem Text="None" Value="None"></dx:ListEditItem>
                        <dx:ListEditItem Text="FillControlArea" Value="FillControlArea"></dx:ListEditItem>
                        <dx:ListEditItem Text="PopupWindow" Value="PopupWindow"></dx:ListEditItem>                        
                    </Items>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblGotoDateFormVisibility" runat="server" SkinID="Option" CssClass="label" Text="GotoDate form visibility:"
                    AssociatedControlID="cbxGotoDateFormVisibility">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbxGotoDateFormVisibility" SkinID="Option" CssClass="editor dropDown"
                    AutoPostBack="true" SelectedIndex="2" Width="120px">
                    <Items>
                        <dx:ListEditItem Text="None" Value="None"></dx:ListEditItem>
                        <dx:ListEditItem Text="FillControlArea" Value="FillControlArea"></dx:ListEditItem>
                        <dx:ListEditItem Text="PopupWindow" Value="PopupWindow"></dx:ListEditItem>                        
                    </Items>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="ASPxLabel1" CssClass="label" SkinID="Option"
                    Text="Show reminder form:" AssociatedControlID="chbShowReminderForm">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbShowReminderForm" CssClass="editor" SkinID="Option"
                    ClientInstanceName="chbShowReminderForm" AutoPostBack="true">
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
                    <ClientSideEvents CheckedChanged="function(s, e) { ASPxTBHelper.SetControlLoadingPanelVisibility(scheduler, s.GetChecked()); }" 
                        Init="function(s,e){ ASPxTBHelper.SetControlLoadingPanelVisibility(scheduler, s.GetChecked()); }" />
                </dx:ASPxCheckBox>
            </td>
        </tr>
    </table>
</asp:Content>
