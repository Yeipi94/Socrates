using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

public class NacionalPersona : ApiController
{
    List<Nacional_Nombre> MyBooks = new List<Nacional_Nombre>();

    // RETURN A LIST OF BOOKS MATCHING WITH THE REQUESTED ALPHANUMERIC VALUE(S).
    public IEnumerable<Nacional_Nombre> Get(string sLookUpString)
    {
        GetTheBooks(sLookUpString);
        return MyBooks;
    }

    public void GetTheBooks(string sFind)
    {
        string sConnString = ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ConnectionString;



        SqlConnection myConn = new SqlConnection(sConnString);

        // SEARCH DATABASE TABLE MATCHING BOOKS WITH THE "LOOKUP" STRING.
        SqlCommand objComm = new SqlCommand("SELECT Nombre_Comp FROM dbo.tbl_INEPersonas " +
            "WHERE Nombre_Comp LIKE '%'+@Nombre_Comp+'%' ORDER BY Nombre_Comp", myConn);




        myConn.Open();

        objComm.Parameters.AddWithValue("@Nombre_Comp", sFind);
        SqlDataReader reader = objComm.ExecuteReader();

        // ADD EACH BOOKNAME IN THE LIST.
        while (reader.Read())
        {
            MyBooks.Add(new Nacional_Nombre { Persona = reader["Nombre_Comp"].ToString() });
        }
        myConn.Close();
    }
}
