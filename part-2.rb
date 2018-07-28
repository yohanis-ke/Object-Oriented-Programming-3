class Book
  @@on_shelf=[]
  @@on_loan=[]
  @@due_date= Time.now
  @@over_due=[]


  def initialize(title, author, isbn)
   @title= title
   @author= author
   @isbn =isbn
  end

  def self.create(title, author, isbn)
   # @@on_shelf<<self.new(title, author, isbn)
    new_book = self.new(title,author,isbn)
    @@on_shelf << new_book
    return new_book
  end

  def self.browse
   random_book = @@on_shelf[rand(@@on_shelf.length)]
   # puts random_book
   # return @@on_shelf
  end
  #
  def self.available
   return @@on_shelf
  end

  def self.borrowed
   return @@on_loan
  end

  def lent_out?
   return @@on_loan.include?(self)
  end

  def self.due_date
   @@due_date= Time.now + (60*60*24*7)
   return @@due_date
  end

  def due_date
    return @@due_date
  end

  def borrow
     if self.lent_out?
       return false
     else
       Book.due_date
       @@on_loan<< self
       return true
     end
  end

  def self.overdue
    @@on_loan.each do |a|
      duedate=a.due_date
      if duedate < Time.now
        @@over_due << a
      end
    return @@over_due
   end
  end

  def return_to_library
    if self.lent_out?
      @@on_loan.delete(self)
      @@on_shelf<< self
      @@due_date =""
      return true
    else
    return false
   end

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
