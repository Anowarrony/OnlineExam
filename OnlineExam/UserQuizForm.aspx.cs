using System;
using System.Linq;
using OnlineExam.Models;


namespace OnlineExam
{
    public partial class UserQuizForm : System.Web.UI.Page
    {
        readonly OnlineExamDbConbtext _db = new OnlineExamDbConbtext();
        protected void Page_Load(object sender, EventArgs e)
        {
         
            int authUserId = Convert.ToInt32(Session["authUserID"]);

            int sid = Convert.ToInt32(Request.QueryString["sid"]);
     

            int countAnseredQuestion = (from u in _db.UserAnswers
                join q in _db.Questions on u.QuestionId equals q.QuestionId
                where u.SubjectId.Equals(sid)
                where u.UserId.Equals(authUserId)
                select u.QuestionId).Count();






   
            
            int countTotalQuestion = _db.Questions.Count(c => c.SubjectId.Equals(sid));
            var availableQuestionTobeAnswered = countTotalQuestion - countAnseredQuestion;
        
            if (availableQuestionTobeAnswered>0)
            {

                var query = (from q in _db.Questions

                             where q.SubjectId == sid

                             select new
                             {
                                 q.QuestionDescription,
                                 q.QuestionId,
                                 q.Ans1,
                                 q.Ans2
                                 ,
                                 q.Ans3,
                                 q.Ans4
                             });
                foreach (var item in query)
                {
                    var isAnsExist = _db.UserAnswers.Any(c => c.SubjectId.Equals(sid) && c.QuestionId.Equals(item.QuestionId) && c.UserId.Equals(authUserId));
                    if (!isAnsExist)
                    {

                        CountLabel.Text = "Ques. :" + (countAnseredQuestion + 1);
                        QuestionLabel.Text = item.QuestionDescription;
                        Label1.Text = item.Ans1;
                        Label2.Text = item.Ans2;
                        Label3.Text = item.Ans3;
                        Label4.Text = item.Ans4;
                        break;
                    }
                }
            }
            if (availableQuestionTobeAnswered ==0)
            {
              Response.Redirect("UserResultForm.aspx?sid="+sid);
     
            }
            var getTimeForEachQues = _db.Subjects.Single(q => q.SubjectId.Equals(sid)).TimePerQuestionInSecond;
            if (!SM1.IsInAsyncPostBack)

                Session["timeout"] = DateTime.Now.AddSeconds(getTimeForEachQues).ToString();
      

        }

     

        protected void quizSubmitButton_Click(object sender, EventArgs e)
        {
            if (Request.Form["raBtn1"] != "")
            {

                Response.Write("fname : " + Request.Form["raBtn1"] + "\n");

            }
            Response.Redirect("UserQuizForm.aspx?sid=" + Request.QueryString["sid"]);
        }
        protected void timer1_tick(object sender, EventArgs e)
        {

            if (0 > DateTime.Compare(DateTime.Now, DateTime.Parse(Session["timeout"].ToString())))
            {
                lblTimer.Text = string.Format("Time Left: 00:{0}:{1}", ((Int32)DateTime.Parse(Session["timeout"].ToString()).Subtract(DateTime.Now).TotalMinutes).ToString(), ((Int32)DateTime.Parse(Session["timeout"].ToString()).Subtract(DateTime.Now).Seconds).ToString());
            }
            else
            {


                int authUserId = Convert.ToInt32(Session["authUserID"]);
               
                int qid = 0;
                timer1.Enabled = true;
                int sid = Convert.ToInt32(Request.QueryString["sid"]);

            
                var query = (from q in _db.Questions

                             where q.SubjectId == sid

                             select new
                             {
                                 q.QuestionDescription,
                                 q.QuestionId,
                                 q.Ans1,
                                 q.Ans2
                                 ,
                                 q.Ans3,
                                 q.Ans4
                             });

           

              
                    foreach (var item in query)
                    {
                        var isAnsExist = _db.UserAnswers.Any(c => c.SubjectId.Equals(sid) && c.QuestionId.Equals(item.QuestionId) && c.UserId.Equals(1));
                        if (!isAnsExist)
                        {

                            qid = item.QuestionId;
                            break;
                        }
                    }
          
              


                var objUserAnswer = new UserAnswer()
                {
                    SubjectId = sid,
                    QuestionId = qid,
                    UserId = authUserId,
                    UserAns = 0
                };
                _db.UserAnswers.Add(objUserAnswer);
                _db.SaveChanges();


              
               
              

                Response.Redirect("UserQuizForm.aspx?sid=" + sid);

              

            }
        }
        protected void AnsSubmitBtn_Click(object sender, EventArgs e)
        {
           
            int authUserId = Convert.ToInt32(Session["authUserID"]);
            int qid=0;
            int sid = Convert.ToInt32(Request.QueryString["sid"]);
          
        

            int countAnseredQuestion = (from u in _db.UserAnswers
                                        join q in _db.Questions on u.QuestionId equals q.QuestionId
                                        where u.SubjectId.Equals(sid)
                                        where u.UserId.Equals(authUserId)
                                        select u.QuestionId).Count();
            int countTotalQuestion = _db.Questions.Count(c => c.SubjectId.Equals(sid));
            var availableQuestionTobeAnswered = countTotalQuestion - countAnseredQuestion;
          
            if (availableQuestionTobeAnswered > 0)
            {

                var query = (from q in _db.Questions

                             where q.SubjectId == sid

                             select new
                             {
                                 q.QuestionDescription,
                                 q.QuestionId,
                                 q.Ans1,
                                 q.Ans2
                                 ,
                                 q.Ans3,
                                 q.Ans4
                             });
                foreach (var item in query)
                {
                    var isAnsExist = _db.UserAnswers.Any(c => c.SubjectId.Equals(sid) && c.QuestionId.Equals(item.QuestionId) && c.UserId.Equals(authUserId));
                    if (!isAnsExist)
                    {

                        CountLabel.Text = "Ques. :" + (countAnseredQuestion + 1);
                        QuestionLabel.Text = item.QuestionDescription;
                        Label1.Text = item.Ans1;
                        Label2.Text = item.Ans2;
                        Label3.Text = item.Ans3;
                        Label4.Text = item.Ans4;
                        qid = item.QuestionId;
                        break;
                    }
                }
            }
       

            if (RadioButton1.Checked || RadioButton2.Checked || RadioButton3.Checked || RadioButton4.Checked)
            {
                int userAns = 0;
                if (RadioButton1.Checked)
                {
                    userAns = 1;
                }
                else
                if (RadioButton2.Checked)
                {
                    userAns =2;
                }
                else
                    if (RadioButton3.Checked)
                    {
                        userAns = 3;
                    }
                    else
                        if (RadioButton4.Checked)
                        {
                            userAns = 4;
                        }
                var objUserAnswer=new UserAnswer
                {
                    SubjectId = sid,QuestionId = qid,UserId = authUserId,UserAns = userAns
                };
                _db.UserAnswers.Add(objUserAnswer);
                _db.SaveChanges();
                
            }
          
                Response.Redirect("UserQuizForm.aspx?sid=" + sid);
          
        }
    }
}