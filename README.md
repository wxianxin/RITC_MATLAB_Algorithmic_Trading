This program is what I wrote for algorithmic case in Rotman International Trading Competition 2016.

Due the limited time, the code is a little rough.

Basically, this a simple HFT strategy.

Basic features are:


Took advantage of the order queuing and order book system of trading server by smart order management
Succeeded in performing algorithm of market scenario recognition
Reduced risk position exposure by auto position balancing strategy
Accomplished fast open-position clearing algorithm

This strategy is consistent on RIT simulation servers.

FYI: 
RIT simulation servers executes a collection of orders(one queue) every 0.2s. During the time between each execution, all submitted orders are placed in a queue.
