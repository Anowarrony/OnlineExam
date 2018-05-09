using System;
using System.Web.Security;


namespace OnlineExam
{
    public partial class UserSignoutForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            switch (Request.QueryString["reqUser"])
            {
                case "admin":
                    Session["authAdmin"] = null;
                    break;
                default:
                    Session["authUserID"] = null;
                    break;
            }
            FormsAuthentication.SignOut();

            Session["authAdmin"] = null;

            FormsAuthentication.SignOut();
            
            Session.Clear(); Session.RemoveAll();
   
       Response.Redirect("HomeForm.aspx");
        }
    }
}