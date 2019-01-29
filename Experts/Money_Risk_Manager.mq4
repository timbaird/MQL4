//+------------------------------------------------------------------+
//|                                           Money_Risk_Manager.mq4 |
//|                                         Copyright 2019,Tim Baird |
//|                                         https://www.timbaird.com |
//+------------------------------------------------------------------+

// Buy & Sell Buttons reference : https://www.mql5.com/en/forum/158187

// Text on Chart reference : https://www.mql5.com/en/forum/104519


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

// --- instance variables
int vATR;
double vIntialSLPrice;
double vScaleOutTPPrice;
double vStartTrailingAtPrice;
double vTrailingStopPriceAtStartTrailing;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
      
   double sl = 1.12345;
   double tp = 1.54321;
   
   Create_PositionLabels();
   Create_BuyButton();
   Create_SellButton();
   
   //Alert("Balls " + string(Multiply(4, 5)));
   
      //OrderSend("EURUSD", OP_BUY, 1.0, Ask, 10, sl, tp, "My Comment");
  
  
//--- create timer
   //EventSetTimer(60);
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//--- destroy timer
   //EventKillTimer();
   ObjectDelete(0, "PositionLabel");
   ObjectDelete(0, "Button_Buy");
   ObjectDelete(0, "Button_Sell");
   
   
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
    if(id==CHARTEVENT_OBJECT_CLICK)
     {
      if(sparam=="Button_Buy")
        {
            Alert("Buy Button Click");
            ObjectSetInteger(0,"Button_Buy",OBJPROP_STATE,false);
        }
      if(sparam=="Button_Sell")
        {
            Alert("Sell Button Click");
            ObjectSetInteger(0,"Button_Sell",OBJPROP_STATE,false);
            
        }
     }
  }
//+------------------------------------------------------------------+

bool Create_BuyButton(const long              chart_ID=0,               // chart's ID
                      const string            name="Button_Buy",        // button name
                      const int               x=0,                      // X coordinate
                      const int               y=20,// Y coordinate
                      const int               width=60,                 // button width
                      const int               height=20,                // button height
                      const ENUM_BASE_CORNER  corner=CORNER_LEFT_UPPER, // chart corner for anchoring
                      const string            text="Buy",               // text
                      const string            font="Courier New",       // font
                      const int               font_size=10,             // font size
                      const color             clr=clrBlack,             // text color
                      const color             back_clr=clrGray,         // background color
                      const bool              back=false                // in the background
                      )
  {
//--- reset the error value
   ResetLastError();
//--- create the button
   ObjectCreate(chart_ID,name,OBJ_BUTTON,0,0,0);
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
   ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,back_clr);
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- successful execution
   return(true);
  }
//+------------------------------------------------------------------+
//| Create the Sell button                                                |
//+------------------------------------------------------------------+
bool Create_SellButton(const long              chart_ID=0,               // chart's ID
                       const string            name="Button_Sell",       // button name
                       const int               sub_window=0,             // subwindow index
                       const int               x=65,// X coordinate
                       const int               y=20,                     // Y coordinate
                       const int               width=60,                 // button width
                       const int               height=20,                // button height
                       const ENUM_BASE_CORNER  corner=CORNER_LEFT_UPPER, // chart corner for anchoring
                       const string            text="Sell",              // text
                       const string            font="Courier New",       // font
                       const int               font_size=10,             // font size
                       const color             clr=clrBlack,             // text color
                       const color             back_clr=clrGray,         // background color
                       const bool              back=false                // in the background
                       )
  {
   ResetLastError();
//--- create the button
   ObjectCreate(chart_ID,name,OBJ_BUTTON,sub_window,0,0);
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
   ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,back_clr);
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- successful execution
   return(true);
  }
  
  
  bool Create_PositionLabels(
                              /*
                              const long              chart_ID=0,               // chart's ID
                              const string            name="Button_Sell",       // button name
                              const int               sub_window=0,             // subwindow index
                              const int               x=65,// X coordinate
                              const int               y=20,                     // Y coordinate
                              const int               width=60,                 // button width
                              const int               height=20,                // button height
                              const ENUM_BASE_CORNER  corner=CORNER_LEFT_UPPER, // chart corner for anchoring
                              const string            text="Sell",              // text
                              const string            font="Courier New",       // font
                              const int               font_size=10,             // font size
                              const color             clr=clrBlack,             // text color
                              const color             back_clr=clrGray,         // background color
                              const bool              back=false                // in the background
                              */
                       )
  {
   ResetLastError();
//--- create the label
   ObjectCreate("PositionLabel", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("PositionLabel","your Text XXX",20, "Verdana", Red);
   ObjectSet("PositionLabel", OBJPROP_CORNER, 0);
   ObjectSet("PositionLabel", OBJPROP_XDISTANCE, 20);
   ObjectSet("PositionLabel", OBJPROP_YDISTANCE, 20);
//--- successful execution
   return(true);
  }