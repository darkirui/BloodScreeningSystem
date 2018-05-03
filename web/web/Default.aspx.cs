using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Security.Cryptography;
using System.Text;

namespace web
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["id"]) > 0)
            {
                Response.Redirect("~/allpatients.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //Response.Redirect("~/searchpatient.aspx");
            //int userid = Convert.ToInt32(DAL.userdal.GetUser(txtUsername.Text, txtUserPassword.Text));
            //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + userid + "');", true);
            DataSet theDS = DAL.userdal.GetUser(txtUsername.Text, txtUserPassword.Text);
            string username = Convert.ToString(theDS.Tables[0].Rows[0]["username"]);
            string id = Convert.ToString(theDS.Tables[0].Rows[0]["userid"]);
            Session["username"] = username;
            Session["id"] = id;
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + id + "');", true);
            Response.Redirect("~/allpatients.aspx");
        }

    }
}
