# encoding: utf-8
class HomeController < ApplicationController
  def index
    agent = Mechanize.new
    page = agent.get("http://www1.caixa.gov.br/loterias/loterias/quina/quina_pesquisa_new.asp?")
    @ultimo_concurso = page.search("body").text[0..3].to_i
  end

  def salvar_dados_na_session
    session[params["atributo"]] = params["valor"]
    render :nothing => true
  end

  def resultado

    session[:concurso_inicio] = params[:concurso_inicio]
    session[:concurso_fim] = params[:concurso_fim]

    jogos = []
    
    @resultados = []

    ('a'..'d').each do |l|
      jogo = []
      (1..5).each do |n|
        session["n#{l}#{n}"] = params["n#{l}#{n}"]
        jogo << params["n#{l}#{n}"].to_i
      end
      jogos << jogo 
    end

    agent = Mechanize.new

    (params[:concurso_inicio]..params[:concurso_fim]).each do |concurso|

      page = agent.get("http://www1.caixa.gov.br/loterias/loterias/quina/quina_pesquisa_new.asp?submeteu=sim&opcao=concurso&txtConcurso=#{concurso}")

      sorteados = page.search("span#sorteio2>ul>li").map {|x| x.text.to_i}

      jogos.each do |jogo|
        acertos = []
        jogo.each do |numero|
          acertos << numero if sorteados.include?(numero)
        end
        if acertos.empty?
          @resultados << "Concurso: #{concurso}. Você não acertou nenhum número. Os números sorteados foram: #{sorteados.join(', ')}."
        elsif acertos.size == 1
          @resultados << "Concurso: #{concurso}. Você só acertou o número #{acertos[0]}. Os números sorteados foram: #{sorteados.join(', ')}." 
        else
          @resultados << "Concurso: #{concurso}. Você acertou os números: #{acertos.join(', ')}. Os números sorteados foram: #{sorteados.join(', ')}."
        end
      end
    end
  end
end
