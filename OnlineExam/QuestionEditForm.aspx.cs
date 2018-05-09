using System;
using System.Data.Entity;
using System.Linq;
using OnlineExam.Models;


namespace OnlineExam
{
    public partial class QuestionEditForm : System.Web.UI.Page
    {
        private readonly OnlineExamDbConbtext _db = new OnlineExamDbConbtext();
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                int qid = Convert.ToInt32(Request.QueryString["qid"]);
                int sid = Convert.ToInt32(Request.QueryString["sid"]);
                var subject =
                    _db.Subjects.Single(id => id.SubjectId.Equals(sid))
                        .SubjectName;
                SubjectDropdownlistHiddenField.Value = subject;
                var objQuestionEdit = _db.Questions.Find(qid);

                QuestionHiddenTextBox.Value = objQuestionEdit.QuestionDescription;
                Ans1HiddenTextBox.Value = objQuestionEdit.Ans1;
                Ans2HiddenTextBox.Value = objQuestionEdit.Ans2;
                Ans3HiddenTextBox.Value = objQuestionEdit.Ans3;
                Ans4HiddenTextBox.Value = objQuestionEdit.Ans4;
                TrueAnsHiddenTextBox.Value = objQuestionEdit.TrueAns.ToString();
            }
            catch (Exception exception)
            {
                
         
            }
       

        }

        protected void BtnQuestionEdit_Click(object sender, EventArgs e)
        {


            try
            {
                int qid = Convert.ToInt32(Request.QueryString["qid"]);

                var editObj = _db.Questions.Find(qid);



                editObj.QuestionDescription = Request.Form["QuestionTextBox"];
                editObj.SubjectId = Convert.ToInt32(this.SubjectDropDownList.Text);

                editObj.Ans1 = Request.Form["Ans1TextBox"];
                editObj.Ans2 = Request.Form["Ans2TextBox"];
                editObj.Ans3 = Request.Form["Ans3TextBox"];
                editObj.Ans4 = Request.Form["Ans4TextBox"];
                editObj.TrueAns = Convert.ToInt32(Request.Form["TrueAnsTextBox"]);
                _db.Entry(editObj).State = EntityState.Modified;
                _db.SaveChanges();

                Response.Redirect("AdminIndex.aspx");
            }
            catch (Exception exception)
            {
                
            
            }
        }

     

      

       
    }

  
}