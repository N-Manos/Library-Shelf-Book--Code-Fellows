#!/usr/local/bin/ruby -w
class Book 
  @title = ""
  @library = ""
  
	def initialize (title, library)
		@title = title
    @library = library
	end
# Sends the book to the proper alphabetical shelf based on the first letter in it's title.
	def enshelf 
    a_to_g = ('a'..'g').to_a
  	h_to_p = ('h'..'p').to_a
		if (a_to_g.include?(self.get_title[0].downcase))
		  @library.get_shelves[0].add_book (self)
		elsif (h_to_p.include?(self.get_title[0].downcase))
		  @library.get_shelves[1].add_book (self)
		else 
		  @library.get_shelves[2].add_book (self)
		end
    
	end
 # Pulls the book off the appropriate alphabetical shelf based on the first letter in it's title. 
	def unshelf
    a_to_g = ('a'..'g').to_a
    h_to_p = ('h'..'p').to_a
		if (a_to_g.include?(self.get_title[0].downcase))
		  @library.get_shelves[0].delete (self)
		elsif (h_to_p.include?(self.get_title[0].downcase))
		  @library.get_shelves[1].delete (self)
		else 
		  @library.get_shelves[2].delete (self)
		end
	end
  
  def print_title
    puts "#{@title}"
  end
  
  def get_title
    return @title
  end
end


class Shelf 

  def initialize ()
  	@shelf = []
	end

  def add_book (book)
  	@shelf.push(book)
	end
	
	def delete (book)
		@shelf.delete(book)
	end
  
  def to_s
    @shelf.each{|x| puts x.print_title}
	end
end


class Library 

  def initialize (name)
    @name = name
# 3 Shelves each responsible for about 1/3 of the alphabet. 
    @shelf_ag = Shelf.new()
    @shelf_hp = Shelf.new()
    @shelf_qz = Shelf.new()  
  end
# Prints out the list of current books on the shelf.
  def list_books
    puts ""
    puts "Current Catalogue:"
    puts ""
    puts "A-G:"
  	@shelf_ag.to_s
  	puts "H-P:"
  	@shelf_hp.to_s
  	puts "Q-Z:"
  	@shelf_qz.to_s
  end	
# Returns an array of the shelves in the Library.
  def get_shelves
    shelves = [@shelf_ag, @shelf_hp, @shelf_qz]
    return shelves
  end
end

# Test code

library = Library.new ("Main Branch")

puts "Creating books and printing titles:"
puts""

book_a = Book.new "A Midsummer Night's Dream", library
book_d = Book.new "Dog's guide to life", library
book_g = Book.new "Gone With the Wind", library

book_h = Book.new "Hell Hath no Fury...", library
book_n = Book.new "No man's land", library
book_p = Book.new "Purple Rain", library

book_q = Book.new "Quantum Leap the Epic Novel", library
book_t = Book.new "Tables, Chairs, and Dressers Oh My", library
book_z = Book.new "Zifnab the Fabulous", library

book_a.print_title
book_d.print_title
book_g.print_title
book_h.print_title
book_n.print_title
book_p.print_title
book_q.print_title
book_t.print_title
book_z.print_title

book_a.enshelf
book_d.enshelf
book_g.enshelf
book_h.enshelf
book_n.enshelf
book_p.enshelf
book_q.enshelf
book_t.enshelf
book_z.enshelf

puts""
puts "PRINTING LIBRARY CATALOGUE WITH ALL 9 BOOKS SHELVED"


library.list_books

book_d.unshelf
book_n.unshelf
book_t.unshelf

puts""
puts "BOOKS BEGINNING WITH D, N, and T UNSHELVED"
puts""

library.list_books

book_a.unshelf
book_h.unshelf
book_q.unshelf

puts""
puts "BOOKS BEGINNING WITH A, H, and Q UNSHELVED"
puts""

library.list_books

book_g.unshelf
book_p.unshelf
book_z.unshelf

puts""
puts "BOOKS BEGINNING WITH G, P, and Z UNSHELVED. NO BOOKS LEFT"
puts""

library.list_books

