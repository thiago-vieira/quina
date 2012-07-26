#encoding: utf-8
require 'mechanize'

agent = Mechanize.new

concurso = 2952

page = agent.get("http://www1.caixa.gov.br/loterias/loterias/quina/quina_pesquisa_new.asp?submeteu=sim&opcao=concurso&txtConcurso=#{concurso}")

sorteados = page.search("span#sorteio2>ul>li").map {|x| x.text.to_i}

p sorteados