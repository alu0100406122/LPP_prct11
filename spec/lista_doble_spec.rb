require 'spec_helper'
require 'biblio'

describe Lista_Doble do
    before :each do

        @libro1 = Libro.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"], "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide. (The Facets of Ruby)", "Pragmatic Bookshelf", "", 4, "(July 7, 2013)", ["ISBN-13: 978-1937785499", "ISBN-10: 1937785491"])
        @libro2 = Libro.new(["Scott Chacon"], "Pro Git 2009th Edition.(Pro)", "Apress", "", 2009, "(August 27, 2009)", ["ISBN-13: 978-1430218333","ISBN-10: 1430218339"])
        @libro3 = Libro.new(["David Flanagan","Yukihiro Matsumoto"],"The Ruby Programming Language.", "O’Reilly Media", "", 1, "(August 27, 2009)",["ISBN-10: 0596516177","ISBN-13: 978-0596516178"])
        @libro4 = Libro.new(["David Chelimsky","Dave Astels","Bryan Helmkamp","Dan North","Zach Dennis","Aslak Hellesoy"],"The RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends (The Facets of Ruby).", "PragmaticBookshelf", "", 1, "(December 25, 2010)",["ISBN-10: 1934356379","ISBN-13: 978-1934356371"])
        @libro5 = Libro.new(["Richard E"],"Silverman Git Pocket Guide", "O’Reilly Media", "", 1, "(August 2, 2013)",["ISBN-10: 1449325866","ISBN-13: 978-1449325862"])
    
        @nodo1 = Node.new(@libro1,nil,nil)
        @nodo2 = Node.new(@electronico1,nil,nil)
        @nodo4 = Node.new(@libro4,nil,nil)
        @nodo5 = Node.new(@libro5,nil,nil)
        
        @revista1 = Revista.new(["Thomas R."], "Ruby 1.0: Guide.", "Pragmatic Bookshelf", "", 6, "(July 4, 2012)", ["ISSN-13: 95499"])
        
        @electronico1 = Electronico.new(["Dave T."], "Bundler Guide", "www.bundler.com", "(August 2, 2013)")
        @electronico2 = Electronico.new(["Dave T."], "C&A", "www.bundler.es", "(June 3, 2009)")
        
        @lista1 = Lista_Doble.new()
    end

    describe "Node" do
        
        it "El objeto pertenece a la clase..." do
            expect(@nodo1.is_a? Node).to be true
            expect(@nodo1.instance_of? Node).to be true
        end
        
        it "Debe existir un nodo de la Lista con sus datos y su siguiente..." do
            @lista1.insertar(@nodo1)
            expect(@lista1.vacio()).not_to be true
        end
        
        it "Debe existir un nodo con su previo ..." do
            @lista1.insertar(@nodo1)
            expect(@lista1.borrar_inicio()).not_to eq nil
        end
        
        it "Debe existir un nodo con su siguiente..." do
            @lista1.insertar(@nodo1)
            @lista1.insertar(@nodo2)
            expect(@lista1.borrar_inicio().next).not_to be nil
        end
        
    end
    
    describe "Lista Doblemente Enlazada" do
    
        it "El objeto pertenece a la clase..." do
            expect(@lista1.is_a? Lista_Doble).to be true
            expect(@lista1.instance_of? Lista_Doble).to be true
        end
        
        it "Se puede insertar un elemento..." do
            @lista1.insertar(@nodo1)
            expect(@lista1.vacio()).not_to be true
        end
        
        it "Se extrae el primer elemento de la lista..." do
            @lista1.insertar(@nodo2)
            @lista1.insertar(@nodo3)
            @lista1.borrar_inicio()
            expect(@lista1.borrar_inicio().value.to_s) == ("[Scott Chacon], Pro Git 2009th Edition.(Pro), Apress, , 2009, (August 27, 2009), [ISBN-13: 978-1430218333,ISBN-10: 1430218339]")
        end
        
        it "Extraer el último elemento de la lista..." do
            @lista1.insertar(@nodo1)
            @lista1.insertar(@nodo2)
            @lista1.insertar(@nodo3)
            @lista1.borrar_final()
            expect(@lista1.cabeza).to eq(@nodo2)
        end
        
        it "No existe nodo previo a inicio..." do
            @lista1.insertar(1)
            expect(@lista1.borrar_inicio.prev).to eq nil
        end
        
        it "No existe nodo siguiente a final..." do
            @lista1.insertar(@nodo3)
            expect(@lista1.borrar_final.next).to eq nil
        end
        
        it "Se pueden insertar varios elementos..." do
            node = Array.new(3)
            node[0] = @nodo1
            node[1] = @nodo2
            node[2] = @nodo3
            @lista1.insertar_array(node)
            expect(@lista1.vacio()).not_to be true
        end
        
        it "El nodo 2 apunta al anterior que es el nodo 1" do
            @lista1.insertar(@nodo1)
            @lista1.insertar(@nodo2)
            expect(@nodo2.prev).to eq(@nodo1)
        end
        
    end
    
    describe "Herencia" do
        
        it "La clase 'Lista_Doble' es hija de la clase 'Object'..." do
            expect (@lista1.class.superclass.to_s == 'Object')
        end
        
        it "La clase 'Revista' es hija de la clase 'Bibliografia'..." do
            expect (@revista1.class.superclass.to_s == 'Bibliografia')
        end
        
        it "La clase 'Libro' es hija de la clase 'Bibliografia'..." do
            expect (@libro1.class.superclass.to_s == 'Bibliografia')
        end
        
        it "La clase 'Electronico' es hija de la clase 'Bibliografia'..." do
            expect (@electronico1.class.superclass.to_s == 'Bibliografia')
        end
        
        it "Al llamar al método to_s (mismo nombre en clase padre e hija) toma el de la clase hija..." do
            @lista1.insertar(@nodo2)
            expect(@lista1.borrar_final().to_s) == ("[Dave T.], Bundler Guide, www.bundler.com, (August 2, 2013)")
        end
       
        context "Métodos: is_a?, instance_of? y respond_to?" do
            
            it "La clase 'Lista_Doble' es hija de la clase 'Object'..." do
                expect (@lista1.is_a? Object)
            end
            
            it "El objeto @revista1 es hija la clase Bibliografia..." do
                expect(@revista1.is_a? Bibliografia).to eq(true)
                #expect(@revista1.is_a? BasicObject).to eq(true)
            end
            
            it "El objeto @libro1 es una instancia de la clase Libro..." do
                expect(@libro1.instance_of? Libro).to eq(true)
            end
            
            it "El objeto @electronico1 responde al método to_s..." do
                expect(@electronico1.respond_to?('to_s')).to eq(true)
            end
            
            it "La variable 'url' pertenece a la clase Electronico..." do
                expect(@electronico1.respond_to?(:url)).to eq(true)
            end
            
        end
        
    end
    
    describe "Comparable" do
        
        it "Los autores del @libro1 y @libro2 son distintos..." do
            expect(@libro1.autor <=> @libro2.autor).to eq(-1)
        end
        
        it "Los autores de @electronico1 y @electronico2 son iguales..." do
            expect(@electronico1.autor == @electronico2.autor).to eq(true)
        end
        
    end
    
    
end