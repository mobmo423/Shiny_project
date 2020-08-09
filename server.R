

function(input,output) {
  update_data = reactive(
    clean_data %>% select(Country, matches(input$colname)) %>% 
      arrange(desc(!!sym(input$colname))) %>% 
      top_n(10)
  )
  
  bottom_10_data = reactive(
    clean_data %>% select(Country, matches(input$colname)) %>% 
      arrange(!!sym(input$colname)) %>%
      top_n(-10)
  )
  
  output$variables_plot<-renderPlot({
    update_data() %>%
      ggplot(mapping = aes(x = reorder(Country, get(input$colname), FUN = mean),
                           y = get(input$colname))) +
      geom_bar(stat = "identity",
               fill = "green") +
      labs(x = "Country", y = input$colname) +
      ggtitle('Top 10 Countries')+
      coord_flip()
  })
  
  output$bottom_10_plot = renderPlot({
    bottom_10_data() %>%
      ggplot(mapping = aes(x = reorder(Country, get(input$colname), FUN = mean),
                           y = get(input$colname))) +
      geom_bar(stat = "identity",
               fill = "brown") +
      labs(x = "Country", y = input$colname) +
      ggtitle('Bottom 10 Countries')+
      coord_flip()
  })
  
  output$GDP_plot = renderPlot({
      ggplot(data = clean_data, aes(x = Total.Ecological.Footprint, y = GDP_per_capita)) +
        geom_point(aes(color = Region)) +
      ggtitle('GDP vrs Total Ecological Footprint Analysis')
  })
  
  output$GDP_box = renderPlot({
    ggplot(data=clean_data, aes(x=reorder(Region, Total.Ecological.Footprint, median), y=Total.Ecological.Footprint)) +
      geom_boxplot() +
      ggtitle('Total Ecological Footprint comparison among regions') +
      coord_flip()
  })
  
  output$Biocapacity = renderPlot({
    ggplot(data = clean_data, aes(x = Biocapacity.Deficit.or.Reserve, y = GDP_per_capita )) +
      geom_point(aes(color = Region)) +
      ggtitle('Biocapacity Ddeficit or Reserve')
  })
  
  output$Pop_Biocapacity = renderPlot({
    ggplot(data = clean_data, aes(x = Biocapacity.Deficit.or.Reserve, y = Population..millions.)) +
      geom_point(aes(color = Region)) +
      ggtitle('Population vrs Biocapacity.Deficit.or.Reserve Analysis')
  })
  
  output$pop_total = renderPlot({
    ggplot(data = clean_data, aes(x = Total.Ecological.Footprint, y = Population..millions.)) +
      geom_point(aes(color = Region)) +
      ggtitle('Population vrs Total Ecological Footprint')
  })
  
}


