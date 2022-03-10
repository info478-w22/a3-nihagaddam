library(dplyr)
library(ggplot2)
library(tidyverse)
library(leaflet)
library(tigris)
require(EpiModel)

server <- function(input, output) {

  output$d_mod <- renderPlot({
    param <- param.dcm(inf.prob = as.numeric(input$intervention), act.rate = 1, rec.rate = 0.05)
    init <- init.dcm(s.num = 500, i.num = 4)
    control <- control.dcm(type = "SIS", nsteps = 365, dt = 0.5)
    d_mod <- dcm(param, init, control)

  plot(d_mod)
  })
  
  output$mod.icm <- renderPlot({
    param.icm <- param.icm(inf.prob = c(as.numeric(input$intervention_icm)), act.rate = 0.5, rec.rate = 0.01)
    init.icm <- init.icm(s.num = 500, i.num = 4, r.num = 0)
    control.icm <- control.icm(type = "SIS", nsims = 100, nsteps = 365)
    mod.icm <- icm(param.icm, init.icm, control.icm)
    
    plot(mod.icm)
  })
}