using System;
using System.Linq;
using System.Web.Security;
using OnlineExam.Models;


namespace OnlineExam
{
    public partial class AdminAccount : System.Web.UI.Page
    {
        readonly OnlineExamDbConbtext _db=new OnlineExamDbConbtext();
        protected void Page_Load(object sender, EventArgs e)
        {
            usernameLabel.Text = "";
            passLabel.Text = "";
            MessageLabel.Text = "";

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (userNameTextBox.Text=="")
            {
                usernameLabel.Text = "Enter User name";
            }
            if (passwordTextBox.Text == "")
            {
                passLabel.Text = "Enter Password";
            }
            if (userNameTextBox.Text != "")
            {
                usernameLabel.Text = "";
            }
            if (passwordTextBox.Text != "")
            {
                passLabel.Text = "";
            }
            if (userNameTextBox.Text != string.Empty && passwordTextBox.Text != string.Empty)
            {
                var user =
                    _db.AdminAccounts.SingleOrDefault(
                        x => x.Username.Equals(userNameTextBox.Text) && x.Password.Equals(passwordTextBox.Text));
                if (user!=null)
                {
                    FormsAuthentication.SetAuthCookie(user.Username,false);
                    Session["authAdmin"] = user.Username;
                    Response.Redirect("AdminIndex.aspx"); 
                }
                else
                {
                    MessageLabel.Text = "Invalid Username and Password combination";
                }
            }
        }
    }
}