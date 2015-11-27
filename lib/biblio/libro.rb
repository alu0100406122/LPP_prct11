class Libro < Bibliografia
  attr_reader :numero_edicion, :editorial, :serie, :numero_ISBN
  
  def initialize(autor, titulo, editorial, serie, edicion, publicacion, isbn)
    @autor = Array.new(autor) 
    @titulo =  titulo
    @editorial = editorial
    @serie = serie
    @numero_edicion = edicion
    @fecha_publicacion = publicacion
    @numero_ISBN = Array.new(isbn)
  end
  
  def to_s
      "#{@autor},
      #{@titulo},
      #{@editorial},
      #{@serie},
      #{@numero_edicion},
      #{@fecha_publicacion},
      #{@numero_ISBN}"
  end
  
end