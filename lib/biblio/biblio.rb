class Bibliografia
  
  include Comparable
  
  attr_reader :autor, :titulo, :fecha_publicacion
  
  def initialize(autor, titulo, editorial, serie, edicion, publicacion, isbn)
    @autor = Array.new(autor) 
    @titulo =  titulo
    @fecha_publicacion = publicacion
  end
  

  def to_s
      "#{@autor},
      #{@titulo},
      #{@fecha_publicacion}"
  end
  
end