# WineAnaly
This project analyses the various factors which can be used to classify wines into three classes.
It studies the different properties across the 3 different classes, tries to find relations amongst them 
and predicts the class from the property variants.

## Structure of dataset

Initially we start just looking at data to understand their features better.

'''
##       Al             Mal             Ash             Alc              Mg        
## Min.   :11.03   Min.   :0.740   Min.   :1.360   Min.   :10.60   Min.   : 70.00  
## 1st Qu.:12.36   1st Qu.:1.603   1st Qu.:2.210   1st Qu.:17.20   1st Qu.: 88.00  
## Median :13.05   Median :1.865   Median :2.360   Median :19.50   Median : 98.00  
## Mean   :13.00   Mean   :2.336   Mean   :2.367   Mean   :19.49   Mean   : 99.74  
## 3rd Qu.:13.68   3rd Qu.:3.083   3rd Qu.:2.558   3rd Qu.:21.50   3rd Qu.:107.00  
## Max.   :14.83   Max.   :5.800   Max.   :3.230   Max.   :30.00   Max.   :162.00  
##      TotP            Flav           NFlav             Pro            Color       
## Min.   :0.980   Min.   :0.340   Min.   :0.1300   Min.   :0.410   Min.   : 1.280  
## 1st Qu.:1.742   1st Qu.:1.205   1st Qu.:0.2700   1st Qu.:1.250   1st Qu.: 3.220  
## Median :2.355   Median :2.135   Median :0.3400   Median :1.555   Median : 4.690  
## Mean   :2.295   Mean   :2.029   Mean   :0.3619   Mean   :1.591   Mean   : 5.058  
## 3rd Qu.:2.800   3rd Qu.:2.875   3rd Qu.:0.4375   3rd Qu.:1.950   3rd Qu.: 6.200  
## Max.   :3.880   Max.   :5.080   Max.   :0.6600   Max.   :3.580   Max.   :13.000  
##      Hue               OD             Prl            Class           class_num
## Min.   :0.4800   Min.   :1.270   Min.   : 278.0   Length:178         1:59     
## 1st Qu.:0.7825   1st Qu.:1.938   1st Qu.: 500.5   Class :character   2:71     
## Median :0.9650   Median :2.780   Median : 673.5   Mode  :character   3:48     
## Mean   :0.9574   Mean   :2.612   Mean   : 746.9                               
## 3rd Qu.:1.1200   3rd Qu.:3.170   3rd Qu.: 985.0                               
## Max.   :1.7100   Max.   :4.000   Max.   :1680.0
'''
