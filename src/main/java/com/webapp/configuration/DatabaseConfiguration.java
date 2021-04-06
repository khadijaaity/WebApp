package com.webapp.configuration;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class DatabaseConfiguration {
	String result = "";
	InputStream inputStream;

	public String getPropValues(String environmentVar) throws IOException {

		try {
			Properties prop = new Properties();
			String propFileName = environmentVar + "-database.properties";

			inputStream = getClass().getClassLoader()
					.getResourceAsStream(propFileName);

			if (inputStream != null) {
				prop.load(inputStream);
			} else {
				throw new FileNotFoundException("property file '" + propFileName
						+ "' not found in the classpath");
			}

			// get the property value and print it out
			String server = prop.getProperty("server");
			String database = prop.getProperty("database");
			String user = prop.getProperty("user");
			String pwd = prop.getProperty("pwd");

			result = "Database config List = " + server + ", " + database + ", "
					+ user + ", " + pwd;
		} catch (Exception e) {
			System.out.println("Exception: " + e);
		} finally {
			inputStream.close();
		}
		return result;
	}
}