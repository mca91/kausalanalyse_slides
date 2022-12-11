library(ggdag)

coords <- tribble(
~name,             ~"x", ~"y",
"World",      -1 ,   0 ,
"Theory",            0 ,   0 ,
"Question",           .5,   -.1,
"Hypothesis",        1 ,   0 ,
"Evidence",          0 ,  .1
)
p <- dagify(
Theory ~ World,
Hypothesis ~ Theory,
Evidence ~ Hypothesis,
Evidence ~ World,
Hypothesis ~ Question,
Question ~ Theory,
exposure = "Theory",
outcome = "Evidence",
coords = coords
) %>%
ggplot(aes(x = x, y = y, xend = xend, yend = yend)) +
geom_dag_text(color = "Black", check_overlap = T,
#nudge_x = c(.025, -.025, 0, 0)
) +
theme_dag()

out <- p + geom_dag_edges_link()

ggsave(plot = out,
filename = "researchquestion.png",
device = "png", width = 10, height = 4)
