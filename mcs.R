#' Nome: mcs.R
#' Descricao: Esse script importa previsoes de volatilidade para 10 acoes da B3. 
#' As previsoes de cada acao sao feitas utilizando o modelo HAR-RV com 48 combinacoes diferentes de medidas realizadas e frequencias amostrais.
#' As 48 previsoes de cada acao sao comparadas atraves do procedimento Model Confidence Set.
#' Autora: Tainan Boff, tainanboff@gmailcom

# Instala os pacotes
install.packages('xts')
install.packages('MCS')
install.packages('repmis')
install.packages("parallel")

# Carrega os pacotes
library(xts)
library(MCS)
library(repmis)
library(parallel)

# Baixa os dados do GitHub
source_data("https://github.com/TainanBoff/TCC/blob/master/perdas.RData?raw=True")

# Identifica o numero de cl (menos 1) para usar processamento em paralelo e cria cluster
cores <- detectcl() - 1
cl <- makeCluster(cores)

# Roda o Model Confidence Set e salva os resultados para cada acao. 
# Tem que inserir o link da pasta onde os resultados serao salvos.

MCS.itub4 <- MCSprocedure(perda.itub4, alpha = 0.05, B = 10000, statistic = "TR", k = NULL, cl = cl)
saveRDS(MCS.itub4, "/mcs_itub4.RDS")

MCS.trpl4 <- MCSprocedure(perda.trpl4, alpha = 0.05, B = 10000, statistic = "TR", k = NULL, cl = cl)
saveRDS(MCS.trpl4, "/mcs_trpl4.RDS")

MCS.vale3 <- MCSprocedure(perda.vale3, alpha = 0.05, B = 10000, statistic = "TR", k = NULL, cl = cl)
saveRDS(MCS.vale3, "/mcs_vale3.RDS")

MCS.csmg3 <- MCSprocedure(perda.csmg3, alpha = 0.05, B = 10000, statistic = "TR", k = NULL, cl = cl)
saveRDS(MCS.csmg3, "/mcs_csmg3.RDS")

MCS.bbdc4 <- MCSprocedure(perda.bbdc4, alpha = 0.05, B = 10000, statistic = "TR", k = NULL, cl = cl)
saveRDS(MCS.bbdc4, "/mcs_bbdc4.RDS")

MCS.btow3 <- MCSprocedure(perda.btow3, alpha = 0.05, B = 10000, statistic = "TR", k = NULL, cl = cl)
saveRDS(MCS.btow3, "/mcs_btow3.RDS")

MCS.lren3 <- MCSprocedure(perda.lren3, alpha = 0.05, B = 10000, statistic = "TR", k = NULL, cl = cl)
saveRDS(MCS.lren3, "/mcs_lren3.RDS")

MCS.pssa3 <- MCSprocedure(perda.pssa3, alpha = 0.05, B = 10000, statistic = "TR", k = NULL, cl = cl)
saveRDS(MCS.pssa3, "/mcs_pssa3.RDS")
  
MCS.vale5 <- MCSprocedure(perda.vale5, alpha = 0.05, B = 10000, statistic = "TR", k = NULL, cl = cl)
saveRDS(MCS.vale5, "/mcs_vale5.RDS")

MCS.bbdc3 <- MCSprocedure(perda.bbdc3, alpha = 0.05, B = 10000, statistic = "TR", k = NULL, cl = cl)
saveRDS(MCS.trpl4, "/mcs_bbdc3.RDS")

stopCluster(cl)