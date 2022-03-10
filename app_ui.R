library(shiny)

tab1 <-  tabPanel("Introduction",
         tags$p(
         id = "Introduction",
         "This website seeks to explore how various COVID-19 interventions affect different disease models.
         The interventions included in this analysis are social distancing and face mask usage. The first page 
         explores these interventions in a Deterministic Model where recovery from COVID does not give immunity.
         The second page explores the interventions in a Stochastic Model where all of the risks 
         are randomly picked from summarized distributions of the rates or probabilities.")
)

tab2 <-  tabPanel("Deterministic Model",
                  pageWithSidebar(
                    headerPanel('Exploring Various Interventions'),
                    sidebarPanel(
                      selectInput("intervention", label = "Select Intervention", 
                                  choices = list("No Intervention" = 0.9, "Practice Social Distancing" = .26, "Use Face Masks in Public" = .31) 
                                  ,selected = "No Intervention")
                    ),
                    mainPanel(
                      plotOutput('d_mod')
                    )
                  )
)

tab3 <-  tabPanel("Stochastic Model",
                  pageWithSidebar(
                    headerPanel('Exploring Various Interventions'),
                    sidebarPanel(
                      selectInput("intervention_icm", label = "Select Intervention", 
                                  choices = list("No Intervention" = 0.9, "Practice Social Distancing" = .26, "Use Face Masks in Public" = .31) 
                                  ,selected = "No Intervention")
                    ),
                    mainPanel(
                      plotOutput('mod.icm')
                    )
                  )
)
#For example, what happens as you change the parameters? 
#What differences do you observe between the models? 
#What limitations do you believe are in your approach? 
  
  
tab4 <-  tabPanel("Interpretation",
                  tags$p(
                    id = "Interpretation",
                    "After comparing the two models, I can see how they have slight differences.
                    For instance, when I changed the parameter to practicing social distancing,
                    the susceptible rate decreases at a steeper and faster rate in the Deterministic Model
                    than in the Stochastic Model, but is not as steep as the control model. This difference could be attributed to how the Stochastic
                    Model simulates the spread of COVID-19 within a population of individually identifiable elements.
                    The same pattern of a steeper decreasing rate in susceptible populations is apparent when switching
                    to using faces masks in public for the Deterministic Model. This model shows the drop from 500 individuals to
                    100, and 500 to about 50 individuals in the second model.
                    I believe that there are limitations to my approach because my model does not account for if 
                    other people are wearing masks, and if they are wearing N95s. This changes the infection probability of getting COVID-19.")
)

ui <- navbarPage(title = "Assignment 3",
                 tab1,
                 tab2,
                 tab3,
                 tab4
)
