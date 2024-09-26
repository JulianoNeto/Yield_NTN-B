
ntnb45 <- read.TD.files(dl.folder = 'TD Files') |>
  filter(asset.code == "NTN-B 150545")

install.packages("GetTDData")
library(GetTDData)
ls("package:GetTDData")
help(package = "GetTDData")
get_td_names()
td_get('NTN-B')

# Primeiro, vamos atribuir o resultado de td_get('NTN-B') a uma variável

dados_ntnb <- td_get('NTN-B')

# Agora, vamos filtrar para obter apenas os dados da NTN-B 150545

ntnb45 <- dados_ntnb |>
  dplyr::filter(asset_code == "NTN-B 150545")

# Visualizar as primeiras linhas do resultado

head(ntnb45)

library(ggplot2)
library(scales)
ls("package:ggplot2")

ggplot(ntnb45, aes(x = ref_date, y = yield_bid*100)) +
  geom_line() +
  scale_x_date(date_breaks = "1 year", date_labels = "%Y") +
  labs(title = "Evolução do Yield da NTN-B 150545",
       x = "Data",
       y = "Yield (%)")
