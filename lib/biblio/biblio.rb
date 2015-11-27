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
  
  def <=>(other)
      if ((@autor <=> other.autor)==0)
          if((@titulo <=> other.titulo)==0)
            @fecha_publicacion <=> other.fecha_publicacion
          else
            @titulo <=> other.titulo
          end
      else
          @autor <=> other.autor
      end
  end
  
end