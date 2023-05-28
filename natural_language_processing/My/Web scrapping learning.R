# WEB SCRAPPING - learning

library(rvest)

# Start by reading a HTML page with read_html():
starwars <- read_html("https://rvest.tidyverse.org/articles/starwars.html")
starwars # scrapped whole html code of a page
class(starwars)

# Then find elements that match a css selector using html_elements().
# In this example, each <section> corresponds to a different film
films <- starwars %>% html_elements("section")
films
# so HERE WE extracted these parts of code which are between <section>, </section>


# Then use html_element() to extract one element per film. Here
# we the title is given by the text inside <h2>
title <- films %>% 
  html_element("h2") %>% 
  html_text2()
title

# here only release_dates (first <p>), using element, not elements
release_dates <- films %>% html_element("p") %>% html_text2()
release_dates

# here extracting all paragraphs (so description for all movies)
description <- films %>% html_elements("p") %>% html_text2()
description


# Or use html_attr() to get data out of attributes. html_attr() always
# returns a string so we convert it to an integer using a readr function
episode <- films %>% 
  html_element("h2") %>% 
  html_attr("data-id") %>% 
  readr::parse_integer()
episode

url = "https://medium.com/@ankitmarwaha18/understanding-the-basics-of-natural-language-processing-nlp-77849431cb05"
NLP <- read_html(url)
text <- NLP %>% html_elements("ul")

  