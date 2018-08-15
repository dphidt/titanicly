library(shiny)
data(Titanic)

# The shiny server
shinyServer(function(input, output) {
  # Calculate the probability of survival
  survivalProb <- reactive({
    # UI inputs
    class <- input$class
    sex <- input$sex
    age <- input$age

    # Titanic data
    dft <- as.data.frame(Titanic)

    # Probability for a given class/sex/age
    dft <- dft[which(dft$Class == class & dft$Sex == sex & dft$Age == age),]
    freqA <- dft[which(dft$Survived == "No"),]$Freq
    freqB <- dft[which(dft$Survived == "Yes"),]$Freq
    100.0 * freqB / (freqA + freqB)
  })

  # Generate descriptive text given a probability
  survivalText <- function(prob) {
    if (prob > 90) {
      "Lucky you, get to the lifeboat!"
    }
    else if (prob > 60) {
      "You've got a fighting chance."
    }
    else if (prob > 30) {
      "Not looking too good..."
    }
    else {
      "Better find some flotsam (a door?)"
    }
  }

  # Output: Survival probability
  output$survivalProb <- renderText({
    paste(format(survivalProb(), digits=4), "%")
  })

  # Output: Descriptive text
  output$survivalText <- renderText({
    survivalText(survivalProb())
  })
})
