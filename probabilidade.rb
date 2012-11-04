def sortear
  arranjo = (1..80).to_a
  sorteadas = []
  5.times do 
     indice = rand(arranjo.count)
     bola = arranjo[indice]
     sorteadas << bola
     arranjo.delete bola
  end
  return sorteadas
end

jogo = [1, 2, 3, 4, 5]

x = 1
acertos = 0
while acertos < 5 && x <= (317*40) do
   sorteadas = sortear
   acertos = 0
   sorteadas.each {|s| acertos = acertos + 1 if jogo.include?(s)}
   puts "Ganhou o terno no sorteio #{x}" if acertos == 3
   puts "Ganhou a quadra no sorteio #{x}" if acertos == 4
   puts "Ganhou a quina no sorteio #{x}" if acertos == 5
   x = x + 1
end





