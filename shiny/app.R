library(shiny)
library(shinydashboard)
library(dplyr)
library(ggplot2)
library(plotly)
library(DT)

data <- read.csv("data/premier_league_dataset.csv")

ui <- dashboardPage(
  dashboardHeader(title = "Premier League - Analyse"),
  
  dashboardSidebar(
    sidebarMenu(id = "tabs",
                menuItem("Total Buts par Club", tabName = "total_goals", icon = icon("futbol")),
                menuItem("Top buteurs de chaque club", tabName = "club_top_scorers", icon = icon("chart-bar"))
    ),
    
    conditionalPanel(
      condition = "input.tabs == 'club_top_scorers'",
      selectInput("club", "Choisir un club :", 
                  choices = unique(data$Club),
                  selected = unique(data$Club)[1]
      ),
      sliderInput("top_n", "Nombre de joueurs à afficher :", 
                  min = 5, max = 50, value = 10, step = 1)
    ),
    
    conditionalPanel(
      condition = "input.tabs == 'total_goals'",
      sliderInput("top_clubs", "Nombre de clubs à afficher :", 
                  min = 3, max = length(unique(data$Club)), value = 10, step = 1)
    )
  ),
  
  dashboardBody(
    tabItems(
      
      # PAGE 1 : TOTAL BUTS PAR CLUB
      tabItem(tabName = "total_goals",
              fluidRow(
                box(
                  title = "Clubs les plus performants offensivement",
                  width = 12,
                  plotlyOutput("total_goals_plot")
                )
              ),
              fluidRow(
                box(
                  title = "Total des buts marqués par club", 
                  width = 12,
                  dataTableOutput("total_goals_table")
                )
              )
      ),
      
      # PAGE 2 : TOP BUTEURS PAR CLUB + STATS OFFENSIVES CLUB
      tabItem(tabName = "club_top_scorers",
              fluidRow(
                valueBoxOutput("club_avg_goals"),
                valueBoxOutput("club_avg_assists"),
                valueBoxOutput("club_avg_shots")
              ),
              fluidRow(
                box(
                  title = "Top joueurs selon les buts", 
                  width = 12,
                  plotlyOutput("bar_plot")
                )
              )
      )
    )
  )
)

server <- function(input, output) {
  
  # Filtrage selon club sélectionné
  filteredData <- reactive({
    req(input$club)
    data %>% filter(Club == input$club)
  })
  
  # Statistiques offensives du club sélectionné
  output$club_avg_goals <- renderValueBox({
    avg <- mean(filteredData()$Goals, na.rm = TRUE)
    valueBox(round(avg, 2), "Buts moyens", icon = icon("futbol"), color = "green")
  })
  
  output$club_avg_assists <- renderValueBox({
    avg <- mean(filteredData()$Assists, na.rm = TRUE)
    valueBox(round(avg, 2), "Passes décisives moy.", icon = icon("arrow-right"), color = "orange")
  })
  
  output$club_avg_shots <- renderValueBox({
    avg <- mean(filteredData()$Shots, na.rm = TRUE)
    valueBox(round(avg, 2), "Tirs moyens", icon = icon("bullseye"), color = "blue")
  })
  
  # Bar plot des buteurs du club sélectionné
  output$bar_plot <- renderPlotly({
    top_players <- filteredData() %>%
      arrange(desc(Goals)) %>%
      slice_head(n = input$top_n)
    
    p <- ggplot(top_players, aes(x = reorder(Name, Goals), y = Goals, fill = Club)) +
      geom_bar(stat = "identity") +
      coord_flip() +
      labs(title = paste("Top", input$top_n, "buteurs -", input$club),
           x = "Joueur", y = "Buts") +
      theme_minimal()
    
    ggplotly(p)
  })
  
  # Données agrégées : total buts par club
  total_goals_clubs <- reactive({
    data %>%
      group_by(Club) %>%
      summarise(TotalGoals = sum(Goals, na.rm = TRUE)) %>%
      arrange(desc(TotalGoals))
  })
  
  # Tableau des clubs
  output$total_goals_table <- renderDataTable({
    total_goals_clubs() %>%
      slice_head(n = input$top_clubs) %>%
      datatable(options = list(pageLength = 10))
  })
  
  # Graphe des clubs
  output$total_goals_plot <- renderPlotly({
    df <- total_goals_clubs() %>% slice_head(n = input$top_clubs)
    
    p <- ggplot(df, aes(x = reorder(Club, TotalGoals), y = TotalGoals, fill = Club)) +
      geom_bar(stat = "identity") +
      coord_flip() +
      labs(title = paste("Top", input$top_clubs, "clubs par nombre total de buts"),
           x = "Club", y = "Total des buts") +
      theme_minimal() +
      theme(legend.position = "none")
    
    ggplotly(p)
  })
}

shinyApp(ui, server)
