require 'mongo'
require 'mongoid'
require 'bson'

#x = Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'MemoryCPU')
#result = x[:contrato].insert_one({ nome: 'FKA Twigs', _id: 2}) # insercao no banco mongoDB

#teste = x[:contrato].find()

#id = 0

#puts x[:contrato].methods.to_a

#teste.each do |document|
#	puts "ok"	
#	a = BSON::Document.new(document)
#	puts "--> #{a["nome"]}:#{a["_id"]}"
#	id = id+1
	#x[:contrato].delete_one(:_id => 2)
#end

#======================================================================#
  def save(objeto,nome_arquivo)
    
    File.open(nome_arquivo,'w') do |f|
      Marshal.dump(objeto, f)
    end
    
  end
  #======================================================================#
 
  #======================================================================#
  def load(nome_arquivo)
    
    objeto = File.open(nome_arquivo) do |file|
      Marshal.load(file)
    end
    
    return(objeto)
  end
  #======================================================================#


    # Verificando se o sistema já foi iniciado anteriormente
    if(File.exist?("data_memory//module_Hash.mem"))

      @add_functions = load("data_memory//module_Hash.mem")
	puts @add_functions      
    else

      @add_functions = Hash.new
	@add_functions[:asd] = 1
      save(@add_functions,"data_memory//module_Hash.mem") 
    end
