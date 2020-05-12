#Total number of cells

start.time = Sys.time()

TotalCells <- nrow(Design)
for (i in 1:TotalCells){
  Row <- i
  MyResult <- MySimulationCell(Design = Design, RowOfDesign = Row, K=2000)
  # Write output of one cell of the design
  save(MyResult, file =file.path("#enter desired file location",paste0("MyResult", "Row", Row,".Rdata" , sep ="")))
  }

end.time = Sys.time()
time.take = end.time - start.time 
print(time.take) 
