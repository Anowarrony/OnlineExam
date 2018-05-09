using System;
using System.Linq;
using OnlineExam.Models;

namespace OnlineExam
{
    public partial class UserSignUpForm : System.Web.UI.Page
    {
        OnlineExamDbConbtext _db = new OnlineExamDbConbtext();
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "";
            Label2.Text = "";
            Label3.Text = ""; 
            Label4.Text = "";
            Label5.Text = "";
            Label6.Text = "";
            Label7.Text = "";
           
        }

        protected void BtnUserSignup_Click(object sender, EventArgs e)
        {
            if (UserNameTextBox.Text=="")
            {
                Label1.Text = "Required!";
            }
            if (PasswordTextBox.Text == "")
            {
                Label2.Text = "Required!";
            }
            if (ConfirmPasswordTextBox.Text == "")
            {
                Label3.Text = "Required!";
            }
            if (EmailTextBox.Text == "")
            {
                Label4.Text = "Required!";
            }
            if (AddressTextBox.Text == "")
            {
                Label5.Text = "Required!";
            }
            if (CountryDropDownList.Text == "")
            {
                Label6.Text = "Required!";
            }
            if (PhoneTextBox.Text == "")
            {
                Label7.Text = "Required!";
            }
            if (PasswordTextBox.Text !=ConfirmPasswordTextBox.Text)
            {
                Label3.Text = "Password don't match!";
            }
            if (PhoneTextBox.Text != "" && CountryDropDownList.Text != "" && AddressTextBox.Text != "" && EmailTextBox.Text != "" && ConfirmPasswordTextBox.Text != "" && PasswordTextBox.Text != "" && UserNameTextBox.Text != "")
            {
                if (PasswordTextBox.Text == ConfirmPasswordTextBox.Text)
                {
                    var isUserAlreadyExist = _db.Users.Any(c => c.Username == UserNameTextBox.Text);
                    if (!isUserAlreadyExist)
                    {
                        var objUser = new User
                        {
                            Username = UserNameTextBox.Text,
                            Password = PasswordTextBox.Text,
                            Email = EmailTextBox.Text,
                            Address = AddressTextBox.Text,
                            Phone = PhoneTextBox.Text,
                            Country = CountryDropDownList.Text
                        };
                        _db.Users.Add(objUser);
                        _db.SaveChanges();
                        Response.Redirect("UserLoginForm.aspx");
                    }
                    else
                    {
                        Label1.Text = "This Username already exist in database!";
                    }

                }
                
            }
        }
    }
}