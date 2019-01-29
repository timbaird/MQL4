//+------------------------------------------------------------------+
//|                                           Money_Risk_Manager.mq4 |
//|                                         Copyright 2019,Tim Baird |
//|                                         https://www.timbaird.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2019,Tim Baird"
#property link      "https://www.timbaird.com"
#property version   "1.00"
#property strict
//--- input parameters
input double      pInitalSL_ATRMultipler = 1.5;
input double      pMinimumInitialSL_pips = 5;
input double      pScaleOutTP_ATRMultiplier = 1.5;
input double      pMinimumScaleOutTP_pips = 3;
input double      pStartTrailing_ATRMultipler = 3;
input double      pTrailByAmount_ATRMultipler = 2;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- create timer
   EventSetTimer(60);
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//--- destroy timer
   EventKillTimer();
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
void OnTimer()
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Tester function                                                  |
//+------------------------------------------------------------------+
double OnTester()
  {
//---
   double ret=0.0;
//---

//---
   return(ret);
  }
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
  {
//---
   
  }
//+------------------------------------------------------------------+
