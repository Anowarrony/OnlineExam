<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserQuizForm.aspx.cs" Inherits="OnlineExam.UserQuizForm" %>
<%@ Import Namespace="OnlineExam.Models" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Bootstrape/bootstrap-3.3.2.min.css" rel="stylesheet" />


</head>
<body>
    <form id="form1" runat="server">
        

  <div style="position: relative;left: 15%;top: 16px">
      <div>
<asp:ScriptManager ID= "SM1" runat="server"></asp:ScriptManager>
<asp:Timer ID="timer1" runat="server"

Interval="1000" OnTick="timer1_tick"></asp:Timer>
</div>

<div>
<asp:UpdatePanel id="updPnl"

runat="server" UpdateMode="Conditional">
<ContentTemplate>
<asp:Label ID="lblTimer" runat="server" Font-Bold="True" Font-Names="Arial"

        Font-Size="X-Large" ForeColor="#6600CC"></asp:Label>
</ContentTemplate>
<Triggers>
<asp:AsyncPostBackTrigger ControlID="timer1" EventName ="tick" />
</Triggers>
</asp:UpdatePanel>
</div>

        <asp:Label ID="CountLabel" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="QuestionLabel" runat="server" Text="Label" Font-Bold="True" Font-Italic="True" Font-Size="Medium" ForeColor="#408080"></asp:Label>
        
        <br/>   <br/>   
        <asp:RadioButton ID="RadioButton1"  runat="server" GroupName="RadBtnAns" />
        <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label>

        <br/>  <br/>
        &nbsp;<asp:RadioButton ID="RadioButton2" runat="server" GroupName="RadBtnAns" />
        <asp:Label ID="Label2" runat="server" Text="Label" Font-Bold="True" ForeColor="Black"></asp:Label>
              <br/>  <br/>
        &nbsp; 
            <asp:RadioButton ID="RadioButton3" runat="server" GroupName="RadBtnAns" />
            <asp:Label ID="Label3" runat="server" Text="Label" Font-Bold="True" ForeColor="Black"></asp:Label>
          <br/>  <br/>
        &nbsp;
        <asp:RadioButton ID="RadioButton4" runat="server" GroupName="RadBtnAns" />
        <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label>
      
    
      <br/>
        <br/>
        <p>
            <asp:Button ID="AnsSubmitBtn" runat="server" Height="39px" Text="Next question" Width="120px" OnClick="AnsSubmitBtn_Click" CssClass="bg-success" />

           
            
           

           
            
        </p>
  </div>
   
        
    </form>
 
    </body>
</html>
