require 'csv'
require 'rerun'

class Gossip
  attr_accessor :content, :author

  def initialize (author_to_save, content_to_save)
    @content = content_to_save
    @author = author_to_save
  end 

  def save #méthode qui sauvegarde une paire auteur/content dans le fichier CSV
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [self.author, self.content]
    end
  end

  def self.all #méthode qui retourne une array contenant tous les objets Gossip du fichier CSV
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find (id) #méthode qui retourne une paire auteur/content spécifique (suivant son index)
    return self.all[id.to_i]
  end 

  def update(id) #méthode qui permet de modifier une ligne sur le fichier CSV
    rows = CSV.read("db/gossip.csv")
    rows[id.to_i] = [self.author, self.content] #modification de la donnée ciblée (réécriture)

    # Écrire le contenu mis à jour dans le fichier CSV en mode écriture
    CSV.open("db/gossip.csv", "w") do |csv|
      rows.each do |row|
        csv << row
      end
    end 
  end 
end