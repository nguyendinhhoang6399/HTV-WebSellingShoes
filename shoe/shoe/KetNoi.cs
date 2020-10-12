using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace shoe
{
    public class KetNoi
    {
        public static DataTable Excutequerry(string query)
        {
            DataTable data = new DataTable();
            string conn = WebConfigurationManager.ConnectionStrings["SQLProvider"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(conn);
            sqlConnection.Open();
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            SqlDataAdapter adapter = new SqlDataAdapter(sqlCommand);
            adapter.Fill(data);
            sqlConnection.Close();

            return data;
        }
    }
}