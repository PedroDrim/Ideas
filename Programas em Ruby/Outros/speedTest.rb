#texto = gets().chop!
texto = "Hello World!"*100
tamanho = texto.split("").length - 1

for i in 0..tamanho
	p "#{texto[0..i]}"
end


