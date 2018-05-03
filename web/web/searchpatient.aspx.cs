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
    public partial class searchpatient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearchPatient_Click(object sender, EventArgs e)
        {
            DataSet theDS = DAL.userdal.SearchPatient(txtPhone.Text, txtIDNO.Text);
            string patientid = Convert.ToString(theDS.Tables[0].Rows[0]["patientid"]);
            string firstname = Convert.ToString(theDS.Tables[0].Rows[0]["firstname"]);
            string surname = Convert.ToString(theDS.Tables[0].Rows[0]["surname"]);
            string lastname = Convert.ToString(theDS.Tables[0].Rows[0]["lastname"]);
            string phonenumber = Convert.ToString(theDS.Tables[0].Rows[0]["phonenumber"]);
            string idno = Convert.ToString(theDS.Tables[0].Rows[0]["idno"]);
            string dob = Convert.ToString(theDS.Tables[0].Rows[0]["dob"]);

            if (Convert.ToInt32(patientid) > 0)
            {
                Session["patientid"] = patientid;
                Session["firstname"] = firstname;
                Session["surname"] = surname;
                Session["lastname"] = lastname;
                Session["phonenumber"] = phonenumber;
                Session["idno"] = idno;
                Session["dob"] = dob;
                Response.Redirect("~/patientresults.aspx");
            }
            
        }
    }
}