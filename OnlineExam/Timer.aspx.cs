using System;

namespace OnlineExam
{
    public partial class Timer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
          
            if (!SM1.IsInAsyncPostBack)

                Session["timeout"] = DateTime.Now.AddSeconds(70).ToString();
        }

        protected void timer1_tick(object sender, EventArgs e)
        {

            if (0 > DateTime.Compare(DateTime.Now, DateTime.Parse(Session["timeout"].ToString())))
            {
                lblTimer.Text = string.Format("Time Left: 00:{0}:{1}", ((Int32)DateTime.Parse(Session["timeout"].ToString()).Subtract(DateTime.Now).TotalMinutes).ToString(), ((Int32)DateTime.Parse(Session["timeout"].ToString()).Subtract(DateTime.Now).Seconds).ToString());
            }
            else
            {
                timer1.Enabled = true;
                Response.Redirect("Logout.aspx");

            }
        }
    }
}