

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;

namespace OnlineExam.Models
{
    public class OnlineExamModels
    {
    }
    [Table("tblAdmin")]
    public class AdminAccount
    {[Key]
        public int Id { get; set; }

        public string Username { get; set; }
        public string Password { get; set; }
    }

    [Table("tblCategory")]
    public class Category
    {
        [Key]
        public int CategoryId { get; set; }

        public string CategoryName { get; set; }
    }
    [Table("tblSubject")]
    public class Subject
    {
        [Key]
        public int SubjectId { get; set; }

        public string SubjectName { get; set; }

        public int CategoryId { get; set; }
        public double? MarkPerQuestion { get; set; }
        public int? PassMark { get; set; }
        public int TimePerQuestionInSecond { get; set; }
    }
    [Table("tblQuestion")]
    public class Question
    {
        [Key]
        public int QuestionId { get; set; }

        public string QuestionDescription { get; set; }
        public string Ans1 { get; set; }
        public string Ans2 { get; set; }
        public string Ans3 { get; set; }
        public string Ans4 { get; set; }
        public int TrueAns { get; set; }
        public int SubjectId { get; set; }
    }
      [Table("tblUserAns")]
    public class UserAnswer
    {
        [Key]
        public int AnsId { get; set; }

        public int SubjectId { get; set; }
        public int QuestionId { get; set; }
        public int UserAns { get; set; }
        public int UserId { get; set; }
    }
    [Table("tblUser")]
    public class User
    {
        [Key]
        public int UserId { get; set; }

        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public string Country { get; set; }
        public string Phone { get; set; }
    
    }
    public class OnlineExamDbConbtext : DbContext
    {
        public DbSet<AdminAccount> AdminAccounts { get; set; }
        public DbSet<Subject> Subjects { get; set; }
        public DbSet<Question> Questions { get; set; } 
        public DbSet<User> Users { get; set; }
        public DbSet<UserAnswer> UserAnswers { get; set; }
        public DbSet<Category> Categories { get; set; }
    }


}