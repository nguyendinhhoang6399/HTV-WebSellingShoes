using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shoe
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        bool checkUser(string username)
        {
            string sql = "Select * from users where username='" + username + "'";
            DataTable data = KetNoi.Excutequerry(sql);
            if (data.Rows.Count > 0)
                return true;
            return false;
        }
        bool CheckEmail(string Email)
        {
            string sql = "Select * from users where gmail='" + Email + "'";
            DataTable data = KetNoi.Excutequerry(sql);
            if (data.Rows.Count > 0)
                return true;
            return false;
        }
        string getUserId()
        {
            string sql = "select max(userId)as userId from Users";
            DataTable data = KetNoi.Excutequerry(sql);
            foreach (DataRow row in data.Rows)
                return row["userId"].ToString();
            return "";
        }
        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            if (checkUser(txUserName.Text))
            {
                Response.Write("<script>alert('UserName đã tồn tại')</script>");
            }
            else if(txPassword.Text != txPassAgain.Text)
            {
                Response.Write("<script>alert('Mật khẩu nhập lại không đúng')</script>");
            }
            else if (CheckEmail(txEmail.Text))
            {
                Response.Write("<script>alert('Email đã tồn tại')</script>");
            }
            else
            {
                string image = "";
                if (fulImage.HasFile)
                {
                    fulImage.SaveAs(Server.MapPath("img/users/") + fulImage.FileName);
                    image = "img/users/" + fulImage.FileName;
                }
                string sql = "insert into Users(UserName,MatKhau,phoneNumber,address,gmail,anh,loaiTK)" +
                    " values('"+txUserName.Text+"','"+txPassword.Text+"','"+txPhone.Text+"', " +
                    "N'"+txAddress.Text+"', '"+txEmail.Text+"','"+image+"','2')";
                DataTable data = KetNoi.Excutequerry(sql);
                string userId = getUserId();
                string sq1l = "insert into Cart(userId,TongTien) values('" + userId + "','0')";
                DataTable data1 = KetNoi.Excutequerry(sq1l);
                Response.Write("<script>alert('Thêm thành công')</script>");
                txAddress.Text = String.Empty;
                txEmail.Text = String.Empty;
                txPassAgain.Text = String.Empty;
                txPassword.Text = String.Empty;
                txPhone.Text = String.Empty;
                txUserName.Text = String.Empty;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }
    }
}