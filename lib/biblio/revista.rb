

class Revista < Bibliografia
    attr_reader :issn
    
    def initialize(autor, titulo, editorial, serie, edicion, publicacion, issn)
        @autor = Array.new(autor) 
        @titulo =  titulo
        @editorial = editorial
        @fecha_publicacion = publicacion
        @numero_ISSN = Array.new(issn)
    end
      
    def to_s
        "#{@autor},
        #{@titulo},
        #{@editorial},
        #{@fecha_publicacion},
        #{@numero_ISSN}"
    end


end