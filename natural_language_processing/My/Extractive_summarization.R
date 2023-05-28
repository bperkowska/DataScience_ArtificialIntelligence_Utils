
  # for scrapping
library(rvest)

  # for extractive summarization
library(lexRankr)

# SCRAPPING
url = "https://www.theguardian.com/world/2023/may/18/italy-disasters-floods-europe-climate-crisis"
page <- read_html(url)
page

text<- page %>%
      rvest::html_nodes("p") %>%
      rvest::html_text() %>%
      .[. != ""]

# see data
head(text)

# The sentences are ranked based on their centrality in a graph.
# The graph is built upon the pairwise similarities of the sentences
# (where similarity is measured with a modified idf cosine similarity function).


# perform lexrank 
topSentences = lexRankr::lexRank(text,
                                  # only 1 article; repeat same docid for all of input vector
                                  docId = rep(1, length(text)),
                                  # return 2 sentences
                                  n = 3,
                                  continuous = TRUE)
# see results
topSentences

topSentences$sentence
