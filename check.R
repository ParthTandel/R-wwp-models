library(magrittr)
library(lsa)
library(wordVectors)

source('check.R')
getwd()
files_list  = list.files(pattern = "*.bin$", recursive = TRUE)

rownames <- c()

data_frame <- data.frame()
data = list(c("away", "off"),
            c("before", "after"),
            c("best", "wisest"),
            c("body", "substance"),
            c("cause", "effects"),
            c("children", "parents"),
            c("christ", "jesus"),
            c("come", "go"),
            c("day", "night"),
            c("dear", "friend"),
            c("earth", "heaven"),
            c("eye", "glance"),
            c("fear", "dread"),
            c("first", "second"),
            c("find", "think"),
            c("give", "leave"),
            c("god", "almighty"),
            c("good", "bad"),
            c("head", "shoulders"),
            c("heart", "soul"),
            c("honour", "reputation"),
            c("house", "neighbourhood"),
            c("kind", "sort"),
            c("king", "prince"),
            c("leave", "quit"),
            c("life", "death"),
            c("light", "beams"),
            c("little", "small"))


data_list = list()

for(fn in files_list) {

  wwp_model = read.vectors(fn)
  sims <- c()
  for(pairs in data)
  {
    vector1 <- c()
    for(x in wwp_model[[pairs[1]]]) {
      vector1 <- c(vector1, x)
    }

    vector2 <- c()
    for(x in wwp_model[[pairs[2]]]) {
      vector2 <- c(vector2, x)
    }

    sims <- c(sims, cosine(vector1,vector2))
    f_name <- strsplit(fn, "/")[[1]][[2]]
    data_list[[f_name]] <- sims
  }

}

for(pairs in data)
{
  rownames <- c(rownames, paste(pairs[1], pairs[2], sep = "-"))
}
zs
results <- structure(data_list,
              class     = "data.frame",
              row.names = rownames
)

write.csv(file="results.csv", x=results)




