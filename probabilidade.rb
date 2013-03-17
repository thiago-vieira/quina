# encoding: utf-8
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

jogo = [7, 16, 25, 34, 43]

num_jogo = 1
num_ternos = 0
num_quadras = 0
num_quinas = 0
while num_jogo <= (6*4*12*40) do  # quarenta anos de jogos
   sorteadas = sortear
   acertos = 0
   sorteadas.each { |s| acertos += 1 if jogo.include?(s) }
   num_ternos += 1 if acertos == 3
   num_quadras += 1 if acertos == 4
   num_quinas += 1 if acertos == 5
   quando = num_jogo / 365.0
   quando = (quando >= 1.0) ? "#{quando.to_i}º ano" : "#{(quando * 12).round}º mês"
   puts "Ganhou o terno no #{quando}" if acertos == 3
   puts "Ganhou a quadra no #{quando}" if acertos == 4
   puts "Ganhou a quina no #{quando}" if acertos == 5
   num_jogo += 1
end
puts "#######################################################"
puts "Total de ternos: #{num_ternos}" if num_ternos > 0
puts "Total de quadras: #{num_quadras}" if num_quadras > 0
puts "Total de quinas: #{num_quinas}" if num_quinas > 0