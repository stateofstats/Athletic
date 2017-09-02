
# Wild game score table & ggplot

library(ggplot2)
library(dplyr)
library(extrafont)


getwd()
list.files(
)

# PC path
setwd("C:/Users/Derek Peterson/Documents/NHL/Game Score Archives/Skaters")

gs2017 <- read.csv("2016-17 Game Score.csv", header = TRUE, stringsAsFactors = FALSE)


gs2017

gsmn <- gs2017 %>%
  filter(TEAM == "MIN") %>%
  arrange(desc(round(PER.GAME,2)))

gsmn$POS.GROUP <- ifelse(gsmn$POS == "R" | 
                           gsmn$POS == "C" |
                           gsmn$POS == "L",
                         "F", "D")
pscale <- round(seq(from = min(gsmn$PER.GAME), to = max(gsmn$PER.GAME) + .10, by = .10),2)

g <- ggplot(gsmn, aes(x = reorder(PLAYER, PER.GAME), y = PER.GAME, fill = POS.GROUP)) +
  geom_bar(stat = "identity") +
  #geom_text(data = gsmn, aes(label = PER.GAME), size = 4, position = position_stack(vjust = .5)) + 
  scale_y_continuous(breaks = pscale) + 
  scale_fill_manual(values = c("#EEE3C7", "darkgreen")) +
  ggtitle("2016/17 Game Score Per Game") +
  labs(x = NULL, y = "Game Score Per Game") +
  guides(fill = guide_legend(title = "Position")) +
  theme(plot.title = element_text(hjust = .5)) +
  coord_flip()

g




