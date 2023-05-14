<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AlipayBind.aspx.cs" Inherits="Kesion.NET.WebSite.Api.alipay.AlipayBind" %>
<%@ Import Namespace="Kesion.Cache"%>
<%@ Import Namespace="Kesion.Publics"%>
<%@ Import Namespace="Kesion.BLL"%>
<%@ Import Namespace="System.Text"%>
<%@ Import Namespace="System.Data"%>


<script runat="server" type="text/C#">
    protected void Page_Load(object sender, EventArgs e)

    {
        if (MyCache.GetAccountAPIConfig("alipay", "enable") != "true")
        {
            Utils.ShowError("对不起，本站没有开通支付宝快捷登录!", "error.gif", 2, KSCMS.GetInstallDir());
        }


        if (Session["alipay_user_id"] == null || Session["alipay_token"] == null)
        {
            Utils.ShowError("没有返回uid!", "error.gif", 2, KSCMS.GetInstallDir());
        }
        else
        {
            string action = KSCMS.S("action");
            if (action == "check")
            {
                Kesion.NET.WebSite.APPCode.Api.CommonCls.BindByAlipay();

            }else if (action=="doreg"){

                Kesion.NET.WebSite.APPCode.Api.CommonCls.DoRegSave(3);

            }else{

                string nickname = Utils.FilterUserName(Session["real_name"].ToString());
                string sex = "男";
                string face = KSCMS.GetInstallDir() + "user/images/0.gif";

                using (DataTable dt = DataFactoryUser.GetDataTable("select top 1 * From KS_User Where alipayid='" + Utils.ChkSQL(Session["alipay_user_id"].ToString()) + "'"))
                {
                    if (dt.Rows.Count <= 0)
                    {
                       if (CheckUserLogin.Check() == "success" && !string.IsNullOrEmpty(new TemporaryVar().UserName) && DataFactoryUser.Exists("KS_User", "username='" + Utils.ChkSQL(new TemporaryVar().UserName) + "'"))
                        {
                            DataFactoryUser.ExecuteNonQuery(string.Format(@"Update KS_User Set alipayid='{0}' Where UserName='{1}'", Session["alipay_user_id"].ToString(), (new TemporaryVar()).UserName));
                            Session["userinfo"] = null;

                            Response.Redirect(Kesion.HtmlTags.BasicField.GetRewriteUrl("user"));

                        }
                        else
                        {
                            Kesion.NET.WebSite.APPCode.Api.CommonCls.DoBind(3, "使用支付宝快捷登录!", nickname, face, sex, Session["alipay_user_id"].ToString());
                        }
                    }
                    else
                    {

                        DataRow dr = dt.Rows[0];

                        Kesion.NET.WebSite.APPCode.Api.CommonCls.DoLogin(dr["username"].ToString(), dr["password"].ToString());
                        // JS.Message("恭喜，通过支付宝快捷登录成功！", "success.gif", string.Format(@"location.href='{0}';", Kesion.NET.WebSite.APPCode.Api.CommonCls.GetLoginSuccessTurnUrl));
                        if (Utils.IsMobileDevice())
                        {
                           Response.Redirect(Kesion.HtmlTags.BasicField.GetRewriteUrl("user"));
                            // JS.Alert("恭喜，通过支付宝快捷登录成功！", string.Format(@"{0}/user/index.aspx", KSCMS.GetInstallDir() + MyCache.GetCacheConfig(73)));
                        }
                        else
                        {
                            string backurl = new TemporaryVar().ComeUrl;
                            if (string.IsNullOrEmpty(backurl)) backurl = Kesion.HtmlTags.BasicField.GetRewriteUrl("user");
                            if (backurl.ToLower().IndexOf("login.aspx") != -1) backurl = Kesion.HtmlTags.BasicField.GetRewriteUrl("user");
                            if (backurl.ToLower().IndexOf("getpass.aspx") != -1) backurl = Kesion.HtmlTags.BasicField.GetRewriteUrl("user");
                            if (backurl.ToLower().IndexOf("activateuser.aspx") != -1) backurl = Kesion.HtmlTags.BasicField.GetRewriteUrl("user");
                            Response.Redirect(backurl);
                            //JS.Alert("恭喜，通过支付宝快捷登录成功！", backurl);
                        }
                    }
                }



            }

        }

    }


</script>