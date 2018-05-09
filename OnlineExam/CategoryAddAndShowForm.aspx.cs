using System;
using System.Linq;
using System.Web.UI.WebControls;
using OnlineExam.Models;


namespace OnlineExam
{
    public partial class CategoryAddAndShowForm : System.Web.UI.Page
    {
        readonly OnlineExamDbConbtext _db = new OnlineExamDbConbtext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CategoryAddBtn_Click(object sender, EventArgs e)
        {
            try
            {
                var checkHasCategoryAlreadyExisted =
                    _db.Categories.Any(c => c.CategoryName.Equals(CategoryAddTextBox.Text));

                if (!checkHasCategoryAlreadyExisted)
                {
                    var categoryAddObj = new Category
                    {
                        CategoryName = CategoryAddTextBox.Text
                    };
                    _db.Categories.Add(categoryAddObj);
                    _db.SaveChanges();
                    CategoryAddSuccessMsgDisplayLabel.Text = "Category has been added successfully";
                    CatErrorMsgDisplayLabel.Text = "";

                }
                else
                {
                    CategoryAddSuccessMsgDisplayLabel.Text = "";
                    CatErrorMsgDisplayLabel.Text = CategoryAddTextBox.Text + " already exist in database";

                }
             
            }
            catch (Exception exception)
            {

                CatErrorMsgDisplayLabel.Text = exception.Message;
            }
        }

     

       
    }
}