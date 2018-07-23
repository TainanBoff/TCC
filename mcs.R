#' Nome: mcs.R
#' Descricao: Esse script importa previsoes de volatilidade para 10 acoes da B3. 
#' As previsoes de cada acao sao feitas utilizando o modelo HAR-RV com 48 combinacoes diferentes de medidas realizadas e frequencias amostrais.
#' As 48 previsoes de cada acao sao comparadas atraves do procedimento Model Confidence Set.
#' Autora: Tainan Boff, tainanboff@gmailcom

# Instala e carrega pacotes
install.packages()
install.packages('MCS')