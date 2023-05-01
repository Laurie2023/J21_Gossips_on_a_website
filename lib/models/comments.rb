
class Comment
  attr_accessor :index_gossip, :comment_content, :comment_author

  def initialize (index_gossip_to_save, content_to_save, author_to_save)
    @index_gossip = index_gossip_to_save
    @comment_content = content_to_save
    @comment_author = author_to_save
  end 

  def save #méthode qui sauvegarde un trio index/commentaire/auteur dans le fichier CSV
    CSV.open("./db/comments.csv", "ab") do |csv|
      csv << [self.index_gossip, self.comment_content, self.comment_author]
    end
  end 
    
  def self.all #méthode qui retourne une array contenant tous les objets Comments du fichier CSV lié à un commentaire
    all_comments = []
    CSV.read("./db/comments.csv").each do |csv_line|
      all_comments << Comment.new(csv_line[0], csv_line[1],csv_line[2])
    end
    return all_comments
  end
end 