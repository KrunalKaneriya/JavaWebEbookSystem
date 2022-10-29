package com.DAO;

import java.util.List;

import com.entity.BookDetails;

public interface BookDAO {

	public boolean addBooks(BookDetails bookDetails);
	
	public List<BookDetails> getAllBookDetails();
	
	public BookDetails getBookById(int id);
	
	public boolean updateBook(BookDetails book);
	
	public boolean deleteBook(int id);
}
