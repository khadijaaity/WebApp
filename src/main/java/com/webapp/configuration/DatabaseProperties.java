package com.webapp.configuration;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class DatabaseProperties {

	private static DatabaseProperties instancia = null;
	private Properties p;

	private DatabaseProperties() {

		p = new Properties();
		try {
			p.load(new FileInputStream(new File("dev-database.properties")));
		} catch (IOException e) {
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
		return p.getProperty(clave);
	}

}
