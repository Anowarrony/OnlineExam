using System;
using System.Linq;
using OnlineExam.Models;

namespace OnlineExam
{
    public partial class UserResultForm : System.Web.UI.Page
    {
        readonly OnlineExamDbConbtext _db = new OnlineExamDbConbtext();
        protected void Page_Load(object sender, EventArgs e)
        {
            int authUserId = Convert.ToInt32(Session["authUserID"]);

            int sid = Convert.ToInt32(Request.QueryString["sid"]);
            GetUserResult(authUserId, sid);
        }

        private void GetUserResult(int userId, int subjectId)
        {
            var trueAns = (from u in _db.UserAnswers
                      join q in _db.Questions
                      on u.UserAns equals q.TrueAns
                      where u.UserId == userId
                      where u.SubjectId == subjectId
                      where u.QuestionId == q.QuestionId
                      select (u.UserAns)).Count();


            float passMark=0f;
    
            float totalMark=0f;
            float userScore = 0f;


            int toalaQuestion = _db.Questions.Count(c => c.SubjectId.Equals(subjectId));

            var getPassMark = _db.Subjects.SingleOrDefault(c => c.SubjectId.Equals(subjectId)).PassMark;
            var getMarkPerQuestion = _db.Subjects.SingleOrDefault(c => c.SubjectId.Equals(subjectId)).MarkPerQuestion;

            if (getMarkPerQuestion != null)
            {
                userScore = (float) (trueAns*getMarkPerQuestion);
                totalMark = (float) (toalaQuestion*getMarkPerQuestion.Value);
            }
            else
            {
                userScore = trueAns;
                totalMark = toalaQuestion;
            }
            if (getPassMark!=null)
            {
                passMark = getPassMark.Value*totalMark/100;
            }
            else
            {
                passMark = (33 * totalMark) / 100;
            }
           


            ReultMsgLabel.Visible = true;
            SubjectLabel.Visible = true;
            TotalQuestionLabel.Visible = true;
            PassMarkLabel.Visible = true;
            UserScoreLabel.Visible = true;
            PercentageShowLabel.Visible = true;
            ReultMsgLabel.Text = userScore >= passMark ? "<img src='Content/Ok.png' width='30'/>  Congratulations! You have passed in this test." : "<img src='Content/dialog_cancel.png' width='30'/> Sorry You have failed.Don't be sad.Try again later.";
            SubjectLabel.Text = _db.Subjects.First(c => c.SubjectId == subjectId).SubjectName;
            TotalQuestionLabel.Text = toalaQuestion.ToString();
            PassMarkLabel.Text = passMark.ToString();
            UserScoreLabel.Text = userScore.ToString();
            PercentageShowLabel.Text = ( userScore* 100 / totalMark).ToString();
            if (userScore * 100 / totalMark>=90)
            {
                RemarkLabel.Text = "Excellent";
            }
            else if (80 <= userScore * 100 / totalMark && userScore * 100 / totalMark < 90)
            {
                RemarkLabel.Text = "Very Good";
            }
            else if (70 <= userScore * 100 / totalMark && userScore * 100 / totalMark <80)
            {
                RemarkLabel.Text = "Good";
            }
            else if (60 <= userScore * 100 / totalMark && userScore * 100 / totalMark < 70)
            {
                RemarkLabel.Text = "Not bad";
            }
            else if (50 <= userScore * 100 / totalMark && userScore * 100 / totalMark < 60)
            {
                RemarkLabel.Text = "Average";
            }
            else if (40 <= userScore * 100 / totalMark && userScore * 100 / totalMark <50)
            {
                RemarkLabel.Text = " Poor";
            }
            else
            {
                RemarkLabel.Text = "Very Poor";
            }
        }

        protected void QuestionReviewButton_Click(object sender, EventArgs e)
        {
            int sid = Convert.ToInt32(Request.QueryString["sid"]);
            Response.Redirect("ReviewQuestion.aspx?sid="+sid);
        }
    }
}