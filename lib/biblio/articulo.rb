class Articulo
  attr_accessor :identificador_articulo, :author, :journal, :title, :abstract, :date
  
  def initialize(id_articulo, &block)
    self.identificador_articulo = id_articulo
    self.author = []
    self.journal = ''
    self.title = ''
    self.abstract = ''
    self.date = ''

    if block_given?  
      if block.arity == 1
        yield self
      else
       instance_eval &block 
      end
    end    
  
  end
  
  def nombre_autor(options = {})
    nombres_autores = ''
    nombres_autores << "#{options[:surname]}" if options[:surname] << " #{options[:name]}" if options[:name]
    author << nombres_autores
  end
  
  def journal_(options = {})
    jour = ''
    jour << "#{options[:name]}" if options[:name] << " , volume #{options[:volume]}" if options[:volume] << ", issue #{options[:issue]}" if options[:issue]
    journal << jour
  end
  
  def title_(options = {})
    titulo_articulo = ''
    titulo_articulo << " #{options[:name]}" if options[:name]
    title << titulo_articulo
  end
  
  def date_(options = {})
    fecha_publicacion = ''
    fecha_publicacion << "#{options[:dia]}" if options[:dia] << "/#{options[:mes]}" if options[:mes] << "/#{options[:year]}" if options[:year]
    date << fecha_publicacion
  end
  
  def abstract_(options = {})
    resumen = ''
    resumen << " #{options[:resumen]}" if options[:resumen]
    abstract << resumen
  end

  def to_s
    output = identificador_articulo
    output << "\n#{'=' * identificador_articulo.size}\n"
    output << "Author: #{author.join(' & ')}\n"
    output << "Journal: #{journal}\n"
    output << "Title: #{title}\n"
    output << "Date: #{date}\n"    
    output << "Abstract: #{abstract}\n"
    output
  end
end

  
 