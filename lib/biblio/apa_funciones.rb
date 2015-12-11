class Apa
    require "../biblio/biblio"
    require "../biblio/libro"
    require "../biblio/node"
    require "../biblio/revista"
    require "../biblio/lista_doble"
    
    attr_reader :atributo
     
    def initialize()
        @atributo = Lista_Doble.new()
    end
    
    def proc_from
        Proc.new
    end
    
    def regla_autor(string)
        str=""
        proc = proc_from{|array| array.each_with_index do |word,i|
                        str += array[i].split(" ")[1]+" "+ array[i].split(" ")[0]+", "
                    end
        }
        proc.call(string)
        puts str
    end
    
    def regla_titulo(string)
        
        str=""
        proc = proc_from {|cadena| cadena.split(" ").each do |i| 
                str += i.capitalize + " "
            end
        }
        proc.call(string)
        puts str
    end 
    
    def letra_inicial(string)
        str=""
        proc = proc_from{|array| array.each_with_index do |word,i|
                        str += array[i].split(" ")[1]+" "+ array[i].split(//)[0]+", "
                    end
        }
        proc.call(string)
        puts str
    end
    
    def ordenar()
        "#{@atributo.sort}"
    end
    
    def to_s()
        ordenar()
        aux = @atributo.inicio
        while(aux != nil)
            letra_inicial(aux.value.autor)
            #regla_autor(aux.value.autor)
            regla_titulo(aux.value.titulo)
            aux = aux.next
        end
    end
    
end

libro1 = Libro.new(["Dave Thomas","Scott Chacon", "Chad Fowler"], "programming ruby: the pragmatic programmers guide.", "Pragmatic Bookshelf", "", 4, "(July 7, 2013)", ["ISBN-13: 978-1937785499", "ISBN-10: 1937785491"])
libro1 = Libro.new(["Hunt Flanagan"], "pro git 2009th edition.", "Apress", "", 2009, "(August 27, 2009)", ["ISBN-13: 978-1430218333","ISBN-10: 1430218339"])
libro2 = Libro.new(["Andy Aunt"], "pro git 2009th edition.", "Apress", "", 2009, "(August 27, 2009)", ["ISBN-13: 978-1430218333","ISBN-10: 1430218339"])

revista1 = Revista.new(["Thomas R."], "ruby guide.", "Pragmatic Bookshelf", "", 6, "(July 4, 2012)", ["ISSN-13: 95499"])

nodo1 = Node.new(libro1)
nodo2 = Node.new(libro2)
nodo3 = Node.new(revista1)

apa = Apa.new()

apa.atributo.insertar(nodo1)
apa.atributo.insertar(nodo2)

apa.to_s()

#cadena="Hola"
#puts cadena.split(//).first