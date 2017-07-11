# WineAnaly
This project analyses the various factors which can be used to classify wines into three classes.
It studies the different properties across the 3 different classes, tries to find relations amongst them 
and predicts the class from the property variants.

## Structure of dataset

Initially we start by looking at the data present in the Dataset.

```
'data.frame':	178 obs. of  15 variables:
 $ Al       : num  11.6 12.6 14.1 14.1 13.8 ...
 $ Mal      : num  2.05 1.29 4.1 1.63 1.53 3.87 1.81 1.34 1.13 1.6 ...
 $ Ash      : num  3.23 2.1 2.74 2.28 2.7 2.4 2.41 1.9 2.16 2.52 ...
 $ Alc      : num  28.5 20 24.5 16 19.5 23 20.5 18.5 19 17.8 ...
 $ Mg       : int  119 103 96 126 132 101 100 88 87 95 ...
 $ TotP     : num  3.18 1.48 2.05 3 2.95 2.83 2.7 1.45 3.5 2.48 ...
 $ Flav     : num  5.08 0.58 0.76 3.17 2.74 2.55 2.98 1.36 3.1 2.37 ...
 $ NFlav    : num  0.47 0.53 0.56 0.24 0.5 0.43 0.26 0.29 0.19 0.26 ...
 $ Pro      : num  1.87 1.4 1.35 2.1 1.35 1.95 1.86 1.35 1.87 1.46 ...
 $ Color    : num  6 7.6 9.2 5.65 5.4 2.57 5.1 2.45 4.45 3.93 ...
 $ Hue      : num  0.93 0.58 0.61 1.09 1.25 1.19 1.04 1.04 1.22 1.09 ...
 $ OD       : num  3.69 1.55 1.6 3.71 3 3.13 3.47 2.77 2.87 3.63 ...
 $ Prl      : int  465 640 560 780 1235 463 920 562 420 1015 ...
 $ Class    : chr  "two" "three" "three" "one" ...
 
 ```
 There are 178 observations and 15 features. Input variables which includes 15 chemical and physical features of wine.

Below is brief description of each feature: Input variables (based on physicochemical tests):

Chemical Prperties:

* Alcohol: The percent alcohol content of the wine (% by volume)
* Malic Acid : It is one of the principal organic acids found in wine grapes (g/l)
* Ash : Ash content is one of the important indicators in wine quality determination (mS/cm)
* Alcalinity : Several different types of acids found in wine affect how acidic a wine tastes. (pH)
* Magnesium : Magnesium content in wines (gm per 1kg)
* Total phenols : These are flavonoids that contribute to the construction of various tannins and contribute to the perception of bitterness in wine. (mg/L)
* Flavanoid : 






Output variable :

class ( classified into one, two and three )
 

```
       Al             Mal             Ash             Alc              Mg        
 Min.   :11.03   Min.   :0.740   Min.   :1.360   Min.   :10.60   Min.   : 70.00  
 1st Qu.:12.36   1st Qu.:1.603   1st Qu.:2.210   1st Qu.:17.20   1st Qu.: 88.00  
 Median :13.05   Median :1.865   Median :2.360   Median :19.50   Median : 98.00  
 Mean   :13.00   Mean   :2.336   Mean   :2.367   Mean   :19.49   Mean   : 99.74  
 3rd Qu.:13.68   3rd Qu.:3.083   3rd Qu.:2.558   3rd Qu.:21.50   3rd Qu.:107.00  
 Max.   :14.83   Max.   :5.800   Max.   :3.230   Max.   :30.00   Max.   :162.00  
      TotP            Flav           NFlav             Pro            Color       
 Min.   :0.980   Min.   :0.340   Min.   :0.1300   Min.   :0.410   Min.   : 1.280  
 1st Qu.:1.742   1st Qu.:1.205   1st Qu.:0.2700   1st Qu.:1.250   1st Qu.: 3.220  
 Median :2.355   Median :2.135   Median :0.3400   Median :1.555   Median : 4.690  
 Mean   :2.295   Mean   :2.029   Mean   :0.3619   Mean   :1.591   Mean   : 5.058  
 3rd Qu.:2.800   3rd Qu.:2.875   3rd Qu.:0.4375   3rd Qu.:1.950   3rd Qu.: 6.200  
 Max.   :3.880   Max.   :5.080   Max.   :0.6600   Max.   :3.580   Max.   :13.000  
      Hue               OD             Prl            Class           class_num
 Min.   :0.4800   Min.   :1.270   Min.   : 278.0   Length:178         1:59     
 1st Qu.:0.7825   1st Qu.:1.938   1st Qu.: 500.5   Class :character   2:71     
 Median :0.9650   Median :2.780   Median : 673.5   Mode  :character   3:48     
 Mean   :0.9574   Mean   :2.612   Mean   : 746.9                               
 3rd Qu.:1.1200   3rd Qu.:3.170   3rd Qu.: 985.0                               
 Max.   :1.7100   Max.   :4.000   Max.   :1680.0

```


Above figure shows the distribution of data over different variables. As we can see, the normal range for fixed acidity is 12.36 to 13.68 percent. As for malic acid, 75% of wines in our dataset have below 3.083 mg of malic acid in their content. Also, the Average alcohol percentage in our dataset is about 13.


### Plottings

