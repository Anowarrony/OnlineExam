using System;
using System.Linq;
using System.Web.Security;
using OnlineExam.Models;


namespace OnlineExam
{
    public partial class UserLoginForm : System.Web.UI.Page
    {
        readonly OnlineExamDbConbtext _db = new OnlineExamDbConbtext();
        protected void Page_Load(object sender, EventArgs e)
        {
            MessageLabel.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var user =
                    _db.Users.SingleOrDefault(
                        x => x.Username.Equals(userNameTextBox.Text) && x.Password.Equals(passwordTextBox.Text));
            if (user != null)
            {
                FormsAuthentication.SetAuthCookie(user.Username, false);
                Session["authUserID"] = user.UserId;
                Response.Redirect("HomeForm.aspx");
            }
            else
            {
                MessageLabel.Text = "Invalid Username and Password combination";
            }
        }
    }
}