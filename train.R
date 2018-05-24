#! /usr/bin/env Rscript

library(wordVectors)

################################################################################
## set constants

# filenames
CLEANTEXTFILE <- '/home/parth/work_files/wwp/cleantext.txt'
BINFILE_BASE <- '/home/parth/work_files/wwp/models/w12i05d050n2'

# number of threads word2vec can use
THREADS <- 47

# set parameters for training model
WINDOW_SIZE <- 12
ITERATIONS <- 5
DIMENSIONS <- 50
NEGATIVE <- 2

################################################################################
# train the models

print(CLEANTEXTFILE)

for (i in 1:10) {
    binfile <- paste(BINFILE_BASE, '_', sprintf('%02i', i), '.bin', sep='')
    print(binfile)
    if (file.exists(binfile)) file.remove(binfile)
    wwp_model <- train_word2vec(
      CLEANTEXTFILE,
      output_file=binfile,
      threads=THREADS,
      vectors=DIMENSIONS, window=WINDOW_SIZE, iter=ITERATIONS,
      negative_samples=NEGATIVE
    )
  }
