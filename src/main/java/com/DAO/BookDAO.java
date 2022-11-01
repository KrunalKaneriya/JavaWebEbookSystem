package com.DAO;

import java.util.List;

import com.entity.BookDetails;

public interface BookDAO {

	public boolean addBooks(BookDetails bookDetails);
	
	public List<BookDetails> getAllBookDetails();
	
	public BookDetails getBookById(int id);
	
	public boolean updateBook(BookDetails book);
	
	public boolean deleteBook(int id);
	
	public boolean OldBookDelete(int id,String email,String category);
	
	public List<BookDetails> getNewBooks();
	
	public List<BookDetails> getRecentBooks();
	
	public List<BookDetails> getOldBooks();
	
	public List<BookDetails> getAllRecentBooks();
	
	public List<BookDetails> getAllNewBooks();
	
	public List<BookDetails> getAllOldBooks();
	
	public List<BookDetails> getUserOldBooks(String email,String category);
	
	
}
