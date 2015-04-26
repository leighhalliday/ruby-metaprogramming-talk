class SayHi
  def initialize(*names)
    names.each do |name|
      define_singleton_method "hi_#{name.downcase}" do
        puts "Hi #{name}"
      end
    end
  end
end

hi = SayHi.new("Peter", "Paul")
hi.hi_peter
hi.hi_paul

hello = SayHi.new("Marian")
hello.hi_marian