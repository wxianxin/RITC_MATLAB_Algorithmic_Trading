This program is what I wrote for MATLAB Algorithmic Case in Rotman International Trading Competition 2016.

Due to the limited time, the code is a little scrappy.

Basically, this is a simple HFT strategy.

Main features are:

Take advantage of the order queuing and order book system of trading server by smart order management;
Succeed in performing algorithm of market scenario recognition;
Reduce risk position exposure by auto position balancing strategy;
Accomplish fast open-position clearing algorithm.


This strategy is consistent on RIT simulation servers(Please refer to the png files for simulation performance).

FYI: 
RIT simulation servers executes a collection of orders(one queue) every 0.2s. During the time interval between two executions, all submitted orders are placed in a queue.
