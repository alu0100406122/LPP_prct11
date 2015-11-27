class Lista_Doble
    
    include Enumerable
    
    attr_reader :inicio
    attr_accessor :cabeza
    
    def initialize()
        @cabeza = nil
        @inicio = nil
    end
    
    def insertar(x)
        if ((x.is_a? Node) != true)
            node = Node.new(x,nil,nil)
        else
            node = x
        end
        
        if (@inicio != nil)  #Si la lista no está vacía...
            @cabeza.next = node
            node.prev = @cabeza
            @cabeza = node
        else                #Si la lista está vacía...
            @inicio = node
            @cabeza = @inicio
            @cabeza.next = nil
            @cabeza.prev = nil
        end
    end
    
    def vacio()
        if (@inicio==nil)
            return true
        else
            return false
        end 
    end
    
    def borrar_inicio()
        if (@inicio != nil)
            aux = @inicio
            @inicio = aux.next
            return aux
        else
            return nil
        end
    end
    
    def borrar_final()
        if (@inicio != nil)
            aux = @cabeza   #Me posiciono al final de la lista...
            @cabeza = @cabeza.prev
            if (@cabeza == nil) #si solo hay un nodo
                @inicio= nil
                @cabeza = nil
            end
            return aux
        else
            return nil
        end
    end
    
    def insertar_array(*bloque)
        bloque.each do |node|
            if (@inicio != nil)  #Si la lista no está vacía...
                @cabeza.next = node
                node.prev = @cabeza
                @cabeza = node
            else                #Si la lista está vacía...
                @inicio = node
                @cabeza = @inicio
            end
        end
    end
    
    def to_s()
        aux = @inicio
        while (aux != nil) do
            "#{aux.value}"
            aux = aux.next
        end
    end
    
    def each
        aux = @inicio
        while (aux != nil) do
            yield aux.value
            aux = aux.next
        end
    end
    
    
end