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

namespace web.DAL
{
    public class userdal
    {
        public static string AddUser(string username, string userpassword, int roleid)
        {
            SqlConnection con = new SqlConnection(database.ConnectionString);
            try
            {
                string passwotrdhash = "";
                //Hash password
                using (MD5 md5Hash = MD5.Create())
                {
                    passwotrdhash = GetMd5Hash(md5Hash, userpassword);
                }
                con.Open();
                SqlCommand cmd = new SqlCommand("pr_createuser", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@userpassword", passwotrdhash);
                cmd.Parameters.AddWithValue("@roleid", roleid);
                cmd.ExecuteNonQuery();
                return null; // success 
            }
            catch (Exception ex)
            {
                return ex.Message;  // return error message
            }
            finally
            {
                con.Close();
            }
        }

        static string GetMd5Hash(MD5 md5Hash, string input)
        {

            // Convert the input string to a byte array and compute the hash.
            byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));

            // Create a new Stringbuilder to collect the bytes
            // and create a string.
            StringBuilder sBuilder = new StringBuilder();

            // Loop through each byte of the hashed data 
            // and format each one as a hexadecimal string.
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }

            // Return the hexadecimal string.
            return sBuilder.ToString();
        }

        // Verify a hash against a string.
        static bool VerifyMd5Hash(MD5 md5Hash, string input, string hash)
        {
            // Hash the input.
            string hashOfInput = GetMd5Hash(md5Hash, input);

            // Create a StringComparer an compare the hashes.
            StringComparer comparer = StringComparer.OrdinalIgnoreCase;

            if (0 == comparer.Compare(hashOfInput, hash))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public static DataSet GetUser(string username, string userpassword)
        {
            SqlConnection con = new SqlConnection(database.ConnectionString);
            try
            {
                var ds = new DataSet();
                string passwotrdhash = "";
                //Hash password
                using (MD5 md5Hash = MD5.Create())
                {
                    passwotrdhash = GetMd5Hash(md5Hash, userpassword);
                }
                SqlCommand cmd = new SqlCommand("pr_loginuser", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@userpassword", passwotrdhash);
                var adapter = new SqlDataAdapter(cmd);
                //SqlDataReader dr = cmd.ExecuteReader();
                adapter.Fill(ds);
                //string userid = "";
                //userid = ds.Tables[0].Rows[0]["userid"].ToString();
                //return userid;
                return ds;
            }
            catch (Exception ex)
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        }

        public static DataSet SearchPatient(string phonenumber, string idno)
        {
            SqlConnection con = new SqlConnection(database.ConnectionString);
            try
            {
                var ds = new DataSet();
                SqlCommand cmd = new SqlCommand("pr_searchpatient", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@phonenumber", phonenumber);
                cmd.Parameters.AddWithValue("@idno", idno);
                var adapter = new SqlDataAdapter(cmd);
                adapter.Fill(ds);
                return ds;
            }
            catch (Exception ex)
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        }

        public static DataSet AddPatient(string surname, string firstname, string lastname, string phonenumber, string idno, string gender, string dob,string systolic, string diastolic, string startdate)
        {
            SqlConnection con = new SqlConnection(database.ConnectionString);
            try
            {
                var ds = new DataSet();
                con.Open();
                SqlCommand cmd = new SqlCommand("pr_createpatient", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@surname", surname);
                cmd.Parameters.AddWithValue("@firstname", firstname);
                cmd.Parameters.AddWithValue("@lastname", lastname);
                cmd.Parameters.AddWithValue("@phonenumber", phonenumber);
                cmd.Parameters.AddWithValue("@idno", idno);
                cmd.Parameters.AddWithValue("@dob", Convert.ToDateTime(dob));
                cmd.Parameters.AddWithValue("@systolic", systolic);
                cmd.Parameters.AddWithValue("@diastolic", diastolic);
                cmd.ExecuteNonQuery();
                var adapter = new SqlDataAdapter(cmd);
                adapter.Fill(ds);
                int patientid = Convert.ToInt32(ds.Tables[0].Rows[0]["patientid"]);
                return ds;
            }
            catch (Exception ex)
            {
                throw(ex);
            }
            finally
            {
                con.Close();
            }
        }
    }
}