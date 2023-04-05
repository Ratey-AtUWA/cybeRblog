# $ DateTime               : POSIXct, format: "2022-12-01" "2022-12-02" "2022-12-03" ...
# $ Conservative           : num  0 0.0635 0.0635 0.0635 0.0556 ...
# $ Conservative.Balanced  : num  0 -0.0877 -0.0877 -0.0877 -0.1462 ...
# $ Balanced               : num  0 -0.233 -0.233 -0.233 -0.233 ...
# $ Sustainable.Balanced   : num  0 -0.0513 -0.0513 -0.0513 -0.4227 ...
# $ Sustainable.High.Growth: num  0 -0.153 -0.153 -0.153 -0.668 ...
super <- read.table("clipboard", sep="\t",header = T)
super$DateTime <- as.POSIXct(super$DateTime, format="%d/%m/%Y")
with(super, plot(DateTime, Conservative, type="l", 
                 xlab = "Date", ylab="Performance",
                 ylim = c(-6,2.2), xaxt="n"))
axis(1, at=pretty(super$DateTime), labels=pretty(super$DateTime))
abline(h=0, col="grey")
abline(v = pretty(super$DateTime), col="grey", lty=3)
lines(super$DateTime, super[,3], col="darkgreen", lty=2)
lines(super$DateTime, super[,4], col="navy", lty=3)
lines(super$DateTime, super[,5], col="red3", lwd=2)
lines(super$DateTime, super[,6], col="grey25", lty=4)
legend("bottomright", bty="n", legend=colnames(super)[2:6],
       col=c("black","darkgreen","navy","red3","grey25"),
       lwd = c(1,1,1,2,1), lty = c(1,2,3,1,4))
