using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shoe
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadData();
            }
        }
        void loadData()
        {
            String sql = "   select S.MaSp,S.TenSP,C.GiaBan,C.anh,C.MauSac from CTSP C,SanPham S where C.MaSP=S.MaSP";
            DataTable data = KetNoi.Excutequerry(sql);
            DataList1.DataSource = data;
            DataList1.DataBind();
        }
    }
}