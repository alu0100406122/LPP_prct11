class Electronico < Bibliografia

    attr_reader :url
    
    def initialize(autor, titulo, url, publicacion)
        @autor = Array.new(autor) 
        @titulo =  titulo
        @url = url
        @fecha_publicacion = publicacion
    end
    
    def to_s
        "#{@autor}, 
        #{@titulo}, 
        #{@url}, 
        #{@fecha_publicacion}"
    end
    
end