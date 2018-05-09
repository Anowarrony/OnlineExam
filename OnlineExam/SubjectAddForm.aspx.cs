using System;
using System.Data.Entity;
using System.Linq;
using OnlineExam.Models;

namespace OnlineExam
{
    public partial class SubjectAddForm : System.Web.UI.Page
    {
        readonly OnlineExamDbConbtext _db = new OnlineExamDbConbtext();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                LabelSubjectAddReqMsg.Text = "";
                LabelSubjectAddSuccessMsg.Text = "";
                SubjectAddTextBox.CssClass = "form-control";

                if (Request.QueryString["sid"] != null)
                {
                    var sid = Convert.ToInt32(Request.QueryString["sid"]);
                    var objSubjectDel = _db.Subjects.Find(sid);
                    _db.Entry(objSubjectDel).State = EntityState.Deleted;
                    _db.SaveChanges();
                    Response.Redirect("AdminIndex.aspx");
                }
                ExceptionMsgDisplayLabel.Visible = false;
            }
            catch (Exception exception)
            {
                ExceptionMsgDisplayLabel.Visible = true;
                ExceptionMsgDisplayLabel.Text = exception.Message;
             
            }
        }

        protected void BtnSubjectAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (SubjectAddTextBox.Text == "")
                {
                    LabelSubjectAddReqMsg.Text = "This filled must be filled";
                }
                if (SubjectAddTextBox.Text != "")
                {
                    int catId = Convert.ToInt32(CategoryDropdownList.Text);
                    var isRecordALreadyExist = _db.Subjects.Any(x => x.SubjectName == SubjectAddTextBox.Text && x.CategoryId.Equals(catId));

                    if (!isRecordALreadyExist)
                    {
                        int? pmark = null;
                        float? mpq = null;


                        if (PassMarkTextBox.Text != string.Empty)
                        {
                            pmark = Convert.ToInt32(PassMarkTextBox.Text);
                        }
                        if (MarkPerQuestionTextBox.Text != string.Empty)
                        {
                            mpq = (float?) Convert.ToDouble(MarkPerQuestionTextBox.Text);

                        }

                        var objSubject = new Subject { SubjectName = SubjectAddTextBox.Text, CategoryId = catId, MarkPerQuestion =mpq, PassMark = pmark,TimePerQuestionInSecond = Convert.ToInt32(TimePerQuesTextBox.Text)};
                        _db.Subjects.Add(objSubject);
                        _db.SaveChanges();
                        ExceptionMsgDisplayLabel.Text = "";
                        LabelSubjectAddSuccessMsg.Text = "New Subject added successfully.";

                        SubjectAddTextBox.Text = "";
                        PassMarkTextBox.Text = "";
                        MarkPerQuestionTextBox.Text = "";
                    }
                    else
                    {
                        ExceptionMsgDisplayLabel.Text = "";
                        LabelSubjectAddReqMsg.Text = "This subject already exist in database";
                    }
                }
            }
            catch (Exception exception)
            {
                LabelSubjectAddSuccessMsg.Text = "";
                ExceptionMsgDisplayLabel.Visible = true;
                ExceptionMsgDisplayLabel.Text =exception.Message;
            }
        }
    }
}