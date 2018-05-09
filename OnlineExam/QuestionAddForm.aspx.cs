using System;
using System.Linq;
using OnlineExam.Models;


namespace OnlineExam
{
    public partial class QuestionAddForm : System.Web.UI.Page
    {
        OnlineExamDbConbtext _db = new OnlineExamDbConbtext();
        protected void Page_Load(object sender, EventArgs e)
        {
            QuestionAddSuccessLabel.Text = "";
            LabelQuestion.Text = "";
            LabelAns1.Text = "";
            LabelAns2.Text = "";
            LabelAns3.Text = "";
            LabelAns4.Text = "";
            LabelTrueAns.Text = "";
        }

    

        protected void BtnQuestionSubmit_Click(object sender, EventArgs e)
        {
            if (QuestionTextBox.Text=="")
            {
                LabelQuestion.Text = "This field required!";
            }
            if (Ans1TextBox.Text == "")
            {
                LabelAns1.Text = "This field required!";
            }
            if (Ans2TextBox.Text == "")
            {
                LabelAns2.Text = "This field required!";
            }
            if (Ans3TextBox.Text == "")
            {
                LabelAns3.Text = "This field required!";
            }
            if (Ans4TextBox.Text == "")
            {
                LabelAns4.Text = "This field required!";
            }
            if (TrueAnsTextBox.Text == "")
            {
                LabelTrueAns.Text = "This field required!";
            }

            if (QuestionTextBox.Text != "" && Ans1TextBox.Text != "" && Ans2TextBox.Text != "" && Ans3TextBox.Text != "" && Ans4TextBox.Text != "" && TrueAnsTextBox.Text != "")
            {
                var subjId = Convert.ToInt32(SubjectDropDownList.Text);
                var isQuestionExisted = _db.Questions.Any(q => q.QuestionDescription .Equals(QuestionTextBox.Text) && q.SubjectId.Equals(subjId));
                if (!isQuestionExisted)
                {
                    var objQuestion = new Question
                    {
                        SubjectId = subjId,
                        QuestionDescription = QuestionTextBox.Text,
                        Ans1 = Ans1TextBox.Text,
                        Ans2 = Ans2TextBox.Text,
                        Ans3 = Ans3TextBox.Text,
                        Ans4 = Ans4TextBox.Text,
                        TrueAns = Convert.ToInt32(TrueAnsTextBox.Text)
                    };
                    _db.Questions.Add(objQuestion);
                    _db.SaveChanges();
                    Ans1TextBox.Text = "";
                    Ans2TextBox.Text = "";
                    Ans3TextBox.Text = "";
                    Ans4TextBox.Text = "";
                    QuestionTextBox.Text = "";
                    TrueAnsTextBox.Text = "";
                    QuestionAddSuccessLabel.Text = "New question added successfully";
                }
                else
                {
                    LabelQuestion.Text = "This question already exist.";
                }
  
            }

        }
    }
}