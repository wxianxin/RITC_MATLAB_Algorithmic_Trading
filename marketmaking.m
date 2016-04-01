%Author: Steven	Date: 20150214
function [ b,s ] = marketmaking( rit )

    id = getOrders(rit);
    if size(id,2)>2
        rit.cancelOrder(id);
        rit.clearQueuedOrders;
    end

    if rit.tigr_position > 0
        sell(rit,'tigr',500);
    elseif rit.tigr_position == 0
        1;
    else
        buy(rit,'tigr',500);
    end
    
    if rit.eyor_position > 0
        sell(rit,'eyor',500);
    elseif rit.eyor_position == 0
        1;   
    else
        buy(rit,'eyor',500);
    end
    
    if rit.huny_position > 0
        sell(rit,'huny',500);
    elseif rit.huny_position == 0
        1;
    else
        buy(rit,'huny',500);
    end
    
    if rit.pooh_position > 5000
        s = limitOrder(rit, 'pooh', -600, rit.pooh_ask - 0.01); 
        b = limitOrder(rit, 'pooh', 400, rit.pooh_bid + 0.01);
        s = limitOrder(rit, 'pooh', -1000, rit.pooh_ask - 0.02); 
        b = limitOrder(rit, 'pooh', 600, rit.pooh_bid + 0.02);
        
    elseif rit.pooh_position > 0 && rit.pooh_position < 5000
        s = limitOrder(rit, 'pooh', -600, rit.pooh_ask - 0.01);         
        b = limitOrder(rit, 'pooh', 600, rit.pooh_bid + 0.01);
        s = limitOrder(rit, 'pooh', -1000, rit.pooh_ask - 0.02); 
        b = limitOrder(rit, 'pooh', 1000, rit.pooh_bid + 0.02);

    elseif rit.pooh_position > -5000 && rit.pooh_position < 0
        b = limitOrder(rit, 'pooh', 500, rit.pooh_bid + 0.01);
        s = limitOrder(rit, 'pooh', -500, rit.pooh_ask - 0.01); 
        b = limitOrder(rit, 'pooh', 1000, rit.pooh_bid + 0.02);
        s = limitOrder(rit, 'pooh', -1000, rit.pooh_ask - 0.02); 
 
    else
        b = limitOrder(rit, 'pooh', 600, rit.pooh_bid + 0.01);
        s = limitOrder(rit, 'pooh', -400, rit.pooh_ask - 0.01); 
        b = limitOrder(rit, 'pooh', 1000, rit.pooh_bid + 0.02);
        s = limitOrder(rit, 'pooh', -600, rit.pooh_ask - 0.02); 
        
    end
     
end

