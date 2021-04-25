package com.webapp.configuration;

import java.io.IOException;
import java.util.Properties;

public class DatabaseProperties {

	private static DatabaseProperties instancia = null;
	private Properties property;

	private DatabaseProperties() {

		property = new Properties();
		try {
			String environment = System.getenv("Entorno");
			String propFileName = environment + "-database.properties";

			property.load(getClass().getClassLoader()
					.getResourceAsStream(propFileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static DatabaseProperties getInstancia() {

		if (instancia == null) {

			instancia = new DatabaseProperties();
		}
		return instancia;
	}

	public String getPropiedad(String clave) {

		return property.getProperty(clave);
	}

	public String getConnectionString() {

		return "jdbc:mysql://" + property.getProperty("server") + "/"
				+ property.getProperty("database");
	}

	public String getDatabaseUser() {

		return property.getProperty("user");
	}

	public String getDatabasePwd() {

		return property.getProperty("pwd");
	}

	public String getDatabaseDriver() {

		return property.getProperty("mysql-driver");
	}

	public String getMongoDbConnectionString() {
		return property.getProperty("mongodb-connectionstring");
	}
}