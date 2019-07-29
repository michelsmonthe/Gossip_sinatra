require 'csv'
#require 'pry'

class Gossip
  attr_accessor :author, :content, :commentaire

  def initialize(author, content)
    @author = author
    @content = content
    @commentaire = commentaire
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find(id)
		gossips = [] #on stock la line CSV demandée
		CSV.read("./db/gossip.csv").each do |csv_line, index|
			if (id == index+1)
				gossips << Gossip.new(csv_line[0], csv_line[1])
			break
			end
	  end
	  	return gossips
	 end

   def self.update(id,author,content)
  		gossips = []

      # recréé l'array et csv avec les données modifiées.
  	 	CSV.read("./db/gossip.csv").each do |csv_line, index|
  	 		if id.to_i == (index + 1)    # i
  	 			gossips << [author, content]
  	 		else
  	 			gossips << [csv_line[0], csv_line[1]]
  	 		end
  	 	end

     CSV.open("./db/gossip.csv", "w") do |csv|
  	 		gossips.each do |csv_line|
  	 			csv << csv_line
       	end
     end
   end


   def comments
	    CSV.open("./db/comments.csv", "ab") do |csv| #Nous ouvrons le CSV en mode écriture (ab)
			     csv << [@comments]

		end

end




#binding.pry
end
