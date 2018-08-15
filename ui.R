library(shiny)

# Shiny UI definition
shinyUI(fluidPage(
  titlePanel("Iceberg! Right Ahead!"),
  sidebarLayout(
    sidebarPanel(
      "Enter passenger information and click the \"Avast, Ye\" button to calculate the corresponding probability of surviving the Titanic disaster.",
      radioButtons("class", h4("Passenger Class"), choices=list("1st", "2nd", "3rd", "Crew"), selected="3rd"),
      radioButtons("sex", h4("Sex"), choices=list("Male", "Female"), selected="Male"),
      radioButtons("age", h4("Age"), choices=list("Child", "Adult"), selected="Adult"),
      submitButton("Avast, ye!")
    ),

    mainPanel(
      h3("Your odds:"),
      h3(textOutput("survivalProb")),
      h4(textOutput("survivalText")),
      hr(),
      h5("Learn more about the Titanic:"),
      a("https://en.wikipedia.org/wiki/RMS_Titanic"),
      br(),
      a("https://www.encyclopedia-titanica.org/"),
      hr(),
      HTML("<span style=\"font-size:small\"><i>Percentage is based on the <tt>Titanic</tt> dataset included in R.</i></span>")
    )
  )
))
