# install.packages("VennDiagram")
library(VennDiagram)

# Construct diagram.
venn1 <- draw.single.venn(10, "Duck")

# Look at structure.
grid.ls(venn1)
str(venn1)

# Change labels.
venn1[[3]]$label <- "Duck"
venn1[[4]]$label <- ""

# Redraw.
grid.newpage()
grid.draw(venn1)


#
# Two categories
#

venn2 <- draw.pairwise.venn(100, 100, 40, c("Beaver Playing a Guitar", "Duck Playing a Keyboard"))
grid.ls(venn2)
venn2[[5]]$label <- "Beaver Playing a Guitar"
venn2[[6]]$label <- "Duck Playing a Keyboard"
venn2[[7]]$label <- "Platypus Playing a Keytar"
venn2[[8]]$label <- ""
venn2[[9]]$label <- ""
grid.newpage()
grid.draw(venn2)


#
# Three categories
#

categories <- c("Flour", "Egg", "Milk")
venn3 <- draw.triple.venn(10, 10, 10, 3, 3, 3, 3, category=categories)
venn3[[7]]$label <- "Flour"
venn3[[8]]$label <- "Pasta"
venn3[[9]]$label <- "Egg"
venn3[[10]]$label <- "Batter"
venn3[[11]]$label <- "Pancakes"
venn3[[12]]$label <- "Omelette"
venn3[[13]]$label <- "Milk"
venn3[[14]]$label <- ""
venn3[[15]]$label <- ""
venn3[[16]]$label <- ""

# Draw it.
grid.newpage()
grid.draw(venn3)

# Different font sizes
venn3[[7]]$label <- ""
venn3[[9]]$label <- ""
venn3[[13]]$label <- ""
grid.newpage()
grid.draw(venn3)
grid.text("Flour", unit(venn3[[7]]$x, "npc"), unit(venn3[[7]]$y, "npc"), gp=gpar(cex=2))
grid.text("Egg", unit(venn3[[9]]$x, "npc"), unit(venn3[[9]]$y, "npc"), gp=gpar(cex=2))
grid.text("Milk", unit(venn3[[13]]$x, "npc"), unit(venn3[[13]]$y, "npc"), gp=gpar(cex=2))



#
# Colors.
#


venn2 <- draw.pairwise.venn(100, 100, 40, c("Beaver Playing a Guitar", "Duck Playing a Keyboard"), fill = c("#73F1DE", "#F2F68F"), col = NA)
grid.ls(venn2)
venn2[[5]]$label <- "Beaver Playing a Guitar"
venn2[[6]]$label <- "Duck Playing a Keyboard"
venn2[[7]]$label <- "Platypus Playing a Keytar"
venn2[[8]]$label <- ""
venn2[[9]]$label <- ""
grid.newpage()
grid.draw(venn2)


#
# Custom intersection color. 
#

# install.packages("polyclip")
library(polyclip)
venn2 <- draw.pairwise.venn(100, 100, 40, c("Beaver Playing a Guitar", "Duck Playing a Keyboard"), fill = c("#73F1DE", "#F2F68F"), col = NA)

# Deal with intersection. Source: http://datafl.ws/65i
A <- list(list(x = as.vector(venn2[[3]][[1]]), y = as.vector(venn2[[3]][[2]])))
B <- list(list(x = as.vector(venn2[[4]][[1]]), y = as.vector(venn2[[4]][[2]])))
AintB <- polyclip(A, B)
par(mar=c(0,0,0,0))
plot(c(0, 1), c(0, 1), type = "n", axes = FALSE, xlab = "", ylab = "", asp=1)
polygon(A[[1]], border = NA, col="#73F1DE")
polygon(B[[1]], border = NA, col="#F2F68F")
polygon(AintB[[1]], border=NA, col = "#95F1B0")

# Labels
text(venn2[[5]]$x, venn2[[5]]$y, "Beaver Playing\na Guitar", font = 3)
text(venn2[[6]]$x, venn2[[6]]$y, "Duck Playing\na Keyboard", font = 3)
text(venn2[[7]]$x, venn2[[7]]$y, "Platypus Playing\na Keytar", font = 3)

# Title? Sure.
par("usr")  # For if you want to see the dimensions of the current plot.
text(.5, .92, "What do you get when you cross a beaver\nplaying a guitar and a duck playing a keyboard?", cex=1.2, font=3)


