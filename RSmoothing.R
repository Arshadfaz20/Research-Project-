##------Smoothing--------
  
install.packages('TTR')
library(TTR)
library(plotly)

#Plot original data
data=read.csv('laptop2.csv')
plot(x = data$timestamp,y = data$Power,
     timestamp = "x-axis",
     Power = "y-axis",
     main = " Original dataset - Before Smoothing",
     type = "line",
     lwd=2
)

#SMA 20
data=read.csv('laptop2.csv')
plot(x = data$timestamp,y = data$Power,
     timestamp = "x-axis",
     Power = "y-axis",
     main = " After smoothing SMA (n = 20)",
     type = "line",
     lwd=2,
     col="grey"
)

data_sma <- data
sma20 = TTR::SMA(data_sma$Power, n=20)

lines(x = data_sma$timestamp,y = sma20,
      timestamp = "x-axis",
      Power = "y-axis",
      main = "After Smoothing (n=20)",
      type = "line",
      lwd=2,
      col="pink"
)


#SMA 50
data=read.csv('laptop2.csv')
plot(x = data$timestamp,y = data$Power,
     timestamp = "x-axis",
     Power = "y-axis",
     main = " After smoothing SMA (n = 50)",
     type = "line",
     lwd=2,
     col="grey"
)

data_sma <- data
sma50 = TTR::SMA(data_sma$Power, n=50)

lines(x = data_sma$timestamp,y = sma50,
      timestamp = "x-axis",
      Power = "y-axis",
      main = "After Smoothing (n=20)",
      type = "line",
      lwd=2,
      col="cyan"
)

#SMA 100
data=read.csv('laptop2.csv')
plot(x = data$timestamp,y = data$Power,
     timestamp = "x-axis",
     Power = "y-axis",
     main = "Best smoothing methods from all 3 methods",
     type = "line",
     lwd=2,
     col="grey"
)

data_sma <- data
sma150 = TTR::SMA(data_sma$Power, n=150)

lines(x = data_sma$timestamp,y = sma100,
      timestamp = "x-axis",
      Power = "y-axis",
      main = "After Smoothing (n=80)",
      type = "line",
      lwd=2,
      col="cyan"
)


##combined
plot(x = data$timestamp,y = data$Power,
     timestamp = "x-axis",
     Power = "y-axis",
     main = "Combined SMA n=20, 50, 150",
     type = "line",
     lwd=2,
     col="grey"
)
legend("topright", legend=c("Original", "SMA20", "SMA50", "SMA150"),
       col=c("grey","cyan","red", "blue"),lty=1)
lines(x = data_sma$timestamp,y = sma20,
      timestamp = "x-axis",
      Power = "y-axis",
      main = "After Smoothing (n=20)",
      type = "line",
      lwd=2,
      col="cyan"
)
lines(x = data_sma$timestamp,y = sma50,
      timestamp = "x-axis",
      Power = "y-axis",
      main = "After Smoothing (n=50)",
      type = "line",
      lwd=2,
      col="red"
)
lines(x = data_sma$timestamp,y = sma150,
      timestamp = "x-axis",
      Power = "y-axis",
      main = "After Smoothing (n=200)",
      type = "line",
      lwd=2,
      col="blue"
)

#GS
plot(x = data$timestamp,y = data$Power,
     timestamp = "x-axis",
     Power = "y-axis",
     main = "Combined GS n=20, 50, 150",
     type = "line",
     lwd=2,
     col="grey"
)
legend("topright", legend=c("Original", "SMA20", "GS50", "LOESS0.002"),
       col=c("grey","pink","yellow", "purple"),lty=1,lwd=4 )
Power = smth.gaussian(data_sma$Power, beta = 1, window = 20)
lines(x = data_sma$timestamp,y = Power,
      timestamp = "x-axis",
      Power = "y-axis",
      main = "After Smoothing (n=20)",
      type = "line",
      lwd=2,
      col="cyan"
)
Power2 = smth.gaussian(data_sma$Power, beta = 1, window = 50)
lines(x = data_sma$timestamp,y = Power2,
      timestamp = "x-axis",
      Power = "y-axis",
      main = "After Smoothing (n=50)",
      type = "line",
      lwd=2,
      col="yellow"
)
Power3 = smth.gaussian(data_sma$Power, beta = 1, window = 150)
lines(x = data_sma$timestamp,y = Power3,
      timestamp = "x-axis",
      Power = "y-axis",
      main = "After Smoothing (n=200)",
      type = "line",
      lwd=2,
      col="blue"
)


Power = smth.gaussian(data_sma$Power, beta = 1, window = 50)
plot(x = data_sma$timestamp,y = Power,
     timestamp = "x-axis",
     Power = "y-axis",
     main = "After Smoothing (ses1)",
     type = "line",
     col = "green"
)

#LOESS
plot(x = data$timestamp,y = data$Power,
     timestamp = "x-axis",
     Power = "y-axis",
     main = "Combined LOESS f = 0.002, 0.02, 0.2",
     type = "line",
     lwd=2,
     col="grey"
)
legend("topright", legend=c("Original", "LOESS(0.002)", "LOESS(0.02)", "LOESS(0.2)"),
       col=c("grey","cyan","red", "blue"),lty=1)
lines(lowess(x = data$timestamp,y = data$Power, f=0.002), col='purple', lwd=2)
lines(lowess(x = data$timestamp,y = data$Power, f=0.02), col='red', lwd=2)
lines(lowess(x = data$timestamp,y = data$Power, f=0.2), col='blue', lwd=2)


##------Power Consumption graphs--------
data=read.csv('lamp2.csv')
plot(x = data$timestamp,y = data$Power,
     timestamp = "x-axis",
     Power = "y-axis",
     main = "Lamp",
     type = "line"
)

data=read.csv('kettle4.csv')
plot(x = data$timestamp,y = data$Power,
     timestamp = "x-axis",
     Power = "y-axis",
     main = "Kettle",
     type = "line"
)

data=read.csv('MonitorG.csv')
plot(x = data$timestamp,y = data$Power,
     timestamp = "x-axis",
     Power = "y-axis",
     main = "Monitor",
     type = "line"
)

data=read.csv('monitorkettle1.csv')
plot(x = data$timestamp,y = data$Power,
     timestamp = "x-axis",
     Power = "y-axis",
     main = "Monitor & Kettle",
     type = "line"
)
data=read.csv('lampmonitor1.csv')
plot(x = data$timestamp,y = data$Power,
     timestamp = "x-axis",
     Power = "y-axis",
     main = "Monitor & Lamp",
     type = "line"
)
data=read.csv('lampkettle1.csv')
plot(x = data$timestamp,y = data$Power,
     timestamp = "x-axis",
     Power = "y-axis",
     main = "Kettle & Lamp",
     type = "line"
)

