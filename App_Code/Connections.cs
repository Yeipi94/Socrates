using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Connections
/// </summary>
public class Connections
{
	public SqlConnection connection;
	private string connectionString;

	public SqlConnection cnn()
	{
		connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ToString();
		connection = new SqlConnection(connectionString);
		connection.Open();
		return connection;
	}
	public void close()
	{
		connection.Close();
	}
}