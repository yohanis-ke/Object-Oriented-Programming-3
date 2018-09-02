class Book
  @@on_shelf = []
  @@on_loan = []

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @ISBN = isbn
  end
        # CLASS METHODS
  def self.create(title, author, isbn)
    new_book = Book.new(title, author, isbn)
    @@on_shelf << new_book
    return new_book
  end
  def self.current_due_date
    return Time.now + (60*60*24*7) #one week in seconds
  end
  def self.overdue
    overdue_books = []
    @@on_loan.each do |obj|
      if obj.due_date < Time.now
      overdue_books << obj
      end
    end
    return overdue_books
  end
  def self.browse
    @@on_shelf.sample
  end
  def self.available
    @@on_shelf
  end
  def self.borrowed
    @@on_loan
  end
          # READERS
  def due_date
    @due_date
  end

          # WRITERS
  def due_date_change(new_date)
    @due_date = new_date
  end
  def borrow
    if lent_out?
      return false
    else
      @due_date = Book.current_due_date
      @@on_loan << self
      @@on_shelf.delete(self)
      return true
    end
  end
  def return_to_library
    if lent_out?
      @@on_shelf << self
      @@on_loan.delete(self)
      @due_date = nil
      return true
    else
      return false
    end
  end
  def lent_out?
    @@on_loan.include?(self)
  end


end

sister_outsider = Book.create("Sister Outsider", "Audre Lorde", "9781515905431")
aint_i = Book.create("Ain't I a Woman?", "Bell Hooks", "9780896081307")
if_they_come = Book.create("If They Come in the Morning", "Angela Y. Davis", "0893880221")
# puts Book.browse.inspect
# puts Book.browse.inspect
# puts Book.browse.inspect
# puts Book.available.inspect
# puts Book.borrowed.inspect
puts Book.borrowed.inspect
puts sister_outsider.lent_out?
puts sister_outsider.borrow
puts sister_outsider.lent_out?
# puts sister_outsider.borrow
# puts sister_outsider.due_date
# puts Book.available.inspect
puts Book.borrowed.inspect
# puts Book.overdue.inspect
puts sister_outsider.return_to_library
# puts sister_outsider.lent_out?
# puts Book.available.inspect
puts Book.borrowed.inspect
