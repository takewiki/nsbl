

#shinyserver start point----
 shinyServer(function(input, output,session) {
   
   #1.文件级黑名单上传--------
   
    file_filter <- var_file('bl_file_sel');
    
    data_file <- reactive({
      res <- readExcelDf(file_filter())
      return(res);
    })
    #1.1预览--------
    observeEvent(input$bl_file_preview,{
      run_dataTable2('bl_file_data_show',data = data_file())
    })
    
    #处理上传服务器逻辑；
    
    
    var_brand_file <- var_ListChoose1('file_brand')
    #1.2 上传服务器-------
    observeEvent(input$bl_file_upload,{
      #处理数据
      
      #处理日期
      FDate <- as.character(Sys.Date());
      data <- data_file()
      names(data) <-c('FIs','FLike'); 
      
      FIs <- data$FIs; 
      FLike <- data$FLike;
      data1 <- data.frame(FKeyWord = FIs,
                          FDate,
                          FType='is',
                          FBrand=   var_brand_file(),stringsAsFactors = F);
      data2 <- data.frame(FKeyWord = FLike,
                          FDate,
                          FType='like',
                          FBrand=   var_brand_file(),stringsAsFactors = F);
      res <-rbind(data1,data2);
      #View(res);
      #str(res);
      res <- res[!is.na(res$FKeyWord), ]
      ncount <- nrow(res);
      #暂时不处理ID-------
      sql_file <- "select FKeyWord,FDate,FType,FBrand from filter_file";
      data_new <-sql_select(conn_nsim,sql_file);
      if (nrow(data_new) == 0){
        res$FId <- 1:ncount;
        res <- res[,c('FId','FKeyWord','FDate','FType','FBrand')]
        tsda::db_writeTable(conn=conn_nsim,table_name = 'filter_file',r_object = res,append = T)
        tsui::pop_notice(paste("上传了",ncount,"条记录!",sep=""))
      } else{
        data_diff <-tsdo::df_setdiff(res,data_new);
        
        if (nrow(data_diff) >0 ){
          sql_max_id <- "select max(FId) as FId  from filter_file"
          max_id <- sql_select(conn_nsim,sql_max_id);
          max_id <- max_id$FId[1];
          data_diff$FId <-1:nrow(data_diff)+max_id;
          data_diff <- data_diff[,c('FId','FKeyWord','FDate','FType','FBrand')];
          tsda::db_writeTable(conn=conn_nsim,table_name = 'filter_file',r_object = data_diff,append = T)
          tsui::pop_notice(paste("上传了",nrow(data_diff),"条记录!",sep=""))
        }else{
          tsui::pop_notice(paste("上传了0条记录!",sep=""))
        }
      
        
        
      }
      
      

      
    })
    
    
    
    #2.问题级黑名单上传--------
    
    ques_filter <- var_file('bl_ques_sel');
    
    data_ques <- reactive({
      res <- readExcelDf(ques_filter())
      return(res);
    })
    
    observeEvent(input$bl_ques_preview,{
      run_dataTable2('bl_ques_data_show',data = data_ques())
    })
    
    #处理上传服务器逻辑；
    
    
    var_brand_ques <- var_ListChoose1('ques_brand')
    observeEvent(input$bl_ques_upload,{
      #处理数据
      
      #处理日期
      FDate <- as.character(Sys.Date());
      data <- data_ques()
      names(data) <-c('FIs','FLike'); 
      
      FIs <- data$FIs; 
      FLike <- data$FLike;
      data1 <- data.frame(FKeyWord = FIs,
                          FDate,
                          FType='is',
                          FBrand=   var_brand_ques(),stringsAsFactors = F);
      data2 <- data.frame(FKeyWord = FLike,
                          FDate,
                          FType='like',
                          FBrand=   var_brand_ques(),stringsAsFactors = F);
      res <-rbind(data1,data2);
      #View(res);
      str(res);
      res <- res[!is.na(res$FKeyWord), ]
      ncount <- nrow(res);
      #暂时不处理ID-------
      sql_ques <- "select FKeyWord,FDate,FType,FBrand from filter_question";
      data_new <-sql_select(conn_nsim,sql_ques);
      if (nrow(data_new) == 0){
        res$FId <- 1:ncount;
        res <- res[,c('FId','FKeyWord','FDate','FType','FBrand')]
        tsda::db_writeTable(conn=conn_nsim,table_name = 'filter_question',r_object = res,append = T)
        tsui::pop_notice(paste("上传了",ncount,"条记录!",sep=""))
      } else{
        data_diff <-tsdo::df_setdiff(res,data_new);
        
        if (nrow(data_diff) >0 ){
          sql_max_id <- "select max(FId) as FId  from filter_question"
          max_id <- sql_select(conn_nsim,sql_max_id);
          max_id <- max_id$FId[1];
          data_diff$FId <-1:nrow(data_diff)+max_id;
          data_diff <- data_diff[,c('FId','FKeyWord','FDate','FType','FBrand')];
          tsda::db_writeTable(conn=conn_nsim,table_name = 'filter_question',r_object = data_diff,append = T)
          tsui::pop_notice(paste("上传了",nrow(data_diff),"条记录!",sep=""))
        }else{
          tsui::pop_notice(paste("上传了0条记录!",sep=""))
        }
        
        
        
      }
      
      
      
      
    })
    
    
    #3.答案级黑名单上传--------
    
    answ_filter <- var_file('bl_answ_sel');
    
    data_answ <- reactive({
      res <- readExcelDf(answ_filter())
      return(res);
    })
    
    observeEvent(input$bl_answ_preview,{
      run_dataTable2('bl_answ_data_show',data = data_answ())
    })
    
    #处理上传服务器逻辑；
    
    
    var_brand_answ <- var_ListChoose1('answ_brand')
    observeEvent(input$bl_answ_upload,{
      #处理数据
      
      #处理日期
      FDate <- as.character(Sys.Date());
      data <- data_answ()
      names(data) <-c('FIs','FLike'); 
      
      FIs <- data$FIs; 
      FLike <- data$FLike;
      data1 <- data.frame(FKeyWord = FIs,
                          FDate,
                          FType='is',
                          FBrand=   var_brand_answ(),stringsAsFactors = F);
      data2 <- data.frame(FKeyWord = FLike,
                          FDate,
                          FType='like',
                          FBrand=   var_brand_answ(),stringsAsFactors = F);
      res <-rbind(data1,data2);
      #View(res);
      str(res);
      res <- res[!is.na(res$FKeyWord), ]
      ncount <- nrow(res);
      #暂时不处理ID-------
      sql_answ <- "select FKeyWord,FDate,FType,FBrand from filter_answer";
      data_new <-sql_select(conn_nsim,sql_answ);
      if (nrow(data_new) == 0){
        res$FId <- 1:ncount;
        res <- res[,c('FId','FKeyWord','FDate','FType','FBrand')]
        tsda::db_writeTable(conn=conn_nsim,table_name = 'filter_answer',r_object = res,append = T)
        tsui::pop_notice(paste("上传了",ncount,"条记录!",sep=""))
      } else{
        data_diff <-tsdo::df_setdiff(res,data_new);
        
        if (nrow(data_diff) >0 ){
          sql_max_id <- "select max(FId) as FId  from filter_answer"
          max_id <- sql_select(conn_nsim,sql_max_id);
          max_id <- max_id$FId[1];
          data_diff$FId <-1:nrow(data_diff)+max_id;
          data_diff <- data_diff[,c('FId','FKeyWord','FDate','FType','FBrand')];
          tsda::db_writeTable(conn=conn_nsim,table_name = 'filter_answer',r_object = data_diff,append = T)
          tsui::pop_notice(paste("上传了",nrow(data_diff),"条记录!",sep=""))
        }else{
          tsui::pop_notice(paste("上传了0条记录!",sep=""))
        }
        
        
        
      }
      
      
      
      
    })
    
   
    
    #4.关键词删除黑名单上传--------
    
    kw_filter <- var_file('bl_kw_sel');
    
    data_kw <- reactive({
      res <- readExcelDf(kw_filter())
      return(res);
    })
    
    observeEvent(input$bl_kw_preview,{
      run_dataTable2('bl_kw_data_show',data = data_kw())
    })
    
    #处理上传服务器逻辑；
    
    
    var_brand_kw <- var_ListChoose1('kw_brand')
    observeEvent(input$bl_kw_upload,{
      #处理数据
      
      #处理日期
      FDate <- as.character(Sys.Date());
      data <- data_kw()
      names(data) <-c('FIs'); 
      
      FIs <- data$FIs; 
      
      res <- data.frame(FKeyWord = FIs,
                          FDate,
                          FType='is',
                          FBrand=   var_brand_kw(),stringsAsFactors = F);
      nsim_save(res,'filter_kw','FId')
        ncount <- nrow(res);
         tsui::pop_notice(paste("上传了",ncount,"条记录!",sep=""))
 
 
      
      
      
    })
    
  
})
