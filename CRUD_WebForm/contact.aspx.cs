using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUD_WebForm
{
    public partial class contact : System.Web.UI.Page
    {
        SqlConnection sqlcon = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=db_test;Integrated Security=True"); 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnDelete.Enabled = false;
                FillGrid();
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            clear();
        }

        public void clear()
        {
            contactId.Value = "";
            txtName.Text = txtAddress.Text = txtdob.Text = "";
            msgSuccess.Text = msgFail.Text = "";
            btnSave.Text = "Save";
            btnDelete.Enabled = false;

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

            try {
                if (sqlcon.State == ConnectionState.Closed)
                    sqlcon.Open();
                SqlCommand sqlcmd = new SqlCommand("saveandupdate", sqlcon);
                sqlcmd.CommandType = CommandType.StoredProcedure;

                sqlcmd.Parameters.AddWithValue("@id", (contactId.Value == "" ? 0 : Convert.ToInt32(contactId.Value)));
                sqlcmd.Parameters.AddWithValue("@name", txtName.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@add", txtAddress.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@dob", txtdob.Text);
                sqlcmd.ExecuteNonQuery();
                sqlcon.Close();

                string cid = contactId.Value;
                clear();
                if (cid == "")
                    msgSuccess.Text = "Saved Successfully!!!";
                else
                    msgSuccess.Text = "Updated Successfully!!!";

                FillGrid();
            }
            catch (Exception ex){
                msgFail.Text = ex.Message;
                
            }
            
        }

        void FillGrid() {
            if (sqlcon.State == ConnectionState.Closed)
                sqlcon.Open();
            SqlDataAdapter sqlAd = new SqlDataAdapter("viewall", sqlcon);
            sqlAd.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            sqlAd.Fill(dt);
            sqlcon.Close();

            gv.DataSource = dt;
            gv.DataBind();
        }

        protected void linkview(object sender, EventArgs e)
        {
            int id = Convert.ToInt32((sender as LinkButton).CommandArgument);

            if (sqlcon.State == ConnectionState.Closed)
                sqlcon.Open();
            SqlDataAdapter sqlAd = new SqlDataAdapter("viewbyid", sqlcon);
            sqlAd.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlAd.SelectCommand.Parameters.AddWithValue("@id", id); 
            DataTable dt = new DataTable();
            sqlAd.Fill(dt);
            sqlcon.Close();

            contactId.Value = id.ToString();
            txtName.Text = dt.Rows[0]["name"].ToString();
            txtAddress.Text = dt.Rows[0]["address"].ToString();
            txtdob.Text = dt.Rows[0]["dob"].ToString();

            msgSuccess.Text = msgFail.Text = "";
            btnSave.Text = "Update";
            btnDelete.Enabled = true;

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (sqlcon.State == ConnectionState.Closed)
                sqlcon.Open();
            SqlCommand sqlcmd = new SqlCommand("deletebyid", sqlcon);
            sqlcmd.CommandType = CommandType.StoredProcedure;

            sqlcmd.Parameters.AddWithValue("@id", (contactId.Value == "" ? 0 : Convert.ToInt32(contactId.Value)));
            sqlcmd.ExecuteNonQuery();
            sqlcon.Close();

            clear();
            FillGrid();
            msgSuccess.Text = "Deleted Successfully!!!";

        }
    }
}