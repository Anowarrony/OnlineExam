using System;
using System.Collections.Generic;
using System.Data.Entity;
using OnlineExam.Models;


namespace OnlineExam
{
    public partial class QuestionDeleteForm : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["qid"] != null)
            {

                var db = new OnlineExamDbConbtext();
             
                    int qid = Convert.ToInt32(Request.QueryString["qid"]);
                    var objDel = db.Questions.Find(qid);
                    db.Entry(objDel).State = EntityState.Deleted;
                  //  db.SaveChanges();
                var msg = "RedFromQDF";
                    Response.Redirect("AdminIndex.aspx?redForm="+msg);
               
            }
        }
    }
}