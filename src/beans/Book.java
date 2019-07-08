package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Book {
	private int id;
	private String title, author;
	private int price;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public void addBook() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		try(Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "hr", "hr"))
		{
			PreparedStatement ps = con
					.prepareStatement("insert into june24_books values(june24_books_id.nextval,?,?,?)");
			ps.setString(1, title);
			ps.setString(2, author);
			ps.setInt(3, price);
			ps.executeUpdate();
		} catch (Exception ex) {
			System.out.println(ex);
			throw ex; 
		}
	}

}
