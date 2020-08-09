fluidPage(
  titlePanel('Global Ecological Footprint'),
  sidebarLayout(
    sidebarPanel(
      #Text to indicate which tab the dropdown menu filter
      h5("This widget controls EXPLORE Tab", style = "color:red"),
      selectizeInput(inputId = "colname",
                     label = "choose ecological area ",
                     choices = c('Cropland.Footprint', 'Grazing.Footprint', 'Forest.Footprint','Carbon.Footprint', 'Fish.Footprint', 'Total.Ecological.Footprint', 'Total.Biocapacity', 'Biocapacity.Deficit.or.Reserve'),
                     selected = 'Carbon.Footprint')
    ),
    mainPanel(
      tabsetPanel(
        tabPanel('INTRODUCTION',
                 fluidRow(
                   br(),
                   column(12, h4("The ecological footprint measures the ecological assets that a given population requires to produce the natural resources it consumes (including plant-based food and fiber products, livestock and fish products, timber and other forest products, space for urban infrastructure) and to absorb its waste, especially carbon emissions.")),
                   img(src = 'https://www.mdpi.com/resources/resources-07-00058/article_deploy/html/images/resources-07-00058-g004.png', width="75%")
                 )
                 
        ),
        tabPanel('EXPLORE',
                 br(),
                 column(12, h4("Explore the ecological Footprints of various countries. Plots show the countries in the top and bottom 10 levels of the selected ecological footprint.")),
                 fluidRow(plotOutput('variables_plot')),
                 (plotOutput('bottom_10_plot'))
        ),
        tabPanel('GDP ANALYSIS',
                 br(),
                 column(12, h4("GDP per Capita has a positve linear relatioship with the Total ecological Footprint of most countries. However,there is no dependency between Biocapacity deficit or reserve and GDP ")),
                 fluidRow(plotOutput('GDP_plot')),
                 br(),
                 (plotOutput('Biocapacity'))
        ),
        tabPanel('POPULATION ANALYSIS',
                 br(),
                 column(12, h4("There seem to be no or negataive linear relationship between variables.")),
                 fluidRow(plotOutput('Pop_Biocapacity')),
                 br(),
                 (plotOutput('pop_total'))
        ),
        tabPanel("CONCLUSION",
                 br(),
                 column(12, h4("The total ecological footprint of countires tend to get higher as people get richer as demonstrated by the GDP per capita analysis with total ecological footprint.")),
                 br(),
                 br(),
                 column(12, h4("The European Union seem to be doing better in this area.")),
        ),
        tabPanel('ABOUT AUTHOR',
                 br(),
                 column(12, h4("Michael Odame-Boahene,\
                               NYC Data Science Academy,\
                               MEng BIological and Environmental Engineering, Cornell University."))
                 
        )
      ),
      
    )
  )
)















  